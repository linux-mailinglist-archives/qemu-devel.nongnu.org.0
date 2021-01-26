Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E430378D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:59:30 +0100 (CET)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4JG4-000268-UF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4JB9-0000qA-S1; Tue, 26 Jan 2021 02:54:23 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:45591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4JB8-0005WT-9M; Tue, 26 Jan 2021 02:54:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4162D58091B;
 Tue, 26 Jan 2021 02:54:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 02:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QHuznZ4V+FX6D8wl6UGoSIeehe/
 FkTl82oa3K7R+E7A=; b=s/hVbl//NoEhIMu+qUYtRJV4MkyoFEAd/md+UhaUyAx
 CxMwFkuwLlFcHpgF6RsQTGwTcIHAOnJuh/aoMC4ENzKxZ+2E12YVnAVlbFWuEo7y
 7KB5at/J8dawqgPlpPrgckmTAMuYt8dTuxmWNmMClqFibly6zOq57grDwRAm2I5+
 87kecu8s5YgAejqOYhMMrfJ0j+LWoTVI55qfYF2dIgYP4WTriDjAuCYeMrj/fAK+
 enXDeIwAAGZZHLYz9+/uUntP2JkA5JoGK2SwkPePYUe1pyVgoU/fN5rcZLZavquG
 mqPRaoPO4/NSQaw3H8uB2QxXxN+4h0fkPcCz3LJq2Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QHuznZ
 4V+FX6D8wl6UGoSIeehe/FkTl82oa3K7R+E7A=; b=RzA+VgORj95LtxwhW+/1Aw
 ecyVI53WHO2YcA4fCjUhyBI4LQWA7m57XgueZiiCQCxpBjpMgDf8rkLgAM2xf4G1
 0jULtkScWDq5zqM4FZxMo4UAGGDK7Fg3VILHe03LtblfVvzmoqNr2loQFIKP/RGV
 eg217XSNBAceaIvBkbLd4h9DFlQgWXja9RfvmVdarL5AXIQ+4PzmZt+rLXKplQrd
 5NVuywkm5jxWbld2XiHm5uNzKYF34MSnZxagvHTPpPoou7R0X/JoO1zeG6whHLaj
 +Z5ZxT5ErlsDxY30XDrIEpyi//um6H0TqFM2oIdtr5wCVdiyLOlmVZtGKKFvuh0w
 ==
X-ME-Sender: <xms:rMoPYPSVtvI0nshXfoU4m-judZ54eLLAtjGcP9lZh0i5Ol0CR5f_uA>
 <xme:rMoPYAwtXX-Ugp2tIVX81zqsuYA0geBWvHJ7rczZ4U932Vp8PuFgq7vmY9AR8-6TB
 -zok5KA8ebtC9PWfPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rMoPYE1OldcUalUcO7_XIfoQBwGVaBZlHSiSGSZBUKxuCLxcdrCSlg>
 <xmx:rMoPYPDwyiif2WDCfed4TxMO66nM9aQqXGorXgzewfB3C0O88lmpsQ>
 <xmx:rMoPYIj6YyzC4WCuN-lTPuX6F4vW-ErgNI8nAFRnSOtcLZRvA_6_-Q>
 <xmx:rcoPYBVkGHo3qEVCZUuYf6s1cf87Oii29pwcpjT-Vd_DzN3QEXHTDw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27CDF24005E;
 Tue, 26 Jan 2021 02:54:19 -0500 (EST)
Date: Tue, 26 Jan 2021 08:54:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH 2/3] hw/block/nvme: Check zone state before checking
 boundaries
Message-ID: <YA/KqWVPA0hUmP4B@apples.localdomain>
References: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
 <20210126050248.9077-3-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ygY5rFnQi1zcnbUe"
Content-Disposition: inline
In-Reply-To: <20210126050248.9077-3-dmitry.fomichev@wdc.com>
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


--ygY5rFnQi1zcnbUe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 14:02, Dmitry Fomichev wrote:
> The code in nvme_check_zone_write() first checks for zone boundary
> condition violation and only after that it proceeds to verify that the
> zone state is suitable the write to happen. This is not consistent with
> nvme_check_zone_read() flow - in that function, zone state is checked
> before making any boundary checks. Besides, checking that ZSLBA + NLB
> does not cross the write boundary is now redundant for Zone Append and
> only needs to be done for writes.
>=20
> Move the check in the code to be performed for Write and Write Zeroes
> commands only and to occur after zone state checks.
>=20
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 67538010ef..b712634c27 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1138,13 +1138,8 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n,=
 NvmeNamespace *ns,
>      uint64_t bndry =3D nvme_zone_wr_boundary(zone);
>      uint16_t status;
> =20
> -    if (unlikely(slba + nlb > bndry)) {
> -        status =3D NVME_ZONE_BOUNDARY_ERROR;
> -    } else {
> -        status =3D nvme_check_zone_state_for_write(zone);
> -    }

Alright. The double check on boundary that I pointed out in the previous
patch is fixed here.

> -
> -    if (status !=3D NVME_SUCCESS) {
> +    status =3D nvme_check_zone_state_for_write(zone);
> +    if (status) {
>          trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
>      } else {
>          assert(nvme_wp_is_valid(zone));
> @@ -1158,10 +1153,14 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n=
, NvmeNamespace *ns,
>                  trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
>                  status =3D NVME_INVALID_FIELD;
>              }
> -        } else if (unlikely(slba !=3D zone->w_ptr)) {
> -            trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
> -                                               zone->w_ptr);
> -            status =3D NVME_ZONE_INVALID_WRITE;
> +        } else {
> +            if (unlikely(slba !=3D zone->w_ptr)) {
> +                trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
> +                                                   zone->w_ptr);
> +                status =3D NVME_ZONE_INVALID_WRITE;
> +            } else if (unlikely(slba + nlb > bndry)) {
> +                status =3D NVME_ZONE_BOUNDARY_ERROR;
> +            }
>          }
>      }
> =20
> --=20
> 2.28.0
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--ygY5rFnQi1zcnbUe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPyqgACgkQTeGvMW1P
DenOaQgAvrYJ6V8o2Gt6yCWA+iy6X6bYzBUYm5h46jsO3ljhwcgx5jJjW5bKg1VQ
rPR5CiyqD6O1HxsPrS9v+b6iSEFKe+2dM4TQDwYJOmcGSy3o8fEOsmwxkc+oNill
slDRgqHT0vroNrNKVIS0r6bQmXKvpZnaeHaB8GP/gFpZvzfxpvIs91M/c88YEY5x
voa04q/6gpmJm52WHQR56aeyHJg/vZiQZwyNlLq9vEgGNWX4eh/ijnBS7khoxoTg
8Ie7S9oZQPrUWL9zkcfn58HGYjB0riHBPD/dDOyUkp4Zy51tWGpDNzFDjxLVAZS3
44sFJoPJFO1LX7TA3JJfZgMpec13mg==
=juRK
-----END PGP SIGNATURE-----

--ygY5rFnQi1zcnbUe--

