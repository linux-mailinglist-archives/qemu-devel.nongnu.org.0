Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BB12FAA38
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 20:31:47 +0100 (CET)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1aFd-0007TC-2l
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 14:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1a7m-0006cj-LQ; Mon, 18 Jan 2021 14:23:38 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1a7k-0000ZB-IK; Mon, 18 Jan 2021 14:23:38 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E14B75807FD;
 Mon, 18 Jan 2021 14:23:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 14:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7DpePfuKJeDuvf3w/CejnghL5JR
 53EvnlhH0MXILIc8=; b=1fAl9QH3igzrsiZ+p6HkauW9lok1Z4lmP5/NGZl9gY1
 70SnAUzqy9AhmEIAwwdfjuRjVOu051xr1FkUCOPE3SQxBL1C3iwSFC/4au7e7wjm
 COhkM0ufhPXTZtmRalp3lvVmXyLeQWqYujFgYF2pAjf1VXMyxKCQ2zTo9z+GC+nh
 j8r6zhUFRqzGhUFTmvs7G3vQff1FEgFWGZu1MjGalnDpnrPXDCIK4Lif1y9drWFV
 VHRsow3/6+TsMAy+5v85y+kdIuablMcup1IJD6n1VnRAkQY55xpiZl5brLM0bDt9
 Auej7HnCs3sRH+aiuhT5Aac7B6VMJPDVq5M8alfklNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7DpePf
 uKJeDuvf3w/CejnghL5JR53EvnlhH0MXILIc8=; b=Kk3nkzk++6DYkEJAyrELgb
 EiAXT/UA8CH1x+4G9bq/4DSt+yXcvUGi5zw3CsTb3avFVDuAi6mjkPhzjWQdr5Jg
 M4Sl7/KO0ys+jAD+zhB1wU9uvVNRRRyWLj5BJ/PCquKYKk9WMVuM0a4XcLJxgonM
 DB/Z76CAF9pTfV68L28030cGQbQGu583bvgLHEYOtn4yUXQoSf/0W7ewhocCqbqI
 WQnik0i6djB4ClkIsUKxdOgGtq/6ktK6qgTcSM0Wgql3BF8Gu6Yp9YBEJkyJJIbz
 WR/4TyMSwmGinaGcg6HPWa1pMVgx7BIiGo0hIntIiks+sdKs0FTzGTC1iynn0hDg
 ==
X-ME-Sender: <xms:NeAFYASSawVjfHsikxjnbaOnDyS7q5Ny3ilNvstuLg0pr2tMZCITyg>
 <xme:NeAFYNzfok9RA2vuJEEXJ9iHASKpo1Qn8rREEXyk5HeNOg19pBL8dfOXxI_ve6eJN
 gym8sv7HvbKD2Q1cQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NeAFYN1QqVtm8bg6fwH9_oItK996ij5kaA2z6mglRtTZpFuG5sPszQ>
 <xmx:NeAFYEBoXZzr0eWuncewmGrGraOd2qUleMnMOf2cNn-sM-FvbrKU4A>
 <xmx:NeAFYJinslZrcsZT1WvdUVtsh92VLsh_ocKfNzEAWX8nt8ZLCI2egQ>
 <xmx:NuAFYKUqclSYP8ptvvXCFPnRtNymWc_r5d627g_UCuCYKuB495i8YA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8DFF7108005B;
 Mon, 18 Jan 2021 14:23:32 -0500 (EST)
Date: Mon, 18 Jan 2021 20:23:30 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <YAXgMluXNBuIaoPo@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
 <YAWHSaXmpo64xmmp@apples.localdomain>
 <20210118130946.GJ18718@localhost.localdomain>
 <YAWI2sFftUEspcT+@apples.localdomain>
 <20210118131205.GK18718@localhost.localdomain>
 <YAWLi/ynEMfyQ66T@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V507rhvjKIZUG5oW"
Content-Disposition: inline
In-Reply-To: <YAWLi/ynEMfyQ66T@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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


--V507rhvjKIZUG5oW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 14:22, Klaus Jensen wrote:
> On Jan 18 22:12, Minwoo Im wrote:
> > On 21-01-18 14:10:50, Klaus Jensen wrote:
> > > On Jan 18 22:09, Minwoo Im wrote:
> > > > > > Yes, CMB in v1.4 is not backward-compatible, but is it okay to =
move onto
> > > > > > the CMB v1.4 from v1.3 without supporting the v1.3 usage on thi=
s device
> > > > > > model?
> > > > >=20
> > > > > Next patch moves to v1.4. I wanted to split it because the "bump"=
 patch
> > > > > also adds a couple of other v1.4 requires fields. But I understan=
d that
> > > > > this is slightly wrong.
> > > >=20
> > > > Sorry, I meant I'd like to have CMB for v1.3 support along with the=
 v1.4
> > > > support in this device model separately.  Maybe I missed the linux-=
nvme
> > > > mailing list for CMB v1.4, but is there no plan to keep supportin C=
MB
> > > > v1.3 in NVMe driver?
> > >=20
> > > I posted a patch on linux-nvme for v1.4 support in the kernel. It will
> > > support both the v1.3 and v1.4 behavior :)
> >=20
> > Then, can we maintain CMB v1.3 also in QEMU also along with v1.4 ? :)
>=20
> My first version of this patch actually included compatibility support
> for v1.3 ("legacy cmb"), but Keith suggested we just drop that and keep
> this device compliant.
>=20
> What we could do is allow the spec version to be chosen with a
> parameter?

Uhm. Maybe not. I gave this some more thought.

Adding a device parameter to choose the specification version requires
us to maintain QEMU "compat" properties across different QEMU version.
I'm not sure we want that for something like this.

Maybe the best course of action actually *is* an 'x-legacy-cmb'
parameter.

--V507rhvjKIZUG5oW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF4C8ACgkQTeGvMW1P
DelilQgAlJaHlw9ohBmvhDRJ78OeyQaQ+PTuVr3AXcW01gpPsntFnaltdjHqLIxy
Lp5GOWtamLruiI/uyENt7fXth2PZoZxsH5Weai/W9dcNEbuspB8N7stvj0zdMUZw
+tCgBL1AFAzD0SVn4+Iu9+lkpo+LYJfWXJuMh2fVhVQob4epUA/O8Ey9+mnasY80
LPl2HXbcI0YCATL4qG+j80cNqpzGOKclakj7k5WXq0XyBquuQWKNPTCendiMpLel
+ls2V2Y2vHHx/aUYFi9Nj5ck6wHE1YBWUOb2ByzqagF575IIY+y/iCBmwSWg/MDk
ra4lTMj/AfE3xfrknONBxVzOf6R8Ew==
=SPyw
-----END PGP SIGNATURE-----

--V507rhvjKIZUG5oW--

