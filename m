Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B3D2F99C2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:08:52 +0100 (CET)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Nid-0003Z8-OF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1NYG-0001aY-S9; Mon, 18 Jan 2021 00:58:08 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:48995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1NYE-0005Ge-Ef; Mon, 18 Jan 2021 00:58:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8A4B21647;
 Mon, 18 Jan 2021 00:58:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 00:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7TYoVtzqpD3tVm+/BiDdRWah5zj
 JACg1qvyUgdCcOTg=; b=RL0ZHNNNJB08w8e9CQeNsv6wS4frNrg5V+AH+PdEmpp
 U/5ryAKLsmacgj/BeSq5yMx5Axu8xDIv7WhGCKYYxxb885/hoAfWMycuKjdqhzjE
 tND2uOIAQUxS6iZpFJkxRFD57gx6+w68MX+dAGQeKoUl9wqdzKiKJa8rfEOJ961f
 l2UiqQtUCYU4GGcLuNtrQjgnMx3+f5YdcjrVvnH6eOzs0+7ap2iEg08VcNDamwQN
 MIvZiZEIBSQlfhVKaWnRkEb8uPESKZab6ziowuozF2rpHV/voPnpG6lW/fOPRg61
 PDebUWDvHojYGd/osfHsnTAx50XImYT8vGjlHBuyCLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7TYoVt
 zqpD3tVm+/BiDdRWah5zjJACg1qvyUgdCcOTg=; b=MQ3P6AlEeMcBRHIYH7io8c
 fEERjc6O6aZZ9xaiCU2Nu6YbPgnGduA6Jg+51C82Pr3a2azdryXYgPvOfFoIjNlV
 8CgH9tXSRoXOmD2n42CoTRVuEvkDx8U52ijimLeD3QfGD/Fw6mdJU2WSCjRA07vK
 MFn8gaLZIxWLBMqQtlfNYLk6DKM1DChNs7wi5AHaYDNaWcAa1zR1nFeG5YR2ILs5
 gkIdcjRswMNLZpkyZoLpirDATWr2jODYrgYJCXDoB7JFqe6RbBlV1ijSmbW+aUOX
 vkMY/x9+UZLswQwqTP+oXechNZHcw8Ms+5pM00/x4WhvY9RpIhFlJcWbZc0MqkZQ
 ==
X-ME-Sender: <xms:bCMFYKnfV4T1kptiK_cdvSj5pm1_9ttSFw2qpU73doxNt0d0VQD8Zw>
 <xme:bCMFYBySnXKszqBpzIvY4cQUGFV2baUBhGjOE48b8rWlEKKdKNJ_3jeAiVpPh8QJ1
 m6iwaitT-3_bzt8Lis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bCMFYFhTUfnFazDM1fEZyB-4C8LQPWwEyY2Vx5eS31C57xpFSpnmog>
 <xmx:bCMFYGV5TB8X0njcXe3VItDDb14FG6YEXQmh8_BoAcpiABJftvlFVQ>
 <xmx:bCMFYH13u5bCljQ7QPGj5S4VwK4SUEpWfd4XVNxc0X4Cv31G7hHdzw>
 <xmx:bCMFYBiiU4YQepLxrEPRayWcA_ZbyjIm1whksTHk9cYVB3EFdDMtDw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FAC1108005F;
 Mon, 18 Jan 2021 00:58:02 -0500 (EST)
Date: Mon, 18 Jan 2021 06:58:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH 0/6] hw/block/nvme: zoned misc fixes
Message-ID: <YAUjaQFSJ+rlRnvd@apples.localdomain>
References: <20210111123223.76248-1-its@irrelevant.dk>
 <0e93635d89378b7cb0250ad4a73555676d0ad4ea.camel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jmcmKnnfCYY+hg26"
Content-Disposition: inline
In-Reply-To: <0e93635d89378b7cb0250ad4a73555676d0ad4ea.camel@wdc.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jmcmKnnfCYY+hg26
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 03:35, Dmitry Fomichev wrote:
> On Mon, 2021-01-11 at 13:32 +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Klaus,
>=20
> This series looks good to me. I've made a comment in "zero out zones on r=
eset"
> patch, but it is only cosmetic in nature. I am going to send a patch
> with another small fix in ZNS code.
>=20
> Best regards,
> Dmitry
>=20
> Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
>=20

Thanks for the review AND testing! :)

Applying to nvme-next!

--jmcmKnnfCYY+hg26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFI2YACgkQTeGvMW1P
DemG1gf/Qk5/Y/8H5w4PAsyBcVmieOVf8TI1ngbrRN2qNK5j9Dhk1/OHhaIo3tKe
+otSuGiSA4nzf7Pd2073iCTH2+OAcztk04EBXJ4PirHJ4mJuzzBRZRjt2XjnqWOL
MrCKYwesAvq8mSzVXza4rFrsjdUh6JxlCzDBV0y9z4ToFjnYwKxMA+rtuVawF7/c
Cm3hIpYcnIIezfFMF3UWcG6WLoXyanogUCXSeFHQWSEAxoFosTbMl4VA4Ecrs10W
vkYouoSaq3ERY4tTLrtu2bB9iaJ+4243G96htHePDUA7Gh//xKpj2NocxcgOjpdc
4q4m5EQJrRnsiWNkxfq4R3htr7jpOQ==
=9Gm+
-----END PGP SIGNATURE-----

--jmcmKnnfCYY+hg26--

