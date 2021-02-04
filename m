Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F55C30FC54
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:14:08 +0100 (CET)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7k4t-000553-Hc
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7jQB-00087r-U6; Thu, 04 Feb 2021 13:32:05 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7jQ8-0003D0-97; Thu, 04 Feb 2021 13:32:03 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DC6845C006C;
 Thu,  4 Feb 2021 13:31:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 04 Feb 2021 13:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jLNBGOFZQU5Xz/3Bc3G10sQPgY/
 PITk0vMCHbfc2Sqs=; b=tox+IgzIFaXAsz2F8EDmsQ4iuQaqq4cLt3YmLCkowO9
 0ulYeZAh9WFDIdQOzhta+0F38kxmiSvr3iuFUQlrX5h+dsE8je7Sd6gBaGEwoh2T
 /9DiKuCj8o+LMuhrnatIaKd/YaZnmKWWDfGZI7ZJck9np3bHTcZDeAnyTs3FULTf
 67Oudi92Zj8M5d43bJrwj1zS7DP1d5emut6Zq5Oli/UZC40JTaI34jo5MzG5Usud
 bSrHvcHYY3Hd+GWA+Rmt3yVQNE29epy/+8jJxikx5XGk3QdwZP3uwkacCzWu6xQN
 rxuvKoU0+m4h++p7+5mBkEOY/iwyI7PTK/ueunb5GJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jLNBGO
 FZQU5Xz/3Bc3G10sQPgY/PITk0vMCHbfc2Sqs=; b=fOWppz12Hg00FLf7jWEEpz
 F7HuqwoEEEQbeYDNpQ5SKRc9JMSst2BhQkUFOQ/ozvOaTDGW64pi2N7oYzjOXw/k
 q37MWBcw+pZ5qRtrxdRPdF4jncu5m2BGNLiYOr9gbbp3LgudMqWiHBLFFeOHqC8b
 s0cByY7s2X+O0qVGl3ytLu9AUiW35QEzOCZS0kTfJCxGZ/azEYVVFuH4ZkWYJIQ5
 llW/srgNvOu/+D5BjhKSPSTOuJ3laHjSMX4SvvCMTtd1327yXBfhqHcr/2eSoeEm
 oP9IS4eqICj4uwTmANTmGEd0U5seCqWQlEZxwXi6hsmjjvLT7SMWVCO0CsteyMaA
 ==
X-ME-Sender: <xms:nT0cYHevSWnExJeQYhDYaOVx0NCTm4rMZyuV2XJQUNpDJgjmZuq1lw>
 <xme:nT0cYPMK23fh1pSDLCfHrl9Y1TSxcI_OcvMUhWWT5K5cF-6NUnijvF_G9mrdGn7WM
 wqPTEI7xyB1EHC0zdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeggddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:nT0cYJ58kw7GQda1W0UnGKtrn3bJyVdgJ7QdNmrDR8JCFc2apmnQcA>
 <xmx:nT0cYLL4jj1y3jGAHkZD8EwktSQTDg1nQ5W8hi8BW_8w2Jm29i5rHA>
 <xmx:nT0cYLe8Egu91weFGglOnh0A5SUdB0joD7XXm7D7gkO2xfkmwCRigA>
 <xmx:nT0cYHLuG_1AADx7jZ9eNJasgsu6NUHQS9QmU6AAOXWKO472GkvzgQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28DDA108005C;
 Thu,  4 Feb 2021 13:31:56 -0500 (EST)
Date: Thu, 4 Feb 2021 19:31:54 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YBw9mvw3xzT7SUMe@apples.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZGzHnrUNII2j30Dq"
Content-Disposition: inline
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--ZGzHnrUNII2j30Dq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 24 11:54, Minwoo Im wrote:
>=20
> Minwoo Im (6):
>   hw/block/nvme: introduce nvme-subsys device
>   hw/block/nvme: support to map controller to a subsystem
>   hw/block/nvme: add CMIC enum value for Identify Controller
>   hw/block/nvme: support for multi-controller in subsystem
>   hw/block/nvme: add NMIC enum value for Identify Namespace
>   hw/block/nvme: support for shared namespace in subsystem
>=20
>  hw/block/meson.build   |   2 +-
>  hw/block/nvme-ns.c     |  23 +++++++--
>  hw/block/nvme-ns.h     |   7 +++
>  hw/block/nvme-subsys.c | 106 +++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme-subsys.h |  32 +++++++++++++
>  hw/block/nvme.c        |  72 +++++++++++++++++++++++++---
>  hw/block/nvme.h        |   4 ++
>  include/block/nvme.h   |   8 ++++
>  8 files changed, 242 insertions(+), 12 deletions(-)
>  create mode 100644 hw/block/nvme-subsys.c
>  create mode 100644 hw/block/nvme-subsys.h
>=20

Thanks Minwoo, this was a super awesome series.

Applied to nvme-next!

--ZGzHnrUNII2j30Dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAcPZgACgkQTeGvMW1P
Delaagf+K+wG6ytd6VPBRYKvaSR4O6aqfnONOdAOVBd7j3ubl4YI+TwEPZParXy0
iAuaSvGxPW7VTlz4LrxTYZ+fkTEAgl9ZbEgwetALt5xJpGasvxw6kfFng4TcoCK3
WSo65uYWS7g8vALBdEEtCgro/LOH122YMrzuzpKttBnz/XYWhHnjZTNhpt4y9afF
CLiNALU7hWLeVmllExwD1MMXMRlTwqWNuQ9+cQHWxPYZmE8aRgQ/OL5C4Glvgdfp
azPoIqyTPzXwWgb5epuBZ+e9aNPGfD/jIFo1kQglnZakORuDBHAQkpnqWt1rGSBn
PDejKHb/UPa5L8iR+q6JhlDIiLLjLw==
=EfQ3
-----END PGP SIGNATURE-----

--ZGzHnrUNII2j30Dq--

