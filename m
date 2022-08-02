Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7665876F7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:07:45 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIl4B-0001LE-FX
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oIkzZ-0006xK-50; Tue, 02 Aug 2022 02:02:57 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oIkzW-0002Rm-Bc; Tue, 02 Aug 2022 02:02:56 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A0F92320093A;
 Tue,  2 Aug 2022 02:02:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 02 Aug 2022 02:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1659420170; x=1659506570; bh=iL
 z3GJYCd6otPgWo5rfYKuV/bxdWsgiNu9BdwUE2XhI=; b=0gfEYM0QE3IBvrjYnN
 BC0BhkLvGaw71orRHcyA97m0DeDYZEJp5HsH2WIwmogBovRKZH/y/2W31YzwAVOw
 UXk3qPmELrjhTi7K1V0R62maciuwmaGEI6VGt4bDQrlbZyf9eGA1g1eW0YyfNG03
 sTM0/YkvClQ44bvTnQVDD29t/EZjOIDOOCjO5bu6MhMY8mfMT68NE2OzyEJXqely
 pq1InoIBuch7NWU2U8ljL5bMytowHOGHhWrN9kcs0umr5dz5Jw13yzndSSrWkASh
 rrfoOmCEYdGDrbTwL1fJK74xw6uHv9M3v0CxVE/LzWROjpd8NkISh2NxBvXuL3Pm
 qOlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659420170; x=1659506570; bh=iLz3GJYCd6otPgWo5rfYKuV/bxdW
 sgiNu9BdwUE2XhI=; b=BvbGwa6r6xcGhL4DctBETTEuseTsxL0j2T8Eee/XA7H0
 7yupJig3GAFCC25l5lINEoGsN+brUDutdoWZjhww+jBzYqH58Tax37AXQW2QkTZg
 VneWqJD/pR1Srq6udUYaQzfQuqqIyPH5uzGGlufyZnZQmXfOG0woDd0JeyWV5Bl6
 dGJ9PBd++aOHpHPOJH9Yq1/t+57TLE4pUmYxKKSp1/QzVgj+m5G6aYpyv1mo4nwI
 SYJHcsxk5bvzGTA2HfJRI+RQoI7yX+5pZWQWeZ//FxnzpY5WcrhfePtvfOcdVYyA
 j5++XU0jSVcgCwUcrlQTYCCwYCzumZW27yHSyfMfoQ==
X-ME-Sender: <xms:Cb7oYhu_1uyrd-5umpD0q0uAcWkF-6pvpiTHNAcqyr63RA2i5RDpMQ>
 <xme:Cb7oYqe8-6UegaVevf4gEBA7qJqbWfxVUZ-VDOCdCohHH2CNwS5gBXi-Oi9B1G60y
 AjGY5gyGg6Gf1ihhb0>
X-ME-Received: <xmr:Cb7oYky1AYvwbsDvhUoYVgPHeot8UN6m9lruxgCBy0P_jV_h-NIykJAooWrNN_rRXMequBlXiiVJv7APJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvgedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Cb7oYoPljwdqwUvG3B86oONuT_maOjoUxiruOXMRxjBjIwZJK6v_IA>
 <xmx:Cb7oYh8vgOtheRvy5ykizysM7okXkAXFJGx6miuyOz46fa4zMvUe3Q>
 <xmx:Cb7oYoWGZENfo959KY-q4XXUDvnB8kuVDLSZi-ZZYGuhjFFHCrhrhg>
 <xmx:Cr7oYsZXYxFmpEx2-y9SHtUtarvfIZCio6E1cJqhA40Q6XdPvnnncQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 02:02:48 -0400 (EDT)
Date: Tue, 2 Aug 2022 08:02:47 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH] hw/nvme: Add helper functions for qid-db conversion
Message-ID: <Yui+B7yEikNGACgq@apples>
References: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AEsRw0Rq3h3A/EwN"
Content-Disposition: inline
In-Reply-To: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--AEsRw0Rq3h3A/EwN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 28 16:07, Jinhao Fan wrote:
> With the introduction of shadow doorbell and ioeventfd, we need to do
> frequent conversion between qid and its doorbell offset. The original
> hard-coded calculation is confusing and error-prone. Add several helper
> functions to do this task.
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 61 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 533ad14e7a..6116c0e660 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqi=
d)
>  {
>      return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? 0 : -1;
>  }
> +static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return (offset / stride) & 1;
> +}

This can be changed morphed into `(offset >> (2 + dstrd)) & 1` if I am not
mistaken.


> +
> +static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr offset)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return offset / (2 * stride);
> +}

Same, should be able to do `offset >> (2 * dstrd + 1)`, no?

> +
> +static inline hwaddr nvme_cqid_to_db_offset(NvmeCtrl *n, uint16_t cqid)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return stride * (cqid * 2 + 1);
> +}
> +
> +static inline hwaddr nvme_sqid_to_db_offset(NvmeCtrl *n, uint16_t sqid)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return stride * sqid * 2;
> +}
> =20
>  static void nvme_inc_cq_tail(NvmeCQueue *cq)
>  {
> @@ -4256,7 +4279,7 @@ static void nvme_cq_notifier(EventNotifier *e)
>  static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
>  {
>      NvmeCtrl *n =3D cq->ctrl;
> -    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> +    uint16_t offset =3D nvme_cqid_to_db_offset(n, cq->cqid);
>      int ret;
> =20
>      ret =3D event_notifier_init(&cq->notifier, 0);
> @@ -4283,7 +4306,7 @@ static void nvme_sq_notifier(EventNotifier *e)
>  static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
>  {
>      NvmeCtrl *n =3D sq->ctrl;
> -    uint16_t offset =3D sq->sqid << 3;
> +    uint16_t offset =3D nvme_sqid_to_db_offset(n, sq->sqid);
>      int ret;
> =20
>      ret =3D event_notifier_init(&sq->notifier, 0);
> @@ -4300,7 +4323,7 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
> =20
>  static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>  {
> -    uint16_t offset =3D sq->sqid << 3;
> +    uint16_t offset =3D nvme_sqid_to_db_offset(n, sq->sqid);
> =20
>      n->sq[sq->sqid] =3D NULL;
>      timer_free(sq->timer);
> @@ -4379,8 +4402,8 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *=
n, uint64_t dma_addr,
>      sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
> =20
>      if (n->dbbuf_enabled) {
> -        sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
> -        sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> +        sq->db_addr =3D n->dbbuf_dbs + nvme_sqid_to_db_offset(n, sqid);
> +        sq->ei_addr =3D n->dbbuf_eis + nvme_sqid_to_db_offset(n, sqid);
> =20
>          if (n->params.ioeventfd && sq->sqid !=3D 0) {
>              if (!nvme_init_sq_ioeventfd(sq)) {
> @@ -4690,8 +4713,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeReque=
st *req)
> =20
>  static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
>  {
> -    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> -
> +    uint16_t offset =3D nvme_cqid_to_db_offset(n, cq->cqid);
> +   =20
>      n->cq[cq->cqid] =3D NULL;
>      timer_free(cq->timer);
>      if (cq->ioeventfd_enabled) {
> @@ -4755,8 +4778,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *=
n, uint64_t dma_addr,
>      QTAILQ_INIT(&cq->req_list);
>      QTAILQ_INIT(&cq->sq_list);
>      if (n->dbbuf_enabled) {
> -        cq->db_addr =3D n->dbbuf_dbs + (cqid << 3) + (1 << 2);
> -        cq->ei_addr =3D n->dbbuf_eis + (cqid << 3) + (1 << 2);
> +        cq->db_addr =3D n->dbbuf_dbs + nvme_cqid_to_db_offset(n, cqid);
> +        cq->ei_addr =3D n->dbbuf_eis + nvme_cqid_to_db_offset(n, cqid);
> =20
>          if (n->params.ioeventfd && cqid !=3D 0) {
>              if (!nvme_init_cq_ioeventfd(cq)) {
> @@ -6128,13 +6151,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, con=
st NvmeRequest *req)
>          NvmeCQueue *cq =3D n->cq[i];
> =20
>          if (sq) {
> -            /*
> -             * CAP.DSTRD is 0, so offset of ith sq db_addr is (i<<3)
> -             * nvme_process_db() uses this hard-coded way to calculate
> -             * doorbell offsets. Be consistent with that here.
> -             */
> -            sq->db_addr =3D dbs_addr + (i << 3);
> -            sq->ei_addr =3D eis_addr + (i << 3);
> +            sq->db_addr =3D dbs_addr + nvme_sqid_to_db_offset(n, i);
> +            sq->ei_addr =3D eis_addr + nvme_sqid_to_db_offset(n, i);
>              pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
>                      sizeof(sq->tail));
> =20
> @@ -6146,9 +6164,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, cons=
t NvmeRequest *req)
>          }
> =20
>          if (cq) {
> -            /* CAP.DSTRD is 0, so offset of ith cq db_addr is (i<<3)+(1<=
<2) */
> -            cq->db_addr =3D dbs_addr + (i << 3) + (1 << 2);
> -            cq->ei_addr =3D eis_addr + (i << 3) + (1 << 2);
> +            cq->db_addr =3D dbs_addr + nvme_cqid_to_db_offset(n, i);
> +            cq->ei_addr =3D eis_addr + nvme_cqid_to_db_offset(n, i);
>              pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
>                      sizeof(cq->head));
> =20
> @@ -6843,14 +6860,14 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr a=
ddr, int val)
>          return;
>      }
> =20
> -    if (((addr - 0x1000) >> 2) & 1) {
> +    if (nvme_db_offset_is_cq(n, addr - 0x1000)) {
>          /* Completion queue doorbell write */
> =20
>          uint16_t new_head =3D val & 0xffff;
>          int start_sqs;
>          NvmeCQueue *cq;
> =20
> -        qid =3D (addr - (0x1000 + (1 << 2))) >> 3;
> +        qid =3D nvme_db_offset_to_qid(n, addr - 0x1000);
>          if (unlikely(nvme_check_cqid(n, qid))) {
>              NVME_GUEST_ERR(pci_nvme_ub_db_wr_invalid_cq,
>                             "completion queue doorbell write"
> @@ -6925,7 +6942,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
>          uint16_t new_tail =3D val & 0xffff;
>          NvmeSQueue *sq;
> =20
> -        qid =3D (addr - 0x1000) >> 3;
> +        qid =3D nvme_db_offset_to_qid(n, addr - 0x1000);
>          if (unlikely(nvme_check_sqid(n, qid))) {
>              NVME_GUEST_ERR(pci_nvme_ub_db_wr_invalid_sq,
>                             "submission queue doorbell write"
> --=20
> 2.25.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--AEsRw0Rq3h3A/EwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLovgUACgkQTeGvMW1P
Dem1TggAoViS5Rt+koIN/P4qqrBkFi0vcTqGCeCtiSE5f5EUyQJ91oiGW44H3oCt
LX6PiPfov/SPGlMoMvdpTuusTvwIm7keYVAtbOd49e13TP0nhqa+6ZRNIPGUn1Om
FbfPKx8A5DJ9MVStoPhMhc8iuHz/Fo+A0aZT3abvxHxxDCZRcRHOu4leApnTY7C/
gcqN4suMgl43gWAmb0+Ro+iXbWSX0IAbWSqJCOpi+Z3eVTJdd9Y/DE69L/HCxLq7
mcCoKzg4LWpchZA7V17Mhon330Fzfh2JH4YIvoBkFVRP0QqVweX8zwZ0Inbslc6Y
8LD76GxdjDAxplWt9lAfvcDysR/0Cg==
=y+Po
-----END PGP SIGNATURE-----

--AEsRw0Rq3h3A/EwN--

