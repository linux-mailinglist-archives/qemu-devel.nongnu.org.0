Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C95373C76
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:35:33 +0200 (CEST)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHga-0002Gi-Qu
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1leHei-0001PA-2l
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:33:36 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1leHef-0007Av-IZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:33:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so3442671wmi.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OukDl24L8tqUJfvu1mmTYzQ2RbOmMweY+lkK6NtcEhE=;
 b=jy/OQVfAtlZq/XqLTprANuU+QtCcr12i2a5TJw9r8VI3WYFDaonuWjVLN424wOkEy3
 /au3B2qpOxwgA44jP4t23ecw2VYIkzTz3DsZU1kc5cytOPDsTdgG8E3jc+vvQ1M2auKY
 bjg/csd0tigyHKbAfbq2pJIZf29HIEgJcKS7bo4R1PMamMU9tx/LeupirmuGdqRoKOXj
 XdiKfwtv9h1EHNondggofuVyYIenAtcmEHZlxr/2ABWF8hi5IGBmX0QpxMpsHk/hGI/Y
 WJ3ZLtWIAwb5iyOtal+HS2ysZ8u+Q4bKC0AnfJiTGqvIE6re6zvfec9FymUG7XJpcs5+
 vJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OukDl24L8tqUJfvu1mmTYzQ2RbOmMweY+lkK6NtcEhE=;
 b=Z+97nR7zMvi5wu/jIwgNoLxqCJd3aBCSY2hfzN6MOIMKOUUCnrK4dBh5vPkdPAvn4z
 FlVx8l9raWYoqcJSKkqyifzS5RyVb85pwLnigZI5rNnZQX+Iv9WZVbIvHYq1WJ6DvcyT
 j/zgT4dmJ0qDzigzi9ongTggCLFRXrkLY41lJTHLp6Vvnbu5L18Gzx/wzXQogGGKL4j1
 80J4U7Q0F7kRIS/UWGlWH+QzKH1z9KFjo0tctZ198CxV0tjUlvb9gbeF6S9vGhIBBubp
 c09wa1XP5ubNDQF6AMyxFw6P8Omta0C2uTg3utJNDqLV4EVtQm3Yy5pbTssvY5JU5wBI
 4dSw==
X-Gm-Message-State: AOAM533bXxAgFWe1gM+dVgiWea+AttdySxelNUlKbDbkblKhqhv+fTww
 qmdjv5CqVlwWqvyTvkv8mmmWZw==
X-Google-Smtp-Source: ABdhPJxbkCQVh2yNE7RtX9g4l/Mqz6rrJWoPJoAE7QNl69f9UXYFGzjoUxuaZUED2nrLvDKVeym9sg==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr8232994wmh.69.1620221611173;
 Wed, 05 May 2021 06:33:31 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id j13sm19875052wrw.93.2021.05.05.06.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 06:33:30 -0700 (PDT)
Subject: Re: [PATCH] hw/avr/atmega.c: use the avr51 cpu for atmega1280
To: Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
 <7970a6ec-f5ac-bcc9-9184-d8450b64b116@amsat.org>
 <27cc1bc5-ee71-abf6-fd8f-58ec44e1767f@xcancerberox.com.ar>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <d8b05f93-ef5f-1697-439b-8961cb446cdf@adacore.com>
Date: Wed, 5 May 2021 15:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <27cc1bc5-ee71-abf6-fd8f-58ec44e1767f@xcancerberox.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 4/30/21 à 12:27 PM, Joaquin de Andres a écrit :
> On 4/28/21 9:17 PM, Philippe Mathieu-Daudé wrote:
>> Cc'ing Joaquín.
>>
>> On 4/28/21 9:15 PM, Frederic Konrad wrote:
>>> According to the as documentation:
>>>   (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)
>>>
>>> "Instruction set avr51 is for the enhanced AVR core with exactly 128K
>>>   program memory space (MCU types: atmega128, atmega128a, atmega1280,
>>>   atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
>>>   atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."
>>>
>>> But when compiling a program for atmega1280 or avr51 and trying to execute
>>> it:
>>>
>>> $ cat > test.S << EOF
>>>> loop:
>>>>      rjmp loop
>>>> EOF
>>> $ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
>>> $ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
>>>                    -bios test.elf
>>> qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with 'avr6' CPU
>>> qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU
>>>
>>> So this fixes the atmega1280 class to use an avr51 CPU.
>>>
>>> Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
>>> ---
>>>   hw/avr/atmega.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
>>> index 44c6afebbb..e3ea5702f5 100644
>>> --- a/hw/avr/atmega.c
>>> +++ b/hw/avr/atmega.c
>>> @@ -402,7 +402,7 @@ static void atmega1280_class_init(ObjectClass *oc, void *data)
>>>   {
>>>       AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
>>>   
>>> -    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
>>> +    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
>>>       amc->flash_size = 128 * KiB;
>>>       amc->eeprom_size = 4 * KiB;
>>>       amc->sram_size = 8 * KiB;
>>>
>>
> Good catch!
> 

Thanks, does that count as a reviewed-by :)?


