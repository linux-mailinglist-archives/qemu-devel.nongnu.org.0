Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5749E220
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:13:50 +0100 (CET)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3ev-0007Yn-A2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3Hb-0000M3-0c; Thu, 27 Jan 2022 06:49:44 -0500
Received: from [2607:f8b0:4864:20::930] (port=45828
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3HX-0003Ki-St; Thu, 27 Jan 2022 06:49:42 -0500
Received: by mail-ua1-x930.google.com with SMTP id b37so4153800uad.12;
 Thu, 27 Jan 2022 03:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hGTE/Ql/PCEdtLoMmR3WzNa10xo0qkFVRWMWMgpQGd0=;
 b=L1Ys8Ky4qJEVRVOP/TExUIRFYGSa2LioyFGJFc1NPUBAQoEqOSh6eXWME3Qk4m7PkJ
 loORfCe8+6Ogjij8C6ILUUWrdj8eEmNvRUzvQWNzgQANGGIGFHaVnzJhf9zwjEXMT7Eq
 2lQbovbFuRd/8GTGAvPCLJjWkJiTmMj2XU6tRlZOorr9ri3mWXWBskzpmgyzV/F4FkRw
 QeRX/PGQ6OCsRGNANMDRzTW7fO+HBLutJ07ulVUpaAl5AB8mtsF8DGRpLozVHPR3O9uA
 2fGGTFMlxwzwJLuJNqeoIvPAnRQhnahY4SMOpIAdcBsjMunjfcmVndo9Tp9/UNvww+Ec
 xybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGTE/Ql/PCEdtLoMmR3WzNa10xo0qkFVRWMWMgpQGd0=;
 b=LiP/P+SAj97o7d1qToiPfgeGbK2ayZ5v1+ymh/Z1zOLbgXUv3CbPrrNKReUQzulDwm
 0Ikz048vjarWeFTDrphi45hCjyucjPKli+uwhx3BOD0/Zd6KIGMPgKW4IyrOCzLHMeR5
 cCP0btzSyZqK1V+CC/JoyjJTqvayIHFtNyom2SnXchwhpd/WwV8gdD373xzbPoDky+95
 ek2cSiZA8eTzhe8xztYA7b8TZgPSDYWS7hrGh2zk39oL1Z2lt1JIUNCeVqw/0Dmlc7zF
 Lw5qWhlOxm6AzTqSxg7avkmssV9JqfKuDuxftiJvr84eSxc5jxoqqmmH83FTb656hNNU
 1LNQ==
X-Gm-Message-State: AOAM5324KxgzdKFWYuR3YkXy1h/Kg0exmLBzFEYsHMh5DPjTgy81/D9J
 LHbXjt/8akKUeqxOOr32szY=
X-Google-Smtp-Source: ABdhPJyI7Oly+Yzq7GWNrOOmokfinsktTjnyHL393IbARx/DJm9vtOEujZfBQYpKjd4pvv3ZD+uTyQ==
X-Received: by 2002:a05:6130:40b:: with SMTP id
 ba11mr1678835uab.118.1643284164892; 
 Thu, 27 Jan 2022 03:49:24 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id s133sm518694vkh.28.2022.01.27.03.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 03:49:24 -0800 (PST)
Message-ID: <b7195b32-100d-51d9-ec16-129377e9d637@gmail.com>
Date: Thu, 27 Jan 2022 08:49:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] ppc/pnv: use a do-while() loop in
 pnv_phb4_translate_tve()
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20220126201438.822457-1-danielhb413@gmail.com>
 <20220126201438.822457-3-danielhb413@gmail.com>
 <77fd8cbd-ed2a-301f-3ea7-30c49aacfd0a@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <77fd8cbd-ed2a-301f-3ea7-30c49aacfd0a@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 08:41, Matheus K. Ferst wrote:
> On 26/01/2022 17:14, Daniel Henrique Barboza wrote:
>> pnv_phb4_translate_tve() is quite similar to pnv_phb3_translate_tve(),
>> and that includes the fact that 'taddr' can be considered uninitialized
>> when throwing the "TCE access fault" error because, in theory, the loop
>> that sets 'taddr' can be skippable due to 'lev' being an signed int.
>>
>> No one complained about this specific case yet, but since we took the
>> time to handle the same situtation in pnv_phb3_translate_tve(), let's
>> replicate it here as well.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index a78add75b0..88a1479831 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1261,13 +1261,21 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
>>           /* Top level table base address */
>>           base = tta << 12;
>>
>> +        /*
>> +         * There were reports of compilers complaining about 'taddr'
>> +         * being used uninitialized in pnv_phb3_translate_tve(), and
>> +         * the same scenario is happening here. Initialize 'taddr'
>> +         * just in case.
>> +         */
>> +        taddr = base;
>> +
> 
> Do we still need this initialization?

Nah, that was a spill from the previous patch that I forgot to remove.

Thanks,

Daniel

> 
>>           /* Total shift to first level */
>>           sh = tbl_shift * lev + tce_shift;
>>
>>           /* TODO: Limit to support IO page sizes */
>>
>>           /* TODO: Multi-level untested */
>> -        while ((lev--) >= 0) {
>> +        do {
>>               /* Grab the TCE address */
>>               taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
>>               if (dma_memory_read(&address_space_memory, taddr, &tce,
>> @@ -1288,7 +1296,7 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
>>               }
>>               sh -= tbl_shift;
>>               base = tce & ~0xfffull;
>> -        }
>> +        } while ((lev--) >= 0);
> 
> The same comments from the other patch apply here, this changes the number of iterations in this loop.
> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

