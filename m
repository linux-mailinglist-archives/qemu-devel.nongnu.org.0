Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DC6487DB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hJU-00056c-Kj; Fri, 09 Dec 2022 12:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3hJS-00056P-Jz
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:37:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3hJQ-0000cc-UI
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:37:30 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 125-20020a1c0283000000b003d1e906ca23so334132wmc.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6WARyarXIyIMNwW9MUdwj+Sx42bxtduvA4Uz4ygp3o=;
 b=QI2H4//H4n9iOUf5qndymNuiore8OAMEhU6x46jdZZOVzIIXolYi8bAVua8+yk+m8n
 F3IeIIzVQ7JmI+TutQAXJyVm8wLzwCaigwadsdr4GXu3x22tKmVk68cXOKKfLD5mRfhJ
 dwR8+4IZudTJZLstfe670AE9HcMeE8qkbhzg1GQmM0geKdZb4Zz5jek2tRFOGYQHlzJF
 ThP67j/YjCCIi5iwCdrY5U0WdjCgdQynekVoK89TfaVa0eZc9dF1PoMW3GG4XQbyu3bG
 61/O+/XSVWfZmAKwtRHV3Qnoe6OfkOzYYkHn81xi1F3ITtSGfcoZqu131TZNqtjH0FQX
 s3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6WARyarXIyIMNwW9MUdwj+Sx42bxtduvA4Uz4ygp3o=;
 b=hmTPP0I5/D1DeoaRLGPoz+F2DfpULraNH+WjsqTmnfiz4mBO4kYhQVN2IQSZleSIvr
 wERZn0Qw4jTB85LDLJ84OZ2weR7RbVm9vslHyJCXWkWE8f7dUsAQ0/NQx5rihzi2TdyC
 pXutifswRihS3nWBuYWvWhr2E8N+aWEjVGTEauevAK40Bzawkx50RW8EhzAIRvs2Da3W
 o3ohKVWUBYKQmTNxx9FdnVypBmEDbOBPesm1cz0N9GZ4z7DjrWl3hfNFUkl+SzCgEwxa
 JMOPSdZjsVpZlnu2KShpibBp+Utnj4t7D5h5XLn+A+q1v7KXanAjY8JL6+rAluGV2qzv
 2j/A==
X-Gm-Message-State: ANoB5pnyffx6FwXKhz5I4pSs0MCibwdcJczExAJKN36GpLJoA4N8Ze43
 XzUrRU5nERmcuSyDBeoede1aEw==
X-Google-Smtp-Source: AA0mqf6GTxfqj+opunkYeSsJjKMmF+0mjpbJkcBtTj+iDSv4I1t2kfByf3rZ7HWmttchfMuiO/D6zA==
X-Received: by 2002:a05:600c:795:b0:3d1:cee0:46d0 with SMTP id
 z21-20020a05600c079500b003d1cee046d0mr5753590wmo.25.1670607446173; 
 Fri, 09 Dec 2022 09:37:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003c6cd82596esm290973wms.43.2022.12.09.09.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 09:37:25 -0800 (PST)
Message-ID: <2b58e94b-2304-1c54-66d9-e039a1e8227a@linaro.org>
Date: Fri, 9 Dec 2022 18:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 3/3] hw/tpm: Move tpm_ppc.c out of target-specific
 source set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20221209170042.71169-1-philmd@linaro.org>
 <20221209170042.71169-4-philmd@linaro.org>
 <9ce14b12-b993-58bc-bc63-d189b83692f0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9ce14b12-b993-58bc-bc63-d189b83692f0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 18:14, Thomas Huth wrote:
> On 09/12/2022 18.00, Philippe Mathieu-Daudé wrote:
>> The TPM Physical Presence Interface is not target specific.
>> Build this file once for all targets.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/tpm/meson.build | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>> index 1c68d81d6a..3eacbe8c5d 100644
>> --- a/hw/tpm/meson.build
>> +++ b/hw/tpm/meson.build
>> @@ -3,6 +3,6 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: 
>> files('tpm_tis_isa.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: 
>> files('tpm_tis_sysbus.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>> -specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: 
>> files('tpm_ppi.c'))
>> -specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: 
>> files('tpm_ppi.c'))
>> +softmmu_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: 
>> files('tpm_ppi.c'))
>> +softmmu_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: 
>> files('tpm_ppi.c'))
>>   specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: 
>> files('tpm_spapr.c'))
> 
> Typo in the subject: ppc ==> ppi
> 
> Then, while you're at it: Why is it checking the CONFIG_SOFTMMU switch 
> here, too? I fail to see why this is necessary here, we never check this 
> for other files that we put into specific_ss or softmmu_ss.

We don't need it, I simply neglected to remove it :/

