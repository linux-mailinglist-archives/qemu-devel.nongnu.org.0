Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F297439B74F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:45:04 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7K3-0000pg-VH
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lp7HG-0004nS-TC
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:42:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lp7HF-0000y2-00
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:42:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n4so8836120wrw.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uvdNDXFBOUJoDp6hqKDAGLdFqIuBk6H7HqU2AY0dX5U=;
 b=F4vgMm5aKw7vmRH5OUSNYb4wFHPVVgTCWonl8rnP+03gR3JteOhoErVy5PBVm8R+z5
 2TubCpik0SJveZExyqAoKNkyrw1GRKIFiTSPR1yfIbkIQaGIefS6ODI+kSf9r6P+2r/D
 BGlg8GlUgnHXskmmfYI8LE6Q4N3jebfPq/PMsdvR1Jl8oDxSnafXwe1TagMet77/PXVG
 SJVLtdZhPiaQlPd03HgwJjkGTW/zaBtkJhljDEIglmTO9mLMXT95DYQFyo1V9iCRZrcP
 2IEdoZqtlvGnmtrDGXiLhr//nQgoDn39+BVW55RKPbKnlX6kjxEGKDxDwALWh9WrcnTp
 tMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvdNDXFBOUJoDp6hqKDAGLdFqIuBk6H7HqU2AY0dX5U=;
 b=mpUluTcUbPNNlm/EPOlhLnkg/SRCmjNbpwqslCuGThSqtpy4cOsuV6YGZFtcAl1tVK
 8aJ07hQluH5cyrvUaUGVocJuWth3mmgyYs2TErvmUkML+5YILZFZ2mLWchgSHeZusSHe
 PPO85xCRF5lD9KkLsUBQR451MkowpWjNVn4cN5hRKug0pdU3SXYSdNHf6NcOpTH8glax
 WbU3NrFmOrICIxv1j90x5Uso5xdZ1S3MPMCmzxmVk+92EsewtsqXEq5Iza3Vj+mp/AXB
 bre8qfC6AO31mQcdggBO/3SGypW9X8baPax+1ZE8uU3lpBSluejaqwGRPs60+M7WUvxa
 56Ww==
X-Gm-Message-State: AOAM5329ObdCzN7WqfMjeUn1NffIdHDyTRlImTUgoz6loLVkaJcVEvap
 GCiN9NLX5K6WKbACXsrVrwtHQg==
X-Google-Smtp-Source: ABdhPJw2z+yensAfdk8EqV2hLuQ13k05PGxAT+bQEPYguCHOCHAdZZXN9hTibgZLCfKbdWS3M9pvZA==
X-Received: by 2002:a05:6000:6:: with SMTP id h6mr3218833wrx.24.1622803327045; 
 Fri, 04 Jun 2021 03:42:07 -0700 (PDT)
Received: from leviathan (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id x7sm6897992wre.8.2021.06.04.03.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 03:42:06 -0700 (PDT)
Date: Fri, 4 Jun 2021 11:42:04 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: shashi.mallela@linaro.org
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210604104204.z3hhm2cxesnm2jx2@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
 <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Jun 03, 2021 at 11:31:21 -0400, shashi.mallela@linaro.org wrote:
> On Thu, 2021-06-03 at 12:42 +0100, Leif Lindholm wrote:
> > On Wed, Jun 02, 2021 at 14:00:41 -0400, Shashi Mallela wrote:
> > > Included creation of ITS as part of SBSA platform GIC
> > > initialization.
> > > 
> > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > ---
> > >  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
> > >  1 file changed, 23 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > > index 43c19b4923..3d9c073636 100644
> > > --- a/hw/arm/sbsa-ref.c
> > > +++ b/hw/arm/sbsa-ref.c
> > > @@ -34,7 +34,7 @@
> > >  #include "hw/boards.h"
> > >  #include "hw/ide/internal.h"
> > >  #include "hw/ide/ahci_internal.h"
> > > -#include "hw/intc/arm_gicv3_common.h"
> > > +#include "hw/intc/arm_gicv3_its_common.h"
> > >  #include "hw/loader.h"
> > >  #include "hw/pci-host/gpex.h"
> > >  #include "hw/qdev-properties.h"
> > > @@ -64,6 +64,7 @@ enum {
> > >      SBSA_CPUPERIPHS,
> > >      SBSA_GIC_DIST,
> > >      SBSA_GIC_REDIST,
> > > +    SBSA_GIC_ITS,
> > >      SBSA_SECURE_EC,
> > >      SBSA_GWDT,
> > >      SBSA_GWDT_REFRESH,
> > > @@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> > >      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
> > >      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
> > >      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> > 
> > It seems customary in QEMU to flag gaps in memory space (although
> > admittedly, we'd already failed to do so here). This patch leaves a
> > gap of 0x00010000. Is there a particular reason?
> > 
> > > +    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
> > 
> > And then again a gap (the one we already had).
> > 
> > No specific reason,but from ITS point of view tried to stay within 
> > the GIC's 0x40060000 to 0x50000000 zone.The gap of 0x00010000 would 
> > also account for future GIC additions like virtual LPI support.

Right. I was more thinking 64kB isn't much space to extend into.
Would it be worth pushing the ITS either all the way up to just below
0x50000000, 0x48000000, or 0x45000000?

Either way, the gap(s) would be good to point out with comments, and
potential future use. I only noticed this one on like the third pass
of reading.

/
    Leif

> > >      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
> > >      [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
> > >      [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
> > > @@ -377,7 +379,20 @@ static void create_secure_ram(SBSAMachineState
> > > *sms,
> > >      memory_region_add_subregion(secure_sysmem, base, secram);
> > >  }
> > >  
> > > -static void create_gic(SBSAMachineState *sms)
> > > +static void create_its(SBSAMachineState *sms)
> > > +{
> > > +    DeviceState *dev;
> > > +
> > > +    dev = qdev_new(TYPE_ARM_GICV3_ITS);
> > > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > > +
> > > +    object_property_set_link(OBJECT(dev), "parent-gicv3",
> > > OBJECT(sms->gic),
> > > +                             &error_abort);
> > > +    sysbus_realize_and_unref(s, &error_fatal);
> > > +    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
> > > +}
> > > +
> > > +static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
> > >  {
> > >      unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
> > >      SysBusDevice *gicbusdev;
> > > @@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState *sms)
> > >      qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
> > >      qdev_prop_set_uint32(sms->gic, "redist-region-count[0]",
> > > redist0_count);
> > >  
> > > +    object_property_set_link(OBJECT(sms->gic), "sysmem",
> > > OBJECT(mem),
> > > +                                 &error_fatal);
> > > +    qdev_prop_set_bit(sms->gic, "has-lpi", true);
> > > +
> > >      gicbusdev = SYS_BUS_DEVICE(sms->gic);
> > >      sysbus_realize_and_unref(gicbusdev, &error_fatal);
> > >      sysbus_mmio_map(gicbusdev, 0,
> > > sbsa_ref_memmap[SBSA_GIC_DIST].base);
> > > @@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState *sms)
> > >          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> > >                             qdev_get_gpio_in(cpudev,
> > > ARM_CPU_VFIQ));
> > >      }
> > > +    create_its(sms);
> > >  }
> > >  
> > >  static void create_uart(const SBSAMachineState *sms, int uart,
> > > @@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState
> > > *machine)
> > >  
> > >      create_secure_ram(sms, secure_sysmem);
> > >  
> > > -    create_gic(sms);
> > > +    create_gic(sms, sysmem);
> > >  
> > >      create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
> > >      create_uart(sms, SBSA_SECURE_UART, secure_sysmem,
> > > serial_hd(1));
> > > -- 
> > > 2.27.0
> > > 
> 

