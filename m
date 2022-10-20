Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF322606025
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:27:13 +0200 (CEST)
Received: from localhost ([::1]:34726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUdj-0008RJ-Cx
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:27:11 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUPK-0005tE-WC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olTUp-0003fk-Iy; Thu, 20 Oct 2022 07:13:56 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olTUl-0006r7-Vl; Thu, 20 Oct 2022 07:13:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 97E145C0064;
 Thu, 20 Oct 2022 07:13:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Oct 2022 07:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666264428; x=1666350828; bh=JN
 B0gbEVJ1+gDSR0kBtNJ6YwO1aVTzhGfSM7ca85TG0=; b=u56I8V6L+2tV+ZMaq+
 2ExAKTpWtAn/s/XgyA79H8hQzFoIR8SW2tCApzlAIp/48Yqq4N3FzENdbEws4oMK
 YpMrQA3E8pKQg4FHc1WHNbc0gzfR1kXtx29lpn2J30/Z0g09zJVgTuuoWZNkqgiw
 4UqLugZYbduLNirvzdAf9FCirI3nHtGTFl9riwWonjRt+S8QWahPmpAj8MR+kZGW
 13WBdSuYHwIBe7AXxkl+60LiUCMOeuu6/Xxqa4EZ3AaFHIe40XAzUJ9z9y7WNVf5
 k7tMHMNME6RQCoTikfO9hJw81qH80wfwciA0OcD4CS0AoaP1QuhFZrUvssF02s/q
 9J3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666264428; x=1666350828; bh=JNB0gbEVJ1+gDSR0kBtNJ6YwO1aV
 TzhGfSM7ca85TG0=; b=t1pF7D9N/ZEFk1Y7ne+GC0hbqtxaQJ07YO9WYBmYbgEb
 hnC3gdrSn4DVBYy+yEt/RmQHPNfnlDBod0WNy/3GiDmO5P0TuzS+T19JOc8pZiue
 HHNd9epDtFrCgFyyS2rjiFns5T7ZdaQRXqqnaGdpUc2QdJ51f1lVi0IiVhDW16WX
 Xo1+31nvlCyjD8mOQVpVhKKS6A8lZmsxu21kW9EFZx37KpoGPfYk0M6tZoynxOHN
 pcxtAFiYGbCZEdsq5J3y1uL16rlay6YNKth6sr4orsbVHoE7MIJmilt0Oppx+wVN
 5rKJ8FGx3VFlAR5mPpSZh5HQB3218BJh+hpBy2fbRw==
X-ME-Sender: <xms:bC1RY2zQMCrP0Y_AtvKjOpcoYOiOAu2iqPa-sF5iTyFxtFI3X_6OjA>
 <xme:bC1RYyTij-WmkQs1NKZ0SYhdoLblrCDbcsvkSnGg-lDSvaOLv0XIc0DN_zwKLrWUl
 AY7W55IVhS96DTeiBk>
X-ME-Received: <xmr:bC1RY4X5_6u7_IJn1-ayhOJsdXUeBRa5kb5CfvaAdPHxuVLyDmiUYCptF6aKnMek5yZG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bC1RY8gnqteJYxL7XAd4nIg6XWnE0TjS26FjhEpek-wH1lmDsQKLig>
 <xmx:bC1RY4Bk1AtbZyu33a0nLDStfVjdjTjOvX_zDMENlkEi4DwUuAbITg>
 <xmx:bC1RY9JmoAI1njb11JKK8bZ6hPCPskat57XildCifAG_a4OVf8F_Hg>
 <xmx:bC1RY79B1WthRp2kBz_9__dDJ0UPmtBAbIyKtAIvLPLg7CilHYQPCw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 07:13:46 -0400 (EDT)
Date: Thu, 20 Oct 2022 13:13:45 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 3/4] hw/nvme: add iothread support
Message-ID: <Y1Etac3z2PWv/Zq6@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-4-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VdgMHmQTUoQIB+xW"
Content-Disposition: inline
In-Reply-To: <20220827091258.3589230-4-fanjinhao21s@ict.ac.cn>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VdgMHmQTUoQIB+xW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 27 17:12, Jinhao Fan wrote:
> Add an option "iothread=3Dx" to do emulation in a seperate iothread.
> This improves the performance because QEMU's main loop is responsible
> for a lot of other work while iothread is dedicated to NVMe emulation.
> Moreover, emulating in iothread brings the potential of polling on
> SQ/CQ doorbells, which I will bring up in a following patch.
>=20
> Iothread can be enabled by:
> -object iothread,id=3Dnvme0 \
> -device nvme,iothread=3Dnvme0 \
>=20
> Performance comparisons (KIOPS):
>=20
> QD         1   4  16  64
> QEMU      41 136 242 338
> iothread  53 155 245 309
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++++++------
>  hw/nvme/ns.c   | 21 +++++++++++++---
>  hw/nvme/nvme.h |  6 ++++-
>  3 files changed, 82 insertions(+), 12 deletions(-)
>=20

In hw/nvme/ns.c you need to guard the blk_flush and blk_drain calls with
an aio_context_acquire and aio_context_release pair.

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index eb9141a67b5c..dcf889f6d5ce 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -520,12 +520,21 @@ int nvme_ns_setup(NvmeNamespace *ns, AioContext *ctx,=
 Error **errp)

 void nvme_ns_drain(NvmeNamespace *ns)
 {
+    AioContext *ctx =3D blk_get_aio_context(ns->blkconf.blk);
+
+    aio_context_acquire(ctx);
     blk_drain(ns->blkconf.blk);
+    aio_context_release(ctx);
 }

 void nvme_ns_shutdown(NvmeNamespace *ns)
 {
+    AioContext *ctx =3D blk_get_aio_context(ns->blkconf.blk);
+
+    aio_context_acquire(ctx);
     blk_flush(ns->blkconf.blk);
+    aio_context_release(ctx);
+
     if (ns->params.zoned) {
         nvme_zoned_ns_shutdown(ns);
     }

Otherwise, it all looks fine. I'm still seeing the weird slowdown when
an iothread is enabled. I have yet to figure out why that is... But it
scales! :)

--VdgMHmQTUoQIB+xW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNRLWkACgkQTeGvMW1P
Del3TAf+MRiyluZsSY8rgGTuwUs5EmIM9pQqhHsGZM8fwVpT1cmgJDD+OSkAFnmy
VTRwrIV+N3PUkblXCU0I8L+rE5AO1kd7lZ5NRvkeiYqlM0zPxNFMinXufmF8P5u0
7LiBY6c5c+8iByl8IWv0N24N3r/brj+AMKeJV/QqQ8f5CMmH7sS1JOWGY21fUQoi
ZLVW6UbcAqBufq+WzAp4bpaQ0SWUnm+klufg1mx4u23pTLS8Q601yCNLjD4l4F59
KXeK/cE1XK8BvUbvtq72ThT0IAwsoggvAkBQ6oWp3ytiFxfkk6x+/jE2mruR9ieH
yxoFFjrifAHuHaJWwN0fGd+yKuQ9+Q==
=sSBq
-----END PGP SIGNATURE-----

--VdgMHmQTUoQIB+xW--

