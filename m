Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71037248685
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 15:56:31 +0200 (CEST)
Received: from localhost ([::1]:44352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k826H-0003zq-RN
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 09:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1k825V-0003HY-9u
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:55:41 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1k825R-0005Mo-Sm
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:55:41 -0400
Received: by mail-wm1-x342.google.com with SMTP id c80so16305760wme.0
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Jx9fgh4HAjmM8oiGC/Kx2mJQVPexJyHPpm+nMaUXSU=;
 b=odhoYXQYG9Jrem+qNFG9QZPLTXdlifnah+AiUOzB3YTkVqUEsWTMpUPvJBUI0qn0Hd
 xQU3OsqAUk0EomZlPPAoWGrGsRNarnjljYuHE7mZi2orv+FLvA+4eey6TfyqNXsVbDEI
 te7jdUAFG4eVIqyOR4hDmFtHqGJPpCFG1H1F3RG/v2TWefImYrBgeTFP3H2lXPdTSaIl
 3XZxsTgq8W+dSBIYicxgNxcADBZqMAQQAglN85Uoko/JkNbsHE6GzXfqpkhTPruZqaU6
 89/DEKxHBbUfOTQYGgKnbvWTNlAvk2TB0ZqCrXLvPbqdV432t6DzphgKTG+H2ewfwOYe
 n7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Jx9fgh4HAjmM8oiGC/Kx2mJQVPexJyHPpm+nMaUXSU=;
 b=tkJ17BtpFl2FbrN2URg4nQyQQ2Xnsk++e7qedb8gJOO9NegURlvOYgd4iFoYoNhXeW
 9VhzorCx4k9AUbNAQ7zuBC1ZceX4iFB0MS4+fZi4OSPr9toQ2jXrLU25njFxRpHHFQIN
 WPhhTcz2QEH0V0r+Iw+PGzXMbmShqXiLC1T6xcPvc/KqxtqvIURXKLtOGeBFD064tBOO
 rz1rm8d+WSLlq3RmNmrArR1Fbp5lV9qAcqJJ/l8nh6BlFeYV5bSct8JFsjhC+CzdOx59
 wEbVEXX00/Pn2XqFYd6NoA/HipBBok9YpUW40nsKIbYi2FU8y1JpB0S+eyZNH4XQ4T+2
 HHiw==
X-Gm-Message-State: AOAM533iSIxPS0tSzcWQHZKwhYF8OxULg86pghUBlVIEAhRuCjig3W7p
 LkvyrzFjxPWjT/eOJmIEkZ7ccgE7Wj1FEG9LqTsKtw==
X-Google-Smtp-Source: ABdhPJzaFOAveoYbEKpl25MD/FsYU/ZG0vEt4bTjc47r5ym/l3ic0jG4uLsysuKfzMF0yUsVAPG5UbWMLXfGkl+EmZ4=
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr25496wmk.185.1597758935937;
 Tue, 18 Aug 2020 06:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <CAAhSdy2D=TcENAJDja4r6pnhz0LRi-T+A9k3Btrs_EuB4x0e4w@mail.gmail.com>
 <CAEUhbmV5=B5xKhYqMj1MQb61nt5cNUJG1MXT++C1w1YMYTfLCQ@mail.gmail.com>
 <202949f7-c9d5-4d4d-3ebe-53727f4fa169@microchip.com>
 <CAKmqyKM3nm0rhxgDvWKWfO+4b23ZLSkHW2TzmcVZ_ZFy4L7MRg@mail.gmail.com>
 <d3f61c2c-a489-887e-0143-4d9a1e66e6f2@microchip.com>
 <CAAhSdy32owLO0KytyYsg-zH6JyyfNfGofa4vanqTFJLntPq0=g@mail.gmail.com>
 <1f17cc4c-83f8-a024-ebef-79e28fab9a32@microchip.com>
In-Reply-To: <1f17cc4c-83f8-a024-ebef-79e28fab9a32@microchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Aug 2020 19:25:24 +0530
Message-ID: <CAAhSdy1MTvjfpHZEAs2YVHXdPBaEMQxUNdP_yc7br0C2p9kfng@mail.gmail.com>
Subject: Re: [PATCH 00/18] hw/riscv: Add Microchip PolarFire SoC Icicle Kit
 board support
To: Cyril.Jean@microchip.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-block@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 18, 2020 at 6:39 PM <Cyril.Jean@microchip.com> wrote:
>
> On 8/18/20 7:17 AM, Anup Patel wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Tue, Aug 18, 2020 at 1:23 AM <Cyril.Jean@microchip.com> wrote:
> >> On 8/17/20 8:28 PM, Alistair Francis wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On Mon, Aug 17, 2020 at 11:12 AM via <qemu-devel@nongnu.org> wrote:
> >>>> Hi Anup,
> >>>>
> >>>> On 8/17/20 11:30 AM, Bin Meng wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>>
> >>>>> Hi Anup,
> >>>>>
> >>>>> On Sat, Aug 15, 2020 at 1:44 AM Anup Patel <anup@brainfault.org> wrote:
> >>>>>> On Fri, Aug 14, 2020 at 10:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>>>> From: Bin Meng <bin.meng@windriver.com>
> >>>>>>>
> >>>>>>> This adds support for Microchip PolarFire SoC Icicle Kit board.
> >>>>>>> The Icicle Kit board integrates a PolarFire SoC, with one SiFive's
> >>>>>>> E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> >>>>>> Nice Work !!! This is very helpful.
> >>>>> Thanks!
> >>>>>
> >>>>>> The Microchip HSS is quite convoluted. It has:
> >>>>>> 1. DDR Init
> >>>>>> 2. Boot device support
> >>>>>> 3. SBI support using OpenSBI as library
> >>>>>> 4. Simple TEE support
> >>>>>>
> >>>>>> I think point 1) and 2) above should be part of U-Boot SPL.
> >>>>>> The point 3) can be OpenSBI FW_DYNAMIC.
> >>>>>>
> >>>>>> Lastly,for point 4), we are working on a new OpenSBI feature using
> >>>>>> which we can run independent Secure OS and Non-Secure OS using
> >>>>>> U-Boot_SPL+OpenSBI (for both SiFive Unleashed and Microchip
> >>>>>> PolarFire).
> >>>>>>
> >>>>>> Do you have plans for adding U-Boot SPL support for this board ??
> >>>>> + Cyril Jean from Microchip
> >>>>>
> >>>>> I will have to leave this question to Cyril to comment.
> >>>>>
> >>>> I currently do not have a plan to support U-Boot SPL. The idea of the
> >>>> HSS is to contain all the silicon specific initialization and
> >>>> configuration code within the HSS before jumping to U-Boot S-mode. I
> >>>> would rather keep all this within the HSS for the time being. I would
> >>>> wait until we reach production silicon before attempting to move this to
> >>>> U-Boot SPL as the HSS is likely to contain some opaque silicon related
> >>>> changes for another while.
> >>> That is unfortunate, a lot of work has gone into making the boot flow
> >>> simple and easy to use.
> >>>
> >>> QEMU now includes OpenSBI by default to make it easy for users to boot
> >>> Linux. The Icicle Kit board is now the most difficult QEMU board to
> >>> boot Linux on. Not to mention it makes it hard to impossible to
> >>> support it in standard tool flows such as meta-riscv.
> >>>
> >>> Alistair
> >> If it is such a problem we can add a U-Boot SPL stage and the HSS can be
> >> treated as standard SoC ROM code.
> > It's not mandatory for U-Boot SPL to have stable DRAM calibration settings
> > from the start itself. The initial U-Boot SPL support for most
> > platforms (accross
> > architectures) usually include basic working DRAM calibration settings which
> > is later on updated with separate patches. Also, we don't need all U-Boot
> > drivers to be upstreamed in one-go as this can be done in phases.
> >
> > The advantage we have with PolarFire SoC Icicle board is that we already
> > have a U-Boot S-mode. and we believe the OpenSBI generic platform will
> > work fine for PolarFire SoC Icicle board so the only thing missing right now
> > is the U-Boot SPL support for OpenSource boot-flow.
> >
> > It will certainly accelerate open-source development if we have boot-flow
> > U-Boot_SPL => OpenSBI (FW_DYNAMIC) => U-Boot_S-mode working
> > on PolarFire SoC Icicle board. Initially, we just need DRAM, SD/eMMC,
> > and Serial port support for U-Boot SPL and U-Boot S-mode. Later on,
> > more patches can add ethernet and other booting device drivers to U-Boot.
> >
> > Regarding security services of HSS, we are working on a OpenSBI
> > feature which will allow HSS security services to run as independent
> > binary in M-mode (not linked to OpenSBI) and OpenSBI FW_DYNAMIC
> > will be a separate binary acting as a secure monitor.
> >
> > Regards,
> > Anup
>
> What I have in mind is that the external memory will be up and running
> by the time we get to U-Boot SPL. In the case of PolarFire SoC the ROM
> code equivalent brings up the DDR memory interface so we do not need to
> worry about this as part of U-Boot.

Keeping DRAM configuration as part of a separate ROM booting stage prior
to the U-Boot SPL sounds good to me. This will lead to following boot-flow:

ROM/HSS (M-mode) => U-Boot SPL (M-mode) => OpenSBI (M-mode) => U-Boot S-mode

>
> Sounds to me the component that needs to be upstreamed next is the eMMC
> support so that it can be used as part of U-Boot SPL. Correct?

Maybe as a PHASE1 patch series for PolarFire U-Boot support can
target the following:
1. Minimal U-Boot board support for PolarFire IcIcle Board with
single defconfig to build both U-Boot SPL and U-Boot S-mode
2. Serial port driver (probably re-use existing driver)
3. SD and eMMC driver

Supporting SD booting is highly desirable for PHASE1. At least,
U-Boot SPL, OpenSBI, U-Boot S-mode, and Linux should come
as separate images from SD card. The ROM/HSS can reside and
boot from on-board flash/eMMC.

Above is my suggestion based on experience with SiFive Unleashed.

The general idea behind OpenSource boot-flow is to have each
booting stage as a separate binary so that users can selectively
upgrade a particular booting stage without re-compiling/re-flashing
other booting stages.

Various distros and yocto already support building most of the above
booting stages (U-Boot, OpenSBI, Linux, etc) so we can reuse a lot
of existing work. Eventually, I am confident we will endup moving
more stuff from ROM/HSS to U-Boot SPL for ease in maintenance.

Regards,
Anup

