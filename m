Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A549CBCD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:06:14 +0100 (CET)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiw8-0001ST-Ny
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCibZ-0007uk-VI; Wed, 26 Jan 2022 08:44:58 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:51437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCibS-0008Ko-AJ; Wed, 26 Jan 2022 08:44:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 89AD42B00241;
 Wed, 26 Jan 2022 08:44:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 Jan 2022 08:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=CrrKYr0d0ehPqT826+jCHc9z/hlrcT
 +N0ESz1vNCSlY=; b=AYBed5Y3xCVrb3O1NPauqgXHv1hEe56cw6/25BguxF9thn
 54xkNgvjOeNoU7pU3CHQD9TFK03aMRrfxKw+cs6ZfBZV3ooxMGBs5/Q2zC5kekBq
 eIT5A8y8NyITh/v2YOC7Wbc5lAV/IXpk60ndl4ZzTddix/Qip/2A4fqrzv035Wpy
 IxUFdm0RahBTG6AGAO8INUhi+ngLtcB5rILtJJUnk7Nqb9gSqtqKPrWXCFO9795x
 m92Yw2SMOCQUjPQwjlJYIObXHTiUvTIpxWGIldr2BYdyAXUgNJxEGT+DZOzdutd0
 x2b8mHmL5yZGqP4a4MXr8oFLQwiDnWcGDx0kFhlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CrrKYr0d0ehPqT826
 +jCHc9z/hlrcT+N0ESz1vNCSlY=; b=mIVPb0r++VbsJ3iFtsbB6lVlVZEF2Vjh/
 Q4+IMLSTxv4wj6gxvMuypgj8P/z1Zlmk/i142ktSYm3MHpipNek14yLUKP4AJM9o
 zCBwwv+Ufk32fu3wwDI5RGGrfSW6l7DO356KTvfBNfWCKcPIeVdYLA5vkwxpbhEK
 PVZi7qv5tBw50UD83n8d+SVgBL39CjQyELgJa9MzPcnjYVZS4A3FwnT8TZdhInWP
 9pP7MypQ93/w83UB8SxtlbTaT8+MtizII44Vj0nNIw9VicFOaBWSTyAtlGJlbo52
 DQdyluGlb6udFobyZ6Sh5cCEmmdWm50disQG0fWg9C7/84UEjVSYw==
X-ME-Sender: <xms:S1DxYRtBMFfzhXKC3ln-kmQP3_mw2RailON7-cmI4pQdtn9wTCNF5w>
 <xme:S1DxYacW5DAv0Nm--nTP5U3oBi49ITyzzU9mDod70zcNzTHrRaaVBmcCYCec4BcoV
 ggoti0eHDXMBMjmZZY>
X-ME-Received: <xmr:S1DxYUwHzGjvBSyMb8trb-wOa7QFr9OBupEpZsAd1-8UTuU7osPsY6gk12uUqiUzw8BFSDPclTI1HwGzjRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedugdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:S1DxYYPPYNQ7jfNwyEfqUZnaw85_Jjc_7c133Dfpl3k9eQP2k4Jf_w>
 <xmx:S1DxYR_Rr4rCfoQuavdWUc62pR-A3Cwy0J5CVU9fZY77if3rH8YRnQ>
 <xmx:S1DxYYWAOC4-FwkvGMS-Gee_9xb8-V_MgGlpPuxdDoboPT8_kvfRfA>
 <xmx:TVDxYQbXpPJo6dvA3xOiPhJiv0mA212UqFApVUkO9QYVFs6T7YJZciJ6KDk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jan 2022 08:44:42 -0500 (EST)
Date: Wed, 26 Jan 2022 14:44:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-7.0 0/4] hw/nvme: zoned random write area
Message-ID: <YfFQSKsLLqrR1Q4R@apples>
References: <20211125073735.248403-1-its@irrelevant.dk>
 <YfENU6BVuYkGYhnb@apples>
 <YfFJYXZwqOGN5fX8@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/nKV00HBFzOrLFKg"
Content-Disposition: inline
In-Reply-To: <YfFJYXZwqOGN5fX8@stefanha-x1.localdomain>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/nKV00HBFzOrLFKg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Dmitry

On Jan 26 13:15, Stefan Hajnoczi wrote:
> On Wed, Jan 26, 2022 at 09:58:59AM +0100, Klaus Jensen wrote:
> > On Nov 25 08:37, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > This series adds support for a zoned random write area as standardized
> > > in TP 4076 ("Zoned Random Write Area").
> > >=20
> > > Klaus Jensen (4):
> > >   hw/nvme: add struct for zone management send
> > >   hw/nvme: add zone attribute get/set helpers
> > >   hw/nvme: add ozcs enum
> > >   hw/nvme: add support for zoned random write area
> > >=20
> > >  hw/nvme/ctrl.c       | 185 ++++++++++++++++++++++++++++++++++++-----=
--
> > >  hw/nvme/ns.c         |  61 +++++++++++++-
> > >  hw/nvme/nvme.h       |  10 +++
> > >  hw/nvme/trace-events |   1 +
> > >  include/block/nvme.h |  43 +++++++++-
> > >  5 files changed, 271 insertions(+), 29 deletions(-)
> > >=20
> > > --=20
> > > 2.34.0
> > >=20
> >=20
> > Bzzzzz ping :)
>=20
> Hi Klaus,
> Are you pinging Keith? It's not clear from the "To:" header and I want
> to check that I'm not holding up your patches.
>=20

Oh, I've never actually considered moving those that I ping to "To:",
makes sense!

And no - you are not holding up anything. I'm just pinging anyone
interested in hw/nvme (and zns).

--/nKV00HBFzOrLFKg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHxUEYACgkQTeGvMW1P
Den7MAf+L/tfBGyVmliFqWqniMLQUHSjlgj7uMVeEXyw1vVBSiuH7LY40lnu7Egt
NthMg7fFdt52CCxcZI+Rda05sLyX10AxSB6p5//SgfRvQoUWmQa1c9XIzdV2dJ3L
WJWP9ZwTiiEsy2btZUU9lZ3uz7JddQQetEwmGwwmCOt4lIIyQau41NlRqIXuRD64
RAeEf7cODbbX4CBkMPCFUVRvkANPgPrmepYo/Nr12K0I1GqJ7t0SClUCl/cLnRVY
jWlUdQwtvapPi0CdnByTyV9Rekx4DkYJOVzz4mNOoEGMX3xBtz3NChRaGgBb3aCi
Q+Q5yPaZ+x+NfHOwyZ2QCEHqQxVwqg==
=s2MJ
-----END PGP SIGNATURE-----

--/nKV00HBFzOrLFKg--

