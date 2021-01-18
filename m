Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A72FAB43
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:20:55 +0100 (CET)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1b1C-0004uC-GG
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1amj-0000fb-IY; Mon, 18 Jan 2021 15:05:57 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1amh-0007gt-S6; Mon, 18 Jan 2021 15:05:57 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CA5FE5C0200;
 Mon, 18 Jan 2021 15:05:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 18 Jan 2021 15:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=VE7ju3dTDQWo8mtygZahARtqMZs
 ph7vhScydflgcRos=; b=3BjIAYvLXWfu8eUJp3TuMA+nAzdqy8E6PA2rgk9Oxsv
 TkY283Z+5YyL8z1ormDca9uaYA9O4nsAh8NpBJYHROwoRTglQQb3vJ4eQcpXw2ac
 YJw4u66gRHvI1qt2ZFw7+g6K8kXUAYVvKC4nEkoO585ly7XbqA56CTdK4ADEM2D6
 iGKSinTprR3V0av0Ku74gQjoUPUoRv3r23tGkoOxQoaK4L9DZkVyyQ6Yc0uqUn/p
 USg5gORRpwBOHx07XUdLh4inNj8VcML+ZIRWzOO+6ixrGqPsIuzeUExLrgYYB2lT
 IcFMPJ6Hoaf3DysY6jHsFMUVApqPmQ9CnRxkmbLlSlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VE7ju3
 dTDQWo8mtygZahARtqMZsph7vhScydflgcRos=; b=lW011QDl0dEB9PDomIgk4g
 afL90Hk1/+0VIIP81V2oyreJqS+jpIJwb4cAIOrWjjo6WPBDIAf0yiRieeLRo4pM
 pKMCITOUmz0PhXownPm+bxK3XRKZQJ9F0vrI1H1kBUdeziIhZYAXHofrSUcgSslh
 ktBkoE9VZ2qRDVBO/HgeLS5ZOrNRoJDTK57xYxwOva9ksM4pkSib9/3UAG4rPxN1
 zH2nu+PHIR8LgYnUixQLM8a6D9XnfWc1ydRbxq9MvKmxYLaEp30yXSlJA0D63AEZ
 RTX2LiAvpHK4PAeiwZ9gq1hmlkWDI2e+Ih8xjkEHHtcmsINJOeUBv1WQv+8bGwuQ
 ==
X-ME-Sender: <xms:IuoFYIkDs8tpv5ajTTO_QYRYWQ7zkVlIoxSjakuAyHMKFbFKr3VDCQ>
 <xme:IuoFYHwYJwlxZVwtCOaVU_3PF9rmQkekXhzy8B4anro3-9ugJJOZNAyTNd7-hTwei
 QASdGhvPM2KgfDIhfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:IuoFYDjKGcHNLlXZmE6XJXsxGdmy0T-JUWdX4MebeR7MASGt1ZpDew>
 <xmx:IuoFYMVW9CAQcSUT0HBWMsRLGTf85iyT6zSPF4G2wpfVs2KLnBh8FA>
 <xmx:IuoFYF35mHAwYF-jaz41S9IMlTp9_5jXfiWSR9iOtEch_tY8PcaaeA>
 <xmx:IuoFYMZotxFC3Vytz3-RkR0Ojpx98h0qpI2eEHSirlUA8bbkXFBtYw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5592D1080067;
 Mon, 18 Jan 2021 15:05:53 -0500 (EST)
Date: Mon, 18 Jan 2021 21:05:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 03/11] hw/block/nvme: remove unused argument in
 nvme_ns_init_blk
Message-ID: <YAXqHhznVnsaeNd+@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-4-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9bmq4VPHVlKO0hsi"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-4-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9bmq4VPHVlKO0hsi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> Removed no longer used aregument NvmeCtrl object in nvme_ns_init_blk().
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>

I don't think it's too unwieldy for this to be squashed into [02/11],
but

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--9bmq4VPHVlKO0hsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF6hwACgkQTeGvMW1P
Del9wQgAlrrYGXdX7lwuTUEs5K97XU+RiGBivLvA3Im7DoPFVvYIO8hA476OZHKL
yDUTKd6SPRBLrcRTsc6ugauB7n5mJJyuk0LhNdJ6A3LPl740DnoG8FtAJ+aMNULE
KIwklhQjxV1j+W8CqU3ubrMgfToir2zNRkHqOmgzehP7pATpqEw//e5T+T+6yYu1
ZCDKwDY+83KBKnNYyWTQOA62AqtPJcThcQynEdK1x12VYzyjGB8LlnH4j1CegRMI
1ri8ZDmg9MSWW16cDjlb/TC76YXCZbO0ysD10/H3819ANasjSZkEdsbYk5vubpEs
/igj8KdbkAFEQpnyqE2mJ+b0cvgsBQ==
=gNLz
-----END PGP SIGNATURE-----

--9bmq4VPHVlKO0hsi--

