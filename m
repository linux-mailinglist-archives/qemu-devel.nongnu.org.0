Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788B8330C80
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:36:09 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEBE-0000oX-E1
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJE6C-0006Fu-U8; Mon, 08 Mar 2021 06:30:57 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:32977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJE6A-0008Nt-K0; Mon, 08 Mar 2021 06:30:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 20EB91FE7;
 Mon,  8 Mar 2021 06:30:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 06:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=mIDQYacffD6738NlrInCkoZcCG2
 ujBTMGh6n2+MsRIA=; b=ueMUtG6Bo+BKV7cf1wLgmMn4QuXas5c3DIkEHy4DUVB
 FY0d5NrdH64Q52SyVwrcKJ3uHuqdCFWwf1EZVWYS/xlafrOWaLLOc1GgErySd0uk
 vR4V5PUpg7hbr6oVB7ClNZMJoNDokKS1dNxw0+n27GiKMhSwqgJSfrPVgxrfULFj
 UpqK0FzR20NiLne+fZ4PJ3bqRC6F048fuu3emOkIvGC8cXPk9/9Gop+E+J9/BTvM
 ZNyNqIMeD8B7jgk9TuTPzIC2P8jj5+yr3Wqee3w2B5xmpuW4TqUCnoNx4vRRLza1
 GSup6ylg3DvtnQvELmxBNI59X71Je3Ssz1ZTavk7jOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mIDQYa
 cffD6738NlrInCkoZcCG2ujBTMGh6n2+MsRIA=; b=IrogAkGsYt8vKsNib7COL/
 68uuzm2ZFFcVb1z8FOc4xiTWbs49h2bWeymz6lZD1Y6QwslISrHwpQBXUElQsw1O
 B9GwenTRup8C6cYznxXNaZzqfzjeZaBbYOLi6HXUNuhwp8D/caCJ90rH8fywfbuV
 avTuVMZqiQWggwwBuM64hBVGGzpBdAsXJMnqcBY7sOUbkQnTRNEznlJA93JyxhF6
 gGqRYxh5SJCNhq14v3BwsOoCi6OUREVrzoUjKXtRitxRgue5njWfzw4VxnAwVDd2
 liBvGlzzwDwXPhD7df8yvdYW4yzmVOVsNybpok5c5MEabbdrms/5dZxTGGilCgKg
 ==
X-ME-Sender: <xms:6QpGYBnX7YZLy6iutiRZjhQFedIfwCSAjVEDLVnozbqxUaEAxkL4-Q>
 <xme:6QpGYM0nh2NwjN2k-8iwpVUgpOQd1pGjd13FLBgi804mJSM4gTvACcs6j9A2YG_wc
 mY2kQ903y79BmoY4J4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6QpGYHp4qjwrLSEVernQUSwbdlJGPegfOJ2oMBNivxPfog0FqelfPQ>
 <xmx:6QpGYBlULh5E9oDjDhyIHZhtfGaZa59n67ZBdja7rWpbLg5089DVXw>
 <xmx:6QpGYP0ImOr0ENaEnTPrZ99P2loFqCnwfSAZzlFXUdwBMVk-MogKSg>
 <xmx:6gpGYKSeNgFPq1VTR-XGb7YdYLxFGibZvnnM8vwc7ZrAS-nBBMhKMQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFE0924005C;
 Mon,  8 Mar 2021 06:30:48 -0500 (EST)
Date: Mon, 8 Mar 2021 12:30:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V4 0/8] hw/block/nvme: support namespace attachment
Message-ID: <YEYK5tBXDfGPQmiX@apples.localdomain>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rQN+0qKS37TGPYpx"
Content-Disposition: inline
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rQN+0qKS37TGPYpx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  2 22:26, Minwoo Im wrote:
> Hello,
>=20
> This series supports namespace attachment: attach and detach.  This is
> the fourth version of series with replacing changed namespace list to
> bitmap to indicate changed namespace IDs.
>=20
> Please review.
>=20
> Thanks,
>=20
> Since V3:
>   - Replace changed ns list to bitmap to not only represent relationship
>     between controller and namespace, but also avoid duplications of
>     nsids in the list.  (Klaus)
>=20
> Since V2:
>   - Added command effects (namespace inventory changed) for namespace
>     attach command.  (Keith)
>   - Added [7/8] patch to support asynchronus event when namespace
>     inventory is updated.  (Keith)
>   - Added review and tested tag from Klaus to all the patches, but [6/8]
>     and [7/8].
>=20
> Since V1:
>   - Fix to take 'ctrl' which is given from the command rather than 'n'.
>     (Klaus)
>   - Add a [7/7] patch to support CNS 12h Identify command (Namespace
>     Attached Controller list).
>=20
> Minwoo Im (8):
>   hw/block/nvme: support namespace detach
>   hw/block/nvme: fix namespaces array to 1-based
>   hw/block/nvme: fix allocated namespace list to 256
>   hw/block/nvme: support allocated namespace type
>   hw/block/nvme: refactor nvme_select_ns_iocs
>   hw/block/nvme: support namespace attachment command
>   hw/block/nvme: support changed namespace asyncrohous event
>   hw/block/nvme: support Identify NS Attached Controller List
>=20
>  hw/block/nvme-ns.c     |   1 +
>  hw/block/nvme-ns.h     |   2 +
>  hw/block/nvme-subsys.h |  28 +++-
>  hw/block/nvme.c        | 300 ++++++++++++++++++++++++++++++++++++-----
>  hw/block/nvme.h        |  37 +++++
>  hw/block/trace-events  |   3 +
>  include/block/nvme.h   |  14 ++
>  7 files changed, 349 insertions(+), 36 deletions(-)
>=20
> --=20
> 2.27.0
>=20

Tested and applied to nvme-next! Thanks!

--rQN+0qKS37TGPYpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBGCuQACgkQTeGvMW1P
DelZbgf9Eq5l2y/AeiBG4DlztFu1dc+5ziSHJe1KP3hBGirI+12ZHL99qmUqCuhi
9SaW4jGY2THQ6uyuT5mUD3kEIQpy3IncmocP98uzCwMcNucCvRFLCo+oFrnwvFm0
8bQB1N0kGFhg/n2DeH7DP1fMI2H0rsWI+0TgOWt9tMdtrVfM8Yto13bryTOn6yge
KL7tMfWNl80USHDJC6vFfHwZeXZbRnXLXbLxym0zd+A/QZ5LodsxslZbHW+dZ3ZB
JC9NIEBy/dFirimG6XxXtcEunX7LlJU+FK/cdVhcG74WG+VIKrtAKNj7PZTfVISJ
J24mKxG+gdPQcRHJPThqTZmp8TIuMg==
=OGA2
-----END PGP SIGNATURE-----

--rQN+0qKS37TGPYpx--

