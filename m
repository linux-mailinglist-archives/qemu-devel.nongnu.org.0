Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379E4166C4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:33:55 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVPl-0007HM-Bc
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTVIl-0005va-Nk; Thu, 23 Sep 2021 16:26:39 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTVIj-0004Zk-7q; Thu, 23 Sep 2021 16:26:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9912F5C00E4;
 Thu, 23 Sep 2021 16:26:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Sep 2021 16:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WBCS3kByD7Gk09KQgEBH6YNKLLH
 mcsoRe6gxEJuvY34=; b=R/Bp/kxRdmCVMHK31q+jKfDkOvWxMeMMV23XNSDQC49
 5YPHoO9SD+6iSuxxKutf5fV5ghHOCEMtYkWTPqGzIUzaY1q4973VL/7yRwD17K/V
 5MpMZ4VLTp21fIbuAm+nAia4Gc+cMVEKO+yAeH372Q+o7c8MeDaON1C2r1S9NJ5R
 rG9yLAsIhewEctI0wtcP0+UZ0Xq8x16QeGJL+6fcsmRLVj6UvMkdAexDusVyDe3S
 X1galQ2AfIgT17aKkKbk5nXzKPsOBCpSVDZwQUuSANnA9ZKxFWPUAisGyXgYeU+5
 rxqiYhMRDjJp0tXwPx5p45lGhhfcRI5Ut+TIla/wZQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WBCS3k
 ByD7Gk09KQgEBH6YNKLLHmcsoRe6gxEJuvY34=; b=kEPLuLwfh7lZOwDNg/xxg3
 XInzHaZcNJk96CvFGdQ60lalDKVsNzDvIcqcxxMyARE/uQzhkgt3PrTWG6vT8TRD
 Wx+ifEU5OJzB8SBhWOMMBQ8RyajbTzkHVpk7KbqBAg3WWUS2acDLgSDjJYlA77Er
 3UayNgJ/MCpn1F659u/qzzOw0kQ37jHR1DifuFi3ohLGzklBFXZxydPeW9vYiHq5
 utaE3Npsgmcpxp5eNXazF2m0lwCHKSPReRDpECKqvXqDKnSjXZOKXI/Pyg+McW91
 476kz5Td1pioFazn0aOHnsiUpEDItzlhKqGDb+kF7o9muXibas7G6T1z8ecIkYTg
 ==
X-ME-Sender: <xms:--JMYZcC-s76lb9_KCNvLdfUIg3hhUq9RKqwgFYGA3mUCcq9XHayfg>
 <xme:--JMYXPg8FsLKCiYdaoAp6hHCLsV4DCU_R-7Xv-kRjLGWDfafzrJvHxJDsP98M-Ue
 PQ_1lXxZRzgUJboxb4>
X-ME-Received: <xmr:--JMYSg7myoL4It7mhcpQzHxnfSGKqgKLUf0BqCiux6spSzsGckIyck_gGynFgNHWPfwzGirjr2TiEpbf3qdSyCa8j-AxCXg3irHms7zThnigkkUMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:--JMYS-MARlm3DCltxeGvAMFfBbSbf5xFinhFz5DoqPUKd-pMSS51g>
 <xmx:--JMYVuuMkNEQ7NpcWOMUgD9UyJqiFD2hkUg3pFcmfUwLkxJlE3zxw>
 <xmx:--JMYRGbBEzDJ8ZBaVBqcRQohxXcQ3wVYojUYdKFXqex4WbUdXG69g>
 <xmx:--JMYdLxBIewHFZCOR4lFJ-aTc2sFwS7QvYbVnsoPqMW_hszxn3YKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 16:26:34 -0400 (EDT)
Date: Thu, 23 Sep 2021 22:26:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v2] hw/nvme: Return error for fused operations
Message-ID: <YUzi+BzhSx/qLC3p@apples.localdomain>
References: <CGME20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32@eucas1p2.samsung.com>
 <8df37610-0200-d02a-7281-30b22718201d@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aa3vtLw19ZJEKxC/"
Content-Disposition: inline
In-Reply-To: <8df37610-0200-d02a-7281-30b22718201d@samsung.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aa3vtLw19ZJEKxC/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 15 17:43, Pankaj Raghav wrote:
> Currently, FUSED operations are not supported by QEMU. As per the 1.4 SPE=
C,
> controller should abort the command that requested a fused operation with=
=20
> an INVALID FIELD error code if they are not supported.
>=20
> Changes from v1:
> Added FUSE flag check also to the admin cmd processing as the FUSED=20
> operations are mentioned in the general SQE section in the SPEC.=20
>=20
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  hw/nvme/ctrl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index dc0e7b0030..2f247a9275 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -3893,6 +3893,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeReque=
st *req)
>          return ns->status;
>      }
> =20
> +    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
> +        return NVME_INVALID_FIELD;
> +    }
> +
>      req->ns =3D ns;
> =20
>      switch (req->cmd.opcode) {
> @@ -5475,6 +5479,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRe=
quest *req)
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> =20
> +    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
> +        return NVME_INVALID_FIELD;
> +    }
> +
>      switch (req->cmd.opcode) {
>      case NVME_ADM_CMD_DELETE_SQ:
>          return nvme_del_sq(n, req);
> --=20
> 2.25.1

Applied to nvme-next. Thanks!

--aa3vtLw19ZJEKxC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFM4vYACgkQTeGvMW1P
DentWAf9G1vadBOLKmYG+/dSzqyD1ocK7HE6vRgoyxoRKnxFWxAzwdIfKQaMc7Ob
XAnuJ7u7C5FhZdgRsuqq8O63d84smJA8OJvhNHKM7q81Q08SAieU/HDSdTPmG4Mx
cbNv6EKvGO8OMcbvv0kCVa0rt0jlK+vYzirAaDrOPJhNVfGVARNqgY9odjq1YSRd
bvf8dTG0WwdlSHft7HDvflLCg8BJyLGCShOMZzBUS/UMFSam4zazdYOsHm96sEM+
am99wMjhhEmAGFIFfW4y1I4pgsuHbB/ekOxvjRqJ4oT64CMZFoXRSJnRDgoOlfQk
ETc8JxLgal7Wi1pGE4UwXHxfn7tIfw==
=bm3x
-----END PGP SIGNATURE-----

--aa3vtLw19ZJEKxC/--

