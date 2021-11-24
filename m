Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5745B664
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:21:34 +0100 (CET)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnX2-0002at-HO
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mpnIV-0007ro-H4; Wed, 24 Nov 2021 03:06:32 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:36419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mpnIT-0002lI-VZ; Wed, 24 Nov 2021 03:06:31 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D1FCB2B011CB;
 Wed, 24 Nov 2021 03:06:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 24 Nov 2021 03:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vUB6TIzG/8D9PmJQvilwp5A74iR
 nACUf1cg4XsZEvgU=; b=MlwYgYSK85zl7hnImSYvLXN/qtDgnzYp3QYzr+vv9rR
 hMhttfNuTyw901iXdqw99Br6kMV1fqY/eRnr9ufLYt7aLDvVki0Jk7UUmB4ylLVx
 OBkLzb5Cm8KlnCU670zTBVO4bIP2H1vuHvvOjAkAkhpHIRTD2J4e+5L3p6ITaV2U
 +dR4m7lyixk8KJEku9WKBio3EDnMJfUGDMFwDe15geN9sfkbrIM+fcXI5mQoLbwQ
 M7xSwOUuD4mVC3LXV4B45meX/qDSlg9SCOtCLIdKLBFGSatxw/uY9k85WMQoeG3A
 HlR+I5WCdKykiYrHXXD+AuB20v4bTN4vWGR0mpL9laQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vUB6TI
 zG/8D9PmJQvilwp5A74iRnACUf1cg4XsZEvgU=; b=YpOqn+ob47gR3Kdd4xqv94
 pyvHxeZwiXGknurz12/hpTOAYPful2rrjstTOHQjpn0EjfCmLddRjJQ/vmjAm2D8
 cwXACB4iPiu4ApA6yp4RbYmijsIsuS6EDwj+WD6441NNp23LMOalRUS8n1Tjvf+m
 PhCAzyiq6hZb7K9ByBAM9zN6lCr53TUF/8M43XC0O1SHQec8H09LqsD8nDLbB4ks
 1nW+ibuf+EnzlMIAxrP001vd/fSv4xLcKnZjjfDfDdcrfFAq5kWD/sH48UVnlICG
 vEb0F3krFZ3jYKMDtHgndcJZy+/F/kCnPV+GQ6qu05ih9O1YmzSkPpDM8um+tGsw
 ==
X-ME-Sender: <xms:gvKdYQPxI10rOb3rBqHotvAdEi6O17hyZ_nweN-4IizxhZw4dCO9ig>
 <xme:gvKdYW9skAO_-Df33sey9TcpaILRp-M8RZbKEUzAqWgHI_8Z6hpI7RkOwuErQcxuz
 Y8SVCiQlLtX49v03F4>
X-ME-Received: <xmr:gvKdYXQ9nnUonXWiVcn1RwOkMNqoqEKPExeguZ-voZQk0jnCKLrSBcPSckS5UtuM5-YWjCEeDhnD_QFsNveu-Py1NTsx7SDr_rq5bO8R_hRt2Lwv4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gvKdYYvOacPx-S3CgzlnoOoyGattX854xJsEdNm3JuQcmslVgVlR3A>
 <xmx:gvKdYYeXBXK2IL4nmVAtLaEw0RMA0cANWmGTS8vZsiIpa6v-tR7wDA>
 <xmx:gvKdYc1q39W5wK3061UJdJaTJZN8ETdTyEwFwAWFzht3ZdJr8V2ETg>
 <xmx:g_KdYQ6oi0XbkTO2cV56kxNYk4PN4oFhZ93Pe19cTi1Rc4e_X2xQ6Ai02zs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Nov 2021 03:06:25 -0500 (EST)
Date: Wed, 24 Nov 2021 09:06:23 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v2 13/15] hw/nvme: Add support for the Virtualization
 Management command
Message-ID: <YZ3yf8RvlZREFF4B@apples.localdomain>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-14-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7JqYoPjSHU6xZEHT"
Content-Disposition: inline
In-Reply-To: <20211116153446.317143-14-lukasz.gieryk@linux.intel.com>
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


--7JqYoPjSHU6xZEHT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 16:34, =C5=81ukasz Gieryk wrote:
> With the new Virtualization Management command one can:
>  - assign flexible resources (queues, interrupts) to primary and
>    secondary controllers,
>  - toggle the online/offline state of given controller.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c       | 204 +++++++++++++++++++++++++++++++++++++++++++
>  hw/nvme/nvme.h       |  16 ++++
>  hw/nvme/trace-events |   3 +
>  include/block/nvme.h |  17 ++++
>  4 files changed, 240 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index f589ffde59..9d0432a2e5 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c

[... snip]

> +static uint16_t nvme_assign_virt_res_to_sec(NvmeCtrl *n, NvmeRequest *re=
q,
> +                                            uint16_t cntlid, uint8_t rt,=
 int nr)
> +{
> +    int limit =3D rt ? n->params.sriov_max_vi_per_vf :
> +                     n->params.sriov_max_vq_per_vf;

If these parameters are left at the default, limit is 0 and the check
below fails.

[... snip]

> +    if (nr > limit) {
> +        return NVME_INVALID_NUM_RESOURCES | NVME_DNR;
> +    }

--7JqYoPjSHU6xZEHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGd8n4ACgkQTeGvMW1P
Dek6iggApoCYa1OT9MKvhfNl1aGKJzZM1dytBFbbWiXb4N4ucYnNDMRc6AF3oXUj
6WvwlI3OuzxQ6Xsjf8kHeLeX6TidC3tJRSqEqmF1q0DJEoROd9gzAOmnHGxt8U5a
VDpL0eeSe7g9rUbtW1wqw+1JPNz1vAYKNZjP1H4KFIBS/uuombsKPqXM9UlN9ALZ
fUEfnTDs3kG9OrHovtBNWC9uKuTs6yNK1m6IgYPUn2OBdBvwMWfZkaz8WHylpoWW
wDPAL2EsCEfr7AoQCBhDb029VamU3joaKO13/DbIcCkkpUkcoBkz4XYWrd964Kua
TgqHse83v2CW1Dua1h2OYdo5h/rKnQ==
=+nl/
-----END PGP SIGNATURE-----

--7JqYoPjSHU6xZEHT--

