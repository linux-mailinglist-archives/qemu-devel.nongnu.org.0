Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F5318878
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:47:11 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9V4-0006F0-F5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA9PW-0004cP-Aa; Thu, 11 Feb 2021 05:41:24 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA9PS-0000Xy-1H; Thu, 11 Feb 2021 05:41:22 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7DA3458016E;
 Thu, 11 Feb 2021 05:41:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 11 Feb 2021 05:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=EnNv7b6GDCJ7VoD1jTLAZ7I/0Tt
 DYtigWslKDzNs+yE=; b=uPuc5wagEc0CEjHeWc5JF2xDtucmfmmIgUQ7pjK+LVA
 IV0LJ8dOXl2gir4N6cey2aRDhpELO3xVj93BWOcIPvKaZERf73fG2Pdt+bSmHy6f
 HKaDWCwQONGqzchHOPNB+9Or5a8GBefys+FZBYcffUbv+a0pD5bT24fSu6hj/Rx7
 ukaIMs3won9bQuFuFq17CJXtVtmxJqT6IQspkHL1qHjRGxB6nTIEB9eeIW4pM56K
 gN6ppc4UqWqVg5alOuYdfuyp8bIbq+syPje9bfbEHfHTuXPSKBKvIdSqJJ7Uxxf6
 1UUFyoXJOCKB8rjmhrScpTGGkHSVWORjqok+83EiSPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EnNv7b
 6GDCJ7VoD1jTLAZ7I/0TtDYtigWslKDzNs+yE=; b=ORtfmdgiwaRqLiPbd2coVz
 PsiLNz3ZI2TZxds7HeH71+evqss3NhUDwMpapyuZXqEPLPuL8+QUr69BY+tyzCEH
 Z6nmvtFeFuZfLTMVMdkF4OCUrWDpmmbPioZQbJBHUZDlZfTBelmoRUFdqHDW5+QD
 8VHMmLUTgr+v3/nIawPVu0xqJsuPQqUHgoxD4qUxpaj4NAzTkYVX28mEpo+5c9hs
 CzSgV4IPhuMfLR2c/HGkITsx4FIi6+aOqd/edHa+y1h1DyrwvFbLWc/shOeBf847
 Utbfyza6K4BbUag8TmCvObHN997wXmFCFOoWRvm8KPRTWnUpJ0NpcCr+jRAQoduQ
 ==
X-ME-Sender: <xms:ygklYH1L36L1bGfE1y6pCvvpMQtwhBYToVeIEZgWNHdwFLAi6jIoRw>
 <xme:ygklYIHdQ3DdmbgRWPPTexx3Mc-xUcuI4BMGh5YPQckORGTQLGNqyKHSjgb9Fl3ux
 TqgubF8o8QqUrUfjgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptddtjefgveektefghefggeeiveffueeuudfhiedvvdduveekiedttdelvdefheek
 necuffhomhgrihhnpehnvhhmvgdrtgifnecukfhppeektddrudeijedrleekrdduledtne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ygklYBS3SD83lR2kYMYqq0lRh7mtvclJ4ESMMO2pITRK-PQTt0i4rw>
 <xmx:ygklYPDgBgYV3_GuyiyyuTuKGwEX5uRUDHe5lC8EVo9r1VDHWSWG1Q>
 <xmx:ygklYB1T8P3wPUhJ0D4_J5vyqWCy_hm5bj755LaOPZCNVCNm2TcCaA>
 <xmx:ywklYN8hbFQG3oTUqPa-dk-5vHqzswQiy16gvhxkKBzAK5Q2qxDIyg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC83B24005A;
 Thu, 11 Feb 2021 05:41:12 -0500 (EST)
Date: Thu, 11 Feb 2021 11:41:11 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PULL 32/56] hw/block/nvme: split setup and register for namespace
Message-ID: <YCUJx0wcK9AKY6mu@apples.localdomain>
References: <20210209073101.548811-1-its@irrelevant.dk>
 <20210209073101.548811-33-its@irrelevant.dk>
 <20c3b649-b6c1-91ef-41cd-5c820a7f81cf@csgraf.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RcIV/j/g56aR+Moy"
Content-Disposition: inline
In-Reply-To: <20c3b649-b6c1-91ef-41cd-5c820a7f81cf@csgraf.de>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RcIV/j/g56aR+Moy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 10:53, Alexander Graf wrote:
> Hi Klaus,
>=20
> On 09.02.21 08:30, Klaus Jensen wrote:
> > From: Minwoo Im <minwoo.im.dev@gmail.com>
> >=20
> > In NVMe, namespace is being attached to process I/O.  We register NVMe
> > namespace to a controller via nvme_register_namespace() during
> > nvme_ns_setup().  This is main reason of receiving NvmeCtrl object
> > instance to this function to map the namespace to a controller.
> >=20
> > To make namespace instance more independent, it should be split into two
> > parts: setup and register.  This patch split them into two differnt
> > parts, and finally nvme_ns_setup() does not have nothing to do with
> > NvmeCtrl instance at all.
> >=20
> > This patch is a former patch to introduce NVMe subsystem scheme to the
> > existing design especially for multi-path.  In that case, it should be
> > split into two to make namespace independent from a controller.
> >=20
> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
>=20
> In latest master, I can no longer access NVMe devices from edk2. Git bise=
ct
> pointed me to this commit.
>=20

Hi Alexander,

Thanks for reporting this. This patch should fix it, I'll queue it up.

diff --git i/hw/block/nvme.c w/hw/block/nvme.c
index 5ce21b7100b3..d36e14fe13e2 100644
--- i/hw/block/nvme.c
+++ w/hw/block/nvme.c
@@ -4507,6 +4507,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error *=
*errp)
         if (nvme_ns_setup(ns, errp)) {
             return;
         }
+
+        if (nvme_register_namespace(n, ns, errp)) {
+            error_propagate_prepend(errp, local_err,
+                                    "could not register namespace: ");
+            return;
+        }
     }
 }


--RcIV/j/g56aR+Moy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAlCcUACgkQTeGvMW1P
DelA+Af/fH+BV7lILIoVxEIldBtblT/MsP4IBjX7iwImZcYskO4sz0MfbGvSIKKz
S4nnsEQuS8N2satTYtzrPq91DqE3fSG4dzDcbHc6wKaoCKtRZmWdHYQ6mcoDzi80
z8qdecQRbRibn9dnCQ/iiX5BlCEyKcC/GsO9yH+AyDxn/BiaqcpRDEUVvSilpOHZ
fmnNRfQpU+pAG4zy5Z7cWS1Vv9OEih36tQVWjwW+VqFXlGKDVw6VCWEDamuUD6SD
KP9HDiaOsya3/EIbxqH0hlBt9PHGr+pAvaCzZ55f+Z15j1HvqwwWUExCRJF/bEJl
aKLWw27e0Yo/j/TE2iUQmAvfQbexjw==
=nE5X
-----END PGP SIGNATURE-----

--RcIV/j/g56aR+Moy--

