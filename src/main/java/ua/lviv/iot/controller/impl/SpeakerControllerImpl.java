package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Injury;
import ua.lviv.iot.service.impl.InjuryServiceImpl;

public class SpeakerControllerImpl extends AbstractControllerImpl<Injury, Integer> {
    public SpeakerControllerImpl() {
        super(new InjuryServiceImpl());
    }
}
