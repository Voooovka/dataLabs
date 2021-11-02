package ua.lviv.iot.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import ua.lviv.iot.model.*;

import java.util.*;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();

                // Hibernate settings equivalent to hibernate.cfg.xml properties
                Properties settings = new Properties();
                settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
                settings.put(Environment.URL, "jdbc:mysql://localhost:3306/hrabovenskyi?allowPublicKeyRetrieval=true&" +
                        "createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC");
                settings.put(Environment.USER, "root");
                settings.put(Environment.PASS, "Djkjlz2003");
                settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
                settings.put(Environment.SHOW_SQL, "true");
                settings.put(Environment.FORMAT_SQL, "true");
                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread"); // NECESSARY
                settings.put(Environment.HBM2DDL_AUTO, "update");
                configuration.setProperties(settings);

                // Entities
                configuration.addAnnotatedClass(ClusterProgram.class);
                configuration.addAnnotatedClass(Lecturer.class);
                configuration.addAnnotatedClass(Hospital.class);
                configuration.addAnnotatedClass(Injury.class);
                configuration.addAnnotatedClass(Reporter.class);
                configuration.addAnnotatedClass(Subject.class);
                configuration.addAnnotatedClass(RescueVehicle.class);
                configuration.addAnnotatedClass(CallHasRescuer.class);
                configuration.addAnnotatedClass(CallHasRescueVehicle.class);

                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySettings(configuration.getProperties()).build();

                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}