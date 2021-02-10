Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785EE3164D9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:15:46 +0100 (CET)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nTF-0007Mi-IR
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9nSA-0006pD-Dk; Wed, 10 Feb 2021 06:14:38 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9nS8-0004n0-Ju; Wed, 10 Feb 2021 06:14:38 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e9so1031818plh.3;
 Wed, 10 Feb 2021 03:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=88uR6DdXtSsRvec3UnCiMohS9TDwDtNbAsZgtuyxF8Q=;
 b=oHokdqiDwOkWQBf2Rj4WfZzm8a2OkCvQrMV0eIVD9aFTZzj4u1rxDRo566xcPWwATr
 q6pVkaL7YmokOnFjejPfJRYLaUEJHw7ANcMf8nPcVbLhIKwwweq0rMB21X+Vn8TCO2TD
 cQhO0YPcDh5VrVfDWj0POrsy9ZSubuOyHNW072YT/eAqeqJUYG+qp69UbQr2zneLv5Wd
 SjXvzpX5ez+PcDf3gsvB9kmGIOLv0LThxfqLt75hpSI/PFCmMto7lV753SGvGAYVQfKf
 tHLY/CsVRCpQJs6EYpSDrar7fikAJ7VgAHclOyCrfgyL4/kKzFMbqzTPlfr5f51hkEqp
 21ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=88uR6DdXtSsRvec3UnCiMohS9TDwDtNbAsZgtuyxF8Q=;
 b=izWNtXnrdWpQ1LK15XR3Ycbbt2zFw+QxniQMqdMQG0WAG9zW5K3yozNZKxCjTQ39Pw
 Aaot2jiAzX83ZO0UU2QwB3eoF2WJgWS3bF7brHyRMcu59NC4hv+Nj3+NbwiGjA6WF+ZJ
 I4DmgLKVVYeu8GVio5io3RxMZ/4mbu0fiLZ7kg5vOclj4QOjQaUjEzn9YcoaRDbmIyog
 PKBaOlmysLZEMwvRSYMK12H/Iqz/+2UEMHL+0n27XwBT4eVWMD8Fnul/U3fkDR5JsSTS
 ClT4tNcBdJ+zadFfj7kPMaz2oQhgNEHh6XYsRCB18066haSWw143NK54ysKsxXebwXyl
 JSuw==
X-Gm-Message-State: AOAM533nOnmpccneDzn7T38oWjcnY05GjQIUZ3//HOlxgTxo3MU2u9XG
 cZIDln1AO3tF+1HJK/sg/SU=
X-Google-Smtp-Source: ABdhPJyC3x+bOvaET2Zl3GNKBrGXRUTVAP5BJGSGxcMtbw0juv0OPR+w+W2xYtWvMymkr30SjTezoA==
X-Received: by 2002:a17:90a:4209:: with SMTP id
 o9mr2734816pjg.75.1612955674563; 
 Wed, 10 Feb 2021 03:14:34 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id v4sm1920673pff.156.2021.02.10.03.14.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 03:14:34 -0800 (PST)
Date: Wed, 10 Feb 2021 20:14:32 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <20210210111432.GC9664@localhost.localdomain>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210070646.730110-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62f.google.com
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

On 21-02-10 08:06:46, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Add support for marking blocks invalid with the Write Uncorrectable
> command. Block status is tracked in a (non-persistent) bitmap that is
> checked on all reads and written to on all writes. This is potentially
> expensive, so keep Write Uncorrectable disabled by default.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  docs/specs/nvme.txt   |  3 ++
>  hw/block/nvme-ns.h    |  2 ++
>  hw/block/nvme.h       |  1 +
>  hw/block/nvme-ns.c    |  2 ++
>  hw/block/nvme.c       | 65 +++++++++++++++++++++++++++++++++++++------
>  hw/block/trace-events |  1 +
>  6 files changed, 66 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
> index 56d393884e7a..88f9cc278d4c 100644
> --- a/docs/specs/nvme.txt
> +++ b/docs/specs/nvme.txt
> @@ -19,5 +19,8 @@ Known issues
>  
>  * The accounting numbers in the SMART/Health are reset across power cycles
>  
> +* Marking blocks invalid with the Write Uncorrectable is not persisted across
> +  power cycles.
> +
>  * Interrupt Coalescing is not supported and is disabled by default in volation
>    of the specification.
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 7af6884862b5..15fa422ded03 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -72,6 +72,8 @@ typedef struct NvmeNamespace {
>      struct {
>          uint32_t err_rec;
>      } features;
> +
> +    unsigned long *uncorrectable;
>  } NvmeNamespace;
>  
>  static inline uint32_t nvme_nsid(NvmeNamespace *ns)
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 98082b2dfba3..9b8f85b9cf16 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -68,6 +68,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
>      case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
>      case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
>      case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
> +    case NVME_CMD_WRITE_UNCOR:      return "NVME_CMD_WRITE_UNCOR";
>      case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
>      case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
>      case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index ade46e2f3739..742bbc4b4b62 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -72,6 +72,8 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>      id_ns->mcl = cpu_to_le32(ns->params.mcl);
>      id_ns->msrc = ns->params.msrc;
>  
> +    ns->uncorrectable = bitmap_new(id_ns->nsze);
> +
>      return 0;
>  }
>  
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index e5f6666725d7..56048046c193 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1112,6 +1112,20 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
>      return NVME_SUCCESS;
>  }
>  
> +static inline uint16_t nvme_check_uncor(NvmeNamespace *ns, uint64_t slba,
> +                                        uint32_t nlb)
> +{
> +    uint64_t elba = nlb + slba;
> +
> +    if (ns->uncorrectable) {
> +        if (find_next_bit(ns->uncorrectable, elba, slba) < elba) {
> +            return NVME_UNRECOVERED_READ | NVME_DNR;
> +        }
> +    }
> +
> +    return NVME_SUCCESS;
> +}
> +
>  static void nvme_aio_err(NvmeRequest *req, int ret)
>  {
>      uint16_t status = NVME_SUCCESS;
> @@ -1423,14 +1437,24 @@ static void nvme_rw_cb(void *opaque, int ret)
>      BlockAcctCookie *acct = &req->acct;
>      BlockAcctStats *stats = blk_get_stats(blk);
>  
> +    bool is_write = nvme_is_write(req);
> +
>      trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
>  
> -    if (ns->params.zoned && nvme_is_write(req)) {
> +    if (ns->params.zoned && is_write) {
>          nvme_finalize_zoned_write(ns, req);
>      }
>  
>      if (!ret) {
>          block_acct_done(stats, acct);
> +
> +        if (is_write) {
> +            NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
> +            uint64_t slba = le64_to_cpu(rw->slba);
> +            uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
> +
> +            bitmap_clear(ns->uncorrectable, slba, nlb);

It might be nitpick, 'nlb' would easily represent the value which is
defined itself in the spec which is zero-based.  Can we have this like:

	uint32_t nlb = le16_to_cpu(rw->nlb);

	bitmap_clear(ns->uncorrectable, slba, nlb + 1);

Otherwise, it looks good to me.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

