Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E043FE9E3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:18:34 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgzZ-0007X5-4f
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1mLgp5-0004Qy-EC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:07:43 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1mLgp0-0005Fw-Ma
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:07:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 5DBDA3200A40;
 Thu,  2 Sep 2021 03:07:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 02 Sep 2021 03:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GiSn5cOfS1H1CSeuWtjTTprskL4
 XKHEzOMkTdifJUuk=; b=AJO4rKiZouwta8JZlqByUVSPlv94iF4FZjOv/EAKD0E
 awBKDD/8PO73Q8eHbK7DiwcJYZ579RUoeIkNDN9Jpg4KMiQ3+8VXLnXbiHmYK1ak
 ynKkv80Y+b3RnPbnWpLxOoMbAyJ1aBDmDvaIOa+44hFZ1qH1rfKYUi/CK3G/kfE8
 y7QTGCvXC+iUlXef4aGVGaeGExpgNOU11e/Nlw04Y/t3T3u3tIEBGnATY+ufDp9g
 k1llAJFksWUjWLexvXhjoa2SQ52nyHgsMi6kLyjHrVM3UJ1X43+A2JwcWe+7E6Tr
 oZF8pA3Uv8kXzkl8th6q2ljl/zYkAis28AEf1Fxjp2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GiSn5c
 OfS1H1CSeuWtjTTprskL4XKHEzOMkTdifJUuk=; b=ma+rNw6hy+K1AnNkRU7PqR
 vwk0+amenWZJrB3xThzhnDFEKkeFgICoNQrwQFE6wqTiigcolJ2h1IzRlhiKtQrR
 tXIBypkZfrVz62+2k5vACJUH7AHJ7pilbOQP2x7B3bpvCSjEkVXzABqAcnF/71Xq
 aTeU/iexAP39gWZVTqd3sR2hRWnrUpB9lyudwaL2vuiR06vOwHnDwNVBRbLMkqZY
 PZK9Vwi9YzT1j6A8xdmau8SfStUPiYKj6UpKM80auJ8/5OAII0HjrmBKtmzYXMir
 8jhPYfU14/JU3Bgf9uPNDgxnRafJTRt0yyQE4bJTrMYef4lOfaKZr97cFWYwOysA
 ==
X-ME-Sender: <xms:NngwYV07gVxN6tMl8zIR-V8zfaIPKC737F1Na2-J4hyhQUm739SnQQ>
 <xme:NngwYcHwDSY_NbtxS1dY1jtWHH58p_67xarH6Jy5fhfciTvchXCYx7gmAUWt-WXFe
 JvQC6_xF2VqB1N27r8>
X-ME-Received: <xmr:NngwYV5AiQGdXccP_u2dkPO7iKq6juUtm6Ei2byNDpnBX6kITEodCzv4dRit6jh9yTHC3Pr5E4Kk6YjDzt2ETzNizGaQIhbuRH1zv49YICzkjmLYQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NngwYS1I0BZXaWTjxudL49sLA157vUrebrJIHOLagT84sFcRJk0srg>
 <xmx:NngwYYHtRqNAE1T7DDWVyCaGWflM8CEVPT4fsIbHqhCEXOfGw9ltlA>
 <xmx:NngwYT-iZ5CuOUIPa_aYqy2jDkOw_lG60WhTLGFLuo9aA7nStjsqBg>
 <xmx:NngwYSNMhcqjdMS7ygE0jEZ-q7IRylk1Y5oRNhyZOyYBq5eSqjQ5cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 03:07:33 -0400 (EDT)
Date: Thu, 2 Sep 2021 09:07:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Duo jia <jiaduo19920301@gmail.com>
Subject: Re: How to comminicate between two QOM model?
Message-ID: <YTB4MyTaZT94Lxae@apples.localdomain>
References: <CALUzjTaGXLk2SMCAm=yyWKHT4DtkwXih_jct7cx5qU-8E3iDrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cqwbERZyoYaja5ld"
Content-Disposition: inline
In-Reply-To: <CALUzjTaGXLk2SMCAm=yyWKHT4DtkwXih_jct7cx5qU-8E3iDrw@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cqwbERZyoYaja5ld
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep  2 14:40, Duo jia wrote:
> HI,
> I has two QOM model=EF=BC=8CA and B=EF=BC=8C When A=E2=80=98s register ch=
anged=EF=BC=8CB=E2=80=99s register will
> should also be change .
>=20
> I dont konw  how to change B's reg in A device .

There are a couple of ways you can "plumb" devices and objects together.
For devices you can use a qdev bus if you have a strict parent/child
relationship between A and B. Or you can use a "link" property to
manually wire up the devices/objects. Or use can use object composition
(device A creates a child object B).

But I think it depends a lot on what you are actually modeling and you
are not sharing a lot of information on that ;)

--cqwbERZyoYaja5ld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEweDEACgkQTeGvMW1P
DenLQQf9EiSKHi12I2gEKYiLekDgaZ1bRI9mDzQqTUb2qiYOoPMmfQsHVrtEZDS5
lVGR+w1IQ7Sqw6vRMeAmlzyRjUb26NeIBoIB9Pj2TjufnM8eQnXHrqcNXiIlUAVK
YbO9bYfVDj/dh3MfrLt3D/xdFbe/aJPqQIisP3Gk8NM8x458/Ce2vA8Xr5Hb+r+k
ECF/IbyHkrfmXtUpLaqwOOgeXi5RHywM/5C0jdKw0403PvzpdwwubSP/v9wQDlsb
8MCYxi5O6xOyhKSlu+xX4NfYCwGZQRp9Bt9g8J3+gJ3KRqibW0my+Gh4sZtl6rNX
DOPUSkj3ubkcpgm52NSoAvy0nE4cEA==
=nha8
-----END PGP SIGNATURE-----

--cqwbERZyoYaja5ld--

