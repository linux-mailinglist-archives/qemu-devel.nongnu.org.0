Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD5409A65
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:10:31 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpTS-0001Qk-Dl
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mPou2-0003hu-Sb
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:33:55 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mPou0-0006Kf-DX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:33:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso7480706wmb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//XUTQSh1vSC0iKp+W/uxw6zSi5fBYh3GxNmXJh/nVw=;
 b=ZXko8VYhw51QHEjFZUr/pB3/QHn+b4jYjU1mJO0GW/RZrFi+8PAeHokfKxysn2bmKV
 clfUHRbzMlTvR9OrUjDWT4BneYnK6RnPaaiKHb9xTuNIhX4XmCjgk3Dtwc3Q3UakX9wq
 I1RC8gZ6Rf5FZpzk/UgVGUUnRGA0X7lu+ABkCdOcYpIXiPcfjoKtaqiLXA+DFHXUsF11
 BnelL34unv46zYvNxtShUe8QPPgB5gC6IywFZklkk5Mbjno3+R35u5dWKLwqPwC/hQ5Q
 mHfFwctL77ah0J8CEeEfr3082bgzyuhHwZ3p/8ck7Yxdnuz2DhBQUco+msQIIT/0Q1WU
 imvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//XUTQSh1vSC0iKp+W/uxw6zSi5fBYh3GxNmXJh/nVw=;
 b=4ZwoUe42f3vR/dYv2W+XLBuC9bK6O7DHxbmacxNIKNQGepiVBL79h3MOEMiMe3Pf0f
 gc2bO5i6RfflgiymCRtYzC+tZBrm74CXyBOqoms2rHw7D16YiHXE3S2leG6FFDOATfct
 houDQQcmPHRJ1sqYCt4HZGOa5mw4V30nb8l9EbXxdo3tXj3QOYPAiovsllX4OILNPili
 E/ak7Z/oFlPL+7w2QZQVZYR0tZMcGRY0kXnapak5sAHL68DEDBdDoLjsFHk1p98Ov3Nt
 nAnaffdMtzGvXyaYkKqfpoSFUYVpXLLRBgZhVmFDRIdpnZHBxnn107ApQislu4jZi3D+
 0olg==
X-Gm-Message-State: AOAM530AULl6cq7QT9BDqFIGSucc+ZPkvqUhqUUYmDR8Pgp1VHUoiZff
 SlKPWL1+6S5qWOKN2xoToYxgXBZalzkuXqbehQbc1A==
X-Google-Smtp-Source: ABdhPJy5l2JR1AySUrShMFWAjACSZ4DY0f6/Wx0UFdImb+pj3Wl4xHKaoOLtGYgrvAk9l+JP73MM8+rmtXazxwLOfxE=
X-Received: by 2002:a1c:2705:: with SMTP id n5mr11941116wmn.176.1631550829976; 
 Mon, 13 Sep 2021 09:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
 <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
In-Reply-To: <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Sep 2021 22:03:38 +0530
Message-ID: <CAAhSdy2jihzXxxMJkrb7vydjETbpiGDA6b9OmWnUaJv8-jF6OQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] target/riscv: Improve fidelity of guest external
 interrupts
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::334;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x334.google.com
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

On Thu, Sep 9, 2021 at 12:14 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The guest external interrupts for external interrupt controller are
> > not delivered to the guest running under hypervisor on time. This
> > results in a guest having sluggish response to serial console input
> > and other I/O events. To improve timely delivery of guest external
> > interrupts, we check and inject interrupt upon every sret instruction.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/op_helper.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index ee7c24efe7..4c995c239e 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> >
> >      riscv_cpu_set_mode(env, prev_priv);
> >
> > +    /*
> > +     * QEMU does not promptly deliver guest external interrupts
> > +     * to a guest running on a hypervisor which in-turn is running
> > +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> > +     * every sret instruction so that QEMU pickup guest external
> > +     * interrupts sooner.
> > +     */
> > +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
>
> This doesn't seem right. I don't understand why we need this?
>
> riscv_cpu_update_mip() is called when an interrupt is delivered to the
> CPU, if we are missing interrupts then that is a bug somewhere else.

I have finally figured out the cause of guest external interrupts being
missed by Guest/VM.

The riscv_cpu_set_irq() which handles guest external interrupt lines
of each CPU is called asynchronously. This function in-turn calls
riscv_cpu_update_mip() but the CPU might be in host mode (V=0)
or in Guest/VM mode (V=1). If the CPU is in host mode (V=0) when
the riscv_cpu_set_irq() is called, then the CPU interrupt requested by
riscv_cpu_update_mip() has no effect because the CPU can't take
the interrupt until it enters Guest/VM mode.

This patch does the right thing by doing a dummy call to
riscv_cpu_update_mip() upon SRET instruction so that if the CPU
had missed a guest interrupt previously then the CPU can take it now.

Regards,
Anup

