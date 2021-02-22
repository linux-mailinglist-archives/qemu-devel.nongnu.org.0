Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897132166C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:24:12 +0100 (CET)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAG3-00082b-GD
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lEA3T-0003pt-U5; Mon, 22 Feb 2021 07:11:11 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lEA3R-0006Hd-My; Mon, 22 Feb 2021 07:11:11 -0500
Received: by mail-pg1-x532.google.com with SMTP id t25so10104420pga.2;
 Mon, 22 Feb 2021 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t/WLspMBwnh7XDwnKZX0vVS5jNMMcxF3XzPXZSsaoCc=;
 b=iLkEJ3Y3dJ/4wUx3srHqkpaca90DO9GyERSCNhz1YPr8C35RaRfEK0Ft/G83imwL/Z
 BQW90RpopYrwOfi7DSmZBf2XF/0IhhiJJuY92Ynnqc4MBXXJXgJ7RlFKmsqPSbD+0zGV
 oxV8uY8+NxykFSWwL8jB2hA3rA/XNR2wsXamGBL/jFcV8rq2XP9iicEq1YLklKpRgkaB
 pxlN/QctQZKHe7yis3OzeR4yhWxT5kOgPxvFheieWkaSU9Ud7iJSpfhciBarWl0dBbKB
 u5q9LukCMNvLAVJa7CWdK8DY44cfh+Xh420KKaDcGxNZ9ciUd49HYWXi5iXkG/Ljh5os
 Jt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t/WLspMBwnh7XDwnKZX0vVS5jNMMcxF3XzPXZSsaoCc=;
 b=ucQ1+8F6aO/ho5Yg74pffYqVL0AIV4F2i8T5nrEqrNHR2gyauC+QV8M4B+Tq/LYQcO
 YGHA+PEqqJjgzgARcPvtwGkl6/Z96vhYlyY7QJbfTYB/yxHPW+3xy2cmuvE0lGYiX9li
 Q0+3/WKE4nvxypDQECLl5rZkGuYIVRpRU4aNXNgfkY2qAZ6LeyZx3IkbcyilLHPcb5kY
 T34voiJ6JzM9f5W+u4YAh2FIyyxzNRUc0vdeDUE5DYqcwKayRiR5/YHn8Hr9m+CgwFfu
 xbRPWGROlncA8vKJa68SPXE2SVE5UulMmUwyXOlmWOuD9M+RzB5ozDL6SDwMf28RbZ3V
 Uqew==
X-Gm-Message-State: AOAM531DSHNSH6C1efCb2gNDksKen9PfEu0paFf4TDuu4HV+k5GXvXwV
 F7LYNwqDZAcxZxWwv7hqGrg=
X-Google-Smtp-Source: ABdhPJxa86N2o5jpaibtXnvr2P105UC1QVxbJHHyi6pAKA4Gte8ltMLGKeEGydhxVWVRzMbuaIYrLA==
X-Received: by 2002:a05:6a00:16c7:b029:1bc:6eb9:ee47 with SMTP id
 l7-20020a056a0016c7b02901bc6eb9ee47mr22214075pfc.0.1613995867754; 
 Mon, 22 Feb 2021 04:11:07 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id f3sm18266602pfe.25.2021.02.22.04.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:11:07 -0800 (PST)
Date: Mon, 22 Feb 2021 21:11:05 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 3/3] hw/block/nvme: report non-mdts command size limit
 for dsm
Message-ID: <20210222121105.GD2856@localhost.localdomain>
References: <20210222070615.9177-1-its@irrelevant.dk>
 <20210222070615.9177-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222070615.9177-4-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-22 08:06:15, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Dataset Management is not subject to MDTS, but exceeded a certain size
> per range causes internal looping. Report this limit (DMRSL) in the NVM
> command set specific identify controller data structure.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.h       |  1 +
>  include/block/nvme.h  | 11 +++++++++++
>  hw/block/nvme.c       | 30 ++++++++++++++++++++----------
>  hw/block/trace-events |  1 +
>  4 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index cb2b5175f1a1..3046b82b3da1 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -172,6 +172,7 @@ typedef struct NvmeCtrl {
>      int         aer_queued;
>  
>      uint8_t     zasl;
> +    uint32_t    dmrsl;
>  
>      NvmeSubsystem   *subsys;
>  
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index b23f3ae2279f..16d8c4c90f7e 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -1041,6 +1041,16 @@ typedef struct NvmeIdCtrlZoned {
>      uint8_t     rsvd1[4095];
>  } NvmeIdCtrlZoned;
>  
> +typedef struct NvmeIdCtrlNvm {
> +    uint8_t     vsl;
> +    uint8_t     wzsl;
> +    uint8_t     wusl;
> +    uint8_t     dmrl;
> +    uint32_t    dmrsl;
> +    uint64_t    dmsl;
> +    uint8_t     rsvd16[4080];
> +} NvmeIdCtrlNvm;
> +
>  enum NvmeIdCtrlOacs {
>      NVME_OACS_SECURITY  = 1 << 0,
>      NVME_OACS_FORMAT    = 1 << 1,
> @@ -1396,6 +1406,7 @@ static inline void _nvme_check_size(void)
>      QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZoned) != 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlNvm) != 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 897b9ff0db91..5d6bba5fcb0d 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1777,6 +1777,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
>              trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
>                                            nlb);
>  
> +            if (nlb > n->dmrsl) {
> +                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
> +            }
> +
>              offset = nvme_l2b(ns, slba);
>              len = nvme_l2b(ns, nlb);
>  
> @@ -3202,21 +3206,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
>  static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
> -    NvmeIdCtrlZoned id = {};
> +    uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
>  
>      trace_pci_nvme_identify_ctrl_csi(c->csi);
>  
> -    if (c->csi == NVME_CSI_NVM) {
> -        return nvme_rpt_empty_id_struct(n, req);
> -    } else if (c->csi == NVME_CSI_ZONED) {
> -        if (n->params.zasl_bs) {
> -            id.zasl = n->zasl;
> -        }
> -        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
> -                        DMA_DIRECTION_FROM_DEVICE, req);
> +    switch (c->csi) {
> +    case NVME_CSI_NVM:
> +        ((NvmeIdCtrlNvm *)&id)->dmrsl = cpu_to_le32(n->dmrsl);
> +        break;
> +
> +    case NVME_CSI_ZONED:
> +        ((NvmeIdCtrlZoned *)&id)->zasl = n->zasl;

Question.  Are we okay without checking this like above ? :)

	if (n->params.zasl_bs) {
		((NvmeIdCtrlZoned *)&id)->zasl = n->zasl;
	}

> +        break;
> +
> +    default:
> +        return NVME_INVALID_FIELD | NVME_DNR;
>      }
>  
> -    return NVME_INVALID_FIELD | NVME_DNR;
> +    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
>  }
>  
>  static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
> @@ -4670,6 +4677,9 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>  
>      n->namespaces[nsid - 1] = ns;
>  
> +    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
> +                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
> +
>      return 0;
>  }
>  
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 1f958d09d2a9..27940fe2e98a 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -51,6 +51,7 @@ pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
>  pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
>  pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
>  pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
> +pci_nvme_dsm_single_range_limit_exceeded(uint32_t nlb, uint32_t dmrsl) "nlb %"PRIu32" dmrsl %"PRIu32""
>  pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
>  pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
>  pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
> -- 
> 2.30.1
> 
> 

