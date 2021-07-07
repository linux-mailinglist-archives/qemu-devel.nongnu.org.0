Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E863BE625
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:07:39 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14Sw-0002Pl-HY
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m14OA-0000Ac-SN; Wed, 07 Jul 2021 06:02:42 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m14O8-0005gT-N9; Wed, 07 Jul 2021 06:02:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 64A9F5C0131;
 Wed,  7 Jul 2021 06:02:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 06:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PPIbKszdVwTKS7BB6fK6SBdoL9/
 tZAsRbDWynaeeoZ4=; b=XjnTyPMIWTgV1AxN3CRZjrVY2O2yYic1T5PKpr2ok5b
 uFhGXcrJtzwVxJORDI09zEXBAJWRO7FidDh5XZ/HPf4ofeOsej+qrwlvpRmaz36/
 +Gwjh+HmVWLugRhQzPgI+aAa2ghvwcM9iM7iO7FhyfCauhIpvMa6j5DSZWoKSyYq
 sGvC2HDikKPDQzL5RXFKOnHXhaY3Ht+ZK4Cub6OVRgY+Y1TgtTg9wqaNZY7nCI0t
 tzPTR/FU7c1Pqejs27/FqsKn33ZYEZe9zQtiKSi67UVOY1ZOSV6WBk28GsITjzc4
 cV3h2FJh8l+SGNV2hECmk9pnfvSQk7ltY8I+p7BTX0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PPIbKs
 zdVwTKS7BB6fK6SBdoL9/tZAsRbDWynaeeoZ4=; b=bKBdA6fU65VZAW9+Bbp3UL
 ex39lbOSQfoVHOTWUVAiIgjMeyzAX9G6F0QawOhJS0G9yMmhber9zU5YOcBEiPiO
 wR3q3w1KtigOeF2h9MeJp4a8EOIGZ93Ziqh3bikVk4o2pKzmJCr/DD2p4XjSZTcd
 YEqdU+SO7ffGMTMCbabEF5kme8wYYfwop8sJRoa+7MEKMd4uwMoAzUZQq2Z9+OtT
 yDoVMYRpgbSVMso2B2lVpXYaYsJ5c+puUrZfYeHjcPP2McvGzeaZ6XTJnRcdfyjC
 oYpFaazbEp0qvSfKiZTnOltCiEcA+Z1pTd270IBa+x3f32v2+ioE2js4EnTZ2vSA
 ==
X-ME-Sender: <xms:vnvlYKHFVlI0g516tKpx_tSovW9SEUxatnoK2OXbd_rOW7xBxM_2iQ>
 <xme:vnvlYLXn4ho8kp3PfZfiMe4GpOU5d7Y5wQhxKcUo2qKKDvIsVtLN9VD3mrX_xOFgr
 8DRekfdFUmINLgFCik>
X-ME-Received: <xmr:vnvlYEKeBdeeyMaJ-TyylFd0XMc2yz3NSNipdeWGHjgyQQ3jHpnPQtbSKVZqIC-ssKaDraxnrGrZ8prduTJLWXDJ-LU5pnpH_YEu_JSysozUHvMVKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vnvlYEEaT_9rQAdUzli1wchKSq8iLdPbfxN242NC6UB1qa_6JZmOhQ>
 <xmx:vnvlYAVYdJQ_2jrhKTYWX8GptMUvkrK7dlJ0IvoNSGDlEKqi5X4YpA>
 <xmx:vnvlYHOUILinL9aSxD8jhkgQNkgR56Igec3c63P8Xbx207oJRM1GGQ>
 <xmx:v3vlYOxZG59HJfZNCrLc_yT2gBvjkHdhltBd3xdtG9XkOhI1o-ZmFA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 06:02:37 -0400 (EDT)
Date: Wed, 7 Jul 2021 12:02:35 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOV7uzejwmV9pT11@apples.localdomain>
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Tv8xOeKVrr0EfKJ2"
Content-Disposition: inline
In-Reply-To: <20210706093358.1036387-5-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Tv8xOeKVrr0EfKJ2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  6 11:33, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Prior to this patch the nvme-ns devices are always children of the
>NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
>unrealized when the parent device is removed. However, when subsystems
>are involved, this is not what we want since the namespaces may be
>attached to other controllers as well.
>
>This patch adds an additional NvmeBus on the subsystem device. When
>nvme-ns devices are realized, if the parent controller device is linked
>to a subsystem, the parent bus is set to the subsystem one instead. This
>makes sure that namespaces are kept alive and not unrealized.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/nvme/nvme.h   | 18 ++++++++++--------
> hw/nvme/ctrl.c   |  8 +++++---
> hw/nvme/ns.c     | 32 +++++++++++++++++++++++++-------
> hw/nvme/subsys.c |  4 ++++
> 4 files changed, 44 insertions(+), 18 deletions(-)
>
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index c4065467d877..9401e212f9f7 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROA=
DCAST - 1);
> typedef struct NvmeCtrl NvmeCtrl;
> typedef struct NvmeNamespace NvmeNamespace;
>
>+#define TYPE_NVME_BUS "nvme-bus"
>+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
>+
>+typedef struct NvmeBus {
>+    BusState parent_bus;
>+    bool     is_subsys;
>+} NvmeBus;
>+
> #define TYPE_NVME_SUBSYS "nvme-subsys"
> #define NVME_SUBSYS(obj) \
>     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
>
> typedef struct NvmeSubsystem {
>     DeviceState parent_obj;
>+    NvmeBus     bus;
>     uint8_t     subnqn[256];
>
>     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
>@@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
>     QTAILQ_HEAD(, NvmeRequest) req_list;
> } NvmeCQueue;
>
>-#define TYPE_NVME_BUS "nvme-bus"
>-#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
>-
>-typedef struct NvmeBus {
>-    BusState parent_bus;
>-} NvmeBus;
>-
> #define TYPE_NVME "nvme"
> #define NVME(obj) \
>         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
>@@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
>
> static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
> {
>-    if (!nsid || nsid > NVME_MAX_NAMESPACES) {
>+    if (!n || !nsid || nsid > NVME_MAX_NAMESPACES) {
>         return NULL;
>     }
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 90e3ee2b70ee..7c8fca36d9a5 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
>
>     for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>         ns =3D nvme_ns(n, i);
>-        if (!ns) {
>-            continue;
>+        if (ns) {
>+            ns->attached--;
>         }
>+    }
>
>-        nvme_ns_cleanup(ns);
>+    if (n->subsys) {
>+        nvme_subsys_unregister_ctrl(n->subsys, n);
>     }
>
>     if (n->subsys) {
>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>index 3c4f5b8c714a..612a2786d75d 100644
>--- a/hw/nvme/ns.c
>+++ b/hw/nvme/ns.c
>@@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
> static void nvme_ns_realize(DeviceState *dev, Error **errp)
> {
>     NvmeNamespace *ns =3D NVME_NS(dev);
>-    BusState *s =3D qdev_get_parent_bus(dev);
>-    NvmeCtrl *n =3D NVME(s->parent);
>-    NvmeSubsystem *subsys =3D n->subsys;
>+    BusState *qbus =3D qdev_get_parent_bus(dev);
>+    NvmeBus *bus =3D NVME_BUS(qbus);
>+    NvmeCtrl *n =3D NULL;
>+    NvmeSubsystem *subsys =3D NULL;
>     uint32_t nsid =3D ns->params.nsid;
>     int i;
>
>-    if (!n->subsys) {
>+    if (bus->is_subsys) {
>+        subsys =3D NVME_SUBSYS(qbus->parent);
>+    } else {
>+        n =3D NVME(qbus->parent);
>+        subsys =3D n->subsys;
>+    }

So, I realized that this if is not needed, since the device will always=20
attach to the bus from the nvme device, never the 'fake' one from the=20
subsystem.

>+
>+    if (subsys) {
>+        /*
>+         * If this namespace belongs to a subsystem (through a link on the
>+         * controller device), reparent the device.
>+         */
>+        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
>+            return;
>+        }
>+    } else {
>         if (ns->params.detached) {
>             error_setg(errp, "detached requires that the nvme device is "
>                        "linked to an nvme-subsys device");
>@@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **=
errp)
>
>     if (!nsid) {
>         for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>-            if (nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
>+            if (nvme_subsys_ns(subsys, i) || nvme_ns(n, i)) {
>                 continue;
>             }
>
>@@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **=
errp)
>             return;
>         }
>     } else {
>-        if (nvme_ns(n, nsid) || nvme_subsys_ns(subsys, nsid)) {
>+        if (nvme_subsys_ns(subsys, nsid) || nvme_ns(n, nsid)) {
>             error_setg(errp, "namespace id '%d' already allocated", nsid);
>             return;
>         }
>@@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState *dev, Error **=
errp)
>         }
>     }
>
>-    nvme_attach_ns(n, ns);
>+    if (n) {
>+        nvme_attach_ns(n, ns);
>+    }
> }
>
> static Property nvme_ns_props[] =3D {
>diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>index 92caa604a280..fb7c3a7c55fc 100644
>--- a/hw/nvme/subsys.c
>+++ b/hw/nvme/subsys.c
>@@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState *dev, Error=
 **errp)
> {
>     NvmeSubsystem *subsys =3D NVME_SUBSYS(dev);
>
>+    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
>+                        dev->id);
>+    subsys->bus.is_subsys =3D true;
>+
>     nvme_subsys_setup(subsys);
> }
>
>--=20
>2.32.0
>
>

--Tv8xOeKVrr0EfKJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDle7kACgkQTeGvMW1P
DekNrAf/RCJ8N6pvTVx/9x0ET/D93PNY442yX5F/WIHQDDPnOsNiBp5OuTyZoy9q
80dsu6CxtUL8fB1BF6Jwmd8fiVNHp3/gW22U+l4mGLYOKQhXdAg19PDiekmXfP7f
WI44Nm2vEwqCjY2Ff8CBNVhRtxxaQqsZ9ZOfswGjbfZ47PY04DCuTLw1jxoYBPx8
0papd7Jyfzdbf8l9SRkNZUom9/CeBnSU8cPlQJjV+kIaQXrYX6t9eI0r3sHClb16
birug+ezF8SyTwjnFIu1wzy98n1cJOJDIFx4t/YbGaWK1La3JKNb2BE9+Ijm3CWE
UF3vPNbDEZTknCA3Bk3CCgqIyHYYTQ==
=D4Rz
-----END PGP SIGNATURE-----

--Tv8xOeKVrr0EfKJ2--

