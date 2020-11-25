Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D882C41E4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 15:12:49 +0100 (CET)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khvXL-0007Sc-LQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 09:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1khvVo-0006qg-CW; Wed, 25 Nov 2020 09:11:12 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1khvVl-0007we-OC; Wed, 25 Nov 2020 09:11:12 -0500
Received: by mail-pf1-x441.google.com with SMTP id e8so2454544pfh.2;
 Wed, 25 Nov 2020 06:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PD27QkSFm5MCXlD8o6xlhMP62UK8tjMFKe/ug7vPXKo=;
 b=mJqpHRfnqlCfZfxk3db6Gyt6vgxWbx3rWX+31fqPHzltiqnmCjMuw2Hjr1FGOcsMne
 I2WqYiEdAfemVZJmSOPZ8uogFnQZMLeisN3yqhBoU5VHSHWKJCjnd4DO3ZRlX9CglffJ
 2hyjmwtOis8rK3PhVnKpR8xBv5dfO+GA3TFVFrVabPD81lEpHdFi+GjYw/apa/wXXhkO
 iF7881TSTw2q34KJlj+NzbdAWCQLmv5yJklNZpVPXuSnFd6XEH3Nz5ujv3CTZaqwWLe2
 JqY7JXiWwYGkp5sLyYva5U4Gcx7hbszK7M/eutAOi2LQtxZIVtjZGYDk/jC58imlmrT1
 3V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PD27QkSFm5MCXlD8o6xlhMP62UK8tjMFKe/ug7vPXKo=;
 b=gKnKjc07/YTiH/5TlhdH8fUQvJsV8Jhb9pfo3xrBr+Y+E3qJPCE3c7sNk5EpMVa9vb
 6IiwVFNbnK0TBfk/i4JtCjWEA8+nRmQFVvVLxSIn+15OpSNN65Ifmx/gnFgCqJh9qtPx
 PzqPMI4dQ9+Y/aaj+RCLJV0vDpf1BmNCyy5w13+wSquDUGAZXfEpGm2o7tdDjClOZX6p
 cDrdg/WSq5i8gMP9Ytmg6hCtaXc4GcypGxpXBLHPYaqYYCN1anGV21Y54Cj+k4HJVjWV
 7hZZN/LKFDcCpLyvkt2eztJCOqsqZkeSMqQE9zzJYtttEX32Z7U4XUdgWkmCOaud/BKM
 DLzw==
X-Gm-Message-State: AOAM5303TrbDiavI+uf8Aj6CqV0DDpL2TJ+B456+mw2KSDGX5eH0NLVH
 UixOW9TnNg/FyvbrW60C1j4=
X-Google-Smtp-Source: ABdhPJw1+AorC4h8GZJFkwWLCfPg4wlhNo02P69Oa2zRU+jHBabfeWyCnDDchccNBlI8tygWRthvhw==
X-Received: by 2002:aa7:96ba:0:b029:197:e733:ae3c with SMTP id
 g26-20020aa796ba0000b0290197e733ae3cmr2441823pfk.46.1606313467713; 
 Wed, 25 Nov 2020 06:11:07 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id p6sm3289031pjt.13.2020.11.25.06.11.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Nov 2020 06:11:07 -0800 (PST)
Date: Wed, 25 Nov 2020 23:11:04 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add compare command
Message-ID: <20201125141104.bs5fwi7xtyo4nyv7@localhost.localdomain>
References: <20201124073714.24458-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124073714.24458-1-its@irrelevant.dk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x441.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 20-11-24 08:37:14, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Add the Compare command.
> 
> This implementation uses a bounce buffer to read in the data from
> storage and then compare with the host supplied buffer.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> [k.jensen: rebased]
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c       | 100 +++++++++++++++++++++++++++++++++++++++++-
>  hw/block/trace-events |   2 +
>  2 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f7f888402b06..f88710ca3948 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -999,6 +999,50 @@ static void nvme_aio_discard_cb(void *opaque, int ret)
>      nvme_enqueue_req_completion(nvme_cq(req), req);
>  }
>  
> +struct nvme_compare_ctx {
> +    QEMUIOVector iov;
> +    uint8_t *bounce;
> +    size_t len;
> +};
> +
> +static void nvme_compare_cb(void *opaque, int ret)
> +{
> +    NvmeRequest *req = opaque;
> +    NvmeNamespace *ns = req->ns;
> +    struct nvme_compare_ctx *ctx = req->opaque;
> +    g_autofree uint8_t *buf = NULL;

nit-picking here: unnecessary initialization to NULL.

> +    uint16_t status;
> +
> +    trace_pci_nvme_compare_cb(nvme_cid(req));
> +
> +    if (!ret) {
> +        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
> +    } else {
> +        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
> +        nvme_aio_err(req, ret);
> +        goto out;
> +    }
> +
> +    buf = g_malloc(ctx->len);
> +
> +    status = nvme_dma(nvme_ctrl(req), buf, ctx->len, DMA_DIRECTION_TO_DEVICE,
> +                      req);
> +    if (status) {
> +        goto out;
> +    }

Don't we need to give status value to req->status in case of
(status != 0)?  If we don't give it to req->status, it will complete
with success status code even it fails during the nvme_dma().

