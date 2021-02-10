Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D131642F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:47:02 +0100 (CET)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9n1Q-0001jp-Uh
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9mx2-00011i-Qr; Wed, 10 Feb 2021 05:42:28 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9mx0-0007y8-EA; Wed, 10 Feb 2021 05:42:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7B871B32;
 Wed, 10 Feb 2021 05:42:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 05:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0+6oGuEczMHkJ/hBfbwjfFy6341
 EYEmtSh3JlZsw00g=; b=nCZAWwnMvLs9+aZNzWftGWQaoqFjqsYkBWLYOS9eMri
 zV21gWqToh6TARiian7KaEptcV8BXnsZoDAhX9yaHq4FTaZavarqOb+yWP1YxHTz
 jmzwKDc4iR/Xi+idybEnN9NjsfwDTtacnnJgiImwEf2Zv5072AYowlWGDWAdcu9K
 /3DJs2SxLlT4WWqP2jYMW1wOOxBrBfviK7GDgkdPsnMYljJ0HOfm7kI2fhlwNNBq
 FBxlrnIpNbuSx693aEdCzVVA9cyoS3ywybjvQDYR3Ikoe0Eods6sIHAB5qkV/mWG
 mA9ChB822mYejJeFV9UstrYERMFRbh74pDWfVOkh+CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0+6oGu
 EczMHkJ/hBfbwjfFy6341EYEmtSh3JlZsw00g=; b=uuLZJHT0Qpk54QVfCY8vZk
 HFD5smnAm1Jlz+Td4DqdNhstcz7R22FCqPMxkt48qZO8Azo8uE0mtPBTZ77diUaq
 rklAzeKspqr2TIUtR3HvjBG5SXadAVloTlv6ptoQlI/5kjhqa/Jf003RFc8YSlnf
 G5gjuBnhCw00Vx+vr5jkuDFlYmSv3c9LSN2lX6IFG8aXfMn5cfQrVJseI+XsmDcC
 S5Cr5D4b0c7/DQyfxAfFO0BBg6NeaeZWcklaMRa+BD91MyNnTm90Smd9FEawsPM5
 K2ZPVVM03ZHPM3TSGCigF7tPqXFi7k7JT60R5ELs3AiwBwyKfIc3JHOEj2exPTTg
 ==
X-ME-Sender: <xms:jbgjYIcKN7eRkubkgpdEafDj5ddr1DekH9hlngFLaBea7Bk74ANryQ>
 <xme:jbgjYKPhToQ5VemYiyEPouCw7Rlfb6fdkE6E1C0aEyAaTrrNGZruU1mRD94nkIe4m
 rKldajqnAwPRiXnGtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jbgjYJjc8ocKlQ9_0DLhrUYXlMRIyanz3H5Rv-mW3GUC1j4iCR3YLw>
 <xmx:jbgjYN_om4VKRB0B04cwTlZNv2tVHij0fJWE_Dh0o3Gh2-QI7mujeQ>
 <xmx:jbgjYEtFckKrqQkcHgmmUkVRzBZn51gNsus82BQRvkbOPv7t-iWUSA>
 <xmx:jrgjYJ8aEIYAdWyKnJNxQN0M1BiBtkNqjMB5ch-FyhMKtO7WqVT_AQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 05D0724005C;
 Wed, 10 Feb 2021 05:42:19 -0500 (EST)
Date: Wed, 10 Feb 2021 11:42:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
Message-ID: <YCO4ir+Rmo21y3Mu@apples.localdomain>
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OoWHK+WfWKq0oO/X"
Content-Disposition: inline
In-Reply-To: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OoWHK+WfWKq0oO/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

CC qemu-trivial.

On Feb 10 18:23, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> Current QEMU HEAD nvme.c does not compile:
>=20
>   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          ^
>   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared he=
re
>      uint32_t result;
>               ^
>=20
> Explicitly initialize the result to fix it.
>=20
> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>=20
> ---
>=20
> Changes in v2:
> - update function name in the commit message
>=20
>  hw/block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5ce21b7..c122ac0 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeR=
equest *req)
>          result =3D ns->features.err_rec;
>          goto out;
>      case NVME_VOLATILE_WRITE_CACHE:
> +        result =3D 0;
>          for (i =3D 1; i <=3D n->num_namespaces; i++) {
>              ns =3D nvme_ns(n, i);
>              if (!ns) {
> --=20
> 2.7.4
>=20
>=20

--OoWHK+WfWKq0oO/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAjuIgACgkQTeGvMW1P
DekBUQf/WCrab5rJNgcoPEQhjIiOMF954b6EpGIXwI6H1MQJ6Nrw4twMNT3KhHnX
foNXN/moas/h7ICNuLulJglPq0msnNms/Fx3wC+/kYobw8RznbZbHICGN6Ad/awb
QXGEfPXmLQMPMd4FsSZ4pvd80qSOyjZ2HF09CmpYwy5UmkxaXUFNunF/Lx6fagta
CsDhs8b3eWFWWldSsdYdmwW/1sLKmgkvAnfgaYRQbReCQY6M4Eu4kNVU9AigAcEz
NoyAivJjoaQVOgLhm4SfGod89RnT6sPKYxDYaKu/qzF8+/aJZp21FnfQGSmJB0I4
YjtJO1dSBByLVPTXUhOVZH5g8W/TOQ==
=n3JI
-----END PGP SIGNATURE-----

--OoWHK+WfWKq0oO/X--

