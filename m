Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B402C4217
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 15:20:21 +0100 (CET)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khvec-0001Bh-RH
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 09:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khvaU-0008Af-Fn; Wed, 25 Nov 2020 09:16:03 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:49363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khvaS-0001Gj-4V; Wed, 25 Nov 2020 09:16:02 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5AC31DD3;
 Wed, 25 Nov 2020 09:15:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 25 Nov 2020 09:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=htAe+SZZaZ8W/qtE4Gtr4UrTtOg
 4Kv+K30N3RDpc9lg=; b=s2TSOHYJXUKbMFMWGlpT6oMLYhRM2YXwSAEmK/P2rJV
 yyc0Z9WE5F7IRPz9eY/1Y8MVYW3Nol62xQwcx87AkX70FEwhNSjbddx14N2saRnF
 n7s1x9ksgmbxMmL9vk/TKfkdiNiPYmvVqu72ETWsec3EFJaG/4XXxCel93fKHPDQ
 3139QW01kAfhPB/en1w7NmUT6k1i0piYzm8C2VPkTuoGIX1HMgEg9Stvj6MOrX9F
 Gbk4s3LpLdB7RjFji/zWX9sbJ4PIeAgQmJINIx/AZxAAxF8rPWC0urvxhH+2ENUM
 xaNyJyX6cxmQ/L7auVqPWKnq1lfxyvRgSp0NtLKK4tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=htAe+S
 ZZaZ8W/qtE4Gtr4UrTtOg4Kv+K30N3RDpc9lg=; b=jl9dOucaRIm9GV3/LsY3qB
 evVoQ9x+Jm8DBGh95vVfBqfJSMizK9e+J7g8BqzqhVM/iFiIELglySBDEoZCD7UO
 CwVDcsaczNMgKL0r59scKaJmRvXie3Hkl7NOipmxgJDqKHpIWTwMkE+a7+ODZrki
 1i6V5Vwn/jcPAqL5nMkQfEg92tSKlT1qL6ENUCeRwpzNBc8f11k3GyvAMQ+UbBgm
 qlhdaGGTzDvGmVuTj9oPWqOqy7Arqu/dkNOUlY/kLSJvchWknD35YmNKTOnN0SYx
 7J1h0xmCb1VpWXyJMl9ltVjRne8iacuFM+5ROr8NKoBl+Wz6QcneeFtJbNFLxPsw
 ==
X-ME-Sender: <xms:Gme-XxbsMsPlF_viNxZHxoj_SvtI2O-NV9CaGnHKex9mT4vLHX-RVg>
 <xme:Gme-X4ZlCN1-WD4bmt2q_ECg8R9gVCmYDBluGLPuZUzq-5pI6CZVNr1_0X0uNjnfg
 5Vm_ja254-O1UBXFoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Gme-Xz_2sWpKH_kSJqmxsGMyBWxcTas-EXz1GcCtQ_endsaqslehJw>
 <xmx:Gme-X_re-TmMI4zi6yftlemEBCqzjHeLtzeXTfnzh5_56zhlWYhWxg>
 <xmx:Gme-X8pQdMQR-YaItnknjRHZqMRPDnl7o1L3eMtFotS3gEnSahNlCg>
 <xmx:Gme-X9eCK9u2bOsCQ3lqG-Lpy91Z4KhBUtNiRPE1CXwD2k8R2lndoQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D138D3280065;
 Wed, 25 Nov 2020 09:15:52 -0500 (EST)
Date: Wed, 25 Nov 2020 15:15:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: add compare command
Message-ID: <X75nFo7LD7Ltb4MF@apples.localdomain>
References: <20201124073714.24458-1-its@irrelevant.dk>
 <20201125141104.bs5fwi7xtyo4nyv7@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ty+wSX1Sbfmfmtu4"
Content-Disposition: inline
In-Reply-To: <20201125141104.bs5fwi7xtyo4nyv7@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--Ty+wSX1Sbfmfmtu4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25 23:11, Minwoo Im wrote:
> Hello,
>=20
> On 20-11-24 08:37:14, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > Add the Compare command.
> >=20
> > This implementation uses a bounce buffer to read in the data from
> > storage and then compare with the host supplied buffer.
> >=20
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > [k.jensen: rebased]
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c       | 100 +++++++++++++++++++++++++++++++++++++++++-
> >  hw/block/trace-events |   2 +
> >  2 files changed, 101 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index f7f888402b06..f88710ca3948 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -999,6 +999,50 @@ static void nvme_aio_discard_cb(void *opaque, int =
ret)
> >      nvme_enqueue_req_completion(nvme_cq(req), req);
> >  }
> > =20
> > +struct nvme_compare_ctx {
> > +    QEMUIOVector iov;
> > +    uint8_t *bounce;
> > +    size_t len;
> > +};
> > +
> > +static void nvme_compare_cb(void *opaque, int ret)
> > +{
> > +    NvmeRequest *req =3D opaque;
> > +    NvmeNamespace *ns =3D req->ns;
> > +    struct nvme_compare_ctx *ctx =3D req->opaque;
> > +    g_autofree uint8_t *buf =3D NULL;
>=20
> nit-picking here: unnecessary initialization to NULL.
>=20

I don't think it is unnecessary when it using g_autofree?

> > +    uint16_t status;
> > +
> > +    trace_pci_nvme_compare_cb(nvme_cid(req));
> > +
> > +    if (!ret) {
> > +        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
> > +    } else {
> > +        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
> > +        nvme_aio_err(req, ret);
> > +        goto out;
> > +    }
> > +
> > +    buf =3D g_malloc(ctx->len);
> > +
> > +    status =3D nvme_dma(nvme_ctrl(req), buf, ctx->len, DMA_DIRECTION_T=
O_DEVICE,
> > +                      req);
> > +    if (status) {
> > +        goto out;
> > +    }
>=20
> Don't we need to give status value to req->status in case of
> (status !=3D 0)?  If we don't give it to req->status, it will complete
> with success status code even it fails during the nvme_dma().
>=20

Nice catch! nvme_aio_err normally takes care of this for blk/aio errors,
but this one slipped. Thanks!

--Ty+wSX1Sbfmfmtu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl++ZxIACgkQTeGvMW1P
DenbuQf/Vv7pB2yWRqdxoipaHjnVE1X82ZDRFyA6ixvyOITHPko1OeAB4lR8Ryol
ELf0+RD+MkeJ21zprcttp1Is4WdKZFFsfwQwmX/3BYCzJLYhkv8LoHlt4LvETJRd
pWFU9IE+L16QvVPMrkAxLCz1zAZluniOWl7demCmW7eSOJ+cF6ggn859OAZ6zptL
/j0ZYFumzRZmIjprEIc38dCJ0EFcnfFbC7gDUs1wpITNP6GlyHIIxEcAXvIbhrgW
JDq0BJPeo3omdkalagkykAh1yrakVq82MVx6Zkxs+GHqqRbY3LsIJiwXHOzC7/wt
ge9HVxaqydhpQtxMcvFM44925zvSUQ==
=AtM6
-----END PGP SIGNATURE-----

--Ty+wSX1Sbfmfmtu4--

