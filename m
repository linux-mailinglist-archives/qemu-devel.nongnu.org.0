Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B29E345CB8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:27:05 +0100 (CET)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfBg-0004hL-FJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOf5Y-0000nt-Ks; Tue, 23 Mar 2021 07:20:45 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOf5V-0002CJ-Fc; Tue, 23 Mar 2021 07:20:44 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6B6171311;
 Tue, 23 Mar 2021 07:20:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 23 Mar 2021 07:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jtrI5/11wfYqutLUGIFchFUz2Uz
 3panyhNHKh2EEJLM=; b=V56qWHsdIRfzRxibPenKu9tJg2RPRH+TdDEuyaJ4gJG
 PwNQISpnqRex6vNgqBEKr98cB3CcP4ud7kpRXHT62z3vRS+pWoSjyHz0R7Ut6CCf
 Q3BnhBpZz9r3JPzfnzwDbVQqtU4NnhdxE9vwzaoxR9rvxMUcK7zOF6KW3MT1qFNu
 iacSzxjC00otWVh8BSeYt/yx6tlFmQZY7GCJ8Cwvq+tV1/HcRy+3iukhNqVPM9eI
 P6ycvcOcQhYMnKYB5XA9IcLVfks8lsQqAj0ygnR2p0yX+zEpdZe9f+CiUFYlOKoB
 6b0K7g+DxlsFzLdOLWLketQuDbOyFlNL273lqGQPI5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jtrI5/
 11wfYqutLUGIFchFUz2Uz3panyhNHKh2EEJLM=; b=ASR72rVeUeig1cJ+2lQhkL
 YoMGg+eTr70+pzSMDUxlbfiKAE1HB/yEPK4LLNdzaOCN7uQ6REVD2z7shCj7QJVX
 pXNw3BefCRt8hTtPDHkM8FWjLj2lRMKb0Gw9k7VZP4zYQXpJt/D3hf4k7zJAAKqZ
 MkjN8CIzbH8SczEyARTv2e4zILfUXPcSWDWRAQg7l1hUYqLlvSZ2E2Q6zN5KAjja
 DFfkY5P7Q68sWChJOVQLG4hDvmpTYNn8Hmti3Sr1Mk0oHJbm4/8QVM+DcJmYiDaY
 s6y6l0UOATLRHH4bDYZKz3UsDtjn74QSUyVTeUqDNWFIydZsCPYX/Bywo2sA+4AA
 ==
X-ME-Sender: <xms:A89ZYJ5WBwVIT-eP2qER1dfwjujeV-2HUwyYS7L2eQrJq8UZpp7YyQ>
 <xme:A89ZYG7xj-Fqo8F9KmjEzfzc9Tvt0dselY8oePpVfvh_ItSaZT72GQ5971sXa-quU
 u3f6hJlSEngFCouvTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegiedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:A89ZYAf4-kkFzAw70W6qZAdQxbUT8we-PIbnNdZn-XKKqi4vWtO-jg>
 <xmx:A89ZYCJRCfgC5IGcJJLVfSo8xOOZiJt4aZyTlPn1Fb5oPXvZKwJckg>
 <xmx:A89ZYNLbd36kAPtC5BZzHdSFg0Y81n4ji36o3HUOdWzvFwxJTbheJg>
 <xmx:BM9ZYEXRH6_tL8fPuckgbTLBwRDqWGFyDDJ8MYBp_LHSFFbVZ8YX-g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C2FCB240422;
 Tue, 23 Mar 2021 07:20:34 -0400 (EDT)
Date: Tue, 23 Mar 2021 12:20:32 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: remove description for
 zoned.append_size_limit
Message-ID: <YFnPAKkbw3bkB6n5@apples.localdomain>
References: <20210323111817.115837-1-Niklas.Cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZRsnuRPyYSQR6ckE"
Content-Disposition: inline
In-Reply-To: <20210323111817.115837-1-Niklas.Cassel@wdc.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZRsnuRPyYSQR6ckE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 23 11:18, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
>=20
> The description was originally removed in commit 578d914b263c
> ("hw/block/nvme: align zoned.zasl with mdts") together with the removal
> of the zoned.append_size_limit parameter itself.
>=20
> However, it was (most likely accidentally), re-added in commit
> f7dcd31885cb ("hw/block/nvme: add non-mdts command size limit for verify"=
).
>=20
> Remove the description again, since the parameter it describes,
> zoned.append_size_limit, no longer exists.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/block/nvme.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6842b01ab5..205d3ec944 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -91,14 +91,6 @@
>   *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (=
i.e.
>   *   defaulting to the value of `mdts`).
>   *
> - * - `zoned.append_size_limit`
> - *   The maximum I/O size in bytes that is allowed in Zone Append comman=
d.
> - *   The default is 128KiB. Since internally this this value is maintain=
ed as
> - *   ZASL =3D log2(<maximum append size> / <page size>), some values ass=
igned
> - *   to this property may be rounded down and result in a lower maximum =
ZA
> - *   data size being in effect. By setting this property to 0, users can=
 make
> - *   ZASL to be equal to MDTS. This property only affects zoned namespac=
es.
> - *
>   * nvme namespace device parameters
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   * - `subsys`
> --=20
> 2.30.2

Argh. Thanks Niklas, queing it up for fixes.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--ZRsnuRPyYSQR6ckE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBZzv4ACgkQTeGvMW1P
DenY2gf/fbytTwGo0SWPxOGq0JEl0bs1K/TMJ5HzEFa4Pb5nRb51MnR0gZfB3sov
E2f9AcxkhadnLo/VN7ZC03hQT9nx/KaDdjkpyTQ4UQ9tge1S5xzlXm3ZLIGREQ5T
5X+uE334M6aV4yUS6865ZIAiMniTSJ88POstb0lgqyz5IO/jnKs04F9XncrMzwqO
SAXIUTsgLW34PONs9GtStwBBnZMr1jLVRiUr0UUg7gvi72UOet4/5pSVMm+M9bTo
VmX5nhMAC/Z1PNJzpYJ0m+Myy2RjljB2ghPrvStDqgBJn7sVeIhunpFsPPuimFfD
dAPB76x/OC0FlkQAlJzaNdhwKH/5mw==
=4P12
-----END PGP SIGNATURE-----

--ZRsnuRPyYSQR6ckE--

