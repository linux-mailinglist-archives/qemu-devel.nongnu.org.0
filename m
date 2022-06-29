Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874E560AF2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 22:14:59 +0200 (CEST)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6e5R-0007ob-NP
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 16:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o6e4A-00073m-HL
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:13:38 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:35931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o6e45-0001bh-Bc
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:13:38 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CE5FE320030E;
 Wed, 29 Jun 2022 16:13:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 16:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656533609; x=1656620009; bh=ZN
 KKxDakV89HZYXoaDvph5O1hChBwG0r5m/gH8NgLM8=; b=PXlxjkoEcJoKJjO91s
 wpkG4zSDshTXOw9Np1Gmqf7wP3BbeWEXx/nvzDVJiTIKdBrwVrJvWX8n6a3y5yKe
 vZfnkT1QQCKPSxrxM2g+Yff9vty1pDZxFEXatspSwVv/5F7q06T5BZxvAsrm6kPh
 nyY7QD10XTO5e6ke3nB+ucj2AFSAfISNksig37Ca0/KpGH9GO6jkKIqPtQdmZxwO
 S00OA9WWHYum/dKC7wmiJNpZUXTBcCLFr36QzKNIh/eDmpq+taxN6Lc3gt0VwQym
 eKobgNnHhOz+arkeHnw9n7Nbs6hE5ZfUgnXNkRZNfSQD74r0w+GgQbO1JentC/fw
 VR0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656533609; x=1656620009; bh=ZNKKxDakV89HZYXoaDvph5O1hChB
 wG0r5m/gH8NgLM8=; b=K1YFOsw6Sib+Vqbdj/pgZ7cC3Hsln2V4IZHCf6ktE57w
 i+QPs7RZU65OAEWsK4tx/LysgrMo9NvXa1vkHwj60dWggBm58OjRrqE0zpjql6SB
 3aMnVw9KUVveJqJ5h5OlTwzzDyQZa2VVmoYs2vYawKTCEpxPTqTSbKd9EfiGHwfD
 KsavGczzDBJib/8cNCV/2dS61zrR5pydK6+l6rP0qjRhnYfB7JfqlMeLbymtzuHj
 4m91RSHHl9OalvKoXJXkI8XIEgmFkHvwzpOYyyTVXR7SukNc4Onl+oFrVm+qpgL2
 ngCtjhkB23u+tzK/frxE28tsIPgq+n7dil5B4rI2wA==
X-ME-Sender: <xms:aLK8YpLe6yDIJE-8D-TZTaUmimfSP1UWcLvV3sFVSJBw0azAiZCilQ>
 <xme:aLK8YlIM8wCRcjB33AbOeMDQl1_w_F8bHGRk9S24N0YM6rkujNprcGYajW5RapQLE
 R444Uw-K7iX8pZEzWQ>
X-ME-Received: <xmr:aLK8YhtDhjMTgdfxvTuDQpJGsxgis6_tUwxKIt2SHYFeMXcvLzLjpxF8MHfu3xWnTtN2wJCyzWJIVSl5UlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aLK8YqZAPBw5rO_VB2qkuut0zRQxvzWhpj2K4RQqL-VvA_SvAxmflQ>
 <xmx:aLK8YgZvCPEUgb4C-5plLe0bHogqIV5GID1Q4NF2-IWd8i5ysgr0Mw>
 <xmx:aLK8YuBFxUJPvDdH6CbStQYTz_d3QQ1jN30kkv5YZBLz2klEYz8urQ>
 <xmx:abK8YvkWtNFVzSgvF3ZUfSehLiQPci-CEX6Ly9FrpXxeTFp1RjAimg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 16:13:27 -0400 (EDT)
Date: Wed, 29 Jun 2022 22:13:25 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YryyZUmJbo3eY/pa@apples>
References: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3rOXrNmbPNyq8x/O"
Content-Disposition: inline
In-Reply-To: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
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


--3rOXrNmbPNyq8x/O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 18:48, Jinhao Fan wrote:
> Add property "ioeventfd" which is enabled by default. When this is
> enabled, updates on the doorbell registers will cause KVM to signal
> an event to the QEMU main loop to handle the doorbell updates.
> Therefore, instead of letting the vcpu thread run both guest VM and
> IO emulation, we now use the main loop thread to do IO emulation and
> thus the vcpu thread has more cycles for the guest VM.
>=20
> Since ioeventfd does not tell us the exact value that is written, it is
> only useful when shadow doorbell buffer is enabled, where we check
> for the value in the shadow doorbell buffer when we get the doorbell
> update event.
>=20
> IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)
>=20
> qd           1   4  16  64
> qemu        35 121 176 153
> ioeventfd   41 133 258 313
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h |  5 +++
>  2 files changed, 101 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index c952c34f94..787b89f7d3 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1374,7 +1374,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue=
 *cq, NvmeRequest *req)
> =20
>      QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
>      QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> +
> +    if (req->sq->ioeventfd_enabled) {
> +        /* Post CQE directly since we are in main loop thread */
> +        nvme_post_cqes(cq);
> +    } else {
> +        /* Schedule the timer to post CQE later since we are in vcpu thr=
ead */
> +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500=
);
> +    }
>  }
> =20
>  static void nvme_process_aers(void *opaque)
> @@ -4195,10 +4202,74 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequ=
est *req)
>      return NVME_INVALID_OPCODE | NVME_DNR;
>  }
> =20
> +static void nvme_cq_notifier(EventNotifier *e)
> +{
> +    NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
> +    NvmeCtrl *n =3D cq->ctrl;
> +
> +    event_notifier_test_and_clear(&cq->notifier);
> +
> +    nvme_update_cq_head(cq);
> +
> +    if (cq->tail =3D=3D cq->head) {
> +        if (cq->irq_enabled) {
> +            n->cq_pending--;
> +        }
> +
> +        nvme_irq_deassert(n, cq);
> +    }
> +
> +    nvme_post_cqes(cq);
> +}
> +
> +static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
> +{
> +    NvmeCtrl *n =3D cq->ctrl;
> +    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> +    int ret;
> +
> +    if ((ret =3D event_notifier_init(&cq->notifier, 0))) {
> +        return ret;
> +    }

Dont assign in conditionals and rely on the implicit value. It's too
error prone. Split into

  ret =3D event_notifier_init(&cq->notifier, 0);
  if (ret < 0) {
    return ret;
  }

> +
> +    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
> +    memory_region_add_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &cq->notifie=
r);
> +   =20
> +    return 0;
> +}
> +
> +static void nvme_sq_notifier(EventNotifier *e)
> +{
> +    NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
> +
> +    event_notifier_test_and_clear(&sq->notifier);
> +
> +    nvme_process_sq(sq);
> +}
> +
> +static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
> +{
> +    NvmeCtrl *n =3D sq->ctrl;
> +    uint16_t offset =3D sq->sqid << 3;
> +    int ret;
> +
> +    if ((ret =3D event_notifier_init(&sq->notifier, 0))) {
> +        return ret;
> +    }

Same as above.

> +
> +    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
> +    memory_region_add_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &sq->notifie=
r);
> +
> +    return 0;
> +}
> +
>  static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>  {
>      n->sq[sq->sqid] =3D NULL;
>      timer_free(sq->timer);
> +    event_notifier_cleanup(&sq->notifier);
>      g_free(sq->io_req);
>      if (sq->sqid) {
>          g_free(sq);
> @@ -4250,6 +4321,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *=
n, uint64_t dma_addr,
>                           uint16_t sqid, uint16_t cqid, uint16_t size)
>  {
>      int i;
> +    int ret;
>      NvmeCQueue *cq;
> =20
>      sq->ctrl =3D n;
> @@ -4271,6 +4343,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl =
*n, uint64_t dma_addr,
>      if (n->dbbuf_enabled) {
>          sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
>          sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> +           =20
> +        if (n->params.ioeventfd && sq->sqid !=3D 0) {
> +            ret =3D nvme_init_sq_ioeventfd(sq);
> +            sq->ioeventfd_enabled =3D ret =3D=3D 0;
> +        }

Not using ret for anything really, so

  if (!nvme_init_sq_ioeventfd(sq)) {
    sq->ioeventfd_enabled =3D true;
  }

should do.

>      }
> =20
>      assert(n->cq[cqid]);
> @@ -4577,6 +4654,7 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *=
n)
>  {
>      n->cq[cq->cqid] =3D NULL;
>      timer_free(cq->timer);
> +    event_notifier_cleanup(&cq->notifier);
>      if (msix_enabled(&n->parent_obj)) {
>          msix_vector_unuse(&n->parent_obj, cq->vector);
>      }
> @@ -4635,6 +4713,11 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl =
*n, uint64_t dma_addr,
>      if (n->dbbuf_enabled) {
>          cq->db_addr =3D n->dbbuf_dbs + (cqid << 3) + (1 << 2);
>          cq->ei_addr =3D n->dbbuf_eis + (cqid << 3) + (1 << 2);
> +
> +        if (n->params.ioeventfd && cqid !=3D 0) {
> +            ret =3D nvme_init_cq_ioeventfd(cq);
> +            cq->ioeventfd_enabled =3D ret =3D=3D 0;
> +        }
>      }
>      n->cq[cqid] =3D cq;
>      cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> @@ -5793,6 +5876,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, cons=
t NvmeRequest *req)
>      uint64_t dbs_addr =3D le64_to_cpu(req->cmd.dptr.prp1);
>      uint64_t eis_addr =3D le64_to_cpu(req->cmd.dptr.prp2);
>      int i;
> +    int ret;
> =20
>      /* Address should be page aligned */
>      if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
> @@ -5818,6 +5902,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, con=
st NvmeRequest *req)
>              sq->ei_addr =3D eis_addr + (i << 3);
>              pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
>                      sizeof(sq->tail));
> +           =20
> +            if (n->params.ioeventfd && sq->sqid !=3D 0) {
> +                ret =3D nvme_init_sq_ioeventfd(sq);
> +                sq->ioeventfd_enabled =3D ret =3D=3D 0;
> +            }

Same as above.

>          }
> =20
>          if (cq) {
> @@ -5826,6 +5915,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, con=
st NvmeRequest *req)
>              cq->ei_addr =3D eis_addr + (i << 3) + (1 << 2);
>              pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
>                      sizeof(cq->head));
> +           =20
> +            if (n->params.ioeventfd && cq->cqid !=3D 0) {
> +                ret =3D nvme_init_cq_ioeventfd(cq);
> +                cq->ioeventfd_enabled =3D ret =3D=3D 0;
> +            }
>          }
>      }
> =20
> @@ -7040,6 +7134,7 @@ static Property nvme_props[] =3D {
>      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>      DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>                       params.auto_transition_zones, true),
> +    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 4452e4b1bf..2a9beea0c8 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -369,6 +369,8 @@ typedef struct NvmeSQueue {
>      uint64_t    db_addr;
>      uint64_t    ei_addr;
>      QEMUTimer   *timer;
> +    EventNotifier notifier;
> +    bool        ioeventfd_enabled;
>      NvmeRequest *io_req;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
>      QTAILQ_HEAD(, NvmeRequest) out_req_list;
> @@ -388,6 +390,8 @@ typedef struct NvmeCQueue {
>      uint64_t    db_addr;
>      uint64_t    ei_addr;
>      QEMUTimer   *timer;
> +    EventNotifier notifier;
> +    bool        ioeventfd_enabled;
>      QTAILQ_HEAD(, NvmeSQueue) sq_list;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
>  } NvmeCQueue;
> @@ -410,6 +414,7 @@ typedef struct NvmeParams {
>      uint8_t  zasl;
>      bool     auto_transition_zones;
>      bool     legacy_cmb;
> +    bool     ioeventfd;
>  } NvmeParams;
> =20
>  typedef struct NvmeCtrl {
> --=20
> 2.25.1
>=20

Otherwise, looks good!

--3rOXrNmbPNyq8x/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK8slQACgkQTeGvMW1P
Den9RAf7Bpc4Sz8nFfjicZIZHTOZbIEh0zdwML7poZ6kvoA405S1yK1He1e+Vl0B
qgR/ZxmXXcGW/163XY9uDylmfS70cANceQmmAlnI8DSzglMBqFKpq779WNSnQ9Es
fYkzXfUYjGo/NWvbbxdsbJLFoD2QSyGBo7yoTSikGFjvnY8pP3u/sAheE/uYp3DU
U2kKyQAX6yRxkRtaasQuQ0iwNiQyW3jIPnA78/FQ2oNBsPH9y/H+5scgCi3ApPhL
xEPpcthNZIL1eopuSqvnpOt2fWK4Dl/p6mU+PVuMKCPt2yTNd8mN+8TDwJ72wZrx
kc3oAVJ9JA7AS4WHPTy32a8Lh47wCg==
=QSJI
-----END PGP SIGNATURE-----

--3rOXrNmbPNyq8x/O--

