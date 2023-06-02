---
title: oauth2认证服务配置
categories:
  - java
tags:
  - spring
  - oauth2
abbrlink: 37106
date: 2020-11-05 14:22:12
---

### 1、安全配置

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Resource
    private UserDetailsService userDetailsService;

    @Override
    @Bean
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .formLogin().permitAll()
                .and()
                .csrf().disable();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
```

### 2、认证服务器配置

```java
@Configuration
//指明这是一个认证服务器
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {
    @Resource
    private AuthenticationManager authenticationManager;
    @Resource
    private DataSource dataSource;

    /**
     * 第三方客户端配置
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.withClientDetails(detailsService());
    }

	/**
     * 端点权限配置
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) {
		security.checkTokenAccess("permitAll()")
                .tokenKeyAccess("permitAll()")
                //允许使用form表单提交
                .allowFormAuthenticationForClients();
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
				//授权码模式获取token必须要配置authenticationManager
		endpoints.authenticationManager(authenticationManager)
                //token储存位置
                .tokenStore(new JdbcTokenStore(dataSource))
                //使用刷新token
                .reuseRefreshTokens(true)
                //授权码模式 code存放在内存中
                .authorizationCodeServices(new JdbcAuthorizationCodeServices(dataSource));
    }

    @Bean
    public ClientDetailsService detailsService(){
        return new JdbcClientDetailsService(dataSource);
    }
}
```

