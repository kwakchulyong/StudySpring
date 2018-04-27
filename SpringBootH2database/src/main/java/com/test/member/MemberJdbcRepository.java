package com.test.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberJdbcRepository {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	class StudentRowMapper implements RowMapper<Member> {
		@Override
		public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
			Member member = new Member();
			member.setId(rs.getLong("id"));
			member.setName(rs.getString("name"));
			member.setPassword(rs.getString("password"));
			return member;
		}

	}

	public List<Member> findAll() {
		return jdbcTemplate.query("select * from member", new StudentRowMapper());
	}

	public String findByName(String name) {
		logger.info("MemberJdbcRepository.findByName :: start");
		logger.info("input = {name: " + name + "}");
		
		int cnt = jdbcTemplate.queryForObject("select count(*) from member where name=?", new Object[] { name },Integer.class);
		
		logger.info("output = {cnt: " + cnt + "}");
		
		String result = "";
		if(cnt == 0) {
			result = "true";
		} else {
			result = "false";
		}
		
		logger.info("MemberJdbcRepository.findByName :: end");
		
		return result;
	}

	public int insert(Member member) {
		
		logger.info("MemberJdbcRepository.insert :: start");
		logger.info( member.getName());
		logger.info( member.getPassword());
		
		return jdbcTemplate.update("insert into member (name, password) " + "values(?, ?)",
				new Object[] { member.getName(), member.getPassword() });
	}

}
