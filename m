Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C0553413
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:57:08 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3eNP-0008Du-0f
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3eKg-0005of-Sh; Tue, 21 Jun 2022 09:54:18 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:40592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3eKe-0006Oc-TV; Tue, 21 Jun 2022 09:54:18 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 s20-20020a056830439400b0060c3e43b548so10685149otv.7; 
 Tue, 21 Jun 2022 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iL5rO1SgVwXK3h13tIoxB0IHxnzwzNWOJgo4JFCgtpw=;
 b=i5bu1nDsei7Xi2o7SMQYBMi6OpDTnMEFS5hTnVd6JZD5gbvuJ25W2H2v2WXgLRgWtQ
 uf2PIfblfybd1tytBm7VAOIbtaOwF7VC1TvPgp7/tJo/ZGODB/9hv4EXiwLR8a2zvGLj
 5O3aEmqm5QElVMhdTy2yzA8OU1F0n9XeSb6av10bAut5VR2eu0vhV+BEXE8+uT8KRo3k
 RvuAkxLC5VIGqBsRp5ZA+ngaLJCQnNerfiPWadQ1xtuItFwcgXUVT9TZxji5hugEXTlD
 iiCamxUBqrUkEVH3qHNMKoWlKZv8h8bcvraXYu1r5ssYfjiPlhR5cgbYSN9I/nrv9LfZ
 q0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iL5rO1SgVwXK3h13tIoxB0IHxnzwzNWOJgo4JFCgtpw=;
 b=a/rLboqNJ2Gy3PbIEenGXEyAq4pZiI/rgRp+bHFF/PQlrbPlad2eintBmOcNd+eJ+1
 nu2oeS5ddn2isga3xVVk65DwYgfTMlbU7cZMYtXtClUU1wkiULT3y/1VCjVV0UYwBgU/
 vnPSiERoIn6mayhWSw5duvXStuB1qdIAocYqyNpiWyH6QDmAmzCxbUP6VPFAUQpmDd+z
 3MIGAJmbUtjNUAVspZBoF7S/wAaZ3KXQ0h4x5Y4lbbpbWXGmxQVsS/ZnjbT5ICxlnNx5
 CKesy9ZWKDUARTL8UIl56zEtCWuS3pNgaVp4QB+a6OgrWpZJmz4mCP6Jj2wMEV76do6d
 8oHA==
X-Gm-Message-State: AJIora8l9cc4keIs5PQSUT0D4hsFo9c0IOtTbLPMA9IoTF+xObbsXgCh
 T6Kr/zqSO51H70CjMwvZLok=
X-Google-Smtp-Source: AGRyM1sHubkI/7+0rGFhAUfwLp8/Mzghf+xjqeQV+PtZZqG1O9MG3rIHgP/xVuKCYMnmJaV+7dHX5g==
X-Received: by 2002:a05:6830:25c2:b0:60c:6ae9:6cb5 with SMTP id
 d2-20020a05683025c200b0060c6ae96cb5mr11449582otu.369.1655819654398; 
 Tue, 21 Jun 2022 06:54:14 -0700 (PDT)
Received: from [192.168.10.102] ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a05687044d500b00101fae1b82fsm3119034oai.4.2022.06.21.06.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 06:54:14 -0700 (PDT)
Message-ID: <0493683a-47e8-ce26-0cd1-671928803f80@gmail.com>
Date: Tue, 21 Jun 2022 10:54:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu] spapr/ddw: Reset DMA when the last non-default
 window is removed
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220620080109.998804-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220620080109.998804-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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



On 6/20/22 05:01, Alexey Kardashevskiy wrote:
> PAPR+/LoPAPR says:
> ===
> The platform must restore the default DMA window for the PE on a call
> to the ibm,remove-pe-dma-window RTAS call when all of the following
> are true:
>   a. The call removes the last DMA window remaining for the PE.
>   b. The DMA window being removed is not the default window
> 
> ===
> 
> This resets DMA as PAPR mandates.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Looks good. One comment below:


>   include/hw/ppc/spapr.h  |  3 ++-
>   hw/ppc/spapr_iommu.c    |  8 +++++---
>   hw/ppc/spapr_pci.c      |  2 +-
>   hw/ppc/spapr_rtas_ddw.c | 17 ++++++++++++++++-
>   hw/ppc/spapr_vio.c      |  3 ++-
>   5 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 072dda2c7265..0adbe1566d40 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -902,6 +902,7 @@ struct SpaprTceTable {
>       bool bypass;
>       bool need_vfio;
>       bool skipping_replay;
> +    bool def_win;
>       int fd;
>       MemoryRegion root;
>       IOMMUMemoryRegion iommu;
> @@ -928,7 +929,7 @@ void spapr_check_mmu_mode(bool guest_radix);
>   SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn);
>   void spapr_tce_table_enable(SpaprTceTable *tcet,
>                               uint32_t page_shift, uint64_t bus_offset,
> -                            uint32_t nb_table);
> +                            uint32_t nb_table, bool def_win);

Do we need to add 'def_win' to spapr_tce_table_enable()? I see that you're using
the 'def_win' var to assign

+    tcet->def_win = def_win;

but the only case where def_win will be other than 'false' is:

- the function is called by spapr_tce_post_load(), but in that case it's being
callied like this:

     spapr_tce_table_enable(tcet, old_page_shift, old_bus_offset,
                            tcet->mig_nb_table, tcet->def_win);

which results in the function doing tcet->def_win = tcet->def_win, which is
uneeded.


- the function is called by spapr_phb_dma_reset(). In this case I believe
we can just do "tcet->def_win = true" before calling spapr_tce_table_enable():


>       /* Register default 32bit DMA window */
>       tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
> +     tcet->def_win = true;
>       spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, sphb->dma_win_addr,
>                              sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
>   }

All other calls to spapr_tce_table_enable() are passing 'false' to def_win and
can be left alone.

Assuming that there's no way a created DMA window becomes the default window, or
the default DMA window is demoted to non-default, I think we can leave
spapr_tce_table_enable() untouched and just set tcet->def_win to true inside
spapr_phb_dma_reset().


Thanks,


Daniel



>   void spapr_tce_table_disable(SpaprTceTable *tcet);
>   void spapr_tce_set_need_vfio(SpaprTceTable *tcet, bool need_vfio);
>   
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 81e5a1aea3a6..f8c1627d0782 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -242,7 +242,7 @@ static int spapr_tce_table_post_load(void *opaque, int version_id)
>       if (tcet->mig_nb_table) {
>           if (!tcet->nb_table) {
>               spapr_tce_table_enable(tcet, old_page_shift, old_bus_offset,
> -                                   tcet->mig_nb_table);
> +                                   tcet->mig_nb_table, tcet->def_win);
>           }
>   
>           memcpy(tcet->table, tcet->mig_table,
> @@ -279,7 +279,7 @@ static const VMStateDescription vmstate_spapr_tce_table_ex = {
>   
>   static const VMStateDescription vmstate_spapr_tce_table = {
>       .name = "spapr_iommu",
> -    .version_id = 2,
> +    .version_id = 3,
>       .minimum_version_id = 2,
>       .pre_save = spapr_tce_table_pre_save,
>       .post_load = spapr_tce_table_post_load,
> @@ -292,6 +292,7 @@ static const VMStateDescription vmstate_spapr_tce_table = {
>           VMSTATE_BOOL(bypass, SpaprTceTable),
>           VMSTATE_VARRAY_UINT32_ALLOC(mig_table, SpaprTceTable, mig_nb_table, 0,
>                                       vmstate_info_uint64, uint64_t),
> +        VMSTATE_BOOL_V(def_win, SpaprTceTable, 3),
>   
>           VMSTATE_END_OF_LIST()
>       },
> @@ -380,7 +381,7 @@ SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn)
>   
>   void spapr_tce_table_enable(SpaprTceTable *tcet,
>                               uint32_t page_shift, uint64_t bus_offset,
> -                            uint32_t nb_table)
> +                            uint32_t nb_table, bool def_win)
>   {
>       if (tcet->nb_table) {
>           warn_report("trying to enable already enabled TCE table");
> @@ -390,6 +391,7 @@ void spapr_tce_table_enable(SpaprTceTable *tcet,
>       tcet->bus_offset = bus_offset;
>       tcet->page_shift = page_shift;
>       tcet->nb_table = nb_table;
> +    tcet->def_win = def_win;
>       tcet->table = spapr_tce_alloc_table(tcet->liobn,
>                                           tcet->page_shift,
>                                           tcet->bus_offset,
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index b2f5fbef0c83..e1dbccfc7547 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2066,7 +2066,7 @@ void spapr_phb_dma_reset(SpaprPhbState *sphb)
>       /* Register default 32bit DMA window */
>       tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
>       spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, sphb->dma_win_addr,
> -                           sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
> +                           sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT, true);
>   }
>   
>   static void spapr_phb_reset(DeviceState *qdev)
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 13d339c807c1..4fe41b0c4539 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -182,7 +182,7 @@ static void rtas_ibm_create_pe_dma_window(PowerPCCPU *cpu,
>        */
>       tcet->skipping_replay = true;
>       spapr_tce_table_enable(tcet, page_shift, win_addr,
> -                           1ULL << (window_shift - page_shift));
> +                           1ULL << (window_shift - page_shift), false);
>       tcet->skipping_replay = false;
>       if (!tcet->nb_table) {
>           goto hw_error_exit;
> @@ -215,6 +215,7 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
>       SpaprPhbState *sphb;
>       SpaprTceTable *tcet;
>       uint32_t liobn;
> +    bool def_win_removed;
>   
>       if ((nargs != 1) || (nret != 1)) {
>           goto param_error_exit;
> @@ -231,9 +232,23 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
>           goto param_error_exit;
>       }
>   
> +    def_win_removed = tcet->def_win;
>       spapr_tce_table_disable(tcet);
>       trace_spapr_iommu_ddw_remove(liobn);
>   
> +    /*
> +     * PAPR+/LoPAPR says:
> +     * The platform must restore the default DMA window for the PE on a call
> +     * to the ibm,remove-pe-dma-window RTAS call when all of the following
> +     * are true:
> +     * a. The call removes the last DMA window remaining for the PE.
> +     * b. The DMA window being removed is not the default window
> +     */
> +    if (spapr_phb_get_active_win_num(sphb) == 0 && !def_win_removed) {
> +        spapr_phb_dma_reset(sphb);
> +        trace_spapr_iommu_ddw_reset(sphb->buid, 0);
> +    }
> +
>       rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>       return;
>   
> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> index 9d4fec2c04d8..14506df19d62 100644
> --- a/hw/ppc/spapr_vio.c
> +++ b/hw/ppc/spapr_vio.c
> @@ -533,7 +533,8 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
>   
>           dev->tcet = spapr_tce_new_table(qdev, liobn);
>           spapr_tce_table_enable(dev->tcet, SPAPR_TCE_PAGE_SHIFT, 0,
> -                               pc->rtce_window_size >> SPAPR_TCE_PAGE_SHIFT);
> +                               pc->rtce_window_size >> SPAPR_TCE_PAGE_SHIFT,
> +                               false);
>           dev->tcet->vdev = dev;
>           memory_region_add_subregion_overlap(&dev->mrroot, 0,
>                                               spapr_tce_get_iommu(dev->tcet), 2);

