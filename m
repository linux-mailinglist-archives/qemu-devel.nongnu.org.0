Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F094B1FC2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 08:59:41 +0100 (CET)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIQqB-0001t8-NS
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 02:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQaj-0005VT-V8; Fri, 11 Feb 2022 02:43:41 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nIQah-0007tq-Ry; Fri, 11 Feb 2022 02:43:41 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 78A875C019E;
 Fri, 11 Feb 2022 02:43:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 02:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=eFyWYaFrpXkFDrIpvBz59c4eCLKsfD
 UZgqyMpw1KxHQ=; b=mi7+0f/TpYJTOR/Lj5JSamKzgGeDf0lSFGdlJKXVSXFAYS
 6I4YPjEe3hb07LcU6ztrqLsik3vb25iINSCMtaBoWqMudRUwlRrn8bsDAWAtCpPC
 xO0J8uz9gQJo4+jhKWDlUJHEw1iaxDyKyuTTqCOYbmysW8MksiGQXPC6MOczlw6c
 DJE3JCNlRgEQz5A7bFjExbyL5T39cZbF0i1BwHHlPnxBN/r61zx0YTzUVryj2mbi
 diS9znJ1pv2U6yxQlPgHnq8vLPyWP6NneiZ/lo65UwzvP9o4QYd/HnOiFkGioerg
 pweyMqXwucqkI4dRm0Y/IxWx57xgUr8su5LnddoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eFyWYaFrpXkFDrIpv
 Bz59c4eCLKsfDUZgqyMpw1KxHQ=; b=gKQCiJ4F8q+wkOUxfIrmITq2yhsqtdSmN
 nZQzezdWaSyze73HqLgyQGP29m51ddfvtTlZoBmOPerw27ILxdZLn360g3Lv9jAS
 /9YPRUUtM+BDCekQPS2w2OmHDKCwen8eSblpscPiCUExqFPquQCPocEaphtA+oK2
 Az385mdrf/4s+gNhFOP1lAU+7zRH8V0PJY8fQAqF1+ynJnRzjhMvOqh+MaLqNsDq
 KvYw8helBZxpxZ733S4frMwmHwC4gJ1dZRHtaihMBcIjei8lQHEUmJyFyZlQjHW3
 PQKS060+z1rX2UykHV9kqS6IOOhtynyk4Ua/dV94Lpgubyk+Q5p0g==
X-ME-Sender: <xms:pxMGYv2djfHt6NT2gY8ZetKNyu52_6PMShUO06iVSYsFIsaXy0gT8w>
 <xme:pxMGYuGub2gBhchcubSJj4UOU3vo6RVe2SXwC3SBBJEDxVJii1ij36SXM1l8rCci-
 UjTFfnOaQzrUgHtRCQ>
X-ME-Received: <xmr:pxMGYv7zdxv_5lRrhP2mBVsr03IOSop6L3SPLNSVC1KvqSO4hU06tDd4lSN0UAmFRjPpBLH_gyMHxP3t3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedvgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pxMGYk2DVO7ZnlvkCkMziDZtsRB6y2V0-SvSGaIIwnleszSbZvEAVg>
 <xmx:pxMGYiHaMnV9J_C8QepgU7cqq4GCF5EXShf3fxAMaQP3tms14Huh7Q>
 <xmx:pxMGYl8i88umz131dvAPfN0yQajC50jKRHCotVGxMrYEJDlGK9V1Yw>
 <xmx:pxMGYuiCxn98lFeaijiebnjTtcbRGI27uP_tqXEAR8tEBhxudP81JQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 02:43:34 -0500 (EST)
Date: Fri, 11 Feb 2022 08:43:32 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v4 15/15] hw/nvme: Update the initalization place for the
 AER queue
Message-ID: <YgYTpHuSRZ2RrMTD@apples>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
 <20220126171120.2939152-16-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N9sokxEJR8oKL/cj"
Content-Disposition: inline
In-Reply-To: <20220126171120.2939152-16-lukasz.maniak@linux.intel.com>
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--N9sokxEJR8oKL/cj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 18:11, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> This patch updates the initialization place for the AER queue, so it=E2=
=80=99s
> initialized once, at controller initialization, and not every time
> controller is enabled.
>=20
> While the original version works for a non-SR-IOV device, as it=E2=80=99s=
 hard
> to interact with the controller if it=E2=80=99s not enabled, the multiple
> reinitialization is not necessarily correct.
>=20
> With the SR/IOV feature enabled a segfault can happen: a VF can have its
> controller disabled, while a namespace can still be attached to the
> controller through the parent PF. An event generated in such case ends
> up on an uninitialized queue.
>=20
> While it=E2=80=99s an interesting question whether a VF should support AE=
R in
> the first place, I don=E2=80=99t think it must be answered today.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 624db2f9c6..b2228e960f 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6029,8 +6029,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
> =20
>      nvme_set_timestamp(n, 0ULL);
> =20
> -    QTAILQ_INIT(&n->aer_queue);
> -
>      nvme_select_iocs(n);
> =20
>      return 0;
> @@ -7007,6 +7005,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
>          id->cmic |=3D NVME_CMIC_MULTI_CTRL;
>      }
> =20
> +    QTAILQ_INIT(&n->aer_queue);
> +
>      NVME_CAP_SET_MQES(cap, 0x7ff);
>      NVME_CAP_SET_CQR(cap, 1);
>      NVME_CAP_SET_TO(cap, 0xf);
> --=20
> 2.25.1
>=20

Fix is good, but I think this belongs in nvme_init_state(). Otherwise,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--N9sokxEJR8oKL/cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIGE6IACgkQTeGvMW1P
DenKuQf/fciAsa8AYkLx1Ka72DTFQli/cmY6ZJoMdUyMq6HJCqhOR0tKcWXjHwxG
l1u9Rqc6J8z9DWzMXazi2WUAnH2z1PTPCLmagaEuUQYMpX2cHCs80d5dcmBq5+FQ
3NQAfBs8Iy76UTnD3Q1xGlJiGQdBxK4AzKSmqJ431bimO0b6YHt3CQ5XSTizPaOs
svXGVuOarcaViH1/Zm0FVgUt62zYTSzxe5qzeUj65HiLthfy1HGmY2bC80Xd2+mC
rCePi9haODASRXuzgdX/QstvwxHK5o+CBKqtDX4fTUxqbyCtFrvpNw8wHuElpJMP
xHy2nEZH6NgCG6RTozbi2Q13uiUZFg==
=q7mg
-----END PGP SIGNATURE-----

--N9sokxEJR8oKL/cj--

