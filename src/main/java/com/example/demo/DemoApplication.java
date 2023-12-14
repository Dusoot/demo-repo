package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Bean
	public RedisTemplate<Long, Object> redisTemplate(RedisConnectionFactory connectionFactory) {
		RedisTemplate<Long, Object> template = new RedisTemplate<>();
		template.setConnectionFactory(connectionFactory);
		template.afterPropertiesSet();
		template.watch(1l);
    		return template;
	}
}
