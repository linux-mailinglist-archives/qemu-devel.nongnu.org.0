Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AD4FE9B3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 22:56:56 +0200 (CEST)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neNZF-0004u6-CX
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 16:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1neNFn-0006PJ-JV; Tue, 12 Apr 2022 16:36:47 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1neNFl-0000nm-8t; Tue, 12 Apr 2022 16:36:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2F9BE3202090;
 Tue, 12 Apr 2022 16:36:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 12 Apr 2022 16:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1649795799; x=1649882199; bh=z2
 ry4x7Rq2/5ACX8Ur4nOE+jYRqCDL7WDGk/Ms5NoZA=; b=qrZGkJQ5SRrpZEuz9x
 nmcxARs6ZUGc7fhHOLsKlMd90cI7mnKGz2f3G46P3t5xNMac2GEqBvLHZp9Bs0R9
 z485UXwYFFbAQHOvdQbukj9UdhyUbrxwu/WIWBtjoEhtMc5Wj/XW49TBa2sQlW3F
 ABPq+ylmU/zQ4iO3miYKEoMEbcYn8YyevflH4gC0uisALe5RzwtDMDTRiBxDEimb
 57sv5Yei75QmkR3WxNdH3KdwGgBz3Q/GNBnrqWlqZi1ywe9dB4IvGKsofn0Cla9z
 uPzXF7m530fivCb+sEbTgE/4MFPvK73XWQn6UPNJUZRGpamSovtUCWXVH7hB5PMB
 bQSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649795799; x=
 1649882199; bh=z2ry4x7Rq2/5ACX8Ur4nOE+jYRqCDL7WDGk/Ms5NoZA=; b=e
 538w8nWs2WPFNh5OS+YvToBNTO5BHPHdkEJ6OhELZhMTRQ5SyNl7Zbc4cT7XI4y4
 l0ZCWowJAo6gNuaAnu2kJvO1ha/P6peQj0qr3IelJMNJecR84/KixpctXUHYY9OK
 MOR5S+hMAngf3fjB1YsIL596evf3JVNNNiheFLK/0kqW7/GGc4zv/Fnqg5Fvc3+y
 daruAcxhMtHYo7yVdzpoD7kCdFfw3JyH6+6LzNH+3V5LVFe7JH+W2V+PpT/HXuJi
 xe3hR3Sj48lbqZq72XalU3RaUrddhB9j02JckvEYXJAqWzVRS2i802h3ApZzwEQ3
 ZX2A5d0NLxitDohxbovWw==
X-ME-Sender: <xms:1-JVYi1Jxw5X0jrCHVNEPW4Let-uS7I2xQlIcHLdVhTlEPvnsXchsA>
 <xme:1-JVYlGyChpYeNW08-TVXU-iI0NiDEhe6VFEmTQhANRH5_FfOSa_5VSijqK74-7Pp
 ul1uuTJuvL8Mvg12BA>
X-ME-Received: <xmr:1-JVYq4Kz0rFPOw8cNEuWoqeXl62GzYYHXKzi8WVgLlqUkY6SawSlkqsAQwGy-g710AI_G5LEr029bMK22g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1-JVYj1MC9_NPPDLRWgssMayGNx_ThA3p2_1UngqbOc-LMg-1W5efQ>
 <xmx:1-JVYlEIzoiTgpZ4wQqKyighqbhmvc3m432tV97VHHOmS2F9q76qgg>
 <xmx:1-JVYs_sxMSs11TfuQohI9ExpXzIHBXAOyD5eh4sCb8EDd7jgdCRvA>
 <xmx:1-JVYlB9Cl0R1fQtZDQGiRqpv2S0whmuGoBKAe22-o079RZFN8c70A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 16:36:38 -0400 (EDT)
Date: Tue, 12 Apr 2022 22:36:37 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <ddtikhov@gmail.com>
Subject: Re: [PATCH] hw/nvme: fix narrowing conversion
Message-ID: <YlXi1SnTOgoQZMqC@apples>
References: <20220412085909.nppz25ifaotottjn@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="22BrRE4xthraDk36"
Content-Disposition: inline
In-Reply-To: <20220412085909.nppz25ifaotottjn@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--22BrRE4xthraDk36
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

Thanks Dmitry. Looks reasonable,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--22BrRE4xthraDk36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJV4tMACgkQTeGvMW1P
DelXzQgAuVgMA9OGVwH18admajSsHwJYI1/wGGJGv50u7PiXOLLsQuQIz2CVhW+x
Lb0+NtgD2Tx9CwYAxCU3+7FAJ+t1c4IE953kA8mAUra3N7N8a053wcI0AKZGKLHZ
K5j2zWbob8zYQp5y5m3M7EDMetFhTfe3/xotofCYff/02hXKdUEVcFYwpvVAxk4C
g1CLkI1Z/yr13ooxRlGEbR/BfDs5VBHm/CezW4ZPak0g8z26AvCM0+HYp1Cz5NUt
AEEnutvcYSPiWYvM5BdoC516rfYrbtNVihxa2QJjenNmcpVQ31SBcGlRFxJQYtsc
3OI+mvfQBkIYo7wfpYYIHAiRpmetNw==
=WQKa
-----END PGP SIGNATURE-----

--22BrRE4xthraDk36--

