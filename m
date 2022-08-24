Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71A5A0299
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 22:18:45 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwpn-0000v8-Kt
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 16:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oQwn9-0007in-FM
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 16:15:59 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:53705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oQwn7-0004be-6W
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 16:15:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 884313200ADC;
 Wed, 24 Aug 2022 16:15:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 24 Aug 2022 16:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661372154; x=1661458554; bh=yc
 A4GChyn3Id2hxYmtQl/tdCoCaMzMP/GlO6kIYTmrw=; b=iPgzcGoDVFrn5RAvRc
 8YVNYjW3NHDEsYGn7ZOGFbMGq7XEVJyh4eMtNfie+Uuu74aK4lA0XOsGJujb2aiN
 KpzPNQM4sWq/dSBpn+wDIAJelzW5j8KT95STH8xqObatMjmMe51Kh7GQbv5LvElc
 J3SmMBC560wueviuiLqVT+BV0eBYFPQzVl0e7fedzDOreqNBeLxW7jY1vVnu7tFj
 C6+GBuT5loWqS2zYy9iofpaecVdbnux/6zxLn4gs0E8bm/Fv1InVMRt0vJlw92Jr
 j4W6k1nZrbN4rkJEEJwgcenQFVf0umgMKBlJKSxDJToBI/imLie2xyfwaLrD+LfX
 BW6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661372154; x=1661458554; bh=ycA4GChyn3Id2hxYmtQl/tdCoCaM
 zMP/GlO6kIYTmrw=; b=ZuhpQTBjJjuFGDNL1Zk4vdA9u9iTUpsUxhbcMCFzjLi4
 a6g5m+o922e0nqwbEoTspW2cpDCxEY9pXi4kxXQW9pfA7+U3o4oBZq8EbXULu1rD
 qOEppMKD5j8IIbzdV6uQecyHoYFdkc5h3hH5rQVk1BB2IfKm18pAw4JD33eahoyy
 MtkArKWjV9CUU6Io4+AhWuxvcurvs30D9q28SEwmDnQ+XpiCpKJv7hnZKdqx1gCg
 cKLowyam9ztvNIg5b315eKLd1KMtSKHz9I5+pQCUjhAbS9cFS2Sep+6IiO8IuZJJ
 kcsFaDV82AHHKErREUkYNJDulB/wj+fOfvJE3Jc3dw==
X-ME-Sender: <xms:-IYGY-0ikey2xxpy-EhDCeboT-3c6OWsfKpy8O94o6koHABmBMztog>
 <xme:-IYGYxHpnh-rHkiB_lJhA9Tg5WIJRscQxd5WSxxXZQbFozjbhKkxUys6nB8Ypmarv
 Wsm5T9wGUUQpOiF0ds>
X-ME-Received: <xmr:-IYGY27aGs3nYKGX8ZvKIAiFRQU8Ks0-D6hjhAjwHELM0JZeeof5-FfvWCCu_lOK2sWmP-_UB0C-N4v8vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-IYGY_1A-Xoa2R7qD5oQXPsyvAflUQWcuUPqTHNKw217Uq6pZ_EuaA>
 <xmx:-IYGYxG-A9gOMd6TFOJahZZEWv3JHXc-YwNYHwScKkVOtcIclJ2y7w>
 <xmx:-IYGY4_P7cyDOc53ZExtf_jdCwMCM4cCVA5zxZaCqH6VOyS3XTbH3Q>
 <xmx:-oYGYxD45NRz-VLwsDdRZrFwhR7nY8_Am6t6C1MdqPbz2t-EuZBh5A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 16:15:51 -0400 (EDT)
Date: Wed, 24 Aug 2022 22:15:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com
Subject: Re: [PATCH 0/4] hw/nvme: add irqfd support
Message-ID: <YwaG9sCILU66Q8XB@apples>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="klz1x+3qAI7Om9r1"
Content-Disposition: inline
In-Reply-To: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--klz1x+3qAI7Om9r1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 11 23:37, Jinhao Fan wrote:
> This patch series changes qemu-nvme's interrupt emulation to use event
> notifiers, which can ensure thread-safe interrupt delivery when iothread
> is used. In the first two patches, I convert qemu-nvme's IO emulation
> logic to send irq via eventfd, so that the actual assertion and
> deassertion is always done in the main loop thread with BQL held. In the
> third patch, support is added to send irq via KVM irqfd, bypassing
> qemu's MSI-x emulation. In the last patch, I add MSI-x mask handlers
> when irqfd is enabled so that qemu-nvme knows which vector is masked
> even when qemu's MSI-x emulation is bypassed.
>=20
> Jinhao Fan (4):
>   hw/nvme: avoid unnecessary call to irq (de)assertion functions
>   hw/nvme: add option to (de)assert irq with eventfd
>   hw/nvme: use irqfd to send interrupts
>   hw/nvme: add MSI-x mask handlers for irqfd
>=20
>  hw/nvme/ctrl.c       | 251 +++++++++++++++++++++++++++++++++++++++----
>  hw/nvme/nvme.h       |   7 ++
>  hw/nvme/trace-events |   3 +
>  3 files changed, 243 insertions(+), 18 deletions(-)
>=20
> --=20
> 2.25.1
>=20

Hi Jinhao,

This series all looks pretty good to me. And, incidentally, it is also
super cool work :)

It can use a bit of clean up (the code duplication mentioned previously
by both Stefan and me) - but all the logic seems sound to me and my
testing is happy. Following up on my suggestion to drop the MSI-X
mask/unmasking, I gave the logic a thorough look it looks sound to me.
I'm gonna see what I can come up with for qtest. I suggest you just keep
going on iothread support.

Please post a v2 (all 4 patches) with suggested cleanups and we take it
=66rom there.

--klz1x+3qAI7Om9r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMGhvQACgkQTeGvMW1P
DelThggAxUFmfPTiKb1xc8iNlpYikv3u6O1c2aOP/1vb16nAlNuNgDt+D0giSX61
nqWNxThW1xvmr8OfycCVy8xox/2tSiPYJ8RQJSbOiPfJ2oHJXDBwdAThB8380xX0
fUZA/wqPLGBj0Q6a6VSnW+gtKtemzNVitB2zfZhgiBckNpMb//dkaSnZdPt2BLDi
uz4zfOWMwuDgaHoBmlmrgEWshnyiPpah+8Plq8/vOhXqZqYZLjx8ECIRi7jZ6Q3H
cs2P+U7Mpo7f4+0eqrdXGD0ZNDBpXkGszsD+QcQnu0EdjmnsKYvG2Qajp8yu15Jf
FFrSeoSCe+msWIk7tRUIpbg9wP08GA==
=1DRb
-----END PGP SIGNATURE-----

--klz1x+3qAI7Om9r1--

