Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7A2318DE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 07:06:07 +0200 (CEST)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0eI1-000691-Nf
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 01:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0eH7-0005f9-P1; Wed, 29 Jul 2020 01:05:09 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:42313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0eH5-0006Gj-RI; Wed, 29 Jul 2020 01:05:09 -0400
Received: by mail-io1-xd43.google.com with SMTP id j8so10861893ioe.9;
 Tue, 28 Jul 2020 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sl/azBJAOJa+e97dNS9RfOQn6bNo87whOtH9SDS9pak=;
 b=UTubwXnjmguCIMh1DEzzk2hQL2ziNpn/Pqan1iWKV4WnkGrNUB1v1qLRgSwXK0hldg
 MZGrOSEb5RQNKEmI8cLrkEkNNuFceUsVfLUc4KDD92/iye7+Noa87o2TUWb8+k71uAYJ
 mvpMGYGx2JG/WTSXIK9Tni2QZmu10lcFtyV5K5gq7QQwnqntOH5L2+odr9a+UCLNoqs1
 ZpfkllwuGWnZJ35OxD9j8Hdw2WmZrD4p2+iebmb3qi4ezRgHHo3rqeE/uk8bGMD8Rk+e
 5duw49PlpeTAx72aU5T68vOYBwOkSg8DGOr9F+i5elbomal5A9mSGNksZBcBed1s1weW
 EC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sl/azBJAOJa+e97dNS9RfOQn6bNo87whOtH9SDS9pak=;
 b=PBtc7MIbapEVZT55AMBlZvmOy7oAKtAY6nM+slFTWB1V7gMQ6UbCV+ZpPzFnQ1L3C/
 GvYl5djxEPHOhKmc0B/f3gbnUj40wVztnER7V0zy0VBXPfocnrYtww1qEbmaBPiytoqx
 ja7OUkdO+JwBjWRLm76QicXDkchEDFItE1c55CMIgVWpkdJ/UlQ2H5wAfgOfFD1o7Jcl
 dlqUlT3uaejE897WNlXnf30054OobbpNmY9T6bhF/kJViEdhEnQOF45lD/Gs9baEP+9J
 shoUG+0a798VGmir54bqWQuDI6sbW/z0nEDcWqhzutzkhnyW8tynjsJiMIrh4KnbALba
 F40w==
X-Gm-Message-State: AOAM533jlBKNDuhKinyRKUBCvl3AUu4HTVQJfx3OHHzZhacMtR55/p08
 NyV4/9qSo9SjUdzBv9B0lVfpayzfnLZu1n+P9O8=
X-Google-Smtp-Source: ABdhPJw6cjJSLsMc8uq3u7Eg4z9fpb6fL9u2TgSjZvZ6Fl1qnvG5iOKUnU8c05UeYm9GmCl24xu8GuwQoRrvLa84gZw=
X-Received: by 2002:a02:84c1:: with SMTP id f59mr28272643jai.106.1595999105956; 
 Tue, 28 Jul 2020 22:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594357499-29068-1-git-send-email-bmeng.cn@gmail.com>
 <1594357499-29068-5-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKM1m2j15ncbcW0rp5fk6FmbJ20uWOYUC40+v9PG=Hu7yQ@mail.gmail.com>
 <CAEUhbmWxCMZG+kdyqeSBrJPRf0Jvb7a4AcADuFXpRwQ7fb8zDA@mail.gmail.com>
 <CAEUhbmVJ94QF3UyEZUwcn-2yS4M3tKR-KOb4xPwSCwf9uRs-ww@mail.gmail.com>
 <CAKmqyKNJA0_5Qsfe6FZXSgNydxSHRXQQtqk8nB6-kR-yNpFHCQ@mail.gmail.com>
 <CAEUhbmXzufivy-7Qm-Nr6j6U9ynGOUgzV7XjXYDL_Ewcm1oj_g@mail.gmail.com>
 <CAKmqyKN-Ez_fE6oBfczxsGVyyRpeEE8go0pB-C7i6a4SALj8uA@mail.gmail.com>
 <CAEUhbmX5rcMuD8F30wdgYrvUq6NU84t5o=VkgKqwvwyfmA9e+w@mail.gmail.com>
In-Reply-To: <CAEUhbmX5rcMuD8F30wdgYrvUq6NU84t5o=VkgKqwvwyfmA9e+w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Jul 2020 21:54:52 -0700
Message-ID: <CAKmqyKNDTOKeb+5h5NuJcYWMRoS24H=ski6Jau84uEEx46Ep9Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] hw/riscv: Use pre-built bios image of generic
 platform for virt & sifive_u
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 28, 2020 at 9:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Wed, Jul 29, 2020 at 2:26 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Jul 28, 2020 at 8:46 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Alistair,
> > >
> > > On Tue, Jul 28, 2020 at 11:39 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Wed, Jul 15, 2020 at 9:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > Hi Alistair,
> > > > >
> > > > > On Mon, Jul 13, 2020 at 9:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > >
> > > > > > On Sun, Jul 12, 2020 at 1:34 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jul 9, 2020 at 10:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > >
> > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > >
> > > > > > > > Update virt and sifive_u machines to use the opensbi fw_dynamic bios
> > > > > > > > image built for the generic FDT platform.
> > > > > > > >
> > > > > > > > Remove the out-of-date no longer used bios images.
> > > > > > > >
> > > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > >
> > > > > > > This patch seems to break 32-bit Linux boots on the sifive_u and virt machines.
> > > > > > >
> > > > > >
> > > > > > It looks only Linux boot on sifive_u is broken. On our side, we have
> > > > > > been using VxWorks to test 32-bit OpenSBI on sifive_u so this issue
> > > > > > gets unnoticed. I will take a look.
> > > > >
> > > > > I've figured out the issue of 32-bit Linux booting failure on
> > > > > sifive_u. A patch has been sent to Linux upstream:
> > > > > http://lists.infradead.org/pipermail/linux-riscv/2020-July/001213.html
> > > >
> > > > Thanks for that. What change in QEMU causes this failure though?
> > > >
> > >
> > > There is nothing wrong in QEMU.
> >
> > There is. This patch causes a regression for 32-bit Linux boot on the
> > sifive_u. Your v5 has not addressed this.
>
> The 32-bit Linux boot failure was fixed by:
> http://lists.infradead.org/pipermail/linux-riscv/2020-July/001213.html
>
> What additional issue did you see?
>
> >
> > With this patch, the Linux boot stops here:
> >
> > OpenSBI v0.8
> >    ____                    _____ ____ _____
> >   / __ \                  / ____|  _ \_   _|
> >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> >  | |__| | |_) |  __/ | | |____) | |_) || |_
> >   \____/| .__/ \___|_| |_|_____/|____/_____|
> >         | |
> >         |_|
> >
> > Platform Name       : SiFive HiFive Unleashed A00
> > Platform Features   : timer,mfdeleg
> > Platform HART Count : 4
> > Boot HART ID        : 3
> > Boot HART ISA       : rv64imafdcsu
>
> This is a 64-bit hardware.

You are right. It's not 32-bit, that was my mistake. I'm used to my
first test being 32-bit, but in this case it's not.

It looks like this commit instead breaks the sifive_u for 64-bit with
the 5.3 kernel.

>
> > BOOT HART Features  : pmp,scounteren,mcounteren
> > BOOT HART PMP Count : 16
> > Firmware Base       : 0x80000000
> > Firmware Size       : 116 KB
> > Runtime SBI Version : 0.2
> >
> > MIDELEG : 0x0000000000000222
> > MEDELEG : 0x000000000000b109
> > PMP0    : 0x0000000080000000-0x000000008001ffff (A)
> > PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
> > [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
> > [    0.000000] Linux version 5.3.0 (oe-user@oe-host) (gcc version
>
> It seems that you are using quite an old kernel. Can you please try
> the latest version?

It is an old kernel, but old kernels should still keep working (or we
should at least know why they don't)

>
> > 9.2.0 (GCC)) #1 SMP Thu Sep 19 18:34:52 UTC 2019
> > [    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
> > [    0.000000] printk: bootconsole [sbi0] enabled
> > [    0.000000] initrd not found or empty - disabling initrd
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000bfffffff]
> > [    0.000000]   Normal   empty
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000080200000-0x00000000bfffffff]
> > [    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000000bfffffff]
> > [    0.000000] OF: fdt: Invalid device tree blob header
> > [    0.000000] software IO TLB: mapped [mem 0xbb1fe000-0xbf1fe000] (64MB)
> >
> > Without this patch I can boot all the way to looking for a rootFS.
> >
> > Please don't send new versions of patches without addresses regressions.
>
> The patches were sent after addressing all regressions you reported
> (well the 32-bit Linux booting issue is actually not a QEMU
> regression, but one that exists in the Linux kernel side for a long
> time).

Yep, that is my mistake. Sorry about the confusion.

>
> I just tested 64-bit Linux boot on both virt and sifive_u, and they
> both can boot all the way to looking for a root fs.

Can you test with older kernels?

If we can't support older kernels with the default bios option we at
least need to know why and list that in the release notes.

Alistair

>
> Regards,
> Bin

