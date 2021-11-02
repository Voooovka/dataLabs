package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Lecturer;
import ua.lviv.iot.service.impl.CallAddressServiceImpl;

public class LecturerControllerImpl extends AbstractControllerImpl<Lecturer, Integer> {
    public LecturerControllerImpl() {
        super(new CallAddressServiceImpl());
    }
}
