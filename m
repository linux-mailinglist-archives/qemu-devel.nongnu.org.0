Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A776E8970
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 14:27:33 +0100 (CET)
Received: from localhost ([::1]:56880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPRX1-0004Pr-V4
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 09:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iPRUy-0002Wg-7l
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 09:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iPRUw-00071o-0G
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 09:25:23 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:33345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iPRUt-00070E-9d; Tue, 29 Oct 2019 09:25:19 -0400
Received: by mail-lj1-x242.google.com with SMTP id t5so7434048ljk.0;
 Tue, 29 Oct 2019 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tg/r3g2zVMvHDV0jcIg3a709gbA5NPrFDTOpzHBbLLc=;
 b=crqaGqY/68L3RiLj2L3R6MQA4PUvaO0Q10JGL7gxmEzAFZM04B1RojYvAI8rMV0Dac
 UDmFe35RO8mf2ZKqfdhLTpc8QALIKMt4Eyp9WsK3y9StEqw9EYlC4T4PC6+1A+cDCIXC
 G450Xup+taJJWLP9/CxlqElNmz7CJPaFEX2JhfcjeM4L6ow4jefu8Gdm/WVk8q2pan6Z
 TmL1f+/sNyTzfNuFxnWJJSUahzZ4GGCYe/FYn59ZwgRgOyPdihizPyXn400JttWDQDct
 YbTP392diY4lSk4eH4QDMxn7q+aIsQdg/4CJF4WuoYGhi7i2DtAlf6CcJS9r+f8w1kfs
 P59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tg/r3g2zVMvHDV0jcIg3a709gbA5NPrFDTOpzHBbLLc=;
 b=k/oMld/T/8hOrQ1vu9v9jJnEJDxBAsAYFRE7VON2FzNMxxqBYurLnF/sivDyixgRDS
 tFUuR2PsX6aXKMjE9S4yaxqDPsOl1xlsjrWqnTbwx6fCijuOXWvCKZYfbckO1Vh+epIB
 bt8m6sSQsevDOUsWWVClB10o3+jGrQQB2nrUKvPWIL65WBa9DSxWCA4W8bLxJx2YfgGF
 7ynkuO1gWvJd9jD+X+pdH5K6xf83RNDiwfIO5Ti6E0ggxe6am4LrPy7er7B0FhihtqwJ
 Qa+bsrnoWqkSMv7R0So4chEp2ZmKWeWV60PWaeKdCDnjke5an+fC/t42YIPXHCXSQfsm
 Eucw==
X-Gm-Message-State: APjAAAWNdNoQ7Npd9VOR901UgR1aUfM06jSeHcucqPok3wePXteaBoiI
 yENeI1JoLJMeqjR8ndRIHFKCG6nkld/7Y9+AzAc=
X-Google-Smtp-Source: APXvYqwMjbdhdJwlGca6cDVqUZcc0MC7e6HXDMjnRSi57azLi03G2Z6XdhMrO936lJhdjZMKfa4y53VgkaYlSfTPlDs=
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr2815554ljn.4.1572355517867;
 Tue, 29 Oct 2019 06:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191025042734.69244-1-anup.patel@wdc.com>
In-Reply-To: <20191025042734.69244-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 29 Oct 2019 14:24:50 +0100
Message-ID: <CAKmqyKMQz-OMFQRTdmpBpGMLiZ_ZM+UL5T5aAWZ5F1fC6vddOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RTC support for QEMU RISC-V virt machine
To: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 25, 2019 at 6:28 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> This series adds RTC device to QEMU RISC-V virt machine. We have
> selected Goldfish RTC device model for this. It's a pretty simple
> synthetic device with few MMIO registers and no dependency external
> clock. The driver for Goldfish RTC is already available in Linux so
> we just need to enable it in Kconfig for RISCV and also update Linux
> defconfigs.
>
> We have tested this series with Linux-5.4-rc4 plus defconfig changes
> available in 'goldfish_rtc_v2' branch of:
> https://github.com/avpatel/linux.git

@Peter Maydell this has been reviewed, do you mind taking this in you
next PR? I don't see a maintainer for hw/rtc.

Alistair

>
> Changes since v4:
>  - Fixed typo in trace event usage
>  - Moved goldfish_rtc.h to correct location
>
> Changes since v3:
>  - Address all nit comments from Alistair
>
> Changes since v2:
>  - Rebased on RTC code refactoring
>
> Changes since v1:
>  - Implemented VMState save/restore callbacks
>
> Anup Patel (2):
>   hw: rtc: Add Goldfish RTC device
>   riscv: virt: Use Goldfish RTC device
>
>  hw/riscv/Kconfig              |   1 +
>  hw/riscv/virt.c               |  15 ++
>  hw/rtc/Kconfig                |   3 +
>  hw/rtc/Makefile.objs          |   1 +
>  hw/rtc/goldfish_rtc.c         | 288 ++++++++++++++++++++++++++++++++++
>  hw/rtc/trace-events           |   4 +
>  include/hw/riscv/virt.h       |   2 +
>  include/hw/rtc/goldfish_rtc.h |  46 ++++++
>  8 files changed, 360 insertions(+)
>  create mode 100644 hw/rtc/goldfish_rtc.c
>  create mode 100644 include/hw/rtc/goldfish_rtc.h
>
> --
> 2.17.1
>

