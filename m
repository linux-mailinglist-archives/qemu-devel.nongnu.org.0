Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DA306647
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:36:03 +0100 (CET)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sTq-0006Kv-E5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4sOE-0003xZ-Az; Wed, 27 Jan 2021 16:30:14 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4sOB-0001Jo-O3; Wed, 27 Jan 2021 16:30:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 98CDDAD2;
 Wed, 27 Jan 2021 16:30:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Jan 2021 16:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=C36+krC8zUhtq3EMW+pTnqYOhx/
 nC/RSUAPZP7gNJJI=; b=0BMvSL7f+Csp3NkN+FrBuxvKcLSROu4GvOh/quzJy4o
 Qv8HVBIMKPyGL/GheQ6zdO5KFlyLa2QOusmyKfs15WukWbZPBgNfo/J7rDO7dLps
 cLViFQ9LMo4NuP5zHCC8CCoOHydSBmpMDpq7mbSlnuL9qj7mMuObGeAc1oRuU6bb
 rCBU75l1vIqx4uLmfNeiBu6oGnrUQH0I3ikhZlLL52+38VzqZw2zC/OowI0YS5PP
 fCLqqwda2LbU6MIl1HNRJMqaMUO0ixFP0cfThQZvAJlZ+KKY50ZGR6qT92lKI01Q
 WpI+WKpSeU6LL+FCY6eoaHp47hG6cpH2AnOt6VU7WVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C36+kr
 C8zUhtq3EMW+pTnqYOhx/nC/RSUAPZP7gNJJI=; b=UZrrDkD120WotMiijicAwK
 30/BhGzz5KGNN2qDrE5JhPv18Ajz3Os+0cdPMui0lvySfEA2L6kLtl18rvZF58Sr
 qT0TI6rwyZ/y4UC/6crro6YChcQooKBhi+km25sP5ANqi2kidaUJImBPZzgPd2zZ
 O6lxwTmjUSrl521heWo8aBSbq+tco/JnC3ksbMrgS4lndCu3j7k9D8Nol9EzX0OV
 uZiVDv/9FPLGDeId8T2hsulGca+N778HNFLTLUhm2LAba7m7wapQpsTg/QWHRDCJ
 eIeUowhHw9B31P4WJm4+iV1DL4pPmq0YBQMdWhDTyOaxC8jvuEPbIGdApfmKDKjQ
 ==
X-ME-Sender: <xms:XtsRYM1NAQMureshb0y7m7rxTQC4wRlvhfC2swJjO4dvM6fH0FHKwg>
 <xme:XtsRYAsBBc7xbTvtBx33gwqzzktI4XSJMsu6wxo0g7yKupQI8Fy7wFxSxCchQvs0S
 3soulv5Z6C422p8TMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XtsRYE5LB2nINvDN1lCV10raXmODv1AxPlVsVKj4ZY_HlVVU91__Tw>
 <xmx:XtsRYJIsKYqsHYjdL4npox_a12NWiB531jLfj3qk6OCu8ZWFGUhCoA>
 <xmx:XtsRYM6p9Wz8bWhU2_4qBgDOW4Q3VmejiuvPM1bmuj2hbYIhQfgGbw>
 <xmx:YNsRYJwGUeyA6Pq3Za5zfnZXEwEmq10GUP1zHHTG_W7jqXFVgJ1B8w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7912E240068;
 Wed, 27 Jan 2021 16:30:05 -0500 (EST)
Date: Wed, 27 Jan 2021 22:30:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] block/nvme: Properly display doorbell stride length
 in trace event
Message-ID: <YBHbWX0EuIXOsqyN@apples.localdomain>
References: <20210127212137.3482291-1-philmd@redhat.com>
 <20210127212137.3482291-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Jyqk9fn1QEt31gEX"
Content-Disposition: inline
In-Reply-To: <20210127212137.3482291-2-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Jyqk9fn1QEt31gEX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 27 22:21, Philippe Mathieu-Daud=C3=A9 wrote:
> Commit 15b2260bef3 ("block/nvme: Trace controller capabilities")
> misunderstood the doorbell stride value from the datasheet, use
> the correct one. The 'doorbell_scale' variable used few lines
> later is correct.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>  block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/nvme.c b/block/nvme.c
> index 5a6fbacf4a5..80c4318d8fc 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -745,7 +745,7 @@ static int nvme_init(BlockDriverState *bs, const char=
 *device, int namespace,
>      trace_nvme_controller_capability("Contiguous Queues Required",
>                                       NVME_CAP_CQR(cap));
>      trace_nvme_controller_capability("Doorbell Stride",
> -                                     2 << (2 + NVME_CAP_DSTRD(cap)));
> +                                     1 << (2 + NVME_CAP_DSTRD(cap)));
>      trace_nvme_controller_capability("Subsystem Reset Supported",
>                                       NVME_CAP_NSSRS(cap));
>      trace_nvme_controller_capability("Memory Page Size Minimum",
> --=20
> 2.26.2
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--Jyqk9fn1QEt31gEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAR21cACgkQTeGvMW1P
DekX+AgAw/DjZ0yDmgZPxKdCg9Ppog/Ap5RiJNJDsJsEyNGhvNqIGpZiXa8MBPrm
cvkuQnuopO4ypsollKAsKrskYahiRyImwDyYzi5E0u8icKfKg9gWN4Jel6nCN10n
6RTbEWHNuqq2phzsWq/Jcb/km4KfrMo2heg69eSowMPlU5J6wbtNogUbNw1K/kkw
XacisPYYZKlBl6iVKP1WVDzxOyx6V1/mPKv0fPR1g75mfOncJ+tIgZahwgvPvrex
e64Yia7SvAgiBil6MPbfItCaewFDyimQFelSM6XEz3fC33kRe40qMFOMaoYNv+CM
CP+TShM4/z/QmQQ9hALD0bHZvIh71Q==
=cLVw
-----END PGP SIGNATURE-----

--Jyqk9fn1QEt31gEX--

