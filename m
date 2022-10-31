Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB8612F5E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 04:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opLnj-0006zb-DM; Sun, 30 Oct 2022 23:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1opLnh-0006yw-6h
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 23:49:25 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1opLnf-00041P-Fa
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 23:49:24 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso12392158fac.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 20:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fgwRn2JOA14md2/X+3voFUSGVJ65KgI7d3f6Y+z8F0E=;
 b=De+y8in8l1XNWhWMJ7Qs8OSSVD/LV2Y3pBAHuawRh5ns8TdBplCD4ZGWDpeb/hnxid
 Juji/f0M+s+B1zX77beSZznkNPlgDrZm78IVBvfJ/VzecVxDyi/xESEh83pQkNn/XcOa
 IOEEgaWWWBlLIrFEYTZbiE66kQ8Z7A+7f4Q7+hdOkvBlV6yMPHbSMA0CMEfehOMkj51s
 siuXnEyO3NrCu2d+VSCPWhspHcveAvtrS+TuVrM2rMPwTvYlMfG9cMlqfw9iYCG0dGhw
 e4aialGE1OMOQrtXBDlTC+FCZ0IpjZxYnlsXnp+Ka8EfAt1h4u/BI+JmRlLr5T7nBLJ6
 9Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fgwRn2JOA14md2/X+3voFUSGVJ65KgI7d3f6Y+z8F0E=;
 b=goQhYWy6gd7qg0WCQb9NVaOqDH7l3b2riemzATmwAo/XzysyX+qLIb/2kbSi0X4qV7
 aoNP6NsGSPjkVNGir88bk0E28BdMMkUYqQc4E69PNmgvf2AXegsPINFhzNzZRQCpwLoK
 BE3A1gArtYl8+xZbJ0u+YWQtDX8U9eY6pnSwLh/elFiYOmCZry3FXXylXfx+diJhrwxg
 IaIAtKSwWwK2Y2KIs6kVzA/TsowsOnUsEsFxGBIkMP79RDkj3zBA3+bcrCZnSCk1T2yw
 6O5oPHD1CJ0Bcjv1qUcFXQAxq19144Ov641P+/a7aRrrfe2B1bWG/fNT0Lb6Y0L5tLy2
 8THQ==
X-Gm-Message-State: ACrzQf2WDZyJtSsc6jtATeS5e9sCOwp1RnzULfd2xqr5NxpnpkshFPg7
 9D7uE93sibMPALsqRYjkyrzLJ7I2Iq5FvqZuS0qgfQ==
X-Google-Smtp-Source: AMsMyM5zqQP31dc29Wp/R14/0422CKv2bysXEPWHx69i1xGxV0u096fubBpQQhMtwcw86N+/iKosZDmWynmcR8F/2Tg=
X-Received: by 2002:a05:6870:6593:b0:13b:c1a:e8ac with SMTP id
 fp19-20020a056870659300b0013b0c1ae8acmr6255919oab.271.1667188161573; Sun, 30
 Oct 2022 20:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-5-apatel@ventanamicro.com>
 <CAKmqyKNWdJCQvT-5ddjQBjwMJ=uqBZv_+zG7TSAwqAS1p8oTkQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNWdJCQvT-5ddjQBjwMJ=uqBZv_+zG7TSAwqAS1p8oTkQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 31 Oct 2022 09:19:11 +0530
Message-ID: <CAK9=C2WjjYsvi3VCOk8NGms+BupQKCbu3SUGqPNjEdzR9eVpag@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 6:25 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Oct 28, 2022 at 2:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The time CSR will wrap-around immediately after reaching UINT64_MAX
> > so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
> > in riscv_timer_write_timecmp().
>
> I'm not clear what this is fixing?
>
> If the guest sets a timer for UINT64_MAX shouldn't that still trigger
> an event at some point?

Here's what Sstc says about timer interrupt using Sstc:
"A supervisor timer interrupt becomes pending - as reflected in the
STIP bit in the mip and sip registers - whenever time contains a
value greater than or equal to stimecmp, treating the values as
unsigned integers. Writes to stimecmp are guaranteed to be
reflected in STIP eventually, but not necessarily immediately.
The interrupt remains posted until stimecmp becomes greater
than time - typically as a result of writing stimecmp."

When timecmp = UINT64_MAX, the time CSR will eventually reach
timecmp value but on next timer tick the time CSR will wrap-around
and become zero which is less than UINT64_MAX. Now, the timer
interrupt behaves like a level triggered interrupt so it will become 1
when time = timecmp = UINT64_MAX and next timer tick it will
become 0 again because time = 0 < timecmp = UINT64_MAX.

This time CSR wrap-around comparison with timecmp is natural
to implement in HW but not straight forward in QEMU hence this
patch.

Software can potentially use timecmp = UINT64_MAX as a way
to clear the timer interrupt and keep timer disabled instead of
enabling/disabling sie.STIP. This timecmp = UINT64_MAX helps:
1) Linux RISC-V timer driver keep timer interrupt enable/disable
    state in-sync with Linux interrupt subsystem.
2) Reduce number of traps taken when emulating Sstc for the
    "Nested Guest" (i.e. Guest running under some "Guest Hypervisor"
    which in-turn runs under a "Host Hypervisor").

In fact, the SBI set_timer() call also defines similar mechanism to
disable timer: "If the supervisor wishes to clear the timer interrupt
without scheduling the next timer event, it can either request a timer
interrupt infinitely far into the future (i.e., (uint64_t)-1), ...".

Regards,
Anup

>
> Alistair
>
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  target/riscv/time_helper.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > index 4fb2a471a9..1ee9f94813 100644
> > --- a/target/riscv/time_helper.c
> > +++ b/target/riscv/time_helper.c
> > @@ -72,6 +72,14 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> >          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> >      }
> >
> > +    /*
> > +     * Don't re-start the QEMU timer when timecmp == UINT64_MAX because
> > +     * time CSR will wrap-around immediately after reaching UINT64_MAX.
> > +     */
> > +    if (timecmp == UINT64_MAX) {
> > +        return;
> > +    }
> > +
> >      /* otherwise, set up the future timer interrupt */
> >      diff = timecmp - rtc_r;
> >      /* back to ns (note args switched in muldiv64) */
> > --
> > 2.34.1
> >
> >

