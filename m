Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF53651FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7arX-0002T5-Am; Tue, 20 Dec 2022 06:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7arU-0002QC-KX
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:32:44 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7arS-0007hD-Qz
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:32:44 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so10918628wmh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ru7RHyUGJodXtTkYHPyt/8m3CYfqityYbsfTzG6OfXw=;
 b=hlGuuK3TZx+JdjE9LD/pwTa70KGrcNmUyZzlbYkfPQm0orcPvwR7NcC94sHs07vY0j
 DhpVgikHudtzBvrLxle1WwmYIjwSPLdzc7jOZM3tQH6y060cNPSCRplYCQeKsdTrqt2c
 jw91B/xvsqgKl1l5QSHgxLEOxrk8e6WFu4Cau81L7pwVdr+3zlY7bPpm+LQlFWg4eBHo
 YjbaCJ6fBQhDf+fC9an6QdztRxDtvudc0bigqOIjEEFN/LkYatQz3EqJkQ16E66AH/aN
 yS7tTw2XGPdtrsrnRjXFJ4/cCtZfHKFXqPTT+Ku2f9PhQ8IyrAmVpd/eaE8LyJjuTvXN
 EymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ru7RHyUGJodXtTkYHPyt/8m3CYfqityYbsfTzG6OfXw=;
 b=GKcHXrAbBACJdSMDUrhn50qIeY+hO/k+GovF7hQNQeN4YKUp4wBuotdZr3eLzS0c1N
 syj+y4PQiRHi4OjQKK6SOS3llogM4waTrAMtf91ces5oU54UoHKtXGgemlCrBWKoZRXT
 5QJoZOyv2N8boKYie++FKV4mVNwirRbF388IereQtxDutUimOzTkHVLhgsfmyaDksnUk
 ZQdf7K7MqU9thZ5cuOLxIYUsvPaF7EJXXp19dotmckFHixrR14W5yjo+9dg0wnIr/MEt
 1EJdoWG2jsUGV1EirgTX74fd5zTJB8Kifbjbtz8P2L7EcuBiVAj4cg8ktdiz0EVWHQal
 AM9A==
X-Gm-Message-State: AFqh2kpF496nGckWxxjqhR/bVZXpBc8gsJd/xONuL50yinSCk1oL2R6X
 eXw3D5r3Wy+PKSxevK2pUXe7cg==
X-Google-Smtp-Source: AMrXdXtzC9z8fSswnQ2V6Hnow1ihX/kZA7zDkfKD81ezDQ7Ps8JMRUBEBFZgfs6kCD0y6IfgKXHwdQ==
X-Received: by 2002:a05:600c:a13:b0:3d3:4ead:bb07 with SMTP id
 z19-20020a05600c0a1300b003d34eadbb07mr7806758wmp.5.1671535960976; 
 Tue, 20 Dec 2022 03:32:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i26-20020a1c541a000000b003c6c182bef9sm26783390wmb.36.2022.12.20.03.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:32:40 -0800 (PST)
Message-ID: <0eb9f4d6-7d54-8156-61ce-d4296c9d5dc9@linaro.org>
Date: Tue, 20 Dec 2022 12:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH-for-8.0 5/7] hw/mips/malta: Explicit GT64120 endianness
 upon device creation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-6-philmd@linaro.org>
 <95fe4231-ee7a-ff1a-4804-0e294e0adb58@linaro.org>
 <c8a2c501-efcf-e528-5ddc-21b286ce8926@linaro.org>
In-Reply-To: <c8a2c501-efcf-e528-5ddc-21b286ce8926@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 09:30, Philippe Mathieu-Daudé wrote:
> +Eduardo/Markus for QOM/QDEV clarification.
> 
> On 20/12/22 01:52, Richard Henderson wrote:
>> On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
>>> Propagate the controller endianess from the machine, setting
>>> the "cpu-little-endian" property.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/mips/malta.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> Modulo using qdev_prop_set_bool,
> 
> Surprisingly there is no qdev_prop_set_bool()... I can use the QOM layer
> with object_property_add_bool(), i.e.:
> 
> $ git grep memory-hotplug-support
> hw/acpi/ich9.c:451:    object_property_add_bool(obj, 
> "memory-hotplug-support",
> hw/acpi/piix4.c:608:    DEFINE_PROP_BOOL("memory-hotplug-support", 
> PIIX4PMState,

Oops I meant:

$ git grep reset-hivecs
hw/arm/digic.c:55:    if (!object_property_set_bool(OBJECT(&s->cpu), 
"reset-hivecs", true,
hw/arm/npcm7xx.c:469: 
object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
hw/arm/xlnx-zynqmp.c:246: 
object_property_set_bool(OBJECT(&s->rpu_cpu[i]), "reset-hivecs", true,
target/arm/cpu.c:1245:            DEFINE_PROP_BOOL("reset-hivecs", 
ARMCPU, reset_hivecs, false);

> But I notice some qdev_prop_set_bit() uses, i.e. in hw/arm/:
> 
> $ git grep enable-bitband
> hw/arm/armv7m.c:528:    DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, 
> enable_bitband, false),
> hw/arm/mps2.c:242:    qdev_prop_set_bit(armv7m, "enable-bitband", true);
> hw/arm/msf2-soc.c:138:    qdev_prop_set_bit(armv7m, "enable-bitband", 
> true);
> hw/arm/stellaris.c:1070:    qdev_prop_set_bit(nvic, "enable-bitband", 
> true);
> hw/arm/stm32f100_soc.c:119:    qdev_prop_set_bit(armv7m, 
> "enable-bitband", true);
> 
> In that case this patch doesn't require any change.

I'll keep qdev_prop_set_bit() which is simpler.

>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Thanks!
> 
>>>
>>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>>> index ba92022f87..1f4e0c7acc 100644
>>> --- a/hw/mips/malta.c
>>> +++ b/hw/mips/malta.c
>>> @@ -1390,7 +1390,9 @@ void mips_malta_init(MachineState *machine)
>>>       stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>>>       /* Northbridge */
>>> -    dev = sysbus_create_simple("gt64120", -1, NULL);
>>> +    dev = qdev_new("gt64120");
>>> +    qdev_prop_set_bit(dev, "cpu-little-endian", !be);
>>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>>       pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
>>>       /* Southbridge */
>>
> 


