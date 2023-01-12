Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E9667CF2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1ee-000392-EU; Thu, 12 Jan 2023 12:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pG1eR-000370-Dx; Thu, 12 Jan 2023 12:46:08 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pG1eL-0003ev-E1; Thu, 12 Jan 2023 12:46:07 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 539E15C0065;
 Thu, 12 Jan 2023 12:45:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 12 Jan 2023 12:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673545559; x=1673631959; bh=YI
 YUHf4h/jjkAP78zYa0AhqxUa06r/hPvjMS+MwCYqY=; b=CNLK6ejrNhHREjaeVt
 erte2GCMeMlz+RVuhotellaU3Usw6vZ+gbwvL9TxTWr0DOc3d495zhi57+RVIwHv
 /uIEZDkfglqQAq8uO1vrkj/YkktdZl7qLe0g/z1A6mWn+oNXLVFHugaByk9OvhS6
 blQHW5guxL0MitDvS9l4vggsZM80gxGHifC6+4WI1Q67nxkaDIIAQTtGOTavH2a5
 vwuweQR6pxmPobsJ0JptkwCswJghNXB3n3VLiQE2mvxphUN6m7Ccv8ToplzE/KEl
 9BvZ+HxvvasNmev4jJ1SC8x4dG5bPlLnYttIwyjqx2jOC6FkrFeIMweqIUwzakVN
 KxVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673545559; x=1673631959; bh=YIYUHf4h/jjkAP78zYa0AhqxUa06
 r/hPvjMS+MwCYqY=; b=Wi+ONRpheuRQbX0NBqPFYtKJ7X6Nb5tNTy/QNhWKsVlb
 TnCwmVSF5yQL1+1eGVOnB9PoA+RWWJ4F55HMaeu32jiZ5GBIv1TihBphTBPC4EwJ
 FEJDBvUWHz044Sg3y65BsVMdlO2+GP6jlLQcMm26tjRImDZSxXkxm0xtd23FMPBf
 hKbKhtbQI+EhBykE9uyo8TOi8BzwX7UCGBeqvXZByc/IYt6NuomP9cIjapO+Pnuv
 kHuxJjsomKOLa5eZ40vx2lQP4wbjzYC0zqD6H9WRYs13UK00crlzo9LF+5M8h7LX
 lgpgdR4l9hOIYmZiTD51h5yiNwnricSpwYHudWeOlQ==
X-ME-Sender: <xms:VkfAY37AiCTtfpNcKpsxQrjb5nuU8nuP6UrYOnCx1soTttDGcYkEVw>
 <xme:VkfAY85FSWvlgXroQd4KjoYsJYaGEz8GVP0Ns5lN0z1tn5HVhmTV7zkm9kIzhhmkm
 3l8aiUOJfKg7WMnGOE>
X-ME-Received: <xmr:VkfAY-ckMnhCUVxtsPY75nWXHdWaPL1Uw_Fuxb33I5rOWXcvpU8kbNI9cqud-vsgrBjXamSOTbUVnFP-U5E0pwDeicTOMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepkeeiffejgfeukeehvdegfeeuheehvdfgheelkedugffgjeevveeiheehleeh
 jedunecuffhomhgrihhnpegtthhrlhdrtgifnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VkfAY4KsWNZ4oZbVHy-Ygu1LHhAFtwv__inyXh9XzCs4uPIeblJBhA>
 <xmx:VkfAY7ID2u4jOJgmccr5nvSvJmPtAMW8wSmEzn_GcaroGfS84Vv9WQ>
 <xmx:VkfAYxwbJNc7wv_tifDgtgw-RXyjdfqsNtEFon0v39HsdBDaIoa7kg>
 <xmx:V0fAY4rf56NDLhLt3lcLTPJWCjm-rebfDrsCie9xDlx2ZZiAH9bmNw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 12:45:56 -0500 (EST)
Date: Thu, 12 Jan 2023 18:45:55 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8BHUzcbdQ/SFBY9@cormorant.local>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8A2qdbDZPicuZfL@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yEiXUOj3Uq/gzfSM"
Content-Disposition: inline
In-Reply-To: <Y8A2qdbDZPicuZfL@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--yEiXUOj3Uq/gzfSM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 12 09:34, Keith Busch wrote:
> On Thu, Jan 12, 2023 at 02:10:51PM +0100, Klaus Jensen wrote:
> >=20
> > The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
> > am wondering if there is something going on with the kernel driver (but
> > I certainly do not rule out that hw/nvme is at fault here, since
> > pin-based interrupts has also been a source of several issues in the
> > past).
>=20
> Does it work if you change the pci_irq_assert() back to pci_irq_pulse()?
> While probably not the "correct" thing to do, it has better results in
> my testing.
>=20

A simple s/pci_irq_assert/pci_irq_pulse broke the device. However,

	diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
	index 03760ddeae8c..0fc46dcb9ec4 100644
	--- i/hw/nvme/ctrl.c
	+++ w/hw/nvme/ctrl.c
	@@ -477,6 +477,7 @@ static void nvme_irq_check(NvmeCtrl *n)
		 return;
	     }
	     if (~intms & n->irq_status) {
	+        pci_irq_deassert(&n->parent_obj);
		 pci_irq_assert(&n->parent_obj);
	     } else {
		 pci_irq_deassert(&n->parent_obj);


seems to do the trick (pulse is the other way around, assert, then
deassert).

Probably not the "correct" thing to do, but I'll take it since it seems
to fix it. On a simple boot loop I got the timeout about 1 out of 5. I'm
on ~20 runs now and have not encountered it.

I'll see if I can set up a mips rootfs and test that. Guenter, what MIPS
machine/board(s) are you testing?

--yEiXUOj3Uq/gzfSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPAR1IACgkQTeGvMW1P
DemIGwf/ZFJZmI/8XrBPelfu1rr9TEbFYfvu8n7LxgCvRoHsHSo/pxvHFEfgR2/r
NVEWa+2flmvUVb9LD/2WKQu7yePEGpgFIfQRUDzK0vozQIN9w87ovqe+hSOW4xa/
O6Mz6aEQ/iRdlqh4J3iEBz+hV5Pt/YO2NX0a3cfnOFaXGEzL0nLMkWU3E7j1MoZy
C8l//jvhzurybBGPsnDM2jdKUmvmv5XkrtgdkzV8/Bk2HdoOdslfu7hgD80uF/1m
IsSoeOhMt/Tc5uOULwK21W8VzdmSib10w8XudrGlI1kMNydxZQgEyKe9w3YL5LPs
+VnMW/L+YivaRiNLyoW/F7BA2CXKQA==
=X6qn
-----END PGP SIGNATURE-----

--yEiXUOj3Uq/gzfSM--

