Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DA55408C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 04:29:13 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3q7E-0004fP-9i
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 22:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o3q5G-0003nW-Av
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 22:27:10 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o3q5D-0005u5-BV
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 22:27:10 -0400
Received: by mail-pf1-x429.google.com with SMTP id k127so9578011pfd.10
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 19:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :content-language:from:in-reply-to:content-transfer-encoding;
 bh=XKmtGALngWrENfLXa97/do1nuSWXZqQI8PbYdiIRBjI=;
 b=2sxWZZgQiUg1Ukw3NU5lPF9jUYTjgcDLEGdQKdxYkYUFZ1NDG5wdQeTvtWQeRmKOx2
 5iLVn6A3+S7jaEgUosFLpVTZFHUKQo2Ou3cFg3OY2MsWcA6f60AsLSyZQC8EQJ64dnMd
 2CIus/thzsB6DVjJoT30MTZxR4FVkFksDmd1J8BJyNOkeelQcnV6RXlaHJ/XYodfOyOT
 bMA8QBzBcqkwchR9WGlcYVfKBb3JHQXYcw4nFHpILbIfD75pQ9G8QrxRx+HDz7qLF3Vj
 zuY+Q7Kk2SaLr7yn8Qb20q5XZq/2Ri53bdZA8LYnv1NlECL/0dgDcBsPRfPb4fYy4P/R
 V+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:content-language:from:in-reply-to
 :content-transfer-encoding;
 bh=XKmtGALngWrENfLXa97/do1nuSWXZqQI8PbYdiIRBjI=;
 b=52PHt4qp3oLeKkwQpr2m8Tmgdx93Ji1fvKHVfgEtSU5CSoOCmXTEZZloL/+X0Yd9yz
 4dbTtfqRcxvzWNz4UApIm6Hz0J7xQOf5+dLE6KVCJJ3GEQHlIm/lEwP/gEbALPk1+wGT
 XEqHNrxz2cmZSer6/wTJ3s/9OFkvdKGobKP2UUPqAO5DO/SA1eELdq/Ws5mZ3qIywwNv
 lKpyL8xGk+F+gf94H11HgD/3Igo8Ozr3U2ePMpFdRclBZFeSDb7rRTezcyjeywOIdyLo
 fkAkZ7ubDqJtLWd/gE9SkipEYrPo+zjHBvCpOjDQRoY+sUfz2wyjSO4ZTR6ip1gJdZ67
 GvPA==
X-Gm-Message-State: AJIora8McGfSVIm3P2Pg8Yg+VSMUjWyfhQYlMlcGqviOiRcQCWz7o2rX
 0+RO9DKTZ/gz/mZKnET7Tbr4Rg==
X-Google-Smtp-Source: AGRyM1sI+zZUchuSKV4CH4Tlpm+FyO98iQEhhmf1z0b5OEkskpYb7kb1HY+nKRe13+NsRLTs3q1H+g==
X-Received: by 2002:a63:af56:0:b0:40d:2430:8fa3 with SMTP id
 s22-20020a63af56000000b0040d24308fa3mr909183pgo.376.1655864823813; 
 Tue, 21 Jun 2022 19:27:03 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 i64-20020a628743000000b0051b930b7bbesm12085825pfe.135.2022.06.21.19.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 19:27:02 -0700 (PDT)
Message-ID: <90ca3cd7-c20b-0d08-9c2b-8abcc93a0620@ozlabs.ru>
Date: Wed, 22 Jun 2022 12:26:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH qemu] spapr/ddw: Reset DMA when the last non-default
 window is removed
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220620080109.998804-1-aik@ozlabs.ru>
 <0493683a-47e8-ce26-0cd1-671928803f80@gmail.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <0493683a-47e8-ce26-0cd1-671928803f80@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/21/22 23:54, Daniel Henrique Barboza wrote:
> 
> 
> On 6/20/22 05:01, Alexey Kardashevskiy wrote:
>> PAPR+/LoPAPR says:
>> ===
>> The platform must restore the default DMA window for the PE on a call
>> to the ibm,remove-pe-dma-window RTAS call when all of the following
>> are true:
>>   a. The call removes the last DMA window remaining for the PE.
>>   b. The DMA window being removed is not the default window
>>
>> ===
>>
>> This resets DMA as PAPR mandates.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
> 
> Looks good. One comment below:
> 
> 
>>   include/hw/ppc/spapr.h  |  3 ++-
>>   hw/ppc/spapr_iommu.c    |  8 +++++---
>>   hw/ppc/spapr_pci.c      |  2 +-
>>   hw/ppc/spapr_rtas_ddw.c | 17 ++++++++++++++++-
>>   hw/ppc/spapr_vio.c      |  3 ++-
>>   5 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 072dda2c7265..0adbe1566d40 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -902,6 +902,7 @@ struct SpaprTceTable {
>>       bool bypass;
>>       bool need_vfio;
>>       bool skipping_replay;
>> +    bool def_win;
>>       int fd;
>>       MemoryRegion root;
>>       IOMMUMemoryRegion iommu;
>> @@ -928,7 +929,7 @@ void spapr_check_mmu_mode(bool guest_radix);
>>   SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn);
>>   void spapr_tce_table_enable(SpaprTceTable *tcet,
>>                               uint32_t page_shift, uint64_t bus_offset,
>> -                            uint32_t nb_table);
>> +                            uint32_t nb_table, bool def_win);
> 
> Do we need to add 'def_win' to spapr_tce_table_enable()? I see that 
> you're using
> the 'def_win' var to assign
> 
> +    tcet->def_win = def_win;
> 
> but the only case where def_win will be other than 'false' is:
> 
> - the function is called by spapr_tce_post_load(), but in that case it's 
> being
> callied like this:
> 
>      spapr_tce_table_enable(tcet, old_page_shift, old_bus_offset,
>                             tcet->mig_nb_table, tcet->def_win);
> 
> which results in the function doing tcet->def_win = tcet->def_win, which is
> uneeded.
> 
> 
> - the function is called by spapr_phb_dma_reset(). In this case I believe
> we can just do "tcet->def_win = true" before calling 
> spapr_tce_table_enable():
> 
> 
>>       /* Register default 32bit DMA window */
>>       tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
>> +     tcet->def_win = true;
>>       spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, 
>> sphb->dma_win_addr,
>>                              sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
>>   }
> 
> All other calls to spapr_tce_table_enable() are passing 'false' to 
> def_win and
> can be left alone.
> 
> Assuming that there's no way a created DMA window becomes the default 
> window, or
> the default DMA window is demoted to non-default, I think we can leave
> spapr_tce_table_enable() untouched and just set tcet->def_win to true 
> inside
> spapr_phb_dma_reset().


I can definitely do this. Thanks for the review, I'll repost.

> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
>>   void spapr_tce_table_disable(SpaprTceTable *tcet);
>>   void spapr_tce_set_need_vfio(SpaprTceTable *tcet, bool need_vfio);
>> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
>> index 81e5a1aea3a6..f8c1627d0782 100644
>> --- a/hw/ppc/spapr_iommu.c
>> +++ b/hw/ppc/spapr_iommu.c
>> @@ -242,7 +242,7 @@ static int spapr_tce_table_post_load(void *opaque, 
>> int version_id)
>>       if (tcet->mig_nb_table) {
>>           if (!tcet->nb_table) {
>>               spapr_tce_table_enable(tcet, old_page_shift, 
>> old_bus_offset,
>> -                                   tcet->mig_nb_table);
>> +                                   tcet->mig_nb_table, tcet->def_win);
>>           }
>>           memcpy(tcet->table, tcet->mig_table,
>> @@ -279,7 +279,7 @@ static const VMStateDescription 
>> vmstate_spapr_tce_table_ex = {
>>   static const VMStateDescription vmstate_spapr_tce_table = {
>>       .name = "spapr_iommu",
>> -    .version_id = 2,
>> +    .version_id = 3,
>>       .minimum_version_id = 2,
>>       .pre_save = spapr_tce_table_pre_save,
>>       .post_load = spapr_tce_table_post_load,
>> @@ -292,6 +292,7 @@ static const VMStateDescription 
>> vmstate_spapr_tce_table = {
>>           VMSTATE_BOOL(bypass, SpaprTceTable),
>>           VMSTATE_VARRAY_UINT32_ALLOC(mig_table, SpaprTceTable, 
>> mig_nb_table, 0,
>>                                       vmstate_info_uint64, uint64_t),
>> +        VMSTATE_BOOL_V(def_win, SpaprTceTable, 3),
>>           VMSTATE_END_OF_LIST()
>>       },
>> @@ -380,7 +381,7 @@ SpaprTceTable *spapr_tce_new_table(DeviceState 
>> *owner, uint32_t liobn)
>>   void spapr_tce_table_enable(SpaprTceTable *tcet,
>>                               uint32_t page_shift, uint64_t bus_offset,
>> -                            uint32_t nb_table)
>> +                            uint32_t nb_table, bool def_win)
>>   {
>>       if (tcet->nb_table) {
>>           warn_report("trying to enable already enabled TCE table");
>> @@ -390,6 +391,7 @@ void spapr_tce_table_enable(SpaprTceTable *tcet,
>>       tcet->bus_offset = bus_offset;
>>       tcet->page_shift = page_shift;
>>       tcet->nb_table = nb_table;
>> +    tcet->def_win = def_win;
>>       tcet->table = spapr_tce_alloc_table(tcet->liobn,
>>                                           tcet->page_shift,
>>                                           tcet->bus_offset,
>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>> index b2f5fbef0c83..e1dbccfc7547 100644
>> --- a/hw/ppc/spapr_pci.c
>> +++ b/hw/ppc/spapr_pci.c
>> @@ -2066,7 +2066,7 @@ void spapr_phb_dma_reset(SpaprPhbState *sphb)
>>       /* Register default 32bit DMA window */
>>       tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
>>       spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, 
>> sphb->dma_win_addr,
>> -                           sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
>> +                           sphb->dma_win_size >> 
>> SPAPR_TCE_PAGE_SHIFT, true);
>>   }
>>   static void spapr_phb_reset(DeviceState *qdev)
>> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
>> index 13d339c807c1..4fe41b0c4539 100644
>> --- a/hw/ppc/spapr_rtas_ddw.c
>> +++ b/hw/ppc/spapr_rtas_ddw.c
>> @@ -182,7 +182,7 @@ static void 
>> rtas_ibm_create_pe_dma_window(PowerPCCPU *cpu,
>>        */
>>       tcet->skipping_replay = true;
>>       spapr_tce_table_enable(tcet, page_shift, win_addr,
>> -                           1ULL << (window_shift - page_shift));
>> +                           1ULL << (window_shift - page_shift), false);
>>       tcet->skipping_replay = false;
>>       if (!tcet->nb_table) {
>>           goto hw_error_exit;
>> @@ -215,6 +215,7 @@ static void 
>> rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
>>       SpaprPhbState *sphb;
>>       SpaprTceTable *tcet;
>>       uint32_t liobn;
>> +    bool def_win_removed;
>>       if ((nargs != 1) || (nret != 1)) {
>>           goto param_error_exit;
>> @@ -231,9 +232,23 @@ static void 
>> rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
>>           goto param_error_exit;
>>       }
>> +    def_win_removed = tcet->def_win;
>>       spapr_tce_table_disable(tcet);
>>       trace_spapr_iommu_ddw_remove(liobn);
>> +    /*
>> +     * PAPR+/LoPAPR says:
>> +     * The platform must restore the default DMA window for the PE on 
>> a call
>> +     * to the ibm,remove-pe-dma-window RTAS call when all of the 
>> following
>> +     * are true:
>> +     * a. The call removes the last DMA window remaining for the PE.
>> +     * b. The DMA window being removed is not the default window
>> +     */
>> +    if (spapr_phb_get_active_win_num(sphb) == 0 && !def_win_removed) {
>> +        spapr_phb_dma_reset(sphb);
>> +        trace_spapr_iommu_ddw_reset(sphb->buid, 0);
>> +    }
>> +
>>       rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>>       return;
>> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
>> index 9d4fec2c04d8..14506df19d62 100644
>> --- a/hw/ppc/spapr_vio.c
>> +++ b/hw/ppc/spapr_vio.c
>> @@ -533,7 +533,8 @@ static void spapr_vio_busdev_realize(DeviceState 
>> *qdev, Error **errp)
>>           dev->tcet = spapr_tce_new_table(qdev, liobn);
>>           spapr_tce_table_enable(dev->tcet, SPAPR_TCE_PAGE_SHIFT, 0,
>> -                               pc->rtce_window_size >> 
>> SPAPR_TCE_PAGE_SHIFT);
>> +                               pc->rtce_window_size >> 
>> SPAPR_TCE_PAGE_SHIFT,
>> +                               false);
>>           dev->tcet->vdev = dev;
>>           memory_region_add_subregion_overlap(&dev->mrroot, 0,
>>                                               
>> spapr_tce_get_iommu(dev->tcet), 2);

-- 
Alexey

