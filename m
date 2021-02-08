Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367A313F13
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:34:07 +0100 (CET)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CIQ-0003FK-8b
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97nw-00061E-Mq; Mon, 08 Feb 2021 09:46:22 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97nn-00065F-LN; Mon, 08 Feb 2021 09:46:19 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id i71so14794274ybg.7;
 Mon, 08 Feb 2021 06:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imDRYnZAzNCT9pBp9Ie6odVJ++x+poW2F27CZWJK/20=;
 b=TMRd44mpI4Ewt42B5PYBWwSGUDQxNOSwBZlF3AebmQ5ve27OKfjWdKlNTRGb54CXjY
 kLHYgVSOZAJ91ju/ysbPSM3x0WVJG/hHrgEAaKPn723b4Ix3UaIDIqG9YxXFDwXwq/St
 c0CiwchcE9/+AfpGKBCgdJBDBxfFA/4KnSzTk4Un7NF84JyM9+yx4VWrIal3oURFOj31
 CqX/5P6N2w0B7CZTZeHIU2x3tTmKc0ROgb1voPoSPoadgr/kH9WDqtIEnGz+7uLVjqMB
 cRHRnOu7rKz5KksVYR8bMgNgxxTYhJQhlwyOV+Ez5TwZVWNzdZpu9hpItcaAcbDU8mIs
 t8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imDRYnZAzNCT9pBp9Ie6odVJ++x+poW2F27CZWJK/20=;
 b=eiqZweKIdM5eT7/Pmr92JDemyMJkOfWC//LauLtbh5uaFaAdymK5m8A5P7e1bnVvQp
 DccXXIe5TaqA9Z4EYhQcgqepcuGvreHtAJ7QI5PebgXjNa2C2MHOohwp5MVWBasfVsfz
 rJTCQzLls+jJ6jFH6Qr30DH/nSbS78i5hhaUzl5zIXSfAy/K+Mf6ivOWXS6mR7SMuU30
 lIbrm2Xi8t3c7ZKur72XGUz2DhzTRrynPdV8IT4VZguNii2kjgs8gba4Z1+AM8WrY5jq
 +HsTaC4rSNPqiPtYty7C8x3bAsBaFlHznHHsfQsUf1kb2N5qwst/0uvqwvtXaYw1kYxH
 +2Cw==
X-Gm-Message-State: AOAM531LXV0P+THRXTFj3I0rIhRQSohLbu1T9IVCLYmldWB5nWYUZqYA
 m13qrzTDBqn82CiSaK5gALat0D4hvrtxCFA4loU=
X-Google-Smtp-Source: ABdhPJzT4XJ2kPiZ+g2rBWPrwdLLcVmaTXCvi/guNRueIO6yZ1aDIWjkCRO47oJ6hfEW90n1i+JXgvDjTCYUA3eHOVo=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr26879364ybc.152.1612795559313; 
 Mon, 08 Feb 2021 06:45:59 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
In-Reply-To: <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:45:47 +0800
Message-ID: <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
 francisco.iglesias@xilinx.com, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
>
>
> On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
>>
>> Hi Edgar,
>>
>> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>> >
>> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
>> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > >
>> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
>> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
>> > > crash. This is observed when testing VxWorks 7.
>> > >
>> > > Add a basic implementation of QSPI DMA functionality.
>> > >
>> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >
>> > + Francisco
>> >
>> > Hi,
>> >
>> > Like Peter commented on the previous version, the DMA unit is actully separate.
>>
>> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
>> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
>> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
>> different like a DMA engine in a ethernet controller.
>
>
> Yes, it's a separate module.
>
>>
>> > This module is better modelled by pushing data through the Stream framework
>> > into the DMA. The DMA model is not upstream but can be found here:
>> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
>> >
>>
>> What's the benefit of modeling it using the stream framework?
>
>
>
> Because it matches real hw and this particular dma exists in various instances, not only in qspi. We don't want duplicate implementations of the same dma.
>

Would you please share more details, like what other peripherals are
using this same DMA model?

Regards,
Bin

