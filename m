Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718B5002DF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 02:02:08 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nemw2-0007WY-9x
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 20:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nemta-00064p-TQ
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 19:59:34 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:39529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nemtY-0004OG-W4
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 19:59:34 -0400
Received: by mail-il1-x12d.google.com with SMTP id d4so2135343iln.6
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 16:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDoJnTVLNoDEbiOYf3AE/l1N+TBi6SWUfAs0qXwEYBY=;
 b=mHCzZbsXiKEKud9WKeg4wWkh/Yw4upGTN1soO8NOCBhDINd8jNZOnIOxuMP0QPenG8
 Q9CduORgp4KQJXppqUicS0r/DcAZ0ALpCbzZvSb3JQ7jZ4cLhefpZ/cC0YllBgRRQg+P
 2NE7utlDfZ6VrRJfMqwbmaJkcmwrg6fmIL3+PtPsBrjZ4uBJ2Qb+mYmyat64n/DAaBfQ
 26AQrx242CuuHWw9WSfjE6G+9V2DNIFgck6VlI004Py+eSuIMTDl08JPyPIXvjSL1WXQ
 8C9e2Sj8fBIP79NUJB9thd33W+Csq9rMJkSD3dzO20PU4js5N41sTl2e7x/DrSP6QQAj
 v0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDoJnTVLNoDEbiOYf3AE/l1N+TBi6SWUfAs0qXwEYBY=;
 b=v3dqVocpcJkKPN6MNitiLf/g1inT7iK7s1NtSk8lBSov/o6dlvAU09n1vGSNBd5zK5
 e3/mnJjf646ZvKWDjnXDxB1WHLYbf9o7eiqm5qmzxO/5YNmxO6xclnw0/AicQytUVR0W
 0vdFNucBogcQdubiLLhJLdXTDTE54D20o22IT7tjTXY27OOb6tCslgFw8dq8GvxYDcr7
 XZdsIE7yCp7ycIWInG+EfCYn0rb+AoTC/ICGq+8q2W6jL7Jh6NyA3Su8lJP7P+l8VUQ1
 fM+5f9s8OaeVOAAs2GMBrsgR+ExR6KCDTB9cjMpPiFpBElnmmOWzRH6lXZTEhIbvcD+w
 /KYw==
X-Gm-Message-State: AOAM531GXZlrgfQPvLUbR5Oav6ZcIuhm9BfvwwqlYtgYnp5oBEAv0rOU
 ics8HW/ELJyP9Asu8bZBMZiorOc8ysTxiTbcNQk=
X-Google-Smtp-Source: ABdhPJwwBBBQTN3QvWp2y1gmAannv8jp+qKAzRyMA4cZ6cz6XmOAFFJnVGbNu/qrqYfHKbMh/1q6rEKOMkCAbShEzZ0=
X-Received: by 2002:a05:6e02:1645:b0:2cb:dff3:86d6 with SMTP id
 v5-20020a056e02164500b002cbdff386d6mr42556ilu.260.1649894371857; Wed, 13 Apr
 2022 16:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
 <20220216062912.319738-30-alistair.francis@opensource.wdc.com>
 <CAFEAcA-kG3SgG3beWzvo7o_5BgTVU191D=PZg7EpLYOxnRoCqg@mail.gmail.com>
In-Reply-To: <CAFEAcA-kG3SgG3beWzvo7o_5BgTVU191D=PZg7EpLYOxnRoCqg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Apr 2022 09:59:05 +1000
Message-ID: <CAKmqyKN_FLju7sb5zCA7aRrxALgdN0cFLtYYq57SjKQs6w_S6g@mail.gmail.com>
Subject: Re: [PULL v2 29/35] hw/intc: Add RISC-V AIA APLIC device emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 13, 2022 at 12:53 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Feb 2022 at 08:43, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > The RISC-V AIA (Advanced Interrupt Architecture) defines a new
> > interrupt controller for wired interrupts called APLIC (Advanced
> > Platform Level Interrupt Controller). The APLIC is capabable of
> > forwarding wired interupts to RISC-V HARTs directly or as MSIs
> > (Message Signaled Interupts).
> >
> > This patch adds device emulation for RISC-V AIA APLIC.
>
> Hi; Coverity has some issues with this change; they're kind of
> false positives but they do flag up a minor issue with the code.
> This is CID 1487105, 1487113, 1487185, 1487208.
>
> > +    } else if ((APLIC_TARGET_BASE <= addr) &&
> > +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
> > +        irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> > +        return aplic->target[irq];
> > +    } else if (!aplic->msimode && (APLIC_IDC_BASE <= addr) &&
> > +            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE))) {
> > +        idc = (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
>
> In expressions like these where we're checking "is addr between
> some base address and an upper bound calculated from num_irqs
> or num_harts", Coverity warns that we calculate expressions like
> (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4) using 32-bits and
> then compare against the 64-bit 'addr', so there might be an
> unintentional overflow. Now clearly in this case num_irqs and num_harts
> should never be so large that there is an overflow, so in that
> sense Coverity is wrong and these are false positives. However...
>
> > +static void riscv_aplic_realize(DeviceState *dev, Error **errp)
> > +{
> > +    uint32_t i;
> > +    RISCVAPLICState *aplic = RISCV_APLIC(dev);
> > +
> > +    aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
> > +    aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
> > +    aplic->state = g_new(uint32_t, aplic->num_irqs);
> > +    aplic->target = g_new0(uint32_t, aplic->num_irqs);
> > +    if (!aplic->msimode) {
> > +        for (i = 0; i < aplic->num_irqs; i++) {
> > +            aplic->target[i] = 1;
> > +        }
> > +    }
> > +    aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
> > +    aplic->iforce = g_new0(uint32_t, aplic->num_harts);
> > +    aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
> > +
> > +    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
> > +                          TYPE_RISCV_APLIC, aplic->aperture_size);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
> > +
> > +    /*
> > +     * Only root APLICs have hardware IRQ lines. All non-root APLICs
> > +     * have IRQ lines delegated by their parent APLIC.
> > +     */
> > +    if (!aplic->parent) {
> > +        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
> > +    }
> > +
> > +    /* Create output IRQ lines for non-MSI mode */
> > +    if (!aplic->msimode) {
> > +        aplic->external_irqs = g_malloc(sizeof(qemu_irq) * aplic->num_harts);
> > +        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
> > +
> > +        /* Claim the CPU interrupt to be triggered by this APLIC */
> > +        for (i = 0; i < aplic->num_harts; i++) {
> > +            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
> > +            if (riscv_cpu_claim_interrupts(cpu,
> > +                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> > +                error_report("%s already claimed",
> > +                             (aplic->mmode) ? "MEIP" : "SEIP");
> > +                exit(1);
> > +            }
> > +        }
> > +    }
> > +
> > +    msi_nonbroken = true;
> > +}
>
> ...in the realize method we don't do any sanity checking of our
> QOM properties that set aplic->num_irqs and aplic->num_harts, so the
> creator of the device could in theory pass us some bogus values that
> cause overflow and other bad things.
>
> > +/*
> > + * Create APLIC device.
> > + */
> > +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> > +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
> > +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
> > +{
> > +    DeviceState *dev = qdev_new(TYPE_RISCV_APLIC);
> > +    uint32_t i;
> > +
> > +    assert(num_harts < APLIC_MAX_IDC);
> > +    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <= size);
> > +    assert(num_sources < APLIC_MAX_SOURCE);
> > +    assert(APLIC_MIN_IPRIO_BITS <= iprio_bits);
> > +    assert(iprio_bits <= APLIC_MAX_IPRIO_BITS);
> > +
> > +    qdev_prop_set_uint32(dev, "aperture-size", size);
> > +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > +    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) - 1));
> > +    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
>
> You do make some assert()s on num_harts and num_sources here, but
> this is the wrong place to do this error checking, because there's
> no particular reason why a board model has to use this function
> rather than directly creating the device. Instead these checks should
> go in the realize method and should cause realize to fail.

@Anup Patel are you able to send a patch adding some error checking?

Alistair

>
> > +    qdev_prop_set_bit(dev, "msimode", msimode);
> > +    qdev_prop_set_bit(dev, "mmode", mmode);
> > +
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>
> thanks
> -- PMM

