Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0C8CC94
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 09:21:52 +0200 (CEST)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxnbU-00005y-1l
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 03:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1hxnZs-00071M-Kg
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 03:20:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hxnZr-0002b0-JE
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 03:20:12 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46141)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hxnZo-0002Za-PY; Wed, 14 Aug 2019 03:20:08 -0400
Received: by mail-pl1-x643.google.com with SMTP id c2so50323866plz.13;
 Wed, 14 Aug 2019 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=V3JtMJEdGf+/wFSc2uNDCDMvXY6a4xpbdDwrcSsS2UU=;
 b=laROo5RZRckeccTw26wgMqj8Nnq51sFEtEmnmuZya5DrbCeM+MWsU9Zr7SBvJZ5GZd
 k+2OM4aLR2pRRvx+64oWXpNjqZB3Qe8Gbc3TbCGG5CjmZZXCVjINI2/9eftl57vUfiiP
 us0c4g/dfeHHkm4kQSnKTkhheFvJtWJhTSEduEZXnob3rMwDLnmhg/0sX6gBYwtAJ8j8
 i3jvBQW93evtER4aAeN/rt1xkxYHDampzT7A1JZ7bv0reK3puoRmaTe8y8gYcrfZKv+3
 9txW6uP3+qPPvNLKuSQAaApHfxaAxPvyT4HbvrZPfuKLn5lXJLLsfqnAlSglAgA1LImk
 vNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=V3JtMJEdGf+/wFSc2uNDCDMvXY6a4xpbdDwrcSsS2UU=;
 b=PXg68mKqLz0FzS5xI42fKiTR7Ba4uZBlxmZ36aFWQuD9QcZojch53NX3P7Aev59CUj
 +iwTzNxrQ2/ixgP2XVqmqQaxl63W62n/jRmji4rSV+lxHoBqyUsBqDpHptwIWw/gYsku
 youKCLlmNX9xWvB8zEK3sJ9hch0+Viq2hKMqB8pMm4ffm7M+Vf7xYc51wpKt4Kpl66El
 0za2iVKhawLyoYuuSGBEH390z+UZrR0i2WxGsZkRYq+HWLwbcw6g6IoMTcLsWZa2W+XE
 b1tK7VOPhTyIk8uxQU0BqSFS9m/Ov2k5LLHCqYQsvoJo+nVUY28CXZ1e+xpd0azMo6A3
 QmPg==
X-Gm-Message-State: APjAAAXWNzwDi4d3G3G1T6D7Qa41pgkOCDzzUe1hnkmIqjnsK2NoZgDt
 CrNcHcA+yu7IwztF34aCIrs=
X-Google-Smtp-Source: APXvYqzxSzm1PCg0nOTeK89Ccgiva+UU6+3GPLhIye6gkDM5mMqFeqZ9b5DE/FFFoaAr9ZjwhLvbbg==
X-Received: by 2002:a17:902:a9c3:: with SMTP id
 b3mr10247370plr.179.1565767207648; 
 Wed, 14 Aug 2019 00:20:07 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id
 h20sm15376501pfq.156.2019.08.14.00.20.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 00:20:07 -0700 (PDT)
Message-ID: <7af7a2ca0d5109d092922beda3b1b7bae6b4a12f.camel@gmail.com>
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Aug 2019 17:20:03 +1000
In-Reply-To: <CAFEAcA_OBg6s+qu-DG_N882Gy_FxX3_fxHLa=tzpHfRzY5fdWQ@mail.gmail.com>
References: <20190730054501.32727-1-rashmica.g@gmail.com>
 <20190730054501.32727-2-rashmica.g@gmail.com>
 <CAFEAcA_OBg6s+qu-DG_N882Gy_FxX3_fxHLa=tzpHfRzY5fdWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH v3 1/3] hw/gpio: Add basic Aspeed GPIO
 model for AST2400 and AST2500
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-08-06 at 14:57 +0100, Peter Maydell wrote:
> On Tue, 30 Jul 2019 at 06:45, Rashmica Gupta <rashmica.g@gmail.com>
> wrote:
> > GPIO pins are arranged in groups of 8 pins labeled
> > A,B,..,Y,Z,AA,AB,AC.
> > (Note that the ast2400 controller only goes up to group AB).
> > A set has four groups (except set AC which only has one) and is
> > referred to by the groups it is composed of (eg
> > ABCD,EFGH,...,YZAAAB).
> > Each set is accessed and controlled by a bank of 14 registers.
> > 
> > These registers operate on a per pin level where each bit in the
> > register
> > corresponds to a pin, except for the command source registers. The
> > command
> > source registers operate on a per group level where bits 24, 16, 8
> > and 0
> > correspond to each group in the set.
> > 
> >  eg. registers for set ABCD:
> >  |D7...D0|C7...C0|B7...B0|A7...A0| <- GPIOs
> >  |31...24|23...16|15....8|7.....0| <- bit position
> > 
> > Note that there are a couple of groups that only have 4 pins.
> > 
> > There are two ways that this model deviates from the behaviour of
> > the
> > actual controller:
> > (1) The only control source driving the GPIO pins in the model is
> > the ARM
> > model (as there currently aren't models for the LPC or
> > Coprocessor).
> > 
> > (2) None of the registers in the model are reset tolerant (needs
> > integration with the watchdog).
> > 
> > +typedef struct AspeedGPIOReg {
> > +    uint16_t set_idx;
> > +    uint32_t (*read)(GPIOSets *regs);
> > +    void (*write)(AspeedGPIOState *s, GPIOSets *regs,
> > +                const GPIOSetProperties *props, uint32_t val);
> > + } AspeedGPIOReg;
> 
> Please don't create new abstractions for implementing
> registers that are only used in one device model. We
> have a couple of basic approaches that we use already:

That's fair enough :)

> 
>  * just open coded switch statements in the read and write
>    functions for the device's MMIO regions

Thoughts on the switch statement approach in v4? I think it's
much nicer than two huge switch statements. 

>  * if you'd rather have a data structure defining each
>    register with hook functions where they need to do
>    particular behaviour on reads and writes, have a look
>    at the APIs in include/hw/register.h. Currently these are
>    used just by some of the Xilinx devices, but if you
>    want an API shaped like that you can use it.
> 

I had a play with the existing register API. I couldn't quite
get it to work. When writing to some registers in a set we
need to look at other registers in that set, and so we need
some kind of structure tells us how to find those registers.


> thanks
> -- PMM


