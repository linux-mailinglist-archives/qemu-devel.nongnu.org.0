Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4872B4319
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:45:13 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecwa-0000ek-3Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kecvO-0008Cw-0b; Mon, 16 Nov 2020 06:43:58 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kecvI-0005Wx-Nt; Mon, 16 Nov 2020 06:43:57 -0500
Received: by mail-pl1-x642.google.com with SMTP id y22so8253630plr.6;
 Mon, 16 Nov 2020 03:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TD/tfthmHuwpS7ng/v2sETXaSTgWVIMyichi5ZSi0/8=;
 b=TdSk+49emfaprV4I0rjUs0AT8qL1fUujOYZtyzGPdXc41tyZOR6osDf+zQzJ3OgIwE
 v2vw9MWV+1tnPUuwI+IcpTkY1jrjFkMNRIorXxoiei9O/MNGa77ESskuHeNOsjyfY7vb
 pS9rJY2BIZACUGrUW+M7jQVJ+GkUC5cSgSKL4T2ofboEK7aTbPVWzTlH1NwZRPTx35lS
 MkVsF+RCdfR7F7a1NjwVfZt0cPrFQ39+dJ6GFeKEtpVg9VQuua58Tt97FS8MT80BnUgc
 fAsSgCPqrZC9yYaTkcFHVmTLX2pYQHY+us4NDxAnHe8eIq+flNBdXHGdU/I8wJYSuaWZ
 qjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TD/tfthmHuwpS7ng/v2sETXaSTgWVIMyichi5ZSi0/8=;
 b=TQj00c12VQlWJ+naj9C0AziZo0UWS5tNNf/Yl5ButRRllADM+4GnN7/4hEGwtrtiVj
 9zvIPVvfmkt8nlGAPvohkYGsqhHVovFoVGpOaJh/YL4+kOIBbLMoWUh7zdQY21C3GOSs
 Quvhg6o0LKtyiIHj33jZ1e9FXe1k2dICg9jsQipmotctP73fZDGu10g24GPCM68S/1SW
 GyoapqQBVey81YPFSB27+pZ+F6qBZ/rw6VvpjrHy4/cAFxOHzl8tVQIIGY43CrANcvBt
 66/Zw16LHsA7Y0wYtzbAB1oamy79c/LPGOGaHFYS2ebcclJEm1gBli9z6hLDZxjerUrM
 2RqA==
X-Gm-Message-State: AOAM532prl6bfuueUestdCukUO1r0sZuJ6bJkUIJq+kAQyoSi/SVNB4g
 Tj0f+YuZZwmEkaaSWiGQnrc=
X-Google-Smtp-Source: ABdhPJwI1J51bJtP79Li/IC0YhrxJGj8e0L89M2HWyia4bGxXZ6A4XOXGO4Tr7w4EBxaJ+7NpC8o2A==
X-Received: by 2002:a17:902:6a84:b029:d7:d023:5723 with SMTP id
 n4-20020a1709026a84b02900d7d0235723mr12675379plk.34.1605527030932; 
 Mon, 16 Nov 2020 03:43:50 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id t16sm10206989pga.51.2020.11.16.03.43.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 03:43:50 -0800 (PST)
Date: Mon, 16 Nov 2020 20:43:48 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 3/5] hw/block/nvme: add dulbe support
Message-ID: <20201116114348.GC7308@localhost.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-4-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12 20:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add support for reporting the Deallocated or Unwritten Logical Block
> Error (DULBE).
> 
> Rely on the block status flags reported by the block layer and consider
> any block with the BDRV_BLOCK_ZERO flag to be deallocated.
> 
> Multiple factors affect when a Write Zeroes command result in
> deallocation of blocks.
> 
>   * the underlying file system block size
>   * the blockdev format
>   * the 'discard' and 'logical_block_size' parameters
> 
>      format | discard | wz (512B)  wz (4KiB)  wz (64KiB)
>     -----------------------------------------------------
>       qcow2    ignore   n          n          y
>       qcow2    unmap    n          n          y
>       raw      ignore   n          y          y
>       raw      unmap    n          y          y
> 
> So, this works best with an image in raw format and 4KiB LBAs, since
> holes can then be punched on a per-block basis (this assumes a file
> system with a 4kb block size, YMMV). A qcow2 image, uses a cluster size
> of 64KiB by default and blocks will only be marked deallocated if a full
> cluster is zeroed or discarded. However, this *is* consistent with the
> spec since Write Zeroes "should" deallocate the block if the Deallocate
> attribute is set and "may" deallocate if the Deallocate attribute is not
> set. Thus, we always try to deallocate (the BDRV_REQ_MAY_UNMAP flag is
> always set).
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme-ns.h    |  4 ++
>  include/block/nvme.h  |  5 +++
>  hw/block/nvme-ns.c    |  8 ++--
>  hw/block/nvme.c       | 91 ++++++++++++++++++++++++++++++++++++++++++-
>  hw/block/trace-events |  4 ++
>  5 files changed, 107 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 83734f4606e1..44bf6271b744 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -31,6 +31,10 @@ typedef struct NvmeNamespace {
>      NvmeIdNs     id_ns;
>  
>      NvmeNamespaceParams params;
> +
> +    struct {
> +        uint32_t err_rec;
> +    } features;
>  } NvmeNamespace;
>  
>  static inline uint32_t nvme_nsid(NvmeNamespace *ns)
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 8a46d9cf015f..966c3bb304bd 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -687,6 +687,7 @@ enum NvmeStatusCodes {
>      NVME_E2E_REF_ERROR          = 0x0284,
>      NVME_CMP_FAILURE            = 0x0285,
>      NVME_ACCESS_DENIED          = 0x0286,
> +    NVME_DULB                   = 0x0287,
>      NVME_MORE                   = 0x2000,
>      NVME_DNR                    = 0x4000,
>      NVME_NO_COMPLETE            = 0xffff,
> @@ -903,6 +904,9 @@ enum NvmeIdCtrlLpa {
>  #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
>  #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
>  
> +#define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
> +#define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
> +
>  enum NvmeFeatureIds {
>      NVME_ARBITRATION                = 0x1,
>      NVME_POWER_MANAGEMENT           = 0x2,
> @@ -1023,6 +1027,7 @@ enum NvmeNsIdentifierType {
>  
>  
>  #define NVME_ID_NS_NSFEAT_THIN(nsfeat)      ((nsfeat & 0x1))
> +#define NVME_ID_NS_NSFEAT_DULBE(nsfeat)     ((nsfeat >> 2) & 0x1)
>  #define NVME_ID_NS_FLBAS_EXTENDED(flbas)    ((flbas >> 4) & 0x1)
>  #define NVME_ID_NS_FLBAS_INDEX(flbas)       ((flbas & 0xf))
>  #define NVME_ID_NS_MC_SEPARATE(mc)          ((mc >> 1) & 0x1)
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 31c80cdf5b5f..f1cc734c60f5 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -33,9 +33,7 @@ static void nvme_ns_init(NvmeNamespace *ns)
>      NvmeIdNs *id_ns = &ns->id_ns;
>      int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
>  
> -    if (blk_get_flags(ns->blkconf.blk) & BDRV_O_UNMAP) {
> -        ns->id_ns.dlfeat = 0x9;
> -    }
> +    ns->id_ns.dlfeat = 0x9;
>  
>      id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
>  
> @@ -44,6 +42,9 @@ static void nvme_ns_init(NvmeNamespace *ns)
>      /* no thin provisioning */
>      id_ns->ncap = id_ns->nsze;
>      id_ns->nuse = id_ns->ncap;
> +
> +    /* support DULBE */
> +    id_ns->nsfeat |= 0x4;
>  }
>  
>  static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
> @@ -92,6 +93,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>      }
>  
>      nvme_ns_init(ns);
> +
>      if (nvme_register_namespace(n, ns, errp)) {
>          return -1;
>      }
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index a96a996ddc0d..8d75a89fd872 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -105,6 +105,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
>  
>  static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
>      [NVME_TEMPERATURE_THRESHOLD]    = NVME_FEAT_CAP_CHANGE,
> +    [NVME_ERROR_RECOVERY]           = NVME_FEAT_CAP_CHANGE | NVME_FEAT_CAP_NS,
>      [NVME_VOLATILE_WRITE_CACHE]     = NVME_FEAT_CAP_CHANGE,
>      [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
>      [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
> @@ -878,6 +879,49 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
>      return NVME_SUCCESS;
>  }
>  
> +static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
> +                                 uint32_t nlb)
> +{
> +    BlockDriverState *bs = blk_bs(ns->blkconf.blk);
> +
> +    int64_t pnum = 0, bytes = nvme_l2b(ns, nlb);
> +    int64_t offset = nvme_l2b(ns, slba);
> +    bool zeroed;
> +    int ret;
> +
> +    Error *local_err = NULL;
> +
> +    /*
> +     * `pnum` holds the number of bytes after offset that shares the same
> +     * allocation status as the byte at offset. If `pnum` is different from
> +     * `bytes`, we should check the allocation status of the next range and
> +     * continue this until all bytes have been checked.
> +     */
> +    do {
> +        bytes -= pnum;
> +
> +        ret = bdrv_block_status(bs, offset, bytes, &pnum, NULL, NULL);
> +        if (ret < 0) {
> +            error_setg_errno(&local_err, -ret, "unable to get block status");
> +            error_report_err(local_err);
> +
> +            return NVME_INTERNAL_DEV_ERROR;
> +        }
> +
> +        zeroed = !!(ret & BDRV_BLOCK_ZERO);
> +
> +        trace_pci_nvme_block_status(offset, bytes, pnum, ret, zeroed);
> +
> +        if (zeroed) {
> +            return NVME_DULB;
> +        }
> +
> +        offset += pnum;
> +    } while (pnum != bytes);
> +
> +    return NVME_SUCCESS;
> +}
> +
>  static void nvme_aio_err(NvmeRequest *req, int ret)
>  {
>      uint16_t status = NVME_SUCCESS;
> @@ -996,6 +1040,15 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
>          goto invalid;
>      }
>  
> +    if (acct == BLOCK_ACCT_READ) {
> +        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
> +            status = nvme_check_dulbe(ns, slba, nlb);
> +            if (status) {
> +                goto invalid;
> +            }
> +        }
> +    }
> +
>      status = nvme_map_dptr(n, data_size, req);
>      if (status) {
>          goto invalid;
> @@ -1643,6 +1696,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
>      uint8_t fid = NVME_GETSETFEAT_FID(dw10);
>      NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
>      uint16_t iv;
> +    NvmeNamespace *ns;
>  
>      static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
>          [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
> @@ -1705,6 +1759,18 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
>          }
>  
>          return NVME_INVALID_FIELD | NVME_DNR;
> +    case NVME_ERROR_RECOVERY:
> +        if (!nvme_nsid_valid(n, nsid)) {
> +            return NVME_INVALID_NSID | NVME_DNR;
> +        }
> +
> +        ns = nvme_ns(n, nsid);
> +        if (unlikely(!ns)) {
> +            return NVME_INVALID_FIELD | NVME_DNR;
> +        }
> +
> +        result = ns->features.err_rec;
> +        goto out;
>      case NVME_VOLATILE_WRITE_CACHE:
>          result = n->features.vwc;
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
> @@ -1777,7 +1843,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
>  
>  static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
>  {
> -    NvmeNamespace *ns;
> +    NvmeNamespace *ns = NULL;
>  
>      NvmeCmd *cmd = &req->cmd;
>      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> @@ -1785,6 +1851,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
>      uint32_t nsid = le32_to_cpu(cmd->nsid);
>      uint8_t fid = NVME_GETSETFEAT_FID(dw10);
>      uint8_t save = NVME_SETFEAT_SAVE(dw10);
> +    int i;
>  
>      trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
>  
> @@ -1844,11 +1911,31 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
>                                 NVME_LOG_SMART_INFO);
>          }
>  
> +        break;
> +    case NVME_ERROR_RECOVERY:
> +        if (nsid == NVME_NSID_BROADCAST) {
> +            for (i = 1; i <= n->num_namespaces; i++) {
> +                ns = nvme_ns(n, i);
> +
> +                if (!ns) {
> +                    continue;
> +                }
> +
> +                if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat)) {
> +                    ns->features.err_rec = dw11;
> +                }
> +            }
> +
> +            break;
> +        }
> +
> +        assert(ns);

Klaus,

Sorry, but can we have assert for the failure that might happen due to
user's mis-behavior?  Why don't we have NVME_INVALID_NSID for this case?

