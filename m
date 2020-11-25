Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD92C49C7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:16:24 +0100 (CET)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki29G-0004hu-GU
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ki25O-00040u-JL; Wed, 25 Nov 2020 16:12:23 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ki25H-0000Wf-Eb; Wed, 25 Nov 2020 16:12:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8FBDD2C0;
 Wed, 25 Nov 2020 16:12:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 25 Nov 2020 16:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dT58t/8ODmMfBwGmNAYUyELR39h
 Zb6aesV6A45MNA1U=; b=JAZP2+9g6DCmNvItIqd2GauCtUlTSPLOAzMG/Y7yoky
 2hFXsCXGg+pvCkO//YcUWj/KPIbitmMOtoHGLnEtc4QyWoXnSkVxP+22Zmg+AnkM
 52175j2P/TjgHwCqk0dFN21YxobgfALz+Sje3y4JNcogSp8Kj0FOnurzef1WXNcU
 sYXhnP++007mnC+0QGi3CfhSjgzEG819BqZku3Ix1ulzNCJofno22gBjf846UBsl
 NY8GtgJmhQCPr/ZsSPowRXppZlJE/LM06BtXa8R2EMAnEVf65EQiUgOPBTB4ch5Q
 WCSC8DdD1iwJGoPQlqmLZ+KD7MEPQxwd1qH4x04/PIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dT58t/
 8ODmMfBwGmNAYUyELR39hZb6aesV6A45MNA1U=; b=LKPHThc9CyYlJmZb96D+l5
 gsfb5oCH4E7aNl/p5OVIwGp9I76soSMFDyfxjf5Bt7BCurpSscwBZGaJ11rbGTTs
 WIE0NeprAq3v+tM6IYJJGJQqvRTnODVoPWXK4sFGxV0m6q9JVJIlHALLzLLNRO1g
 pu103hTJbIoJgexPnjo6oYdz7BFuinlz5xxYqnR/s6e4dccBucTCDQMAmGb8wl/A
 cnqpOZ4BwxUJFKCYt8lPPzHL6cH1OuZSLfE3SGdDl4j1RIQTcvE6bnwipQcqcuhY
 cLsugaYY9gEkrpQFZujAtB0a8VkYxT5zrHQXIh0H/i+IXuHdhAP+lNXLbXJXqS/w
 ==
X-ME-Sender: <xms:qci-X2IsWF5W8ZcaFyqHb10Y_jFq54U_hHlXTao0zmGIcpUOBE96Jw>
 <xme:qci-X-INuZFp2WvhthtkU6pbDhwnDMjkwgvOnZHj5ETs8ML1jx9S4vfv26XM77eMT
 ykhQjnv0lQq9kCOa-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:qci-X2tN_A2RyNTe5N9vRkrQYCJlacI5ojoXoxm-llQZ1r6HVeBwSA>
 <xmx:qci-X7aEgg9_9pbJWZkC8DPKFAXgolRv4AHaMN9wqQXJxknLKk5HTA>
 <xmx:qci-X9bJ2UWJ50ofVMKRKbUpXZ3Wnj7T9Plj4uu8xteY2bWW7PURLw>
 <xmx:q8i-X6R9PrVLZq5VzHO10IVSR5W4xvPNpJfJB7XoAALlHMJiNLKf8uDlF20>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8DCAD3280060;
 Wed, 25 Nov 2020 16:12:07 -0500 (EST)
Date: Wed, 25 Nov 2020 22:12:05 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v9 08/12] hw/block/nvme: Support Zoned Namespace Command
 Set
Message-ID: <X77IpabPCv1BXirj@apples.localdomain>
References: <20201105025342.9037-1-dmitry.fomichev@wdc.com>
 <20201105025342.9037-9-dmitry.fomichev@wdc.com>
 <20201112193639.GA811486@apples.localdomain>
 <20201118003234.GA2719991@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M+whIGSyY/UcoKNO"
Content-Disposition: inline
In-Reply-To: <20201118003234.GA2719991@dhcp-10-100-145-180.wdc.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--M+whIGSyY/UcoKNO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 16:32, Keith Busch wrote:
> On Thu, Nov 12, 2020 at 08:36:39PM +0100, Klaus Jensen wrote:
> > On Nov  5 11:53, Dmitry Fomichev wrote:
> > > @@ -133,6 +300,12 @@ static Property nvme_ns_props[] =3D {
> > >      DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
> > >      DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
> > >      DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
> > > +    DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
> >=20
> > I disagree on this. Using the "magic" value ensures that only one
> > command set can be selected. We can do a custom property so we can set
> > `iocs=3Dzoned` as well as `iocs=3D0x2` if that makes it more user frien=
dly?
>=20
> IMO, 'iocs' is a rather difficult parameter name for a user to remember
> compared to 'zoned=3Dtrue'. While 'iocs' is a spec field, the spec isn't
> very user friendly either, and these user parameters can hide the spec
> terms behind human comprehensible names.
>=20

I'm okay with a "zoned" bool parameter and having zone size and capacity
in bytes. But parameters such as ZASL, MAR and MOR are "expert"
parameters so I think its better to use the spec field names and
meanings for those. The nvme device already has precedence for using
spec field names (and meanings, e.g. zeroes based) for "expert"
parameters (mdts, aerl).

--M+whIGSyY/UcoKNO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl++yKMACgkQTeGvMW1P
DelYSwgAuh9yfQ6319Qv+cfRJ22hQm4h//iAa/jrD5Ey8uDRZN6/YtkOVqZISncM
8+dLLM8Nf49/Jd3YmHsIoCwVRuxmHPeUjFAs8bB8bw+7YqJL3KWl5Zx6/kYF7958
QrzMQtyFpwfUEIZXAxna7lPfj8SpwM5JL440Saua53Vt510L9kKmWb0idCRqVDHE
ykDgTLMwnqVt5BsCuZB+AmoyfiTteSGh0+VBI10cj+iP/7zPZhlOA0K4YDc9cViY
QxtVpctNZob/anSbsjxzjwV814DcqBE6p4zDwQSYYWBo3tcTwuHVm64Sxb5EEIDN
Kb1BLSUWauUrVS25Q8+nG5tyw2xx5A==
=zK9S
-----END PGP SIGNATURE-----

--M+whIGSyY/UcoKNO--

