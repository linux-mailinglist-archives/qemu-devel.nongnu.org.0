Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01445B652
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:12:44 +0100 (CET)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnOV-0002kE-BW
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:12:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mpnGh-0005ZE-Ag; Wed, 24 Nov 2021 03:04:39 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:38729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mpnGf-0002KM-9Y; Wed, 24 Nov 2021 03:04:39 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id F135A2B011E9;
 Wed, 24 Nov 2021 03:04:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 24 Nov 2021 03:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZRO8gwKQUIOT14RHnV20+Bp8XsL
 uGHA4Ui08gxXxrYA=; b=TbGrb8wkP+kVBnGWQMOFcRvKMlSBKT0wpImrlfvupQY
 yDdwjqeo0hqXk1ZNZDfhG2F+EnURrN8tJ9ZJCu1D+Vdmo5AhyyWLgJAd68AqPis9
 2ut/Gj7Eo5iDJOmda7i9cdqCm3fpRh8iXuClK8yV3kYgS9YwWLKngx5gVx6YTXi3
 vBTDONMX8ddbGH20TTodvz7YUIQintsHOaifoimsB2/OiX9J7b92p1C1dwV0Kl2s
 XSJwby4OicCDYUn8TwvTRYTb1AuH1ScP6/vZmNQeHQrsCh75/TFmJDErcm7AhJYH
 gMx0D/0l3KjKZMSweqeYiqgLCswPP+FKV1XZkGwuk3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZRO8gw
 KQUIOT14RHnV20+Bp8XsLuGHA4Ui08gxXxrYA=; b=J/8NzllZ/1ELiyBsZBoDAw
 We7RZLBsJp7/BxTwo4VHipgiLBk+gnzO3h5pYyJHpN4E4sOLHJ35W0yW5QpDj8jV
 D/1O8hffq/A9f06zu4Tmx2uG+7rYxIAHpMIHQwpAhCfPFs+6Q2Xf/I+wLfp1oqWN
 P8+tJ47sErvvpLrJObeVgVV3MCP2UgbLxOX9AWjLo+RD9LjGzNxHFmuPMiTms0rF
 anpr9FRWoRzMutSilgElk5RIkBhPFSp/hsbzUJNhPPUq7vw8u2JhejacpPdV7Wqi
 bkjfchG1aODAXi4VQgoyGHEPU7P3aK/qVnWihBJmnQL1e/nC/32B9EgOQg/hSAoQ
 ==
X-ME-Sender: <xms:EvKdYbHnFD8bpjJ1T5Jwk5nkjgjmkUVmnkZTRMmx1bSn-jIIHARBFg>
 <xme:EvKdYYXIMQE3dZA_H3bRnwYlSurcKOmP0HCsX-FgTNEDW8VFWtfpqQRk7siBmReOE
 9A5gKvwEJRWXdy-kbU>
X-ME-Received: <xmr:EvKdYdI2VmRP8He-v-WonvdLIy-MDyi3fJ_ltT0CqYxpiQPVtxuzfUZbYta_FpAC7YmB7OlWHGb9fzRpczeONDQOYD0oh2s2eUitM_JRRiwmm230GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:EvKdYZFvcRjCGelMQUEMJNi1VRR6967b8QII7GHAv4JEpXfKXqJssw>
 <xmx:EvKdYRWLeCY5YGjmC54utwFidHHOz-pYi-LWGqRuVW3h4-VsbdV-Ow>
 <xmx:EvKdYUOyipwvnvCCSr76qszg4l1GbMtyoKP-fJFozBAy5NF1cb6VdQ>
 <xmx:EvKdYZSWdSLP_Ztm6STYerIin21wv0ttIATt2hxppNxPZVoRSQOOXSsbS4c>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Nov 2021 03:04:32 -0500 (EST)
Date: Wed, 24 Nov 2021 09:04:31 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v2 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <YZ3yD+GDf3SQSE+l@apples.localdomain>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-13-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iC23lBD3fHEIfQIk"
Content-Disposition: inline
In-Reply-To: <20211116153446.317143-13-lukasz.gieryk@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iC23lBD3fHEIfQIk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 16:34, =C5=81ukasz Gieryk wrote:
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
>  hw/nvme/ctrl.c       | 138 ++++++++++++++++++++++++++++++++++++++++---
>  hw/nvme/nvme.h       |   4 ++
>  include/block/nvme.h |   5 ++
>  3 files changed, 140 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index f8f5dfe204..f589ffde59 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6358,13 +6444,40 @@ static void nvme_init_state(NvmeCtrl *n)
>      n->starttime_ms =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>      n->aer_reqs =3D g_new0(NvmeRequest *, n->params.aerl + 1);
> =20
> -    list->numcntl =3D cpu_to_le16(n->params.sriov_max_vfs);
> -    for (i =3D 0; i < n->params.sriov_max_vfs; i++) {
> +    list->numcntl =3D cpu_to_le16(max_vfs);
> +    for (i =3D 0; i < max_vfs; i++) {
>          sctrl =3D &list->sec[i];
>          sctrl->pcid =3D cpu_to_le16(n->cntlid);
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
> +                        cap->vqprt;

That this defaults to VQPRT doesn't seem right. It should default to
VQFRT. Does not make sense to report a maximum number of assignable
flexible resources that are bigger than the number of flexible resources
available.

--iC23lBD3fHEIfQIk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGd8g0ACgkQTeGvMW1P
Denh3Af/U+S2zDjWZPfdfwiMF2HeV1nDoLDqlOZ9jW/cU60OrajSlYIH0PoItVm/
VeDfXIniWO6XoYfdGQUVWABYJonKqU8MJdpNmwH9AdHQRWVfM9SucNLBbcPqnD6A
CMgolmuwuyXGBTSeOfrdX3DPakuTLMPnlvec1WCF3o3cUqFbFSiIxRJQWyPr9SoX
2C83IslAHuyLAYS4vzf4y7pChIXLgUFtIDlh5r9UGw+GNPkKGY/zmzZqdjMIqAYr
RZdaPQULmqzoEojASMrEECHFT5VA9SeKWUtngx6VYpWJCIb405MBhABBBHEDEubR
/rKM44/ix+GBzwyzFZ3W2WPE0mUeUA==
=f7+T
-----END PGP SIGNATURE-----

--iC23lBD3fHEIfQIk--

