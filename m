Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB354DFC6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:10:46 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nOf-0007Zp-FL
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1mvC-00077F-Fi
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:40:19 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1mv8-0005pq-Om
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:40:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 73FF85C08F8;
 Thu, 16 Jun 2022 06:40:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Jun 2022 06:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655376011; x=1655462411; bh=PD
 5dJCbkV36b1sYivPRZdud6aVC+TEScyEQx2iRir1s=; b=YypKNubZA5Bgkhc2QO
 xj8pqY+XuGziyIOyi+bMnCNc+vNS4dl7zbkjLfmsotbT33/Jb303sInmL8nkEFFA
 hCJEMw9SPnQetnsZ0ZVl1tglCztrI4vbefwm6NqfhP957tpqPl91KMNLs2YWTHBX
 /gDftP+Omt6inimbOJ/pTGqZZxMj49x1fcasRlbqxc/ju8qYdysnWExmPu7Q1arC
 8VHgaOOTmXOiQm12I8jWqEPYxXd2O5kdvSf1B+c+2qxSxgtW2BJ3k88DHtPhOGZP
 P3X4e8Zebf0UD1/6T1Hygd5AYm3F4eCLEmEBO1TZir1ls9UCKZcdHSVOxZ3Xw8SV
 Fo7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655376011; x=1655462411; bh=PD5dJCbkV36b1sYivPRZdud6aVC+
 TEScyEQx2iRir1s=; b=mIHi+SCUhwC+5tARlrNhw2zNh9gOlCgH2svH+8aZM3Ew
 TDq5um9NaxZxV58HWb6iW8/LKa2td8Sodp/YrDF0Z5yQSvLB3IuqYNUTnh3eFaVf
 zuzhFw+rjv/LfDefdO1LKKk5L/mashQOcpkrT1RnFLzRO0zuBHvP5aFJWoemIfzC
 BtfsLTrVDevyqrD7s8/QKZLHir9inyQU5Lfztzz3pjK6IuIdUxKYnwTQRpfy2vow
 aOnmznx8XlXkF3hkvaTJkipE7UoJ7KowPKlMvFpnDoOqkPqEyL6PpgCzAKloA39+
 6mvRur86FZ6jT/pO0JAmgcEGQDqBM1zqc1Ls3rYx3g==
X-ME-Sender: <xms:igirYna0oMlB4UEzkhd5IUaMv6wZVdl8uWhA0LCHgw8R0uKvHWsGGQ>
 <xme:igirYmb2TDQF2Pp-Cq3wQ9uz-wMyhC-fbZJ96zHq2ZWFY3jefbUD3N67jF6qcOg4e
 vFIuHxwkflR1rkJNxM>
X-ME-Received: <xmr:igirYp_ljPue9JXuDpBMK2AqOOmj_xSW3ATAkC-gbwsqrqjbKfwimqEzU3ZQ2sG4kXKDGmSLiHwE-UyftNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:igirYtoKwobwXyFhC92asHf2Neb9NoTceoratOHa1KdNhqbdRObRvg>
 <xmx:igirYio_mv8HU3CDN7XrgOm3m5mvpFC_Ek15FSRUEOnXumpHjDEsGw>
 <xmx:igirYjQ9C5GRc_bpufDApzwJQc2V3subTce4h_bWTPlUBgKXwqQQxg>
 <xmx:iwirYp1H-rNcBSXbu0FyQSBWF3Ve8yYm_kjFB-1EIWHLrTrXETZvhA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 06:40:09 -0400 (EDT)
Date: Thu, 16 Jun 2022 12:40:07 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v2 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqsIh+OUcWnHU3zp@apples>
References: <20220615144907.3093384-1-fanjinhao21s@ict.ac.cn>
 <20220615144907.3093384-2-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UIGLJjrTZ8nnXgTT"
Content-Disposition: inline
In-Reply-To: <20220615144907.3093384-2-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--UIGLJjrTZ8nnXgTT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 15 22:49, Jinhao Fan wrote:
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
> In nvme_process_db(), update the shadow doorbell buffer value with
> the doorbell register value if it is the admin queue. This is a hack
> since hosts like Linux NVMe driver and SPDK do not use shadow
> doorbell buffer for the admin queue. Copying the doorbell register
> value to the shadow doorbell buffer allows us to support these hosts
> as well as spec-compliant hosts that use shadow doorbell buffer for
> the admin queue.
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c       | 112 ++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h       |   8 ++++
>  include/block/nvme.h |   2 +
>  3 files changed, 121 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 03760ddeae..7be2e43f52 100644
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
> +        }
> +

This wont work for drivers that *do* rely on updating the buffer for
admin queues, so we should read it regardless of the value of the queue
id (since we are now updating it through the "Keith Hack^TM").

>          if (nvme_cq_full(cq)) {
>              break;
>          }
> @@ -4237,6 +4248,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeReques=
t *req)
>  static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
>                           uint16_t sqid, uint16_t cqid, uint16_t size)
>  {
> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);

You need to load the little endian value with ldq_le_p(&n->bar.cap).
Sorry, didn't catch this in v1.

>      int i;
>      NvmeCQueue *cq;
> =20
> @@ -4256,6 +4268,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl =
*n, uint64_t dma_addr,
>      }
>      sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
> =20
> +    if (n->dbbuf_enabled) {
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

Same as above.

>      int ret;
> =20
>      if (msix_enabled(&n->parent_obj)) {
> @@ -4615,6 +4633,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl =
*n, uint64_t dma_addr,
>      cq->head =3D cq->tail =3D 0;
>      QTAILQ_INIT(&cq->req_list);
>      QTAILQ_INIT(&cq->sq_list);
> +    if (n->dbbuf_enabled) {
> +        cq->db_addr =3D n->dbbuf_dbs + (2 * cqid + 1) * stride;
> +        cq->ei_addr =3D n->dbbuf_eis + (2 * cqid + 1) * stride;
> +    }
>      n->cq[cqid] =3D cq;
>      cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
>  }
> @@ -5767,6 +5789,47 @@ out:
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
> +    for (i =3D 0; i < n->params.max_ioqpairs + 1; i++) {
> +        NvmeSQueue *sq =3D n->sq[i];
> +        NvmeCQueue *cq =3D n->cq[i];
> +
> +        if (sq) {
> +            /* Submission queue tail pointer location, 2 * QID * stride =
*/
> +            sq->db_addr =3D dbs_addr + 2 * i * stride;
> +            sq->ei_addr =3D eis_addr + 2 * i * stride;
> +            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
> +                    sizeof(sq->tail));
> +        }
> +
> +        if (cq) {
> +            /* Completion queue head pointer location, (2 * QID + 1) * s=
tride */
> +            cq->db_addr =3D dbs_addr + (2 * i + 1) * stride;
> +            cq->ei_addr =3D eis_addr + (2 * i + 1) * stride;
> +            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
> +                    sizeof(cq->head));
> +        }
> +    }
> +
> +    return NVME_SUCCESS;
> +}
> +
>  static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
>  {
>      trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opc=
ode,
> @@ -5809,6 +5872,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeReq=
uest *req)
>          return nvme_aer(n, req);
>      case NVME_ADM_CMD_NS_ATTACHMENT:
>          return nvme_ns_attachment(n, req);
> +    case NVME_ADM_CMD_DBBUF_CONFIG:
> +        return nvme_dbbuf_config(n, req);
>      case NVME_ADM_CMD_FORMAT_NVM:
>          return nvme_format(n, req);
>      default:
> @@ -5818,6 +5883,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRe=
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
> @@ -5829,6 +5906,10 @@ static void nvme_process_sq(void *opaque)
>      NvmeCmd cmd;
>      NvmeRequest *req;
> =20
> +    if (sq->sqid && n->dbbuf_enabled) {
> +        nvme_update_sq_tail(sq);
> +    }

Remove the check on queue id as above with the completion queue.

> +
>      while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
>          addr =3D sq->dma_addr + sq->head * n->sqe_size;
>          if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
> @@ -5852,6 +5933,11 @@ static void nvme_process_sq(void *opaque)
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
> @@ -5889,6 +5975,9 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>      n->aer_queued =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
> +    n->dbbuf_dbs =3D 0;
> +    n->dbbuf_eis =3D 0;
> +    n->dbbuf_enabled =3D false;
>  }
> =20
>  static void nvme_ctrl_shutdown(NvmeCtrl *n)
> @@ -6398,6 +6487,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr ad=
dr, int val)
> =20
>          start_sqs =3D nvme_cq_full(cq) ? 1 : 0;
>          cq->head =3D new_head;
> +        if (!qid && n->dbbuf_enabled) {
> +            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
> +                          sizeof(cq->head));
> +        }
>          if (start_sqs) {
>              NvmeSQueue *sq;
>              QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
> @@ -6455,6 +6548,23 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr ad=
dr, int val)
>          trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
> =20
>          sq->tail =3D new_tail;
> +        if (!qid && n->dbbuf_enabled) {
> +            /*
> +             * The spec states "the host shall also update the controlle=
r's
> +             * corresponding doorbell property to match the value of tha=
t entry
> +             * in the Shadow Doorbell buffer."
> +             *
> +             * Since this context is currently a VM trap, we can safely =
enforce
> +             * the requirement from the device side in case the host is
> +             * misbehaving.
> +             *
> +             * Note, we shouldn't have to do this, but various drivers
> +             * including ones that run on Linux, are not updating Admin =
Queues,
> +             * so we can't trust reading it for an appropriate sq tail.
> +             */
> +            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
> +                          sizeof(sq->tail));
> +        }
>          timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500=
);
>      }
>  }
> @@ -6733,7 +6843,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
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

--UIGLJjrTZ8nnXgTT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKrCIMACgkQTeGvMW1P
DemOiQgAjeu/9ZQaMZKgdgE9Sn9/yhE6d18LC37Rl1OizMOor9QfxLYwrCwFT2CT
+PmSrX4IQs73sX3nCsCof0B2HboMRv5Mq0WVjA4yxMeOsga8nzrFOnwd5k5uYikJ
rp+OlF6VnC/5CFLGjCFS0+iQkXV65LrpFriMtd2IgtCYujc+DHnTmIXSXCgsv3io
Tt9FnByCOm7LRtTMf4HcbYILg6w+HXKwc28hQ2JxDUvwRDEo5JZE8WQ4Kmv6IMjZ
qyi3FqwdlSH7fSccSc5XeJBZ6CZ9pFKbyRGzjZXeRdVYJyX8qerCWbzk22cPZlC8
HfyF3S/kfY9NEu1gAL2ixkPh7Oo4qQ==
=gLU+
-----END PGP SIGNATURE-----

--UIGLJjrTZ8nnXgTT--

