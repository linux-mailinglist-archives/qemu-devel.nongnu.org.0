Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A4306D9E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:30:26 +0100 (CET)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50os-0005St-Uy
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l50jY-0004lg-64; Thu, 28 Jan 2021 01:24:48 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l50jW-0007Oe-CI; Thu, 28 Jan 2021 01:24:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E383F5C0136;
 Thu, 28 Jan 2021 01:24:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 28 Jan 2021 01:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eIgiw/foVTxo2i2lPJ0Om6XMRmR
 d0/ZjIqZKAD/uSaI=; b=PaRIPvlIGkDEi8Yllt0FGFk5UQp8TFw4XwTz1IlVrS9
 M9iWHHkfuxlz7OPzEyq6ABng5TlLZ4jRJthKQK8BL65S+QzRBWdV/4Tc1EE0SNWh
 9NMHoxr7GrxOY5XekBdSse2W+oU8/Hn27shY43b19qQau5XCaGOv2dUQ3IJi/gqB
 R9tbGL/kHH1FC2forAWk0gpFVx9wzOfCR4SRTwWg9UHL7pbnjOSRs5NWtOBJ+gP/
 Ot7MwzMf6pmcXf3/mqziaOEC7fwulSZ2F3UKm/6O4V6EIZJuMVB19EumtAeFb6X3
 a/1pIzNQ8P35o19x5Z4xyAZQfditEVisbw1yWQNq6tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eIgiw/
 foVTxo2i2lPJ0Om6XMRmRd0/ZjIqZKAD/uSaI=; b=C+TjPldA9SHEnDZPwUjwVZ
 gHT2k51wS5FUBGrVrEetz3GJiQ/DoTuQPxNxv49nULWPjJThe06PJ5+68QxKG88y
 ruSuK3P3SEfCKy2nKy/8u5Hwrti/ZaN13vq2AwrLXXpicywVCMkH2GiayJWhmh7E
 RXXCgK0xwghsxryJQqmhDiCUm3vvGb8ZSGhr8BV0mnBN6HwSJt2YGKWzR2uJQ9kv
 VR8f08zntEmXeg5W9O7mQMvlbDgKo/npwjc4NWCGxXibEvKg0EDDVoudasmoJbmD
 2sekpBMdKCAi55jkipulI7pOq20DZYeSh8PGbM/yx3h8TVb40Rs5QKvA7ZrldW8g
 ==
X-ME-Sender: <xms:q1gSYGk0dNNTmkYgvlW2wuMmfdvOlpj7SnfGNBH2UPKURdXHqep0tg>
 <xme:q1gSYN3CUhYlRxS6YXrPngmo21IkYsEcLjTJ0eDc-yJ-X0LS11YCxkTriEm5cTAnZ
 yYe1QG-1EXbhnQTfz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:q1gSYEreax1gY7e6Z1HQzQLsCUaA88OabjDS_JZ-qv_ZOZ_t-x99xA>
 <xmx:q1gSYKmNv814iBRlKsfFg5PxV-WJnRjQDzJXNek4w6nQyaQLzglQMw>
 <xmx:q1gSYE3r5BVGBkp4H4Z22zJzEOGKjoG8tc-_dbj_FiQqop5NZRc6xQ>
 <xmx:rFgSYHQbdO5ZCWWq0-zRWpuNxtaxEKkI4sxDd2g8SRIK3MVjsgB32A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6A351080059;
 Thu, 28 Jan 2021 01:24:42 -0500 (EST)
Date: Thu, 28 Jan 2021 07:24:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] hw/block/nvme: zoned fixes
Message-ID: <YBJYqHZYKZeL+rhz@apples.localdomain>
References: <20210119135500.265403-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yMKDKV9RyedD3gUu"
Content-Disposition: inline
In-Reply-To: <20210119135500.265403-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yMKDKV9RyedD3gUu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 14:54, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Patch [1/2] fixes the zone append bug reported by Niklas. [2/2]
> refactors the zone write check function to return status codes in a
> different order if there are multiple zone write violations that apply.
>=20
> Klaus Jensen (2):
>   hw/block/nvme: fix zone boundary check for append
>   hw/block/nvme: refactor the logic for zone write checks
>=20
>  hw/block/nvme.c       | 89 +++++++++++++++++++++----------------------
>  hw/block/trace-events |  5 +++
>  2 files changed, 48 insertions(+), 46 deletions(-)
>=20
> --=20
> 2.30.0
>=20
>=20

Thanks all, applied to nvme-next.

--yMKDKV9RyedD3gUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmASWKYACgkQTeGvMW1P
DelacAf+O93/cvM4tewKfH+GwOdgFf7G5a8AEiI5d+yfOswzpNl8X3Y4S0UYifpp
Nlb/PmRqP5tuSp342glJ5nuhoCVvC5kLs5hP35DqMSZjdRZxJP0bLsTTj9hV4jH1
dTLVlqQ8NAYsSNHW/tNlpYgxtZkF/8zpOfqdNGeZXNczVN9Kw35tfNcnj1MlYOAk
mTZ252YOo942OwZBZaAK4L8dCYdLbZpIeto84GXAnyiZ2hrhztNhVws09XN3sAoH
SNMB8XyPktWQo3YU30r6esOZuD3G4ouES+ggl5vXi4cxddC4oadq8CIHkHYK5N+H
zrpO7gWiLxfLAzdTEgXHoVFhsRha+Q==
=L//8
-----END PGP SIGNATURE-----

--yMKDKV9RyedD3gUu--

