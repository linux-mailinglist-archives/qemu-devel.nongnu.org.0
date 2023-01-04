Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869965DA00
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6kJ-0002jh-30; Wed, 04 Jan 2023 11:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD6kH-0002jZ-4r
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:36:05 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD6kD-0005gZ-7P
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:36:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id co23so33612100wrb.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Mwf3YVKAgwHjRKpwnn7iEsk1Ot4UqkQGY5SR/zbW/g=;
 b=YGorOoiqlY2AsinGjhgtea6RLigc7AEKOTjfNFsPYad8LVJlkmHrJnt3H/Rk44aInP
 Mnr20YHgFefqzpN0rU5yAyQarWx9ZuyK+xvp2Kd3XdkfaP/Km/TwjLsVmxRR1+vVJ8QF
 luXRQ+fkTX6SVcjrZL+OjDy64sOCthwhOqUTHKTi6apaM3Aai5DxadV1S8kWCOWhSxAM
 F6EAjOyvG+aeK4vRGJBsgpMuYdYZxIiTZ3hqgIcorPP1jasfOZ++zMYgOmL9ghsp3P1H
 odtYoaRBkYU6Ho5f72nGhUWW0Znqm8pE+YfNHS+yBC+JLOAWnBnPA6F4Z2GmPukOKIYA
 dWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Mwf3YVKAgwHjRKpwnn7iEsk1Ot4UqkQGY5SR/zbW/g=;
 b=ewC89jmx758woPuG33j+hy0rdPx3R1KcVtx5LyUkG98lJOTBP+D71hgQebsadSGRAb
 21FKNGNV4CPR/SEfO6msey4qtNIHTiulJkOSDaUDvVnWvLZEHCLxpPEDz+GJC+kgYgGj
 q/Yf/lJLjsxJnoJKiYHS2WeyyVDHTpGvUvQzGP8TmxWl5o+brU6e6brfuBuTLAq6mcSa
 SpA0thuE8d6kYahJAn0xHeY2ieLOUTMJ8xOFP7T59RI5O9y7+K7JPjF6PoXCrj4084F7
 tPlxMhxRgtmMz4Q1cTTWF14TOI/iYFpwFRYwmtlcYPHdwPwEf7PaNkCaL5muT7cuMiS7
 v6ow==
X-Gm-Message-State: AFqh2kpu55xFadSYWnYUCpd96HZpsNMN/XCJjkskZyHYlGqH5iR/seMz
 L4a6p3yPJC993hI4JvpKOMsCNQ==
X-Google-Smtp-Source: AMrXdXuinNhYrnkFou3ez0n4HGDEeDSN6mO74ThiyrgpYF6BXhrO91RkIWdyZmJmOz6VIN0PHWfMBw==
X-Received: by 2002:adf:cc8f:0:b0:242:14bb:439d with SMTP id
 p15-20020adfcc8f000000b0024214bb439dmr31522673wrj.43.1672850159539; 
 Wed, 04 Jan 2023 08:35:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h6-20020adffa86000000b0024246991121sm35229419wrr.116.2023.01.04.08.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 08:35:59 -0800 (PST)
Message-ID: <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
Date: Wed, 4 Jan 2023 17:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 12/30] hw/core: Introduce proxy-pic
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Burton <mburton@qti.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-13-shentey@gmail.com>
 <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
 <112DBAA3-978C-42C5-B1A5-F614D7A2141B@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <112DBAA3-978C-42C5-B1A5-F614D7A2141B@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 17:01, Bernhard Beschow wrote:
> Am 4. Januar 2023 14:37:29 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 21/12/22 17:59, Bernhard Beschow wrote:
>>> Having a proxy PIC allows for ISA PICs to be created and wired up in
>>> southbridges. This is especially useful for PIIX3 for two reasons:
>>> First, the southbridge doesn't need to care about the virtualization
>>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>>> attached) and out-IRQs (which will trigger the IRQs of the respective
>>> virtzalization technology) are separated. Second, since the in-IRQs are

Typo "virtualization".

>>> populated with fully initialized qemu_irq's, they can already be wired
>>> up inside PIIX3.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Message-Id: <20221022150508.26830-15-shentey@gmail.com>
>>> ---
>>>    MAINTAINERS                 |  2 ++
>>>    hw/core/Kconfig             |  3 ++
>>>    hw/core/meson.build         |  1 +
>>>    hw/core/proxy-pic.c         | 70 +++++++++++++++++++++++++++++++++++++
>>>    include/hw/core/proxy-pic.h | 54 ++++++++++++++++++++++++++++
>>>    5 files changed, 130 insertions(+)
>>>    create mode 100644 hw/core/proxy-pic.c
>>>    create mode 100644 include/hw/core/proxy-pic.h
>>
>> Please enable scripts/git.orderfile.
> 
> Will do.
> 
>>> diff --git a/include/hw/core/proxy-pic.h b/include/hw/core/proxy-pic.h
>>> new file mode 100644
>>> index 0000000000..0eb40c478a
>>> --- /dev/null
>>> +++ b/include/hw/core/proxy-pic.h
>>> @@ -0,0 +1,54 @@
>>> +/*
>>> + * Proxy interrupt controller device.
>>> + *
>>> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to deal
>>> + * in the Software without restriction, including without limitation the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>> + * THE SOFTWARE.
>>
>> This is the MIT license right? Do you mind adding a SPDX tag along?
> 
> I based my implementation on TYPE_SPLIT_IRQ as you suggested before and thus preserved the license.
> 
>> * SPDX-License-Identifier: MIT
> 
> Or just replace the wall of text with this line? This should suffice, no?

IIUC (IANAL) I can only suggest you to add a SPDX tag to the license you
chose, not ask you to remove the text; but since you ask/propose, the
tag suffices indeed. I suggest the tag use because it is clearer than
trying to match the full (often copy/pasted with typos) license text.

>>> + */
>>> +
>>> +#ifndef HW_PROXY_PIC_H
>>> +#define HW_PROXY_PIC_H
>>> +
>>> +#include "hw/qdev-core.h"
>>> +#include "qom/object.h"
>>> +#include "hw/irq.h"
>>> +
>>> +#define TYPE_PROXY_PIC "proxy-pic"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
>>> +
>>> +#define MAX_PROXY_PIC_LINES 16
>>> +
>>> +/**
>>> + * This is a simple device which has 16 pairs of GPIO input and output lines.
>>> + * Any change on an input line is forwarded to the respective output.
>>> + *
>>> + * QEMU interface:
>>> + *  + 16 unnamed GPIO inputs: the input lines
>>> + *  + 16 unnamed GPIO outputs: the output lines
>>> + */
>>
>> Why restrict to 16 and not use a class property and allocate
>> on the heap? See TYPE_SPLIT_IRQ for example.
> 
> TYPE_SPLIT_IRQ doesn't allocate on the heap and instead has a hardcoded limit of MAX_SPLIT_LINES which equals 16 ;)
> 
> I was unsure on when to free the memory and how to dispose the elements so I went with this solution for simplicity. I'll look for inspitation in other device models and respin.

Oh indeed. Well this model as is is OK, but it could be more useful
if able to proxy any range of IRQs.

I have the feeling we are cycling around this IRQ proxy:

22ec3283ef ("irq: introduce qemu_irq_proxy()")
078778c5a5 ("piix4: Add an i8259 Interrupt Controller as specified in 
datasheet")
fc531e7cab ("Revert "irq: introduce qemu_irq_proxy()"")

What is our problem? IRQ lines connect 2 devices in a fixed direction.
Current model expects one edge to be wired to a device before wiring
the other device, so device composition with IRQs in middle is
impossible? If so, this doesn't scale with dynamic machine creation.

Maybe the IRQ wiring should be another machine phase, after all
devices are instantiated?

Your approach is to create the 'IRQ proxy' first, like drawing the
wires on a board, then plug the devices, like soldering chips on
the printed board IRQs. So maybe devices shouldn't be the QOM owners
of IRQs, the board should...

Yeah, just thinking loudly...

