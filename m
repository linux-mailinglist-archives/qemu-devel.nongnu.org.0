Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF4671837
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI57V-0006Ww-JR; Wed, 18 Jan 2023 04:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pI57T-0006Wj-II
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:52:35 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pI57S-0005F7-33
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:52:35 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A04365C016A;
 Wed, 18 Jan 2023 04:52:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 18 Jan 2023 04:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674035553; x=1674121953; bh=cD
 EohUfNcIgGT6SOQ5atAr9aV7nMB5zrgMD7mjNZgOc=; b=WFCoqOMOtqAQlY7jEr
 wdbthecWngQdt2m3O36pwyJ3FRYjbJdZQO7/rFrng3jB4s1UlbY5RjKAJny0G9qw
 A1gsvcnO4IyOCKll55rgPbjGD+I9MimGbb6kak2kOVeG/tnz7Ta7xq05iEW4ptpJ
 zGRHZ0oPjgFS1TmFKJ/3GI5Qy5aOxz0UqFJQueaiOmJ50r/fcaMaV++1zMM4tEND
 0FE72IBRF5g6wMoXua1klBaUv7FLSbFDj+/j655p2bW0wQFX+Qn8lWqqZg3KXZ56
 DZpUqV+bFqMhXBdoA4BbbNnUTr7izPKPzEnqq5yBijzzvHcnoGlrFptSsDAe+BRh
 WxNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674035553; x=1674121953; bh=cDEohUfNcIgGT6SOQ5atAr9aV7nM
 B5zrgMD7mjNZgOc=; b=RzPivnDtYhdFww54M6tXS+lUyvyjpVB35/TGEZY79U9B
 NEPWXl9fSxmHePEHb+4p470NFgHP+++3fGI8chWQiIu1N7fETCccClX2C282ySdg
 E0TLjrxhjUCWIFGjln9BVWmqRxlys++lSysXJlqJKL5lVadOg9eUwyDZn3orX0Hs
 BR1TEpdr35g7RtHrn+4bImRnOAbPtfMeDhkqufhaoO3wD18t1cM4HU9yasnelDGU
 I1frxTjBxrCq9UHNDtnyTGwIej+NBUC1S+UKz5KW5ZQryhTqv4skHF1hMXkcIeYl
 /6rMbgkgsp44MfbZlI1SRPx7FEs0+3OLy8lHK7yMiw==
X-ME-Sender: <xms:YcHHY3XA6wjKCleA1nAb_LGmnQMIx9_zWAZq-l8cXY0Bi2P1JK_dPA>
 <xme:YcHHY_krHMWr_NOazDj4byA5st7KCajjHoB6g28s__OZ3YCx_qOz2jf4q9IMxUjzu
 orv-MSS6ArHVqZLjvY>
X-ME-Received: <xmr:YcHHYzbHbKvjsF-6NywY7qQK4mnipU7Sr0vjuFRzi95XKMIE7eYnBKutFVSaHp8hVKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YcHHYyXC9nZ-bIwmcu2BU3k7I_J_kPAjxi3C3uv7OLJTqWWApH8ukg>
 <xmx:YcHHYxms3aX7FibuXBANakRHypvfx8DzcoGbGoSMbgBc_OH3Rg1v-w>
 <xmx:YcHHY_dY8507lUY-hKfjbzBtwcmg2ThJ4JovvL06zYrYA42X3XYlNw>
 <xmx:YcHHY_Ysztvlgbo1ybMDWAJZ8Cn9etDfe4YE-qNrIsXkUV2BWuCh5w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 04:52:31 -0500 (EST)
Date: Wed, 18 Jan 2023 10:52:30 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Beraldo Leal <bleal@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 0/2] hw/pci-host/gt64120: Fix regression on big-endian
 targets
Message-ID: <Y8fBXuXhkcp8S4xb@cormorant.local>
References: <20230118094023.49517-1-philmd@linaro.org>
 <509084a0-b7a5-d167-26e7-492fca101863@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QpJeNiyPdp1Cenug"
Content-Disposition: inline
In-Reply-To: <509084a0-b7a5-d167-26e7-492fca101863@linaro.org>
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


--QpJeNiyPdp1Cenug
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 10:43, Philippe Mathieu-Daud=C3=A9 wrote:
> On 18/1/23 10:40, Philippe Mathieu-Daud=C3=A9 wrote:
> > Klauss reported a regression on big-endian targets, introduced
> > by commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
> > PCI_HOST_BRIDGE MemoryRegionOps"). Fix it and add the Klauss'
> > reproducer as Avocado test.
>=20
> Sorry Klaus for adding an extra 's' in your name :\

Don't worry about it ;) Thanks for the quick fix!

--QpJeNiyPdp1Cenug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPHwV4ACgkQTeGvMW1P
DekVBQf/cqQbyy4n+T5C5ykAw2s9+QIBZTGGt3H8T4cyf1Mt4zXZD8ek9pvOtQgB
FXQWD4AGIDhjyxRUEhtIal3/OiyfQpgrJWs0lj/w+OsAXpNJPSl5mM5wYmoiMgBQ
aGsFPmHQHu5TZ6WtvL35TQaznOvZLCxCw/0Yft738NOTPKN6w1c/KjGLU7/n1zSw
FcehVGtJ/dPw8mfXk4yVuJ8SxyMZHwzRajQiIdGSURw3ozZi5GSyl5ab/A0q/vaQ
tCaWngxWGqjU5o5d6H2ZZH/xdtHqk6P+YRVgnwyDpANUZ+ATnbw4GogkPLA7IsKs
UbnjUwsNTaDjbSVa3UKRRYUaayLmDQ==
=Gt0l
-----END PGP SIGNATURE-----

--QpJeNiyPdp1Cenug--

