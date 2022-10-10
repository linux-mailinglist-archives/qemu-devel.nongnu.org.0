Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAAB5FA033
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:29:23 +0200 (CEST)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtmU-0000xO-G7
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohthd-0002Gv-MJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:24:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohthb-0004oC-BJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:24:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id b2so10506232plc.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=35KXoergDZSm9k5YDNkVFyn00KlEBRtkfFZuizY8sBI=;
 b=ZREpsGWW3y6b+6Ft73u2HpOVsxWY5CGp06anHnl/1RazCPt/izkboQYxoBW5qLFuc5
 fqRf70MQ7okp59CM6FS3oZqRLXfWOv2bPQJNMeu/EQBBj5xUJ+bEbX80sDw+5Bdho6+B
 JKauhM2XyKcorqeKmQs01xRl/YsQ8S9JL2Ai59YeP5X9wsRak+J9sFBJQvZNJjo00iFR
 sn0sA4NeWNC+AQSSTDyzG6XvVNrKiLdmPSDhexJSUhumHhq8myEvOnZjVVQMGgUI/yWV
 F6LcX5wD9nPeHft6BXiF9ODT5GTim8sqZXslEE6yPG60y6TAE4OV7WX5b/YgEZHr8b2h
 vgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35KXoergDZSm9k5YDNkVFyn00KlEBRtkfFZuizY8sBI=;
 b=ii3NI0XUEga/Zk5fylxqd5KvXJXfKKFV5RATUxrJnM4xwzWrBYOFBiKzSn/6tyH8s0
 VqOI3Lipw2COUpG6PQhlYFCdxbSDLgEBa98Gud36KBhipxiWsjmk9VVkqxsxcE6En16B
 td87Ttq2fw7EGZ8QPUdn012UfFOp0NQGG7I2DqLFDmH1gfOZwln4EMkuy2ea8klw9kot
 f3o7XoDM0ANtORo5ay2oJ+gI0caQZ0fRZz0+QKQI9tTvGTg2Rx+3A5S4rZ+53ue4C/cg
 +gWl+6/iPq/RQqq6R8FrHrSwQp2BlgGX8BETfWJ8be+bTWXnFEuNZaG6RyugDMJYzVvU
 5yXw==
X-Gm-Message-State: ACrzQf2o9VGC3eNi/nQV32umv4yXufDArLq68Xn3rzfnJunB+6sxjhUT
 e6P7/fjCqjFS9r/gFw8DP/uQNNJ8IJ2rccsVTVTalA==
X-Google-Smtp-Source: AMsMyM4TklvaV7Y/YhrpPtApTWthTh5zOwTLv6fcmj7xgg84n/5wlxNEqGudbuKLW+NacF7mTDOHzXJDin00YhpJxUU=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr19188247plb.60.1665411857830; Mon, 10
 Oct 2022 07:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
 <20220920184619.3370115-2-zhangjian.3032@bytedance.com>
In-Reply-To: <20220920184619.3370115-2-zhangjian.3032@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 15:24:05 +0100
Message-ID: <CAFEAcA8Dm8SaCp+0ubRzB3ck+e_89ir2nf1_3idMQ71zevbK3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/misc/latching_switch: Add a simple
 latching_switch device
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: f4bug@amsat.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, yulei.sh@bytedance.com, 
 tangyiwei.2022@bytedance.com, chentingting.2150@bytedance.com, 
 yuhao.17@bytedance.com, wangxiaohua.1217@bytedance.com, 
 xiening.xll@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Sept 2022 at 19:46, Jian Zhang <zhangjian.3032@bytedance.com> wrote:
>
> Implement a simple latching switch device.
>
> The latching switch is a switch that can be turned on and off.
> When the input new state and match the trigger edge, the switch
> state will be toggled.
>
> This device privide 2 properties `state(bool)` and `trigger-edge(string)`,
> and 2 gpios `input` and `output`.
>
> The `state` property is the initial state of the switch, and the `trigger-edge`
> property is the edge that will trigger the switch state to be toggled,
> the value can be `rising`, `falling` or `both`.

> +static void toggle_output(LatchingSwitchState *s)
> +{
> +    s->state = !(s->state);
> +    qemu_set_irq(s->output, !!(s->state));

s->state is a bool so this !! is unnecessary.

> +}
> +
> +static void input_handler(void *opaque, int line, int new_state)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(opaque);
> +
> +    assert(line == 0);
> +
> +    if (s->trigger_edge == TRIGGER_EDGE_FALLING && new_state == 0) {
> +        toggle_output(s);

This won't have the correct behaviour, because the device
on the other end of this input line might call
qemu_set_irq() on it twice in a row with new_state == 0 both times.
It's only a falling edge if new_state is 0 and the old
input line state was not 0.

If you need to detect edges then you need to record the state
of the input line within LatchingSwitchState.

> +    } else if (s->trigger_edge == TRIGGER_EDGE_RISING && new_state == 1) {
> +        toggle_output(s);
> +    } else if (s->trigger_edge == TRIGGER_EDGE_BOTH) {
> +        toggle_output(s);
> +    }
> +}
> +
> +static void latching_switch_reset(DeviceState *dev)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(dev);
> +    /* reset to off */
> +    s->state = false;
> +    /* reset to falling edge trigger */
> +    s->trigger_edge = TRIGGER_EDGE_FALLING;

trigger_edge isn't guest-visible runtime modifiable state, it's how
the device or board configures the latch when it creates it, right?
Configuration shouldn't be reset, because if the board creates a
rising-edge switch, it should stay a rising edge switch even if the
guest power-cycles itself.

(If the QOM property can be changed at runtime things get more
complex, but in this case it can't be.)

> +}
> +
> +static const VMStateDescription vmstate_latching_switch = {
> +    .name = TYPE_LATCHING_SWITCH,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(state, LatchingSwitchState),
> +        VMSTATE_U8(trigger_edge, LatchingSwitchState),

trigger_edge isn't runtime changeable so it doesn't need to be
saved in the vmstate.

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void latching_switch_realize(DeviceState *dev, Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(dev);
> +
> +    /* init a input io */
> +    qdev_init_gpio_in(dev, input_handler, 1);
> +
> +    /* init a output io */
> +    qdev_init_gpio_out(dev, &(s->output), 1);
> +}
> +
> +static void latching_switch_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Latching Switch";
> +    dc->vmsd = &vmstate_latching_switch;
> +    dc->reset = latching_switch_reset;
> +    dc->realize = latching_switch_realize;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);

This is definitely not a display device :-)

> +}
> +
> +static void latching_switch_get_state(Object *obj, Visitor *v, const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    bool value = s->state;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void latching_switch_set_state(Object *obj, Visitor *v, const char *name,
> +                                      void *opaque, Error **errp)

What's the requirement for being able to set the output state via a
QOM property ?

> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    bool value;
> +    Error *err = NULL;
> +
> +    visit_type_bool(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    if (value != s->state) {
> +        toggle_output(s);

This will call qemu_set_irq() on the output, which isn't a valid thing
to do during board creation or in certain stages of reset.

If you need to handle "the board can create a switch which starts off
with its output asserted", that can be done, but it's a little more
complicated (it involves implementing your reset handler as 3-phase-reset).

It looks from patch 3 like your use case in the aspeed board doesn't
require this, so my suggestion would be simply to not implement it:
make the switch always start with the output state being 0.

> +    }
> +}
> +static void latching_switch_get_trigger_edge(Object *obj, Visitor *v,

Missing newline between the two functions.

> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    int value = s->trigger_edge;
> +    char *p = NULL;
> +
> +    if (value == TRIGGER_EDGE_FALLING) {
> +        p = g_strdup("falling");
> +        visit_type_str(v, name, &p, errp);
> +    } else if (value == TRIGGER_EDGE_RISING) {
> +        p = g_strdup("rising");
> +        visit_type_str(v, name, &p, errp);
> +    } else if (value == TRIGGER_EDGE_BOTH) {
> +        p = g_strdup("both");
> +        visit_type_str(v, name, &p, errp);
> +    } else {
> +        error_setg(errp, "Invalid trigger edge value");
> +    }
> +    g_free(p);
> +}
> +
> +static void latching_switch_set_trigger_edge(Object *obj, Visitor *v,
> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    char *value;
> +    Error *err = NULL;
> +
> +    visit_type_str(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    if (strcmp(value, "falling") == 0) {
> +        s->trigger_edge = TRIGGER_EDGE_FALLING;
> +    } else if (strcmp(value, "rising") == 0) {
> +        s->trigger_edge = TRIGGER_EDGE_RISING;
> +    } else if (strcmp(value, "both") == 0) {
> +        s->trigger_edge = TRIGGER_EDGE_BOTH;
> +    } else {
> +        error_setg(errp, "Invalid trigger edge type: %s", value);
> +    }
> +}
> +
> +static void latching_switch_init(Object *obj)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +
> +    s->state = false;
> +    s->trigger_edge = TRIGGER_EDGE_FALLING;
> +
> +    object_property_add(obj, "state", "bool",
> +                        latching_switch_get_state,
> +                        latching_switch_set_state,
> +                        NULL, NULL);
> +    object_property_add(obj, "trigger-edge", "string",
> +                        latching_switch_get_trigger_edge,
> +                        latching_switch_set_trigger_edge,
> +                        NULL, NULL);
> +}
> +
> +static const TypeInfo latching_switch_info = {
> +    .name = TYPE_LATCHING_SWITCH,
> +    .parent = TYPE_DEVICE,

Don't implement new devices as direct child types of TYPE_DEVICE.
At the moment that makes them never get reset. Make it a child
of TYPE_SYS_BUS_DEVICE instead.

> +    .instance_size = sizeof(LatchingSwitchState),
> +    .class_init = latching_switch_class_init,
> +    .instance_init = latching_switch_init,
> +};
> +
> +static void latching_switch_register_types(void)
> +{
> +    type_register_static(&latching_switch_info);
> +}
> +
> +type_init(latching_switch_register_types);
> +
> +LatchingSwitchState *latching_switch_create_simple(Object *parentobj,
> +                                                   bool state,
> +                                                   uint8_t trigger_edge)
> +{
> +    static const char *name = "latching-switch";
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_LATCHING_SWITCH);
> +
> +    qdev_prop_set_bit(dev, "state", state);
> +
> +    if (trigger_edge == TRIGGER_EDGE_FALLING) {
> +        qdev_prop_set_string(dev, "trigger-edge", "falling");
> +    } else if (trigger_edge == TRIGGER_EDGE_RISING) {
> +        qdev_prop_set_string(dev, "trigger-edge", "rising");
> +    } else if (trigger_edge == TRIGGER_EDGE_BOTH) {
> +        qdev_prop_set_string(dev, "trigger-edge", "both");
> +    } else {
> +        error_report("Invalid trigger edge value");
> +        exit(1);
> +    }
> +
> +    object_property_add_child(parentobj, name, OBJECT(dev));
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);

Current QEMU style doesn't favour providing this sort of
create-and-configure-the-device wrapper function. Instead just
create and set the properties on the device in the board code.

> +
> +    return LATCHING_SWITCH(dev);
> +}

thanks
-- PMM

