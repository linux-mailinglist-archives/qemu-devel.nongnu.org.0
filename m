Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F065DDB7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 21:32:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDAQG-0005CM-R3; Wed, 04 Jan 2023 15:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDAQ4-00057j-IC
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 15:31:28 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDAQ2-00080W-Lq
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 15:31:28 -0500
Received: by mail-ej1-x633.google.com with SMTP id u9so85612181ejo.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 12:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bIPpRrnE0Rhr64teQIEYWkkrQWx8D0b6KH2kdv/BMOU=;
 b=XhHBEnA4f8mhZ3yVCLwVQsmvCOEPT8aq7Kho0dcIJq4ckWIeCGk5poJQf/u1JAAEl6
 FLvi8y3bRDVh0hEqn8K+2E4ZKNmljlTN2aaJnKNqTXHIbYaNOT/QcIlUzjGCxY/R/5Lt
 cceZztWMmfckjqHFEzq7kRhNj2+JhAkG7l+abMf9n0O+Smo/DOBb8lUi2qehrm+9AJum
 ZMyxnhyhPIkC5OANoUck+OvtscKhz7A7u6DP7ctCw/E/18FVjhfAKH48jHEVMaJOkwNC
 Gxy97sr78eySGuhrJnbNeWHCnED9ox0M2FQ7o18tlBh+5toeB725WEyzuH3HzJHO5Yw2
 BCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bIPpRrnE0Rhr64teQIEYWkkrQWx8D0b6KH2kdv/BMOU=;
 b=4OUr9eY/+2s19nkIW5c3HPT/8qd80FGSfTgE5cd3AlI/5vVZF2GR0RGKMhGGnzb26O
 JMMQRQ33lxvQduQUtUFl0NPmFQaS8u7U6XOcJdXHdiYrK8vRdVDeG8iTvdYutkzPSLxS
 D5+r9TQ5iRuhzqQVjIHUsbE4FGI8ck4RC33TlW7+IdE8GgKf/bBuT6CRRodrg4vlAdyR
 KrNxHvVgOXlRX3KCZjw+F+F+ef0dgxGu5QnYogUA6cwADGKNH/4SsU5b51K8EzLOHa7v
 nc51owudVVf5yNoNH0jMKzYcEwZ2axQxoHr3iw30/BeLc/nmVwB6fKCoi8JEAYBwxiRR
 Z/iQ==
X-Gm-Message-State: AFqh2kpaP5vrHOYRjvtQ7XFbynDVdja8lQ7WXOQ4oCtppNxpdKe1MuhV
 Cw5IttoZFu3ZwI29AMweb/5Gy/b12A6NDj1a
X-Google-Smtp-Source: AMrXdXvP653NhmgK346gnvUBmd4DQJ38Z+K1uiKOkXhQ40rXi0hjFD8Of4O6UjPcvxBffUmfOKu3EQ==
X-Received: by 2002:a17:907:c498:b0:7ff:7876:9c60 with SMTP id
 tp24-20020a170907c49800b007ff78769c60mr42916394ejc.15.1672864282525; 
 Wed, 04 Jan 2023 12:31:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b007c4f8bc322asm15565516ejc.196.2023.01.04.12.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:31:22 -0800 (PST)
Message-ID: <719d01ad-424d-80eb-3c99-4c1120ed4b88@linaro.org>
Date: Wed, 4 Jan 2023 21:31:15 +0100
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
 <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
 <44D9DAA2-871D-4B42-99C8-748B2B65A78C@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <44D9DAA2-871D-4B42-99C8-748B2B65A78C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

On 4/1/23 21:12, Bernhard Beschow wrote:
> 
> 
> Am 4. Januar 2023 16:35:57 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 4/1/23 17:01, Bernhard Beschow wrote:
>>> Am 4. Januar 2023 14:37:29 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>> On 21/12/22 17:59, Bernhard Beschow wrote:
>>>>> Having a proxy PIC allows for ISA PICs to be created and wired up in
>>>>> southbridges. This is especially useful for PIIX3 for two reasons:
>>>>> First, the southbridge doesn't need to care about the virtualization
>>>>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>>>>> attached) and out-IRQs (which will trigger the IRQs of the respective
>>>>> virtzalization technology) are separated. Second, since the in-IRQs are
>>
>> Typo "virtualization".
> 
> Fixed...


>>>> Why restrict to 16 and not use a class property and allocate
>>>> on the heap? See TYPE_SPLIT_IRQ for example.
>>>
>>> TYPE_SPLIT_IRQ doesn't allocate on the heap and instead has a hardcoded limit of MAX_SPLIT_LINES which equals 16 ;)
>>>
>>> I was unsure on when to free the memory and how to dispose the elements so I went with this solution for simplicity. I'll look for inspitation in other device models and respin.
>>
>> Oh indeed. Well this model as is is OK, but it could be more useful
>> if able to proxy any range of IRQs.
> 
> I've responded with a new, single patch to this patch. Is that okay or shall I respin the whole series? Is anything missing? IIUC we can make the proxy-pic dynamic in a follow-up?

I think we are good :) If you can point me to a branch with all your 
patches, I could verify everything is properly applied locally.

>> I have the feeling we are cycling around this IRQ proxy:
>>
>> 22ec3283ef ("irq: introduce qemu_irq_proxy()")
>> 078778c5a5 ("piix4: Add an i8259 Interrupt Controller as specified in datasheet")
>> fc531e7cab ("Revert "irq: introduce qemu_irq_proxy()"")
>>
>> What is our problem? IRQ lines connect 2 devices in a fixed direction.
>> Current model expects one edge to be wired to a device before wiring
>> the other device, so device composition with IRQs in middle is
>> impossible? If so, this doesn't scale with dynamic machine creation.
> 
> My PIIX consolidation series and even more so my effort to make the VT82xx south bridges work with the PC machine are indeed bottom-up explorations of dynamic/flexible machine creation.

Yeah (I have been there too...). Also Mark Cave-Ayland confirmed
elsewhere in this thread that yourv effort points toward the right
direction :)

Regards,

Phil.

