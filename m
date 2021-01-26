Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8929303789
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:57:09 +0100 (CET)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4JDo-0000lV-HH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4J7H-0006u8-B0; Tue, 26 Jan 2021 02:50:23 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4J7E-0004CH-OG; Tue, 26 Jan 2021 02:50:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95ACE580917;
 Tue, 26 Jan 2021 02:50:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 02:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=BRB6hu+G/DOrRW0T9MPflNz2l2d
 YXGMf9KpXR4dTeLM=; b=QO9tJpj5N6vqTEo/IT3xTU+mvN/qAJnwy/p0FvgAzle
 G89zWz/2i+xi9zDKkBaa+PqrXGvquWLbfpV+CuPIhErjkW4Oi1uufeTClKvbLwxB
 YgwT2+JVVJ0eqTGGOz533Jh+sCfHXxXsB5w4C7M9Vww7hqCuqzLHN9Gc1STl+gTk
 IPNekwARdtKs6U/9p9WfRZH4k2NuRnjhydzjiJdEtLLtJ50SnwW+2w8lbqLdaBMd
 R6M1nh8MRNhmRMHOWrRr9r2RNXOuUYHtaquPDs4ZislmKbOZdA05yVwNTPI6P1XN
 7jWAhOMNhY+CrwNywxo8nWASxTxCYM32qxE8A5qYVVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BRB6hu
 +G/DOrRW0T9MPflNz2l2dYXGMf9KpXR4dTeLM=; b=NKzUk02NO90fKPALEY/MzW
 wEbGvlGGHJxK/CJT2PZr+ojdlWd6iy4Y65SiOuu0ie65b998CGxOeDkOE1p4DOUa
 fnAyJ9Lu4owJIJsHbCBBYpTpPaMn92EDtBdGSyxPC2bBDa784OLIkCijGcwVBhSF
 4Mpc5B6gBccaE+nNxTZOkiojzs4Mj8X+CYkv8jKNmhCV6RboB/qwOymoFZOFa+nH
 8yxIhFf+RVi99OM8KjHN02a3RzucWioSUUgGLePJueOrYiIQdIeFHdQmxs7SP+P6
 guAPQshuR3oN5k/xhRnfmOCfjDRtlgKGRwjsADg69onrJ9I6hFc2G/EmBMMKw6hA
 ==
X-ME-Sender: <xms:uMkPYGu1O9ejFOhraOMovNPtW8RRSLXIL49zsym8q4QDZj_ns6j3iw>
 <xme:uMkPYLd8BJqf60QvL9EqG4chMw7DASIf4MblbTRYOUPSq2PH-F3Nd1rxG_KplRtsb
 n6QrMyZPsaBQYK7FP0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uMkPYBzcCT5c6fs48-xmWMliFA4rwknuG0h5axhuMY17As9qpG3BCA>
 <xmx:uMkPYBNMp7x8ecI2QxlLd-wP0KVV2sLULVC9Q_BnCaBGecP2k9jgzQ>
 <xmx:uMkPYG86XHmqTQX8IKL3rE7I0CLUEvnUQkbKOLj689jTvrmAhK2maQ>
 <xmx:uckPYKQDmEgKUr7etDEZIsjFG6O1tJi6_I_IDjhqS_uoIkCqw4JD1w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7BB4F1080063;
 Tue, 26 Jan 2021 02:50:15 -0500 (EST)
Date: Tue, 26 Jan 2021 08:50:13 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH 1/3] hw/block/nvme: Check for zone boundary during append
Message-ID: <YA/JtQ3LfNKAlkhM@apples.localdomain>
References: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
 <20210126050248.9077-2-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5E/MpDSYWHPUNPy4"
Content-Disposition: inline
In-Reply-To: <20210126050248.9077-2-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5E/MpDSYWHPUNPy4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 14:02, Dmitry Fomichev wrote:
> It is observed that with the existing code it is possible to keep
> appending to a zone indefinitely. To fix, add the missing check to
> verify that the zone append is not going to write beyond zone capacity.
>=20
> Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f64676a930..67538010ef 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1135,9 +1135,10 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n,=
 NvmeNamespace *ns,
>                                        NvmeZone *zone, uint64_t slba,
>                                        uint32_t nlb, bool append)
>  {
> +    uint64_t bndry =3D nvme_zone_wr_boundary(zone);
>      uint16_t status;
> =20
> -    if (unlikely((slba + nlb) > nvme_zone_wr_boundary(zone))) {
> +    if (unlikely(slba + nlb > bndry)) {
>          status =3D NVME_ZONE_BOUNDARY_ERROR;
>      } else {
>          status =3D nvme_check_zone_state_for_write(zone);
> @@ -1151,8 +1152,9 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, =
NvmeNamespace *ns,
>              if (unlikely(slba !=3D zone->d.zslba)) {
>                  trace_pci_nvme_err_append_not_at_start(slba, zone->d.zsl=
ba);
>                  status =3D NVME_INVALID_FIELD;
> -            }
> -            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
> +            } else if (unlikely(zone->w_ptr + nlb > bndry)) {
> +                status =3D NVME_ZONE_BOUNDARY_ERROR;

Now, for appends, you are just checking the boundary condition twice.
And the first one will be moot for appends anyway.

> +            } else if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
>                  trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
>                  status =3D NVME_INVALID_FIELD;
>              }
> --=20
> 2.28.0
>=20
>=20

--5E/MpDSYWHPUNPy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPybQACgkQTeGvMW1P
DenqQwgAp1N6jm0Zrq1gYEPbFkcuKvxpLiRkAOIEA0XlUxd8K4WSfqzctRxmd35Y
IlbuYzPYHuNCQterABDGN/Z+h84pEIHXlOGDs/n0QMAM4ys3va6s5mSlOkFBUBZR
K3Yffl8d5+2dDvNEeZc9Y33/EIREAy9kK1DKUynxOfj1eUh5c+7ViCCFvF30lVHd
0lFEcW5Tx8ZOLl3E03wGl5U82CuqkU2Pj7+LFUHAQpD1dsVWOLzidgtGi9+2S9W3
CrAM7EVAVCeh6yV7VejyJGdZlNKxnHv8nKRCekprKxLGL23MlsK8zz38SHgGkPaY
RjEOL/PwAx3v2WH+M0x10Aw/jFd31w==
=W1Mo
-----END PGP SIGNATURE-----

--5E/MpDSYWHPUNPy4--

