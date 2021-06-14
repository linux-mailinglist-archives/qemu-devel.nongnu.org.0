Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A33A702B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:21:31 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lst5O-0002ir-S1
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lst3S-0000Ya-36; Mon, 14 Jun 2021 16:19:30 -0400
Received: from mout.gmx.net ([212.227.17.22]:54135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lst3K-0008Ml-A2; Mon, 14 Jun 2021 16:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623701954;
 bh=cFuk5QEea/OM1ma3BUUW7V5tDNdgOzxk3DozvdLmZDA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AwWet850kzdkjydRs2Gsjxr+cXWFel2bXHTrE1XmDJvz/TGoEt2iSkJ+bGv7EC5kj
 KeK07uqgtjyu0yuqSffIPin4NHFBBd43yLJ4z+5RlT0fzbK2cgihf2PT+iMhpMaD5P
 sVH5flSYP13v2eLl8iJ7HPhAvD42+wGpI1nGp6l4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M9Wyy-1lwAqM2gpY-005VUw; Mon, 14
 Jun 2021 22:19:14 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>
Subject: [PATCH v3 2/2] hw/nvme: default for namespace EUI-64
Date: Mon, 14 Jun 2021 22:19:01 +0200
Message-Id: <20210614201901.17871-3-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210614201901.17871-1-xypron.glpk@gmx.de>
References: <20210614201901.17871-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VEJhc2VqTkuU52FJ0ZpivjqK4O3/e76lTgNcRFC3TyOO0xgcAmY
 8f5KKgvAi/mYMvJil97zKOKbAgWWzgNWiaZLUxfUfutKUuUekezEDB1pTmuVd7iHTQFlULs
 UlAa7L9A3C9ZFmhBg2hYbwm4+mnk/8xsJmGa/Y2C1ZEtg5YOJfTQa1czH7TC6n9pNjatjp/
 nHIHtDVXZN4oqolfX1izg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vYWDNKdYT3Y=:w4Es+XUPn7uNXJgeGLWtC4
 mWO6Ej4gw02IHqoj4bJ8X6NsoQJGymivEO5g4sWjJCSy0CmEeCeDTImypl4uZimfx7XP4ULIj
 Emx0PhPK0z6sGX0uhqgYW/KK08TiDgNEDYwzrSBQz+GghBesD76gUEIxrmQitza54zokm90Lm
 INWEQqxhryhFGkDvVPjq/CHrZLHcoIzalovkfA7FjlBHmlgzbzHAzuCoGdqzbhA7K5ssV9nX5
 acKjdWoOxKtOgnj5f9ou8p4Aeps3z72Kia8VK/ProBHoabTanJyvprtpl2SMa+qEN094EyqB8
 qpBF7NFdf5cZFS+QCw3WBJo3WkfI6j8wOn6Tix3EcJ2NXkefS2KqQ14O2UWVeqrYRkEPSUrVo
 obMO6LeJYUWFHfNKustAOdF2ngoI7gSXIXNd1ULl/yDikgBFWJuYly125q1TFq6u2VTiDWBl3
 54Cw84b3ERs0EEypgauQJNqPJGCc+qW9ywftt2PC5EcS01YZ7BsOkEwUTCU3xQ6JfIZquxBEr
 l1DyAkbGs/WPy+Ehn9cb5rsjCBrJYkVvL/VRjiznx7L8XoiZnmQ9l/CbT+r7Sgs6wFqnmKvcF
 8Vg7n/Iyt65Lchc3W7omHq0HCDTRElMzW4JPKD/tyQCDUlJ6jHPt8XZUUGcWLyM3JIgnCqIB/
 HfHz7yrkwnPEOdnsyi2K6fPRiA/BT69UXU4RTfe5mzgd39xx5ZkCFnxfx/nwudOP7hwuY4af8
 /2O8jVWmVd2KWqefEG0hPDEBHVzbEwI7MOpfMKA556yYGXu7QCqInKX185S84m26vnf7zFISN
 hjon8s7DhpOzNV5vyBD7g2NEMcsyTgdsc6TpoZjizVRLR24El5XjBNzSJs9FWd9X9Zr1A3sZz
 3oK6UD2lPPFxy6POjcCgBTUNmiGa8H4QTnZY2WbeYHTwUqi1e6sZyg22gzrBB8A5wxyXsM82l
 8caurdKaK2Aa4xWsqRiF2caH+c5gYvriqNFv4VKOwzQ5zWzQQaMenL2w2v+2nlYrcNkRAHcle
 mKOZXBTKMPe1uAaryCVAIaLxzEQxeYDejuxGyC0eKDmsCkTuCRFpvHIY3TrUyR06qwgv03H9w
 zqdrnFwHWKUVfEYTsR/BKZmIYp/lAqH8qeP
Received-SPF: pass client-ip=212.227.17.22; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On machines with version > 6.0 replace a missing EUI-64 by a generated
value.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
v3:
	use 52-54-00-00-00-00-00-00 as starting values for generating
	EUI-64s
v2:
	new patch
=2D--
 docs/system/nvme.rst | 2 ++
 hw/core/machine.c    | 1 +
 hw/nvme/ns.c         | 9 +++++++++
 hw/nvme/nvme.h       | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index b5f8288d7c..33a15c7dbc 100644
=2D-- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -84,6 +84,8 @@ There are a number of parameters available:
 ``eui64``
   Set the EUI-64 of the namespace. This will be reported as a "IEEE Exten=
ded
   Unique Identifier" descriptor in the Namespace Identification Descripto=
r List.
+  Since machine type 6.1 a non-zero default value is used if the paramete=
r
+  is not provided. For earlier machine types the field defaults to 0.

 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used =
to
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 55b9bc7817..d0e9348888 100644
=2D-- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@
 GlobalProperty hw_compat_6_0[] =3D {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
+    { "nvme-ns", "eui64-default", "off"},
 };
 const size_t hw_compat_6_0_len =3D G_N_ELEMENTS(hw_compat_6_0);

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 45e457de6a..4275c3db63 100644
=2D-- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -56,6 +56,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)

 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
+    static uint64_t ns_count;
     NvmeIdNs *id_ns =3D &ns->id_ns;
     uint8_t ds;
     uint16_t ms;
@@ -73,6 +74,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp=
)
         id_ns->nmic |=3D NVME_NMIC_NS_SHARED;
     }

+    /* Substitute a missing EUI-64 by an autogenerated one */
+    ++ns_count;
+    if (!ns->params.eui64 && ns->params.eui64_default) {
+        ns->params.eui64 =3D ns_count + NVME_EUI64_DEFAULT;
+    }
+
     /* simple copy */
     id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
     id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
@@ -533,6 +540,8 @@ static Property nvme_ns_props[] =3D {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default=
,
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index ac90e13d7b..371ac9bfd8 100644
=2D-- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -26,6 +26,7 @@

 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
+#define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)

 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
@@ -84,6 +85,7 @@ typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     QemuUUID uuid;
     uint64_t eui64;
+    bool     eui64_default;

     uint16_t ms;
     uint8_t  mset;
=2D-
2.30.2


