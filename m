Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD5650512
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71xG-0000h6-EM; Sun, 18 Dec 2022 17:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71xA-0000gU-ND; Sun, 18 Dec 2022 17:16:19 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71x7-0005OW-W7; Sun, 18 Dec 2022 17:16:15 -0500
Received: by mail-ej1-x633.google.com with SMTP id u19so17600805ejm.8;
 Sun, 18 Dec 2022 14:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XxgKvnm9MYMKXv09WPFrvePMPgXJ+NRRTmF8+TAj58=;
 b=q6nut/rdZujBnM4at/W0/Ia5rE7n6OdPQoBubPmNUUWrivDgNY3LGVIfms8MCnIepW
 iSvIv06CSwMFD1ekwt9h6sC69xSkEIM9g5CZ9UgsUl1i57cXKC0jJRvtC2aBUa8Siatu
 mMPDxTLuacqojTpycca63zr4jbHraRLd0kRcg491t4ZJ1GnNW6oCHoeBeklqHGMdiFdk
 AnxfQ7h6LFIqgVc9a5f7+Mlpg4zkMq0wbsPtSPUMlI73SMOaJZ3DXpCvJcapAAnKCFr0
 2A23NydxCm3kVZSwq33h8kMLu9DD2LMwl1x8FdiWzO00Jd80iTucalGVk8a+Q4G1Q2II
 chKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XxgKvnm9MYMKXv09WPFrvePMPgXJ+NRRTmF8+TAj58=;
 b=QEIPBr0HbCOc0uEX+VCKP99NtWt+RhjCiN9rixOjCQeKPsE0WkHoM7bz8LDnfdmp+U
 EUreYegTvNnhQ3Y/FaEv7ehmYszaM7Utxz5LuNw/G0ylpJZyjQxBVO6xUvR18Uq/s2IY
 Bg/SxyikPoNV2YUkvCQi4ClQr5MWGjIFnwUb45abQ3RJEo0j8t6Ykm/TOP2iJPtcbY5T
 xyuQCBsHBDeetvOLjK7jkqmUEFbGhYWq2rLHTyFayrWw1lY3hQN4GHdPzKPsalvjeyUZ
 GPuczC7giWAhRCATN5az0nz4/7bFYmjs2+M00PtZslpMPckmf/+o2Z0zgxkyw09oQZlJ
 CAgg==
X-Gm-Message-State: ANoB5pnX9q/ut2qmRF5mn4TxqQG5EX5fW/23l0gpG3BLko/3OYUAkSQd
 KzdZhXBg2YEmpvcUugQwJJsgIF5T5Z6I16GMCQA=
X-Google-Smtp-Source: AA0mqf66v3ZwY/8BOontpjnNV7Q2y3b++akpwpWHtJZwfkbJE/sb2FtIl9WRLRMDRD0FE8QZ5MM1Bbxh3ffQqouidvA=
X-Received: by 2002:a17:906:b34c:b0:7c0:a6d8:6a6b with SMTP id
 cd12-20020a170906b34c00b007c0a6d86a6bmr31349370ejb.194.1671401771941; Sun, 18
 Dec 2022 14:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-7-strahinja.p.jankovic@gmail.com>
 <5bfa53e5-210f-bca4-20bf-e7f39862fbef@linaro.org>
In-Reply-To: <5bfa53e5-210f-bca4-20bf-e7f39862fbef@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 23:16:00 +0100
Message-ID: <CABtshVSFN91kaBGu0RqiyLrOmO+aV_=UjWxGkyy2jaL8kE8r-g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hw/arm: Allwinner A10 enable SPL load from MMC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x633.google.com
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

Hi,

On Sun, Dec 18, 2022 at 10:59 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 22:19, Strahinja Jankovic wrote:
> > This patch enables copying of SPL from MMC if `-kernel` parameter is no=
t
> > passed when starting QEMU. SPL is copied to SRAM_A.
> >
> > The approach is reused from Allwinner H3 implementation.
> >
> > Tested with Armbian and custom Yocto image.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> >
> > Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
> >   hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
> >   hw/arm/cubieboard.c            |  5 +++++
> >   include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
> >   3 files changed, 44 insertions(+)
> >
> > diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> > index 17e439777e..dc1966ff7a 100644
> > --- a/hw/arm/allwinner-a10.c
> > +++ b/hw/arm/allwinner-a10.c
> > @@ -24,7 +24,9 @@
> >   #include "sysemu/sysemu.h"
> >   #include "hw/boards.h"
> >   #include "hw/usb/hcd-ohci.h"
> > +#include "hw/loader.h"
> >
> > +#define AW_A10_SRAM_A_BASE      0x00000000
> >   #define AW_A10_DRAMC_BASE       0x01c01000
> >   #define AW_A10_MMC0_BASE        0x01c0f000
> >   #define AW_A10_CCM_BASE         0x01c20000
> > @@ -38,6 +40,22 @@
> >   #define AW_A10_RTC_BASE         0x01c20d00
> >   #define AW_A10_I2C0_BASE        0x01c2ac00
> >
> > +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
> > +{
> > +    const int64_t rom_size =3D 32 * KiB;
> > +    g_autofree uint8_t *buffer =3D g_new0(uint8_t, rom_size);
> > +
> > +    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
> > +        error_setg(&error_fatal, "%s: failed to read BlockBackend data=
",
> > +                   __func__);
> > +        return;
> > +    }
> > +
> > +    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
> > +                  rom_size, AW_A10_SRAM_A_BASE,
> > +                  NULL, NULL, NULL, NULL, false);
> > +}
> > +
> >   static void aw_a10_init(Object *obj)
> >   {
> >       AwA10State *s =3D AW_A10(obj);
> > diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> > index afc7980414..37659c35fd 100644
> > --- a/hw/arm/cubieboard.c
> > +++ b/hw/arm/cubieboard.c
> > @@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
> >       memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BAS=
E,
> >                                   machine->ram);
> >
> > +    /* Load target kernel or start using BootROM */
> > +    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
> > +        /* Use Boot ROM to copy data from SD card to SRAM */
> > +        allwinner_a10_bootrom_setup(a10, blk);
> > +    }
> >       /* TODO create and connect IDE devices for ide_drive_get() */
> >
> >       cubieboard_binfo.ram_size =3D machine->ram_size;
> > diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-=
a10.h
> > index 763935fca9..b3c9ed24c7 100644
> > --- a/include/hw/arm/allwinner-a10.h
> > +++ b/include/hw/arm/allwinner-a10.h
> > @@ -15,6 +15,7 @@
> >   #include "hw/misc/allwinner-a10-ccm.h"
> >   #include "hw/misc/allwinner-a10-dramc.h"
> >   #include "hw/i2c/allwinner-i2c.h"
> > +#include "sysemu/block-backend.h"
> >
> >   #include "target/arm/cpu.h"
> >   #include "qom/object.h"
> > @@ -47,4 +48,24 @@ struct AwA10State {
> >       OHCISysBusState ohci[AW_A10_NUM_USB];
> >   };
> >
> > +/**
> > + * Emulate Boot ROM firmware setup functionality.
> > + *
> > + * A real Allwinner A10 SoC contains a Boot ROM
> > + * which is the first code that runs right after
> > + * the SoC is powered on. The Boot ROM is responsible
> > + * for loading user code (e.g. a bootloader) from any
> > + * of the supported external devices and writing the
> > + * downloaded code to internal SRAM. After loading the SoC
> > + * begins executing the code written to SRAM.
> > + *
> > + * This function emulates the Boot ROM by copying 32 KiB
> > + * of data
>
> "at offset 8 KiB" ?

Yes, that is correct. I will update the function description.

Best regards,
Strahinja

>
> > from the given block device and writes it to
> > + * the start of the first internal SRAM memory.
> > + *
> > + * @s: Allwinner A10 state object pointer
> > + * @blk: Block backend device object pointer
> > + */
> > +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
> > +
> >   #endif
>

