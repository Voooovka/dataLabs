package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.SubjectDaoImpl;
import ua.lviv.iot.model.Subject;

public class RescuerServiceImpl extends AbstractServiceImpl<Subject, Integer> {
    public RescuerServiceImpl() {
        super(new SubjectDaoImpl());
    }
}
