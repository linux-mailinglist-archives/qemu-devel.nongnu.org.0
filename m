Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C85333C6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:06:31 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdbi-0007YN-6m
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdH6-0007uf-JP
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:12 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdH4-0002Yx-QV
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432310; x=1684968310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=frUCUElYnlZVDEKPU9dR5E9rgETxXuH2w5+laAR3Q4k=;
 b=fOAxkU6sxkKAGUw41n8gYd+3vlod7+5vrPe0KwjcNHZax2GXmoVF0Tn9
 o8U4ApBDm/kSNnsd5pZHEbEr9Q+3j7fpCzibDqw/IaZYZL0Usl83hrLhS
 EkaCjMLt+BNRZcyoxZf7u2ekZlDXf63cFQyhedxkGd1R5AqkAz/GSfHIG
 pOSW7wnJc2jq6x3FMSjvH8hSB7tffdmyOrmSm1bpxhN54fGHYCwaFuJL0
 bLjkQOvYqwC5Sc9lb1IxXhzfJl/0eanvECuqpR9l03sQPwa4ubZg+TlAQ
 qMTw1YPpogtyJJb357CxlABzviYxo1oCOzwLEw9Rv2ikhJCFYTfUbE2Cc g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566681"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:10 +0800
IronPort-SDR: PfhfIJ9IGNicTb8YF5tqd+zq5seAzIFkD1IdrQF+V6pCMfCBoMTsrw6c3g3YnQS4oLvyAJnKMq
 XfyJZZLWEY6/8KOro4YjDZcnH572CWz4gk1TaxxGkmc9ntWkIjh3a3pBz0yBF5SZ5b+n8ACLUY
 3YEqQxSardJXMH1vXJMVkGyeo1dbO8CTf62OrO+PYR67QWacynDKb7vFRsOdJO4Gmh09niu2CA
 iYAO0V/59TAnsorBnVCNXDOkSNl0ycgMHvmMLlRNnrYt9qMbSRsFI38TFNW3HUH5BGP9QyGjmz
 vhE0HiibNSiLl3u35XfhjlLY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:42 -0700
IronPort-SDR: /HePEpbIsOEXWVdftDbHK2O9fiVFRtuOQ+mG5UOpCWAlPhR4c9BpT8Cpd5IGeXvmx+YvgFAgVD
 eykb1vInYVfq+0rWUzddqIIKDVLnmknMaLeN3T48mUWrR75MSLtuxAolcZKHhEDfb03YRrJMeC
 hjNaTi9zOXRw0n1yCEhdMw068SpCqi925OUZJ8mGpuQ/sjNs7kMDLVDEBRLkZ0hZnp9oT2WTr0
 cKeWVdzxizgRX+YXeiLc1lylTTZkBFsh7LFFT9aBYnYREKdENz7DOPGCQECarOwuY3ijAFmPRC
 rCE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78R96H3Qz1SVp1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1653432309; x=1656024310; bh=frUCUEl
 YnlZVDEKPU9dR5E9rgETxXuH2w5+laAR3Q4k=; b=nFoCgbaWJlDsP9r0IxQRdCY
 fvswPY2hrdt4/r44O80/2AGzvBV3Pne5t65ogm3PEP+Lt0FA2ddDWl+jpQcpXkBq
 223rRB5itY6Y6kid9fUAuQfsQXfNm3Ma0hq48eJg98m+vD7+eWUNduLjUSNch/ru
 2C+lRhtF1NEoC/CuZ7kn6QHfYc728Htj5nnqFhE816wHQhmkBJVBi/fRlpZNy4ps
 SzUtdmve/grZTXVVxdYYF2UuGYfBG/BXF1THCB3a9G+sBiIG1gDbu9+9DQMcxuSl
 Q7RMRgQhMd6hUA56olqXcyoG1I6/nMnt0GfFoF72NlfSL1JbaAXlfdVQ1aDj1HQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZZ4LZuk8vNAh for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:09 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78R71QtNz1Rvlc;
 Tue, 24 May 2022 15:45:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 13/23] hw/vfio/pci-quirks: Resolve redundant property getters
Date: Wed, 25 May 2022 08:44:18 +1000
Message-Id: <20220524224428.552334-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

The QOM API already provides getters for uint64 and uint32 values, so reu=
se
them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220301225220.239065-2-shentey@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 0cf69a8c6d..f0147a050a 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1565,22 +1565,6 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice=
 *vdev, Error **errp)
     return 0;
 }
=20
-static void vfio_pci_nvlink2_get_tgt(Object *obj, Visitor *v,
-                                     const char *name,
-                                     void *opaque, Error **errp)
-{
-    uint64_t tgt =3D (uintptr_t) opaque;
-    visit_type_uint64(v, name, &tgt, errp);
-}
-
-static void vfio_pci_nvlink2_get_link_speed(Object *obj, Visitor *v,
-                                                 const char *name,
-                                                 void *opaque, Error **e=
rrp)
-{
-    uint32_t link_speed =3D (uint32_t)(uintptr_t) opaque;
-    visit_type_uint32(v, name, &link_speed, errp);
-}
-
 int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
 {
     int ret;
@@ -1618,9 +1602,9 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vd=
ev, Error **errp)
                                nv2reg->size, p);
     QLIST_INSERT_HEAD(&vdev->bars[0].quirks, quirk, next);
=20
-    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
-                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
-                        (void *) (uintptr_t) cap->tgt);
+    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
+                                   (uint64_t *) &cap->tgt,
+                                   OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
                                           nv2reg->size);
 free_exit:
@@ -1679,15 +1663,15 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Er=
ror **errp)
         QLIST_INSERT_HEAD(&vdev->bars[0].quirks, quirk, next);
     }
=20
-    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
-                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
-                        (void *) (uintptr_t) captgt->tgt);
+    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
+                                   (uint64_t *) &captgt->tgt,
+                                   OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvlink2_setup_quirk_ssatgt(vdev->vbasedev.name, captg=
t->tgt,
                                               atsdreg->size);
=20
-    object_property_add(OBJECT(vdev), "nvlink2-link-speed", "uint32",
-                        vfio_pci_nvlink2_get_link_speed, NULL, NULL,
-                        (void *) (uintptr_t) capspeed->link_speed);
+    object_property_add_uint32_ptr(OBJECT(vdev), "nvlink2-link-speed",
+                                   &capspeed->link_speed,
+                                   OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
                                               capspeed->link_speed);
 free_exit:
--=20
2.35.3


