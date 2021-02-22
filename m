Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9832212B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 22:16:34 +0100 (CET)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEIZE-00009q-Ie
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 16:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEIVV-0007vH-K5; Mon, 22 Feb 2021 16:12:41 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEIVK-0001Ml-IJ; Mon, 22 Feb 2021 16:12:41 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FE445C01F6;
 Mon, 22 Feb 2021 16:12:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 22 Feb 2021 16:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uKEHOKGIguewwFIpGN83JpcAWUs
 M2UyKSY/2K94fBW0=; b=bc4RJHnxZin5mFxpS163CjFliqEb+7IGBhcFoqeMe6o
 5GHXOV003+LF/5y5sxpE5k7H2we9IU+U/XnsBSRbWUu1Z977JPwNSc1VBPvdmLtM
 6sj3vqYpgi7sAD8iPXdk4E2Oj0Il/W+D/pA8Ydcvu1fcYZ4anOuZLgFTs0E75fRB
 X49tav8e9XFTD14fZ6fosTQOFSy5xzL77ngE01RdsoEr80EYzQ358nbIHiqhyns4
 0KfdUe5ruKk3n1YhmT6ixbHlXGtVhQ89QFUYQTX6NWg44yNJ6d9qZ9P7gk39GA70
 MbOuqUj56wKqTmbOjaxKwU0iQIWg/0Fhso3kAhlcGpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uKEHOK
 GIguewwFIpGN83JpcAWUsM2UyKSY/2K94fBW0=; b=WXqiUHkvexm3YZ8gEGLED9
 m3odlDWxNELrQFwcf08BB5J1E//gFOUnrPGxb5N/vO6U9+T4blXkG0y3hUaM5pQ6
 wq2hRvHXNSNIGVu5myNxvYtnWEJRRf8Z6oUcYTx9Z1spAAXjD9L2qu9mUGUd1hq3
 6IsXcqhxoacOl95cgdbSzPnkZKz1aFTyuR3tPXLZtOI3MvZhtEIROdagMB1ukznk
 D/daeCdHudJrq4YBEciZLieM5OjUfbuPVfVocnl7IhKWIf6ODb70pHLbe2FhmCPf
 9OtYtlPS2O5sBv5l7oWZrnm1y1dd8NzXX1QiIKhudngKsy9S1nXehXTJ5Sh4iGnQ
 ==
X-ME-Sender: <xms:OR40YP39lulK9PrmsCAj1ttDQrt2KJHGiVkNDcrexn3JjbhB54iyrA>
 <xme:OR40YODzLBEJc65ryNpTCKXdYFLzmIKAIIUKZ1zZ60OYS0azOXXYqD4ds8e3bAArs
 9NxcfJUzGLL6RRwOsc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OR40YMwL5GZx7A1u67HXUqAhelCM_CQSHZ5ayt5LvMl4POPeHZrJWw>
 <xmx:OR40YMk6bTuZ-WxLQTSj_kJMH-itvV3X6ZsPkp1V4pjXGtXcNe1CYA>
 <xmx:OR40YBGnnf4i0GvjGMtZM5jELosHhZQ2O_-hhFTVF37nvQuRRSFTzw>
 <xmx:Ox40YFL7xZmtbF-ETrWJa7P-3oEB_Dmkn8J0w6KGXL_MDc_w1TBFGg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 49FD124005E;
 Mon, 22 Feb 2021 16:12:24 -0500 (EST)
Date: Mon, 22 Feb 2021 22:12:22 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 5/5] hw/block/nvme: report non-mdts command size limit
 for dsm
Message-ID: <YDQeNpjTCvYbKhjh@apples.localdomain>
References: <20210222184759.65041-1-its@irrelevant.dk>
 <20210222184759.65041-6-its@irrelevant.dk>
 <20210222205506.GB16253@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OXGLSuv3BSvo7SmI"
Content-Disposition: inline
In-Reply-To: <20210222205506.GB16253@redsun51.ssa.fujisawa.hgst.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OXGLSuv3BSvo7SmI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 23 05:55, Keith Busch wrote:
> On Mon, Feb 22, 2021 at 07:47:59PM +0100, Klaus Jensen wrote:
> > +typedef struct NvmeIdCtrlNvm {
> > +    uint8_t     vsl;
> > +    uint8_t     wzsl;
> > +    uint8_t     wusl;
> > +    uint8_t     dmrl;
> > +    uint32_t    dmrsl;
> > +    uint64_t    dmsl;
> > +    uint8_t     rsvd16[4080];
> > +} NvmeIdCtrlNvm;
>=20
> TP 4040a still displays these fields with preceding '...' indicating
> something comes before this. Is that just left-over from the integration
> for TBD offsets, or is there something that still hasn't been accounted
> for?

Good question.

But since the TBDs have been assigned I believe it is just a left-over.
I must admit that I have not cross checked this with all other TPs, but
AFAIK this is the only ratified TP that adds something to the
NVM-specific identify controller data structure.

--OXGLSuv3BSvo7SmI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA0HjQACgkQTeGvMW1P
DelCkwf/fTXbg9nJ3wdhZPTwH+luV2lssfEy6Zkr2K4HDvda2oT3ElD/YmVRE+4R
w/B+yCvM4AZ3PTYth15xG+fXAx8zk0OYGj56y4Up19w+Vw9rhheZ8Qz5WAL+k9Ej
4XwNvRaf8Sd/t0c0I8+E6cAfoXY2B7ld9QCa0tHvHcnRm9bzaYb/SNMg/DmWbMIn
OXSEVnopA1c1ieoKEBZgvs1fakrrPjcRcOCb4DmHVTdg+MIWwXcOrFfZUCZfT/0l
Rfas4Si4LKyB5a2FVFMeFX/yp/lu54/8Y7fe6tcbHvGTPa+x08eLMCTPbiuCK7m4
WP9LfdE5skYHdOIpvF8Oauoh/F6n0w==
=+1EC
-----END PGP SIGNATURE-----

--OXGLSuv3BSvo7SmI--

