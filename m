Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE6563ED8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:47:49 +0200 (CEST)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Wuy-0005vF-Cm
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7Wrs-0004Io-Rz; Sat, 02 Jul 2022 02:44:36 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7Wrq-0003WO-8I; Sat, 02 Jul 2022 02:44:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E97F0580B4E;
 Sat,  2 Jul 2022 02:44:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 02 Jul 2022 02:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656744271; x=
 1656747871; bh=E4rgJaOB2WrOAKBtp73ZAWx40ZKlrMpikkNuMVImZfA=; b=o
 JOZeLPHTYOZyz/slq+EmoCzz/aLrvSg9QnECufPsvrSIk+C/jO+lhBZO0zNnmEuI
 CZQRwWIakJVUzArDqO4lj/xMcHGDgAWgaqW5sW7j5Rv2GYv0kMQqGQ6JgvWfRyvM
 YjHk+ROG8g6I+HQJHTpbjXQru7JDuqubHiE+fU2R16UxoiL41vS/e3jB5yXQb3V5
 +UiYIgvocSjqTOGdKgRNQMp4+dUZVJ2tRoD6P8/53qpNq1nvGzQqf6To4l9Eta78
 eMd+QdzBeMVl7vGRzXMFZF+mA8xuAuE/DB5tV+G2odmcwHZ6vesSVkQygA/6bHA5
 wsNXZGLO93K3Tsw/eqkEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656744271; x=1656747871; bh=E4rgJaOB2WrOAKBtp73ZAWx40ZKlrMpikkN
 uMVImZfA=; b=g798pfnmwx5ULii1e10y/zPB9vplmVGXdmEtDC1XjQ3Y/KOS8UU
 PrC7Q0Tr4DhGo2kNu7Xg6OjUOPgnAiGypvauaJhkzjASpgwSP9nOsQHZgQtPBO6A
 vtQlQlSstctjB4SBXTNsaQnqiutUg7IKYlhc0wP8ccaCzHqrD6WC4luqZl/eLUj1
 CIljvZVzwoV79UWrGywd1cYj2nBhePAgh5beWuktWRRVtbnuV3EOlJyuAr7bs4V0
 WoHESwLfYQFOCZagpCx1PKIXm+djWP7EHDHNTq72mTHC4UJCWnUGdfHgCbyxBBqo
 ZH1yQbIDMh0CCcITzjRtsfBP+20DQmcDDHA==
X-ME-Sender: <xms:T-m_YjY5KMK2YHeLbzze4tsnzBhCzPDw_Vlrqr3tz5m4Ip6xrTeo8A>
 <xme:T-m_Yib8RKh7RlYZrCTjK9a2LocrHOecKt37iPvmLC3Fd6jGv9EWeoOiopCrFtZ_R
 ImaeBilG7Bg1jO7b-k>
X-ME-Received: <xmr:T-m_Yl_YUf7w3Sv-hK-_MaGq0dXpB8DZPokpm6yYisRXNv4mI10vc_50DDgt_K59p7xNodSEtCA-BZfpICzto0TtoI6xuOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefgueekffdtueetgfehteffle
 dtueehgfehgeelfedujeefhfffteekvddtfeetteenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:T-m_Yprmte8QGomyWGaRJTC7sInYfhfwcBLvk5eDxFXxUTCKNEyQ3w>
 <xmx:T-m_YupP3dv_mUSls0acD8QPA7N9AXuA8iGfag1jU6wED2KZmMTFJA>
 <xmx:T-m_YvTepYtamS45PngMdTwz2wJNVLq9Wl9DDYjryS3dldB7kX9x0Q>
 <xmx:T-m_YrC0dcgDE9o6lKZ_S9hL7MfH8HyzKYEMRVvW2BbjXvoZIWdmFA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 02:44:30 -0400 (EDT)
Date: Fri, 1 Jul 2022 23:44:28 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <me@pjd.dev>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, joel@jms.id.au, andrew@aj.id.au,
 peter.maydell@linaro.org
Subject: Re: [PATCH v2] aspeed: Refactor UART init for multi-SoC machines
Message-ID: <Yr/pTGzMBJczrUiZ@pdel-mbp>
References: <20220701200234.68289-1-me@pjd.dev>
 <8b3f31c7-3326-2542-03cd-120702cae4bb@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b3f31c7-3326-2542-03cd-120702cae4bb@kaod.org>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sat, Jul 02, 2022 at 07:57:09AM +0200, Cédric Le Goater wrote:
> On 7/1/22 22:02, Peter Delevoryas wrote:
> > This change moves the code that connects the SoC UART's to serial_hd's
> > to the machine.
> > 
> > It makes each UART a proper child member of the SoC, and then allows the
> > machine to selectively initialize the chardev for each UART with a
> > serial_hd.
> > 
> > This should preserve backwards compatibility, but also allow multi-SoC
> > boards to completely change the wiring of serial devices from the
> > command line to specific SoC UART's.
> > 
> > This also removes the uart-default property from the SoC, since the SoC
> > doesn't need to know what UART is the "default" on the machine anymore.
> > 
> > I tested this using the images and commands from the previous
> > refactoring, and another test image for the ast1030:
> > 
> >      wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> >      wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> >      wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> > 
> > Fuji uses UART1:
> > 
> >      qemu-system-arm -machine fuji-bmc \
> >          -drive file=fuji.mtd,format=raw,if=mtd \
> >          -nographic
> > 
> > ast2600-evb uses uart-default=UART5:
> > 
> >      qemu-system-arm -machine ast2600-evb \
> >          -drive file=fuji.mtd,format=raw,if=mtd \
> >          -serial null -serial mon:stdio -display none
> > 
> > Wedge100 uses UART3:
> > 
> >      qemu-system-arm -machine palmetto-bmc \
> >          -drive file=wedge100.mtd,format=raw,if=mtd \
> >          -serial null -serial null -serial null \
> >          -serial mon:stdio -display none
> > 
> > AST1030 EVB uses UART5:
> > 
> >      qemu-system-arm -machine ast1030-evb \
> >          -kernel Y35BCL.elf -nographic
> 
> Looks good. A few comments on the APIs.
> 
> > 
> > Fixes: 6827ff20b2975 ("hw: aspeed: Init all UART's with serial devices")
> > Signed-off-by: Peter Delevoryas <me@pjd.dev>
> > ---
> >   hw/arm/aspeed.c             | 23 +++++++++++++++----
> >   hw/arm/aspeed_ast10x0.c     |  4 ++++
> >   hw/arm/aspeed_ast2600.c     |  4 ++++
> >   hw/arm/aspeed_soc.c         | 44 ++++++++++++++++++++++++-------------
> >   include/hw/arm/aspeed_soc.h |  5 ++++-
> >   5 files changed, 60 insertions(+), 20 deletions(-)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 6fe9b13548..fdca0abd95 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -26,6 +26,7 @@
> >   #include "qemu/error-report.h"
> >   #include "qemu/units.h"
> >   #include "hw/qdev-clock.h"
> > +#include "sysemu/sysemu.h"
> >   static struct arm_boot_info aspeed_board_binfo = {
> >       .board_id = -1, /* device-tree-only board */
> > @@ -301,6 +302,22 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
> >                                  &error_fatal);
> >   }
> > +static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
> 
> something like :
> 
>   void aspeed_soc_uart_connect(AspeedSoCState *s, int uart_default)
> 
> which could be exported from aspeed_soc.c

Actually I kinda disagree on this.

In aspeed_soc.h, I added

    aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)

This is to allow Aspeed SoC users to set the Chardev for each UART.

Then, in aspeed.c, I added connect_serial_hds_to_uarts to perform the wiring
functionality that we've expected up to this point, which is to connect all the
serial devices to one SoC.

I'm imagining that we would use aspeed_soc_uart_set_chr in the fby35
machine like this:

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 0755e3f04f..85abf67b23 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -26,6 +26,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-clock.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/sysemu.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/arm/boot.h"

@@ -99,7 +100,7 @@ static void fby35_bmc_init(Fby35State *s)
     object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram), &error_abort);
     object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0, &error_abort);
     object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003, &error_abort);
-    object_property_set_int(OBJECT(&s->bmc), "uart-default", ASPEED_DEV_UART5, &error_abort);
+    aspeed_soc_uart_set_chr(&s->bmc, ASPEED_DEV_UART5, serial_hd(0));
     qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);

     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
@@ -136,7 +137,7 @@ static void fby35_bic_init(Fby35State *s)
     object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
     qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
     object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory), &error_abort);
-    qdev_prop_set_uint32(DEVICE(&s->bic), "uart-default", ASPEED_DEV_UART5);
+    aspeed_soc_uart_set_chr(&s->bic, ASPEED_DEV_UART5, serial_hd(1));
     qdev_realize(DEVICE(&s->bic), NULL, &error_abort);

     aspeed_board_init_flashes(&s->bic.fmc, "sst25vf032b", 2, 2);

We could add aspeed_soc_uart_connect, but I'm struggling to see how it could
cover both single-SoC and multi-SoC boards while still preserving the feature
in single-SoC that lets us experiment with UART1/UART3 on EVB's.

> 
> > +{
> > +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
> 
> and you wouldn't need the machine.
> 
> > +    AspeedSoCState *s = &bmc->soc;
> > +
> > +    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
> > +    for (int i = 1, uart = ASPEED_DEV_UART1;
> > +         serial_hd(i) && uart <= ASPEED_DEV_UART13; i++, uart++) {
> 
> We should test for :
> 
>   ASPEED_SOC_GET_CLASS(s)->uarts_num

Oh good call, yeah I'll add that.

> 
> I am not sure we want to stop the loop if serial_hd(i) is NULL ?

Yikes! Yeah I was not thinking clearly when I wrote this. Nice catch!

> 
> > +
> > +        if (uart == amc->uart_default) {
> > +            continue;
> > +        }
> > +        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
> > +    }
> > +}>   static void aspeed_machine_init(MachineState *machine)
> >   {
> >       AspeedMachineState *bmc = ASPEED_MACHINE(machine);
> > @@ -346,8 +363,7 @@ static void aspeed_machine_init(MachineState *machine)
> >           object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
> >                                   ASPEED_SCU_PROT_KEY, &error_abort);
> >       }
> > -    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> > -                         amc->uart_default);
> > +    connect_serial_hds_to_uarts(bmc);
> >       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> >       aspeed_board_init_flashes(&bmc->soc.fmc,
> > @@ -1383,8 +1399,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
> >       object_property_set_link(OBJECT(&bmc->soc), "memory",
> >                                OBJECT(get_system_memory()), &error_abort);
> > -    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> > -                         amc->uart_default);
> > +    connect_serial_hds_to_uarts(bmc);
> >       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> >       aspeed_board_init_flashes(&bmc->soc.fmc,
> > diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> > index 33ef331771..a221f5d6fe 100644
> > --- a/hw/arm/aspeed_ast10x0.c
> > +++ b/hw/arm/aspeed_ast10x0.c
> > @@ -144,6 +144,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
> >           object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
> >       }
> > +    for (i = 0; i < sc->uarts_num; i++) {
> > +        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
> > +    }
> > +
> >       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
> >       object_initialize_child(obj, "gpio", &s->gpio, typename);
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 3f0611ac11..c4ad26a046 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -214,6 +214,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >           object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_MII);
> >       }
> > +    for (i = 0; i < sc->uarts_num; i++) {
> > +        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
> > +    }
> > +
> >       snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
> >       object_initialize_child(obj, "xdma", &s->xdma, typename);
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index 0f675e7fcd..2ac18cbf27 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -208,6 +208,10 @@ static void aspeed_soc_init(Object *obj)
> >                                   TYPE_FTGMAC100);
> >       }
> > +    for (i = 0; i < sc->uarts_num; i++) {
> > +        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
> > +    }
> > +
> >       snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
> >       object_initialize_child(obj, "xdma", &s->xdma, typename);
> > @@ -481,8 +485,6 @@ static Property aspeed_soc_properties[] = {
> >                        MemoryRegion *),
> >       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> >                        MemoryRegion *),
> > -    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
> > -                       ASPEED_DEV_UART5),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> > @@ -575,22 +577,34 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
> >   void aspeed_soc_uart_init(AspeedSoCState *s)
> 
> We can handle errors now. So :
> 
>   bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)

Good idea, +1

> 
> >   {
> >       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> > -    int i, uart;
> > -
> > -    /* Attach an 8250 to the IO space as our UART */
> > -    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
> > -                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> > -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> > -    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> > -        if (uart == s->uart_default) {
> > -            uart++;
> > -        }
> > -        serial_mm_init(s->memory, sc->memmap[uart], 2,
> > -                       aspeed_soc_get_irq(s, uart), 38400,
> > -                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
> > +    SerialMM *smm;
> > +    MemoryRegion *mr;
> > +
> > +    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> > +        smm = &s->uart[i];
> > +
> > +        /* Chardev property is set by the machine. */
> > +        qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
> > +        qdev_prop_set_uint32(DEVICE(smm), "baudbase", 38400);
> > +        qdev_set_legacy_instance_id(DEVICE(smm), sc->memmap[uart], 2);
> > +        qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
> > +        sysbus_realize(SYS_BUS_DEVICE(smm), &error_fatal);
> 
> use errp instead and return false in case of failure.

+1

> 
> > +
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, aspeed_soc_get_irq(s, uart));
> > +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(smm), 0);
> > +        memory_region_add_subregion(s->memory, sc->memmap[uart], mr);
> 
> You introduced aspeed_mmio_map() :)

Hahahaha you're totally right, I was _really_ not thinking very clearly this
morning.

> 
> >       }
> >   }
> > +void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
> 
> you could merge this routine in aspeed_soc_uart_connect() I think.

See my comment at the start about this, I'm not sure how we could
use aspeed_soc_uart_connect with the multi-SoC board, but maybe
I'm missing something.

Thanks,
Peter

> 
> Thanks,
> 
> C.
> 
> 
> > +{
> > +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> > +    int i = dev - ASPEED_DEV_UART1;
> > +
> > +    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
> > +    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
> > +}
> > +
> >   /*
> >    * SDMC should be realized first to get correct RAM size and max size
> >    * values
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index e65926a667..60ee0a84db 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -36,12 +36,14 @@
> >   #include "hw/misc/aspeed_lpc.h"
> >   #include "hw/misc/unimp.h"
> >   #include "hw/misc/aspeed_peci.h"
> > +#include "hw/char/serial.h"
> >   #define ASPEED_SPIS_NUM  2
> >   #define ASPEED_EHCIS_NUM 2
> >   #define ASPEED_WDTS_NUM  4
> >   #define ASPEED_CPUS_NUM  2
> >   #define ASPEED_MACS_NUM  4
> > +#define ASPEED_UARTS_NUM 13
> >   struct AspeedSoCState {
> >       /*< private >*/
> > @@ -79,7 +81,7 @@ struct AspeedSoCState {
> >       AspeedSDHCIState emmc;
> >       AspeedLPCState lpc;
> >       AspeedPECIState peci;
> > -    uint32_t uart_default;
> > +    SerialMM uart[ASPEED_UARTS_NUM];
> >       Clock *sysclk;
> >       UnimplementedDeviceState iomem;
> >       UnimplementedDeviceState video;
> > @@ -176,6 +178,7 @@ enum {
> >   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
> >   void aspeed_soc_uart_init(AspeedSoCState *s);
> > +void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
> >   bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
> >   void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
> >   void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
> 

