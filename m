Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297B54FE12
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 22:03:53 +0200 (CEST)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2IC7-0000yQ-Rz
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 16:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2IAs-000074-7M; Fri, 17 Jun 2022 16:02:34 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:37536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2IAq-0007zJ-K1; Fri, 17 Jun 2022 16:02:33 -0400
Received: by mail-oi1-x232.google.com with SMTP id h187so6602221oif.4;
 Fri, 17 Jun 2022 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+ciRlpJwQqMF7EZvi+on9KXLpmgdctxl5adu5yBRrVU=;
 b=avkRKSE8HTfsqTYSBSjfsGB+0uf8yLfpb1OXDkd90xk1j6PnwRDuSzHEh3AZB/okBt
 OHAlrFh+r2XKeImlygLVP0G7tg2eLw0GTPrGJrgAZ+al0xEKX7YcvY68IjKmmQ9JcBab
 O7SPqMqHsomor5DEGhe8p8h4rudsiGYlAWuxPx61W+jsQqq4pQQ4AARZz8TPcU6+qQ4F
 KxCnVMbnfp/GmBp6QF7MY4JUE85XozpdKz7+HksNcuSZPOF4CaeNfJGx9eEaZ1GVbzUZ
 cB863hy9bDran9LEMGxzRJxLl1kT+DAF5Tn27m5eCI5YXdUkN9VW3P6baxCchLuzS6iQ
 qlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+ciRlpJwQqMF7EZvi+on9KXLpmgdctxl5adu5yBRrVU=;
 b=eWs/Vyar/XdrBUHDgsGzlWYuP0pR7v2hWoBG3RJ/ofzmVLCW8C19i0xL8/Qr2iwzmP
 yrraG4T3fVZ/ppcIiU0QbvngcblRTmfpA9e7iT3CN0jrexMJykftVZjFYOuWBEAJkXx/
 8Nj6YfPAGdrVAjNBR4jL57gwQsIb6ozgxeoOQTyd1e1ft6WkCNCP3icqNX/pJwTZrWxQ
 KuhqizQ010VJfp0DWHYA+0WZB2ufn30cx0L98Fc0x476I88BHu+5Whqqtn2LxpFZSio8
 b7sYd0A+Js8z6pMbrWSAZnbmc+mHUJ3r4bybxjOsswSrbVsBkINVISM+W0rmHOsurHTI
 4KIg==
X-Gm-Message-State: AJIora8Kzw9HlTAFTrRuoK8Bh1ogmiOhIQUayHqcOYprGWzk9aC7mxgS
 YpUnzCfrCxjHZbvFpwxQfvI=
X-Google-Smtp-Source: AGRyM1sVVHG+1g2s1tl9CGqNdx+vSIXrlhf4SKJMEEHdMJbmWzIH6iFwG3SubO/Lk12Yt5BBpUZciA==
X-Received: by 2002:a05:6808:150e:b0:331:39bf:2228 with SMTP id
 u14-20020a056808150e00b0033139bf2228mr6079057oiw.9.1655496150964; 
 Fri, 17 Jun 2022 13:02:30 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834?
 ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056870e40400b000f5ccbb7d75sm2969718oag.1.2022.06.17.13.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 13:02:30 -0700 (PDT)
Message-ID: <eafa0763-8b51-2ec4-5131-aebb75455787@gmail.com>
Date: Fri, 17 Jun 2022 17:02:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/11] ppc/pnv: use dev->parent_bus->parent to get the PHB
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-4-danielhb@linux.ibm.com>
 <a8194fd7-9563-fec1-9d70-0e25ba648b73@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <a8194fd7-9563-fec1-9d70-0e25ba648b73@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/14/22 06:10, Frederic Barrat wrote:
> 
> 
> On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
>> It is not advisable to execute an object_dynamic_cast() to poke into
>> bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
>> think we got.
>>
>> A better way is to access the PnvPHB object via a QOM macro accessing
>> the existing parent links of the DeviceState. For a given
>> pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
>> and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
>> assert the type, and keep the NULL check in case we didn't get the
>> object we were expecting.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
>> ---
>>   hw/pci-host/pnv_phb3.c | 10 +++++++---
>>   hw/pci-host/pnv_phb4.c | 10 +++++++---
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index 4ba660f8b9..7901d8172c 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>> -    PCIBus *bus = pci_get_bus(pci);
>>       PnvPHB3 *phb = NULL;
>>       Error *local_err = NULL;
>> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> -                                          TYPE_PNV_PHB3);
>> +    /*
>> +     * dev->parent_bus gives access to the pnv-phb-root bus.
>> +     * The PnvPHB3 is the owner (parent) of the bus.
>> +     */
>> +    if (dev && dev->parent_bus) {
>> +        phb = PNV_PHB3(dev->parent_bus->parent);
>> +    }
>>       if (!phb) {
>>           error_setg(errp,
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index ffd9d8a947..bae9398d86 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>> -    PCIBus *bus = pci_get_bus(pci);
>>       PnvPHB4 *phb = NULL;
>>       Error *local_err = NULL;
>> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> -                                          TYPE_PNV_PHB4);
>> +    /*
>> +     * dev->parent_bus gives access to the pnv-phb-root bus.
>> +     * The PnvPHB4 is the owner (parent) of the bus.
>> +     */
>> +    if (dev && dev->parent_bus) {
> 
> 
> Does it make sense to test 'dev' first when it's the device being realized?

Hmmm not really. I got overzealous here it seems.

I'll keep just the check for dev->parent in v2.


Thanks,


Daniel

> 
>    Fred
> 
> 
> 
> 
>> +        phb = PNV_PHB4(dev->parent_bus->parent);
>> +    }
>>       if (!phb) {
>>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
> 

