Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD73602D6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:59:24 +0200 (CEST)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvyF-0000FO-Ah
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lWvuE-0007Cq-4b; Thu, 15 Apr 2021 02:55:15 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lWvuC-0008B1-83; Thu, 15 Apr 2021 02:55:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E029710F3;
 Thu, 15 Apr 2021 02:55:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 15 Apr 2021 02:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=PAjWlWj07Oq0AInK7sTKWAwMte9
 hWwaJEaYOUXeYveU=; b=wEJ0HPZckOZD+tsOt5h36aWtUwTldVRJ5aIgnS2zxQl
 UI63K8Uhomfvo9Us4ukB9ZzJ1g7glzSwp/qI4EIgMfh+TtZoguhCZeTTGoqql0LB
 YH5gAMyzi1ctwG1Oq0KqaSYudNTaGI4oUrccQtBNcp9gCmW2FG2lpoSEhQo2mU58
 +Nx6V8Tju3sUNNCftGo5MVmCmqQquxigfoaNon7FsUT6qKwbq+KXmJ860WkY0uUD
 FHvH+lpf773pi/LhbbzYe4TX/J8EUogf2MDxI4xhRoK/ea1ajyASw699vkKETGSu
 2tz7iHny5hnL0J8LRaKHiVvJkb/orqiJHNyvK/nR/UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PAjWlW
 j07Oq0AInK7sTKWAwMte9hWwaJEaYOUXeYveU=; b=XFO8LlkL+h3hC8mWsrFbbj
 kDLxbeCCtsRsW6ENII9GvfgQy4v5O7Ayy8avtjNB2Ecs+fAE8VlNfc6+7PNQSxdz
 vHzDDwN6dFYuFpDa/cWDPj/yjTRz15ABkvGF/tlfWRzypRTx1fi7RHNcMNFSQwex
 HwkFFGu+p/XwYC5wGG3IZC1m5ufVtrrsyukNI+neuQ0EjZZzeKs8wI7i+iJ3Ja7N
 64XJdGuvIwlA5mbN0IBhmKX18OykX21K+pTBHDkL7kathrTYlU3GMqb9mktJwJ9C
 B+EainC/8BJb3ORtc+atqGLC9oqsywXX+i5AYGSRaH3xOkl95wovAM9ofa1zReEA
 ==
X-ME-Sender: <xms:SuN3YNW1uRQ9W10In32kysjSJwL_pHxAv1swHTKzw_HlYYh6ihTc1g>
 <xme:SuN3YNnlwUo1lclbTqcIucJDgDDf6NtuurncygcYGNOgUYfW6nQEU1fim-4RjtvIS
 W2aQq9mnR87hFeOVkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelvddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SuN3YJYrfBIcT_fFPJU16_rGIhe0M9Szf4KlHRk_8cTWRlvkB_6-9Q>
 <xmx:SuN3YAW_MvUZaZsb-RRfWxzqupARpXI-giKT3BWvTE8bGFabyGpGOg>
 <xmx:SuN3YHmXGakZk_5unnEQkyk092kqhf38wOhsuccWjz_3LGo9PttI9g>
 <xmx:TON3YFWYxPc3_ALh3v8Miw-0MleI7NIi6mj-szXzdHua05kHtnMmoQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8DBD71080064;
 Thu, 15 Apr 2021 02:55:05 -0400 (EDT)
Date: Thu, 15 Apr 2021 08:55:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 2/2] hw/block/nvme: align reserved fields declarations
Message-ID: <YHfjR1KMzUsJXgWY@apples.localdomain>
References: <20210317093006.31404-1-anaidu.gollu@samsung.com>
 <CGME20210317093452epcas5p1be6015c3cec5c7c8a82c779f511d8bd0@epcas5p1.samsung.com>
 <20210317093006.31404-2-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m3ijzIU9ld2z1r+Z"
Content-Disposition: inline
In-Reply-To: <20210317093006.31404-2-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 k.jensen@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--m3ijzIU9ld2z1r+Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 17 15:00, Gollu Appalanaidu wrote:
>Align the Reserved fields declaration in NvmeBar
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> include/block/nvme.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index fc65cfcb01..e5bd00bb85 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -7,7 +7,7 @@ typedef struct QEMU_PACKED NvmeBar {
>     uint32_t    intms;
>     uint32_t    intmc;
>     uint32_t    cc;
>-    uint32_t    rsvd1;
>+    uint8_t     rsvd24[4];
>     uint32_t    csts;
>     uint32_t    nssrc;
>     uint32_t    aqa;
>--=20
>2.17.1
>

Thanks. Applied to nvme-next with a small commit message fixup!

--m3ijzIU9ld2z1r+Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB340YACgkQTeGvMW1P
DelIBQf/THZhlzHlI6302NxF6fTYxjmoG8D1ZuoipxDQbx9xphOc6UW8mtxMqytZ
eVdm8/rHd+efn4eDEpoafzx6/3lcR8MAJx7s/Wyf0ne0e1uVgq5PZVhJ1PvFDTJK
Q9U71u37D9VdApte4X5+GXNXDOpB2kPdGeIZxp4v7RWlBVXYUnmTvOKyP8ze9IBu
sm74HKnC3lsddGERYU2xGSBi72TRHoDMfF4qublFykZT4cuhzhYGEEyd+VF+hH8O
m4ZnlapMZYBCboZUchEHYG6pgfzlZZvnIsIHXNE2OAXCMJlD1MfVWFieTWx4v5MC
NL3cZ+5oHYcTRnyVF6NDNyqLpgvPwg==
=WuSa
-----END PGP SIGNATURE-----

--m3ijzIU9ld2z1r+Z--

