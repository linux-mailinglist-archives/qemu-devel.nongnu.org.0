Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5B3BF506
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 07:21:03 +0200 (CEST)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1MT7-0006AI-RL
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 01:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1MOk-0005D4-Br; Thu, 08 Jul 2021 01:16:30 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1MOg-0002O8-RH; Thu, 08 Jul 2021 01:16:30 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 0524832003F4;
 Thu,  8 Jul 2021 01:16:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 08 Jul 2021 01:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rJAXgjHRQhCmTkleK7X6NWh9Xx1
 TqQCo6AkXb4utw4k=; b=P5wSQdbP0rAGTHX2OV0J5T6i6OpFifF0JvHS6of59tW
 akoX9p2zErvOWcAbV175VjexPKszonaiGvqHlneS0q4RnqKsr2+VaJ2nwVIWbs6S
 NquxKQl52khOzENkoevzdIUFlQfTL2uwr9YKZ0Vy9ehWJ5jl6IFWA22AF1Xrr+wx
 9r+Q/sI/kyUE7f5dv/zNdxH0eKQ8yTEIOxoKaI1cURRFhCvTdXLSGL337O8qE6D8
 uMUzONTkgHULwhPBd2RDLeNfiXi41ZXWZjsLpG0okgpb9MgHKZbwXFk7/gdsb6aP
 WAg3Ld3cPSY3jFQQgA2fJmC95kJQ5oXMirGrsE0xA+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rJAXgj
 HRQhCmTkleK7X6NWh9Xx1TqQCo6AkXb4utw4k=; b=DvIrWSjEpJWyi0fCavDivr
 gq+MqFxhJuGxb4gjJlPZ/mIvwSdsk9L/Gl9juwhV/iXIGUXTaR8GgJObY45dCYQt
 nG4//CyeNAGrmuTi8FapKYD258Jk2RHbD9jVYJ+ClkZUYN9saA/R85g65T4UxXHm
 tBWD/fiBygl8ndHim1G6siSadesvJJIqzdHU9szMaQIwQ25CRhfwd2C5g8k/DlKP
 y8+X/mkxMxB72AsF1PR37Xya0xwcAZ5fZ3dfcKylynqMX6CmcHM/RF/e/Sm6no3W
 sdlPyKuuaywFAOaJH2+7U7aD3ePiqxy5RnHGWIbq3TCscHSfBASV5UwnnFCDL4oA
 ==
X-ME-Sender: <xms:I4rmYFXoAwRGKP-6_jdgqT8-tnCURkr1Vv6hV4eGWaFN4RZDvhlEHA>
 <xme:I4rmYFlmuGT54AyXrb28pbWCilQQ-hs3uAaglIxjZWWwoe_pa1Iq0YqA5BTDxgdkF
 BTNrTfpoihRKLZkK4M>
X-ME-Received: <xmr:I4rmYBbi4w3q0CvR_6QLygOM0Am2z4mI04peVErLCJ-eJJkGqkKEx1vNO8wxwnDE7HSK2oEbFjhYC31fjTreSFivIza0yWx6Avd7Ym8YqS2CXLhT_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdefgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:I4rmYIVzUmyrSE6A5FH8QeiJsUlAfwyRZ8queqVlE9alxLOBSw1AEQ>
 <xmx:I4rmYPlxxEN_zaSmk5vk_v9nEQ6UaZ_L84Aqry7eXHQ6Ui28FlS2tA>
 <xmx:I4rmYFfZfNnyCmuLibhxyWv04v3bNEQAMcFhkmQy2xXXbSNkF30qqw>
 <xmx:I4rmYICVIu3c_zYrQ9ocm-AJm3MmbAsklF284qV4Vhd37h_ZajleJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 01:16:18 -0400 (EDT)
Date: Thu, 8 Jul 2021 07:16:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOaKH5twxHBM/OLj@apples.localdomain>
References: <20210707154936.200166-1-its@irrelevant.dk>
 <20210707154936.200166-5-its@irrelevant.dk>
 <375ea826-589f-2a18-ea0b-e3ec672a9916@suse.de>
 <YOXcv+f/D/BYM77E@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/yTWJCWq18vyuy2p"
Content-Disposition: inline
In-Reply-To: <YOXcv+f/D/BYM77E@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/yTWJCWq18vyuy2p
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  7 18:56, Klaus Jensen wrote:
>On Jul  7 17:57, Hannes Reinecke wrote:
>>On 7/7/21 5:49 PM, Klaus Jensen wrote:
>>>From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>>Prior to this patch the nvme-ns devices are always children of the
>>>NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
>>>unrealized when the parent device is removed. However, when subsystems
>>>are involved, this is not what we want since the namespaces may be
>>>attached to other controllers as well.
>>>
>>>This patch adds an additional NvmeBus on the subsystem device. When
>>>nvme-ns devices are realized, if the parent controller device is linked
>>>to a subsystem, the parent bus is set to the subsystem one instead. This
>>>makes sure that namespaces are kept alive and not unrealized.
>>>
>>>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>---
>>> hw/nvme/nvme.h   | 15 ++++++++-------
>>> hw/nvme/ctrl.c   | 14 ++++++--------
>>> hw/nvme/ns.c     | 18 ++++++++++++++++++
>>> hw/nvme/subsys.c |  3 +++
>>> 4 files changed, 35 insertions(+), 15 deletions(-)
>>>
>>>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>>index c4065467d877..83ffabade4cf 100644
>>>--- a/hw/nvme/nvme.h
>>>+++ b/hw/nvme/nvme.h
>>>@@ -33,12 +33,20 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BR=
OADCAST - 1);
>>> typedef struct NvmeCtrl NvmeCtrl;
>>> typedef struct NvmeNamespace NvmeNamespace;
>>>+#define TYPE_NVME_BUS "nvme-bus"
>>>+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
>>>+
>>>+typedef struct NvmeBus {
>>>+    BusState parent_bus;
>>>+} NvmeBus;
>>>+
>>> #define TYPE_NVME_SUBSYS "nvme-subsys"
>>> #define NVME_SUBSYS(obj) \
>>>     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
>>> typedef struct NvmeSubsystem {
>>>     DeviceState parent_obj;
>>>+    NvmeBus     bus;
>>>     uint8_t     subnqn[256];
>>>     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
>>>@@ -365,13 +373,6 @@ typedef struct NvmeCQueue {
>>>     QTAILQ_HEAD(, NvmeRequest) req_list;
>>> } NvmeCQueue;
>>>-#define TYPE_NVME_BUS "nvme-bus"
>>>-#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
>>>-
>>>-typedef struct NvmeBus {
>>>-    BusState parent_bus;
>>>-} NvmeBus;
>>>-
>>> #define TYPE_NVME "nvme"
>>> #define NVME(obj) \
>>>         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
>>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>index 90e3ee2b70ee..9a3b3a27c293 100644
>>>--- a/hw/nvme/ctrl.c
>>>+++ b/hw/nvme/ctrl.c
>>>@@ -6514,16 +6514,14 @@ static void nvme_exit(PCIDevice *pci_dev)
>>>     nvme_ctrl_reset(n);
>>>-    for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>>>-        ns =3D nvme_ns(n, i);
>>>-        if (!ns) {
>>>-            continue;
>>>+    if (n->subsys) {
>>>+        for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>>>+            ns =3D nvme_ns(n, i);
>>>+            if (ns) {
>>>+                ns->attached--;
>>>+            }
>>>         }
>>>-        nvme_ns_cleanup(ns);
>>
>>So who is removing the namespaces, then?
>>I would have expected some cleanup action from the subsystem, seeing=20
>>that we reparent to that ...
>>
>
>Since we "move" the namespaces to the subsystem, and since the=20
>subsystem is non-hotpluggable, they will (and can) not be removed. In=20
>the case that there is no subsystem, nvme_ns_unrealize() will be=20
>called for each child namespace on the controller NvmeBus.
>
>>>-    }
>>>-
>>>-    if (n->subsys) {
>>>         nvme_subsys_unregister_ctrl(n->subsys, n);
>>>     }
>>>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>>index 3c4f5b8c714a..b7cf1494e75b 100644
>>>--- a/hw/nvme/ns.c
>>>+++ b/hw/nvme/ns.c
>>>@@ -441,6 +441,15 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>>>     }
>>> }
>>>+static void nvme_ns_unrealize(DeviceState *dev)
>>>+{
>>>+    NvmeNamespace *ns =3D NVME_NS(dev);
>>>+
>>>+    nvme_ns_drain(ns);
>>>+    nvme_ns_shutdown(ns);
>>>+    nvme_ns_cleanup(ns);
>>>+}
>>>+
>>> static void nvme_ns_realize(DeviceState *dev, Error **errp)
>>> {
>>>     NvmeNamespace *ns =3D NVME_NS(dev);
>>>@@ -462,6 +471,14 @@ static void nvme_ns_realize(DeviceState *dev, Error=
 **errp)
>>>                        "linked to an nvme-subsys device");
>>>             return;
>>>         }
>>>+    } else {
>>>+        /*
>>>+         * If this namespace belongs to a subsystem (through a link on =
the
>>>+         * controller device), reparent the device.
>>>+         */
>>>+        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
>>>+            return;
>>>+        }
>>
>>What happens if that fails?
>>Will we abort? Not create the namespace?
>>
>
>Good point!
>
>It can actually only fail if the bus implements check_address(), which=20
>it does not, so it always succeeds, so it should assert instead.
>

Nah, the 'if' is fine. If check_address() should be implemented at some=20
point, errp will be set and invocation of qemu will stop with an error.=20
So I think the error handling is fine as-is.

--/yTWJCWq18vyuy2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDmih0ACgkQTeGvMW1P
DekPpgf8DfWDl0hQRASk2EdxbGsgqKcFZqLq7T9bULLRlpPWe4Wt5zFAANkN8JL0
y6Zb1ZNHXOf2o5B1QWWE+wAafdNFLtToMelkxBZRhkBKOiy3DJFex9aAYr7oXwWL
fIsQWAcg4xmY2NHHmIfTu96+ZN21QKbHUW/eEvuICKlN/rpe2HeEOuIIfmqgXwvH
HD/OnkdmRVUbETRJXDzq4I7w0xdhRqOEvtxTePsKqrq6cfi9sTb/NVInCidHMvJD
BSIfoKtjAYUVGgwRIWoB7EhHorTyTfU6un+0w3Yqly0tVUpODBwaHop27yvdgd5w
27H0x+YfUDmsvsH0E2v/uDOur3bv9A==
=En0+
-----END PGP SIGNATURE-----

--/yTWJCWq18vyuy2p--

