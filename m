Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E130B2311B2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 20:28:45 +0200 (CEST)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0ULF-0005R0-0O
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 14:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0UK1-0004MA-V7; Tue, 28 Jul 2020 14:27:29 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:38101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0UK0-0003rO-Ge; Tue, 28 Jul 2020 14:27:29 -0400
Received: by mail-il1-x141.google.com with SMTP id s21so17050668ilk.5;
 Tue, 28 Jul 2020 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vb4E8Ar/tj0qituhsZw5eVTgCjglCgcIHUwdXgf2byM=;
 b=n53rAr51xJGTuRMPkneiBooSXj9CIthEAhgQDG86eL56nByhA3vRtg6oQ5ScwlTA7Y
 1K1WL1QktLSojPlfl5ut5N/27JkH8iYXFNQXKSy8ApaFwBEV5cdq9wldyzjx98J3HW24
 1qWgKqwf7on/4K/9Z1nuBnA5wg479KAvymvPkG95kWbiRnFhmt5DEszRI5TqFj2bsvDP
 gPEmryCBGhkfo5EWdp2DbPctsFHQZw70SDMmVH75zhndIR57nHeTISBmc5YNqYCeDX2v
 vsWUiwuDGxRYzaBJTRBxrImAJix4JAshD25MIcRhwl54xxDVoaEOwVYVyJ6r2a5WcJsj
 zuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vb4E8Ar/tj0qituhsZw5eVTgCjglCgcIHUwdXgf2byM=;
 b=Wj/GwoDhE1UwoUhEzwpYOm0mochHNMazoyOuwl8sC+p+OykfKZdD+tTbLajnBgFwMK
 ZRudOYOUeFZbqUmwqK9DlyotvfC2OMEblFadUyQrh4m/8ZZHGJzytrpracP6Ok/t3O/7
 XG/S0mPR1mxRBg9/msLumcDcc21RN7H4AxAopdfTkjiKpqRzUzavEt62yzRKnNOdm0xl
 2HnwNTArrtfSF1IgHTGu07f3/IlgEt0SFm6ks1CcAf0mR790A8LfCAjTUlMv2wyAM8La
 H0zpOjOG9JxLrWmfmPgAqJr4+pm+SAEkj8MBib9ATIRcaRZyQvcxvqgHrEdJkv/y4fxF
 j3yA==
X-Gm-Message-State: AOAM531NmcmLTVCknJ3HOthwiGkxoeQIeoH7WX6OXJxJBjPinMpd4bIi
 8SOKq0w0jiSr3RsEJrWzs7x8RQWHNhC8QzxHVH8=
X-Google-Smtp-Source: ABdhPJxDxIyEXaE1mQd1enqxmEE7wEUP3ybu4vhM9L5/C18i7GjKjr1uaZy5ZGBadNFeglpk9zwTx8uwD17MiGDz+sg=
X-Received: by 2002:a92:bb84:: with SMTP id x4mr31172539ilk.177.1595960847006; 
 Tue, 28 Jul 2020 11:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <1594878971-26050-1-git-send-email-bmeng.cn@gmail.com>
 <1594878971-26050-8-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOFXGbW3ubNc4RHOh_4ujDSqKS_3GGMnyno2S7gDL-+Ow@mail.gmail.com>
 <CAEUhbmV4VNPax7GmowsT6Jc+d5-qtqi9bOXymn9XKC9SdsuhcQ@mail.gmail.com>
In-Reply-To: <CAEUhbmV4VNPax7GmowsT6Jc+d5-qtqi9bOXymn9XKC9SdsuhcQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Jul 2020 11:17:10 -0700
Message-ID: <CAKmqyKNqBadLdA3MR4bowfuE01VYHzwVJA=HVhuUM-W+rcXP9Q@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] Makefile: Ship the generic platform bios ELF
 images for RISC-V
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jul 28, 2020 at 8:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Tue, Jul 28, 2020 at 11:37 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Jul 15, 2020 at 11:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present only the generic platform fw_dynamic bios BIN images
> > > are included in the 'make install' target for 'virt' and 'sifive_u'
> > > machines. This updates the install blob list to include ELF images
> > > which are needed by the 'spike' machine.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > This commit should be squashed into patch 5.
>
> I actually considered this before, and I was thinking that patch 5 is
> only for "fixing" the missing binaries for Spike machine, and this
> patch addresses the "make install" issue, hence separate patch.

Patch 5 creates the issue though, so I think it is worth fixing there.

>
> >
> > Do you want me to do that when applying?
>
> Sure, please do then if you feel this is the correct way.

This series still has regressions, so when you send a new version
please squash this patch.

Alistair

>
> Regards,
> Bin

