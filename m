Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308A965DD70
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 21:13:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDA7R-0001Ba-JM; Wed, 04 Jan 2023 15:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDA7O-0001B0-Pu; Wed, 04 Jan 2023 15:12:10 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDA7M-0006YL-N9; Wed, 04 Jan 2023 15:12:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id bs20so32101349wrb.3;
 Wed, 04 Jan 2023 12:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=He3Ns0j8GANvlvDWiVMdI8a2A1ZdqhPxdyz+TsDJ3Aw=;
 b=HT7uGOzdsoW7yVMEGSQ+Rexae0GfVfYE7HRjrY2Amjiu5pG1SIJuyPdi4Az64PA7Gg
 B/3YQIEAEdUW2qHXTA44Xc8wNUQ0i2DlAxGhvAVM3fMjE0q15fiPZowHihwv1WGWDMvh
 8/YSOp6ZhX8OsewHKh83UflfxoqEnGM+hJUpBYNCVGOBLm2NowD50Jl6M3xKPCoQzbhf
 vrDGhi5+UB68LyfQAm/82gtsyZ4Rd040wru8hCjiNCEaCULDJub2Fz06l6sJlB+F3ci2
 +WLaJGokdxvQ6nbYqTbaVcfmsp6pdSdDK4ZfmrTvSSNYL3kBQVMrFzk93ksG8+snEigf
 SQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=He3Ns0j8GANvlvDWiVMdI8a2A1ZdqhPxdyz+TsDJ3Aw=;
 b=dAGk84JO7693V7CtvQrhQRdA8pRjL9WnHExKCost82D7U//+Tm0XbNHXeb+NqK1hzw
 VaNVGC12H3Ac9CaMGCTbi+XQDVI84RmxMVggsAlYRcC4WZbvuilrmoYL7XHwgYDRBjpp
 RsdnK7q8dWaGu3kW3WH7ontvuhflH5lWNjgRbX1We3mSq6q5dmc8UMqWH03pSIhbeUyU
 qbiNOUf9NoFp3PwlQjl8KZg3Cb+M+R4qK3bFvM0b3AYtKwii7Lhu2y8nuCHmkcHp9vfa
 JSx7E1W0Ngi6bv2yVkVbdi8AFsHkCO7dIoDbFME4V/gkyDWksGAoto3CSxh/xAHLJhyO
 8mWg==
X-Gm-Message-State: AFqh2krCn4ftvN8Owjgd2tifDM1xEKP7bK6nyh0nBMfzenHzV1Hd9M/k
 66C4uNeGLQQIOAQP3GnFSWM=
X-Google-Smtp-Source: AMrXdXtRpBqAe1O8O5yo8l014rwvLiKFfg6Ix3iH3eBl23dSV2+VYTgsrf4Orzwbj6U4YOtTynhMww==
X-Received: by 2002:a5d:42c1:0:b0:242:2844:8489 with SMTP id
 t1-20020a5d42c1000000b0024228448489mr30792369wrr.8.1672863126385; 
 Wed, 04 Jan 2023 12:12:06 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 o2-20020adfcf02000000b00241d21d4652sm34880065wrj.21.2023.01.04.12.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:12:05 -0800 (PST)
Date: Wed, 04 Jan 2023 20:12:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Burton <mburton@qti.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v4 12/30] hw/core: Introduce proxy-pic
In-Reply-To: <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-13-shentey@gmail.com>
 <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
 <112DBAA3-978C-42C5-B1A5-F614D7A2141B@gmail.com>
 <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
Message-ID: <44D9DAA2-871D-4B42-99C8-748B2B65A78C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 4=2E Januar 2023 16:35:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 4/1/23 17:01, Bernhard Beschow wrote:
>> Am 4=2E Januar 2023 14:37:29 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>> On 21/12/22 17:59, Bernhard Beschow wrote:
>>>> Having a proxy PIC allows for ISA PICs to be created and wired up in
>>>> southbridges=2E This is especially useful for PIIX3 for two reasons:
>>>> First, the southbridge doesn't need to care about the virtualization
>>>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>>>> attached) and out-IRQs (which will trigger the IRQs of the respective
>>>> virtzalization technology) are separated=2E Second, since the in-IRQs=
 are
>
>Typo "virtualization"=2E

Fixed=2E=2E=2E

>>>> populated with fully initialized qemu_irq's, they can already be wire=
d
>>>> up inside PIIX3=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>>> Message-Id: <20221022150508=2E26830-15-shentey@gmail=2Ecom>
>>>> ---
>>>>    MAINTAINERS                 |  2 ++
>>>>    hw/core/Kconfig             |  3 ++
>>>>    hw/core/meson=2Ebuild         |  1 +
>>>>    hw/core/proxy-pic=2Ec         | 70 +++++++++++++++++++++++++++++++=
++++++
>>>>    include/hw/core/proxy-pic=2Eh | 54 ++++++++++++++++++++++++++++
>>>>    5 files changed, 130 insertions(+)
>>>>    create mode 100644 hw/core/proxy-pic=2Ec
>>>>    create mode 100644 include/hw/core/proxy-pic=2Eh
>>>=20
>>> Please enable scripts/git=2Eorderfile=2E
>>=20
>> Will do=2E
>>=20
>>>> diff --git a/include/hw/core/proxy-pic=2Eh b/include/hw/core/proxy-pi=
c=2Eh
>>>> new file mode 100644
>>>> index 0000000000=2E=2E0eb40c478a
>>>> --- /dev/null
>>>> +++ b/include/hw/core/proxy-pic=2Eh
>>>> @@ -0,0 +1,54 @@
>>>> +/*
>>>> + * Proxy interrupt controller device=2E
>>>> + *
>>>> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail=2Ecom>
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtai=
ning a copy
>>>> + * of this software and associated documentation files (the "Softwar=
e"), to deal
>>>> + * in the Software without restriction, including without limitation=
 the rights
>>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and=
/or sell
>>>> + * copies of the Software, and to permit persons to whom the Softwar=
e is
>>>> + * furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be in=
cluded in
>>>> + * all copies or substantial portions of the Software=2E
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=2E IN NO EVE=
NT SHALL
>>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING FROM,
>>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS IN
>>>> + * THE SOFTWARE=2E
>>>=20
>>> This is the MIT license right? Do you mind adding a SPDX tag along?
>>=20
>> I based my implementation on TYPE_SPLIT_IRQ as you suggested before and=
 thus preserved the license=2E
>>=20
>>> * SPDX-License-Identifier: MIT
>>=20
>> Or just replace the wall of text with this line? This should suffice, n=
o?
>
>IIUC (IANAL) I can only suggest you to add a SPDX tag to the license you
>chose, not ask you to remove the text; but since you ask/propose, the
>tag suffices indeed=2E I suggest the tag use because it is clearer than
>trying to match the full (often copy/pasted with typos) license text=2E

Changed=2E=2E=2E

>>>> + */
>>>> +
>>>> +#ifndef HW_PROXY_PIC_H
>>>> +#define HW_PROXY_PIC_H
>>>> +
>>>> +#include "hw/qdev-core=2Eh"
>>>> +#include "qom/object=2Eh"
>>>> +#include "hw/irq=2Eh"
>>>> +
>>>> +#define TYPE_PROXY_PIC "proxy-pic"
>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
>>>> +
>>>> +#define MAX_PROXY_PIC_LINES 16
>>>> +
>>>> +/**
>>>> + * This is a simple device which has 16 pairs of GPIO input and outp=
ut lines=2E
>>>> + * Any change on an input line is forwarded to the respective output=
=2E
>>>> + *
>>>> + * QEMU interface:
>>>> + *  + 16 unnamed GPIO inputs: the input lines
>>>> + *  + 16 unnamed GPIO outputs: the output lines
>>>> + */
>>>=20
>>> Why restrict to 16 and not use a class property and allocate
>>> on the heap? See TYPE_SPLIT_IRQ for example=2E
>>=20
>> TYPE_SPLIT_IRQ doesn't allocate on the heap and instead has a hardcoded=
 limit of MAX_SPLIT_LINES which equals 16 ;)
>>=20
>> I was unsure on when to free the memory and how to dispose the elements=
 so I went with this solution for simplicity=2E I'll look for inspitation i=
n other device models and respin=2E
>
>Oh indeed=2E Well this model as is is OK, but it could be more useful
>if able to proxy any range of IRQs=2E

I've responded with a new, single patch to this patch=2E Is that okay or s=
hall I respin the whole series? Is anything missing? IIUC we can make the p=
roxy-pic dynamic in a follow-up?

>I have the feeling we are cycling around this IRQ proxy:
>
>22ec3283ef ("irq: introduce qemu_irq_proxy()")
>078778c5a5 ("piix4: Add an i8259 Interrupt Controller as specified in dat=
asheet")
>fc531e7cab ("Revert "irq: introduce qemu_irq_proxy()"")
>
>What is our problem? IRQ lines connect 2 devices in a fixed direction=2E
>Current model expects one edge to be wired to a device before wiring
>the other device, so device composition with IRQs in middle is
>impossible? If so, this doesn't scale with dynamic machine creation=2E

My PIIX consolidation series and even more so my effort to make the VT82xx=
 south bridges work with the PC machine are indeed bottom-up explorations o=
f dynamic/flexible machine creation=2E

Best regards,
Bernhard

>Maybe the IRQ wiring should be another machine phase, after all
>devices are instantiated?
>
>Your approach is to create the 'IRQ proxy' first, like drawing the
>wires on a board, then plug the devices, like soldering chips on
>the printed board IRQs=2E So maybe devices shouldn't be the QOM owners
>of IRQs, the board should=2E=2E=2E
>
>Yeah, just thinking loudly=2E=2E=2E

