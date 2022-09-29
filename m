Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D45EFB1D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:42:58 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwcj-00082s-5m
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvsR-0004eU-3b
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:55:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvsP-0004Ao-4L
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:55:06 -0400
Received: by mail-ej1-x62f.google.com with SMTP id rk17so3730626ejb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1ZX8EvEFOBPZ8Nn8dtI/ON1GrCSiq6zEKTfRiGuMpPQ=;
 b=oBLteebaGEh642DLK7mUSkKnfO4NSEIIDfTt2QkNAKzPfywTphEVxxMeEflXOQNUpj
 +O36JpLejvTsEZeesVkyipAT4677EXMf8qTf/+dUtQ0XGYtmUA3vtTMOA0HvFBo4q5W+
 pTIp0cTFfdQ6LhxxHkV0lmv/3z2vFekY97ZsT2QcdbIdhvgXZTrr4BYs2aWCq2sljxwu
 Ig7j3xKvUY+qkUyS2GET9f0mo/gmJiPv9N7HgBg28XmhAoo6gzvd1HuFsOVH9doAURZA
 mTDsgpWEwrDnPyzgmumE7G0PG3QHJKTCF36gurPl0oMD4v8DTLO3cUiV5hgmsS9Px0fA
 yO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1ZX8EvEFOBPZ8Nn8dtI/ON1GrCSiq6zEKTfRiGuMpPQ=;
 b=Ijlf9ydz5661O4jPRvFckYBhi6zoOZ6YY6pGtbHmvLTp3b/OMD52xHNoz05zf7VQc1
 WuA4QgUWzpG03DlVbkCLkqYizCEMit+Njhtb3Aaze0SBpaDkJSojK5QnI2t0d/RnYKj/
 n/Prbcavxfz9/ppTGwCbWZqsCrybkNR3zQiKuRxcu/MX8EEizI6iiKzowr4lcEC+RHc4
 mGu6OFyrOtZYYcImdJvMLvhsIxV8EiuTtXmNvOyldkBxsX3VgAgkYqwRoHhZk+2nzGnN
 fFjgDNHxwhHERU0FmoqwF007HtRJwPiwr7yGRqVqCQtGJG0HwLiJpz5b1/7UYDy4Q5oz
 Qnvw==
X-Gm-Message-State: ACrzQf0kb8GXLkqhzDk8ItUYBwi7J8GNDWZCDUKUXDf/fMyvGENc+Q7v
 Ij2GubCxZ4k9zz7vOa3Mvxvq/yimKgh1EDO8nc9OFg==
X-Google-Smtp-Source: AMsMyM7ic5DaDUPWaf4EXJwCV2DItK005Y7orlO2jy5AF11ZSf+99o9E/fbaJhNHtBNBmucY80z/tm1CGGtk+EPHto4=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr3420250ejc.36.1664466895915; Thu, 29
 Sep 2022 08:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
 <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
 <CAO=notwsgvtZBLyWGu+PSnmHTrm6anakwFwoq3oBEJ-8nqPFaQ@mail.gmail.com>
 <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
In-Reply-To: <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 16:54:44 +0100
Message-ID: <CAFEAcA8_WM_-w7HDc+cRvvxZVEdatczsj18D3beN3+MUg7P3cA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 29 Sept 2022 at 16:28, Patrick Venture <venture@google.com> wrote:
> On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture <venture@google.com> wrote:
>>> I think what Jason is suggesting is that that should depend on what
>>> the real hardware does. On a physical board, if the guest sets the
>>> MAC address, and then you power-cycle the hardware, does the MAC
>>> that it set still persist after powercycle ? Does the guest writing
>>> to these MAC registers correspond to writing to an EEPROM ?
>>
>>
>> Thanks, Peter - we've reached out to the vendor off-list to seek out some details, I'll update this with a v2 when I get an answer.

> "No, The EMC driver reset the MAC address registers during boot cycle/reset."

OK, I guess that's clear enough. In a real full-software-stack
setup is the MAC address setup usually done by a BIOS/firmware,
or is it done by Linux ?

> So in that case, we should disregard the value the user sets in
> reset and use the value provided through Qemu.  Or, should we just
> not allow Qemu to set the MAC address at all?

I think that the behaviour for QEMU's model should be that
on reset we should reset the MAC address registers to the
user-provided value. That is, if the guest writes to the
MAC address registers then that does have an effect, but
only until the next reset.

That gives you reasonably plausible behaviour for both:
(1) you're emulating some guest that always sets up its
own MAC address when it starts up (eg if it's done by
some BIOS-level code that you're running in the guest)
(2) you're booting a guest kernel directly that expects
that the firmware/BIOS/whatever has already set up
a MAC address -- then the MAC address provided by QEMU/the
user fills that role

More concretely:
 * on reset, set the emc->regs[] fields from emc->conf.macaddr
 * when using the MAC address, always use emc->regs[], never
   emc->conf.macaddr
 * to handle the guest writes to the MAC registers, set
   emc->regs[], but not emc->conf.macaddr

Assuming that doesn't break your existing booting workloads,
of course :-)

thanks
-- PMM

