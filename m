Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318432291E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:56:32 +0100 (CET)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVMl-00072F-3H
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lEVKz-00067t-B1; Tue, 23 Feb 2021 05:54:41 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lEVKw-0006oi-R1; Tue, 23 Feb 2021 05:54:41 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gm18so1557260pjb.1;
 Tue, 23 Feb 2021 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GSM+IR3cw7lUFzFFiL5gR3vyf2xUEEL3dHTVCYAPNUs=;
 b=i68v5pdsKF8aW+4R+/y6GFIwnxTI5hR3hon9iJovyjXTL/et00Htbs5cYA5AG2/MlH
 t37QbsVSe1NjLHiqU9qOZgOVJWxYkJ+AZ9nfGurRrQUB4dIS1q/ueIngksTnfEU5jN7W
 +KVJapVK01USi+EhEFt/GUVy0rarmMpooK2HQlbxofctCHAgLoQ48m3mNNL/FxYd7+HG
 FTf/zAM4Gi9r0Zl6SqNxVBnNiJVtkpIbHc92wHDZdqAKmyf0N19fbqGfJgRIwFZdv5LX
 Tgh2Hnlo2TRFuXC4ptBB82imqpOgFYOlNtbySNi8baQ0/GtnwLgBbJh7jmsrZxXTAczn
 y+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GSM+IR3cw7lUFzFFiL5gR3vyf2xUEEL3dHTVCYAPNUs=;
 b=ojnzi8pIiletrwCLuF4zed5lul9LrA2kiUzCXHsU8M1cpRIJVu/8yufnugdHRtP5c3
 YIwHK7BCr608yBSZ0qXPXujP2e1AM6451hx3BLWVlhtro/eEwQuxkPB1zem9ZvcBjPCN
 QbYlfZ3mD6gvFROucbKC8G1y6euomXzqGIwy6WwyE4YleMo15PnpXrNK4igwLL13OVIw
 DotxEFmT1BACuAVlM3uwhKkiJO+Ya13wJ3dGUB8X1MXCT8CuqP/1lD7NHwDo4XF6o2jv
 7cPXtBcETgvXpECGMJAzNV3iB+b2aNGHkgmnrsvCD2r0y14Xmr/3sV6nar78xdnBpwqp
 hwlA==
X-Gm-Message-State: AOAM530Cyqqv1gfSJl77UBZ8P6oul9Bcpfta2uKh4AmiXmrSoMjijxLm
 Wy33fNfTuo2WfhcIbkOFT78=
X-Google-Smtp-Source: ABdhPJx5tOTG3Z+bdrrxYOp4Qn7jOPtv2PWjqKTszdUHAtBAuQBP8TPL74NOIjpTwOPG6dZiMBzAlA==
X-Received: by 2002:a17:902:f686:b029:de:18c7:41f8 with SMTP id
 l6-20020a170902f686b02900de18c741f8mr26591395plg.65.1614077676894; 
 Tue, 23 Feb 2021 02:54:36 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x68sm10839879pfc.26.2021.02.23.02.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 02:54:36 -0800 (PST)
Date: Tue, 23 Feb 2021 19:54:34 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/nvme: move device-scoped functions
Message-ID: <20210223105434.GA2119@localhost.localdomain>
References: <20210209110826.585987-1-its@irrelevant.dk>
 <20210209110826.585987-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210209110826.585987-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102e.google.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-09 12:08:26, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Move a bunch of functions that are internal to a device out of the
> shared header.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/nvme.h | 110 +------------------------------------------------
>  hw/nvme/ctrl.c |  90 +++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/ns.c   |   7 +++-
>  3 files changed, 97 insertions(+), 110 deletions(-)
> 
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 452a64499b1b..929c6c553ca2 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -96,36 +96,13 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
>      return -1;
>  }
>  
> -static inline bool nvme_ns_shared(NvmeNamespace *ns)
> -{
> -    return !!ns->subsys;
> -}

Re-raising this up.

Something like this helper is related to the data structure usages
itself like, if ns->subsys is not NULL, it "can" mean that this
namespace is shared among controllers.  This helper represents that the
'subsys' member itself is indicating some meaning, not only just for the
subsystem itself.

That's why I've been hesitating to simply ack to this patch ;)

But, I am not strongly against to this so please make a decision with
Keith and go ahead!

Thanks!

>  static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
>  {
> -    return nvme_ns_lbaf(ns)->ds;
> -}
> +    NvmeLBAF lbaf = ns->id_ns.lbaf[NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas)];
>  
> -/* calculate the number of LBAs that the namespace can accomodate */
> -static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
> -{
> -    return ns->size >> nvme_ns_lbads(ns);
> +    return lbaf.ds;
>  }
>  
> -/* convert an LBA to the equivalent in bytes */
> -static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
> -{
> -    return lba << nvme_ns_lbads(ns);
> -}
> -
> -typedef struct NvmeCtrl NvmeCtrl;
> -
>  static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
>  {
>      return zone->d.zs >> 4;
> @@ -136,31 +113,6 @@ static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
>      zone->d.zs = state << 4;
>  }
>  
> -static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
> -{
> -    return zone->d.zslba + ns->zone_size;
> -}
> -
> -static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
> -{
> -    return zone->d.zslba + zone->d.zcap;
> -}
> -
> -static inline bool nvme_wp_is_valid(NvmeZone *zone)
> -{
> -    uint8_t st = nvme_get_zone_state(zone);
> -
> -    return st != NVME_ZONE_STATE_FULL &&
> -           st != NVME_ZONE_STATE_READ_ONLY &&
> -           st != NVME_ZONE_STATE_OFFLINE;
> -}
> -
> -static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
> -                                             uint32_t zone_idx)
> -{
> -    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
> -}
> -
>  static inline void nvme_aor_inc_open(NvmeNamespace *ns)
>  {
>      assert(ns->nr_open_zones >= 0);
> @@ -203,7 +155,6 @@ void nvme_ns_drain(NvmeNamespace *ns);
>  void nvme_ns_shutdown(NvmeNamespace *ns);
>  void nvme_ns_cleanup(NvmeNamespace *ns);
>  
> -
>  typedef struct NvmeParams {
>      char     *serial;
>      uint32_t num_queues; /* deprecated since 5.1 */
> @@ -237,40 +188,6 @@ typedef struct NvmeRequest {
>      QTAILQ_ENTRY(NvmeRequest)entry;
>  } NvmeRequest;
>  
> -static inline const char *nvme_adm_opc_str(uint8_t opc)
> -{
> -    switch (opc) {
> -    case NVME_ADM_CMD_DELETE_SQ:        return "NVME_ADM_CMD_DELETE_SQ";
> -    case NVME_ADM_CMD_CREATE_SQ:        return "NVME_ADM_CMD_CREATE_SQ";
> -    case NVME_ADM_CMD_GET_LOG_PAGE:     return "NVME_ADM_CMD_GET_LOG_PAGE";
> -    case NVME_ADM_CMD_DELETE_CQ:        return "NVME_ADM_CMD_DELETE_CQ";
> -    case NVME_ADM_CMD_CREATE_CQ:        return "NVME_ADM_CMD_CREATE_CQ";
> -    case NVME_ADM_CMD_IDENTIFY:         return "NVME_ADM_CMD_IDENTIFY";
> -    case NVME_ADM_CMD_ABORT:            return "NVME_ADM_CMD_ABORT";
> -    case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
> -    case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
> -    case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
> -    default:                            return "NVME_ADM_CMD_UNKNOWN";
> -    }
> -}
> -
> -static inline const char *nvme_io_opc_str(uint8_t opc)
> -{
> -    switch (opc) {
> -    case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
> -    case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
> -    case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
> -    case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
> -    case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
> -    case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
> -    case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
> -    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
> -    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
> -    case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
> -    default:                        return "NVME_NVM_CMD_UNKNOWN";
> -    }
> -}
> -
>  typedef struct NvmeSQueue {
>      struct NvmeCtrl *ctrl;
>      uint16_t    sqid;
> @@ -379,29 +296,6 @@ typedef struct NvmeCtrl {
>      NvmeFeatureVal  features;
>  } NvmeCtrl;
>  
> -static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
> -{
> -    if (!nsid || nsid > n->num_namespaces) {
> -        return NULL;
> -    }
> -
> -    return n->namespaces[nsid - 1];
> -}
> -
> -static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> -{
> -    NvmeSQueue *sq = req->sq;
> -    NvmeCtrl *n = sq->ctrl;
> -
> -    return n->cq[sq->cqid];
> -}
> -
> -static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
> -{
> -    NvmeSQueue *sq = req->sq;
> -    return sq->ctrl;
> -}
> -
>  int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
>  
>  #endif /* HW_NVME_H */
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 262c20c1cba7..c245339be9da 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -204,6 +204,40 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
>  
>  static void nvme_process_sq(void *opaque);
>  
> +static inline const char *nvme_adm_opc_str(uint8_t opc)
> +{
> +    switch (opc) {
> +    case NVME_ADM_CMD_DELETE_SQ:        return "NVME_ADM_CMD_DELETE_SQ";
> +    case NVME_ADM_CMD_CREATE_SQ:        return "NVME_ADM_CMD_CREATE_SQ";
> +    case NVME_ADM_CMD_GET_LOG_PAGE:     return "NVME_ADM_CMD_GET_LOG_PAGE";
> +    case NVME_ADM_CMD_DELETE_CQ:        return "NVME_ADM_CMD_DELETE_CQ";
> +    case NVME_ADM_CMD_CREATE_CQ:        return "NVME_ADM_CMD_CREATE_CQ";
> +    case NVME_ADM_CMD_IDENTIFY:         return "NVME_ADM_CMD_IDENTIFY";
> +    case NVME_ADM_CMD_ABORT:            return "NVME_ADM_CMD_ABORT";
> +    case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
> +    case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
> +    case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
> +    default:                            return "NVME_ADM_CMD_UNKNOWN";
> +    }
> +}
> +
> +static inline const char *nvme_io_opc_str(uint8_t opc)
> +{
> +    switch (opc) {
> +    case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
> +    case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
> +    case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
> +    case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
> +    case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
> +    case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
> +    case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
> +    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
> +    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
> +    case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
> +    default:                        return "NVME_NVM_CMD_UNKNOWN";
> +    }
> +}
> +
>  static uint16_t nvme_cid(NvmeRequest *req)
>  {
>      if (!req) {
> @@ -213,11 +247,65 @@ static uint16_t nvme_cid(NvmeRequest *req)
>      return le16_to_cpu(req->cqe.cid);
>  }
>  
> +static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> +{
> +    NvmeSQueue *sq = req->sq;
> +    NvmeCtrl *n = sq->ctrl;
> +
> +    return n->cq[sq->cqid];
> +}
> +
> +static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
> +{
> +    NvmeSQueue *sq = req->sq;
> +    return sq->ctrl;
> +}
> +
>  static uint16_t nvme_sqid(NvmeRequest *req)
>  {
>      return le16_to_cpu(req->sq->sqid);
>  }
>  
> +static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
> +{
> +    if (!nsid || nsid > n->num_namespaces) {
> +        return NULL;
> +    }
> +
> +    return n->namespaces[nsid - 1];
> +}
> +
> +/* convert an LBA to the equivalent in bytes */
> +static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
> +{
> +    return lba << nvme_ns_lbads(ns);
> +}
> +
> +static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
> +{
> +    return zone->d.zslba + ns->zone_size;
> +}
> +
> +static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
> +{
> +    return zone->d.zslba + zone->d.zcap;
> +}
> +
> +static inline bool nvme_wp_is_valid(NvmeZone *zone)
> +{
> +    uint8_t st = nvme_get_zone_state(zone);
> +
> +    return st != NVME_ZONE_STATE_FULL &&
> +           st != NVME_ZONE_STATE_READ_ONLY &&
> +           st != NVME_ZONE_STATE_OFFLINE;
> +}
> +
> +static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
> +                                             uint32_t zone_idx)
> +{
> +    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
> +}
> +
>  static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
>                                     NvmeZoneState state)
>  {
> @@ -2487,7 +2575,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
>      uint32_t zone_idx, zra, zrasf, partial;
>      uint64_t max_zones, nr_zones = 0;
>      uint16_t status;
> -    uint64_t slba, capacity = nvme_ns_nlbas(ns);
> +    uint64_t slba, capacity = le64_to_cpu(ns->id_ns.nsze);
>      NvmeZoneDescr *z;
>      NvmeZone *zone;
>      NvmeZoneReportHeader *header;
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index a7d55d71d9de..d0810523172c 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -31,6 +31,11 @@
>  
>  #define MIN_DISCARD_GRANULARITY (4 * KiB)
>  
> +static inline bool nvme_ns_shared(NvmeNamespace *ns)
> +{
> +    return !!ns->subsys;
> +}
> +
>  static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>  {
>      BlockDriverInfo bdi;
> @@ -42,7 +47,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>  
>      id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
>  
> -    id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
> +    id_ns->nsze = cpu_to_le64(ns->size >> nvme_ns_lbads(ns));
>  
>      ns->csi = NVME_CSI_NVM;
>  
> -- 
> 2.30.0
> 
> 

