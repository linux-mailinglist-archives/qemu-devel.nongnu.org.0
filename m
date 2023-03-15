Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1686BBF8A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 23:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcZC5-0008JE-Kv; Wed, 15 Mar 2023 18:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcZC0-0008Ix-44; Wed, 15 Mar 2023 18:01:56 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcZBx-000620-0z; Wed, 15 Mar 2023 18:01:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id w9so253156edc.3;
 Wed, 15 Mar 2023 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678917711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q06fum3tUyWfyTWXccn9THf4GzY/CnrOjvQsomQDCxo=;
 b=n3wkDUwdN51hUNhVbzWxxTtd+XObyVg94OI3PflvgMQopRsTY2Sgk0WXVwDOrBKgXo
 STEpCxs3xCFN2tfBlocIxDXOutQulkLPRHgi3oGc1MXCWQoinPrL6YsQLhBiZTk+cGrj
 AQlKwEeALwe3tChWXnth8DtcEcY1CV07YVfZjDV/v4j7xnA8Bnvfjmg+Hl37KlzlA4mm
 8USrLVCLBOuDEBaiZUTt5aTmJtmd/+1XuSu4Ra8W1vhPJsoNLTngLfVYQqOdd9j3fdK5
 oX18LzfXvg2CsXxFmX9Crq6ZHbVDoFx2WFomH+5GY/RTberUxjqOOoqQBe4a4reePdQ7
 9+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678917711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q06fum3tUyWfyTWXccn9THf4GzY/CnrOjvQsomQDCxo=;
 b=wtcNCtMeYxZfzDMeLCON4HMNfp4aQ2BxIPuZdSG/dREHQeSZ19+qBr+VfPZ/iaFTGV
 joulx/TonwKp8skFMN3BRQ282ZWKg3pCQTcIKAsgnhT2wllwu6wmfdrRjePb4qDssWBs
 QnMiaPs2t1Z0YJ6MSYcRNJeCEt1rZaK4wZk8RTN6WwqE85whgqCIfcETBVSN/pGL37NG
 MCBVRy99QZAJW93aKEFpLSJbbYQtMyJIh3jssn7/5qrgTLiHkulZH4Hzo4K+T8r1s579
 f9W1/16YA/GsG02X/y9rmcxgDO/kD7wXth4Nm0iytxiyQgZ7st0zIkA22SjDo+WVxKGn
 G8eQ==
X-Gm-Message-State: AO0yUKXxIjvcWpkYB4iV2yvrX5HvfuRWW7Ey+TfpIRQc8IgJd+DL4e6Q
 tggL8FpA33fMkDbqwp3oAQilSW3lqw5RFXBS0pw=
X-Google-Smtp-Source: AK7set9h3nLD/Aa5sVtinCq1nzeD1xTIWMjXJkdQhf2YFRUCkXHTMJ/8PiJtFGpoF8qA9KJhMeBrm/reBQIvXXr6ZHs=
X-Received: by 2002:a17:906:6994:b0:923:c37:15bd with SMTP id
 i20-20020a170906699400b009230c3715bdmr4021884ejr.9.1678917710708; Wed, 15 Mar
 2023 15:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-3-strahinja.p.jankovic@gmail.com>
 <CAPan3Wp0ExihSkk64RFPAS0iw-FoTt2qFZMm=sQ04jr4jTiRMA@mail.gmail.com>
In-Reply-To: <CAPan3Wp0ExihSkk64RFPAS0iw-FoTt2qFZMm=sQ04jr4jTiRMA@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Wed, 15 Mar 2023 23:01:39 +0100
Message-ID: <CABtshVRdt=W=WkWV2-FU0nA366KYNVQ+8bLaOjih=d2Qf=sYvA@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm: Add WDT to Allwinner-A10 and Cubieboard
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Niek,

On Tue, Mar 14, 2023 at 10:21=E2=80=AFPM Niek Linnenbank
<nieklinnenbank@gmail.com> wrote:
>
> Hi Strahinja,
>
>
> On Sat, Mar 11, 2023 at 3:42=E2=80=AFPM Strahinja Jankovic <strahinjapjan=
kovic@gmail.com> wrote:
>>
>> This patch adds WDT to Allwinner-A10 and Cubieboard.
>> WDT is added as an overlay to the Timer module memory map.
>>
>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>> ---
>>  docs/system/arm/cubieboard.rst | 1 +
>>  hw/arm/Kconfig                 | 1 +
>>  hw/arm/allwinner-a10.c         | 7 +++++++
>>  include/hw/arm/allwinner-a10.h | 2 ++
>>  4 files changed, 11 insertions(+)
>>
>> diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard=
.rst
>> index 8d485f5435..58c4a2d3ea 100644
>> --- a/docs/system/arm/cubieboard.rst
>> +++ b/docs/system/arm/cubieboard.rst
>> @@ -15,3 +15,4 @@ Emulated devices:
>>  - USB controller
>>  - SATA controller
>>  - TWI (I2C) controller
>> +- Watchdog timer
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index b5aed4aff5..ec15248536 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -325,6 +325,7 @@ config ALLWINNER_A10
>>      select ALLWINNER_A10_PIC
>>      select ALLWINNER_A10_CCM
>>      select ALLWINNER_A10_DRAMC
>> +    select ALLWINNER_WDT
>>      select ALLWINNER_EMAC
>>      select ALLWINNER_I2C
>>      select AXP209_PMU
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index b7ca795c71..b0ea3f7f66 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -38,6 +38,7 @@
>>  #define AW_A10_EHCI_BASE        0x01c14000
>>  #define AW_A10_OHCI_BASE        0x01c14400
>>  #define AW_A10_SATA_BASE        0x01c18000
>> +#define AW_A10_WDT_BASE         0x01c20c90
>
>
> Unfortunately I couldn't find any details about the watchdog in the Allwi=
nner A10 datasheet "A10_Datasheet.pdf", except for a very brief
> summary in chapter 9.1 in the Timer Controller. But I did find that linux=
 is using this same base address and registers with the shared driver code =
in drivers/watchdog/sunxi_wdt.c.

Thanks for the review. The User Manual for Allwinner A10 is available
at https://linux-sunxi.org/images/1/1e/Allwinner_A10_User_manual_V1.5.pdf,
watchdog registers are on pages 99-100.

Best regards,
Strahinja


>
> Looks good to me.
>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
>>
>>  #define AW_A10_RTC_BASE         0x01c20d00
>>  #define AW_A10_I2C0_BASE        0x01c2ac00
>>
>> @@ -92,6 +93,8 @@ static void aw_a10_init(Object *obj)
>>      object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN4I=
);
>>
>>      object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN4I);
>> +
>> +    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN4I);
>>  }
>>
>>  static void aw_a10_realize(DeviceState *dev, Error **errp)
>> @@ -203,6 +206,10 @@ static void aw_a10_realize(DeviceState *dev, Error =
**errp)
>>      sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, AW_A10_I2C0_BASE);
>>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0, qdev_get_gpio_in(de=
v, 7));
>> +
>> +    /* WDT */
>> +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
>> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0, AW_A10_WDT_BASE=
, 1);
>>  }
>>
>>  static void aw_a10_class_init(ObjectClass *oc, void *data)
>> diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a=
10.h
>> index 095afb225d..cd1465c613 100644
>> --- a/include/hw/arm/allwinner-a10.h
>> +++ b/include/hw/arm/allwinner-a10.h
>> @@ -13,6 +13,7 @@
>>  #include "hw/misc/allwinner-a10-ccm.h"
>>  #include "hw/misc/allwinner-a10-dramc.h"
>>  #include "hw/i2c/allwinner-i2c.h"
>> +#include "hw/watchdog/allwinner-wdt.h"
>>  #include "sysemu/block-backend.h"
>>
>>  #include "target/arm/cpu.h"
>> @@ -41,6 +42,7 @@ struct AwA10State {
>>      AwSdHostState mmc0;
>>      AWI2CState i2c0;
>>      AwRtcState rtc;
>> +    AwWdtState wdt;
>>      MemoryRegion sram_a;
>>      EHCISysBusState ehci[AW_A10_NUM_USB];
>>      OHCISysBusState ohci[AW_A10_NUM_USB];
>> --
>> 2.30.2
>>
>
>
> --
> Niek Linnenbank
>

