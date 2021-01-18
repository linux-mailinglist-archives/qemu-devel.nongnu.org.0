Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D02FA152
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:24:09 +0100 (CET)
Received: from localhost ([::1]:38746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UVs-0004n1-Cv
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UJA-0007sK-Mv; Mon, 18 Jan 2021 08:11:00 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UJ7-0002TN-JW; Mon, 18 Jan 2021 08:10:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 862BE580734;
 Mon, 18 Jan 2021 08:10:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 08:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=hbjBI1O6g04lwB8X7lO0JiB5jih
 o/sAMrCmC+Bv+iF0=; b=W3r8hf6WrsccBQNkeilYCeYOXW9RpZBFzweYET2N0/l
 v9osv4SzKpn5qdX2HXeJfxtYSlEXzzHbWKcXWJCP4vb8nEIqasDYgojtX8WQq7zy
 nrDtLLsUqfVHdX80psP+5bJL4PN+HmrHb2LJRl4zNa9+iAmToptstTkXYSstARpl
 wcaxiK1hYBUCTQuEkY7Cu0FFirEwa6UTKZVFaJDLlQWiupfOr6SS2yHirI7HUf7E
 ES6IoXZ5bzQuaP5900A4xwlKBU0TbAjAmXqth/CHpWvBQpa9nvwsFJ+TTpSGdvV8
 IdsRKQuyBqi+aNMSGpUIF+Vfl41svjJ14vdjWsIHhpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hbjBI1
 O6g04lwB8X7lO0JiB5jiho/sAMrCmC+Bv+iF0=; b=g/aIN2buyRv0UnsdZ+bkFs
 cDX3eyZOcyFigQA/wlAxq0aqvLV71r3LvZEKdpolH12E47QNH7J0/G3JwLZrsLyq
 rmPGHoK2bGT+hYjUDZbp+PDAfzRqart51Xh3piyPDGZMDVFcjXUCx6QVH4x27+Pm
 dclCp88DlPtvbK+lknoSqBtSfpoYqkipBCNkYNzc45cR2sMFtnvgkxO4HzFo1QgV
 hfepMTrH1tqP9qapOB/ngHS2Y5RSfdPfGvwnes+osm9nyxeiSYqPrWg+tRYnQXa8
 dofsOhjOumkyMPwpTpAY1RrIh2nh9MIhPsCOkyxcbmy+lM0t6ZLpl2AzYu2iKUGw
 ==
X-ME-Sender: <xms:3ogFYBpbQlqVtKehuQtfxNUb4gheorW5Vr1JRX23a6r1Jb7ScnyEiw>
 <xme:3ogFYDpCCNzeIaxwG8Vf9uuadxjSeCmct86PRsbom8T72i7fAE7zRTztI1e3Lr3Hd
 Fhgelwd68CUY4KxaHU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:3ogFYOOm3Gun7vmzl1mV9IJEIL-AqhbfBm5grBHvwrjzQCK1-r9NNQ>
 <xmx:3ogFYM5sCiOH3WiyqboUmWUMCA2uIXqKxaxr9MRTOoi1EFtyGuDtpA>
 <xmx:3ogFYA4sXXcz2hWIceh91shY3QMIt6-WbPkX3tEQ_q1myLVIYqjAXA>
 <xmx:34gFYCsO3xK9I3BQSZ10OFoT7PH0RqBIHAK70bHRxbXusgtAOCCjmw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C45924005D;
 Mon, 18 Jan 2021 08:10:52 -0500 (EST)
Date: Mon, 18 Jan 2021 14:10:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <YAWI2sFftUEspcT+@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
 <YAWHSaXmpo64xmmp@apples.localdomain>
 <20210118130946.GJ18718@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fxhj+t+pjjlEBmPW"
Content-Disposition: inline
In-Reply-To: <20210118130946.GJ18718@localhost.localdomain>
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Fxhj+t+pjjlEBmPW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 22:09, Minwoo Im wrote:
> > > Yes, CMB in v1.4 is not backward-compatible, but is it okay to move o=
nto
> > > the CMB v1.4 from v1.3 without supporting the v1.3 usage on this devi=
ce
> > > model?
> >=20
> > Next patch moves to v1.4. I wanted to split it because the "bump" patch
> > also adds a couple of other v1.4 requires fields. But I understand that
> > this is slightly wrong.
>=20
> Sorry, I meant I'd like to have CMB for v1.3 support along with the v1.4
> support in this device model separately.  Maybe I missed the linux-nvme
> mailing list for CMB v1.4, but is there no plan to keep supportin CMB
> v1.3 in NVMe driver?

I posted a patch on linux-nvme for v1.4 support in the kernel. It will
support both the v1.3 and v1.4 behavior :)

--Fxhj+t+pjjlEBmPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFiNgACgkQTeGvMW1P
DelgeAf+NFk5SvCecyeyd1ilofd4IkgA/h6jwRdGUPat3Sx9oFjqkpo73LTH03iO
QxmVXperITm5lNWva0d2q0p8F/figMxygCN79kbXe5s8siPQYA2rziCOFFfnR9lu
z9dG70RZfwTi4OLNeoAvtSSGwLoI/1oiJsmPX2CLht8YOtoN+fxUFXuzc6d9TCpv
BhHmStG9WW0v/aBRfed6grBCt/xNfnqd9ybsspADUKdda9n69wKLDMQHS2zKTV1/
j7hQOEMXerSsFeLANQwElNUguvqLlJzPuWsRB+dbbSpwLr2lE2BQJ5BwpwQKcAJS
64FdhNMQNkucKIY7VQBzbge+jIAZvQ==
=Mg4Q
-----END PGP SIGNATURE-----

--Fxhj+t+pjjlEBmPW--

