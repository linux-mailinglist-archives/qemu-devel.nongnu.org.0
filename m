Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5F3A136D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:49:10 +0200 (CEST)
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwhp-0005YA-DJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lqwgP-0004C5-K5
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:47:41 -0400
Received: from mout.gmx.net ([212.227.15.15]:52699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lqwgN-0005e5-Cr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623239248;
 bh=h3bG2d6O9wbNXJDc9w8ab19YVU4DdZVbv2as6OzqpWI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=AUCtrOlSekmMpRMrFnn/T/JOGrDJR4X/PRD6aYM+YwUgyXRpa8hqD3om/zLql5dkf
 /3xZK/eG+zQuLw1QFKIgtpOLD8mrfx932X4VAWt+y27UTAShpy51DLQpOcCJ5fLdVg
 DxsNiHLKX4/KFQyyGZnfuH0+/Q8jmFNz7sp89eOM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mlf4S-1lQvKs1s7W-00igfJ; Wed, 09
 Jun 2021 13:47:28 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Date: Wed,  9 Jun 2021 13:46:57 +0200
Message-Id: <20210609114657.33301-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CTqidYWfLnGOC/ReC4+IIE9GomLM9+Ejd7UYKCZUE541mQp7XIu
 X8tsELcPfacXdmD0unxiv7o0t6P+iKnDWnSjNrOheXZHnIqLTJWclTEMDkOk5mRipgFU/YR
 /B4O954KSIJIaciGTT5UGpSHJx7cR0iz4AOC0wl/RJ3MuuI8j7jVj9Yiqbzny8ua+PdoW7H
 VyNpyKYl+Hv0WWgqQw2iA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SeczRVwY3Kg=:efjEf7GLnzu/yUPoOk24Ih
 MVz5vdCRWXZBiqDFZU8cGVSoh5LyHOpptOKUYmUopAanSi3xXLKZnC1gT5ObxvhTTDC9j/IUs
 4WdzMBKHKwGdnzrUKSsDFbJXoFvQJTr25XkQRdFNUTePUKJmqBQjwKm+E/cR+TR390zxkv+45
 hMQ9tCwhC1as4U1wkFKX7Kx0OEhVnx3v1osmgVG+8mdY0pTUr3PiBldjR54fc/X8uXi3M2omh
 ATHA9Z9PJAYi4WeUP01qjNfH2sjjeMe3l8xl4qHb8WfeUzs9c6bdQxV60nJmnLAcgkuc09itg
 gc2QlYFJxHEkOZG1mmARWn3rlJnPXCTtX6w0tNXmHes3J0S1/MWss5JTOPfAgBOU9YMDVJkJB
 rpuQW5awtKphu9khayGn3hmMk23Ya+1nu2Qc0CLKmgllOcKJ09f3az18tzb/zimyD4/qXCcLk
 g8vfQ3hp4EzKtHyWjffJ8+BfnVv0LN5jKUUkJ8m4JJMXAws0SWqDGtCwdzr3atydJQVHFZ7Rn
 GegIfRf3euECTBn2VUnr14EtZIuVzJ7ZDLDTBy1ZtobA1E0kBw+IIW/5wW7TRuUZN8izZ4kbF
 L3S5hAZmponCH6FQaGYfjgwNU8qxecNMRjHac2nNJIrcFXlFQQZHAOQNk8MDc4leZM+Kdwpsk
 ugRnpZSZjs+7UKwwOnabHfqCkJec5ECkemGi3OnXzNN3ETbSZxM8CjbGa3t4abvaZTlZ/w/y0
 ZXpYV8yu6iIlXrncn+wyp3HAgl3YOrd/4aebsrRLnVQUpR4Gpxvhf6qdrOEapF4WGGa15hkPW
 pIEfToobmnBkwpfid448mIDRo4tSnTAHjDSybWjKqg1DqXcTel37SNLYO75NKBXdpQ3wPHooI
 F5UREIu186uTjnqQ+W8d/wbhawmr5SulOGi2ITfBFlNunWudWtn98AjX6kpAvhjmuNiN3ERkN
 c6A4gRoQT40CDB6nDYXiKjGzameAWftEFzgYbCw54Gk5AfucHbiBev9VyYtYfiuGcp0cEG8O5
 phG8xzYVypT1hJgJXHMWBbyg4bn/POWh71y9DMQA8J3n3RzKjxsbYGJan72i14Bept2G307S2
 +hNifG+gqJPqbKt6s39K5B7bC2QdRvvN8rs
Received-SPF: pass client-ip=212.227.15.15; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The EUI64 field is the only identifier for NVMe namespaces in UEFI device
paths. Add a new namespace property "eui64", that provides the user the
option to specify the EUI64.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
 docs/system/nvme.rst |  4 +++
 hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
 hw/nvme/ns.c         |  2 ++
 hw/nvme/nvme.h       |  1 +
 4 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index f7f63d6bf6..a6042f942a 100644
=2D-- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -81,6 +81,10 @@ There are a number of parameters available:
   Set the UUID of the namespace. This will be reported as a "Namespace UU=
ID"
   descriptor in the Namespace Identification Descriptor List.

+``eui64``
+  Set the EUI64 of the namespace. This will be reported as a "IEEE Extend=
ed
+  Unique Identifier" descriptor in the Namespace Identification Descripto=
r List.
+
 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used =
to
   attach the namespace to a specific ``nvme`` device (identified by an ``=
id``
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f..21f2d6843b 100644
=2D-- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4426,19 +4426,19 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCt=
rl *n, NvmeRequest *req)
     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
     uint32_t nsid =3D le32_to_cpu(c->nsid);
     uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
-
-    struct data {
-        struct {
-            NvmeIdNsDescr hdr;
-            uint8_t v[NVME_NIDL_UUID];
-        } uuid;
-        struct {
-            NvmeIdNsDescr hdr;
-            uint8_t v;
-        } csi;
-    };
-
-    struct data *ns_descrs =3D (struct data *)list;
+    uint8_t *pos =3D list;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint8_t v[NVME_NIDL_UUID];
+    } QEMU_PACKED uuid;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint64_t v;
+    } QEMU_PACKED eui64;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint8_t v;
+    } QEMU_PACKED csi;

     trace_pci_nvme_identify_ns_descr_list(nsid);

@@ -4452,17 +4452,29 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCt=
rl *n, NvmeRequest *req)
     }

     /*
-     * Because the NGUID and EUI64 fields are 0 in the Identify Namespace=
 data
-     * structure, a Namespace UUID (nidt =3D 3h) must be reported in the
-     * Namespace Identification Descriptor. Add the namespace UUID here.
+     * If the EUI64 field is 0 and the NGUID field is 0, the namespace mu=
st
+     * provide a valid Namespace UUID in the Namespace Identification Des=
criptor
+     * data structure. QEMU does not yet support setting NGUID.
      */
-    ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
-    ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
-    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
-
-    ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
-    ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
-    ns_descrs->csi.v =3D ns->csi;
+    uuid.hdr.nidt =3D NVME_NIDT_UUID;
+    uuid.hdr.nidl =3D NVME_NIDL_UUID;
+    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
+    memcpy(pos, &uuid, sizeof(uuid));
+    pos +=3D sizeof(uuid);
+
+    if (ns->params.eui64) {
+        eui64.hdr.nidt =3D NVME_NIDT_EUI64;
+        eui64.hdr.nidl =3D NVME_NIDL_EUI64;
+        eui64.v =3D cpu_to_be64(ns->params.eui64);
+        memcpy(pos, &eui64, sizeof(eui64));
+        pos +=3D sizeof(eui64);
+    }
+
+    csi.hdr.nidt =3D NVME_NIDT_CSI;
+    csi.hdr.nidl =3D NVME_NIDL_CSI;
+    csi.v =3D ns->csi;
+    memcpy(pos, &csi, sizeof(csi));
+    pos +=3D sizeof(csi);

     return nvme_c2h(n, list, sizeof(list), req);
 }
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 992e5a13f5..ddf395d60e 100644
=2D-- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
     id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
     id_ns->msrc =3D ns->params.msrc;
+    id_ns->eui64 =3D cpu_to_be64(ns->params.eui64);

     ds =3D 31 - clz32(ns->blkconf.logical_block_size);
     ms =3D ns->params.ms;
@@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 81a35cda14..abe7fab21c 100644
=2D-- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
     bool     shared;
     uint32_t nsid;
     QemuUUID uuid;
+    uint64_t eui64;

     uint16_t ms;
     uint8_t  mset;
=2D-
2.30.2


