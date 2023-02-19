Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88469C067
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 14:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTk0v-0005X5-2U; Sun, 19 Feb 2023 08:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pTk0m-0005U2-PZ
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 08:45:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pTk0l-0002ID-7e
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 08:45:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o9-20020a05600c510900b003ddca7a2bcbso473878wms.3
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 05:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pQnDFDDvTp5KUClinFtwJGTnujum+LjiNBDs1OO8h7Y=;
 b=L9wQ2WFmdXcCJIkp58R2er1g21mV9mAVkZ+OPAgZGIYaCXzyXyOb7t0YXxCgnjxmbM
 ACJnWjlBgxcWc+LLaguFhcxnYdm5PYkdjF4eaRS3c3jP14y9zh7via6W6ahiGIFB9lb7
 3/m3gvYWXuU2gs8pkRnoC6lHhOC7b98FVvm2DEHmfMLRWxeZb+LE8znjeu/jb7yGM5wk
 E4UMyjjfldGUjT+Pt44w1PaVKozYeLe8fEolIWix409gHcQa7SWuYUgV2SXNWJkUB92y
 emyu/ZYx7cT8gMgBDqS2WxQsbt+t7TZeHHG0z71zRRgGQdiOVK2U2BxNn71oiLzs0H6K
 qLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQnDFDDvTp5KUClinFtwJGTnujum+LjiNBDs1OO8h7Y=;
 b=qr2yA93eBBfAMD5PLJ3P5soOh3NbiPlHVX0Rxjzg55MHcZATAyXm1ZwQpYUAighyHW
 gB3YmGVgcjFYvPzBT+ObCe7MLOKE6Pl1F9SW+nQc9CjD06AkMfZU5KyKNwx5A7nfvGVq
 vRoXIggC/RyNYj5zDneX6APbrULOttiIuE4esFsyMLGPQCER3Txf971fcFudVSsajGcw
 4T64mXihAvrfAQKKg+xiFDusvIA1auFuHsw2W7KlLbmKcK1E/KScLClme8JnZL7Ai6dw
 EZeQuvrTREsNe5RsSplE7x1VgvHk7Ggi3XXTwTTvqBBVDkN0gVCDCT3w8yJ7CKsXE/Fg
 TGgA==
X-Gm-Message-State: AO0yUKU0EozgPfnwCsawhWFlBBLcsPFxTyH+lljKeJOs2xh6ZcaQUatn
 oNDIbrg9TaMdDlZIHBtk21eMcQ==
X-Google-Smtp-Source: AK7set9aNWd4LGAnHgdufOmk6nnh/1hf5sFYp3RhK8yOkoevmSysNb0r2DFYYIrVbJgvCmAAmozfjA==
X-Received: by 2002:a05:600c:3297:b0:3e2:12a2:ecdc with SMTP id
 t23-20020a05600c329700b003e212a2ecdcmr8587041wmp.25.1676814348202; 
 Sun, 19 Feb 2023 05:45:48 -0800 (PST)
Received: from [192.168.3.175] (225.red-88-28-18.dynamicip.rima-tde.net.
 [88.28.18.225]) by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0a5200b003e118684d56sm6416325wmq.45.2023.02.19.05.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 05:45:47 -0800 (PST)
Message-ID: <be6582a8-1032-a96f-8468-d5e2aeba938b@linaro.org>
Date: Sun, 19 Feb 2023 14:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 05/12] hw/i2c/smbus_ich9: Inline ich9_smb_init() and
 remove it
To: minyard@acm.org, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-6-shentey@gmail.com> <Y/E0KN6slRJucBms@minyard.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y/E0KN6slRJucBms@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 18/2/23 21:25, Corey Minyard wrote:
> On Mon, Feb 13, 2023 at 06:30:26PM +0100, Bernhard Beschow wrote:
>> ich9_smb_init() is a legacy init function, so modernize the code.
>>
>> Note that the smb_io_base parameter was unused.
> 
> Acked-by: Corey Minyard <cminyard@mvista.com>
> 
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   include/hw/i386/ich9.h |  1 -
>>   hw/i2c/smbus_ich9.c    | 13 +++----------
>>   hw/i386/pc_q35.c       | 11 ++++++++---
>>   3 files changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
>> index 05464f6965..52ea116f44 100644
>> --- a/include/hw/i386/ich9.h
>> +++ b/include/hw/i386/ich9.h
>> @@ -9,7 +9,6 @@
>>   #include "qom/object.h"
>>   
>>   void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
>> -I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
>>   
>>   void ich9_generate_smi(void);
>>   
>> diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
>> index d29c0f6ffa..f0dd3cb147 100644
>> --- a/hw/i2c/smbus_ich9.c
>> +++ b/hw/i2c/smbus_ich9.c
>> @@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
>>       pm_smbus_init(&d->qdev, &s->smb, false);
>>       pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
>>                        &s->smb.io);
>> +
>> +    s->smb.set_irq = ich9_smb_set_irq;
>> +    s->smb.opaque = s;

Corey, shouldn't we expand pm_smbus_init() to take set_irq / opaque
arguments?

>>   }


