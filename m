Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9B454244
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:01:48 +0100 (CET)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnFt4-0002NZ-Qb
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnFrH-0001Ty-4z
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnFrE-0005fp-KD
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637135991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/A2O37IHAc/fYR/SZ70Sc12eUECIgZ0B7U83D6iG7k=;
 b=ed2BeLw/lidIfkDWMG+7xnSLO91wDQIs546wP2BiLNGqrvWqqBiW6NsXAojyKZ+l5jmQw0
 N17l8Uk1HM4KRIlpj6wtlEX8q/zb2Q50N8yU5sT3+WrGCjKjFQ0mlDAJQWgaLeKpRNKX8M
 y0seScEKXDT4omWPWilHQ0sjRUqwMxE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-bI6HF5O5Oi-q1C4FC43VjA-1; Wed, 17 Nov 2021 02:59:48 -0500
X-MC-Unique: bI6HF5O5Oi-q1C4FC43VjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1068852wms.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 23:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=d/A2O37IHAc/fYR/SZ70Sc12eUECIgZ0B7U83D6iG7k=;
 b=wyqLVrYmgYBjNNjxV2ycWZ4fMVomRXZeH9JvpqiNq1R2FSqghBbrExEepoLMvWCxNd
 E27CUXfi+UFG8teAv8K5urPu1Qfp8bARUmYfV3cY7fD3YD7d6FfpxzgkDk4lN5Pal4V7
 nATeA0zvwulDgko+FsfpBU0Sn22rwUr+1GP+hWp9RvbhuZZ632XmTjByWEj8l7yMCvp/
 Q7+jee8m9xm+eMCERON0snH4GzBLCLuL4U6PM3XgbkkAeQqJyOt301QRu6r26xn9yCHO
 wABqOz4QMApMA5ab2lLwvB4o6JC4SwfRbiOlI29A8iHrvS9yOguz/nsP1Sz27VbhUsaz
 xzjA==
X-Gm-Message-State: AOAM5318GEBi0OX0lninxCg5k0tykUg7Y5+RFs2vQLfBUDN7gRlTmZMd
 uPqovQpnZPeNXajEWguPWUMdHscD2KMR+18QRT+BYEj/GKZ5jg4w6dktu4WguHnwloGlX5Ruh73
 1TX9M8umy6ecX7/A=
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr15081717wmq.160.1637135986852; 
 Tue, 16 Nov 2021 23:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj2KV1c2MmUDT5GfoMYrQk5I2xD0hzZsCP5qBkGbGSoOQhLSu8cZhg8HZ47TCifyIEtPkA3A==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr15081672wmq.160.1637135986505; 
 Tue, 16 Nov 2021 23:59:46 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a1sm23100917wri.89.2021.11.16.23.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 23:59:46 -0800 (PST)
Message-ID: <085729f8-3e15-1a62-1b13-6214f0da2806@redhat.com>
Date: Wed, 17 Nov 2021 08:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pci-host: Allow extended config space access for PowerNV
 PHB4 model
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Christophe Lombard <clombard@linux.vnet.ibm.com>,
 Ben Widawsky <ben.widawsky@intel.com>
References: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
 <67182075-8e5b-08ad-d17f-405b720a6fb5@linux.ibm.com>
 <1419c2a2-8e19-d9d6-d9aa-b6b7abccfb99@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <1419c2a2-8e19-d9d6-d9aa-b6b7abccfb99@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 17:04, Cédric Le Goater wrote:
> On 11/9/21 16:51, Frederic Barrat wrote:
>>
>>
>> On 09/11/2021 15:50, Christophe Lombard wrote:
>>> The PCIe extended configuration space on the device is not currently
>>> accessible to the host. if by default,  it is still inaccessible for
>>> conventional for PCIe buses, add the current flag
>>> PCI_BUS_EXTENDED_CONFIG_SPACE on the root bus permits PCI-E extended
>>> config space access.
> 
> For the record, this is coming from an experiment of plugging a
> CXL device on a QEMU PowerNV POWER10 machine (baremetal). Only
> minor changes (64 bits ops) were required to get it working.

Since this note could be helpful when having future retrospective,
do you mind amending this note to the commit description?

> I wonder where are with the CXL models ?

IIRC Ben worked actively, asked help to the community but received
very few, basically because there is not enough man power IMHO.

Last thing I remember is Igor suggested a different design approach:
https://lore.kernel.org/qemu-devel/20210319180705.6ede9091@redhat.com/

>>> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
>>> ---
>>
>>
>> FWIW, looks good to me
>> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> 
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks,
> 
> C.
> 
> 
>>
>>
>>
>>>   hw/pci-host/pnv_phb4.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>>> index 5c375a9f28..40b793201a 100644
>>> --- a/hw/pci-host/pnv_phb4.c
>>> +++ b/hw/pci-host/pnv_phb4.c
>>> @@ -1205,6 +1205,7 @@ static void pnv_phb4_realize(DeviceState *dev,
>>> Error **errp)
>>>                                        &phb->pci_mmio, &phb->pci_io,
>>>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
>>>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>>> +    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>>>       /* Add a single Root port */
>>>       qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
>>>
> 
> 


