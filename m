Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C32415BB2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:03:26 +0200 (CEST)
Received: from localhost ([::1]:53736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLZc-0006g4-2e
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLWg-0004Iw-KG
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:00:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLWd-0004lU-EY
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:00:22 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so15465498wrr.9
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QoJUiTYXu267JmroK1OYx3UsmDzuSTP5fsLeIy6839w=;
 b=UsPnOzCtpTAo4bWhgbY2C5Af6iQfyiOVA/4NKIwONBPnLxkiK9SMfnmxm3ncwQCiJO
 11Q08xoPqQXAo9UN0fYHB43xDoCg/nkmEl0gOVlCFF6bxZQt5T3uPuNm+cjkTh4/8Dr4
 4UsI0NnZU8lB5ULLZLhkQwEF8JteCbz1GngzJD3eJ081abDAKYzJc7WTCEIrI7RNsMPP
 kNkdMVo9zUltBmsJttIie2pbNuVGVie6wIbHx6xuGJlDvBrwrY5B/bRXcUbHFKZ6qbfz
 IjTBTYm4ZbvNZkt4hHfwYtijXa4czDN8lWV9pipJCO7sgMRstyIK7NGFb6EOoDqvxqlc
 C/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QoJUiTYXu267JmroK1OYx3UsmDzuSTP5fsLeIy6839w=;
 b=wAg4jJkTh8Q81/ZIlW2oVvwTwKZSKg++zZdl3Bz18KqMBTDX56BYcNRiukyE2vlGmw
 Xlff/brdiCCRE1cexpd8aYl/7xWKoenDtOnSXSqtVOU3ThUoaqnQJaGUU3im1f1pJK7v
 TfYxbFkSd3q7nv5/QDsWY20sKyyLmxgI7iS3h8/KtQp4pu//A9qIGO1DZJYEm4V7iL3X
 5JQxpoBpeS/4LNEkRCEb3JxQbXNWUDqb2YYxhSf2wtinXfSBcB8OViojkPedtMmXmGZj
 L/z24K/jOof28aJaFw+f6x5beICPZRd1xLb5ZEQseC3Ug6WtOgEPq4tseCHVDDUQIva/
 YbVA==
X-Gm-Message-State: AOAM5324YOlcCJClhBvQTlpU43/Lwco7+Tn86i2nuGX46IEF3qj+mUtM
 aZ+qv2Kihi2aDVqOkveNKik=
X-Google-Smtp-Source: ABdhPJxxvkQ6RUWAUJxwjaJ/TcndED6s+nrhdPhx1Vtl1NkrmULUoYdCUVmOdpH8VniXhrzbke7kWg==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr4107280wrq.146.1632391217840; 
 Thu, 23 Sep 2021 03:00:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i27sm8765891wmb.40.2021.09.23.03.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:00:17 -0700 (PDT)
Message-ID: <aac1894b-e515-cbc7-5b51-aaddc6fc3de4@amsat.org>
Date: Thu, 23 Sep 2021 12:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210923081555.3648310-1-pbonzini@redhat.com>
 <YUw5Pglv2lcS2Nz6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YUw5Pglv2lcS2Nz6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 10:22, Daniel P. Berrangé wrote:
> On Thu, Sep 23, 2021 at 04:15:55AM -0400, Paolo Bonzini wrote:
>> Skip the test if bzip2 is not available, and run it after they are
>> uncompressed.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   pc-bios/meson.build     | 3 ++-
>>   tests/qtest/meson.build | 6 +++---
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
>> index f2b32598af..975565198e 100644
>> --- a/pc-bios/meson.build
>> +++ b/pc-bios/meson.build
>> @@ -10,8 +10,9 @@ if install_edk2_blobs
>>       'edk2-x86_64-secure-code.fd',
>>     ]
>>   
>> +  roms = []
>>     foreach f : fds
>> -    custom_target(f,
>> +    roms += custom_target(f,
>>                     build_by_default: have_system,
>>                     output: f,
>>                     input: '@0@.bz2'.format(f),
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index e1f4df3df8..6d8100c9de 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -68,12 +68,12 @@ qtests_i386 = \
>>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>> +  (install_edk2_blobs ? ['bios-tables-test'] : []) +                                        \
>>     qtests_pci +                                                                              \
>>     ['fdc-test',
>>      'ide-test',
>>      'hd-geo-test',
>>      'boot-order-test',
>> -   'bios-tables-test',
>>      'rtc-test',
>>      'i440fx-test',
>>      'fw_cfg-test',
>> @@ -180,7 +180,7 @@ qtests_arm = \
>>   
>>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>>   qtests_aarch64 = \
>> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>> +  (cpu != 'arm' and install_edk2_blobs ? ['bios-tables-test'] : []) +                           \
>>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>>     ['arm-cpu-features',
>> @@ -269,7 +269,7 @@ foreach dir : target_dirs
>>     qtest_emulator = emulators['qemu-system-' + target_base]
>>     target_qtests = get_variable('qtests_' + target_base, []) + qtests_generic
>>   
>> -  test_deps = []
>> +  test_deps = roms
> 
> Shouldn't this be
> 
>    if install_edk2_blobs
>       test_deps += roms
>    endif

See also "blobs: Only install required (system emulation) files":
https://lore.kernel.org/qemu-devel/20210323155132.238193-1-f4bug@amsat.org/

