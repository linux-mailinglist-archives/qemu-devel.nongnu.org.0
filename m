Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D405315FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:48:37 +0100 (CET)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jIi-0003W6-D3
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jCn-0000zA-M3; Wed, 10 Feb 2021 01:42:30 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jCk-0005LG-NF; Wed, 10 Feb 2021 01:42:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 65106CA9;
 Wed, 10 Feb 2021 01:42:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 01:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=SZH7UGI1rqhDFqpLTgyUA4S6jPU
 1h51B482X6hX6A1o=; b=0dbVRqCInef02ClDMmmthOTYngDxwHH7OiU2JEpf/2W
 qMIxBryMDry3IGBouZZeCrQYS4the5nN67/JPcq5WQc+DbKHfVFxqrwTYvGDeDiv
 sai9qhrjwhCGtLcv2NTbPEF4cPzlxejofX2HrFNE7k2MbANl6PCY0E/1VumubuaH
 D+Or6V7h0X9lOPRnaoT5T88Z13TwhQHZ87ay7i5TVFSBu5Qx3JU1MyRTMhlwtPrE
 qNGieR/sZKZf9F9TRY8EFg0wpnuVMGJT7YVojmAdbzSiLycmTp7Ki//RHhHjbF+o
 Ig+1oLL0CXJtT54B2UXEZE3JB1AT7i2fRYuwEKf9oYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SZH7UG
 I1rqhDFqpLTgyUA4S6jPU1h51B482X6hX6A1o=; b=YAX/DypC6CVIRP0C6YsQGL
 JCDXuRoUA7LTVEgGqAz3EVSacKnEFGWjqLEenqIzfkSPdDzxmiBzbiykOWJrh04M
 MHqy94enMKsu+TYrR6EW1gjDq1m6vDlqsCBndlSkrA6R1VxtHfcor32Nf9x/Jbyr
 SspKNBG0tzI+TB0T9PZJjCVnwAdNSjfBdMwOHnwvEa7iKTGGopBBtiisRs37oJHg
 iFMaHITHJMqTFoc5JhXnic7exXgSikz0ec7CP74VRqGOg1KHqI9TPQJi3Gr2KeeS
 On99blyzToJn+BUVcagd4ZfjiUamWHHry9Ql1YF0H1Rt+jlEtVldDdS7r23Pb7DQ
 ==
X-ME-Sender: <xms:TYAjYCVNc_0B891syN9mtevXx4nwGpPGKnQLTfxzNctCAxmhitsowQ>
 <xme:TYAjYOkyef2oA_TBTnaJtiWERI4LiwlzsW87xIK-gQEEtpsG43ET_rdF5upN3Nk5a
 xTs4dLfl-h32stE-iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeigddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:TYAjYGZbhMRDZWoxDd_fnspV_NWHqqkt8iUKK7SLhjZxdlbEasf1Gw>
 <xmx:TYAjYJX6Y5GU1qNfmCMDDee6CEzD2OwcQL3WcFcKZ3RQMPadkgsD-w>
 <xmx:TYAjYMlTUy7lGGt2BfBNzrIBHUwLTA2knXStZlQ9J6kT5PlwO6ErPw>
 <xmx:T4AjYGVJKbKmFB8qJJmlhrifzWNEOiAEfcQv5rEHG41OKYVapzJNqA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C9DC240057;
 Wed, 10 Feb 2021 01:42:20 -0500 (EST)
Date: Wed, 10 Feb 2021 07:42:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <YCOASbXtnp2RbvPF@apples.localdomain>
References: <20210125204231.254925-1-its@irrelevant.dk>
 <20210208185907.GA17042@redsun51.ssa.fujisawa.hgst.com>
 <YCGMIcjRlw3auFNc@apples.localdomain>
 <20210210033254.GC17042@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4JhFvwtXuXXKBmgh"
Content-Disposition: inline
In-Reply-To: <20210210033254.GC17042@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4JhFvwtXuXXKBmgh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 10 12:32, Keith Busch wrote:
> On Mon, Feb 08, 2021 at 08:08:17PM +0100, Klaus Jensen wrote:
> > On Feb  9 03:59, Keith Busch wrote:
> > > This whole implementation would be much simpler with the synchronous
> > > blk_flush() routine instead of the AIO equivalent. This is not really=
 a
> > > performant feature, so I don't think it's critical to get these
> > > operations happening in parallel. What do you think?
> >=20
> > It would definitely be simpler, but I believe that if there is a lot to
> > flush, then we won't just block the nvme device. We are holding the Big
> > QEMU Lock and will block most other devices as well.
>=20
> Hm, I feel like you may have told me this same explanation for a
> different patch. :) Okay, I'm convinced: this is the way.
>=20

Is that an Acked-by? ;)

And yes, I might have used that argument for Copy, can't remember ;)

--4JhFvwtXuXXKBmgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAjgEUACgkQTeGvMW1P
DenWkwf7B6DKUZm/fkh3A1XjY+0U5ydu3ZS6zdgu26g6EHX8GaLCXcJOeat9BsjK
aZmaQWd8vb6lSg9IIrdRhXhWVzdobOOmqlbucWPvrzNH+pL34BZUr1EX0KTXmN/n
M7dT6Fk5toMu2b3bN6tpDHg8phV8auHy1QATi+JVcrfg5ShJec4ZXt+OWLKZUIyy
KGSa411FuaZ37io07Wec32emL4kg65ev97IYGzqaU1h4RAx60AzZGmbhiSK9ar4o
AI9R0OsYRFwNtmhEWJZU+UJNNmvQhVKLkpPoNz1rP1H3NQ/rojrbrlw75ALs84Yj
RY57jhOuLd6QqMQDWzL3T23aGEZK3A==
=MrWy
-----END PGP SIGNATURE-----

--4JhFvwtXuXXKBmgh--

