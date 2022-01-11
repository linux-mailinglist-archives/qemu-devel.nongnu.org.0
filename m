Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E048AE7A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:32:56 +0100 (CET)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HGh-00070T-VU
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7GlV-0004aL-9V
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:00:41 -0500
Received: from [2a00:1450:4864:20::429] (port=33691
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7GlO-0005dG-Ix
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:00:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id d19so2301861wrb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e14aOEUWK9rOmmD7zDQjwksR+hTnQQcfSi4n7dMAxO8=;
 b=LlmHWJJaLT1sW43Ro8YxEfcDNXXFIj1JBJOT8v0p8Eo33DLRVl9BqHUXTjK04+23J2
 nNazsNJ5psLZgRwyzPFn5gzXKsSzkOv4hVKmYf89fdqbCcFX7g7g3BfzwXubap6KcSWh
 8UE5ZYFL3p14hVVLfPe+Wu3X8yCpUGTvBJpZP3brdNbpOYgasAhYvzRW7oJzGtZwxHgs
 CTe7puabSxatPwsnS474oGCZ74jOQz7M2oeZyGJ6giHjtm0ufLcOcaI2vTxeii4m1e0q
 xHtyS2HeSGVT33tPjXHx643DLxa5xYk3+IBOh3QyVWOg9SWUI2u0Fxf8n2PF/Uu53aaL
 NuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e14aOEUWK9rOmmD7zDQjwksR+hTnQQcfSi4n7dMAxO8=;
 b=CrKIbt8mUR89OZXwyIwjMKFqCg/FpZGAEZ76LvdAh/RgcxkweWQhq+kkOEs5FS5PLj
 /Tsx+QjJMJA7OC0pPCLXjS1XIc0coiyqfbJ3GZ35WkARuJVoAx1krGG4nUxKEPUBKNqr
 G40xWLVhb2n/arHwJRlWYzecTNiv6Q+JU1Q5SL1z3xYe/7u3boYnFbPKJ4fx/fmJeZEr
 bu3ycLK2VrfyE9qcHvKt1xBmm0IJIz5/OONeGsVeXQsfkuDO6mwEeWPgCdkQJqdm/TXH
 ocTO+ZyeMGjYS4DEP+21CYBgRNPZUHtC5IzYmEStBUddNx5K21gf+1qM2MN2V1eV5wxA
 eGXA==
X-Gm-Message-State: AOAM531LMMyQuI+aI3+u7VjtjA8rtlqAjdIhR31ccGhOD61wbbmr9P2C
 R/JxafczZQ8XoNAddOvu3sY=
X-Google-Smtp-Source: ABdhPJyuhlJau2yrCSWbzMGvI1NL6us1HDuzx5iqtw1/3uIQBDFk6vflwEWl6RtGIzwzAIBnZoeBTQ==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr3693873wrx.400.1641906032354; 
 Tue, 11 Jan 2022 05:00:32 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id r1sm10630193wrz.30.2022.01.11.05.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 05:00:31 -0800 (PST)
Message-ID: <0f5fac84-26f1-7304-6575-c3944f47cb7c@amsat.org>
Date: Tue, 11 Jan 2022 14:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] usb: allow max 8192 bytes for desc
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, kraxel@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
 <20211227142734.691900-5-pizhenwei@bytedance.com>
 <222c5015-399d-0ff0-e061-7dd3a947d4d4@amsat.org>
 <708c4228-d123-b403-09ff-b7d75bf1bba4@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <708c4228-d123-b403-09ff-b7d75bf1bba4@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 08:25, zhenwei pi wrote:
> 
> On 1/4/22 11:22 PM, Philippe Mathieu-Daudé wrote:
>> On 27/12/21 15:27, zhenwei pi wrote:
>>> A device of USB video class usually uses larger desc structure, so
>>> use larger buffer to avoid failure.
>>>
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>> ---
>>>   hw/usb/desc.c | 15 ++++++++-------
>>>   hw/usb/desc.h |  1 +
>>>   2 files changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
>>> index 8b6eaea407..7f6cc2f99b 100644
>>> --- a/hw/usb/desc.c
>>> +++ b/hw/usb/desc.c
>>> @@ -632,7 +632,8 @@ int usb_desc_get_descriptor(USBDevice *dev,
>>> USBPacket *p,
>>>       bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>>>       const USBDesc *desc = usb_device_get_usb_desc(dev);
>>>       const USBDescDevice *other_dev;
>>> -    uint8_t buf[256];
>>> +    size_t buflen = USB_DESC_MAX_LEN;
>>> +    g_autofree uint8_t *buf = g_malloc(buflen);
>>
>> Do we want to have a per-device desc_size (in USBDevice, default to
>> 256, video devices set it to 8K)?
>>
>> How "hot" is this path? Could we keep 8K on the stack?
>>
> It's an unlikely code path:
> 1, During guest startup, guest tries to probe device.
> 2, run 'lsusb' command in guest

If you have to respin, do you mind adding this 3 lines
in the description? Anyhow:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

