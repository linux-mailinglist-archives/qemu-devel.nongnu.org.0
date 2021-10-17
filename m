Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75589430BFD
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 22:27:29 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcCki-0001Cq-2S
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 16:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcCir-0000P1-83
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 16:25:33 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcCip-0005hy-EJ
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 16:25:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id g25so37261237wrb.2
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e1AiA1GK9wqUihybV6rRI0X3GQHKq4lEbp6qKzyjjYk=;
 b=jearCTQn12FCYke25+hOro2618TZKCjun42AqrEibDqnYonwGK+05foJwCuU2noNIj
 gDzKviaGb5ZLawxBWcacHyny3bszRANRijBW39h7rMpgbCmGQA2QrYpPnmASsyy6vjzA
 b3vmh4s0wvGHQMMXRifTZ5Tsrb7BBpEunfAiyAKLV85bNGYHxYGm7hrUVFhF7EBfLoLy
 PmEz2MGBtZhSObtH8Kn8XxBNRxiwf4JXJY508u4+w9xvOqvi6TaD8KC64vwiJRTfbVuL
 xXe41K4P6OIVEjffH0hohGRggJBBDKwEDdh6sW02mXv/59RfrWG7MeRmIMisVN8bWezk
 ICsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e1AiA1GK9wqUihybV6rRI0X3GQHKq4lEbp6qKzyjjYk=;
 b=dXZEaHBM9GVq9IfuUpTyJZSp5M5o5JyZFXtExE2L130K6nE7iFMj/5AAQURp1b2xXl
 P0FhIgR4EGPBitF4p9VtdwaSeH7hvD06ZwEWYmTK5VNzDUcTZZfvmTr5sSyDSwXhR/EM
 +AyPxcABLzNj+c4VIHVvNO6XfHdCCjenTqycYlZe6T5ocg53/ddHHGWaRXbXGDyxikpg
 zISzKtr1BInLFrjs5q9sSUtMJH60sW5OvLpG+GIZ5fkGgYot8uMrJAuI1X1sxOrCrxLz
 NSLMfbsOFzw8q6IjuMpJ66AjKq6l4KMrOtoGIF+QBb9amsg9l4NpkN+WHpHQ8UBxUPEH
 twIg==
X-Gm-Message-State: AOAM532F3ewDnGaQQdeMh0/Fzpf+EKjArb/gVb03h2aK3UCxepAlOquU
 n+s6GJGNY/nKT1abM/jNLOc=
X-Google-Smtp-Source: ABdhPJxjFXC80R/aBUYKqf9+vOVGzS6xoKEr0uFIKb+7JA+btOreMBm1tSPnqbftVQ4fl0dX0woopw==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr31142107wri.394.1634502328246; 
 Sun, 17 Oct 2021 13:25:28 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 196sm10694674wme.20.2021.10.17.13.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 13:25:27 -0700 (PDT)
Message-ID: <f11bd4dc-1881-bd9f-1b81-26ee1dc9dcf3@amsat.org>
Date: Sun, 17 Oct 2021 22:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
 <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
 <643d88e9-30aa-7fb-8f5b-de25473ed6b1@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <643d88e9-30aa-7fb-8f5b-de25473ed6b1@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/21 21:39, BALATON Zoltan wrote:
> On Sun, 17 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/15/21 03:06, BALATON Zoltan wrote:
>>> Use via_isa_set_irq() which better encapsulates irq handling in the
>>> vt82xx model and avoids using isa_get_irq() that has a comment saying
>>> it should not be used.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/ide/via.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index 94cc2142c7..252d18f4ac 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -29,7 +29,7 @@
>>>  #include "migration/vmstate.h"
>>>  #include "qemu/module.h"
>>>  #include "sysemu/dma.h"
>>> -
>>> +#include "hw/isa/vt82c686.h"
>>>  #include "hw/ide/pci.h"
>>>  #include "trace.h"
>>>
>>> @@ -112,7 +112,7 @@ static void via_ide_set_irq(void *opaque, int n,
>>> int level)
>>>          d->config[0x70 + n * 8] &= ~0x80;
>>>      }
>>>
>>> -    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
>>> +    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
>>
>> Since pci_get_function_0() is expensive, we should cache
>> 'PCIDevice *func0' in PCIIDEState, setting the pointer in
>> via_ide_realize(). Do you mind sending a follow-up patch?
> 
> On the other hand, IMO PCIIDEState should be about PCI IDE stuff so to
> keep this clean this would need subclassing it to VIAIDEState and put
> the func0 pointer there.

I expect any multi-function PCI embedding an IDE controller to route
its IRQs via Func#0, but I'm not a PCI expert.

> But then we probably need to cast between
> VIAIDE and PCIIDE and likely we're back to the same level of
> expensiveness.

realize() is called once, get_irq() multiple times.

> The main source why of pci_get_function_0 is expensive is
> probably the QOM cast to PCI_BUS in pci_get_bus() the rest is just
> pointer and array index dereferences which should not be too bad. And
> the reason why QOM casts are expensive is because we have
> --enable-qom-debug enabled by default. I've tried to send a patch before
> to disable this on release builds and only enable it with --enable-debug
> or when explicitly asked but it was rejected saying that these asserts
> are useful. Maybe we can just live with qemu_set_irq and not bother and
> drop this series. (You can cherry pick the first patch removing code
> duplication from via isa if you want.)
> 
> Regards,
> BALATON Zoltan

