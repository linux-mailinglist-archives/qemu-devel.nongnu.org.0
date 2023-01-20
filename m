Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF2674E78
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0A-0007nO-RK; Fri, 20 Jan 2023 02:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzr-0007cD-Ky
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:38 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzp-0004mn-NQ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200373; x=1705736373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bZ8NUI7Xi8BQY+uA/N+c8ofowZfC+0PX5iTKB91CNiY=;
 b=dIwqV6PAUNeX5ZgvOqnmxB3kxTWUumdVYbY8hdNAY6yGWL9+VgJ+uMVI
 uZA6dMpLDqXtUn4VHYjmsiRy4/lEvA06FodQgqgwF0Eb/UDE7c7MQ10rt
 U4cQevD03YsKLuCsIUsagezilgQN5Pj+m5VGR2J7bjAMqM62xBFc2dz4r
 3y5Y88I80N7A2lU0E441zktBPnLfR1bTrSSyKJAOaE9RaZxefxXCjPh2I
 WyEaNigWG0mhzHcBozo7VSrKRegSfuK+xCQvZkDAsGBnmlYMj2rpvqzl0
 ZB1loA4y7jOzF1vAoC3SxJaOvvarZHcZfWfaAQx2wGmD1PfLFyTfUHN+7 g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176681"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:30 +0800
IronPort-SDR: e31VRYtdkZExT65rXOZ+dJiBqEtQs6TbTPUV9cRRdeQ9k0r/wWpT9JMzAZf/nzGkMVnb6+jDWx
 /ZC5rGISHQ7BBvU1WVtcPM6BQ255R73/kpsx0w1WNc4m0lTZ0Csqb2Lm4jzrwYDJzOm2wi7oS5
 4Dg8CPNDmWvRC1DR7hr9qP7pVzTJBTAsgtRU51eF6CW3pmW3+rFUyZs9cFfXTLaf5pLuOPHbuU
 WKYykELtEjVDQQW+TNGtUOL6degxfq2ZMAiAStKpeujmq0BALUdjSvs4lV6/rTh6bFKzwKLHnu
 dG0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:08 -0800
IronPort-SDR: ywTQxTThI2sho6VZfLcEdXwo3mfqp7htqFBK8RHP40mUCU2Lra5LkUna3IaC+/KCvPVcFbtgFM
 9JlmiU+OD85dKusha7z1e1ZOJccRM5QitW2lGvhwBiYbhbMUBl4MvefNcdRvH8hjk8ool4dbWG
 xz8MF7xeR0HGdVkLcnYXvN2tKVnAkOyGoWau7qH6mVFGBgLM6LyRLPdPpxCAIlEprdn4fTzmqj
 Cx6Uj2MKab+ySPBPgfcSKz1k+U29ihr+5qRYwu0C31XwYznRFMfrB+pSCl82jILrpN85woqvMC
 ghI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrwy2Tfxz1RvTr
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200369; x=1676792370; bh=bZ8NUI7Xi8BQY+uA/N
 +c8ofowZfC+0PX5iTKB91CNiY=; b=SRg5WY8eoNGQGHs0H3iGQp4sV/YpwlmGLd
 d0KBlBOZwqQ3Fmjw62xEb6jM39cCvG1JKODmo7ibSicMSPZXy1DktY2lcqLC7rd9
 stRPQyapmeSbWF3/C066xNuRE6/IB8VezUSRZseS253ElVgkfXUEq8Inh0xGyouq
 vUpEiHDDpjIBDlDS0MHfxFBwIb1XVscq+s5tQPYbtXb1N4DqeNcmXAWdbfoU10k9
 BSSwKU27vACmCFmxHrmunCCcuXl1VRwjEPh2p61QOQnaSGePKm1EiA3MumjFPuh4
 8Yhlgkfa7cc/l+1XfWYXsJB4h5fsRd/VE0/GZBzF1PJUSEvSehuw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Rnfzo_fYw0QE for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:29 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrww2h6xz1RvLy;
 Thu, 19 Jan 2023 23:39:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/37] hw/char: riscv_htif: Use conventional 's' for HTIFState
Date: Fri, 20 Jan 2023 17:38:40 +1000
Message-Id: <20230120073913.1028407-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

QEMU source codes tend to use 's' to represent the hardware state.
Let's use it for HTIFState.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-5-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/riscv_htif.c | 64 ++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index e7e319ca1d..f28976b110 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -85,7 +85,7 @@ static int htif_can_recv(void *opaque)
  */
 static void htif_recv(void *opaque, const uint8_t *buf, int size)
 {
-    HTIFState *htifstate =3D opaque;
+    HTIFState *s =3D opaque;
=20
     if (size !=3D 1) {
         return;
@@ -97,10 +97,10 @@ static void htif_recv(void *opaque, const uint8_t *bu=
f, int size)
      *        will drop characters
      */
=20
-    uint64_t val_written =3D htifstate->pending_read;
+    uint64_t val_written =3D s->pending_read;
     uint64_t resp =3D 0x100 | *buf;
=20
-    htifstate->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 1=
6 >> 16);
+    s->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 16 >> 16)=
;
 }
=20
 /*
@@ -142,7 +142,7 @@ static int htif_be_change(void *opaque)
  * For RV32, the tohost register is zero-extended, so only device=3D0 an=
d
  * command=3D0 (i.e. HTIF syscalls/exit codes) are supported.
  */
-static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_=
written)
+static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
 {
     uint8_t device =3D val_written >> HTIF_DEV_SHIFT;
     uint8_t cmd =3D val_written >> HTIF_CMD_SHIFT;
@@ -174,11 +174,11 @@ static void htif_handle_tohost_write(HTIFState *hti=
fstate, uint64_t val_written)
         /* HTIF Console */
         if (cmd =3D=3D HTIF_CONSOLE_CMD_GETC) {
             /* this should be a queue, but not yet implemented as such *=
/
-            htifstate->pending_read =3D val_written;
-            htifstate->env->mtohost =3D 0; /* clear to indicate we read =
*/
+            s->pending_read =3D val_written;
+            s->env->mtohost =3D 0; /* clear to indicate we read */
             return;
         } else if (cmd =3D=3D HTIF_CONSOLE_CMD_PUTC) {
-            qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
+            qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
             resp =3D 0x100 | (uint8_t)payload;
         } else {
             qemu_log("HTIF device %d: unknown command\n", device);
@@ -194,31 +194,31 @@ static void htif_handle_tohost_write(HTIFState *hti=
fstate, uint64_t val_written)
      * With this code disabled, qemu works with bbl priv v1.9.1 and v1.1=
0.
      * HTIF needs protocol documentation and a more complete state machi=
ne.
      *
-     *  while (!htifstate->fromhost_inprogress &&
-     *      htifstate->env->mfromhost !=3D 0x0) {
+     *  while (!s->fromhost_inprogress &&
+     *      s->env->mfromhost !=3D 0x0) {
      *  }
      */
-    htifstate->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 1=
6 >> 16);
-    htifstate->env->mtohost =3D 0; /* clear to indicate we read */
+    s->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 16 >> 16)=
;
+    s->env->mtohost =3D 0; /* clear to indicate we read */
 }
=20
-#define TOHOST_OFFSET1 (htifstate->tohost_offset)
-#define TOHOST_OFFSET2 (htifstate->tohost_offset + 4)
-#define FROMHOST_OFFSET1 (htifstate->fromhost_offset)
-#define FROMHOST_OFFSET2 (htifstate->fromhost_offset + 4)
+#define TOHOST_OFFSET1      (s->tohost_offset)
+#define TOHOST_OFFSET2      (s->tohost_offset + 4)
+#define FROMHOST_OFFSET1    (s->fromhost_offset)
+#define FROMHOST_OFFSET2    (s->fromhost_offset + 4)
=20
 /* CPU wants to read an HTIF register */
 static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
-    HTIFState *htifstate =3D opaque;
+    HTIFState *s =3D opaque;
     if (addr =3D=3D TOHOST_OFFSET1) {
-        return htifstate->env->mtohost & 0xFFFFFFFF;
+        return s->env->mtohost & 0xFFFFFFFF;
     } else if (addr =3D=3D TOHOST_OFFSET2) {
-        return (htifstate->env->mtohost >> 32) & 0xFFFFFFFF;
+        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
     } else if (addr =3D=3D FROMHOST_OFFSET1) {
-        return htifstate->env->mfromhost & 0xFFFFFFFF;
+        return s->env->mfromhost & 0xFFFFFFFF;
     } else if (addr =3D=3D FROMHOST_OFFSET2) {
-        return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
+        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
     } else {
         qemu_log("Invalid htif read: address %016" PRIx64 "\n",
             (uint64_t)addr);
@@ -230,25 +230,25 @@ static uint64_t htif_mm_read(void *opaque, hwaddr a=
ddr, unsigned size)
 static void htif_mm_write(void *opaque, hwaddr addr,
                           uint64_t value, unsigned size)
 {
-    HTIFState *htifstate =3D opaque;
+    HTIFState *s =3D opaque;
     if (addr =3D=3D TOHOST_OFFSET1) {
-        if (htifstate->env->mtohost =3D=3D 0x0) {
-            htifstate->allow_tohost =3D 1;
-            htifstate->env->mtohost =3D value & 0xFFFFFFFF;
+        if (s->env->mtohost =3D=3D 0x0) {
+            s->allow_tohost =3D 1;
+            s->env->mtohost =3D value & 0xFFFFFFFF;
         } else {
-            htifstate->allow_tohost =3D 0;
+            s->allow_tohost =3D 0;
         }
     } else if (addr =3D=3D TOHOST_OFFSET2) {
-        if (htifstate->allow_tohost) {
-            htifstate->env->mtohost |=3D value << 32;
-            htif_handle_tohost_write(htifstate, htifstate->env->mtohost)=
;
+        if (s->allow_tohost) {
+            s->env->mtohost |=3D value << 32;
+            htif_handle_tohost_write(s, s->env->mtohost);
         }
     } else if (addr =3D=3D FROMHOST_OFFSET1) {
-        htifstate->fromhost_inprogress =3D 1;
-        htifstate->env->mfromhost =3D value & 0xFFFFFFFF;
+        s->fromhost_inprogress =3D 1;
+        s->env->mfromhost =3D value & 0xFFFFFFFF;
     } else if (addr =3D=3D FROMHOST_OFFSET2) {
-        htifstate->env->mfromhost |=3D value << 32;
-        htifstate->fromhost_inprogress =3D 0;
+        s->env->mfromhost |=3D value << 32;
+        s->fromhost_inprogress =3D 0;
     } else {
         qemu_log("Invalid htif write: address %016" PRIx64 "\n",
             (uint64_t)addr);
--=20
2.39.0


