Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9366722FFA8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 04:33:27 +0200 (CEST)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0FQk-0006He-2y
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 22:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0FPr-0005oT-L0
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 22:32:31 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0FPp-00030q-LX
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 22:32:31 -0400
Received: by mail-ot1-x343.google.com with SMTP id 93so3676297otx.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 19:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WtTALDH/d9S5LHHZhOVxU2ix+WMJrL3ncx6MiARJYpY=;
 b=Zqp2MBI63r1PajxTcqSYO2ydkY2GVIX045zE1aulYiim2J5ayB3d9EsDgkOUDzDk/d
 BeAWFdalTUlQrbsiyIyYvuFrWWyNBf724n1X6tI+P70nWm+zp7wMNsdc3pT30KOZEFsR
 PXUXdxi1zRkKl7dYk1sOKH3hMKMj7WqycN6NBhrIb6JJNE7oMgaStsqmDd2CZfwZHWEw
 H2+MQayK0VAh/Y/wYUbkj2kqRAC77F0LUfzpzrTo2IrlUCMTLmMKKX5w6z4/S1Q8renj
 s5bDYrGT6GiCcak8PpqsFmDC9sigadsxHrz1/NDlfJnC4s7CWT7KIG9KAe9E8IE0dB1T
 t5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WtTALDH/d9S5LHHZhOVxU2ix+WMJrL3ncx6MiARJYpY=;
 b=egCrA2GXAfhVU0GtHUBK4nbYBg3xweIuBtrDoB7oYn4B4Y0PBldOSkpXdJSM/tA4zR
 GGGP+hF/0dDJ5JLnmxfhNXfZMeHN7k62O9avp1QlEuBMumUCAqRK8vamBxOCxTtMz3jb
 nkmeNk/Rhm90gl8gBIaEaRDos8e9uSuHkMBlOFbX4/Z5jPqwfkoeNCDsokY0NzrDgc9a
 qZSbpxJ8vZEVlHLJMbr6X0OkfJtxR0L5ia/Kwv9OsV86Z+fkopOJd8jGsGNc8urMZC5M
 dMNm27dT0egBUblM5D9ZnKk/XwxAMuHKVyfJ31zVkyDCd5hYT7QyjjtPlbSQZg1vd4Gc
 BMQw==
X-Gm-Message-State: AOAM530LQh1wTaFCXlequ1m0Wv1/rFJ318ZYR+A6OhBWcxeHut7r0Izc
 AQ2jcZBOWcpMeJyWEwJVMyLqaAUKJSZxpQBe9p4/7w==
X-Google-Smtp-Source: ABdhPJyQO95g7T/t+Z24Wzdz7REQUPEV5mjFwKnqnnQIDxSZ6bwbIc9FKoPtsQ5Ly+gwkR05dF4o+gueidw9CXgA6zU=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr24130053otj.127.1595903547534; 
 Mon, 27 Jul 2020 19:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595689201.git.zong.li@sifive.com>
 <a3b3b05f429a50b5ea061f4e8385d4f8d6d77d58.1595689201.git.zong.li@sifive.com>
 <CAKmqyKNgVD2sb4GEdmFwgHtpbooV=dNkxHHN+mNWDzC1e1S1DQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNgVD2sb4GEdmFwgHtpbooV=dNkxHHN+mNWDzC1e1S1DQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 28 Jul 2020 10:32:18 +0800
Message-ID: <CANXhq0oR2CRMe37qzuCmi31RgtzhYDWeLRKX0W1XKPGHAmE6ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: Fix the translation of physical
 address
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=zong.li@sifive.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 28, 2020 at 6:49 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jul 25, 2020 at 8:05 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > The real physical address should add the 12 bits page offset. It also
> > causes the PMP wrong checking due to the minimum granularity of PMP is
> > 4 byte, but we always get the physical address which is 4KB alignment,
> > that means, we always use the start address of the page to check PMP for
> > all addresses which in the same page.
>
> So riscv_cpu_tlb_fill() will clear these bits when calling
> tlb_set_page(), so this won't have an impact on actual translation
> (although it will change in input address for 2-stage translation, but
> that seems fine).
>
> Your point about PMP seems correct as we allow a smaller then page
> granularity this seems like the right approach.
>
> Can you edit riscv_cpu_get_phys_page_debug() to mask these bits out at
> the end? Otherwise we will break what callers to
> cpu_get_phys_page_attrs_debug() expect.
>

OK, I checked that already, the callers would add these bits again,
because they expect to get the address for the page. Thanks for your
reviewing, modify it in the next version.

> Alistair
>
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  target/riscv/cpu_helper.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 75d2ae3434..08b069f0c9 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -543,7 +543,8 @@ restart:
> >              /* for superpage mappings, make a fake leaf PTE for the TLB's
> >                 benefit. */
> >              target_ulong vpn = addr >> PGSHIFT;
> > -            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
> > +            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> > +                        (addr & ~TARGET_PAGE_MASK);
> >
> >              /* set permissions on the TLB entry */
> >              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> > --
> > 2.27.0
> >
> >

