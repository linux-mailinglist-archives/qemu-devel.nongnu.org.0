Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D53163FB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:37:15 +0100 (CET)
Received: from localhost ([::1]:54336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mry-0008M8-Db
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9mmc-0007O3-Ud; Wed, 10 Feb 2021 05:31:42 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9mma-0003Ly-P0; Wed, 10 Feb 2021 05:31:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 42C9CAD3;
 Wed, 10 Feb 2021 05:31:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 05:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uPxHPhRDZ+y1+gBaPLRwVZ5sL1z
 SqDCQ6RckV01pY3g=; b=wrrMQ4qW0eeIChm6LPLH0E/5uHB13hKCiVabIMNqK6V
 Irfbm6G93FJTNR15LC8pSGE2tibpDc1ZnwG26aZMw4vDs7Up2msHckUqI5ewGE8G
 8GjZLkOmZnC0tkSizCjqxG1tigwzBNaBAiUrrHcEESa4uLrRvrKtm/Vc1X+8N6qm
 /8AZtKOonrJ+2liOdUfbMH5zAaJNYVF3AfzuflpJ6p65b60/ckUEQeIVFkku4ARx
 +XzFaFxV9rSOXspJ6JwLDo/KEw+8Us+OOJ+va/Pw/AiK/PioaeE8YNCIwc37+Kxo
 dyTgwR7po5uTbE+Mx54zc86LK9qBaEvFwjDOSIF0mxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uPxHPh
 RDZ+y1+gBaPLRwVZ5sL1zSqDCQ6RckV01pY3g=; b=uDiVf65yKpBQ6Mr/SBZhnc
 1+UWHypD3I9M3VM5E8BJDOdq1y3TV84pNAtRPiPXVchaxau3P2jnpsny9oBK7Vyp
 rIEuYd/LHZgHc+R9zFmIsTS8fJ4d402nbLmg8DgKftlWQRwow9A3yxad6+X1dfuO
 SZlHefUmXxUh9dGC45LDKOsEdkMlKdb/SmYDxT55sVr4vFOVDaVL7D6YCncYEbbg
 oxkDBJ1DUH6w1Xn5L/ZKxFklH4/dbNgtdAI9gN4hjMR8wjfL0XFc52sIc38m6rq6
 rb/FI7OUJKzjI7+/hDEqmie04m5WycMpn05DVcgcmFyeFzRd5bfmrOv77YuU/86Q
 ==
X-ME-Sender: <xms:B7YjYDJIQFU_T-wXk-EEQJ7TvGNbbOA0hGrdSIt9b3y2LEb5pY8bMg>
 <xme:B7YjYHLFST8_v0fgfEtaAW_j3zBUdgfVG5wuJ6ga_Mk1WbDtb8Wpl_KcIqlhgEsSq
 Auly4E1OdMvi78BfME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:B7YjYLvVRRL8C3XKDkpHqYZAdrSSXGWE9DQ7LbdugFo1n3DjpNHFyw>
 <xmx:B7YjYMZuCf3IOwC0X-A7AqqnZVNGhHy12u1FNfMm2_5r9UqbaizjXQ>
 <xmx:B7YjYKbSVUXXlgWEJM-DrswcJu7-qKeGiZHEBrieYNTZuV3ULkeQZQ>
 <xmx:CLYjYPMd-Eey2IrJZ_63zR_J7_0-RjlYTShRKrbRpEgpUIzbdcdPHQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A11E524005A;
 Wed, 10 Feb 2021 05:31:34 -0500 (EST)
Date: Wed, 10 Feb 2021 11:31:32 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
Message-ID: <YCO2BMwhJE/yoNav@apples.localdomain>
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
 <YCO0Gy6ZKY5qGZgT@apples.localdomain>
 <CAEUhbmWB2PCYbe2Dd2Ui8C-=dE_FDjEMApDf1GkXzJe2LBQkRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wrmEb/xewX8ONfKh"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWB2PCYbe2Dd2Ui8C-=dE_FDjEMApDf1GkXzJe2LBQkRQ@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wrmEb/xewX8ONfKh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 10 18:24, Bin Meng wrote:
> On Wed, Feb 10, 2021 at 6:23 PM Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > On Feb 10 18:15, Bin Meng wrote:
> > > On Wed, Feb 10, 2021 at 5:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Current QEMU HEAD nvme.c does not compile:
> > > >
> > > >   hw/block/nvme.c: In function =E2=80=98nvme_process_sq=E2=80=99:
> > >
> > > Not sure why compiler reports this error happens in nvme_process_sq()?
> > >
> >
> > Yeah that is kinda wierd. Also, this went through the full CI suite.
> > What compiler is this?
> >
>=20
> Yes it's quite strange.
>=20
> I am using the default GCC 5.4 on a Ubuntu 16.04 host.
>=20

Alright. I'm actually not sure why newer compilers does not report this.
The warning looks reasonable.

I'll queue up your patch, Thanks!

--wrmEb/xewX8ONfKh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAjtgMACgkQTeGvMW1P
Den9Qgf9Eg0R6XKl8kHtvKxQILWuqwAawfZiF0UnLIxaLuoNcWx6RCTsR3rchuww
sQjgGTLjRtT0TDJPTuN7ODn0jp+MYazIjtLV9aBPlLOs/DioyhweR72jZZO2QB/8
h4kRuOANq0RIDjTVrmWphc57qA3PtEi+9V+kFzrc49cLyTLtZBVFsBeYpCX9dp/K
Sj2Wa6WJTbC7G1mWm/onaGo0Ol2tmVhchKHCOgkEMHgo1z64RcJtgIEj5OWQbzvD
N0VLvoY+mpgHZTowtDGP4yadMpUqUph04+dke5gKf/BGI/qU0myvsFhKsT3bkj3X
iHa46FY9aXpFHYgQzFW/mRFWXjq5SQ==
=CMYz
-----END PGP SIGNATURE-----

--wrmEb/xewX8ONfKh--

