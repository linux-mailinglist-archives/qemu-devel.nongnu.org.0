Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC442E7D45
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 00:53:59 +0100 (CET)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kulHz-0002w4-0T
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 18:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulG2-0001hx-Vt; Wed, 30 Dec 2020 18:51:58 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulG1-0000jK-Kz; Wed, 30 Dec 2020 18:51:58 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id b64so16124113ybg.7;
 Wed, 30 Dec 2020 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch9dMvJAly31qPYDTMI0/mfe9iwL1UOe3tkM/DKTReU=;
 b=It2CERa+gZ5wnRkLg9BhsAUwadnBvv5bEjfefbuR7WHJXTiOwm0JW9bcfiMQ2XOeKp
 TK8QTpgbzX1Y0/FzTQWIWnHZUneIKWcxb11Ekycu1PjOS5YIxm/9hGN12tvwzXLfLK1N
 r1tYckK1bk7GA638qvQ8ki0+ianZIWByLSIEGwW1uTuDqWDSL6y2PhLA61U4NK2WhiSK
 fE7Gqw4kxOoffqn6FjKw/zCxxv2ME04DSYVvY9beMCrGCQDvB2836PVk3L3RoqCn879B
 AebrBYSQA9MZ68TyzPPJnf0wEpx35VPLBhnsk00ogx4uQ6C4mAiLJdcJ/tTJfpjjZdEu
 U4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch9dMvJAly31qPYDTMI0/mfe9iwL1UOe3tkM/DKTReU=;
 b=Dnk7CIXWqiIQy1ej/pNNhSLoFNtCa28zY20tWIhQBx7RzoVO5WOmsp9BP2dCQCSBt2
 G1AX4rJ44v5sAhcPbcvPyEbpR3UGqX3onQzPCJDIAQ7k3NImU6BEl2uuWuzK/LAFanNP
 yOxeGJEpmsSqNmYkEPF6TxlBqSx7rBsfoyR1Om9kDNd5RejJ1xFLhbW2JwR5jm3S9xYA
 867kktYrNGMp4sAo3oVzGNsfRgcufVOWZaITzw2A08G7aMVa+q3c+bCaA35jJTt+VEv/
 eoCtFmnYGPBzEQE0CP+dOA67Cn6JRasJdb8wYXTU8HopdD9V1KmhOt12x97TiHNSpukM
 Y3Mg==
X-Gm-Message-State: AOAM530l4t6DNzxVtlymGQTxen4mkT1lUqOw4AX0fDt0Bz+Skm8HWAk0
 eXsOLzLfwiqziEpsE5aNAITnMl4+3ZNZTIGyVM0=
X-Google-Smtp-Source: ABdhPJzZOTFAQa9UPR6sy/BnFC1JVtdj/lDJoskjtTUS0MoPsPvR2U2hbL4LVj4mY5jNEVH/08T6fnkcT/enowP4TO0=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr81419046ybs.122.1609372316416; 
 Wed, 30 Dec 2020 15:51:56 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmXV+e3L0RtmC+qfzoY8wVWPwHXY9ZcBZ=e7RMZ_smuMkw@mail.gmail.com>
In-Reply-To: <CAEUhbmXV+e3L0RtmC+qfzoY8wVWPwHXY9ZcBZ=e7RMZ_smuMkw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 31 Dec 2020 07:51:45 +0800
Message-ID: <CAEUhbmWcjrNie2uwq1SWb1dOZsi9wD+ScLVm+vQeBTK_F_Lagw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 22, 2020 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 1:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:
> >
> > 0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
> > 0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.
> >
> > Current logic uses either s->burst_length or 32, whichever smaller,
> > to determine how many bits it should read from the tx fifo each time.
> > For example, for a 48 bit burst length, current logic transfers the
> > first 32 bit from the first word in the tx fifo, followed by a 16
> > bit from the second word in the tx fifo, which is wrong. The correct
> > logic should be: transfer the first 16 bit from the first word in
> > the tx fifo, followed by a 32 bit from the second word in the tx fifo.
> >
> > With this change, SPI flash can be successfully probed by U-Boot on
> > imx6 sabrelite board.
> >
> >   => sf probe
> >   SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB
> >
> > Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/ssi/imx_spi.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>
> Ping?

Ping?

