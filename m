Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3876B39A49C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 17:32:40 +0200 (CEST)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopKn-0000Qg-By
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 11:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lopJh-0007tZ-K0
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:31:29 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lopJb-0003gN-T7
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:31:29 -0400
Received: by mail-qk1-x72d.google.com with SMTP id r17so6285669qkp.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsGSIN6YngO/9fCDgOZikd363sKy8U9y9xizVKSOFeQ=;
 b=GSozqxKTM+Y0mT23+QeAVGiUJdY9n8SuzJ+wuCRSlL1wJDHoSSlN2yPXSDskZDJGWD
 1tJIqwM8CtqDc32okeXeQAkdy7SGhYXtBig5S/IHeJiAM0FxBl0au6MVF5F7bQ/c2wj0
 eLN4hc5tTz3xGImXeK91sQee7NxsM+3oLFMydW6ASDqgNrl49KseEPnjjwH6KgGkgoHt
 3tyZUJtmX0TX3Di+rs5oXWiHh+HB9c37pHLUFiVYZCZdMtK2kvMxCD4EPypzlskYd1Be
 7bqt+0ZDsMhLHGygmOZu3IE0Q8yRZtjBsEeUdcxTs7vddZ7K+H9Lefspjcy6KZo94bjz
 hjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsGSIN6YngO/9fCDgOZikd363sKy8U9y9xizVKSOFeQ=;
 b=nr04BeqMtWegDc1fkzYtGF5+tinxOeZVdkQET19p8qChzGlVjUBhCtpEi/u5NWPD01
 dzVlK6VIZAmHelos8bDpe6s6T8F3aD2EkDJskmhLXKPPyEVZAFeBv0zDkw5buGCb3zN+
 McP8im7dm73O4vWtuafm2ajsDEAGbZ+NUSd5P81Vg4C/5nvWhUSJoOvRV+rVFpbILZPw
 iL7nRd2QzZ8JHSAJebcAdMJTfd1hVGmhcYeNrlfVG3sr1rXLNr7nnFsw0aVWaQLj2D7z
 KQ84KuCguVfSvkjR36s/NHE2FIOhWryp0Gi4eISvw3nfN2MBQ6CBMgZo9MQNboBegkIQ
 zljw==
X-Gm-Message-State: AOAM532NKkLckrzkUJxT1TJsCZSHFYye1YXWK9muq9XIdSuxEL+8rZRR
 NwYexz9wtdNG86JF/weAhpcPOg==
X-Google-Smtp-Source: ABdhPJxD3jRswDCHbbX9IYdaOhTcR7SuYFQFxvFKrcrL77pdJs6sx3pVe4eRhe+Nw7i961gpUAmQaw==
X-Received: by 2002:a37:9c15:: with SMTP id f21mr192774qke.128.1622734282491; 
 Thu, 03 Jun 2021 08:31:22 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id s5sm2153495qkg.88.2021.06.03.08.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:31:22 -0700 (PDT)
Message-ID: <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
From: shashi.mallela@linaro.org
To: Leif Lindholm <leif@nuviainc.com>
Date: Thu, 03 Jun 2021 11:31:21 -0400
In-Reply-To: <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-06-03 at 12:42 +0100, Leif Lindholm wrote:
> On Wed, Jun 02, 2021 at 14:00:41 -0400, Shashi Mallela wrote:
> > Included creation of ITS as part of SBSA platform GIC
> > initialization.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index 43c19b4923..3d9c073636 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -34,7 +34,7 @@
> >  #include "hw/boards.h"
> >  #include "hw/ide/internal.h"
> >  #include "hw/ide/ahci_internal.h"
> > -#include "hw/intc/arm_gicv3_common.h"
> > +#include "hw/intc/arm_gicv3_its_common.h"
> >  #include "hw/loader.h"
> >  #include "hw/pci-host/gpex.h"
> >  #include "hw/qdev-properties.h"
> > @@ -64,6 +64,7 @@ enum {
> >      SBSA_CPUPERIPHS,
> >      SBSA_GIC_DIST,
> >      SBSA_GIC_REDIST,
> > +    SBSA_GIC_ITS,
> >      SBSA_SECURE_EC,
> >      SBSA_GWDT,
> >      SBSA_GWDT_REFRESH,
> > @@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> >      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
> >      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
> >      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> 
> It seems customary in QEMU to flag gaps in memory space (although
> admittedly, we'd already failed to do so here). This patch leaves a
> gap of 0x00010000. Is there a particular reason?
> 
> > +    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
> 
> And then again a gap (the one we already had).
> 
> /
>     Leif
>
> No specific reason,but from ITS point of view tried to stay within 
> the GIC's 0x40060000 to 0x50000000 zone.The gap of 0x00010000 would 
> also account for future GIC additions like virtual LPI support.
>
> 
> >      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
> >      [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
> >      [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
> > @@ -377,7 +379,20 @@ static void create_secure_ram(SBSAMachineState
> > *sms,
> >      memory_region_add_subregion(secure_sysmem, base, secram);
> >  }
> >  
> > -static void create_gic(SBSAMachineState *sms)
> > +static void create_its(SBSAMachineState *sms)
> > +{
> > +    DeviceState *dev;
> > +
> > +    dev = qdev_new(TYPE_ARM_GICV3_ITS);
> > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > +
> > +    object_property_set_link(OBJECT(dev), "parent-gicv3",
> > OBJECT(sms->gic),
> > +                             &error_abort);
> > +    sysbus_realize_and_unref(s, &error_fatal);
> > +    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
> > +}
> > +
> > +static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
> >  {
> >      unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
> >      SysBusDevice *gicbusdev;
> > @@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState *sms)
> >      qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
> >      qdev_prop_set_uint32(sms->gic, "redist-region-count[0]",
> > redist0_count);
> >  
> > +    object_property_set_link(OBJECT(sms->gic), "sysmem",
> > OBJECT(mem),
> > +                                 &error_fatal);
> > +    qdev_prop_set_bit(sms->gic, "has-lpi", true);
> > +
> >      gicbusdev = SYS_BUS_DEVICE(sms->gic);
> >      sysbus_realize_and_unref(gicbusdev, &error_fatal);
> >      sysbus_mmio_map(gicbusdev, 0,
> > sbsa_ref_memmap[SBSA_GIC_DIST].base);
> > @@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState *sms)
> >          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> >                             qdev_get_gpio_in(cpudev,
> > ARM_CPU_VFIQ));
> >      }
> > +    create_its(sms);
> >  }
> >  
> >  static void create_uart(const SBSAMachineState *sms, int uart,
> > @@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState
> > *machine)
> >  
> >      create_secure_ram(sms, secure_sysmem);
> >  
> > -    create_gic(sms);
> > +    create_gic(sms, sysmem);
> >  
> >      create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
> >      create_uart(sms, SBSA_SECURE_UART, secure_sysmem,
> > serial_hd(1));
> > -- 
> > 2.27.0
> > 


