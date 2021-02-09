Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29082314662
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 03:32:59 +0100 (CET)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ipl-0004Ha-Nk
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 21:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Inj-0003AB-BB; Mon, 08 Feb 2021 21:30:51 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Inh-0004ZO-Ji; Mon, 08 Feb 2021 21:30:51 -0500
Received: by mail-yb1-xb29.google.com with SMTP id b187so16663035ybg.9;
 Mon, 08 Feb 2021 18:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=whUhywCRSO8xmFomhniK907UoqTw68Kowc8+zndhjtI=;
 b=aWHhwo+tAWSTpnV2DjGhbpazopm/bc/GhmPdd3njquGunhcehnBMDwvF6CEbWeOs4c
 a7gmJfU8yU45DecSX7c9HS6YOSegeNwTF1qQuTyPIdweDBR49/6RGuQywdin9+pfRdwh
 kZ4HFnecMBGZ1e0g6zK9hgzgMoR7JLfdvT4gmtcOPcCNU2nRmUYd52uN+zoTX6cxzqQP
 XxlytZu+QYK+t33z4i9HZytwys1vlEDg4w06i6OpeWeHRtNf0WAvKjX0U6JoIcTVxFYl
 W2W8ovKXxebcqHBEx75Dlq5n+4wpgfbbAV6c62HfnpuwdIFGrz72364a6EAfTIGXBNwu
 ynlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whUhywCRSO8xmFomhniK907UoqTw68Kowc8+zndhjtI=;
 b=EOrVBLb8khYszTPR4an4ea0RpcHaWFg9OR1yvv7eA6ZpcVRSnRL1wn8uEc6WFXzbgw
 yONstgPba+Mbc48el7a0X+RU3fl6yRbkP3vlTGyBS62qH46lcviseeLaGBG9TEneX/pG
 DyVqeFocycvl8daYOG7zv+OGHbYH6zaUSdJ8d45bcZhhSNIfg1wuKh1eOUWhVzmnuM/T
 90G0KdwIUkOXi4pU7aVey0FGjJfeS1o7xYF42xJb5iTWp8lFGhCKQL7rNwPbbcvc8l4R
 jur4ZaRtNCsp0+AfVK6IeXecW7K6STBGNbEJtx/r3HFQWuB+c5j0O2NENDmujTJGhW+e
 7hlQ==
X-Gm-Message-State: AOAM53195NjrxH7kvy0AGEz3AHUXTLEBvRq8lGrz27Dvj0SCFAQwe1nL
 QlcQibekPQSFJSgf03WhlB6lnXcBP6Wuxengpkc=
X-Google-Smtp-Source: ABdhPJwB7DxNi2qUYhF/EMQoCWVy22Ac8uk/Q+uNNyYl4DQKVNMu4t9p8AJ9zOZl11C64yXUmievXgebEKns04obtow=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr28711179ybp.314.1612837848016; 
 Mon, 08 Feb 2021 18:30:48 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
 <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
 <CAJy5ezqPC365CAjzMmAfSyKw9uL+ur48bD4=WmMQWHA+_fCE=A@mail.gmail.com>
In-Reply-To: <CAJy5ezqPC365CAjzMmAfSyKw9uL+ur48bD4=WmMQWHA+_fCE=A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 10:30:36 +0800
Message-ID: <CAEUhbmUfwOwkcLhW9X0R46rAX3R7ygu2osgCqmuY0cne706MtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On Mon, Feb 8, 2021 at 11:17 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
>
>
> On Mon, Feb 8, 2021 at 3:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> Hi Edgar,
>>
>> On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>> >
>> >
>> >
>> > On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
>> >>
>> >> Hi Edgar,
>> >>
>> >> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
>> >> <edgar.iglesias@gmail.com> wrote:
>> >> >
>> >> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
>> >> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >> > >
>> >> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
>> >> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
>> >> > > crash. This is observed when testing VxWorks 7.
>> >> > >
>> >> > > Add a basic implementation of QSPI DMA functionality.
>> >> > >
>> >> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >> >
>> >> > + Francisco
>> >> >
>> >> > Hi,
>> >> >
>> >> > Like Peter commented on the previous version, the DMA unit is actully separate.
>> >>
>> >> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
>> >> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
>> >> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
>> >> different like a DMA engine in a ethernet controller.
>> >
>> >
>> > Yes, it's a separate module.
>> >
>> >>
>> >> > This module is better modelled by pushing data through the Stream framework
>> >> > into the DMA. The DMA model is not upstream but can be found here:
>> >> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
>> >> >
>> >>
>> >> What's the benefit of modeling it using the stream framework?
>> >
>> >
>> >
>> > Because it matches real hw and this particular dma exists in various instances, not only in qspi. We don't want duplicate implementations of the same dma.
>> >
>>
>> Would you please share more details, like what other peripherals are
>> using this same DMA model?
>>
>
> It's used by the Crypto blocks (SHA, AES) and by the bitstream programming blocks on the ZynqMP.
> In Versal there's the same plus some additional uses of this DMA...

Sigh, it's not obvious from the ZynqMP datasheet. Indeed the crypto
blocks seem to be using the same IP that QSPI uses for its DMA mode.
With that additional information, I agree modeling the DMA as a
separate model makes sense.

Will investigate the Xilinx fork, and report back.

Regards,
Bin

