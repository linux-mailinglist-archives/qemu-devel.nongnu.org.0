Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D53E82D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:21:01 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDWN1-0001P1-G9
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDWLD-0000Jg-8u; Tue, 10 Aug 2021 14:19:07 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDWLB-0006FM-Bd; Tue, 10 Aug 2021 14:19:07 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 f33-20020a4a89240000b029027c19426fbeso5576228ooi.8; 
 Tue, 10 Aug 2021 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ioSh5jkDrnRsdX5nqCnftjHFXdUlgh2KyGUM+scEUBY=;
 b=m/KVHAz2cho45IptUYukTvI2vCQgpHRLNGEgHNv/HIBc6o+M7vQr8gvivcL1gCOxwe
 EqMTZBgfs8G2GKk7i3c5ZosxGdDi+BjVP8O+XfniJ5HV0oSPDrmgzr1sWTerchFIT07z
 2fjmy2C+8r6X5NPs+7zxr0jVDuzpZRmvleAxFGbt75WLJzgltcUZh9rGujYLtgB1E0oq
 QVad/lkNEqglko4IqRasYTzjw/IcPglIhCcBGMVkkBFOnCoDPeLeeOHaUbm8CerU1U0w
 O+05NOZgDunrQ7TfREHiSBLD6kywTIdlXYC06z4LpToXlfEljoKxTTHays4Jm7zwf2Ax
 j1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ioSh5jkDrnRsdX5nqCnftjHFXdUlgh2KyGUM+scEUBY=;
 b=aJVh2Y0/a20WbzX4bSEMaYGpZA90GHP5yz79a/LswdHeZEAMZcfHi/aZVYtb5q+DUC
 Qjlz2L+o1TpzbJyIdpJayNN8NK0doOJISOi+iVVAsd5f1mvbNmc/He8Zi5poOKfE0sfS
 KOjZR7MazqoUr3XVsxGHXxSCUAD80wESp/03ATCCcSnkqninpgWHcWPh7N9td0iCq+3a
 AxOnuuq6mv1TvJg3Mql7S0eod5MDrxFJ/haMnvVR+iwaCmVqRhxNaRWd0wjfF5WIzr3p
 8LAn9ZbqYQ5hnj78fL8nxO6uf9TKaHzW/DTIEahWt4SEobai3mxwexHbOx8Sc/VxJA4X
 ZQfw==
X-Gm-Message-State: AOAM531o0T8lfJQdk72XUvgflS5JPZPyJWwC5wm1+mve11kJMo3pCJIa
 qiGdisCmaAQt5Y9PcmSo3l0=
X-Google-Smtp-Source: ABdhPJyj9csf8lREzWw41AuHVGZdUu8Pa4c+Se/UaojWnCPg4A4TLcEwGlLmDb0S7VFcDDz4ykNing==
X-Received: by 2002:a4a:98e1:: with SMTP id b30mr17570457ooj.34.1628619543864; 
 Tue, 10 Aug 2021 11:19:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c11sm3973161otm.37.2021.08.10.11.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 11:19:03 -0700 (PDT)
Subject: Re: [PATCH v2] fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as
 unimplemented devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210810160318.87376-1-linux@roeck-us.net>
 <6e8a0fb5-04e9-d6e6-989a-41de4eacf303@amsat.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <18e4325c-fda0-ad11-5275-28202001acec@roeck-us.net>
Date: Tue, 10 Aug 2021 11:19:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6e8a0fb5-04e9-d6e6-989a-41de4eacf303@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 9:34 AM, Philippe Mathieu-Daudé wrote:
> On 8/10/21 6:03 PM, Guenter Roeck wrote:
>> Instantiate SAI1/2/3 and ASRC as unimplemented devices to avoid random
>> Linux kernel crashes, such as
>>
>> Unhandled fault: external abort on non-linefetch (0x808) at 0xd1580010^M
>> pgd = (ptrval)^M
>> [d1580010] *pgd=8231b811, *pte=02034653, *ppte=02034453^M
>> Internal error: : 808 [#1] SMP ARM^M
>> ...
>> [<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)^M
>> [<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)^M
>> [<c09580f4>] (_regmap_write) from [<c095837c>] (_regmap_update_bits+0xe4/0xec)^M
>> [<c095837c>] (_regmap_update_bits) from [<c09599b4>] (regmap_update_bits_base+0x50/0x74)^M
>> [<c09599b4>] (regmap_update_bits_base) from [<c0d3e9e4>] (fsl_asrc_runtime_resume+0x1e4/0x21c)^M
>> [<c0d3e9e4>] (fsl_asrc_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)^M
>> [<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)^M
>> [<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)^M
>> [<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)^M
>> [<c0942dfc>] (__pm_runtime_resume) from [<c0d3ecc4>] (fsl_asrc_probe+0x2a8/0x708)^M
>> [<c0d3ecc4>] (fsl_asrc_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)^M
>> [<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)^M
>> [<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)^M
>> [<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)^M
>> [<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)^M
>> [<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)^M
>> [<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)^M
>> [<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)^M
>> [<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)^M
>> [<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)^M
>> [<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)^M
>> [<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)^M
>>
>> or
>>
>> Unhandled fault: external abort on non-linefetch (0x808) at 0xd19b0000^M
>> pgd = (ptrval)^M
>> [d19b0000] *pgd=82711811, *pte=308a0653, *ppte=308a0453^M
>> Internal error: : 808 [#1] SMP ARM^M
>> ...
>> [<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)^M
>> [<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)^M
>> [<c09580f4>] (_regmap_write) from [<c0959b28>] (regmap_write+0x3c/0x60)^M
>> [<c0959b28>] (regmap_write) from [<c0d41130>] (fsl_sai_runtime_resume+0x9c/0x1ec)^M
>> [<c0d41130>] (fsl_sai_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)^M
>> [<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)^M
>> [<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)^M
>> [<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)^M
>> [<c0942dfc>] (__pm_runtime_resume) from [<c0d4231c>] (fsl_sai_probe+0x2b8/0x65c)^M
>> [<c0d4231c>] (fsl_sai_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)^M
>> [<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)^M
>> [<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)^M
>> [<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)^M
>> [<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)^M
>> [<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)^M
>> [<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)^M
>> [<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)^M
>> [<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)^M
>> [<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)^M
>> [<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)^M
>> [<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)^M
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Updated description to include tracebacks and to use the term 'instantiate'
>>      Added inline comments describing devices in more detail
> 
> Thank you!
> 
> Peter you might want to s/^M// when queueing ;)
> 

Outch. Sorry for that.

Guenter

>>      Added Philippe's Reviewed-by: tag
>>
>>   hw/arm/fsl-imx6ul.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
>> index e0128d7316..1d1a708dd9 100644
>> --- a/hw/arm/fsl-imx6ul.c
>> +++ b/hw/arm/fsl-imx6ul.c
>> @@ -534,6 +534,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>>        */
>>       create_unimplemented_device("sdma", FSL_IMX6UL_SDMA_ADDR, 0x4000);
>>   
>> +    /*
>> +     * SAI (Audio SSI (Synchronous Serial Interface))
>> +     */
>> +    create_unimplemented_device("sai1", FSL_IMX6UL_SAI1_ADDR, 0x4000);
>> +    create_unimplemented_device("sai2", FSL_IMX6UL_SAI2_ADDR, 0x4000);
>> +    create_unimplemented_device("sai3", FSL_IMX6UL_SAI3_ADDR, 0x4000);
>> +
>>       /*
>>        * PWM
>>        */
>> @@ -542,6 +549,11 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>>       create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
>>       create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
>>   
>> +    /*
>> +     * Audio ASRC (asynchronous sample rate converter)
>> +     */
>> +    create_unimplemented_device("asrc", FSL_IMX6UL_ASRC_ADDR, 0x4000);
>> +
>>       /*
>>        * CAN
>>        */
>>


