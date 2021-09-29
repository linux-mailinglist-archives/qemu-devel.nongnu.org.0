Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB46F41BE38
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 06:27:13 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVRBY-0007P1-Ma
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 00:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mVRAS-0006GT-2k
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 00:26:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mVRAQ-00021x-75
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 00:26:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so4123260wmc.0
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 21:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwpMPM8E4nCsumnueWN5AOA2wjelAJqKY9zEtfMhRVQ=;
 b=RoduxWgxE0QMtCvrkrJ2hSAuPfftGrB9ROIw3zh0pWgEWEXtfW5klPZMD27Jkc8x6y
 NAxZc1SvuLkeyHKfvHQoCGAl4LbP2kSfWYOlAcysD2vFS72KcMIgA1hI+HtsIU8DzlCN
 V0zTCWH9RLK8Y6PfUTyDnUmNDgs44gopNJbBOtEHMZetlJPWpTnrBWuyKHKeNr0uCbdv
 HD9jb470FY0BsrRdDMrvUEXtehQmMquYWRvvFAD4PoIBKgXJorp0z2haJOnp/480YILB
 HQKkQz0hvubp952f0b7dh5pqVFjjRa0sX8VgkwiMALhSql4X1aB4PKwG6/+mHsKJb1Cp
 xOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwpMPM8E4nCsumnueWN5AOA2wjelAJqKY9zEtfMhRVQ=;
 b=BMoW32ke1B0jES+Yo7Ll3mt3tkD7cxHRxeSql5w1BiSaSCpkmPnH72sX+FMKMeQc3c
 Gip4LWKrv9HkKyThOjENs5xim53nY/8r32cspIQx0EfqJ7EJTT8xEdnTsDASEGEtfiQa
 mKmER3BMmuhEv2vlMq2GuJm8sSqx9HS9n0Xpjrqknvl7TyM3r6djtFI7FLBydAU2HWED
 IU0l3HE7QxJ8zfnVzSBSOsGdagwxsQkNQD27ksEObzlW3No3OGUfVg8ihXjOSPt6QZzK
 Eo5MimaUCjXj82C8IJ1nc0E4+HK+OZlJebUAGOiT5edasG4VdZCBWfKSsVdbxR2FGG8H
 kmEA==
X-Gm-Message-State: AOAM533C3/ani9cIF35IMWXrQVsTS36Xt90Dy+ywSP/+gxdSslRGcrys
 ryudu0uHmqGWKU2R4Hpovniwp0Sr2FIy8iAuLeiI6A==
X-Google-Smtp-Source: ABdhPJxepUCUSM3tnFLkF7RWXaEkE8iWDmH0XwYV6S22sVa31fnKynDMBA1g9Hix4uoRU1KQJmO3EVm+dDOI6rYX3Ps=
X-Received: by 2002:a7b:c753:: with SMTP id w19mr3991361wmk.61.1632889560682; 
 Tue, 28 Sep 2021 21:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110603.338681-1-anup.patel@wdc.com>
 <CAAhSdy1FdqtY6ubuK3SMqJk8Wb2Bbu26QhR6TMoDZqo=uZzVyg@mail.gmail.com>
 <CAKmqyKO9P_rOhfd8g+r3yBJ-s76QckLQhRsub6DwTrxQB2gQ7Q@mail.gmail.com>
In-Reply-To: <CAKmqyKO9P_rOhfd8g+r3yBJ-s76QckLQhRsub6DwTrxQB2gQ7Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Sep 2021 09:55:48 +0530
Message-ID: <CAAhSdy3cht8MWGyEuHR2M=pZYjOwfaJwb=j7BU66RHybrfgwTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] QEMU RISC-V ACLINT Support
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::329;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x329.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 9:52 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Sep 29, 2021 at 2:09 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Aug 31, 2021 at 4:36 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
> > > over the SiFive CLINT but also maintains backward compatibility with
> > > the SiFive CLINT.
> > >
> > > Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
> > > https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> > >
> > > This series:
> > > 1) Replaces SiFive CLINT implementation with RISC-V ACLINT
> > > 2) Refactors RISC-V virt machine FDT generation
> > > 3) Adds optional full ACLINT support in QEMU RISC-V virt machine
> > >
> > > This series can be found in the riscv_aclint_v4 branch at:
> > > https://github.com/avpatel/qemu.git
> > >
> > > Changes since v3:
> > >  - Rebased on Alistair's CPU GPIO pins v3 series
> > >  - Replaced error_report() in PATCH2 with qemu_log_mask()
> > >
> > > Changes since v2:
> > >  - Addresed nit comments in PATCH2
> > >  - Update SSWI device emulation to match final ACLINT draft specification
> > >
> > > Changes since v1:
> > >  - Split PATCH1 into two patches where one patch renames CLINT sources
> > >    and another patch updates the implementation
> > >  - Addressed comments from Alistar and Bin
> > >
> > > Anup Patel (4):
> > >   hw/intc: Rename sifive_clint sources to riscv_aclint sources
> > >   hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
> > >   hw/riscv: virt: Re-factor FDT generation
> > >   hw/riscv: virt: Add optional ACLINT support to virt machine
> > >
> > >  docs/system/riscv/virt.rst     |  10 +
> > >  hw/intc/Kconfig                |   2 +-
> > >  hw/intc/meson.build            |   2 +-
> > >  hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++
> > >  hw/intc/sifive_clint.c         | 315 ----------------
> > >  hw/riscv/Kconfig               |  12 +-
> > >  hw/riscv/microchip_pfsoc.c     |  11 +-
> > >  hw/riscv/shakti_c.c            |  13 +-
> > >  hw/riscv/sifive_e.c            |  13 +-
> > >  hw/riscv/sifive_u.c            |  11 +-
> > >  hw/riscv/spike.c               |  16 +-
> > >  hw/riscv/virt.c                | 652 ++++++++++++++++++++++-----------
> > >  include/hw/intc/riscv_aclint.h |  80 ++++
> > >  include/hw/intc/sifive_clint.h |  62 ----
> > >  include/hw/riscv/virt.h        |   2 +
> > >  15 files changed, 1047 insertions(+), 614 deletions(-)
> > >  create mode 100644 hw/intc/riscv_aclint.c
> > >  delete mode 100644 hw/intc/sifive_clint.c
> > >  create mode 100644 include/hw/intc/riscv_aclint.h
> > >  delete mode 100644 include/hw/intc/sifive_clint.h
> > >
> > > --
> > > 2.25.1
> > >
> >
> > Ping ??
>
> Sorry, it looks like I forgot to reply indicating the status. This has
> been merged into master

Cool, thanks.

Regards,
Anup

>
> Alistair
>
> >
> > Regards,
> > Anup
> >

