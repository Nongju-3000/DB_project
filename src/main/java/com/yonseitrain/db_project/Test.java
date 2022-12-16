package com.yonseitrain.db_project;

import java.sql.*;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;

		String insert_hq_query = "create table Headquarter ("
				+ "hq_id int not null auto_increment,"
				+ "hq_name varchar(20) not null,"
				+ "hq_address varchar(50) not null,"
				+ "hq_planet varchar(20) not null,"
				+ "hq_continent varchar(20) not null,"
				+ "primary key(hq_id)"
				+ ");";

		String insert_train_query = "create table Train ("
				+ "train_id int not null auto_increment,"
				+ "train_name varchar(20) not null,"
				+ "train_type varchar(20) not null,"
				+ "train_condition int not null,"
				+ "primary key(train_id)"
				+ ");";

		String insert_station_query = "create table Station ("
				+ "station_id int not null auto_increment,"
				+ "station_name varchar(20) not null,"
				+ "station_address varchar(50) not null,"
				+ "station_tel varchar(20),"
				+ "station_managername varchar(20) not null,"
				+ "station_budget int not null,"
				+ "station_hq_id int not null,"
				+ "station_line_id int not null,"
				+ "primary key(station_id),"
				+ "foreign key(station_hq_id) references headquarter(hq_id),"
				+ "foreign key(station_line_id) references line(line_id)"
				+ ");";

		String insert_line_query = "create table Line ("
				+ "line_id int not null auto_increment,"
				+ "line_name varchar(20) not null,"
				+ "line_builtyear year not null,"
				+ "line_length int not null,"
				+ "line_hq_id int not null,"
				+ "primary key(line_id),"
				+ "foreign key(line_hq_id) references headquarter(hq_id)"
				+ ");";

		String insert_enginner_query = "create table Engineer ("
				+ "enginner_id varchar(20) not null,"
				+ "enginner_password varchar(40) not null,"
				+ "enginner_name varchar(20) not null,"
				+ "enginner_datetime datetime not null,"
				+ "enginner_salary int not null,"
				+ "enginner_hq_id int not null,"
				+ "enginner_amount int not null,"
				+ "primary key(enginner_id),"
				+ "foreign key(enginner_hq_id) references headquarter(hq_id)"
				+ ");";

		String insert_traincode_query = "create table TrainCode ("
				+ "traincode_id int not null auto_increment,"
				+ "traincode_day date not null,"
				+ "traincode_startstation_id int not null,"
				+ "traincode_endstation_id int,"
				+ "traincode_starttime datetime not null,"
				+ "traincode_endtime datetime,"
				+ "traincode_enginner_id varchar(20) not null,"
				+ "traincode_train_id int not null,"
				+ "primary key(traincode_id),"
				+ "foreign key(traincode_startstation_id) references station(station_id),"
				+ "foreign key(traincode_endstation_id) references station(station_id),"
				+ "foreign key(traincode_enginner_id) references engineer(enginner_id),"
				+ "foreign key(traincode_train_id) references train(train_id)"
				+ ");";

		String insert_vehicle_query = "create table Vehicle ("
				+ "vehicle_id int not null auto_increment,"
				+ "vehicle_type varchar(20) not null,"
				+ "vehicle_model varchar(20) not null,"
				+ "vehicle_year year not null,"
				+ "vehicle_status varchar(20) not null,"
				+ "vehicle_train_id int not null,"
				+ "primary key(vehicle_id),"
				+ "foreign key(vehicle_train_id) references train(train_id)"
				+ ");";
		
		String insert_admin_query = "create table Admin ("
				+ "admin_id varchar(20) not null,"
				+ "admin_password varchar(40) not null,"
				+ "admin_name varchar(20) not null,"
				+ ");";

		try{
			String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
			String dbUser = "root";
			String dbPass = "root";
			String query = "SHOW tables";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();

			stmt.executeUpdate(insert_hq_query);
			stmt.executeUpdate(insert_train_query);
			stmt.executeUpdate(insert_line_query);
			stmt.executeUpdate(insert_station_query);
			stmt.executeUpdate(insert_enginner_query);
			stmt.executeUpdate(insert_admin_query);
			stmt.executeUpdate(insert_traincode_query);
			stmt.executeUpdate(insert_vehicle_query);



			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
	}

}
