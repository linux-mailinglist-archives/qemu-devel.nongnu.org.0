Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E466139E7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWa2-0005dd-6q; Mon, 31 Oct 2022 11:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWZQ-0005Tj-Br
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:19:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWZL-00051T-IJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:19:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id cl5so4795320wrb.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nwJ+fMuz46L52kiDh3YKLd3VXj3ugX9hi+qXZFXv57s=;
 b=PApmtTbaXCW+uNR3GEbFgiRcndzwQ1VSu9YqSecF80sli55X2GIsY2zSpprIKd33qD
 hYEoIeD9n1Rb3bExB9SsHfWJhjm0rFFZI85FWcTQ4BT6EsteEI4bKNn6Wexqsn8pSSW4
 H5VF8iXdXyJ+IE1MXSRnc/2kG6grsAYIXv5tatkUp0r4SsmPI+DdJ+5GFf0ltC9FJa+i
 5ndrvMT/FdLE4H7HYne+m147OEkaHg+q8T0smHbM+5tQ9sc+tJH9KyRG1lBM4yayx7Xg
 2tsttHu+E5Qnp2xbO7I/KU1D3YQQ823ced7XRJeUES3v/4QkST/gSbpond2ClWubEoKg
 PTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwJ+fMuz46L52kiDh3YKLd3VXj3ugX9hi+qXZFXv57s=;
 b=UjhbOvSWiipdxSiS1p+9nJ1vxelggpSL/zUJfN316vIYDqP11J2gUWbGgqq2qlQ3Yz
 X7ozDfWgTDTfiEQGIu/mzgnNSUoShvT6m8oFQxxBZrbyq4BCFy0faNetiY3G8F8B9JXo
 Ztd8PVO4MGNpHRMCfMccfskXL0ChnsZXddb7nU5n7lmKm4NDpfCGK51okVDXNbroM414
 hOGlCLdcWiCQLZ1cMwQ4w/DEyAO8DSFsDqT54KR2WwyOYvNdXomCdgFcRDY6iBwGdKCd
 z/XdUsajkQz8dHsPmLM+BJoWqzvhc/fshAnPiU/tF/kvPegNzQ/lYn6XKhmeIi4Uy38Y
 JkyQ==
X-Gm-Message-State: ACrzQf1Xy2nu4zgqOR3OB6zAUsks4lnLo4dWKMl8Fp2wgXBuvlkPOBRr
 ij8WMsHbAQE8haNpcv7q6KggW1qpno5JLg==
X-Google-Smtp-Source: AMsMyM6x0ob3wB09LBbIy+XOXyBE4xLMizlmb4IuSHfLj+4WrrLX2Sc4B+ahylCW1OkWodSCQ9dtwQ==
X-Received: by 2002:a5d:6dac:0:b0:236:6018:ebee with SMTP id
 u12-20020a5d6dac000000b002366018ebeemr8079397wrs.202.1667229556820; 
 Mon, 31 Oct 2022 08:19:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a5d64c5000000b0022cd96b3ba6sm9441063wri.90.2022.10.31.08.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 08:19:16 -0700 (PDT)
Message-ID: <a8b99460-ce81-1fea-764b-843c290f9810@linaro.org>
Date: Mon, 31 Oct 2022 16:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 6/6] hw/ppc/e500: Add Freescale eSDHC to e500plat
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20221031115402.91912-1-philmd@linaro.org>
 <20221031115402.91912-7-philmd@linaro.org>
 <3b1b2608-76c5-3376-2c15-792ccbf623dd@linaro.org>
In-Reply-To: <3b1b2608-76c5-3376-2c15-792ccbf623dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 16:12, Philippe Mathieu-Daudé wrote:
> On 31/10/22 12:54, Philippe Mathieu-Daudé wrote:
>> From: Bernhard Beschow <shentey@gmail.com>
>>
>> Adds missing functionality to e500plat machine which increases the
>> chance of given "real" firmware images to access SD cards.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Message-Id: <20221018210146.193159-8-shentey@gmail.com>
>> [PMD: Simplify using create_unimplemented_device("esdhc")]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   docs/system/ppc/ppce500.rst | 12 ++++++++++
>>   hw/ppc/Kconfig              |  2 ++
>>   hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
>>   hw/ppc/e500.h               |  1 +
>>   hw/ppc/e500plat.c           |  1 +
>>   5 files changed, 63 insertions(+), 1 deletion(-)
> 
>> @@ -992,6 +1018,26 @@ void ppce500_init(MachineState *machine)
>>       i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
>>       i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
>> +    /* eSDHC */
>> +    if (pmc->has_esdhc) {
>> +        uint64_t sdhci_regsize;
>> +
>> +        dev = qdev_new(TYPE_SYSBUS_SDHCI);
>> +        /*
>> +         * Compatible with:
>> +         * - SD Host Controller Specification Version 2.0 Part A2
>> +         */
>> +        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
>> +        s = SYS_BUS_DEVICE(dev);
>> +        sysbus_realize_and_unref(s, &error_fatal);
>> +        sysbus_mmio_map(s, 0, pmc->ccsrbar_base + 
>> MPC85XX_ESDHC_REGS_OFFSET);
>> +        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, 
>> MPC85XX_ESDHC_IRQ));
>> +        sdhci_regsize = memory_region_size(sysbus_mmio_get_region(s, 
>> 0));
>> +        create_unimplemented_device("esdhc",
>> +                                    pmc->ccsrbar_base
>> +                                    + MPC85XX_ESDHC_REGS_OFFSET + 
>> sdhci_regsize,
>> +                                    MPC85XX_ESDHC_REGS_SIZE - 
>> sdhci_regsize);
>> +    }
> 
> Since the UNIMP device has lower priority, we can simplify as:
> 
> if (pmc->has_esdhc) {
>      create_unimplemented_device("esdhc",
>                                  pmc->ccsrbar_base
>                                  + MPC85XX_ESDHC_REGS_OFFSET,
>                                  MPC85XX_ESDHC_REGS_SIZE);
> 
>      dev = qdev_new(TYPE_SYSBUS_SDHCI);
>      /*
>       * Compatible with:
>       * - SD Host Controller Specification Version 2.0 Part A2
>       */
>      qdev_prop_set_uint8(dev, "sd-spec-version", 2);
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);

So the SDHCI is mapped inside the CCSR block. Better would be to map it 
into ccsr_addr_space.

I presume the CCSR is the device responsible of endian swapping, but TBH
I have no clue about this board.


