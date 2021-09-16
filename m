Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C640DB94
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:44:18 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrgX-0006XM-4G
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mQrf8-0005Vw-CU
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:42:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mQrf6-0000Al-13
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:42:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so9565514wrr.9
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5jV+2z/QDEzpF7P05W5teG4eKI+YZACdN/YNAIx45Y=;
 b=VQuKWTNWnB+sPBS1+qneGSZBKS3OLqo1EK7kc9rfZ5HS7CDjn3q+ayapKY8tx7wEy9
 vG8NTmJjzc8CfMSefeH/OggOnj/rj6iNcVx1gIXJ62aM+dRRBc4OCddVOf5rqBwbRBhz
 ks/wOJ/mN0P/G2DytYTL44+OkJRz5BDlyWz2vxku+y980lUPTjwThMOj5r1jHrRVw+iS
 nbxOgQkOq8vLwA5qUVnwsQHqRIITAtDh9nOb4GGJUeVED3YKbqVI92ehwa1W10FUsF23
 dGUh5VCcwHCGGaCh9fshLivBWxK5c9Ok64uz3ouWtrMyUGY4H+7KbeWM9hTSrhrdrUbB
 09Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5jV+2z/QDEzpF7P05W5teG4eKI+YZACdN/YNAIx45Y=;
 b=JDtDNCJq6D+swFLvek7NznofgXDsMKPjnPTK8V6mNsPwScPbaWJWYh77d7YqDnACeH
 ZzXQBTkQEG4ntQTAz1pJpcAHguoMy5rgksks7CGrcooaFZk1qBBlsqRbVi/XcSzEeCK7
 P16vlLM5B87vDNcrAl6IyGmntNpAQNBkTEvtYW7qRkyEc02xTs8X5MksSyHW6jk5GwEu
 gWLsLlGSgJekASSeQFPabjtbN1AXn/o97ZuiLMTZSlF9KzMU93mhFO6wVHnI7W5AxAad
 yB+A2My+hpPqyHp1+LR2mwaBegXx1wtC1aRKxxzJlO/LSMHWLBeOkmohJy9y9wZw/7Fd
 bk1Q==
X-Gm-Message-State: AOAM530PiPu/5tqs+YfIH2Y/hqRb+xoo+RQvmIjNTTjA7tPil0PVXW+A
 assGX6veYqA7rWNDEYQGQINzPMkS17BiMohgrw0lqQ==
X-Google-Smtp-Source: ABdhPJy8lBzEFfWo7OcqYLhthbZrKptkhQ3OYTjECDD2YLuoHoPkwJgFXmLexvrpOoL2kJ2Fsx5s0X7NnemS0lHVQoA=
X-Received: by 2002:adf:8124:: with SMTP id 33mr6103816wrm.331.1631799765878; 
 Thu, 16 Sep 2021 06:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
 <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
 <CAAhSdy2jihzXxxMJkrb7vydjETbpiGDA6b9OmWnUaJv8-jF6OQ@mail.gmail.com>
 <CAKmqyKN8MeKKS1h-eu+3QEuubbgW+kYAVR6-T750xvW-4HYq+g@mail.gmail.com>
In-Reply-To: <CAKmqyKN8MeKKS1h-eu+3QEuubbgW+kYAVR6-T750xvW-4HYq+g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Sep 2021 19:12:34 +0530
Message-ID: <CAAhSdy3yDLmGMofZxocoPBydfQbXy_qNJUsQ7MWsL=0eWpx6QQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] target/riscv: Improve fidelity of guest external
 interrupts
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 6:19 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Sep 14, 2021 at 2:33 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Sep 9, 2021 at 12:14 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> > > >
> > > > The guest external interrupts for external interrupt controller are
> > > > not delivered to the guest running under hypervisor on time. This
> > > > results in a guest having sluggish response to serial console input
> > > > and other I/O events. To improve timely delivery of guest external
> > > > interrupts, we check and inject interrupt upon every sret instruction.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > ---
> > > >  target/riscv/op_helper.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > > index ee7c24efe7..4c995c239e 100644
> > > > --- a/target/riscv/op_helper.c
> > > > +++ b/target/riscv/op_helper.c
> > > > @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> > > >
> > > >      riscv_cpu_set_mode(env, prev_priv);
> > > >
> > > > +    /*
> > > > +     * QEMU does not promptly deliver guest external interrupts
> > > > +     * to a guest running on a hypervisor which in-turn is running
> > > > +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> > > > +     * every sret instruction so that QEMU pickup guest external
> > > > +     * interrupts sooner.
> > > > +     */
> > > > +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> > >
> > > This doesn't seem right. I don't understand why we need this?
> > >
> > > riscv_cpu_update_mip() is called when an interrupt is delivered to the
> > > CPU, if we are missing interrupts then that is a bug somewhere else.
> >
> > I have finally figured out the cause of guest external interrupts being
> > missed by Guest/VM.
> >
> > The riscv_cpu_set_irq() which handles guest external interrupt lines
> > of each CPU is called asynchronously. This function in-turn calls
> > riscv_cpu_update_mip() but the CPU might be in host mode (V=0)
> > or in Guest/VM mode (V=1). If the CPU is in host mode (V=0) when
>
> The IRQ being raised should just directly call riscv_cpu_update_mip()
> so the IRQ should happen straight away.

That's not true for guest external interrupts. The target Guest/VM might
not be running on the receiving HART.

Let say IMSIC injected guest external IRQ1 to HARTx which is meant
for a Guest/VM, so the riscv_cpu_set_irq() will call riscv_cpu_update_mip().
If HARTx might be in HS-mode or HARTx might be running some
other Guest/VM then cpu_interrupt() request queued by riscv_cpu_update_mip()
will not result in any interrupt being injected. This further means that
QEMU has to check and inject guest external interrupts to target
Guest/VM when HARTx makes a switch from HS-mode to VS-mode. By
calling riscv_cpu_update_mip() upon SRET instruction we are ensuring
that if any guest external interrupt was missed then it is injected ot
VS-mode.

>
> Even from MTTCG I see this:
>
> """
> Currently thanks to KVM work any access to IO memory is automatically
> protected by the global iothread mutex, also known as the BQL (Big
> Qemu Lock). Any IO region that doesn't use global mutex is expected to
> do its own locking.
>
> However IO memory isn't the only way emulated hardware state can be
> modified. Some architectures have model specific registers that
> trigger hardware emulation features. Generally any translation helper
> that needs to update more than a single vCPUs of state should take the
> BQL.
> """
>
> So we should be fine here as well.
>
> Can you supply a test case to reproduce the bug?

Just boot Linux Guest using my QEMU, OpenSBI, Linux, and KVMTOOL
having AIA support patches. If this patch is not there then lot of Guest
external interrupts are missed and Guest gets stuck at random places.

Regards,
Anup

>
> > the riscv_cpu_set_irq() is called, then the CPU interrupt requested by
> > riscv_cpu_update_mip() has no effect because the CPU can't take
> > the interrupt until it enters Guest/VM mode.
> >
> > This patch does the right thing by doing a dummy call to
> > riscv_cpu_update_mip() upon SRET instruction so that if the CPU
> > had missed a guest interrupt previously then the CPU can take it now.
>
> This still doesn't look like the right fix.
>
> Alistair
>
> >
> > Regards,
> > Anup

