Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413BF5080F9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:19:53 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3gt-0005X4-Kc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh3Qf-0005ES-Lo; Wed, 20 Apr 2022 02:03:07 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh3Qd-0005so-TW; Wed, 20 Apr 2022 02:03:05 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 27EC63201FDA;
 Wed, 20 Apr 2022 02:03:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 20 Apr 2022 02:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650434580; x=1650520980; bh=AT
 96ac6VT7SXURSXxM1vOX3C7Oo2R1AkLH+Zdanp10o=; b=OQdi21pUi+abtkzW/R
 AoMB7rSL6BqG3KbfL2W685xuK0SBvYPMLparKQOwyXrR9pI3tYR3ETS6eBz/LMFP
 2FfXqdGcLeUfC2/1FEECv3r2NL/PiB6cbQ4dZTJ0lHAmgp8ypmswj9P3cBykKv/W
 Yd/90igCUMWTL6cFPVDQuqvLtXpJSGWgjejQYAKWYyaFzoAlizQpnWQDKqhUSuPW
 I4sWWp1/BYaLg+sok0gD8v4JUvmZlv1S4jS5rm4hPbtgszyhGIi84rV7xck3aIYC
 8KoLwFjEkwCtS2LQ8hxtkv42JyYM3jo2YR+t9simfGV9rRXDX3PTixoOo1z0lDOt
 WTew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650434580; x=
 1650520980; bh=AT96ac6VT7SXURSXxM1vOX3C7Oo2R1AkLH+Zdanp10o=; b=Z
 cB3qv/vwpdbk04+RCOpW/TwQs7x/9fm1B0cP1gBk7wXFrUnLEpFBM8G9xdoH+scA
 PLgj+eK2FtZ9xqXy2Pt/AmoQQVOR4eOyTJNDAMlmyrRfl/BL+6qN9AufX3ZuZZYb
 wo6Ck2uyHiiq3TfDxNF6ySuWJm4k85jX8xBWnn5i/iTP0m96/9tApVejelh9zUR6
 O0Ub3JEDyCRzGg2DCkvAaBSMWzecSA7RYdaXlJrs2MbofW/9w0g4BKe0sKnj7n+B
 l8cru6nnE3ElE5jUFJqw37gc+1UwSyLhUUpK6YHAYKXDY6s64k447IpUozW6tspn
 bgj0xAoL9oAoa23Oy8nkA==
X-ME-Sender: <xms:FKJfYm0d8Y4SYu35Ct9LkBgv5yCULtfqWERFeIdwU31t0Y2zYiwDOw>
 <xme:FKJfYpGRi2vp2n1QARKTzs173JIT7Q7c_JSfVa3EU4XMNBWHKoiNSynijSIJa0XOw
 MbZZuY5OApvrE8L7xE>
X-ME-Received: <xmr:FKJfYu6YQRavnneRAxFjqisk2bbH0IsNo1a5gO1nmg971gg12u1dGtR-qymPJKYuUipmuwko3FyKpubbO6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:FKJfYn1dnw31YSQmm2IRTBWVorDsccfoYp-2okTS0L77fQFz1hotdA>
 <xmx:FKJfYpHgWMyDe88bOiBI9sRdSP9arxlwR4tAjXrgcZpG5b3Tv1U_xw>
 <xmx:FKJfYg-ALCC9i2nJpVkaFMlm3bSWS4T8aslcthg8Z6dPrY4-2nmD_A>
 <xmx:FKJfYiPmZdzwn-Ynr2Nrj7ji4Q3hcI9UVMWv4n6i5N3KYP1WjmKCDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 02:02:59 -0400 (EDT)
Date: Wed, 20 Apr 2022 08:02:57 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/5] hw/nvme: always set eui64
Message-ID: <Yl+iEZG3ZQPOiqDz@apples>
References: <20220419121039.1259477-1-its@irrelevant.dk>
 <20220419121039.1259477-3-its@irrelevant.dk>
 <20220420053059.GB1901@lst.de> <Yl+ey8yiaSrYY0CB@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R4cSq+u4iIUJOrsM"
Content-Disposition: inline
In-Reply-To: <Yl+ey8yiaSrYY0CB@apples>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--R4cSq+u4iIUJOrsM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 07:48, Klaus Jensen wrote:
> On Apr 20 07:30, Christoph Hellwig wrote:
> > Also EUI64 values are based on a OUI, while NVME_EUI64_DEFAULT seems
> > to have the OUI values cleared to all zero as far as I can tell.
> >=20
>=20
> It really should be a u8 array, yes, but won't the integer approach
> work? The "template" is byte swapped to big endian, or am I off here?
>=20

Nevermind. I see what you mean, I'll fix it up.

--R4cSq+u4iIUJOrsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJfog8ACgkQTeGvMW1P
DekqYAgAleAYfLhVgJd4TtkVg7+KoICvqZ/j/KTMNLJXJtNQExkdc4RfOY2SW/2Q
3NkP9b9760hAitd8kooqoULW898ZIem3uiTd8dX5E+LQioSEqkmOwLYI5Mc5LALs
WsrwFyWzPTrxyUsmReZ1io9VkUN+NaTDMIwXCEMuOa+zn+cNUhON7sLLbhHGnAEv
7SyGAxSyM9kYMXrOgIJhOSG1QMlLkW/Ri0Xm/ho55yERzO8gtJCpxxNreyElv3eq
9asTnvug9t1SYdwH9ad1pelH9NPt3xb3jAE9x1YvkwgavgAGW9wi26RmRO0pD+Kw
fHA6t/n68TRIXrO2IyJrJaCbb7xriQ==
=L4VR
-----END PGP SIGNATURE-----

--R4cSq+u4iIUJOrsM--

