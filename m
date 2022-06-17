Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1254FF44
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 23:17:42 +0200 (CEST)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2JLZ-0001pB-6a
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 17:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2JJn-0000uZ-24; Fri, 17 Jun 2022 17:15:51 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2JJl-0002B8-5l; Fri, 17 Jun 2022 17:15:50 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 93-20020a9d02e6000000b0060c252ee7a4so3951514otl.13; 
 Fri, 17 Jun 2022 14:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mmeLYro2LEelF0Lhi2+hGfcVRzs81JWv1h+a8CBKwFQ=;
 b=jZgYN0KU2uer+ers0sxsxiXbJ0jMsbcgdnKc0L9bMQEQhXk0JspA73F1BwX0QwF0wZ
 DL1kLTeeRtFdxBboejlyLk7Yt3Ia/qrcxPNQhD9xVNDtl7q8PjQusbECaNlqWaZq1QTH
 0bZ2s/oDn2BgGoUSJJj9BauKswogO2ieR6Oc6AbaCT8plMyRNsiYqQIWHHHmLsPmyjY9
 gv7YilGdb7UjfZmyFo5p9AKxWPVe7TeMBOF892AFPto4wIYTtVBKSRd1eTTevHI9y7XH
 NbKaUMKWjuCcjVv0uJZVkIHHDLQghn6d4mL6Fl5z9Pedw9dQvwPW7+wn97SD1msXRNfS
 6LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mmeLYro2LEelF0Lhi2+hGfcVRzs81JWv1h+a8CBKwFQ=;
 b=aphR3cXwYzB8nqbSZHjY65ErEPmxlCsPFFa7w+ZkqaL9sZvsYBtIqyFH9ZlR8YG4w0
 EmHE789g984oWCALMj4VrYOgwGH3u5Oeq6IYqpFNffrbpMEuXtUXmAOifkVpNd5lmeEC
 GXVY6zoKalvSF9yAqzoNiDgbR3d17HzFmUWjsd//Wtew1wDOteAfkIX8trPVeIFF3CId
 vIv+k6RbVy6BiOTmyDfcsgdkPkySfelzVBDv2OR2AF9TxNHEsKDiG4pol8bd527U3oly
 IMPQnl/Q+UedVQLjMjlufNjMxjnFbw1rRp5WNf94xTkrXQH2tk5D2MPwbgYKeFVNHrPA
 ffQQ==
X-Gm-Message-State: AJIora9Oa1VM/RnC3EjfbkuvKsXi98BNIWSd3RYhMEVV5w40zeHKXywi
 ltteyVMOavVZlwOxYlc1t8w=
X-Google-Smtp-Source: AGRyM1un7BSIwU8P/hR1nppKi+JLb9V7Ct/gFhgkxcdF9Qrs33XTEPHm7xLubWMpJBlC0sQJrjJA6g==
X-Received: by 2002:a05:6830:1b65:b0:60c:116f:9e19 with SMTP id
 d5-20020a0568301b6500b0060c116f9e19mr4851847ote.345.1655500547549; 
 Fri, 17 Jun 2022 14:15:47 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834?
 ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a05683018d600b0060b1e040014sm2990801ote.51.2022.06.17.14.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 14:15:47 -0700 (PDT)
Message-ID: <42267f51-2424-27e9-0856-b60c9c32f607@gmail.com>
Date: Fri, 17 Jun 2022 18:15:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/11] ppc/pnv: use dev->parent_bus->parent to get the PHB
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, fbarrat@linux.ibm.com, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-4-danielhb@linux.ibm.com>
 <f3612399-e5d4-9631-ef7f-59aeeeabadac@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f3612399-e5d4-9631-ef7f-59aeeeabadac@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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



On 6/14/22 09:10, Cédric Le Goater wrote:
> On 6/13/22 17:44, Daniel Henrique Barboza wrote:
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
>>
> 
> Couldn't we simply use :
> 
>        phb = PNV_PHB3(bus);
> 
> ?

No. This will give us a reference to a pnv-phb3-root object.


Getting a reference to the PHB by using bus->parent happens in other parts of
code, such as:


hw/pci-host/gpex-acpi.c:            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
hw/pci-bridge/pci_expander_bridge.c:    main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);


So I believe we're not out of line here.


Thanks,


Daniel


> 
> Thanks,
> 
> C.
> 
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
>> +        phb = PNV_PHB4(dev->parent_bus->parent);
>> +    }
>>       if (!phb) {
>>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
> 
> 

