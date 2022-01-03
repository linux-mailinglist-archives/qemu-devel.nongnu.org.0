Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3F483753
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 20:02:47 +0100 (CET)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SbW-0006Ro-Lf
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 14:02:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SaZ-0005Xt-MN; Mon, 03 Jan 2022 14:01:48 -0500
Received: from [2607:f8b0:4864:20::832] (port=44586
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SaX-0000aD-UY; Mon, 03 Jan 2022 14:01:47 -0500
Received: by mail-qt1-x832.google.com with SMTP id a1so31331105qtx.11;
 Mon, 03 Jan 2022 11:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IX1wol99FbM8jubXumm+48lvRql3+Y4En+/fjD+aTr0=;
 b=STHrjXWw2SMiRaCHkPyuMkpvI9U+GRukScJeMyHtNx2GzyelwRIKMoBRUdtpaCNAnF
 FHqMRwSP/kEQrSugmQyUxy2DhjYT6+kpNy8HIwN0NFRvCfr/4YYofjxlffg01bAN+TWu
 5AOSxKWcNSznPzZ4Qd1yD+xRyN15peWiDzZvd9XJdoZ/PF0JIjMTcWtWuYnkNp91zXRr
 NTWH7gvg14eGzGYHZvQpsJs3SbfxHR27N/R0nSAj4Ypka9htp0/H8I/einSKSiLf7+bh
 s1mWoeJDjqWQ92OTWH+Hbu65kVHdCipRszWbnXYzogyPPAOM6cn0s1mM1q8PvMWH69x+
 qGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IX1wol99FbM8jubXumm+48lvRql3+Y4En+/fjD+aTr0=;
 b=r9692E66sCVt8+NYDN09+c2/squL4uq1uj3ndmEVPyBPz8wyjGTUstEHuxK2Yxbq+Z
 lD4hTdL5x03/oUx4+CnqYO8qGJtdZpBH6cJ363WNVgLQpDV3n3+PGaBKHt8ivWOeJE9A
 acB1xYFXDTVNrFjez+A7u18O8FlsjCtYfmanj6/l3XGnDLjJnsA38IlHg28BrX7m34nx
 iH/Uuzy/+LwZ4LlzbAZ7kI25pSBmhDOTJw5D2f2RzRU7lDlnmdl/zchq79vCd8S0sv6S
 bjapqJZspgxmRGwgEPHuE8J8DbUNTujbgtDLDqPI92DirgGEZjg7LSTkPKD4n7EY43YM
 Ka7Q==
X-Gm-Message-State: AOAM532W0UHw3fTmnmOPyiZC3IU/3j70IUxzlhMFUatOXbMh6LQLFKOk
 NOIE/MEN0mDqGX5pPA5T/DAL0AxcIvA=
X-Google-Smtp-Source: ABdhPJw/ZKiwrqhXqn5ICyyH6amskSlujGCoYgr9DmfhIsNL+GYLIAYFXGxBpPMxT48dCFsh9xtoxA==
X-Received: by 2002:a05:622a:1789:: with SMTP id
 s9mr41921288qtk.604.1641236504780; 
 Mon, 03 Jan 2022 11:01:44 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id c25sm29702267qkp.31.2022.01.03.11.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 11:01:44 -0800 (PST)
Message-ID: <e947fdf3-1aec-4257-d5dc-9765ad8e34e8@gmail.com>
Date: Mon, 3 Jan 2022 16:01:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 03/17] pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-4-danielhb413@gmail.com>
 <49139a66-ea8b-b599-d7c4-e40597e558f3@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <49139a66-ea8b-b599-d7c4-e40597e558f3@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 05:28, Cédric Le Goater wrote:
> On 12/28/21 20:37, Daniel Henrique Barboza wrote:
>> The TYPE_PNV_PHB3_ROOT_BUS name is used as the default bus name when
>> the dev has no 'id'. However, pnv-phb3-root-bus is a bit too long to be
>> used as a bus name.
>>
>> Most common QEMU buses and PCI controllers are named based on their bus
>> type (e.g. pSeries spapr-pci-host-bridge is called 'pci'). The most
>> common name for a PCIE bus controller in QEMU is 'pcie'. Naming it
>> 'pcie' would break the documented use of the pnv-phb3 device, since
>> 'pcie.0' would now refer to the root bus instead of the first root port.
>>
>> There's nothing particularly wrong with the 'root-bus' name used before,
>> aside from the fact that 'root-bus' is being used for pnv-phb3 and
>> pnv-phb4 created buses, which is not quite correct since these buses
>> aren't implemented the same way in QEMU - you can't plug a
>> pnv-phb4-root-port into a pnv-phb3 root bus, for example.
>>
>> This patch renames it as 'phb3-root', which is a compromise between the
>> existing and the previously used name. Creating 3 phbs without ID will
>> result in an "info qtree" output similar to this:
>>
>> bus: main-system-bus
>>    type System
>>    dev: pnv-phb3, id ""
>>      index = 2 (0x2)
>>      chip-id = 0 (0x0)
>>      x-config-reg-migration-enabled = true
>>      bypass-iommu = false
>>      bus: phb3-root.2
>>        type phb3-root
>>    dev: pnv-phb3, id ""
>>      index = 1 (0x1)
>>      chip-id = 0 (0x0)
>>      x-config-reg-migration-enabled = true
>>      bypass-iommu = false
>>      bus: phb3-root.1
>>        type phb3-root
>>    dev: pnv-phb3, id ""
>>      index = 0 (0x0)
>>      chip-id = 0 (0x0)
>>      x-config-reg-migration-enabled = true
>>      bypass-iommu = false
>>      bus: phb3-root.0
>>        type phb3-root
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   include/hw/pci-host/pnv_phb3.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
>> index 2e423c3890..658ee40e13 100644
>> --- a/include/hw/pci-host/pnv_phb3.h
>> +++ b/include/hw/pci-host/pnv_phb3.h
>> @@ -105,7 +105,7 @@ struct PnvPBCQState {
>>   /*
>>    * PHB3 PCIe Root port
>>    */
>> -#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root-bus"
>> +#define TYPE_PNV_PHB3_ROOT_BUS "phb3-root"
> 
> hmm, what about "pnv-phb3-root" ? I like the 'pnv' prefix to identify
> the machine.

Works for me. I'll make the change in v2.

Thanks,


Daniel

> 
> 
> Thanks,
> 
> C.
> 
> 
> 
>>   #define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
>>
> 

