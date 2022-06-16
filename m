Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4C54DFE9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:21:57 +0200 (CEST)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nZU-0003Uw-6V
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o1mxi-00024e-Lm; Thu, 16 Jun 2022 06:42:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o1mxg-0007Es-Ry; Thu, 16 Jun 2022 06:42:54 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id ED5A75C0902;
 Thu, 16 Jun 2022 06:42:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 16 Jun 2022 06:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655376171; x=1655462571; bh=UL
 Vc/ZeM2B7wn7mGt3wLtQXSeDJRoZMKQ2YtgHkD0IU=; b=e64YweKrKe8/Fl4/Vy
 SisEbl0Wiou/WDveTp9NK0KeUdwoulibIag8qFXIeo0FE6Jdk697awScnCfbdMR7
 eQIwp4LYdkHwBx2UxV+02hzTW9ZFVp6UQHv038s9p02WV7aSvQ4Got9otJDWG0xX
 EQoQOesudZr+DthuTwPeoiCAcq4X8gKtKBxfB+r4cXcbS34Y3SnvPtq67DD1bGMQ
 MIUixNyUyODtXTuc5L2V33J0j4rfEr5NGKhdDOxyEn5S3iXZEAbJkGvRbolLi+6e
 C5SiVzeMpSam3qwvgofuHA093i/MmecvZqIbJIBN0z48n8SgsSgMHHghhnKYvnKB
 Wswg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655376171; x=1655462571; bh=ULVc/ZeM2B7wn7mGt3wLtQXSeDJR
 oZMKQ2YtgHkD0IU=; b=ZtcUQ92IXdltwE+IWafiuL8sV3fyem3LbK72SFDz/4+m
 AfSdGysER2YlJN/YBAhNJQ+Pnhzfk8QLh2XLHw08ItBJ/fuJxaPVNjvqLmMmwxz2
 9pZ52V9wCWd6d98n6QFitD7UDaedwzjsiVKFLcWpfi6TechCu2QTxYzUypqTXj8d
 dhf1/ZdwQCogTzGKHVaTK5D/+VFAwcwh3Dne33YcREmrDbP4GnMcpkTvfK22PhZc
 /oCuJ0DXaGnb0nnyNqnqGmss1egHtDi19+6ydwjY8zSNfQlOEnx+nBsed+kRS2sM
 psrjQALBjLUE10ldeS1b9Bz3Mb7l1I3sUY8wv+yjDA==
X-ME-Sender: <xms:KwmrYj2EchvP9WXIWTSq50kvvHZEKwoFGGh7ds0chXpAK3qDKAZ84A>
 <xme:KwmrYiE4w6g9J6AE2tnFl3wcFqRuheeQN4FfqIxxeYui_gDrPuHVNtNadYHzE7BTu
 A4_G5cMtU2IkIV7e7Y>
X-ME-Received: <xmr:KwmrYj7kWJOZ_8zTAllUk0r9x8Ua9x3q0OPcy_Uzb3A7znq8K33njXWs9IMQkxJUhRLB4VI-vzD_t89OYa4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepieeludduudfgtdekleeiffeggeffteehfeduieeuvdeukefgieeileejgeei
 jefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:KwmrYo1O9Ath0o5TKlBKiTyfpbPRvDtEn0VY9b0lPcqy1EAn22IZEw>
 <xmx:KwmrYmHk14Fu5858j_XmvqfOmVJ4yj7qspzQoEeFNFCfWJeB9mXA6Q>
 <xmx:KwmrYp__bWhGQhW0gURLlPsISNENJY4cmj53h2u1GJO_KzNveRRP-g>
 <xmx:KwmrYiAalWDHKRuM6pZ8lIX4GYNADmFgIrwN9cdgKNKLw-jDxLdnnQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 06:42:50 -0400 (EDT)
Date: Thu, 16 Jun 2022 12:42:49 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] hw/nvme: add support for TP4084
Message-ID: <YqsJKZRpNEMUhdjY@apples>
References: <20220608012850.668695-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AOJ84mPuxl35mbYs"
Content-Disposition: inline
In-Reply-To: <20220608012850.668695-1-niklas.cassel@wdc.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AOJ84mPuxl35mbYs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  8 03:28, Niklas Cassel via wrote:
> Hello there,
>=20
> considering that Linux v5.19-rc1 is out which includes support for
> NVMe TP4084:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/nvme/host/core.c?id=3D354201c53e61e493017b15327294b0c8ab522d69
>=20
> I thought that it might be nice to have QEMU support for the same.
>=20
> TP4084 adds a new mode, CC.CRIME, that can be used to mark a namespace
> as ready independently from the controller.
>=20
> When CC.CRIME is 0 (default), things behave as before, all namespaces
> are ready when CSTS.RDY gets set to 1.
>=20
> Add a new "ready_delay" namespace device parameter, in order to emulate
> different ready latencies for namespaces when CC.CRIME is 1.
>=20
> The patch series also adds a "crwmt" controller parameter, in order to
> be able to expose the worst case timeout that the host should wait for
> all namespaces to become ready.
>=20
>=20
> Example qemu cmd line for the new options:
>=20
> # delay in s (20s)
> NS1_DELAY_S=3D20
> # convert to units of 500ms
> NS1_DELAY=3D$((NS1_DELAY_S*2))
>=20
> # delay in s (60s)
> NS2_DELAY_S=3D60
> # convert to units of 500ms
> NS2_DELAY=3D$((NS2_DELAY_S*2))
>=20
> # timeout in s (120s)
> CRWMT_S=3D120
> # convert to units of 500ms
> CRWMT=3D$((CRWMT_S*2))
>=20
>              -device nvme,serial=3Ddeadbeef,crwmt=3D$CRWMT \
>              -drive file=3D$NS1_DATA,id=3Dnvm-1,format=3Draw,if=3Dnone \
>              -device nvme-ns,drive=3Dnvm-1,ready_delay=3D$NS1_DELAY \
>              -drive file=3D$NS2_DATA,id=3Dnvm-2,format=3Draw,if=3Dnone \
>              -device nvme-ns,drive=3Dnvm-2,ready_delay=3D$NS2_DELAY \
>=20
>=20
> Niklas Cassel (4):
>   hw/nvme: claim NVMe 2.0 compliance
>   hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace
>   hw/nvme: add support for ratified TP4084
>   hw/nvme: add new never_ready parameter to test the DNR bit
>=20
>  hw/nvme/ctrl.c       | 151 +++++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/ns.c         |  17 +++++
>  hw/nvme/nvme.h       |   9 +++
>  hw/nvme/trace-events |   1 +
>  include/block/nvme.h |  60 ++++++++++++++++-
>  5 files changed, 233 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.36.1
>=20
>=20

Hi Niklas,

I've been going back and forth on my position on this.

I'm not straight up against it, but this only seems useful as a one-off
patch to test the kernel support for this. Considering the limitations
you state and the limited use case, I fear this is a little bloaty to
carry upstream.

But I totally acknowledge that this is a horrible complicated behavior
to implement on the driver side, so I guess we might all benefit from
this.

Keith, do you have an opinion on this?

--AOJ84mPuxl35mbYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKrCScACgkQTeGvMW1P
DelsKwf8DFg+vaeQZu2MNxt10tJHaDrK7aaoOadL1OBy2/rTOawCCFwUIcmivMiL
BSaBMccJQm/AatRGURX9Hr9xqwiywZGKabD1V+0826lnlr+O0aETrQja6VBqCYiz
Vyknt6VFUlBovItZaBCBqcHuAqEDpHlEV49+vLxRu2NPX9bdlRe10Gl5BCHPogIj
m0X9iRgfCH+JINZ70b0onN3hZfpBX9P8rmeQvWWP3wVio22aQkGBHSB0N0NtXu4J
1axASOpuhMKcB3IQ1DFq77gYI5CvXA4LiHrH8wPwNHw6DjdbzKgYoB9OBdsXTv0M
og0VszlhZbMFCnDUCSi8sT11v3uUHw==
=9KJs
-----END PGP SIGNATURE-----

--AOJ84mPuxl35mbYs--

