Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5C450DB0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 19:03:35 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmgKL-0001er-N1
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 13:03:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mmgF1-0000HE-KN; Mon, 15 Nov 2021 12:58:03 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mmgEx-0000II-UE; Mon, 15 Nov 2021 12:58:02 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3F6583201C6A;
 Mon, 15 Nov 2021 12:57:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 12:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=lS0g+N7fnnUSiKrHb7VLhyszgG5
 NihttPj6flEzVG04=; b=gLRFCv6vkxvJ/ZvdTSF69JRTsjcdcD+HzXDHwC+8h7I
 KAzYJNs2+nEB8u9eZuzht24QZkWzO2UjAaMGc9iu3XccIeJZrzka/K1cxBmnZSyg
 GkBPfir9eTvA0mh1oPwqQc1blXB23isnKvt7OLn3N9OsvwKmzbp4EXMQxl1RrWWI
 qfLE0jCf3z8LmFCJAWkDZIT9yj7m1JwcNvu3Y+V8l/AUY0Z6WysxQCZexDXE+yW/
 WskT/zTRgaxHskbsPFZqrAscaxELvbYGwAcEhWtCMFPJf4ydef2FbjFxV8fzhUw8
 zofRykvqM4gcEmXRoiohcWJyuZmtbBrErmtkgasFzXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lS0g+N
 7fnnUSiKrHb7VLhyszgG5NihttPj6flEzVG04=; b=NLr8jnjtiR+QzSPd1CQWE5
 X1S0C1OVT3byfk5ZLM03kWjbhB5JCo9whKDdAUNKAD+B8yslxGi+KekEjlVhgp19
 Js7YHgWprla1NKVFXDXRUVzOiWSmb71mpD0DZQ+O5ay6IL5dqyM+LWtp62mFTs46
 a0LO+YdDJ3ue0ktpofBR65kWF4SfFt5zeYr34xOJGXtAhSFU4+zbsYPcY/SaYCnB
 xa+Q6VW9MogSDq0vnLoW56FiDPZe9YwEFp5BLbGeZakvu0SJeTUJjfF87M5HmzJ+
 o9BeBAtk8ChEn78VWNzzCr8BA+UjL76sSBqXJF2IcTIAKFyUEyz3YIGpzKRUX9Zw
 ==
X-ME-Sender: <xms:op-SYVYfs4uHrT_Ys5dTxWzsKS4ZLhTsIs2nAEsFkPPYVXe-K62XZg>
 <xme:op-SYca3qSgGY99-mEtQNYDgLv9wJF5yWupy_6v8SxSC6YhRSKM3PyikTpufq979b
 ufRLUHxOIUP_itmaLc>
X-ME-Received: <xmr:op-SYX97R-HeeDEVuEwIjfaX8es1N2rPas1hn5-2SlHCi4pw-PjaecB-PQTOpSPkWBfaVVDmM3vA4-3v91Fxk9pBQxje4pegYpRoTOb-GgdwXRiYJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:op-SYTobW2RL8zlDFBZRusy7fOeK5pD-JlK7zHS5IflOy1xeQdhCPg>
 <xmx:op-SYQp4_DZ6ef4Ss6HX4c1b_oMp3tf2kQl6QpiiVPBQP2SRBs7Q5A>
 <xmx:op-SYZS0dhNKrCJDDxu08s8qBSlqfl1_2fUXXE9Q7vu0tRh0VlsnuQ>
 <xmx:op-SYbWYgSdNvsvGP5ilO9ZXCFzKHq6lGGZjufoKyMXemgvAwtYhKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 12:57:53 -0500 (EST)
Date: Mon, 15 Nov 2021 18:57:51 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] hw/nvme: fix namespace attachment on controller
 hotplug
Message-ID: <YZKfnwS7taAidsho@apples.localdomain>
References: <20210924072742.306473-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MNtNY7PYjFc9g5DD"
Content-Disposition: inline
In-Reply-To: <20210924072742.306473-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MNtNY7PYjFc9g5DD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 24 09:27, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> First patch from Hannes fixes the subsystem registration process such
> that shared (but non-detached) namespaces are automatically attached to
> hotplugged controllers.
>=20
> The second patch changes the default for 'shared' such that namespaces
> are shared by default and will thus by default be attached to hotplugged
> controllers. This adds a compat property for older machine versions and
> updates the documentation to reflect this.
>=20
> Hannes Reinecke (1):
>   hw/nvme: reattach subsystem namespaces on hotplug
>=20
> Klaus Jensen (1):
>   hw/nvme: change nvme-ns 'shared' default
>=20
>  docs/system/devices/nvme.rst | 24 ++++++++++++++----------
>  hw/core/machine.c            |  4 +++-
>  hw/nvme/ns.c                 |  8 +-------
>  hw/nvme/subsys.c             | 10 +++++++++-
>  4 files changed, 27 insertions(+), 19 deletions(-)
>=20

Ping :)

--MNtNY7PYjFc9g5DD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGSn5sACgkQTeGvMW1P
DekfTwgAjVWNdPEk8LYzDd9PEnq3srBQtFgB/QOY2ltCTT1iDwg1xPeJc1t2NL9x
loDTaj6KKY6fTPjDXzdl3jSmgvMVANwCw2c+3aDAT0bJ98Xp/Rln/mEgJg/Ke9aN
pWK4AzcS7bnKv7DvtA4ssBKksxfp5Q4G3yNMhT4I68dcWOtLn6d7PwhxFGBq6Eqw
6l59w4Qul9n2Tcs8U2ZLGuVIkV1xtbcSfEKLopTpKvMYc7V99ykzhdbb9PrM/qZN
wOJtkaBMHfY+wzergkXNfpjZkOGnWnze0XeI+otpskkygkx8id6i92wq+GBiOoox
TnrGHeVs6E+b0fXNBie0bLVw1MiORQ==
=iSUj
-----END PGP SIGNATURE-----

--MNtNY7PYjFc9g5DD--

