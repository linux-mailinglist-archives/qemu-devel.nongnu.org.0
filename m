Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2115820E5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:17:08 +0200 (CEST)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbI3-0000PM-1p
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGbBS-0002kJ-47; Wed, 27 Jul 2022 03:10:19 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGbBM-0006gg-VW; Wed, 27 Jul 2022 03:10:17 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 142725C0130;
 Wed, 27 Jul 2022 03:10:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 27 Jul 2022 03:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658905807; x=1658992207; bh=Rx
 lixG1AtGyMh/hHOvTNvVPNFIlXmkz9ksvJB0I0IR4=; b=CS78AgWG3L32a/vw1j
 3lrkw8S02yf5H0BuQViWGv0LHNdRLigYLpXwNGio+bSuAzl4Js5dZI4EZSlwH8om
 wBypOWDcYwNO0+Dq1PnltzC8I5kVtOy4cSk2J1xwumudykqEJai/djtlhXP+53rU
 9IX9/EOBv68BVw3/VVqr0hvpr04pZ65bzqmq2b+mCoBTqF5MSvGBuBqNpkf/K68Z
 VBJX+T2L36qCg4FWgUHk9MjvbDDKhxevbIdzPBikdpSrd5cgWZq5K9cHIymsWAQQ
 b3RaPUzoyIFYT5lyhCfuPGQSuptc6V0awZ7CZwesot4IEUqyiZ8NboAJC9kxplUe
 J+rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658905807; x=1658992207; bh=RxlixG1AtGyMh/hHOvTNvVPNFIlX
 mkz9ksvJB0I0IR4=; b=EjhrsxX00fWFx86KZyFtey6TsA8ei5cPomvDZHglL1bB
 BgfOEMudQ1FyLbWoyTOj+fWQFMgk4upd04FRTM+k5vmVMbpqVLNFshSk1Md2vksq
 /kDheIsmJ4DIMdET2lLgylaJZVs6xfURQJb4GtE6Urk4VmSUHZDuY2aVhog5nfG3
 NGOzXuwqh2xjtfP5TDqGU13+90rZvdFtI2QHmS2mXScAacK0CiNeywcC50vG8Bsj
 k4WJsCo+3Svw7iPB6FoS3BIK5eYmaXVKEyYE9FIUpZez5//iFo3ii1U9JuXCJQ/0
 crfFrJQ9ReTV/9eGHCbnoCkHRrt3edzWlTDmuHTz4g==
X-ME-Sender: <xms:zuTgYhpwpAbPamigVOCfEQN_ze0jRS2tFKtANQm5BS1OMjiI2vfN2g>
 <xme:zuTgYjozqbxbLFQD_o27NP15GzBJIvk-qpGsYh_WplAzSZFxeJX-xnSuzl4NlxW7f
 FGOOgfsyysCxV2n0Mc>
X-ME-Received: <xmr:zuTgYuND6dSeuiIIkx74zZCK1fpisFsziZVPTQYjHwQ0DvAbqW0ri8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduuddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zuTgYs5Fd-53ePA23KpAKMgE7Ut6Wg_q8zoE41OAIvi47fmgcxUVbA>
 <xmx:zuTgYg6Rq-tiGUFqPSw_5Jt4MN_xInXqpVwQNpUQtQmK97uB8eezfw>
 <xmx:zuTgYkjzLdorxgJhZuhk_4a37gu3EmJOYmjE6GUsD-e9ddv6f1RpsA>
 <xmx:z-TgYr3deKHrUnPJab2bhbyDBbQyuStAbC2mHwdeai6CA-ftq68DOA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 03:10:05 -0400 (EDT)
Date: Wed, 27 Jul 2022 09:10:04 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: add trace events for ioeventfd
Message-ID: <YuDkzPthO4UQUHXO@apples>
References: <20220714053444.883737-1-its@irrelevant.dk>
 <2CA55856-E1CE-40C1-98E3-C68E11A8D149@ict.ac.cn>
 <62B418AB-DCB3-4219-BA63-4E7207C252F7@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bFo/1j3D/Fhu46zd"
Content-Disposition: inline
In-Reply-To: <62B418AB-DCB3-4219-BA63-4E7207C252F7@ict.ac.cn>
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


--bFo/1j3D/Fhu46zd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 20 10:47, Jinhao Fan wrote:
> at 10:41 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
>=20
> > at 1:34 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> >> From: Klaus Jensen <k.jensen@samsung.com>
> >>=20
> >> While testing Jinhaos ioeventfd patch I found it useful with a couple =
of
> >> additional trace events since we no longer see the mmio events.
> >>=20
> >> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> >> ---
> >> hw/nvme/ctrl.c       | 8 ++++++++
> >> hw/nvme/trace-events | 4 ++++
> >> 2 files changed, 12 insertions(+)
> >>=20
> >> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> >> index 533ad14e7a61..09725ec49c5d 100644
> >> --- a/hw/nvme/ctrl.c
> >> +++ b/hw/nvme/ctrl.c
> >> @@ -1346,6 +1346,8 @@ static void nvme_post_cqes(void *opaque)
> >>    bool pending =3D cq->head !=3D cq->tail;
> >>    int ret;
> >>=20
> >> +    trace_pci_nvme_post_cqes(cq->cqid);
> >> +
> >>    QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
> >>        NvmeSQueue *sq;
> >>        hwaddr addr;
> >> @@ -4238,6 +4240,8 @@ static void nvme_cq_notifier(EventNotifier *e)
> >>    NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
> >>    NvmeCtrl *n =3D cq->ctrl;
> >>=20
> >> +    trace_pci_nvme_cq_notify(cq->cqid);
> >> +
> >>    event_notifier_test_and_clear(&cq->notifier);
> >>=20
> >>    nvme_update_cq_head(cq);
> >> @@ -4275,6 +4279,8 @@ static void nvme_sq_notifier(EventNotifier *e)
> >> {
> >>    NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
> >>=20
> >> +    trace_pci_nvme_sq_notify(sq->sqid);
> >> +
> >>    event_notifier_test_and_clear(&sq->notifier);
> >>=20
> >>    nvme_process_sq(sq);
> >> @@ -6240,6 +6246,8 @@ static void nvme_process_sq(void *opaque)
> >>    NvmeCtrl *n =3D sq->ctrl;
> >>    NvmeCQueue *cq =3D n->cq[sq->cqid];
> >>=20
> >> +    trace_pci_nvme_process_sq(sq->sqid);
> >> +
> >>    uint16_t status;
> >>    hwaddr addr;
> >>    NvmeCmd cmd;
> >> diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
> >> index fccb79f48973..45dd708bd2fa 100644
> >> --- a/hw/nvme/trace-events
> >> +++ b/hw/nvme/trace-events
> >> @@ -104,6 +104,10 @@ pci_nvme_mmio_shutdown_set(void) "shutdown bit se=
t"
> >> pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
> >> pci_nvme_shadow_doorbell_cq(uint16_t cqid, uint16_t new_shadow_doorbel=
l) "cqid %"PRIu16" new_shadow_doorbell %"PRIu16""
> >> pci_nvme_shadow_doorbell_sq(uint16_t sqid, uint16_t new_shadow_doorbel=
l) "sqid %"PRIu16" new_shadow_doorbell %"PRIu16""
> >> +pci_nvme_sq_notify(uint16_t sqid) "sqid %"PRIu16""
> >> +pci_nvme_cq_notify(uint16_t cqid) "cqid %"PRIu16""
> >> +pci_nvme_process_sq(uint16_t sqid) "sqid %"PRIu16""
> >> +pci_nvme_post_cqes(uint16_t cqid) "cqid %"PRIu16""
> >> pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zo=
ne, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> >> pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close =
zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> >> pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finis=
h zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> >> --=20
> >> 2.36.1
> >=20
> > I agree on the addition of SQ and CQ notify trace events. But what is t=
he
> > purpose for adding tracepoints for nvme_process_sq and nvme_post_cqes?
>=20
> I realized these two events are useful when debugging iothread support. We
> are processing sqe and cqe=E2=80=99s in a batch in nvme_process_sq and
> nvme_post_cqes. It is important to mark the beginning of the batch.

If you can add your Reviewed-by here, I can queue it up ;)

--bFo/1j3D/Fhu46zd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLg5MsACgkQTeGvMW1P
DekbSQgAqBDOVxivFW4BuMifMU8otWwvqeEkeowTZ0iQXNmwhvtIzOpxhedRGLKn
AFR66ji+D5TbFINzA2/CYEPDZs0ahf7Gl2nr/emItgWrLPpjDNtZOpCZylqwzkKy
Wl2GOo9eiXF0g7P+Y63MHbCF9BVkHfGnghzTgapL165fDXS0K3CnUPa0q3R7iCIv
U+5e1gDJ4oLayJ+CCXLJFqMBEKkniHvLZW6mEP32HmMied1hR26qxmh+PkPWRJmK
Z9A+tO/flUpc/NpxtlNDdZTzSo+pfn75u05DiI7rjHB4D2173d1sZyWoHYUv+Ej8
aknq0WwK7piQRA8KMao8jk6MGoJPQw==
=clAy
-----END PGP SIGNATURE-----

--bFo/1j3D/Fhu46zd--

