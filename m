Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD09615D3F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8eD-00070B-Pa; Wed, 02 Nov 2022 03:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq8e9-0006z7-FC; Wed, 02 Nov 2022 03:58:49 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq8e7-0007jX-5K; Wed, 02 Nov 2022 03:58:49 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 20EA85C00CB;
 Wed,  2 Nov 2022 03:58:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 02 Nov 2022 03:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667375924; x=1667462324; bh=zC
 5BoG3UNxsax2XyfxF5fwUn32wMd0wpJX+Aq0mrli8=; b=E10zVLubdPHyIrSvS2
 emp3fKdnV4p2vsMnU0BucjtSRaOhqhS5X2iDPuZYROsJyJ5d6NNsTFjYY4vNGK1N
 MCvEugHFgTyOBpYUFU8v+WTmD61mqMvmkBdCWA+xhGGEQuv//1VyNZ2f+wK0Wub6
 mQ5jUTY7avBHtfoxS5ers4m72t5MSAjuhrrdJ4pvrO1wWK9PHlweTSiQXqz0s3aT
 O/NcXAnmFHrTeWCIRTlRVqpUDc2O2XwPgavO0564op7B2xXaBMWofLUoPaEqwEeO
 spnB2wBrf8jkglKdiDvMyaltCmLWiW9NTWY3SsQ+YcQ5uDn/BLL/bwDruOJNpooB
 Ix9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667375924; x=1667462324; bh=zC5BoG3UNxsax2XyfxF5fwUn32wM
 d0wpJX+Aq0mrli8=; b=PY8jXi3FW5dF7IW7RtHup17OBOx6AkgiRKWpq//+cSsx
 KFVUThtOwTy/Apx9ZTjXqYN4EL6LeL31AiiGZt6WpFpjziblFMzdh57hltrkAzqw
 NTIltINl1t327bYL54AHzE06OMTgHbPudIqL/9BuvWPhV6LaxQCZjgmJc43CXwiv
 PZTJmJUXrpH/WHI7CVV4y1L4ltNwrDfam8+RbWLJeoqKSy3Zmqlatomqs7zVnIA/
 ckzgxHzNSJ/Nb8OY3mqmkYgYQvqdvrBI2eq46nrnlVIpDXmNN1GXLIEL8/qIkFUQ
 eK3g/zBRB1ki3qQXJQ+TNjqU9sLSzhKo3KwHSL56IQ==
X-ME-Sender: <xms:MyNiY2IsDVHuiNuxws0NUdIwGgKstAC9nh4B2W5vT_lMcYCrM52NjA>
 <xme:MyNiY-INyoYa39saLph2kmJL8zciSfiGvEz1V3Sy0ZYg1-ybGMiKmvj2mhXUbywb4
 Kd_fAUiH9I784XGV94>
X-ME-Received: <xmr:MyNiY2tNOayCRy-mVolwdEA8I6B6aOC46t5d50QWjJH9mW8_-GshOdsT-05UElj3tS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeigdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MyNiY7aEez3HHjZUe-swz2iF0EEJGGeSEX9NJAteYjHWmEpXU4ryNA>
 <xmx:MyNiY9bJ3o467d8KbRzh79MJQwHlb1gm0I3kBXJUT1lXYEOlrI8enQ>
 <xmx:MyNiY3DQYCReT_wRdWg2HLrPEfiScdr5Fz0xJywRsdZD83zfX4iY8A>
 <xmx:NCNiY8UwSbXsCkL_GNYE4FPK_KgzseAar27-nL8q88rnqSkNI28Sbg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 03:58:42 -0400 (EDT)
Date: Wed, 2 Nov 2022 08:58:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>, Jim Harris <james.r.harris@intel.com>
Subject: Re: [PATCH] hw/nvme: set DNR on compare failure
Message-ID: <Y2IjMCxWedlhNhyS@cormorant.local>
References: <20220825053221.130428-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rLOKI1jhtmutiyfj"
Content-Disposition: inline
In-Reply-To: <20220825053221.130428-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--rLOKI1jhtmutiyfj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 07:32, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Even if the host is somehow using compare to do compare-and-write, the
> host should be notified immediately about the compare failure and not
> have to wait for the driver to potentially retry the command.
>=20
> Reported-by: Jim Harris <james.r.harris@intel.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 87aeba056499..299cbb1f2205 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -2242,7 +2242,7 @@ static void nvme_compare_mdata_cb(void *opaque, int=
 ret)
> =20
>          for (bufp =3D buf; mbufp < end; bufp +=3D ns->lbaf.ms, mbufp +=
=3D ns->lbaf.ms) {
>              if (memcmp(bufp + pil, mbufp + pil, ns->lbaf.ms - pil)) {
> -                req->status =3D NVME_CMP_FAILURE;
> +                req->status =3D NVME_CMP_FAILURE | NVME_DNR;
>                  goto out;
>              }
>          }
> @@ -2251,7 +2251,7 @@ static void nvme_compare_mdata_cb(void *opaque, int=
 ret)
>      }
> =20
>      if (memcmp(buf, ctx->mdata.bounce, ctx->mdata.iov.size)) {
> -        req->status =3D NVME_CMP_FAILURE;
> +        req->status =3D NVME_CMP_FAILURE | NVME_DNR;
>          goto out;
>      }
> =20
> @@ -2300,7 +2300,7 @@ static void nvme_compare_data_cb(void *opaque, int =
ret)
>      }
> =20
>      if (memcmp(buf, ctx->data.bounce, ctx->data.iov.size)) {
> -        req->status =3D NVME_CMP_FAILURE;
> +        req->status =3D NVME_CMP_FAILURE | NVME_DNR;
>          goto out;
>      }
> =20
> --=20
> 2.37.2
>=20

Bump :)

--rLOKI1jhtmutiyfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNiIzAACgkQTeGvMW1P
DelPQQf+IbX823YKlXvHZzbl20HrUse3qY31+5oasze8RhGaYJ5xZYCIKvyg4p3K
cW7kDV0jpKORf9hM5gg+5qC1/eTlyC2KWQ82mnaM2K5qKlB01p9b6aZt3uCFVEdw
QgjO9MX4V0O8fCbKiDv44ADJv+nz1pvifSZnECGZb7+c8aLApksDjP0FQGvbkKzD
SclzNRj44qs6FVfrCh9fNo1Pw4rzXSlzYa/+/5RZn9lhr+jmSuFRrITjibr2FwV2
bTC7TLd5nyNV/FnxLPrr0anFUfw4gAeN+8UTQ6zMiHtaRXPN51wXL0OJK7M5x5TU
hzF4cwKguTzOpouxHUszxYkXU8aDng==
=3pu+
-----END PGP SIGNATURE-----

--rLOKI1jhtmutiyfj--

