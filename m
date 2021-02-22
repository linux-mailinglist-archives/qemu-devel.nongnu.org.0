Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714B321615
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:18:29 +0100 (CET)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAAW-0001Lm-Ai
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lE9su-0001Hq-Hu; Mon, 22 Feb 2021 07:00:16 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lE9so-0001zn-7N; Mon, 22 Feb 2021 07:00:16 -0500
Received: by mail-pj1-x1035.google.com with SMTP id kr16so8361281pjb.2;
 Mon, 22 Feb 2021 04:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o3Gof8HuOUaCfIEfOchm3OnbNQHif5ARiNm3uD0Jmzk=;
 b=XAR6VJhxqtulVmZgI4RHFMl5X8SD/NBT4K7GPU8QkvQmU01DIRasDh8vAZNuY4bi0x
 0bmVYShL4GnH36unjvHOGlSmeapL3c5uAdAzg8FMKuHcqy5vq20pmFuhjffnymMzcmlm
 TxHwFAAGZvF9BPxVguvUGnCodfcTOZ6RffvahrckYwdX8C8tBoGdUF8g0zvmBr40PEdk
 YKx2gkUwdLHXOmgXBOTYWeqL2TnvSMLeiXEAI9pLZHLqVq8BnZDynZvj+yw8pv1/jVBV
 v5szsvoXW6gmUY1P8Q9HhfB4Nk7vYo59lb/I9ZZ686o9XYroryK5eivtzkFe253zmwnS
 JKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o3Gof8HuOUaCfIEfOchm3OnbNQHif5ARiNm3uD0Jmzk=;
 b=YRviOrEuUoPOodMhq8067DJtYemlrumhVzMreCwOgEbfbFlIXjyandS7Whi/PcJ2Gl
 LkhiHw/jnZScgiU+MXglauHYtLMK+8mOal7uSNT0C7HNzLb67c0D2P2QpJ38cS3NHdzP
 hvOrbxans9WDxzRxVywdEbFgnF9zp7UAKF/LMdzai9+5Ly3HzSvuovx7RqqbC5CvodNG
 mAG2C6ToV6D1YT3Cs0ZNROu464ZRGO7+nNDmNeYHGoJY0ydulYq2FGj8iFOaBh2dxsjO
 s0tb3ZnmRAr1+ZotHZyT38aV+VjtxcYfTVYMw95UBqAyJtIbTUY8mmuEiqvOXKW+vuiL
 Ho+Q==
X-Gm-Message-State: AOAM533T6dtxAnVj0edv+x07p0jKqbOiE/gc8PLGceeUY62raEvJBdT/
 wigzgjv6imA/1utAe/IkjpY=
X-Google-Smtp-Source: ABdhPJwhY7AjfvD892SJOO569RIohotPmYW2IYGZ2aB/B0f5sV2ylO+z1lZ9ZnLNl29nVfrDd63OJA==
X-Received: by 2002:a17:903:22ce:b029:e3:c57d:aaa9 with SMTP id
 y14-20020a17090322ceb02900e3c57daaa9mr14956878plg.7.1613995207616; 
 Mon, 22 Feb 2021 04:00:07 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 62sm18584309pfg.160.2021.02.22.04.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:00:07 -0800 (PST)
Date: Mon, 22 Feb 2021 21:00:04 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/3] hw/block/nvme: nvme_identify fixes
Message-ID: <20210222120004.GB2856@localhost.localdomain>
References: <20210222070615.9177-1-its@irrelevant.dk>
 <20210222070615.9177-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222070615.9177-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1035.google.com
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

On 21-02-22 08:06:13, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Remove an unnecessary le_to_cpu conversion and add trace event for
> Identify.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c       | 5 ++++-
>  hw/block/trace-events | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 1cd82fa3c9fe..ddc83f7f7a19 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3415,7 +3415,10 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>  
> -    switch (le32_to_cpu(c->cns)) {
> +    trace_pci_nvme_identify(nvme_cid(req), c->cns, le16_to_cpu(c->ctrlid),
> +                            c->csi);

I think it would be great if it can be separated into two.
Anyway, changes look good to me.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

> +
> +    switch (c->cns) {
>      case NVME_ID_CNS_NS:
>           /* fall through */
>      case NVME_ID_CNS_NS_PRESENT:
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index b04f7a3e1890..1f958d09d2a9 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -61,6 +61,7 @@ pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize,
>  pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
>  pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
>  pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
> +pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid %"PRIu16" cns 0x%"PRIx8" ctrlid %"PRIu16" csi 0x%"PRIx8""
>  pci_nvme_identify_ctrl(void) "identify controller"
>  pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
>  pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
> -- 
> 2.30.1
> 
> 

