Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970922F7399
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 08:18:31 +0100 (CET)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0JNO-00005x-8K
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 02:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0JG1-0006Ym-Fc; Fri, 15 Jan 2021 02:10:53 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0JFz-0002NY-RG; Fri, 15 Jan 2021 02:10:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DCD4B5C0125;
 Fri, 15 Jan 2021 02:10:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 02:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ArolEwo01ZbuT+rLEpy9pb9czvt
 T/fTWC47RWLk5KU4=; b=f8o0p1Qs2JI5OoRotibg5DKyzYL7tBe4uj7J8UVqy4h
 FeRba/2PwHiAYja7OTLlAzqzISmos9i4BjgFUUkkJkSu39XI3dqU0psJ6d7x/yqM
 dAnVLMmmfIUuG3ko4PENxpR0CAcWEiw79yRGITHcAL7aSMfz64JFi3Uxk8Yni/UU
 5Ukjydtz4hegE97chZR+mx73CVRxNhyK6Uhd0qAPLS011q/K4hi+Hk3uySgYxskf
 ljrEbEHgYlyeGkmiFKSCV2x+accRLoykAz6qgCT2j35tzg3a+ucvsuUBf43thF5O
 JW/NAuZXGvWzm70G6DTBAYAJbjpbdP6CxqKFVgZW3NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ArolEw
 o01ZbuT+rLEpy9pb9czvtT/fTWC47RWLk5KU4=; b=VzFd8WF+qTO5C46yNxj+JE
 B9OjL9hzqoUVeJbe2azOU5mW3zS47mK7OmQdSnNdmy7IwAwu93WSwkcw6gF02WN9
 jwiokJWvtZAqsHF7ZjWbnBSHI57irV4MZrL4c+BM33BUlQk0XXCEcfBq7jDhaVRH
 okKnw6oIaL1kfWz2+5LALAVro651ZlqaQzHtH6Rvo/4G/QdG/q/wZNjIyduEr7/k
 EtvZ/e8F8IX73K0RqcRV3htEHxRWSB9u/btAHk/8GnaIjOpKuqMFGXlKJ4s0Ia89
 NjfRrOJ7O000fXIIfy3k8VPKUvI4tZlWfAaAyLMcp6FN1ovgae0i4eP2vUxA5N4Q
 ==
X-ME-Sender: <xms:-j8BYDeGOOZtrOVYAvZ_HlQg5Kt54UQ_Uv-5IeZ7gQKeI-mVViOgXQ>
 <xme:-j8BYJOrUIPDHgIgaHHoocePGyTK5rCOEeUdJl6E_MT7zMlWds7NS-YLj_myGcDAg
 ZqhAyuEXrNPdAMsjcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-j8BYMh3YwBy8hpiIEyU0x7Lf0FTM7K2W7KyQhSNmgMxCJzEfR_hVQ>
 <xmx:-j8BYE8cO6n17Ezcz8AX_nZ2__ou6ftoCMNW8xMNp20b4fZVexRhBA>
 <xmx:-j8BYPvLsQAsgKcK_dDQBsSTIESDNddpHfJbp0vu7AghN6Q3Af7RJQ>
 <xmx:-j8BYJLcHrBKiG185Y3RJvFdO7Zj1bzafO6UxmCwTy-RU7AEOjM1Fg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1FAB224005E;
 Fri, 15 Jan 2021 02:10:49 -0500 (EST)
Date: Fri, 15 Jan 2021 08:10:47 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/block/nvme: conditionally enable DULBE for zoned
 namespaces
Message-ID: <YAE/93O2HjTJXBG9@apples.localdomain>
References: <20210111180952.112488-1-its@irrelevant.dk>
 <20210114233928.GF1511902@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jr4oirwRm7X08uYW"
Content-Disposition: inline
In-Reply-To: <20210114233928.GF1511902@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jr4oirwRm7X08uYW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14 15:39, Keith Busch wrote:
> On Mon, Jan 11, 2021 at 07:09:52PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
> > status of logical blocks. Since the zoned namespaces command set
> > specification defines that logical blocks SHALL be marked as deallocated
> > when the zone is in the Empty or Offline states, DULBE can only be
> > supported if the zone size is a multiple of the calculated deallocation
> > granularity (reported in NPDG) which depends on the underlying block
> > device cluster size (if applicable) or the configured
> > discard_granularity.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> Looks good.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>=20

Thanks! Applied to nvme-next.

--jr4oirwRm7X08uYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmABP/UACgkQTeGvMW1P
Dem9EAf+JQTKGA8vpopLYcJBEAt7WD6ng7Puxq32OiEqxPFjZZHOSFo3vhO5yxP8
GWENwt84CStPh6j9icOo6RtJIRBrepq+OgqYGE4L5zV1fD6Yjx7B5xLarINsPdpk
nd/qTrSyTkOCQsCsbnzVFidLq0HUDNUTbRhakM+CGSSzJ6n3V3bhz0fnDYAGSSH9
T8TBzLZXiLNtj2YSlSaYmQkEZ95aaha5zX8mq1xVL1iRd7ZFpSXeKKG7hSEyMOO0
ZK21pd9Of1XcyPuDSRA4w1wdfMz4lUEhX6H74yMxjQ2xNJg9KRmh5zIaCSrtnjxt
llv3Z1wS6dPc3znm2vBGpOPN7ulPBg==
=ioSq
-----END PGP SIGNATURE-----

--jr4oirwRm7X08uYW--

