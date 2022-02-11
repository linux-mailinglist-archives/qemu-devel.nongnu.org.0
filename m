Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954074B2001
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:20:01 +0100 (CET)
Received: from localhost ([::1]:50526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIR9s-0007xQ-DT
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:20:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQfD-0006CZ-Jw; Fri, 11 Feb 2022 02:48:23 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQez-0000bf-0c; Fri, 11 Feb 2022 02:48:18 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 783FC5801CB;
 Fri, 11 Feb 2022 02:48:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 11 Feb 2022 02:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=bdamIv6c0Yr0ELOPmuluJcHTBXEoP1
 Q9cisjutVF6Oo=; b=qVShTmssexBGljmvLjSz/k/zi00FVHbGAL9ZBlgA/JPQS0
 0BeDmrt2osowoJPGQC9efquPCgsTwXoTsrycwkmQbc0+b9kkceXsypWeTA5er/C4
 tHw8VBmvRj1LCa6+PEHZme4YL6Dc4yuCsvYAwS36QcUc11AxE2VzjBAYgznaO5wf
 s2LPdgRkR8SHYFxbXExJVnJncRaB/+RwhoEythw5aLuzi8Ne2nG7gXAa1fnPFCvV
 vaxXQgh4BENchdIH0rpVs7g8jCEzijsFSoTFpheA30MKOiUlnafgZAp8kl0+Y+Ch
 nupQn5+Y6k7ZVv2AhztjwSCDv8SBUxd2vzMqNbYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bdamIv6c0Yr0ELOPm
 uluJcHTBXEoP1Q9cisjutVF6Oo=; b=jW2GZiaLiEp+SfbTtqupgsUG3paNR34oT
 VaC8g5R5MXTPRX52WMK6M//2sxczS5uYl9lzEXkGNnh32mIWPDvlY7ThF4dFDU3R
 gpJgnJH8AzJLYcklrY5XNpYkzi9niU4Ig/df27tI4d2jpjY5TeZPfJdhKovgRcBq
 iBh5N5RFjdEbd7DYeaG6bzIhFEbo1qiNHQ/j8k66ITyc38z0k5mrfXgsAeMj3Mlu
 vLuJRmtkqjSPXARNOIRQv0ldBsqlcGq25wFXvnCk0hwPNtXN2kyP/I0s/QCsVJfT
 1DdBNovxDcWytDZfZ0wmvwlDpkvEmYKwM/cGGbsvFmV/7MX1NydIQ==
X-ME-Sender: <xms:shQGYteZEkaH81XTkIGZO8oqcM3qpgPCm64tBcTUm_FhhXKPqI8_Ng>
 <xme:shQGYrPGTBhL7Sh2znkAtsiOX3q2-yNPEwS2SHIhkS6EUZkpg1Cph2Lg__ZVZm5li
 mgYnpe2Z9iOD7wqf8k>
X-ME-Received: <xmr:shQGYmjEmbHcO4YZgMkFHZUslkld4Xvf0AP0G5EPKKGdoAfpnXht7AQhJVV54uISfuuJkvW0ncEyX5qEIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedvgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:shQGYm98sUnWQtC69vkyBnkkhnkhwC3DDJpVJAknd_bvfuA14BAayg>
 <xmx:shQGYpt59Qp2m6sx6OHeJwjFGm_rPhRQaFJFCPeah0y_76sIuo8IGQ>
 <xmx:shQGYlGlkDs1KV31EVZ83LTbQx6ZgwW181mQXicYleOLCeGgE8ZKWw>
 <xmx:sxQGYvKWajh9K7L4403giJAiSZc4d3HTcOmN1tKgG70sNcSguvSjDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 02:48:01 -0500 (EST)
Date: Fri, 11 Feb 2022 08:47:59 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v4 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <YgYUr+kA5sm/whur@apples>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
 <20220126171120.2939152-13-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yp5wR8pJvuTqaNzb"
Content-Disposition: inline
In-Reply-To: <20220126171120.2939152-13-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Yp5wR8pJvuTqaNzb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 18:11, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> With four new properties:
>  - sriov_v{i,q}_flexible,
>  - sriov_max_v{i,q}_per_vf,
> one can configure the number of available flexible resources, as well as
> the limits. The primary and secondary controller capability structures
> are initialized accordingly.
>=20
> Since the number of available queues (interrupts) now varies between
> VF/PF, BAR size calculation is also adjusted.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c       | 142 ++++++++++++++++++++++++++++++++++++++++---
>  hw/nvme/nvme.h       |   4 ++
>  include/block/nvme.h |   5 ++
>  3 files changed, 144 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index e101cb7d7c..551c8795f2 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6379,14 +6464,41 @@ static void nvme_init_state(NvmeCtrl *n)
>      n->starttime_ms =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>      n->aer_reqs =3D g_new0(NvmeRequest *, n->params.aerl + 1);
> =20
> -    list->numcntl =3D cpu_to_le16(n->params.sriov_max_vfs);
> -    for (i =3D 0; i < n->params.sriov_max_vfs; i++) {
> +    list->numcntl =3D cpu_to_le16(max_vfs);
> +    for (i =3D 0; i < max_vfs; i++) {
>          sctrl =3D &list->sec[i];
>          sctrl->pcid =3D cpu_to_le16(n->cntlid);
>          sctrl->vfn =3D cpu_to_le16(i + 1);
>      }
> =20
>      cap->cntlid =3D cpu_to_le16(n->cntlid);
> +    cap->crt =3D NVME_CRT_VQ | NVME_CRT_VI;
> +
> +    if (pci_is_vf(&n->parent_obj)) {
> +        cap->vqprt =3D cpu_to_le16(1 + n->conf_ioqpairs);
> +    } else {
> +        cap->vqprt =3D cpu_to_le16(1 + n->params.max_ioqpairs -
> +                                 n->params.sriov_vq_flexible);
> +        cap->vqfrt =3D cpu_to_le32(n->params.sriov_vq_flexible);
> +        cap->vqrfap =3D cap->vqfrt;
> +        cap->vqgran =3D cpu_to_le16(NVME_VF_RES_GRANULARITY);
> +        cap->vqfrsm =3D n->params.sriov_max_vq_per_vf ?
> +                        cpu_to_le16(n->params.sriov_max_vq_per_vf) :
> +                        cap->vqfrt / n->params.sriov_max_vfs;

Getting a division by zero on non-sriov enabled controllers here.

> +    }
> +
> +    if (pci_is_vf(&n->parent_obj)) {
> +        cap->viprt =3D cpu_to_le16(n->conf_msix_qsize);
> +    } else {
> +        cap->viprt =3D cpu_to_le16(n->params.msix_qsize -
> +                                 n->params.sriov_vi_flexible);
> +        cap->vifrt =3D cpu_to_le32(n->params.sriov_vi_flexible);
> +        cap->virfap =3D cap->vifrt;
> +        cap->vigran =3D cpu_to_le16(NVME_VF_RES_GRANULARITY);
> +        cap->vifrsm =3D n->params.sriov_max_vi_per_vf ?
> +                        cpu_to_le16(n->params.sriov_max_vi_per_vf) :
> +                        cap->vifrt / n->params.sriov_max_vfs;

Same here.

--Yp5wR8pJvuTqaNzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIGFK0ACgkQTeGvMW1P
DekpxAgAqj1lVCz4T8twE9+TqSZKhaNeFWsO9f/62Q3TwX2CPmdDUpaGVU1KA648
a2BbUFDTCnFwUAaSIWsrtKp8NAHMA7oYGJW8VEjYi4FVYHPIRurfXTLlys5PBIXD
eAqtXQfIhqhp5EwfwDp8kY9a8zgXc88U3CEje66iN+JJX6UGXMsSON4y8or7Dz20
/2l16f/bTfTVhfyB1kh0ym38fUOb/TEfuBShSsBPOP1n+gnQFaroVXRLYaoEIoBf
/Tk3aN4246zRp6tnUvZbt7vd1212pdUp1FhRganAiG6Z1ga/YdJe9Y3x5u3j3Gsn
raJ3ON9YuOe9ZaQ9UspPjQZ04vJJPA==
=n79K
-----END PGP SIGNATURE-----

--Yp5wR8pJvuTqaNzb--

