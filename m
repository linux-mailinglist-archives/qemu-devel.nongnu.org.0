Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DA509DD2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:40:30 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUEd-0001nJ-LJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nhToU-0000EA-Bf; Thu, 21 Apr 2022 06:13:28 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nhToR-0007s2-2r; Thu, 21 Apr 2022 06:13:24 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BDC145C011B;
 Thu, 21 Apr 2022 06:13:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Apr 2022 06:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650536001; x=1650622401; bh=1p
 RWiSeaWRgcVgb4VDURnPNtv3oqDWsmUEVNM1t2b8o=; b=Zw5rmP4TdwO7Wx++sy
 pUo7U4AO3qArwBJKaJBQe5TpQXpoGiCkAlQULDzZFM9N+MCuoGqdjlWqAlakoVsT
 MWwOC5YIW9ng+kN+xTy7eF+Bn+YZ4OOBvxm8qw9LkKPN99zMOvEUz+a4iyptlbu1
 azmTJs135ZzHNU/5SQMj5hp4nWoDaEqtjZtKWSZ90Oxt5DpuIkl63QLQnM0hV83Z
 IfPTLX5c7BAmQw5KBs+cbSQ97e+BAQowwTqIfWQ8HSe2tpdEM3/FF7xvpb2wrRYi
 9DIe6uT117gn/2y9Q2ifPePFzblAKuaL7aT81kcwYrdNb1xr6OYBsiaFj1MrDYd3
 u73A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650536001; x=
 1650622401; bh=1pRWiSeaWRgcVgb4VDURnPNtv3oqDWsmUEVNM1t2b8o=; b=g
 V/ZBk7XFb6a9tsMtH6UID7on2uy3bMfNurqaky/UjmUcLzYcgUwAMCbaXvyzFeFf
 lq4w+zp6+ziT/wE66I5qBK+i/rGf8USTl0y6flbzrqfffC7UZrWCuaYUS2QYamEq
 d35X8kffPfh6NofXP5wFs8e4vtNA0KRcigpBbnazkMVlElHOlnvwzVzxVzOUF02o
 38g97lGZYRB0syzYtaZIq4HBSfsD80yGrKYcqcIDqIhOB0zeHno0pL0ykiJ65j8y
 zHusPPko46xLjMZ3VjIuGh+E1Y7zuSoeVwOvrDaHNBH1g+kef8b3ufWFId+wHbAV
 mGQ7/bi3IMUwYTA3js0zg==
X-ME-Sender: <xms:QS5hYp0r5J_fw7kaRzV0F2srJC3s0moEQvJxc-BgS0Rfd6BoapQUuA>
 <xme:QS5hYgG8B7b6R35WSYIWsnGGDgRsPsonS-v2pA0wcwMBKps63qp54-5XUk_UMptma
 hs7Nw1HL8b4dolm-CE>
X-ME-Received: <xmr:QS5hYp5KgJrLMpC5hTaX9bw3Hkw0smmmI37hhQOhuqvJdJ_T5Zp4JeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddvgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggfeule
 ehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:QS5hYm0lNR5OeZJCflfaVxIqvZmz9jIvdY07_jHGzA0tIjEBGqcSgQ>
 <xmx:QS5hYsGhAN_KcwSbMGGvGWGEA8OK8-tZtwQfrNjBO7xQzkbmlYA-kQ>
 <xmx:QS5hYn_haoEcNzfkAhxLqI2fpu-GIxyivgUN-DRylA5Xn0_8jYw32w>
 <xmx:QS5hYhMrBPh8g_FsrvnHLPJS6wQFCwNZcf7CV_ieBP1nCr75REZe7Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 06:13:20 -0400 (EDT)
Date: Thu, 21 Apr 2022 12:13:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH 2/2] hw/nvme: fix copy cmd for pi enabled namespaces
Message-ID: <YmEuPqJjLNGxg/s3@apples>
References: <20220420090336.10124-1-d.tihov@yadro.com>
 <20220420090336.10124-3-d.tihov@yadro.com>
 <Yl/ari5v/o8vuveT@apples> <YmBb//zeHrAT3Oj9@apples>
 <20220421074113.z7tgmubjf4ovqzhn@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DFmRLTDTyrW+EweK"
Content-Disposition: inline
In-Reply-To: <20220421074113.z7tgmubjf4ovqzhn@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DFmRLTDTyrW+EweK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Apr 21 10:41, Dmitry Tikhov wrote:
> On Wed, Apr 20, 2022 at 21:16:15, Klaus Jensen wrote:
> > Discussed this with the TP authors and, no, reftag should not be
> > re-computed for PRACT 0, regardless of the PI type.
> Ok, should i resend patch with only adding nvme_dif_mangle_mdata in
> the read part?

Yes, that is still a bug :)

--DFmRLTDTyrW+EweK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJhLjoACgkQTeGvMW1P
DekZ8gf/WFxajDvKA/K55E9SGvCuDIsl6V57BJ7rbvLzsjoHzq4z0PZ5Z77xCMGG
jIAyjdne7u8EmB4zZsMYjd8DtTNb79PwiSyOyRAjbzC9wIObFeJIH2RO15Jw3wtd
EiIu+KV4f6Hys17sjfgI7cIMWfrbHbR9oGG2eLrwx9p8tsB8DbWGKz/6kK8bqsTm
m9FT1ufXTbYj5XzXpHUHD7WXdeFw/D6BBSowaEhKny6NXOAg7Pg1k0OcL01a7Lpe
nNFj62Y1wr/9EE7pXABq+34zS31MYLDHW2ctajj4ypaenNQMs/I/ebhK1iCP09f7
pI9s+aebMnJmU+jSl1q+hWx9zHQjPg==
=BvTr
-----END PGP SIGNATURE-----

--DFmRLTDTyrW+EweK--

