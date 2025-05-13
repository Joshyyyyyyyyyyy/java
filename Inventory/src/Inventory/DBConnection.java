/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Inventory;

import java.sql.Connection;
import java.sql.DriverManager;

class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
