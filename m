Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A738D410
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 08:54:32 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkLWp-0005xQ-R2
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 02:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lkLRA-0004Ke-UA; Sat, 22 May 2021 02:48:41 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lkLR8-0006op-VN; Sat, 22 May 2021 02:48:40 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1AD17FA0;
 Sat, 22 May 2021 02:48:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 22 May 2021 02:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wwxWGq1407zEXdu3Y2VfSnc/4iq
 lDG0DSlR7pm5ersQ=; b=A8PJd0lwtwbaETURQRDDxcLUTJS4cl0BLxyi04DIHMJ
 qL/F778+oKryYtj1DA5AWnckyYXxm4K8W9t9xmupiFO8O+2RAfHap6aNnSJc7urJ
 JcMFC9tNz3LRpVeUqc4cVg4M2OU2Ct1Y1uJkc26z0HZ73oUkuxwxCcLCU2LDmRy9
 OzRc6FPqKnQ9+hoiTbJ+8c7NZ3rrufYR9ypFeJGa8F7jNIcN1o61cBVQQM2bBe/0
 aoJbayNLOjSCIkcVoP9OescbybpZZC2GTSCuLzvPqbenSSQQa/avI81q9IGFvrWH
 q4pKLA8iMgIgENk6gmjDX+16E8YLharjevbmUDB2yEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wwxWGq
 1407zEXdu3Y2VfSnc/4iqlDG0DSlR7pm5ersQ=; b=vs40Y+p+5sC7sVZ4riqmKA
 7SKQCK4hvWOvyRWLhcoczjl3Z8Bh7CVk8VppH5Wa5uSs8FUvW8vLp0hT2+9qxo7A
 vAsddBNUZdO9NANOdy26blvez0JuuHi+6Nf2UHbeA2cBH1R6POGci7x4/P5ZRNei
 dZ2hNCEVd261WUHM39X8GxkVxGxSO32eaJtAY4k2ZBZOQVydV0VlV+e4JP7uDuRL
 dXtvNrryZ1zHLGDZ9G0iIDIsv6mcHjOMckvRa3ZeKcdUrd3AFCKSURZVEELhUinh
 WgMejyu2kk5JMvq+he91RLigUZXsHNZHg+Bu75n0SqlVxImsflUGKDZ1t5+PFAug
 ==
X-ME-Sender: <xms:QKmoYPaq0cwdC6_7C3AgtnvK0UitOJUxpt0sqKs0Z56oMp9s49x03A>
 <xme:QKmoYObqnMv5TuKmMga-VSSk9M_qIBlR1CiZBOS2Yx4dQvgmV5ClBKo6xqZAf64T6
 M2mOWuQ177bERrzv9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QKmoYB8AQ6R0St_7iOI6SWv3kNt1fNGAQEMXprG39y275wMhQYwruw>
 <xmx:QKmoYFpTGmYgh8opJRfBmyvCMJSF2NZiIMS2dIkS426JNhzvlF-jdg>
 <xmx:QKmoYKodVD-GboRBUV042rAn6I9Tnx5Z0dvWj0mv99PHr8n_ULnv3w>
 <xmx:QqmoYKL6To8V0lBcr8X_q26r9AkC_c98GEX4YQdq8mWNS29uODBlRA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 22 May 2021 02:48:30 -0400 (EDT)
Date: Sat, 22 May 2021 08:48:28 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 0/3] hw/block/nvme: fixes lbaf formats initialization and
 adds idns enums
Message-ID: <YKipPAwxw5YiDu3i@apples.localdomain>
References: <CGME20210421125407epcas5p1f843d6b3035e05805de4bb410c93cb71@epcas5p1.samsung.com>
 <20210421125100.12789-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1peJTSDw/AoNUfWd"
Content-Disposition: inline
In-Reply-To: <20210421125100.12789-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1peJTSDw/AoNUfWd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21 18:20, Gollu Appalanaidu wrote:
>This series fixes the LBAF Formats intialization and Adds the
>Identify Namespace Parameters enums to make to more readable.
>
>Gollu Appalanaidu (3):
>  hw/block/nvme: fix lbaf formats initialization
>  hw/block/nvme: add id ns flbas enum
>  hw/block/nvme: add id ns metadata cap (mc) enum
>
> hw/block/nvme-ns.c   | 51 +++++++++++++++++++-------------------------
> hw/block/nvme-ns.h   |  2 +-
> include/block/nvme.h | 10 ++++++++-
> 3 files changed, 32 insertions(+), 31 deletions(-)
>
>--=20
>2.17.1
>

Thanks, applied this to nvme-next!

I squashed up patch 2 and 3.

--1peJTSDw/AoNUfWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCoqS8ACgkQTeGvMW1P
DemYLgf+MckvmGvgRUMOw/+sCaPll2qnW+wGLLK9SYUj6d+B2G3araxO36FzFPFP
FTOFq5GmDYm36R/7bqFrkyQSl9TfHT9eNzHAnYBkFuXpcIO3X2mbjF/CcNw837/0
UZyT1HIY/hh5irA9Zo1RgVYuNHUK8wGA3UIa+20uqdN66FIluhTgEfkJ3DjvDebx
Z5QE6B6lWXIT/8ieCXKK7nqQRsTmF/J5U0G0H9+rLlm+D+Q7Gek3KNBF4nWOetXJ
QGxjUmmaoCEARCZcYV1vvv/l+PMydIQo9U8nzyPpGFIb2QDM0mxoCOVAODW9Rtx5
8BR84R7Jnyf/WIPLigUlGHq1NKbjnw==
=TOVs
-----END PGP SIGNATURE-----

--1peJTSDw/AoNUfWd--

