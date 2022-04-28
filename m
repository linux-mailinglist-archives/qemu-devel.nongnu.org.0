Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90789512AFE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 07:35:18 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njwo9-0003ax-9T
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 01:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1njwln-0002Bz-DB
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 01:32:51 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1njwlk-0001HV-Sl
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 01:32:50 -0400
Received: by mail-pl1-x629.google.com with SMTP id u9so2787529plf.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 22:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UpoO+9GYu9HpYavMLSN6DbThaLz5lwohG/SuNzLLZhk=;
 b=maxU/BkoS5LipLdExvHwhcJh6ZJlSaYL5k/KqHmcYH3+X6N5XCqtGNTDktqUvbEAlV
 YsgV7lfG2i8HH+3mKOr5CEJo9SPtTrVIRueenIBzheO2f35A/g3+mqTDsLkiXvwNIBYU
 aCnHsaTUIS1/WXN+ewtzkI7ZNnH8vjutP3EdyAuwTouomDz+7DpPBofEgSg3gw5av2MQ
 tv3Kdr30aM040HcPEEZ8cNgBPtiPQ2ANxSr0/08rZnYQhM8GkWbIR749ITinA0bVuF1L
 QHDQ83ScjVqJ8RIlTpgERZQBZ++ZQhZxy/pGumplSTKhCEbm2M9m5461IqDvrPqByyMW
 L38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UpoO+9GYu9HpYavMLSN6DbThaLz5lwohG/SuNzLLZhk=;
 b=O3d6/YcZWST32YMhQr4UeTK99lHCWY0B02qA/uHwEmfXmN75qHzCSutZW4/5EidPCb
 KnnOfntG2uargpyTqlCxyJol65tyoZ+oY0yCEtm6T2tAIqapVJgfUMCskCYenVpL6m8P
 zD/joWEC5KbdQCu8ER5u1LbT7gg1mPWoNEpdqQBjKxjzH1PhWbf7Jbtv18TV6tpROmco
 N2ev0xuSiBzR8iB8Ut6XXEln1QddfvBS+ITwzUhFPm5RywWllTpGXOY9qjKXapBMeFfp
 NmRyIQbnBRbuwOPfvUkOqXEWd4MpaYJ44gjlya8wLfxza/6ZGOudgiPmq2gaNXI+07e9
 gZjw==
X-Gm-Message-State: AOAM533vyvPIaXwvCwxt7pWR9t21HsZijYRa97IYPu0BwiQHyssY3GAc
 4qRHCqfBcSjFyQBs4oDRUKomzA==
X-Google-Smtp-Source: ABdhPJy4gioilIO1dUrsdMYcq5TFB4ZC49ADS59D9iEQi4eH5SQohhD4KWYZ3Xl63HfZCyPh/4+tYw==
X-Received: by 2002:a17:90b:4d8f:b0:1db:d41d:9336 with SMTP id
 oj15-20020a17090b4d8f00b001dbd41d9336mr1710840pjb.29.1651123965776; 
 Wed, 27 Apr 2022 22:32:45 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 7-20020a17090a000700b001da3920d985sm4959052pja.12.2022.04.27.22.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 22:32:45 -0700 (PDT)
Message-ID: <5fa3c59b-de8e-c428-43f1-eb4d698e835a@ozlabs.ru>
Date: Thu, 28 Apr 2022 15:32:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH qemu] spapr_pci: Disable IRQFD resampling on XIVE
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220427043651.1162403-1-aik@ozlabs.ru>
 <880cdd91-3a4a-8c35-1357-d3858950db44@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <880cdd91-3a4a-8c35-1357-d3858950db44@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/27/22 17:36, Cédric Le Goater wrote:
> Hello Alexey,
> 
> On 4/27/22 06:36, Alexey Kardashevskiy wrote:
>> VFIO-PCI has an "KVM_IRQFD_FLAG_RESAMPLE" optimization for INTx EOI
>> handling when KVM can unmask PCI INTx (level triggered interrupt) without
>> switching to the userspace (==QEMU).
>>
>> Unfortunately XIVE does not support level interrupts, 
> 
> That's not correctly phrased I think.


My bad, I meant "XIVE hardware".

> 
> The QEMU XIVE device support LSIs but the POWER9 kernel-irqchips,
> KVM XICS-on-XIVE and XIVE native devices, are broken with respect
> to passthrough adapters using INTx.
> 
> 
>> QEMU emulates them
>> and therefore there is no existing code path to kick the resamplefd.
>> The problem appears when passing through a PCI adapter with
>> the "pci=nomsi" kernel parameter - the adapter's interrupt interrupt
>> count in /proc/interrupts will stuck at "1".
>>
>> This disables resampler when the XIVE interrupt controller is configured.
>> This should not be very visible though KVM already exits to QEMU for INTx
>> and XIVE-capable boxes (POWER9 and newer) do not seem to have
>> performance-critical INTx-only capable devices.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>>
>> Cédric, this is what I meant when I said that spapr_pci.c was unaware of
>> the interrupt controller type, neither xics nor xive was mentioned
>> in the file before.
>>
>>
>> ---
>>   hw/ppc/spapr_pci.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>> index 5bfd4aa9e5aa..2675052601db 100644
>> --- a/hw/ppc/spapr_pci.c
>> +++ b/hw/ppc/spapr_pci.c
>> @@ -729,11 +729,19 @@ static void pci_spapr_set_irq(void *opaque, int 
>> irq_num, int level)
>>   static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
>>   {
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
>> -    PCIINTxRoute route;
>> +    PCIINTxRoute route = { .mode = PCI_INTX_DISABLED };
>> -    route.mode = PCI_INTX_ENABLED;
>> -    route.irq = sphb->lsi_table[pin].irq;
>> +    /*
>> +     * Disable IRQFD resampler on XIVE as it does not support LSI and 
>> QEMU
>> +     * emulates those so the KVM kernel resamplefd kick is skipped 
>> and EOI
>> +     * is not delivered to VFIO-PCI.
>> +     */
>> +    if (!spapr->xive) {
> 
> This is testing the availability of the XIVE interrupt mode, but not
> the activate controller. See spapr_irq_init() which is called very
> early in the machine initialization.
> 
> Is that what we want ? Is everything fine if we start the machine with
> ic-mode=xics ? On a POWER9 host, this would use the KVM XICS-on-XIVE
> device which is broken also AFAICT.

I should probably fix that in KVM, just not quite sure yet how for the 
realmode handlers, or just drop those on P9 and then the fix is trivial.


> You should extend the SpaprInterruptControllerClass (for a routine) or
> simply SpaprIrq (for a bool) if you need to handle IRQ matters from a
> device model.

It is a property of KVM rather than the interrupt controller so it 
probably makes more sense to just stop advertising 
KVM_CAP_IRQFD_RESAMPLE. Hmmm...


> 
> Thanks,
> 
> C.
> 
> 
>> +        route.mode = PCI_INTX_ENABLED;
>> +        route.irq = sphb->lsi_table[pin].irq;
>> +    }
>>       return route;
>>   }

