Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034B543E01
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:57:43 +0200 (CEST)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2kI-0004U0-E9
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1nz2iL-0001s8-BY
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:55:41 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1nz2iI-0002sT-GO
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:55:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2191432008FE;
 Wed,  8 Jun 2022 16:55:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jun 2022 16:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654721733; x=1654808133; bh=Az
 lAkRwHuwr1F2hdLQAObBq9HfPPcpBAHb4Aa22hTW4=; b=iCJrATgrYKLcKWNLQ0
 NUUqeBEiUr7MK21ylTspeATRMcL1MMkFpNN1au18H+LbhPwlAwjud6sdvTevkn/f
 91fQL60OwiNYNbsH2OXHV4FwB5LS38mw5MppP/k9gQTq5vouIT/5K0gvhxv+WPuu
 vhku15MHSjW3dxezSqcDvoGhbH4X1TYh4wHYK6H+wL2767PGcaGlwAdhQBPARFFa
 3Pinfo+LI6VxdWMP0J0KyyOGyJYBkjOQySX2cGN59HtfBkLSPwIJ3aHN8GDCoc8w
 VBtB3WlWHBhXyYBcZ5iy+Izb8duXx6MbXKjYOanZOovRDmMaWGbKSgcEPele5BqM
 RAsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654721733; x=1654808133; bh=AzlAkRwHuwr1F2hdLQAObBq9HfPP
 cpBAHb4Aa22hTW4=; b=rWt5lvbamCFNLZBNKaKDXr7FxuaIFJOALneQeu1yP76j
 yrJxCNyUszWJV3NnMDBbh//0lU4MA+aFctJ+Gf7OikC6wEw+MR5QmA/YjOmHES0y
 OFoYbbvMT8+tEq0Ju20mRyj3KKT5KZtsGvO+Q3VbLvhoHnw+F0o4syuehjf69qiW
 L8QYRkrKLYwK47vECk+qT73SPDoU4e9cOH8IXoD6HelQX52xzsMKWPSa2rd6dMJN
 slNhQla124hOGUKzOBqiobCWwkHBWUScIIcBCAjjT7KfxFatlQj8qxw1DbvZwc5t
 cVDb48G0E9HhLvY5UJlaI224LVSDRp/ihawWoaZw6w==
X-ME-Sender: <xms:xAyhYirEkCMjLBtsSMNApc7t6DQTk7nL7BiXM1opy1w8fg9049SNiw>
 <xme:xAyhYgpej78egQ-_AKVTv2AfB5KrzRf-Fvcx-fooycvbPBStt3UkhbOdFnhwTX_96
 HMx57Mc51UxH3WKkGA>
X-ME-Received: <xmr:xAyhYnNeILPfwzwn0ryf7eFDNoty1CdAFQPjqfq1tV4SvK21mAJZMcGTX4kOjbp2xoi286FnKiP6dZgsIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtroertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepieevffffhfeludekhefhteeule
 ekffduueeikedtgeethfegfeelieduleevleeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xAyhYh71imqbpkE39qAm3hj-8vkTSWT-Asn_xUxpRymP6xlxkxZ8Rg>
 <xmx:xAyhYh4WT20SdB2QIjMEyk84H-sSGoVE_pN5Ft6F9vL8jdnnsD8cWw>
 <xmx:xAyhYhj7GYFwLLgUOf-4BjdJjJeOuzxePY6uqEmk_0PdvJ0OH8hFgQ>
 <xmx:xQyhYhGJD8diUVUT-YQycREGnRwhgQW9bBChctBxZqU0wR6AVTrBDg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 16:55:31 -0400 (EDT)
Date: Wed, 8 Jun 2022 22:55:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqEMwsclktptJvQI@apples>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8tOy/rAuR8ygVS05"
Content-Disposition: inline
In-Reply-To: <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--8tOy/rAuR8ygVS05
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  8 09:36, Jinhao Fan wrote:
> Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
> and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7.13
> in NVMe Spec 1.3). For queues created before the Doorbell Buffer Config
> command, the nvme_dbbuf_config function tries to associate each existing
> SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
> Queues created after the Doorbell Buffer Config command will have the
> doorbell buffers associated with them when they are initialized.
>=20
> In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
> Doorbell buffer changes instead of wait for doorbell register changes.
> This reduces the number of MMIOs.
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c       | 95 ++++++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/nvme.h       |  8 ++++
>  include/block/nvme.h |  2 +
>  3 files changed, 102 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 03760ddeae..d3f6c432df 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -223,6 +223,7 @@ static const uint32_t nvme_cse_acs[256] =3D {
>      [NVME_ADM_CMD_GET_FEATURES]     =3D NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_ASYNC_EV_REQ]     =3D NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_NS_ATTACHMENT]    =3D NVME_CMD_EFF_CSUPP | NVME_CMD_EF=
F_NIC,
> +    [NVME_ADM_CMD_DBBUF_CONFIG]     =3D NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_FORMAT_NVM]       =3D NVME_CMD_EFF_CSUPP | NVME_CMD_EF=
F_LBCC,
>  };
> =20
> @@ -1304,6 +1305,12 @@ static inline void nvme_blk_write(BlockBackend *bl=
k, int64_t offset,
>      }
>  }
> =20
> +static void nvme_update_cq_head(NvmeCQueue *cq)
> +{
> +    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
> +            sizeof(cq->head));
> +}
> +
>  static void nvme_post_cqes(void *opaque)
>  {
>      NvmeCQueue *cq =3D opaque;
> @@ -1316,6 +1323,10 @@ static void nvme_post_cqes(void *opaque)
>          NvmeSQueue *sq;
>          hwaddr addr;
> =20
> +        if (cq->cqid && n->dbbuf_enabled) {
> +            nvme_update_cq_head(cq);

Shouldn't we update the cq head eventidx here (prior to reading the
doorbell buffer)? Like we do for the sq tail?

> +        }
> +
>          if (nvme_cq_full(cq)) {
>              break;
>          }
> @@ -4237,6 +4248,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeReques=
t *req)
>  static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
>                           uint16_t sqid, uint16_t cqid, uint16_t size)
>  {
> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
>      int i;
>      NvmeCQueue *cq;
> =20
> @@ -4256,6 +4268,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl =
*n, uint64_t dma_addr,
>      }
>      sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
> =20
> +    if (sqid && n->dbbuf_dbs && n->dbbuf_eis) {
> +        sq->db_addr =3D n->dbbuf_dbs + 2 * sqid * stride;
> +        sq->ei_addr =3D n->dbbuf_eis + 2 * sqid * stride;
> +    }
> +
>      assert(n->cq[cqid]);
>      cq =3D n->cq[cqid];
>      QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
> @@ -4599,6 +4616,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *=
n, uint64_t dma_addr,
>                           uint16_t cqid, uint16_t vector, uint16_t size,
>                           uint16_t irq_enabled)
>  {
> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
>      int ret;
> =20
>      if (msix_enabled(&n->parent_obj)) {
> @@ -4615,6 +4633,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl =
*n, uint64_t dma_addr,
>      cq->head =3D cq->tail =3D 0;
>      QTAILQ_INIT(&cq->req_list);
>      QTAILQ_INIT(&cq->sq_list);
> +    if (cqid && n->dbbuf_dbs && n->dbbuf_eis) {
> +        cq->db_addr =3D n->dbbuf_dbs + (2 * cqid + 1) * stride;
> +        cq->ei_addr =3D n->dbbuf_eis + (2 * cqid + 1) * stride;
> +    }
>      n->cq[cqid] =3D cq;
>      cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
>  }
> @@ -5767,6 +5789,43 @@ out:
>      return status;
>  }
> =20
> +static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
> +{
> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
> +    uint64_t dbs_addr =3D le64_to_cpu(req->cmd.dptr.prp1);
> +    uint64_t eis_addr =3D le64_to_cpu(req->cmd.dptr.prp2);
> +    int i;
> +
> +    /* Address should be page aligned */
> +    if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    /* Save shadow buffer base addr for use during queue creation */
> +    n->dbbuf_dbs =3D dbs_addr;
> +    n->dbbuf_eis =3D eis_addr;
> +    n->dbbuf_enabled =3D true;
> +
> +    for (i =3D 1; i < n->params.max_ioqpairs + 1; i++) {
> +        NvmeSQueue *sq =3D n->sq[i];
> +        NvmeCQueue *cq =3D n->cq[i];
> +
> +        if (sq) {
> +            /* Submission queue tail pointer location, 2 * QID * stride =
*/
> +            sq->db_addr =3D dbs_addr + 2 * i * stride;
> +            sq->ei_addr =3D eis_addr + 2 * i * stride;
> +        }
> +
> +        if (cq) {
> +            /* Completion queue head pointer location, (2 * QID + 1) * s=
tride */
> +            cq->db_addr =3D dbs_addr + (2 * i + 1) * stride;
> +            cq->ei_addr =3D eis_addr + (2 * i + 1) * stride;
> +        }
> +    }

Why no love for the admin queue? :)

You are special-casing the admin queue below in process_sq() and
process_db(), as well as above in post_cqes(). As I'm reading the spec,
I do not see why the Admin queue should be treated differently wrt.
doorbell buffer configuration. Could this be a left-over from the
behavior in the original Google extension (prior to going into NVMe)?

I peeked in to the kernel and it looks like it doesnt enable doorbell
buffers for admin queue, only for subsequently created I/O queues.

Keith, is this a bug in the kernel? If the code here would expect the
doorbell buffer to be updated for the admin queue as well, would we
break?

> +
> +    return NVME_SUCCESS;
> +}
> +
>  static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
>  {
>      trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opc=
ode,
> @@ -5809,6 +5868,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeReq=
uest *req)
>          return nvme_aer(n, req);
>      case NVME_ADM_CMD_NS_ATTACHMENT:
>          return nvme_ns_attachment(n, req);
> +    case NVME_ADM_CMD_DBBUF_CONFIG:
> +        return nvme_dbbuf_config(n, req);
>      case NVME_ADM_CMD_FORMAT_NVM:
>          return nvme_format(n, req);
>      default:
> @@ -5818,6 +5879,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRe=
quest *req)
>      return NVME_INVALID_OPCODE | NVME_DNR;
>  }
> =20
> +static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
> +{
> +    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
> +                  sizeof(sq->tail));
> +}
> +
> +static void nvme_update_sq_tail(NvmeSQueue *sq)
> +{
> +    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
> +                 sizeof(sq->tail));
> +}
> +
>  static void nvme_process_sq(void *opaque)
>  {
>      NvmeSQueue *sq =3D opaque;
> @@ -5829,6 +5902,10 @@ static void nvme_process_sq(void *opaque)
>      NvmeCmd cmd;
>      NvmeRequest *req;
> =20
> +    if (sq->sqid && n->dbbuf_enabled) {
> +        nvme_update_sq_tail(sq);
> +    }
> +
>      while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
>          addr =3D sq->dma_addr + sq->head * n->sqe_size;
>          if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
> @@ -5852,6 +5929,11 @@ static void nvme_process_sq(void *opaque)
>              req->status =3D status;
>              nvme_enqueue_req_completion(cq, req);
>          }
> +
> +        if (sq->sqid && n->dbbuf_enabled) {
> +            nvme_update_sq_eventidx(sq);
> +            nvme_update_sq_tail(sq);
> +        }
>      }
>  }
> =20
> @@ -5889,6 +5971,9 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>      n->aer_queued =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
> +    n->dbbuf_dbs =3D 0;
> +    n->dbbuf_eis =3D 0;
> +    n->dbbuf_enabled =3D false;
>  }
> =20
>  static void nvme_ctrl_shutdown(NvmeCtrl *n)
> @@ -6397,7 +6482,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
>          trace_pci_nvme_mmio_doorbell_cq(cq->cqid, new_head);
> =20
>          start_sqs =3D nvme_cq_full(cq) ? 1 : 0;
> -        cq->head =3D new_head;
> +        if (!cq->cqid || !n->dbbuf_enabled) {
> +            cq->head =3D new_head;
> +        }
>          if (start_sqs) {
>              NvmeSQueue *sq;
>              QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
> @@ -6454,7 +6541,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
> =20
>          trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
> =20
> -        sq->tail =3D new_tail;
> +        if (!sq->sqid || !n->dbbuf_enabled) {
> +            sq->tail =3D new_tail;
> +        }
>          timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500=
);
>      }
>  }
> @@ -6733,7 +6822,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
> =20
>      id->mdts =3D n->params.mdts;
>      id->ver =3D cpu_to_le32(NVME_SPEC_VER);
> -    id->oacs =3D cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
> +    id->oacs =3D cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME=
_OACS_DBBUF);
>      id->cntrltype =3D 0x1;
> =20
>      /*
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 6773819325..4452e4b1bf 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -334,6 +334,7 @@ static inline const char *nvme_adm_opc_str(uint8_t op=
c)
>      case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURE=
S";
>      case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_RE=
Q";
>      case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHME=
NT";
> +    case NVME_ADM_CMD_DBBUF_CONFIG:     return "NVME_ADM_CMD_DBBUF_CONFI=
G";
>      case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
>      default:                            return "NVME_ADM_CMD_UNKNOWN";
>      }
> @@ -365,6 +366,8 @@ typedef struct NvmeSQueue {
>      uint32_t    tail;
>      uint32_t    size;
>      uint64_t    dma_addr;
> +    uint64_t    db_addr;
> +    uint64_t    ei_addr;
>      QEMUTimer   *timer;
>      NvmeRequest *io_req;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
> @@ -382,6 +385,8 @@ typedef struct NvmeCQueue {
>      uint32_t    vector;
>      uint32_t    size;
>      uint64_t    dma_addr;
> +    uint64_t    db_addr;
> +    uint64_t    ei_addr;
>      QEMUTimer   *timer;
>      QTAILQ_HEAD(, NvmeSQueue) sq_list;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
> @@ -432,6 +437,9 @@ typedef struct NvmeCtrl {
>      uint64_t    starttime_ms;
>      uint16_t    temperature;
>      uint8_t     smart_critical_warning;
> +    uint64_t    dbbuf_dbs;
> +    uint64_t    dbbuf_eis;
> +    bool        dbbuf_enabled;
> =20
>      struct {
>          MemoryRegion mem;
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 3737351cc8..5b522d7b0e 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -595,6 +595,7 @@ enum NvmeAdminCommands {
>      NVME_ADM_CMD_ACTIVATE_FW    =3D 0x10,
>      NVME_ADM_CMD_DOWNLOAD_FW    =3D 0x11,
>      NVME_ADM_CMD_NS_ATTACHMENT  =3D 0x15,
> +    NVME_ADM_CMD_DBBUF_CONFIG   =3D 0x7c,
>      NVME_ADM_CMD_FORMAT_NVM     =3D 0x80,
>      NVME_ADM_CMD_SECURITY_SEND  =3D 0x81,
>      NVME_ADM_CMD_SECURITY_RECV  =3D 0x82,
> @@ -1134,6 +1135,7 @@ enum NvmeIdCtrlOacs {
>      NVME_OACS_FORMAT    =3D 1 << 1,
>      NVME_OACS_FW        =3D 1 << 2,
>      NVME_OACS_NS_MGMT   =3D 1 << 3,
> +    NVME_OACS_DBBUF     =3D 1 << 8,
>  };
> =20
>  enum NvmeIdCtrlOncs {
> --=20
> 2.25.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--8tOy/rAuR8ygVS05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKhDL0ACgkQTeGvMW1P
DelC3gf/cMbEJTjTyx3sqhrDfFvO5TBWVST/DFRpfnM9UkBCn8dbRfxlnIso/6fe
MVQu9BVszkSlzmOfWGqcgBA2j5pjLXkqBT6iw+jHfGB356XstCxtR5XtOvLpMzHq
LU4N0YEU0LjnKXteNywxdah3zIFzJIdzi0FEr0jof44/D4pCyr5shC6kGXOLCZU/
Jcv4Yr8VxYhJWDuzv93BsuIASp0ZlYTDDR+1Ut37sTTdrAc3z1mXD+JN4qiSCr/S
+SxNdCxMfPjsmgBFdYVz2Hd622huX73XHVWLBjhECJDT5En4LsqQLOJMn+5hVtaD
FOJqO5EgI5Nn5+3ocXZuWsCm2x7dXA==
=vm7i
-----END PGP SIGNATURE-----

--8tOy/rAuR8ygVS05--

