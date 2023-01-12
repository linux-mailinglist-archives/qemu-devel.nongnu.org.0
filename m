Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1986667AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:32:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0UZ-000856-20; Thu, 12 Jan 2023 11:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pG0UE-00081h-8I
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:31:33 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pG0UB-0007Gg-UO
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:31:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id w1so18634664wrt.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2eSjH7psLpPYRHXHtS66W6dZlt0vXm0JEk9fNlLCo2U=;
 b=w3g0czH4CvBLgUHlApUT1mi7I5DnRGmrqMEYqeRbQz2svHdpP/n90z0HTTqNX77GEM
 xkKOlt08mSw1L3/T9eZk3kuLdNSiJlOLOLxws5S1+vsTUjmxrT9qVuOujsxUmktFREup
 +CB5+codWuLOQLCgGsbop7hrdmXHoEAVHhQyHzvFV0NhVcBgApuDB4CjaDXSwPv8nljQ
 wBaHKB/TCW62iLWXg1qrxFGGZqaMYfZ/2vjvw44YSPCwaSIh6188niE7kTqeeo4/EZ1S
 TlEJvnKR/H471nCtEp4N75CgU0DYOEhiejXeQR7v/ps/HyevmMGjCpmar+mr1geQPatO
 ksIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2eSjH7psLpPYRHXHtS66W6dZlt0vXm0JEk9fNlLCo2U=;
 b=pUU3lPv+IXiSN81FbAHEGgyFiEP/Q6EAr1ri6CtCALkKNo3Cbyn31iANOasKosmAzh
 rqCxECssrz1GOa099CyjEE4+/rn7li6IuwDBOsw1Sf0hERbq52v/wzbbhJN8Ac2A0Sqa
 ylMJNbxlYqez9AjIpQYBvt3AYQT9o0CDYhP6OdYnRO/tLSAj90kBNK/N2NE6vyK0LAeA
 3Ec/FLiyXMP4ITKMu3rjfVpgpHCl3049Pvrz5MnaeZ9vMw4RGzl+2uIdDtruD7J0qBJE
 IY168lQ2MgHThZfy2ayMkxbitKBSLG0DlLc33XPJyQhgTE/yN1ncZ5vTKb0I2VxQyXVN
 jvOQ==
X-Gm-Message-State: AFqh2kqyLSzI3mS86nkE/0L86YBpqSSynw9PjoA5c5q3OzgIsLcYwS4L
 fSbyhCnF88PYUY78yxFia+EaWQ==
X-Google-Smtp-Source: AMrXdXvyD6+yYYGKf01nehbeYizY7XZV4o+k/yQHDK0tYWoN57xeOesAtzs0e1PgdTH69qfXW9MYvg==
X-Received: by 2002:a5d:56cd:0:b0:2b4:d5a3:a70b with SMTP id
 m13-20020a5d56cd000000b002b4d5a3a70bmr17556390wrw.12.1673541086170; 
 Thu, 12 Jan 2023 08:31:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm4032604wrm.108.2023.01.12.08.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 08:31:25 -0800 (PST)
Message-ID: <9f2f0fe3-3aef-91c5-bbe4-b94682b6a832@linaro.org>
Date: Thu, 12 Jan 2023 17:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
 <e879c284-5021-2f63-0269-5e0b09bc31a7@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e879c284-5021-2f63-0269-5e0b09bc31a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/1/23 16:04, Philippe Mathieu-Daudé wrote:
> On 9/1/23 18:23, Bernhard Beschow wrote:
>> Now that the PIIX3 and PIIX4 device models are sufficiently consolidated,
>> their implementations can be merged into one file for further
>> consolidation.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Message-Id: <20221022150508.26830-37-shentey@gmail.com>
>> ---
>>   hw/isa/{piix3.c => piix.c} | 158 ++++++++++++++++++++
>>   hw/isa/piix4.c             | 285 -------------------------------------
>>   MAINTAINERS                |   6 +-
>>   hw/i386/Kconfig            |   2 +-
>>   hw/isa/Kconfig             |  12 +-
>>   hw/isa/meson.build         |   3 +-
>>   hw/mips/Kconfig            |   2 +-
>>   7 files changed, 165 insertions(+), 303 deletions(-)
>>   rename hw/isa/{piix3.c => piix.c} (75%)
>>   delete mode 100644 hw/isa/piix4.c
> 
>> +static void piix4_realize(PCIDevice *dev, Error **errp)
>> +{
>> +    PIIXState *s = PIIX_PCI_DEVICE(dev);
>> +    PCIBus *pci_bus = pci_get_bus(dev);
>> +    ISABus *isa_bus;
>> +
>> +    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
>> +                          pci_address_space_io(dev), errp);
>> +    if (!isa_bus) {
>> +        return;
>> +    }
>> +
>> +    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
>> +                          "reset-control", 1);
>> +    memory_region_add_subregion_overlap(pci_address_space_io(dev),
>> +                                        PIIX_RCR_IOPORT, &s->rcr_mem, 
>> 1);
>> +
>> +    /* initialize i8259 pic */
>> +    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
>> +        return;
>> +    }
>> +
>> +    /* initialize ISA irqs */
>> +    isa_bus_irqs(isa_bus, s->pic.in_irqs);
>> +
>> +    /* initialize pit */
>> +    i8254_pit_init(isa_bus, 0x40, 0, NULL);
>> +
>> +    /* DMA */
>> +    i8257_dma_init(isa_bus, 0);
>> +
>> +    /* RTC */
>> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>> +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>> +        return;
>> +    }
>> +    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
> 
> Pre-existing; it seems this difference with PIIX3 can be removed
> because already taken care by calling isa_connect_gpio_out() in 
> mc146818_rtc_init()?
> 
> ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq 
> intercept_irq)
> {
>      DeviceState *dev;
>      ISADevice *isadev;
>      RTCState *s;
> 
>      isadev = isa_new(TYPE_MC146818_RTC);
>      dev = DEVICE(isadev);
>      s = MC146818_RTC(isadev);
>      qdev_prop_set_int32(dev, "base_year", base_year);
>      isa_realize_and_unref(isadev, bus, &error_fatal);
>      if (intercept_irq) {
>          qdev_connect_gpio_out(dev, 0, intercept_irq);
>      } else {
>          isa_connect_gpio_out(isadev, 0, s->isairq);
> 

I meant to paste:

static void rtc_realizefn(DeviceState *dev, Error **errp)
{
     ...
     qdev_init_gpio_out(dev, &s->irq, 1);


> Having:
> 
> void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
> {
>      qemu_irq irq = isa_get_irq(isadev, isairq);
>      qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
> }
> 
> What do you think?


