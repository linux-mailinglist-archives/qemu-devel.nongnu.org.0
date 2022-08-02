Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ADA587984
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:03:15 +0200 (CEST)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIno2-0006gh-Fw
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oInft-0002dQ-V9; Tue, 02 Aug 2022 04:54:50 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oInfr-0001on-Lk; Tue, 02 Aug 2022 04:54:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 35E05320091B;
 Tue,  2 Aug 2022 04:54:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Aug 2022 04:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1659430484; x=1659516884; bh=jS
 4nlbSn0554gdd+GXhLPrJVuHCgNFgKh57gCZVlCv0=; b=VeYl3FRbs14pGuL1qR
 A6ZeFRv8fx8jrdlubzITU6N3Q/6ad9aJ6WIB8X19XArKXpScGRcn44kdmppYlDsT
 L4dA/BFbqzrhSdhTmOg3nvdIsuUFN3tadD2COMcwSKxLSfh5vAiIEbQ3849fdCM5
 LwuJPAzZqh0ZRn3NDi76o1801wWXsPOX52a3dGNMg0iwFe3twwvRUch0Nd1Yf8o4
 wvvWJjq930CynVhL2CA64nIP339nHemqQVU7AbnJOcXjcb54PbT1sJdjV5SrI2Z0
 O4FCUeDYLf341UQkRPi9fWbhuIWvHJpp/2ZrK8Rm6Sd5lW+vyh+jpBgsOsFd9raV
 Kkzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659430484; x=1659516884; bh=jS4nlbSn0554gdd+GXhLPrJVuHCg
 NFgKh57gCZVlCv0=; b=Vm3kvmHGnieB17IIrEt9LTZLSpUuXfMIrnwMu6RK1wDj
 JbJAIFb+PPnl+IalgNLurF6gZ37s+VuEyqwzn5tUReF+Sf1+4kdMXCnshYQijNt4
 NBRbE/BSWhEakxWfwPglivGTjFoFkPnzUMJcBkb98n6MwVSap5A/YhG44UNC9uxS
 YhQ/6zxu1ZrrPgjr92F18mBsEa9aFm9SMOiDANy1SzjnO7egwDaFB6DFldRJYf5J
 R4N3TPennSXSHsD/i/BgV5cZBYTgJkjOdCyAgPfIavvh9m0HBModPVZaDhDum0Hk
 D0pTwFlGmMOzI9JjDoQ3wjkuc6dx0RWY3RAZeVKGUw==
X-ME-Sender: <xms:VOboYpbh1XuZaqGjUR3WUBCrdivbPaQQyl-pobzAgeuyuSnK5r5pNg>
 <xme:VOboYgbt-zSKHSDziaRkxQmwJC6d6OVKLb7eru7vXMZcDrR81uTdC222p_ubVEtdb
 2Qvdzy2J5-0rsCK5Wg>
X-ME-Received: <xmr:VOboYr-nH5NnC12gSW80UK8T_YbaGoywCFFyV1pok1omHaEv12pjVXmkTp7MvCfHtRiqQJ6jEfhCY0RKhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VOboYnpyJ6B6HrE2qXbSLqOTwenRy4gkwWhkxOBY-wIxNOMYQQjd7w>
 <xmx:VOboYkoeYTL09qHJtPPsqLjrqYR3dVH1hjDUPgCJwVQwMN9io8Qa0g>
 <xmx:VOboYtT9rk3UJFB1cmx3hUBEMKETn5a0mAnDw933iN6_tNmphz_Y3w>
 <xmx:VOboYvXJgfRFlfC33_c0OOHcgXfQW6NuX1FGbMddQ-4swc375Tn0Hw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 04:54:43 -0400 (EDT)
Date: Tue, 2 Aug 2022 10:54:41 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH] hw/nvme: Add helper functions for qid-db conversion
Message-ID: <YujmUfXpFXSO8eU5@apples>
References: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
 <Yui+B7yEikNGACgq@apples>
 <46762954-5440-4C96-B39B-BCAA6C86589C@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gs2N3sg80jBWyesx"
Content-Disposition: inline
In-Reply-To: <46762954-5440-4C96-B39B-BCAA6C86589C@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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


--gs2N3sg80jBWyesx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  2 16:31, Jinhao Fan wrote:
> at 2:02 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > On Jul 28 16:07, Jinhao Fan wrote:
> >> With the introduction of shadow doorbell and ioeventfd, we need to do
> >> frequent conversion between qid and its doorbell offset. The original
> >> hard-coded calculation is confusing and error-prone. Add several helper
> >> functions to do this task.
> >>=20
> >> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> >> ---
> >> hw/nvme/ctrl.c | 61 ++++++++++++++++++++++++++++++++------------------
> >> 1 file changed, 39 insertions(+), 22 deletions(-)
> >>=20
> >> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> >> index 533ad14e7a..6116c0e660 100644
> >> --- a/hw/nvme/ctrl.c
> >> +++ b/hw/nvme/ctrl.c
> >> @@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_t =
cqid)
> >> {
> >>     return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? 0 : =
-1;
> >> }
> >> +static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
> >> +{
> >> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> >> +    return (offset / stride) & 1;
> >> +}
> >=20
> > This can be changed morphed into `(offset >> (2 + dstrd)) & 1` if I am =
not
> > mistaken.
> >=20
>=20
> Yes. But my current code looks more readable to me. Is it necessary to
> change to `(offset >> (2 + dstrd)) & 1`.
>=20

I am unsure if the compiler will transform that division into the shift
if it can infer that the divisor is a power of two (it most likely
will be able to).

But I see no reason to have a potential division here when we can do
without and to me it is just as readable when you know the definition of
DSTRD is `2 ^ (2 + DSTRD)`.

> >> +
> >> +static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr offs=
et)
> >> +{
> >> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> >> +    return offset / (2 * stride);
> >> +}
> >=20
> > Same, should be able to do `offset >> (2 * dstrd + 1)`, no?
>=20
> Same as above.
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--gs2N3sg80jBWyesx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLo5k8ACgkQTeGvMW1P
Denyewf/aLws7MCrbxym4fV60kxSTxzweyd4QRR6pFs/sWBsntxjdcgWYaIkHiPa
pYuVoMjzedND72GG7NsGD01m163cY8Bf/2k1zI7xXMtcPMeT/4R+Z5T0pPJduV/G
4vAAkLFjBFpjKL28c6nYFWYiVvB7CgJIsMGqvy08gB/mxCkX93+6Rq/vLNHBZURo
soFNlkxIgG8pYsiF9i8Iy1TO6PlY1apujsFvIq/g3WMCmUIcVB8hCA3ppdQC+PMk
ypnVziKPQS7Wwg6mXOtRFPOAhbsH/vCAs7Ge00XQZPcV9E06Fvl19ql5SBlKJG0L
1zgNkgiaju1sLzvq39mD0ciYC5fB5A==
=wLyX
-----END PGP SIGNATURE-----

--gs2N3sg80jBWyesx--

