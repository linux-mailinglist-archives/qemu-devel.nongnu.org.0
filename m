Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF525572B5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 07:53:58 +0200 (CEST)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Fmv-0002Bj-9x
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 01:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o4Fet-0007bM-Ut
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 01:45:40 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o4Fer-0004o1-F3
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 01:45:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id m14so17241820plg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 22:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWz0LA67r29wjHthfsOu8xny+5yYxBCD/ywrDtdUDjk=;
 b=EaZ4rO3qp3uh5OsiAjzDUtkAz1n5wl+qCsGNn/yplF9lmQTbIQSzwWeyQOVtzyxY/0
 DbRJMZpjBkXdJjR7hwSF+Rk5ZXLyGCXDcA9p1znpzYnR7LgntlQyjCEVwXfQYPrBVOAf
 hX5g0wUEPJoN+AnrHIeXI0IKzUK9Ds8m8zCtmnIDlQ2M8VvJDP9phIuop4BM1jzVLBzq
 GwmEuSuscvg7w7oanIlCCVbi5WxVS17bMz7P10WX5z+iRuAQg1j58//lqVZplcJdfnH6
 TdlYina32YMCyJ6cRVQFBdIKxpenRpJsityBhmUsXhbmzbl41AAK5aaxi47vreEAa1fC
 6Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWz0LA67r29wjHthfsOu8xny+5yYxBCD/ywrDtdUDjk=;
 b=pjLxPD6QP3r+aqinX9iYZibZZyTeSQMps1e/zD6OzYdKtxrr2PiSWutmqxrDGr+uQv
 PuAJcx+2V8tbMiduiPdbufr9bDueCx+ONZrU2sS8gW4gUotjcDOXD9C/cRmoCWFQtw+W
 cq5tbvH+0mk+FHGkE8tsBmNyXrqkvCyulM1RRYhVK6CuW0UO4iiqQU61B6V858YSiZtW
 n/Xos+NZCSDvYeXMWKg+7JUGAw5ysuapoBumv1TKk82yhY4wgxnHae/QT34dD/BFTZxc
 8GrCQM3KH/y+dJgQe/WCbB4N/omy33ji8fdVXIDWEt1aRB07f5erMyAzwdFvt+1NfnYW
 HmjA==
X-Gm-Message-State: AJIora9dNJ3ZRiOdAoqNSnVaCHosAygRmObMnei/QY/7ZqU7FFnHhtPY
 yAb7siPKXZwGQnTbMoWc65WMG+BSWuCGqZrzOebE6g==
X-Google-Smtp-Source: AGRyM1tOW/UiRItsacpDLwCF4FqrZ6ZhyfXT2rtPrTJyjmlvYuLnk455aFYcYPwipYJjkvYYH7zdpOHonAKEOpGax+I=
X-Received: by 2002:a17:902:e747:b0:16a:58f2:1d1e with SMTP id
 p7-20020a170902e74700b0016a58f21d1emr1660304plf.17.1655963134621; Wed, 22 Jun
 2022 22:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmXukS+zH=pjiF9NQWBkYguGCDiDAjOOjeZteOzR6xWK=Q@mail.gmail.com>
 <CAKmqyKOAZZRVherNSu__i0rtS3w15cZ2QAutw4=Qp5y5b_N0rw@mail.gmail.com>
In-Reply-To: <CAKmqyKOAZZRVherNSu__i0rtS3w15cZ2QAutw4=Qp5y5b_N0rw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 22 Jun 2022 22:45:23 -0700
Message-ID: <CAHBxVyHd4LXAv6OY7mOzAbfww8tMxARpgTkrx2LBJc9_UCbNfw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 22, 2022 at 9:15 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 4:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > +Atish
> >
> > On Wed, Jun 8, 2022 at 2:20 PM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > We previously stored the device tree at a 16MB alignment from the end of
> > > memory (or 3GB). This means we need at least 16MB of memory to be able
> > > to do this. We don't actually need the FDT to be 16MB aligned, so let's
> > > drop it down to 2MB so that we can support systems with less memory,
> > > while also allowing FDT size expansion.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  hw/riscv/boot.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > index 57a41df8e9..e476d8f491 100644
> > > --- a/hw/riscv/boot.c
> > > +++ b/hw/riscv/boot.c
> > > @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> > >      /*
> > >       * We should put fdt as far as possible to avoid kernel/initrd overwriting
> > >       * its content. But it should be addressable by 32 bit system as well.
> > > -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> > > +     * Thus, put it at an 2MB aligned address that less than fdt size from the
> > >       * end of dram or 3GB whichever is lesser.
> > >       */
> > >      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> > > -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> > > +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> > >
> >
> > @Atish Patra  may have some pointers about the 16MiB alignment requirement.
>

Sorry. I missed this patch for some reason. 16MiB alignment was just
chosen as a safe option.
We couldn't put it at the end of DRAM and I just wanted to place it at
 a reasonable distance.

2MB should be totally okay.

> Any thoughts?
>
> Alistair
>
> >
> > Regards,
> > Bin

