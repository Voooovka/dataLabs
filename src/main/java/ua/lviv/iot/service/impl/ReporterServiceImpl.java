package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.StudentDaoImpl;
import ua.lviv.iot.model.Reporter;

public class ReporterServiceImpl extends AbstractServiceImpl<Reporter, String> {
    public ReporterServiceImpl() {
        super(new StudentDaoImpl());
    }
}
