Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1021F94F6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 12:56:48 +0200 (CEST)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkmnH-0004qh-L6
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 06:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jkmmX-0004PZ-7b
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:56:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49502
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jkmmV-0002Er-D8
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592218557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhESTFqxq0pvnue1BIOiHdFsPn2o02OR2ulJyb0OSBs=;
 b=EeZAiw9HFTTEmG3IJXK3hIcNsAwsZp/iY2AKoUSKaz45hwxOC7BSxwhw9bXWy2eTkbAP4R
 PsTBeL88Xf9rSWqXcprMKsHir40zbhFi/O+upgPPOXu6do+xFaBNNMWj5sEXx+G+zeu0NO
 x44cdiTsDAg/GA9VDXvf6lK5bHH0cfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-ab01Cja0M5q8JLV4m-kElQ-1; Mon, 15 Jun 2020 06:55:54 -0400
X-MC-Unique: ab01Cja0M5q8JLV4m-kElQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81E3C18A8222;
 Mon, 15 Jun 2020 10:55:52 +0000 (UTC)
Received: from work-vm (ovpn-114-201.ams2.redhat.com [10.36.114.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD1D60C80;
 Mon, 15 Jun 2020 10:55:46 +0000 (UTC)
Date: Mon, 15 Jun 2020 11:55:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 1/5] hw/misc: Add a LED device
Message-ID: <20200615105544.GG2883@work-vm>
References: <20200612175440.9901-1-f4bug@amsat.org>
 <20200612175440.9901-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200612175440.9901-2-f4bug@amsat.org>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:43:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> A LED device can be connected to a GPIO output.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/led.h | 30 ++++++++++++++++
>  hw/misc/led.c         | 84 +++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS           |  6 ++++
>  hw/misc/Kconfig       |  3 ++
>  hw/misc/Makefile.objs |  1 +
>  hw/misc/trace-events  |  3 ++
>  6 files changed, 127 insertions(+)
>  create mode 100644 include/hw/misc/led.h
>  create mode 100644 hw/misc/led.c
> 
> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
> new file mode 100644
> index 0000000000..427ca1418e
> --- /dev/null
> +++ b/include/hw/misc/led.h
> @@ -0,0 +1,30 @@
> +/*
> + * QEMU single LED device
> + *
> + * Copyright (C) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_MISC_LED_H
> +#define HW_MISC_LED_H
> +
> +#include "hw/qdev-core.h"
> +#include "hw/sysbus.h" /* FIXME remove */
> +
> +#define TYPE_LED "led"
> +#define LED(obj) OBJECT_CHECK(LEDState, (obj), TYPE_LED)
> +
> +typedef struct LEDState {
> +    /* Private */
> +    SysBusDevice parent_obj; /* FIXME DeviceState */
> +    /* Public */
> +
> +    qemu_irq irq;

Why an irq?

> +    uint8_t current_state;

Is the state of this device boolean or is it a 0..255 0=off, 255=full
on, analog thing?
Can an LED device be connected to a PWM device driving a GPIO - what
happens?

Dave


> +    /* Properties */
> +    char *name;
> +    uint8_t reset_state; /* TODO [GPIO_ACTIVE_LOW, GPIO_ACTIVE_HIGH] */
> +} LEDState;
> +
> +#endif /* HW_MISC_LED_H */
> diff --git a/hw/misc/led.c b/hw/misc/led.c
> new file mode 100644
> index 0000000000..1bae1a34c0
> --- /dev/null
> +++ b/hw/misc/led.c
> @@ -0,0 +1,84 @@
> +/*
> + * QEMU single LED device
> + *
> + * Copyright (C) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/led.h"
> +#include "hw/irq.h"
> +#include "trace.h"
> +
> +static void led_set(void *opaque, int line, int new_state)
> +{
> +    LEDState *s = LED(opaque);
> +
> +    trace_led_set(s->name, s->current_state, new_state);
> +
> +    s->current_state = new_state;
> +}
> +
> +static void led_reset(DeviceState *dev)
> +{
> +    LEDState *s = LED(dev);
> +
> +    led_set(dev, 0, s->reset_state);
> +}
> +
> +static const VMStateDescription vmstate_led = {
> +    .name = TYPE_LED,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(reset_state, LEDState),

I'm not sure you need to migrate this - this is a property that's set on
the device, not a dynamic state of the device
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void led_realize(DeviceState *dev, Error **errp)
> +{
> +    LEDState *s = LED(dev);
> +
> +    if (s->name == NULL) {
> +        error_setg(errp, "property 'name' not specified");
> +        return;
> +    }
> +
> +    qdev_init_gpio_in(DEVICE(s), led_set, 1);
> +}
> +
> +static Property led_properties[] = {
> +    DEFINE_PROP_STRING("name", LEDState, name),
> +    DEFINE_PROP_UINT8("reset_state", LEDState, reset_state, 0),

I suggest you add a property for the notional colour; that way any UIs
that are built can use that as a hint.

Dave

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void led_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "LED";
> +    dc->vmsd = &vmstate_led;
> +    dc->reset = led_reset;
> +    dc->realize = led_realize;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    device_class_set_props(dc, led_properties);
> +}
> +
> +static const TypeInfo led_info = {
> +    .name = TYPE_LED,
> +    .parent = TYPE_SYS_BUS_DEVICE, /* FIXME TYPE_DEVICE */
> +    .instance_size = sizeof(LEDState),
> +    .class_init = led_class_init
> +};
> +
> +static void led_register_types(void)
> +{
> +    type_register_static(&led_info);
> +}
> +
> +type_init(led_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3abe3faa4e..10593863dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1857,6 +1857,12 @@ F: docs/specs/vmgenid.txt
>  F: tests/qtest/vmgenid-test.c
>  F: stubs/vmgenid.c
>  
> +LED
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Maintained
> +F: include/hw/misc/led.h
> +F: hw/misc/led.c
> +
>  Unimplemented device
>  M: Peter Maydell <peter.maydell@linaro.org>
>  R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index bdd77d8020..f60dce694d 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -126,6 +126,9 @@ config AUX
>  config UNIMP
>      bool
>  
> +config LED
> +    bool
> +
>  config MAC_VIA
>      bool
>      select MOS6522
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 5aaca8a039..9efa3c941c 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -91,3 +91,4 @@ common-obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
>  obj-$(CONFIG_MAC_VIA) += mac_via.o
>  
>  common-obj-$(CONFIG_GRLIB) += grlib_ahb_apb_pnp.o
> +common-obj-$(CONFIG_LED) += led.o
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 5561746866..e15b7f7c81 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -206,3 +206,6 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
>  # grlib_ahb_apb_pnp.c
>  grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
>  grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
> +
> +# led.c
> +led_set(const char *name, uint8_t old_state, uint8_t new_state) "led name:'%s' state %d -> %d"
> -- 
> 2.21.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


