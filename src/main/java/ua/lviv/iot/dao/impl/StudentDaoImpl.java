package ua.lviv.iot.dao.impl;

import ua.lviv.iot.model.Reporter;

public class StudentDaoImpl extends AbstractDaoImpl<Reporter, String> {
    public StudentDaoImpl() {
        super(Reporter.class);
    }
}
