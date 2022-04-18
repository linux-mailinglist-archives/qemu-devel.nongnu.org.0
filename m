Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87955504CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 08:32:32 +0200 (CEST)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngKvr-0000JF-Mq
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 02:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngKdM-0006Rh-6H; Mon, 18 Apr 2022 02:13:12 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:53155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngKdJ-0002JX-DJ; Mon, 18 Apr 2022 02:13:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2CAB432004AE;
 Mon, 18 Apr 2022 02:13:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Apr 2022 02:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650262383; x=1650348783; bh=bl
 54m2RA2au7QfCjBSdOqR1FAl6xmkBZE4mSUaFBUOc=; b=At3GHEQzetXEPa1FwI
 upRRJ3a4i8HqcoRHbadUVJHuaaYsbPxrKm3eT+rHSF7RQJrK/PBJtMGqhVq74Szg
 /lcKHbv2KBCM13+6J9I0Q2exTFlbQorYzyVmvxPhIPqXbG7zmaiTsrjV5qIhe55W
 ViaVBMtEse+r0yh1GgXMPq7CQafiL8cLSbSfC7TMG9ylOHHJBsNuOCM/C4wA/+9d
 L9Lw9dMSTpCbyleGQaI75K8rd+C8ROIhSGGvPMkmo6MukGsKhwlkfTOVf5AFi3EZ
 KBuvRv5JapsOoA8/vqX7bpQm8j1+0x3JM9Ee2uu06QrXjkU1mgeNhVpILeEFbPcK
 0LNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650262383; x=
 1650348783; bh=bl54m2RA2au7QfCjBSdOqR1FAl6xmkBZE4mSUaFBUOc=; b=w
 YPjpf1gKSo5nB3oLCxB2kZ7BkBFULyZf5o6vkBuXL2I/GJYrCyJccShoOXVXtcKT
 P8g1cSKd/esy7/90FdVlbD9y8QEaWSHEslq/QoTqaOnrtsCpRKC/9EoQAIg9W7UK
 pbC6q/LgWpOyIivIqDH3u/QG2GH4JH3Wu1HIEx2pkUlaD0qcKhzMlO5Yy7tOY7oV
 oW1WI+JPdHFb7HGuSoNASO6zL7keTtDen/qx4c3MJH6tB7xf3nGgwHUZdvtdkEvf
 OTW+AlzPPXES8sk7z6DE+aFAgf2ofSdbsV77F+Mj2p7kyEHTe96Vtc1C6mRUoa6l
 5lUY09KC8K2ee8kCtSgvQ==
X-ME-Sender: <xms:bwFdYjy1wjta-hgjvfuxwAMGSGHsmfrK77qpoisvQN4rZYpdRRBiLA>
 <xme:bwFdYrQuAcQ0U8skojZy7AkBz083iTIzZZXDMEg_MfJHi7Sh_mZxAJtFedyQOMTkU
 AbEqd3raXp_oLfLAik>
X-ME-Received: <xmr:bwFdYtXyxqHcx3gA3UJkst2ENQnq1jpIVtPyFMQ-r9ZZwXjVmUQTL-SK7Afn6uHOMsNgsS8eIvifJSMOoJI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bwFdYtguIHecGtZErYe-zW3H2Y0EimA4aaEeNzIDrKMCb4wJZ5252A>
 <xmx:bwFdYlDGLV5j1J8nfVF62xEqtwhDN7IkB-BtlfK8QdnqGxnG2r6NxA>
 <xmx:bwFdYmLsT-yruhtJbriJLvVRXYK1Jmx4ukMnSWL5_YrDBnb6-rnv5w>
 <xmx:bwFdYkO88Acwy2Pf82i53ZIUAFXb4s0l3bbTk_2qOF5cDiesvkoAUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Apr 2022 02:13:02 -0400 (EDT)
Date: Mon, 18 Apr 2022 08:13:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <ddtikhov@gmail.com>
Subject: Re: [PATCH] hw/nvme: fix narrowing conversion
Message-ID: <Yl0BbLGyDrleug/D@apples>
References: <20220412085909.nppz25ifaotottjn@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wF2QjvWr5zFex3I+"
Content-Disposition: inline
In-Reply-To: <20220412085909.nppz25ifaotottjn@localhost.localdomain>
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wF2QjvWr5zFex3I+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 12 11:59, Dmitry Tikhov wrote:
> Since nlbas is of type int, it does not work with large namespace size
> values, e.g., 9 TB size of file backing namespace and 8 byte metadata
> with 4096 bytes lbasz gives negative nlbas value, which is later
> promoted to negative int64_t type value and results in negative
> ns->moff which breaks namespace
>=20
> Signed-off-by: Dmitry Tikhov <ddtikhov@gmail.com>
> ---
>  hw/nvme/ns.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 324f53ea0c..af6504fad2 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -29,7 +29,8 @@ void nvme_ns_init_format(NvmeNamespace *ns)
>  {
>      NvmeIdNs *id_ns =3D &ns->id_ns;
>      BlockDriverInfo bdi;
> -    int npdg, nlbas, ret;
> +    int npdg, ret;
> +    int64_t nlbas;
> =20
>      ns->lbaf =3D id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
>      ns->lbasz =3D 1 << ns->lbaf.ds;
> @@ -42,7 +43,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
>      id_ns->ncap =3D id_ns->nsze;
>      id_ns->nuse =3D id_ns->ncap;
> =20
> -    ns->moff =3D (int64_t)nlbas << ns->lbaf.ds;
> +    ns->moff =3D nlbas << ns->lbaf.ds;
> =20
>      npdg =3D ns->blkconf.discard_granularity / ns->lbasz;
> =20
> --=20
> 2.35.1
>=20

Thanks!

Applied to nvme-next.

--wF2QjvWr5zFex3I+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJdAWoACgkQTeGvMW1P
DelHIwf+IIfqeBz8mc1J2iHR/hJ0qDZ+11CNPxlXmdKZirXf049HUxf4C2zwBXIR
gvdVTHSeUCaD6VPCasKl42kDMgLwtGvqwvxGI0+hSw9IW9VyhnGlp7uMAEzXIxyH
UeOvQ/t/uYxVpZ4WzcMEsV3dxhi+Hq73ROL11ilpYQ74QsCzVkYpJd7QqgJEtllM
yO8FwSkPJycRHJBjkDTP6ahdVi7ohS7iGm3hsDyxGE9pYPnkKxnmVqJ932NVrWZ9
SpTHfqjPob4qwOy9/S8S1mD4EAhrFgfsA2aQvMZxGntYFD7ui7x0gl3rwoh6URKw
kJwCvzjOHELcxRMTs8lVZ5VmUZK7Sw==
=CMmL
-----END PGP SIGNATURE-----

--wF2QjvWr5zFex3I+--

