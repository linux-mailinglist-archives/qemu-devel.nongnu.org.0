Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A244046C0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:07:39 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOF5t-000774-Dp
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mOExq-0002Ia-80; Thu, 09 Sep 2021 03:59:18 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mOExo-0005K0-1m; Thu, 09 Sep 2021 03:59:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id AE7A3580B63;
 Thu,  9 Sep 2021 03:59:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 Sep 2021 03:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+/CNEiKhL3/i/6zb+g/RL1IrO9y
 iIbsIs3zKhJKRRq8=; b=fArAaNO88OhHd9TcTZZTAMsXFDK5ch8Qbt0fbfMsGoK
 VgAuix6afRu1X5LFlV82fOUgyQsd6J1/qpBoCUp9+wrT82nCKfOMvNGCVdg8N/Yl
 5uc2SzhkcsiGivureuFUSvRjuCFpuHAm9igS6dTveVAsxSKkH5yPJGhYsRJFl0OC
 pG+PmK0vXAYt9NOsP5/FPeJPmKXbouFngtc095av44COksVgkZb5hOmQMKNqDyMP
 74OY51OEgTEa95YeNBpXb2b6aIAGc1CE0+zFEV1rhwf4o63Te4G0F5TWuvH0CQij
 bP8Th+XHa3So+F4akn007thdy+Jr1RWc0QVGLg3D6oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+/CNEi
 KhL3/i/6zb+g/RL1IrO9yiIbsIs3zKhJKRRq8=; b=Cgzf645gXNpBxJqyhDYd4k
 4GSFwMKnDlR0ecx3VcuPcKWpeUVQO+iVdhU/vQ6Fz74Ol38M0thLpaQxTUaXGOCH
 NcXu7efPiL0TR0oDZj27t4nq85q59t6ETDZv+pwvWmYWePmcq5Nf92LwbGBmqIY0
 +TSSVI8ZyidL4tdM+MP+/PWVprF3w+90Wg2tpdWy1TBv591c9lfcSm452SMuZ3Ke
 w3ss06bkxrVapmhJQMJ4uLCx9i4DUGyPAPoZ0J6P3KVlKU0tq63dJ3138ekdtAEK
 zR+p1WkUyLqJxCB9NgsgRQzBdQa7nWo7G/LReD/n227eaaQmWLEobWhag4j9+fug
 ==
X-ME-Sender: <xms:z745YdU4rXXktaYjvf9gbZvzNRivDHbDzidMjnsBufMEgCWUCT8xug>
 <xme:z745YdmsIh75xym20p-U60MXreILHxX1aezCnblRiluedgpFTf0BWcmq2OFdTC9vC
 dCcImWZ3h1seDWkbRE>
X-ME-Received: <xmr:z745YZbmenlsUV2AJ9yP0GpJ6vrTXDhWYhJtN4sdX9Ye0z8Ogjx9Cbgqqw2wu9eOF52aT9QeiW2i2zYPgKdfuiOc3f1OOv4CdTnBRSGzxAhEvY33Eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefkedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:z745YQVeqg8PC2QA1uYqvHX2ouu7XvaHSWjmbdL5Eoep_CD9uGbHLA>
 <xmx:z745YXlK4vqEQyZssXyLdnk2_EKAc1l79_EkxCOQGAhYi5X8dLlo7A>
 <xmx:z745YdcHtTc7aU0N2BnzM-bHMeN_3abIR-YryDv1Cc7gRWKedotckA>
 <xmx:0L45Ya-4uZAEADyvU2GUCjUBA1Hzdbu8sh-6doa7wTZ97prPasLgHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 03:59:09 -0400 (EDT)
Date: Thu, 9 Sep 2021 09:59:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PULL for-6.1 06/11] hw/nvme: fix controller hot unplugging
Message-ID: <YTm+yvB3shItJ1Cn@apples.localdomain>
References: <20210726191901.4680-1-its@irrelevant.dk>
 <20210726191901.4680-7-its@irrelevant.dk>
 <699ace8a-4d92-c9ee-d844-0e5d80edc4d6@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+7Yk1ANSRqdk6tr"
Content-Disposition: inline
In-Reply-To: <699ace8a-4d92-c9ee-d844-0e5d80edc4d6@suse.de>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--x+7Yk1ANSRqdk6tr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep  9 09:02, Hannes Reinecke wrote:
> On 7/26/21 9:18 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Prior to this patch the nvme-ns devices are always children of the
> > NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
> > unrealized when the parent device is removed. However, when subsystems
> > are involved, this is not what we want since the namespaces may be
> > attached to other controllers as well.
> >=20
> > This patch adds an additional NvmeBus on the subsystem device. When
> > nvme-ns devices are realized, if the parent controller device is linked
> > to a subsystem, the parent bus is set to the subsystem one instead. This
> > makes sure that namespaces are kept alive and not unrealized.
> >=20
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/nvme.h   | 15 ++++++++-------
> >   hw/nvme/ctrl.c   | 14 ++++++--------
> >   hw/nvme/ns.c     | 18 ++++++++++++++++++
> >   hw/nvme/subsys.c |  3 +++
> >   4 files changed, 35 insertions(+), 15 deletions(-)
> >=20
> Finally got around to test this; sadly, with mixed results.
> On the good side: controller hotplug works.
> Within qemu monitor I can do:
>=20
> device_del <devname>
> device_add <device description>
>=20
> and OS reports:
> [   56.564447] pcieport 0000:00:09.0: pciehp: Slot(0-2): Attention button
> pressed
> [   56.564460] pcieport 0000:00:09.0: pciehp: Slot(0-2): Powering off due=
 to
> button press
> [  104.293335] pcieport 0000:00:09.0: pciehp: Slot(0-2): Attention button
> pressed
> [  104.293347] pcieport 0000:00:09.0: pciehp: Slot(0-2) Powering on due to
> button press
> [  104.293540] pcieport 0000:00:09.0: pciehp: Slot(0-2): Card present
> [  104.293544] pcieport 0000:00:09.0: pciehp: Slot(0-2): Link Up
> [  104.428961] pci 0000:03:00.0: [1b36:0010] type 00 class 0x010802
> [  104.429298] pci 0000:03:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64b=
it]
> [  104.431442] pci 0000:03:00.0: BAR 0: assigned [mem 0xc1200000-0xc1203f=
ff
> 64bit]
> [  104.431580] pcieport 0000:00:09.0: PCI bridge to [bus 03]
> [  104.431604] pcieport 0000:00:09.0:   bridge window [io  0x7000-0x7fff]
> [  104.434815] pcieport 0000:00:09.0:   bridge window [mem
> 0xc1200000-0xc13fffff]
> [  104.436685] pcieport 0000:00:09.0:   bridge window [mem
> 0x804000000-0x805ffffff 64bit pref]
> [  104.441896] nvme nvme2: pci function 0000:03:00.0
> [  104.442151] nvme 0000:03:00.0: enabling device (0000 -> 0002)
> [  104.455821] nvme nvme2: 1/0/0 default/read/poll queues
>=20
> So that works.
> But: the namespace is not reconnected.
>=20
> # nvme list-ns /dev/nvme2
>=20
> draws a blank. So guess some fixup patch is in order...
>=20

Hi Hannes,

I see. Ater the device_del/device_add dance, the namespace is there, but it=
 is
not automatically attached.

    # nvme list-ns -a /dev/nvme0
    [   0]:0x2

    # nvme attach-ns /dev/nvme0 -n 2 -c 0
    attach-ns: Success, nsid:2

    # nvme list-ns /dev/nvme0
    [   0]:0x2


I don't *think* the spec says that namespaces *must* be re-attached
automatically? But I would have to check... If it does say that, then this =
is a
bug of course.

--x+7Yk1ANSRqdk6tr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmE5vsYACgkQTeGvMW1P
DenXuwf/R0sWME/NMEeg2AYQ6S1wM9foBLJKWz1cb33fqgmp+6R4j/TmRbvyvxMk
8CiR76aGoZIyXpMEL2jp47+rrYw/bJjvFXvZRvJ0PhAfkNqS3oBhvVG5gY7HzGBq
pwcN3V3CCNuLEJRAoMztr2jvZUSXi0MHPi7regJ3SL/6CgOnK6lUWruvbN69o5B7
YqXwf7Vx71FZAGDqnCMiWT+UqQs5QxBPvyXl/oo7k1eD41tIoY0oATiLO8eCmVnA
jEE5wEfx7DRFBZUeef9/YIZDyyyGdDOG0ra7Jzy9q8zs8gGhXPca/tT77ThjfMvs
FsmLSiUr+6T3nfwFsq3CmdBf9hwEwA==
=DHYD
-----END PGP SIGNATURE-----

--x+7Yk1ANSRqdk6tr--

