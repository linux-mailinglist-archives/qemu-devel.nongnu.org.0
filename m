Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C7E290009
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 10:38:47 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTLG9-0004mm-PX
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 04:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kTLEh-0004CI-L0
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 04:37:15 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kTLEf-0005LZ-4N
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 04:37:15 -0400
Received: by mail-wm1-x342.google.com with SMTP id l15so1128445wmh.1
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y5TQ1SPrhLl8T6HFL3GDAbxGb+VGvxgiIy/Uc18POBU=;
 b=E/c397MTdNUh0EVfkCKoB3UhMmJhTJxr1YyOmfasJUmMH32eHq6VYsuA5xrEfTs1oS
 obMlz2LfGZyuqWL2dxiItkwUI4iQoN0BfzyQNeKpUcChp7CD3YUNfTngQz1wjKDj2zIi
 +AOFvJaLqQFxa+FyZ3y8AQW8NXNGwLxo8fG6t/+xbXTVq3BLRHx/4V8nXtC4VX7gslx+
 9bQruxUTuFbdgJ7TyYEJ84GJWjh1lYWu3usDEKoJnj+AU6jYDYdBtIDdEKNytiCpLdj9
 TIvfHTtMcZZm19Uozd3tSVEyJ9TYMGSIHBt2Qsgfrzj+MW0un9Bt7Bdke+NfwNNZtcFV
 zD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y5TQ1SPrhLl8T6HFL3GDAbxGb+VGvxgiIy/Uc18POBU=;
 b=SW/Dm2Wv+hGtkZZJqpkb+XGFFSaB0c4HXl4egxiHmI04PD6RI4gXSfRufxgpl7yi4Q
 +QTxuzNSrb+ba4rA5DGsFlax3M4LJBLXyWctwPLs5SRBE47GzqIlkEiMJrch5yrDLx46
 ptFM+7izQTDFv+m+pOEZZyP+5vbExWf44rptEXU9UrNGPm7kErdGT5FUQ0V6dXQ25oNW
 N9I9sUAxrBYJtPZkZXjYRDvQarrK+wG4/SjzKPRVnk5yDcI58IE+pX1H91nDXuRhJd8i
 84Jh5+J039rdGOut2YogNYfEFb0mYQwV+AKR/XG5YMQ95gBCF+/H5cEntL852KuenjkC
 Rj8w==
X-Gm-Message-State: AOAM530VBR9nfr1WCiKHoAweC1vzZGzQNy7iHyLGrj51iUj1IlfbZlNV
 0zgCYb7KNRRD148TSUexZauB0g==
X-Google-Smtp-Source: ABdhPJwKgsx3S+IZJ3ECVH9twcwiLvIhN+a2Oq2CzkDaa2l25EYsceS3PlUujyuEEVlXets1bMD8Yg==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr2543852wmd.1.1602837431358; 
 Fri, 16 Oct 2020 01:37:11 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id x3sm1903506wmi.45.2020.10.16.01.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 01:37:10 -0700 (PDT)
Date: Fri, 16 Oct 2020 09:37:08 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: Re: [PATCH v5 2/2] hw/arm/sbsa-ref: add SBSA watchdog device
Message-ID: <20201016083708.o7avkof5xqpdptia@xora-monster>
References: <20201013151631.30678-1-shashi.mallela@linaro.org>
 <20201013151631.30678-3-shashi.mallela@linaro.org>
 <20201014093119.inq2ut2srps2zfme@xora-monster>
 <CAC15JE2hMrzpWWF-bS-fshoYx+BPehwxqJi-7uMUXSOj+Uh3GQ@mail.gmail.com>
 <20201015141044.loa6x4sv5552pe72@xora-monster>
 <CAD8XO3Yb+GwC75k-OXenAkrXf=x6=ru6C0juzCsT+FQV3iPadw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD8XO3Yb+GwC75k-OXenAkrXf=x6=ru6C0juzCsT+FQV3iPadw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?utf-8?B?UmFkb3PFgmF3?= Biernacki <rad@semihalf.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 15, 2020 at 06:21:09PM +0300, Maxim Uvarov wrote:
> On Thu, 15 Oct 2020 at 17:12, Graeme Gregory <graeme@nuviainc.com> wrote:
> >
> > On Wed, Oct 14, 2020 at 01:04:43PM -0400, Shashi Mallela wrote:
> > > This was added as a placeholder for the virt requirement suggested by Maxim
> > > earlier.Agreed that this fdt otherwise has no significance for sbsa-ref
> > > platform nor is being used by ACPI table created for wdt.
> > >
> > > -Shashi
> > >
> > > On Wed, 14 Oct 2020 at 05:31, Graeme Gregory <[1]graeme@nuviainc.com> wrote:
> > >
> > >     On Tue, Oct 13, 2020 at 11:16:31AM -0400, Shashi Mallela wrote:
> > >     > Included the newly implemented SBSA generic watchdog device model into
> > >     > SBSA platform
> > >     >
> > >     > Signed-off-by: Shashi Mallela <[2]shashi.mallela@linaro.org>
> > >     > ---
> > >     >  hw/arm/sbsa-ref.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
> > >     >  1 file changed, 50 insertions(+)
> > >     >
> > >     > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > >     > index 9c3a893bedfd..97ed41607119 100644
> > >     > --- a/hw/arm/sbsa-ref.c
> > >     > +++ b/hw/arm/sbsa-ref.c
> > >     > @@ -30,6 +30,7 @@
> > >     >  #include "exec/hwaddr.h"
> > >     >  #include "kvm_arm.h"
> > >     >  #include "hw/arm/boot.h"
> > >     > +#include "hw/arm/fdt.h"
> > >     >  #include "hw/block/flash.h"
> > >     >  #include "hw/boards.h"
> > >     >  #include "hw/ide/internal.h"
> > >     > @@ -40,6 +41,7 @@
> > >     >  #include "hw/qdev-properties.h"
> > >     >  #include "hw/usb.h"
> > >     >  #include "hw/char/pl011.h"
> > >     > +#include "hw/watchdog/wdt_sbsa_gwdt.h"
> > >     >  #include "net/net.h"
> > >     >  #include "qom/object.h"
> > >     >
> > >     > @@ -64,6 +66,9 @@ enum {
> > >     >      SBSA_GIC_DIST,
> > >     >      SBSA_GIC_REDIST,
> > >     >      SBSA_SECURE_EC,
> > >     > +    SBSA_GWDT,
> > >     > +    SBSA_GWDT_REFRESH,
> > >     > +    SBSA_GWDT_CONTROL,
> > >     >      SBSA_SMMU,
> > >     >      SBSA_UART,
> > >     >      SBSA_RTC,
> > >     > @@ -104,6 +109,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> > >     >      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
> > >     >      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> > >     >      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
> > >     > +    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
> > >     > +    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
> > >     >      [SBSA_UART] =               { 0x60000000, 0x00001000 },
> > >     >      [SBSA_RTC] =                { 0x60010000, 0x00001000 },
> > >     >      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
> > >     > @@ -133,6 +140,8 @@ static const int sbsa_ref_irqmap[] = {
> > >     >      [SBSA_SECURE_UART_MM] = 9,
> > >     >      [SBSA_AHCI] = 10,
> > >     >      [SBSA_EHCI] = 11,
> > >     > +    [SBSA_SMMU] = 12, /* ... to 15 */
> > >     > +    [SBSA_GWDT] = 16,
> > >     >  };
> >
> > I guess your patch was not based on master here? You should make sure
> > you are rebased to the latest version before sending.
> >
> > >     >
> > >     >  static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
> > >     > @@ -141,6 +150,30 @@ static uint64_t sbsa_ref_cpu_mp_affinity
> > >     (SBSAMachineState *sms, int idx)
> > >     >      return arm_cpu_mp_affinity(idx, clustersz);
> > >     >  }
> > >     >
> > >     > +static void create_wdt_fdt(SBSAMachineState *sms)
> > >     > +{
> > >     > +    char *nodename;
> > >     > +    const char compat[] = "arm,sbsa-gwdt";
> > >     > +
> > >     > +    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
> > >     > +    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
> > >     > +    int irq = sbsa_ref_irqmap[SBSA_GWDT];
> > >     > +
> > >     > +    nodename = g_strdup_printf("/watchdog@%" PRIx64, rbase);
> > >     > +    qemu_fdt_add_subnode(sms->fdt, nodename);
> > >     > +
> > >     > +    qemu_fdt_setprop(sms->fdt, nodename, "compatible",
> > >     > +                             compat, sizeof(compat));
> > >     > +    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
> > >     > +                                 2, rbase, 2, SBSA_GWDT_RMMIO_SIZE,
> > >     > +                                 2, cbase, 2, SBSA_GWDT_CMMIO_SIZE);
> > >     > +    qemu_fdt_setprop_cells(sms->fdt, nodename, "interrupts",
> > >     > +                                GIC_FDT_IRQ_TYPE_PPI, irq,
> > >     > +                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> > >     > +    qemu_fdt_setprop_cell(sms->fdt, nodename, "timeout-sec", 30);
> > >     > +    g_free(nodename);
> > >     > +}
> > >     > +
> > >
> > >     Is this actually used anywhere? I ask because SBSA-ref is not a FDT
> > >     booting machine and only uses FDT to transfer some dynamic info to
> > >     arm-tf/edk2 and is not a full description tree. Your ACPI patch in
> > >     edk2 certainly does not use this info.
> > >
> >
> 
> Greame, if sbsa-ref does not support non edk2 boot, i.e.
> arm-tf/optee/uboot-uefi, then it's better to remove here and we can
> add later for the virt machine.
> 
It is not that it does not support it, it is as real hardware you will
need to build the hardware knowledge into your firmware.

Graeme

> > From your reply above I would propose this hunk and the call below are
> > removed. If its needed to virt thats a seperate discussion which I think
> > was already happening in another thread.
> >
> Yep, agree.
> 
> Maxim.
> 
> > FOSS style is for inline replies not top posting FYI
> >
> > Graeme
> >
> > >     Graeme
> > >
> > >
> > >     >  /*
> > >     >   * Firmware on this machine only uses ACPI table to load OS, these
> > >     limited
> > >     >   * device tree nodes are just to let firmware know the info which varies
> > >     from
> > >     > @@ -219,6 +252,7 @@ static void create_fdt(SBSAMachineState *sms)
> > >     >
> > >     >          g_free(nodename);
> > >     >      }
> > >     > +    create_wdt_fdt(sms);
> > >     >  }
> > >     >
> > >     >  #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
> > >     > @@ -447,6 +481,20 @@ static void create_rtc(const SBSAMachineState *sms)
> > >     >      sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic,
> > >     irq));
> > >     >  }
> > >     >
> > >     > +static void create_wdt(const SBSAMachineState *sms)
> > >     > +{
> > >     > +    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
> > >     > +    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
> > >     > +    DeviceState *dev = qdev_new(TYPE_WDT_SBSA_GWDT);
> > >     > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > >     > +    int irq = sbsa_ref_irqmap[SBSA_GWDT];
> > >     > +
> > >     > +    sysbus_realize_and_unref(s, &error_fatal);
> > >     > +    sysbus_mmio_map(s, 0, rbase);
> > >     > +    sysbus_mmio_map(s, 1, cbase);
> > >     > +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
> > >     > +}
> > >     > +
> > >     >  static DeviceState *gpio_key_dev;
> > >     >  static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
> > >     >  {
> > >     > @@ -730,6 +778,8 @@ static void sbsa_ref_init(MachineState *machine)
> > >     >
> > >     >      create_rtc(sms);
> > >     >
> > >     > +    create_wdt(sms);
> > >     > +
> > >     >      create_gpio(sms);
> > >     >
> > >     >      create_ahci(sms);
> > >     > --
> > >     > 2.18.4
> > >     >
> > >     >
> > >
> > >
> > > References:
> > >
> > > [1] mailto:graeme@nuviainc.com
> > > [2] mailto:shashi.mallela@linaro.org
> >

