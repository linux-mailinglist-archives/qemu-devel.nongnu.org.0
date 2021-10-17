Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158F430BFE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 22:29:56 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcCn5-0002l3-Hc
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 16:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcCle-00024r-0m
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 16:28:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcClc-000850-Jj
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 16:28:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso2872164wmc.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mheq+dAgZn+vhZSMCBHBrpgebSVzB02AS9tmDLnJQ5g=;
 b=PNSbarkdr2q0bsaM0fykJaIw4Q4+OUoAPEteuW1YcTMa2fC+goIv064Q+Wg9EHepR5
 0evOFZmdAE01q56LSpuSEUjJTZmI2PkS3AexWiXCd+9A/ZzuXPMTXMPCH8VaN0RZzYRx
 NWIxN0SARscmlvg5VHA6FiiLTqDKSyWftz6jhVp2g/Ma8DgqmSY4nOW69zov8YlWa5gz
 JpIVHx5A3eBAIJeZwBNj8OjSgD2NRDeCo8HBNUuB+nK4uGoaDganwnX72lEBUeRdWCNX
 l3i51iXNHq4GtrrOrqlWMkjPFVNjsrn0+S9bgfoRZutiL5zCDio6lV47BKXXUptfOc57
 Go4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mheq+dAgZn+vhZSMCBHBrpgebSVzB02AS9tmDLnJQ5g=;
 b=w5EbofIP9vVv3zEPhNPqN2vAy2/UKGPOeVCNBikN7BYR05rpfYE1/6DgJOnnIUz4Hx
 zZbOYQKn2mCPXuRT39md7aKYBUrXiwzBemVSidBaxEjk+dVNSw/7uS1h6pVHhc7B7ayv
 7KUx6Tpz9cbXJD8yP1iTOWtX43znyIrg5VyA3jpiL3f+YkQU9qLQrQOnAZS8qhK0MqYC
 UEhDgwQAqGU3nKn5Wer5025mqqzrD+4SGEIeuumG3QTG25MMPZHjSgoKSY8oQ+feCWAj
 MKlG+libOEjurB/Ze3QiI/q/Pm/6bJZPDswiIzxQGBR0gHhwM2oAa77I7vrORXHTUQF2
 /Y/w==
X-Gm-Message-State: AOAM5302F3/lbj7lWY5Z+/DYxs8O4jw06BVt5UdZUoUokoZWVNjhI9p2
 zpx0/hyovTHetQv8BMWar5s=
X-Google-Smtp-Source: ABdhPJyI3Vhp23XqL8FAkCwpUiamUrqGnyb3XZyZ/D0sRbvdfrOdzY4vLpsRJcZ+yuUPAYGUjmmJ3g==
X-Received: by 2002:a1c:27c3:: with SMTP id
 n186mr26524230wmn.192.1634502502857; 
 Sun, 17 Oct 2021 13:28:22 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id d9sm10670664wrm.96.2021.10.17.13.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 13:28:22 -0700 (PDT)
Message-ID: <b15cb6c9-7166-02c4-29f4-d1bbd3976f69@amsat.org>
Date: Sun, 17 Oct 2021 22:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
 <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
 <2f3756a-a968-2d16-f238-1dd16647cc9@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2f3756a-a968-2d16-f238-1dd16647cc9@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

On 10/17/21 20:44, BALATON Zoltan wrote:
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
> I can do that but waiting for a decision on how to proceed. Will Gerd
> take my first series this is based on as is then this should be a
> separate series doing the clean up using pci_get_function_0 or should
> these two series be merged? I'd also squash setting user_creatable =
> false into this patch (and do similar for the usb one) unless you guys
> think it should be a separate patch?

I don't know what Gerd will do with the USB patches.
Your VIA patches are orthogonal, so I'm queuing them (1, 2, 4
and extra user_creatable) via mips-next.

