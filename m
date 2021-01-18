Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7A2FAB61
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:27:00 +0100 (CET)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1b75-0007Xx-76
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1ap1-0001dD-RN; Mon, 18 Jan 2021 15:08:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1aoz-000068-O8; Mon, 18 Jan 2021 15:08:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EFAD75C01D1;
 Mon, 18 Jan 2021 15:08:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 18 Jan 2021 15:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=08SvWdujVmXK8AbDHDKjjlcgL5e
 WNUXl/mewYwDXHEI=; b=H/La99ZcCRw4o4cQD5bm9K6VGT83BkcDmlKiX9HHvUx
 qdMrFhUATTa3RKPArAxjlS6w6SrC/ViQp/r7PxrcRJGB/faoj4P+ijDC53XbwpG8
 BgtAnIwKgRpyk7shRcbD4TmFLBm/pb8yTzPS+D+F0YvrnDsuep9iMu04RedDULZ8
 XrEw7gkK+yy9h2HHV81N+4fIrHQZu5nxBm0Q6mOETfDR8mOBpQg2E6NYKCbkacak
 RllKrtFkWO2kkLxSyjnanU8yVp7rmaPOiP1uQtTaSXeI7yKST7CpX6EBpVIlueIK
 gmBcUzR3kC9wMAgTBYzSLG6fVNFYzC5xA09p9MYu6mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=08SvWd
 ujVmXK8AbDHDKjjlcgL5eWNUXl/mewYwDXHEI=; b=c/eKXjqf7rmPZyMH6zh31Y
 3r3lfz59yYjP2J3qM2KVP5v79xkew6zFfH+5cFM0jTtarDcPWxiD3QjcbLFEesI1
 Uhvb8jfx6w2ZtS5O+xuIVtWyH90JuUvr079pq1xj5vrR60D2u/Toq7IT++n6uhBG
 1Y09JU6Yq3bggErjSEgkvd5nk50Yqu250MavTVtIFGEyg8mjwy/D8i+oOJgVCChU
 ZMbmv5EnxpiPGn3ZWN0gbEYjGLj8wwoKSXtPRilc/R3lmb1R+esPYFuCrHUv0xrc
 spI2K/K4imBVkOjxGrVbEpy0HX3XoNhP3MrX9WkTqE1hnjpSZgu3AkvvbiZnTNew
 ==
X-ME-Sender: <xms:sOoFYCHFqEMBKljugTUmF4UxbmNT6uS8nwW9GcdTYwmQQSy8k_tZLA>
 <xme:sOoFYM9H-KMb1Meq9f0Vl4wYPSJ5sV5q8fej9M_pQMqDxkQXBnLQDe-qgOWvBhCa8
 OgHxCmGLmF_hr4Bxpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:sOoFYMKE4EcaLwIaDtf-aMeIPSFtAQZnNEekJWtYEU5WrIhwEhU52Q>
 <xmx:sOoFYPbaNCVzjZIWUlZg2Ekd5fYISVhJbQS3nTqTtpvLU4mkj0BwJg>
 <xmx:sOoFYGLCzGs6-6-OTfVZr7FaN5NIEWAFy0V5XL7WhEA_cQ9gNWGM9w>
 <xmx:sOoFYGDc8Dl3qnV2E8yEO4fPtAXiXyjXljOSqy6SY1lKD802NZxzwA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7173240065;
 Mon, 18 Jan 2021 15:08:15 -0500 (EST)
Date: Mon, 18 Jan 2021 21:08:14 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 04/11] hw/block/nvme: split setup and register for
 namespace
Message-ID: <YAXqrhvRSwrfCAGR@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-5-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qQuxChu7WxrGp3r5"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-5-minwoo.im.dev@gmail.com>
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


--qQuxChu7WxrGp3r5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> In NVMe, namespace is being attached to process I/O.  We register NVMe
> namespace to a controller via nvme_register_namespace() during
> nvme_ns_setup().  This is main reason of receiving NvmeCtrl object
> instance to this function to map the namespace to a controller.
>=20
> To make namespace instance more independent, it should be split into two
> parts: setup and register.  This patch split them into two differnt
> parts, and finally nvme_ns_setup() does not have nothing to do with
> NvmeCtrl instance at all.
>=20
> This patch is a former patch to introduce NVMe subsystem scheme to the
> existing design especially for multi-path.  In that case, it should be
> split into two to make namespace independent from a controller.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--qQuxChu7WxrGp3r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF6qwACgkQTeGvMW1P
DelIhAgAqN7Z5iEJLuwpMNA7QiXa5caNxZgYmuzCWOCKKwg7ZkmC4k1rcbHmNf4U
rF6BcqkGaeItogpR60D8O2k5isCcC2yDuUrI1dgfIdpdgQphOVePWyHA565ZFC7G
xgELxtPZinrDKKiTx1zp6FniiwGrSJdgx/zpABrTNmuB2aCnkNQ+r1Zz/u2WFHsF
u/QHvlmEVO2TWN5WWczVcXTVjvpXYovIGbUChhC88RGKWNX3yQTTkBAWqJuR314X
K7WGrOe+odfFM9XwD80HUB8o1eg8/ALOt1OpVPS9LbF5n6diQc29UWjYCAb1pqGR
TZllyd0Xszd9MHVynx7CdGlrtSaeeg==
=LCmp
-----END PGP SIGNATURE-----

--qQuxChu7WxrGp3r5--

