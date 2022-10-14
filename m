Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF55FEA31
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:11:07 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFmb-00010k-QF
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbH-0002dY-MG
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:24 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbE-0001to-I3
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734360; x=1697270360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ASfuB1PE1bBH8PZby4AMXV092rPXBh0GNCgM9O0WMI=;
 b=aMKbi8QkJf/yjhgOsb81REq51yBjYtrrSwtDHSGdbWUEo6QMRUn+OKUL
 HlbZDqMJzPC6LIKFTgCOk7x+zfWZK+aRgWVz1DFlvXeBlPEQhEjriVYQS
 ZqBNBwGbiIMgoLvQ1vXPLGASgut1L6TZigrLTgsw/8LzboXOgqWScHYgO
 qziV4wVt8ORZD7mzYRiRq5gsejdlfzbBN7dLnd5e6GlbNe1d7ewwsP2n3
 e8wyEYi/IWre2TPXoGiorIrMviv3/FKElY9m74XxLYD1+OOtzIU53HcZh
 hiSsdDE4g7cu/rBtWxac/sBOVE/utjdgp81UnlZid35Po6Bz2WPI/xxNc Q==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="318091163"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:12 +0800
IronPort-SDR: 7rILwU9bGcXV/7XFoNi70lfRW7yIM8F4Drx8BmvJbQ255moNQvWu+OTaM/BgG1J8Azv1Q2uuMR
 buYXpz9SDn5BORP4jP5yjwCBG/tHyUf//piXg8J64PgfM3VQg0yYEWku0qFfe6BWbOIMXGb5Au
 4hgb8INx6fc5av0pRsWZU7+poQ84CwbqRT3PvuFq7O6Af0vNs4DDXU4T5pT6qO16pgnnWLD9tA
 vTtervgawS4LoTT1uSZKL95ESpIu4FEJ1BUS13I1+kQZZrgKZPq2UjFG1rdsM2ONeefxuP+LkM
 hmvy7lNXwsIeH3qbR5i6DIvZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:13:11 -0700
IronPort-SDR: c0OLmpMQKzevfc96r8RgRqnnnoFugiVLO3CTwFhXp8vUe89HsO9IsfbQWex5xAXB2C0e5Ejabv
 oz1wPAfYghoQwClg6Jp+l7IwAt1IxtPEyt5XzW17U1cA8flCe3BA8rXMWvlMccvyhcbpPq3JCu
 XL+/w/A4w14l81cKSbRBbWHkowQ62NQ+MnT1HZOwXLEYel3ZIOyTsiqQIePBNaaCTYRFshUeQC
 KprCRDeeKRn7jx8K0/A/FM2Az7qnofhCoIxIH63JLSVKeYzhSXJrRMHQpc6yOS7eNxc6LBjelU
 c1k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf0v6JCjz1RwqL
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734350; x=1668326351; bh=7ASfuB1PE1bBH8PZby
 4AMXV092rPXBh0GNCgM9O0WMI=; b=oVsbjuBmHz+5xC10sE1DngbwNAaBI4dZY5
 k+YMQhucAm51UYJViU/ON5B89zofEHF5MF9Yt89Vkuy3E8AkThEB+xyjr+hAfmU2
 XasWjxq6Tqng6L0YuAxpih9JFhEaLKKdkoSgWwRJcZLp40sewiL6gg7oxCWhmA/G
 zPl7P+6VaWGPJha6SVCQAowQ6ZqIuyBMMSyafyJpc4m5Y0Caqxm3woR9qXl9ZfIP
 f2w/b1ffpEfv+HDopKEWqL6tjFq8f3XcoDUsmV4WU70ums+w3bu6RothtXSz7km5
 zl7bjB4qRAIaT/K5HWPpXMThodxva8nycNjt9wMj1DHY91SbgJ1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id w67UmSHQWJ-B for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:59:10 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf0n5N9jz1RvLy;
 Fri, 14 Oct 2022 00:59:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <gaosong@loongson.cn>
Subject: [PULL 04/10] hw/arm,
 loongarch: Move load_image_to_fw_cfg() to common location
Date: Fri, 14 Oct 2022 17:58:24 +1000
Message-Id: <20221014075830.914722-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Sunil V L <sunilvl@ventanamicro.com>

load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
function will be required by riscv too. So, it's time to refactor and
move this function to a common path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20221004092351.18209-2-sunilvl@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 82 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index e4fef393be..2e503904dc 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -364,4 +364,25 @@ bool fw_cfg_dma_enabled(void *opaque);
  */
 const char *fw_cfg_arch_key_name(uint16_t key);
=20
+/**
+ * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry iden=
tified
+ *                          by key.
+ * @fw_cfg:         The firmware config instance to store the data in.
+ * @size_key:       The firmware config key to store the size of the loa=
ded
+ *                  data under, with fw_cfg_add_i32().
+ * @data_key:       The firmware config key to store the loaded data und=
er,
+ *                  with fw_cfg_add_bytes().
+ * @image_name:     The name of the image file to load. If it is NULL, t=
he
+ *                  function returns without doing anything.
+ * @try_decompress: Whether the image should be decompressed (gunzipped)=
 before
+ *                  adding it to fw_cfg. If decompression fails, the ima=
ge is
+ *                  loaded as-is.
+ *
+ * In case of failure, the function prints an error message to stderr an=
d the
+ * process exits with status 1.
+ */
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress);
+
 #endif
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ee3858b673..b0b92af188 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -822,55 +822,6 @@ static void do_cpu_reset(void *opaque)
     }
 }
=20
-/**
- * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry iden=
tified
- *                          by key.
- * @fw_cfg:         The firmware config instance to store the data in.
- * @size_key:       The firmware config key to store the size of the loa=
ded
- *                  data under, with fw_cfg_add_i32().
- * @data_key:       The firmware config key to store the loaded data und=
er,
- *                  with fw_cfg_add_bytes().
- * @image_name:     The name of the image file to load. If it is NULL, t=
he
- *                  function returns without doing anything.
- * @try_decompress: Whether the image should be decompressed (gunzipped)=
 before
- *                  adding it to fw_cfg. If decompression fails, the ima=
ge is
- *                  loaded as-is.
- *
- * In case of failure, the function prints an error message to stderr an=
d the
- * process exits with status 1.
- */
-static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
-                                 uint16_t data_key, const char *image_na=
me,
-                                 bool try_decompress)
-{
-    size_t size =3D -1;
-    uint8_t *data;
-
-    if (image_name =3D=3D NULL) {
-        return;
-    }
-
-    if (try_decompress) {
-        size =3D load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &d=
ata);
-    }
-
-    if (size =3D=3D (size_t)-1) {
-        gchar *contents;
-        gsize length;
-
-        if (!g_file_get_contents(image_name, &contents, &length, NULL)) =
{
-            error_report("failed to load \"%s\"", image_name);
-            exit(1);
-        }
-        size =3D length;
-        data =3D (uint8_t *)contents;
-    }
-
-    fw_cfg_add_i32(fw_cfg, size_key, size);
-    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
-}
-
 static int do_arm_linux_init(Object *obj, void *opaque)
 {
     if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 29df99727d..4b595a9ea4 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -598,39 +598,6 @@ static void reset_load_elf(void *opaque)
     }
 }
=20
-/* Load an image file into an fw_cfg entry identified by key. */
-static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
-                                 uint16_t data_key, const char *image_na=
me,
-                                 bool try_decompress)
-{
-    size_t size =3D -1;
-    uint8_t *data;
-
-    if (image_name =3D=3D NULL) {
-        return;
-    }
-
-    if (try_decompress) {
-        size =3D load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &d=
ata);
-    }
-
-    if (size =3D=3D (size_t)-1) {
-        gchar *contents;
-        gsize length;
-
-        if (!g_file_get_contents(image_name, &contents, &length, NULL)) =
{
-            error_report("failed to load \"%s\"", image_name);
-            exit(1);
-        }
-        size =3D length;
-        data =3D (uint8_t *)contents;
-    }
-
-    fw_cfg_add_i32(fw_cfg, size_key, size);
-    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
-}
-
 static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
 {
     /*
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 564bda3395..6edf5ea3e9 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/loader.h"
=20
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
=20
@@ -1221,6 +1222,37 @@ FWCfgState *fw_cfg_find(void)
     return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
 }
=20
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress)
+{
+    size_t size =3D -1;
+    uint8_t *data;
+
+    if (image_name =3D=3D NULL) {
+        return;
+    }
+
+    if (try_decompress) {
+        size =3D load_image_gzipped_buffer(image_name,
+                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &d=
ata);
+    }
+
+    if (size =3D=3D (size_t)-1) {
+        gchar *contents;
+        gsize length;
+
+        if (!g_file_get_contents(image_name, &contents, &length, NULL)) =
{
+            error_report("failed to load \"%s\"", image_name);
+            exit(1);
+        }
+        size =3D length;
+        data =3D (uint8_t *)contents;
+    }
+
+    fw_cfg_add_i32(fw_cfg, size_key, size);
+    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
+}
=20
 static void fw_cfg_class_init(ObjectClass *klass, void *data)
 {
--=20
2.37.3


