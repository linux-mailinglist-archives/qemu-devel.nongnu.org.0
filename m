Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA35A2184
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 09:14:12 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRTXf-0008CH-0O
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 03:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oRTV6-0006L7-0p
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:11:32 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oRTV3-0006ss-HT
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:11:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6DDF432009B7;
 Fri, 26 Aug 2022 03:11:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 26 Aug 2022 03:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661497885; x=1661584285; bh=QN
 7iNcYSyMl5bTtTezJOGoylJFvU3dm+yCm8XYCHbpg=; b=o18gjuEj1txNkk33ju
 edashzjx75jDfbAv3H2bvDnQEogbS0/WLrOc6TtBaL3pu4UzmLayG+1w/W/SsQMf
 vf1cuc6vnnXFqroBqvC2oaEhD2YlCnwimdlB1N/gU2lMNde6/jNKgaqKAhlbUwP+
 w3ufSjxCK3h6Hp8RSnL8bRcZK0FcBpJCyV4LBfxPigMkkyx9z2M2wltktP1UF2qz
 BK0CO7V1i5BnIVZ3+tuzfWTm1eiNtCVl2mxSRZ54SIRoV9QXlCvA2XgVADmBlmPZ
 O2OyPrFT5yOu0t+qKaNPmMa28UvObIFKCUBJR+q5qeCDhhPSniAbswHc1KlTAZnw
 4IPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661497885; x=1661584285; bh=QN7iNcYSyMl5bTtTezJOGoylJFvU
 3dm+yCm8XYCHbpg=; b=MsTbZHDYHvfUGyOGUlpRChlkBKYg8sFrNiYT6XDxYLOn
 5mX71GuydPAul1zLG5EqNSA1qdekPiGTo+fyOjO35mNReVop7Jpznyf3K0g+5ww2
 ELNawje3NUPkb3gLyExBmt627b3k+An0zGoZGJxxrYHBYUd1R0Pqo0JSGo3FdE9q
 ncmuBC0/WhhPavDxuKUjBYJNRLGo8UqYCJe0EmtbgDGmz0unvWqIejze5XM87rcd
 N5mUCAu7cGnRM0L6Xg/TwbgjIUUeez5+3TDjvjQkbKznn6c9QI3q/vEML/TH993r
 vfgHYz7Mm63ZmybRWuzOkrLAqqdkTFCtVCoSaVgHOQ==
X-ME-Sender: <xms:HXIIY3uYvxm3NeOAGO6PvCDnuSUZ-WTYMVST2rQ61C-aHf7wYUJ-zA>
 <xme:HXIIY4eK7Jx0iZLf2PiCFG5_AlXA2-7unsUmuntpfyiRQf73YDMVlga8QFgxCEjeo
 YC6QoYyN9ipxB4N1ZY>
X-ME-Received: <xmr:HXIIY6ydABPjFAJyRF9sY4919EepIiXurYLpCXTZhQw7pWC44DtXsJ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HXIIY2MWX2yBpdqD18T8r13jaFLZb_22YwKNke2wgSlB5yyKlAPFLQ>
 <xmx:HXIIY38-IUy1sb-SkAMxPzFnqSXC5wmunY-RW1dllByFSvdxdfiLBQ>
 <xmx:HXIIY2VSSIgkLQkU5UqhH9TQK1NRzfgQI9Ur7lM_ElspZzUCdCltGQ>
 <xmx:HXIIY5L8PxzsnXJ5fMMnJJeWb5FPW0c5Mvqe3u7voalpSTkyKcQPmQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 03:11:24 -0400 (EDT)
Date: Fri, 26 Aug 2022 09:11:23 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH] hw/nvme: Add iothread support
Message-ID: <YwhyG3JktHitinMW@apples>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F1Gl9/RntiiSC3Dc"
Content-Disposition: inline
In-Reply-To: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--F1Gl9/RntiiSC3Dc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 20 17:00, Jinhao Fan wrote:
> Add an option "iothread=3Dx" to do emulation in a seperate iothread.
> This improves the performance because QEMU's main loop is responsible
> for a lot of other work while iothread is dedicated to NVMe emulation.
> Moreover, emulating in iothread brings the potential of polling on
> SQ/CQ doorbells, which I will bring up in a following patch.
>=20
> Iothread can be enabled by:
>  -object iothread,id=3Dnvme0 \
>  -device nvme,iothread=3Dnvme0 \
>=20
> Performance comparisons (KIOPS):
>=20
> QD         1   4  16  64
> QEMU      41 136 242 338
> iothread  53 155 245 309
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++----
>  hw/nvme/ns.c   | 19 +++++++++---
>  hw/nvme/nvme.h |  6 +++-
>  3 files changed, 95 insertions(+), 10 deletions(-)
>=20

Jinhao,

Are you gonna respin this based on the irqfd patches? I suggest you just
add this work on top and post a series that is irqfd+iothread. Then, if
we find the irqfd ready for merge, we can pick that up for the next
release cycle early and continue on iothread work.

--F1Gl9/RntiiSC3Dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMIchkACgkQTeGvMW1P
DemFzQgAq7T7IoD01Sd+UZ5eD3TkAusWJ9R5q06UGat2fUMtlsClowml+QEbzGOI
R6L/9RP5ejxyhHCP83gCl0tAvUh2grbe+7W6QxeIZ1EKS8rOrdRyM5lysVyFkotH
PRswnOCBUMGMcqy9dvStGFjglCMAZdyyxXzWZHEf7sVUadrVoP63H7jUqvfOlMKN
PVaOX7wHvmDzB4KwFEBZXTHjQGlvvTfpAmtTAqnvOfNVxC61QPesWmMC//MuOLKt
k6oA+oDP5AMe3GpGaFZSSdsDKobBq2ZFGCJlQUBhlSWQAoCOkr8bTJpOMEx7R3Sf
42feTthla0bRaHGkfB4nwcmgXjrnSg==
=g/n7
-----END PGP SIGNATURE-----

--F1Gl9/RntiiSC3Dc--

