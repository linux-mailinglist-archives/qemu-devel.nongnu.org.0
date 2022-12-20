Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00496651C58
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Y1C-0005K2-Rn; Tue, 20 Dec 2022 03:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Y0r-0005Iz-GX
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:30:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Y0p-0006EV-Iy
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:30:13 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so8149226wms.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 00:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oPTkGFdOHtdL6hmZPtQigSJHr3Kx3KD2sbk9A9tz+/o=;
 b=wTg3aR/I1TTXxt+5GbyrC81ZqZQAqRLUKMPgzxTgsIUt5veoZy1LtiAJso/g4xncvf
 3g+di1VAc311uQebRWm/K8hc+RyfIw3EVUGJt6I8jbye2UpPlZKkVymr5Bctpk5nm+ez
 /Sd7Mw0uCFAcB+5Ojl4VZFQQfs5MBIGPviTwX8wHaU4gR8n55Q9qBzCEqNCiW/dbYC6A
 SGPO8i0EJEtL8Bqh1vIpcwDYSg7kua6o/gDXpWYLQEQIZ7A6FkT+C3ouSOGfmgqELcxc
 CKbZ4rkTdWWhdD8WoaCw72dsbYUtPJ4Vb8aJzKdfyji+Bt/xFJ8R6uKposDkuyPYvSUa
 O1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oPTkGFdOHtdL6hmZPtQigSJHr3Kx3KD2sbk9A9tz+/o=;
 b=T9S0K7oKfJD4gDr6bHieSWyiUYI03Vjl/DRMJ9b/lD6fHqgwCQIGw+5pPaTLJMES3Y
 UU1RYEPhtYz0aOHNSQSKf+ldly6X1ELkY1FQCYTRTFu7N9cbCDYTx+XJkqk6xyzFYepc
 MMxkoDRXmJ02Ny8MzTIgTDNt0bRSdovI608PwTseB9be8A7fBB1VgdA/yu04wcpj10Le
 r1kSFX+8xUboh+xhkVF1GNhcEsstclELd76mgAe9+HIl3HLkmmDo6M5uOjO/MF4V5gkW
 8LEfof7I3gv9a/SSRkrNyhNwRmxHb2VLJEX7sSkHvT/UwTWyU3ULTfgzcjuBpEBrr+3y
 gfng==
X-Gm-Message-State: AFqh2koaSlrl1Qijf9aQffTQb66txSEDFb2Fz34IvR4cMJUTuwqk5f7g
 7xNpm2D+3J8IxXLnnfkrQN7KKXLpNiNldopEhaQ=
X-Google-Smtp-Source: AMrXdXsZeYD3AXOEs91c2M297BZNkmEH5a5H4NMf7EjPsxfrZ863GP7pyLxVUxZ1C+wMlCNV987xBg==
X-Received: by 2002:a05:600c:4e09:b0:3d0:80e1:5995 with SMTP id
 b9-20020a05600c4e0900b003d080e15995mr830502wmq.24.1671525009934; 
 Tue, 20 Dec 2022 00:30:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c358200b003d1f2c3e571sm24152715wmq.33.2022.12.20.00.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 00:30:09 -0800 (PST)
Message-ID: <c8a2c501-efcf-e528-5ddc-21b286ce8926@linaro.org>
Date: Tue, 20 Dec 2022 09:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 5/7] hw/mips/malta: Explicit GT64120 endianness
 upon device creation
Content-Language: en-US
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <95fe4231-ee7a-ff1a-4804-0e294e0adb58@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

+Eduardo/Markus for QOM/QDEV clarification.

On 20/12/22 01:52, Richard Henderson wrote:
> On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
>> Propagate the controller endianess from the machine, setting
>> the "cpu-little-endian" property.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/mips/malta.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Modulo using qdev_prop_set_bool,

Surprisingly there is no qdev_prop_set_bool()... I can use the QOM layer
with object_property_add_bool(), i.e.:

$ git grep memory-hotplug-support
hw/acpi/ich9.c:451:    object_property_add_bool(obj, 
"memory-hotplug-support",
hw/acpi/piix4.c:608:    DEFINE_PROP_BOOL("memory-hotplug-support", 
PIIX4PMState,

But I notice some qdev_prop_set_bit() uses, i.e. in hw/arm/:

$ git grep enable-bitband
hw/arm/armv7m.c:528:    DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, 
enable_bitband, false),
hw/arm/mps2.c:242:    qdev_prop_set_bit(armv7m, "enable-bitband", true);
hw/arm/msf2-soc.c:138:    qdev_prop_set_bit(armv7m, "enable-bitband", true);
hw/arm/stellaris.c:1070:    qdev_prop_set_bit(nvic, "enable-bitband", true);
hw/arm/stm32f100_soc.c:119:    qdev_prop_set_bit(armv7m, 
"enable-bitband", true);

In that case this patch doesn't require any change.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

>>
>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>> index ba92022f87..1f4e0c7acc 100644
>> --- a/hw/mips/malta.c
>> +++ b/hw/mips/malta.c
>> @@ -1390,7 +1390,9 @@ void mips_malta_init(MachineState *machine)
>>       stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>>       /* Northbridge */
>> -    dev = sysbus_create_simple("gt64120", -1, NULL);
>> +    dev = qdev_new("gt64120");
>> +    qdev_prop_set_bit(dev, "cpu-little-endian", !be);
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>       pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
>>       /* Southbridge */
> 


