Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2F671836
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI57D-0006NO-0R; Wed, 18 Jan 2023 04:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pI57A-0006Ek-Dr
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:52:16 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pI577-00059D-S0
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:52:15 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AE24C5C008E;
 Wed, 18 Jan 2023 04:52:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 18 Jan 2023 04:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674035532; x=1674121932; bh=Hf
 C2/QhtpzSAataPvWt2iQWFojeiLzL5v89UjSeMpAQ=; b=l9WF01p/1BhNThJLmr
 /0MdH/KSZIpvqG/d1U4P8+W7vyG0c9w/gTAPS2PYrNPs6+qkaC0S+OzngxM0EhmF
 CiVbOc4JtJDAksxhOkUAfHIoWlVB1UMVYgBJIk8pOYDgIFaAq4iQ2qK6geLcZHcj
 rxpe3q96Q/SUV0GpcXxWC4eKhH9S+30jCcObIzd2ty7GF3sKXeIJ06Q0zDFSGIju
 7XH0kKWmtgxvAYzvjiGGjiYD043Nucmv5obJu1Lb4iXFuLvtuXFqegNfVbrb4dbK
 i/rpCEGFhhMqxASWHFroaX+zaxf3Uc8AcMqhfrheoqs5ro9HapxzmqkXjeuefAtQ
 OhOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674035532; x=1674121932; bh=HfC2/QhtpzSAataPvWt2iQWFojei
 LzL5v89UjSeMpAQ=; b=bbfeq2b1UmFNj4QQKu+yssqvtVkqEp4MugQQkBbGRjN3
 oOgxAoYBNXMzl+psI7c/NAq7kZSGZrsd3o/mhR+iVr4oX5bs2N5i8XeqEsPgTfhK
 yMTrtCSFW31qHsbnUQ3WhwgcD0jpNFEbYMX5h+NN3SayWZniT86dSWZ1k2bzKjPL
 PaaXkfwVeNhDjV7FwChg7cgaWFBn3HQWwAwMRWDpuLcE9nepZhGeyfpULMOkIOCx
 NogO26+ULXtUsozugRr/p8CYJEYBsireMzXLMqPQ8E3d6ouxUVqSTNpai7vcgXMi
 VTYno+IqiTorYjF0xAbXRDjkAsx48FGG1auU73CwIQ==
X-ME-Sender: <xms:TMHHY5ccVec2HAr7dx9M8dR6bty6WDMU9Yy0zjuGMAmNDvzzg6cHYQ>
 <xme:TMHHY3PyFoxEnFNCTmGKhyXqC2ZXuyQpRcIqtKfVk3mc-drjHl-_GNCbHNswavWYL
 _7wVTsW8fwrhq_Bazs>
X-ME-Received: <xmr:TMHHYyjl_HbowPH3tMIbuQGtyUJNNfZ5D5UmyaiBan-K5sNXO09Dsp_ZoH3F37td85w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TMHHYy_uUhWH1zFSorGB1u4rxWsiZ2i0Oe8JKSlbUyEqwMN8Sb_1rw>
 <xmx:TMHHY1to5Sf4MupxgUJGjqJJzBK9D074f6cgiTUbRHQdk0f6-ZDQ2Q>
 <xmx:TMHHYxHNObe9zALUZiJTMBLPj-FGnFgIGHjrhSvt6ctA2Sk4n9sUvg>
 <xmx:TMHHY5jVrqZcM-OMlXcBB7M2eIjzOHHYCEn4LEO46A84URvfSTZAqQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 04:52:10 -0500 (EST)
Date: Wed, 18 Jan 2023 10:52:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Beraldo Leal <bleal@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 1/2] hw/pci-host/gt64120: Fix PCI I/O config register
 endianness
Message-ID: <Y8fBSDEkijUqcPtQ@cormorant.local>
References: <20230118094023.49517-1-philmd@linaro.org>
 <20230118094023.49517-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EwZOqnucEjVadCM/"
Content-Disposition: inline
In-Reply-To: <20230118094023.49517-2-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--EwZOqnucEjVadCM/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 10:40, Philippe Mathieu-Daud=C3=A9 wrote:
> The MByteSwap bit only affects the data register endianness,
> not the config register. Map the config register once in the
> gt64120_realize() handler, and only remap the data register
> when the mapping is updated.
>=20
> Fixes: 145e2198d7 ("gt64xxx: Endian-swap using PCI_HOST_BRIDGE MemoryRegi=
onOps")
> Reported-by: Klaus Jensen <its@irrelevant.dk>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Can confirm that this fixes the regression. Thanks Philippe!

Tested-by: Klaus Jensen <k.jensen@samsung.com>

--EwZOqnucEjVadCM/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPHwUcACgkQTeGvMW1P
DeljfQf/SmN3HVqr9KUPfKztjzJYGeS3rf3qLO1CpeablHXXzwwrnnxJIVzrgenG
8nbMqaxFq6LDHDIuLs3QAydzfdTPdfSqDHyqL1lnRM6278WyKwqhm1tnN5BJ2n8b
K6jB4vnsYa16Y8D9aym6RMkGjIxO6DM8DnXI9Cik910uIOHyxuRqtE11SoYy5cbf
cxYepnKXMmXdZVYY7bLzRkWeND62hubXTndkXrPI8HfPYej/A2g7TJV0Mku85RGx
wc4aIcbENLdlZAy5CNoxHiD1TO9kIJd1QOGzasScuMhPQNIk+GTSRAP/bw1mOFQg
gXh7Cx2NQi/tvVl0Dih3+d0615ovOw==
=Q2Zg
-----END PGP SIGNATURE-----

--EwZOqnucEjVadCM/--

