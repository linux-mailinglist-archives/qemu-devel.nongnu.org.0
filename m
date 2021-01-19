Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B82FB627
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:55:46 +0100 (CET)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qXw-00040T-OJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1qSN-0002s1-Ja; Tue, 19 Jan 2021 07:49:59 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:59937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1qSJ-0003Zy-9c; Tue, 19 Jan 2021 07:49:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BFDE65809FE;
 Tue, 19 Jan 2021 07:49:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 07:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=VijykbsMY1rPORD+14C1VdWVZNe
 nWNuup9qnmHgvMzw=; b=lUoovaoc653mplg4CFAIoFF5ltuXSdB7X26iaayd0Cr
 hun8dehhQ00DjM3nitwpLF0SaAwnreMHFlrjuu1UfmwS4C9YK78WQcC8mgQJBu6O
 +q8EaptSabWCcZtF7MIUZpcxwMT1xaIJXqDSBSTiDN2oPScoZuQzoqpX9qtUDBHg
 D+6TTTleouffoQzYkhnpRy6efb2DfIPDPFKJXxIpFdU/lL1ppiucToOd3aU5hfYw
 ws7syLwP1/bH94NPNPmaIMkqGG4RbYqBGkMSh8d1GXoDHfRQUm/7eA7vzeYuaJ6x
 2CquUTCMpzjboZ9E2y7/dSYXJCJVJ+iDAD4x9dKZfvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Vijykb
 sMY1rPORD+14C1VdWVZNenWNuup9qnmHgvMzw=; b=LIqnke7gMO6i4sE9tGb4J6
 ojcBupYeBe7D8SkZmZlIMv/Iy/ji54PDRxKxOI/a1LBD//w6u3rHG1vacJdLeFuc
 Z0bvj3BrB3agzfT8PBpqL4U0ap5oV8ReUu+Ffl8jwnpL7s1FVS/Qahf2kshFR8Ad
 Nl+MMXDWmlyBWp1mRcp/G3e/4jRBz5SgcxDsE9a1NJiVCHhMxUpRIiCnbnU8qeIp
 N9pP4uvy/wmeQ7hiQlJFqeUIHfvPXO2wI71dEuldy9YpYViuOh2mWrEhx06byY1a
 OpaERoFPXuISAka0Z0kZ3dAb1XYK4TIKoXDG+C50L+O2fNHTh4SbCM2p0PLj30OQ
 ==
X-ME-Sender: <xms:b9UGYPLEfNYOs6__6Bov7y-JOiH2RvGSDwhKvss-8dAgGONkqrbnBA>
 <xme:b9UGYDJjHx-huu1kbhW1k2mr7ax7eBqqVfrCYM35JMjc4m2PWfYkVd74iY634uOPY
 5RTXe4dc2gCS7lNSXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:b9UGYHuA9DhhshBVJK5m9cBLfSFNISNJLjVzDKJm8ZlDL1_uB91mHQ>
 <xmx:b9UGYIai0EsdyxW3qDLmIL-g83jMzEe42Wa8mSJoQL7AX5gPc9nUFg>
 <xmx:b9UGYGZbpf2Zw0A_ThWW2YrzDGuPZ_0ecjGDYqLTweT9tAWfVKIR2w>
 <xmx:cdUGYMN9gO7JvZUS5Mqu3xzeFjVOTsszYT-jji8A8P_EARTrYD96SA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2087224005A;
 Tue, 19 Jan 2021 07:49:50 -0500 (EST)
Date: Tue, 19 Jan 2021 13:49:48 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v3 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <YAbVbNHktVpi372T@apples.localdomain>
References: <20210119101504.231259-1-its@irrelevant.dk>
 <20210119101504.231259-11-its@irrelevant.dk>
 <20210119124450.GI5939@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eG9KEtOO8rRKtkMi"
Content-Disposition: inline
In-Reply-To: <20210119124450.GI5939@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eG9KEtOO8rRKtkMi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 21:44, Minwoo Im wrote:
> On 21-01-19 11:15:02, Klaus Jensen wrote:
> > From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> >=20
> > Implement v1.4 logic for configuring the Controller Memory Buffer. This
> > is not backward compatible with v1.3, so drivers that only support v1.3
> > will not be able to use the CMB anymore.
>=20
> Reviewed the legacy-cmb paramete, but we should update the commit
> description up there as we can support v1.3 behavior also, or you can
> update it when you are picking up :)
>=20

Oh. I did that in a parallel time line.

I'll fix it up ;) If that is only thing, I wont resend ;)

--eG9KEtOO8rRKtkMi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAG1WoACgkQTeGvMW1P
Demb2wgAtke5xs+Z1FDl3sqVDOSONkhpzLWq9rpeFqrFZL6qy2eQKQX+6/8vTlUr
pT3gD7XcpS5RP3YSWOfegl0yThIkUKD3UBYBw0sGkaUS2ucwMGFGcUUima0M113k
PNv7uQjjT0syja4QLeXxkrFNXPzEYL30H1JRYPorlgSNONPivYTdz04oVu56M1Op
IZHU0ewiLVdHnJGEKEJGiRq/nqJ3vFPp2wdltuaRNVYLCYI9oPr93nEPpgxturhL
vT48GbuRU3XAH8cuqs39T2233ezQkxkofx+ih7aHP4HUgudzbrP45BCFW/fBh/z3
fmlOR+qi8cm7DSLChXaS8RWe9B5Imw==
=diIz
-----END PGP SIGNATURE-----

--eG9KEtOO8rRKtkMi--

