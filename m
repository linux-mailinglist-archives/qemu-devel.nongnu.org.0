Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837E55BF10
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:27:21 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65cz-0002Eh-Nw
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64EK-0002K4-GH; Tue, 28 Jun 2022 01:57:44 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64EI-0008GY-VW; Tue, 28 Jun 2022 01:57:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E8705C0112;
 Tue, 28 Jun 2022 01:57:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 28 Jun 2022 01:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656395862; x=1656482262; bh=2w
 QX2zr3NnLw5SxN54rouEgeqTPwD7OY/zBUhefF6Xk=; b=eYBJMQ9R4zIuwBZXyS
 oPh/lH37YSh/jJSQrezFnGVUqN6wntgiyMUr9srxZIL7td8wdgzymfvQDFsY5+Yy
 WcFiw3qRznMEHLm6ATh7e4pkw6Kmbizsfeg+5oGxRwErhg5jBhPELfi9LdLHz9Of
 A6tpIv0zvzeTDjhYsZm6Bvpgrp9sjQGzaB0jFDEfmxgkH9M9Ff6ho3ACvXq7f6kL
 k9Y/OSxUjqapJ/cQhSr3jIk2XJoF0T6EW5gdp7gy1TJFwMBwN7li/OAfpIzujD5+
 xJTX7KRazWPaHVueGaYUiHaE2aow67GGdUV/7OcxjSnH9E5O9UGhPXJeWJxUtcWC
 qGYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656395862; x=1656482262; bh=2wQX2zr3NnLw5SxN54rouEgeqTPw
 D7OY/zBUhefF6Xk=; b=V81fpH+YcloTchKloJRq41TYiapXCAZur1LdWDzjuWuV
 3syhEZVeItUOC5e7lvCdIm7/XpUQsTQDzpJjlWJZf+0O7sensUKdnVd4uP9djubM
 mNtT6Dx8QmXiC7QbGIQSVsQirTyJNFlrEDSjO+GMY21yE04TLOj+FYV1P2NLSxHb
 MXKyyqrX4qSnz1YWvjrhSqctNk9bEvA5hEl4acmpyOuKJWSzE/S13F4hUEdqLMYd
 wX+T/1DkNdAcgQTmkxBALHlxWlVkAQ/AO1h6WRxMo0W7c4HWDr6ayuR8XiTp7Ehj
 IX4DxmI0qN3VOlrj3CYKxOaA74YWvDiVd5PadkhHVQ==
X-ME-Sender: <xms:VZi6YsEvNmZbYYShEmiTjE-MmJZG5MSGihnW9siNoWX-7a10d67qJg>
 <xme:VZi6YlXX29_Pp7ATFZAZSxu7xieKO0z9nj586tfFf7VgJl0LPUH8iYr97zRFgBWil
 1wfeKYJ8lJrQZ0AOq0>
X-ME-Received: <xmr:VZi6YmJlzQN29p2s4_Ba5kjwGN3sdMP7fOQ_74Lcr7QTpzQTqmxOhJ_2SSwddcsQerW-i9hfrK_W4nckfTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:VZi6YuGixd7l7SK8Iwhukuae3lMXUA45Jn1Lq4ppozznN46j_7j0VA>
 <xmx:VZi6YiVELOyTQEyHFEq2N5EsX3K9Gq6vobsny46a0esv0o2ESenDdA>
 <xmx:VZi6YhPeFL3-WgGXbZMEFGZgHevsXhv7l3w4LOxGGtyKpc70rgiOtw>
 <xmx:Vpi6Ygx3IhIYN_DL7EpSL2xPI1-0ZrOKN-E4d_HwaWk3s7-baT6s5g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 01:57:40 -0400 (EDT)
Date: Tue, 28 Jun 2022 07:57:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, damien.lemoal@wdc.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] hw/nvme: store a pointer to the NvmeSubsystem in
 the NvmeNamespace
Message-ID: <YrqYUwt3TQVmW+41@apples>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
 <20220627114731.356462-3-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/NeG31/3ZQQ0NDh6"
Content-Disposition: inline
In-Reply-To: <20220627114731.356462-3-niklas.cassel@wdc.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--/NeG31/3ZQQ0NDh6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 13:47, Niklas Cassel wrote:
> Each NvmeNamespace can be used by serveral controllers,
> but a NvmeNamespace can at most belong to a single NvmeSubsystem.
> Store a pointer to the NvmeSubsystem, if the namespace was realized
> with a NvmeSubsystem.
>=20
> This will be used by a follow up patch.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/nvme/ns.c   | 1 +
>  hw/nvme/nvme.h | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 870c3ca1a2..8bee3e8b3b 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -559,6 +559,7 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>          if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
>              return;
>          }
> +        ns->subsys =3D subsys;
>      }
> =20
>      if (nvme_ns_setup(ns, errp)) {
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 0711b9748c..5487e2db40 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -167,6 +167,7 @@ typedef struct NvmeNamespace {
>      int32_t         nr_active_zones;
> =20
>      NvmeNamespaceParams params;
> +    NvmeSubsystem *subsys;
> =20
>      struct {
>          uint32_t err_rec;
> --=20
> 2.36.1
>=20

No problemo.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--/NeG31/3ZQQ0NDh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK6mFEACgkQTeGvMW1P
Delg9Af/d6IEs3rdRgh8is2+hzX951EaAGYrBbimeQMZ5ZrvXTnw8rf3eqnXPa1T
HCy1Zc64C0dtyoCVe8IePyKoZGiWYsCJdk3CPiAS91Z5gH0mAyR2P8ZPFsPW4INi
ZS4AcH90FsNk6Ux9kFXUACbaSWFmGdtJwu8B1oYZGoczChjZ18MN5L+KEYu6KUqp
PXrlF0ZYVoUBSa2EUZ8exCNrn+u1zHOb/VOhNrSPLvSJ1wtOVqJPDgLyyeU29D5a
aZr+9atNxcHdBKQDY8U7KHi7P6h8vG7Eh+GSnE7M+p3gzfKP56JhpDrzaxGnQ4CX
A2CaFZPXHsgmkF5j4yZb8AGZ17k6Aw==
=dfQV
-----END PGP SIGNATURE-----

--/NeG31/3ZQQ0NDh6--

