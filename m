Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34D674E3C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm01-0007hC-OD; Fri, 20 Jan 2023 02:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzp-0007bc-Uz
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:35 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzm-0004mc-JF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200370; x=1705736370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J5GmLYMy12Z9K2jBwRGgeedjbRu4yY9N+HuLVIM+/8I=;
 b=rnR6GdaFjw3ah1NcexfxGfh2LSAghHyU7WTzrrdA63Pt7Xb8H5V18hyJ
 K/pUDSzD6KWS+ZEcIh5fOopJLo7rwOKQbBM5gY2pR2kulgi3kj2UMuVo+
 jhldENBH813otLByqSrI5adMYKEcquxemxiOqU0WvNtvp6gTzja1+JAKn
 s660IAER32fLrfpFhhj9W4Ic5sTG2fN365TkObDooItSahM1CeYr+CM26
 WN7OaV7BuNjpAG466aGvY5euDd3tu8OKTILSN+VSOSmHZCpjrqbIGHJSH
 DdOz0vj4zk80M5eepTJIusxBnFbQTgo0/6Gz97UHL87c2FKVv4E2vloqw g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176673"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:25 +0800
IronPort-SDR: 1sIyJ3Y/dpZ2ZJyyaztcuTmqKIpzG20DHMjA/SmvxCBEU4TmA6zGhdApbRS2Sq5WJsVgZr8mMB
 RDFapelysZvkYFGSgPTR2s1jL6+qiP734ITI5z6keS+2lIrxOJamjS9o6Pw1kskgoVHsVoCNiD
 zQdRsgnejond8lHAHHjzUdKZ6q2eop5Hy4jO44lNCRhIWLRQQ4xru06Nr4apsN/KQRY7sKHQV3
 pxU27yCIGEMpOz8CBWL7FCoE1C562X+BULkOx8A4yWQ3OdYHDTFU0KbiB7aSXHCAbwiNU6GqMD
 ALE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:03 -0800
IronPort-SDR: JpFBgFf5Ov/nJgeJ1VxLmeOOdhsk/mMDuXPodi1bb2fecim5VeOiH1dN8C8N/4TDYLPX4+eb/W
 A9snBl3VFCH+GZatc6vQwK3ym7iYbwaWKijP0rtQz/k8y/Vt0W39i7A0Azhrb4LapmwB65p5qT
 q2KMUXAJHjVRhmfp7wI39qNzJPOC7lVXakkG6RGboQarfk/dXT1z0j6IueXnkSJr0+/UqmOhor
 nop8wxms6I0yyPZAbQtcmIBqL7wLura2LnXJ9449NuYTYy8JbNCIdSzM8GGKb7z427Rl7og77k
 60E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrws12GMz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200364; x=1676792365; bh=J5GmLYMy12Z9K2jBwR
 GgeedjbRu4yY9N+HuLVIM+/8I=; b=ikPuJZVxd/YD1iPSGbcXbxngs4/n6sziuM
 AQniQ0tx0F9+W5lQZEM2Y/QS0dIbzIyj7Mi9hT2OoTvOc2cGKf8r52GKGuU3WjwH
 MsaZJssTf5NLHIom6EfzKR+jDuaar9Vc6iaVUr5W958rpLR+mBttkS+0L7n14Pg0
 coxnhsfMi7NLXrEJQ82PAhQ4TAgR5yN2leyeVgnrNPYjc5duUDr5NY0uioEuEH7I
 8/lgPPmzwNulPmmRPLEfPIp36AVzEuBig/1KxrxZNWkUkTZ7Rpaz44e87e6eJYwI
 NxNTcr2x54OAc0O4W/+BIeaaVVF8X+clDD4KpEACSYIGUEULNKRQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id m6im-8KOsguR for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:24 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrwp5Hnzz1RvTp;
 Thu, 19 Jan 2023 23:39:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/37] hw/char: riscv_htif: Avoid using magic numbers
Date: Fri, 20 Jan 2023 17:38:37 +1000
Message-Id: <20230120073913.1028407-2-alistair.francis@opensource.wdc.com>
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

The Spike HTIF is poorly documented. The only relevant info we can
get from the internet is from Andrew Waterman at [1].

Add a comment block before htif_handle_tohost_write() to explain
the tohost register format, and use meaningful macros instead of
magic numbers in the codes.

While we are here, correct 2 multi-line comment blocks that have
wrong format.

Link: https://github.com/riscv-software-src/riscv-isa-sim/issues/364#issu=
ecomment-607657754 [1]
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-2-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/riscv_htif.c | 72 ++++++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 6577f0e640..088556bb04 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -38,6 +38,16 @@
         }                                                               =
       \
     } while (0)
=20
+#define HTIF_DEV_SHIFT          56
+#define HTIF_CMD_SHIFT          48
+
+#define HTIF_DEV_SYSTEM         0
+#define HTIF_DEV_CONSOLE        1
+
+#define HTIF_SYSTEM_CMD_SYSCALL 0
+#define HTIF_CONSOLE_CMD_GETC   0
+#define HTIF_CONSOLE_CMD_PUTC   1
+
 static uint64_t fromhost_addr, tohost_addr;
 static int address_symbol_set;
=20
@@ -81,9 +91,11 @@ static void htif_recv(void *opaque, const uint8_t *buf=
, int size)
         return;
     }
=20
-    /* TODO - we need to check whether mfromhost is zero which indicates
-              the device is ready to receive. The current implementation
-              will drop characters */
+    /*
+     * TODO - we need to check whether mfromhost is zero which indicates
+     *        the device is ready to receive. The current implementation
+     *        will drop characters
+     */
=20
     uint64_t val_written =3D htifstate->pending_read;
     uint64_t resp =3D 0x100 | *buf;
@@ -110,10 +122,30 @@ static int htif_be_change(void *opaque)
     return 0;
 }
=20
+/*
+ * See below the tohost register format.
+ *
+ * Bits 63:56 indicate the "device".
+ * Bits 55:48 indicate the "command".
+ *
+ * Device 0 is the syscall device, which is used to emulate Unixy syscal=
ls.
+ * It only implements command 0, which has two subfunctions:
+ * - If bit 0 is clear, then bits 47:0 represent a pointer to a struct
+ *   describing the syscall.
+ * - If bit 1 is set, then bits 47:1 represent an exit code, with a zero
+ *   value indicating success and other values indicating failure.
+ *
+ * Device 1 is the blocking character device.
+ * - Command 0 reads a character
+ * - Command 1 writes a character from the 8 LSBs of tohost
+ *
+ * For RV32, the tohost register is zero-extended, so only device=3D0 an=
d
+ * command=3D0 (i.e. HTIF syscalls/exit codes) are supported.
+ */
 static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_=
written)
 {
-    uint8_t device =3D val_written >> 56;
-    uint8_t cmd =3D val_written >> 48;
+    uint8_t device =3D val_written >> HTIF_DEV_SHIFT;
+    uint8_t cmd =3D val_written >> HTIF_CMD_SHIFT;
     uint64_t payload =3D val_written & 0xFFFFFFFFFFFFULL;
     int resp =3D 0;
=20
@@ -125,9 +157,9 @@ static void htif_handle_tohost_write(HTIFState *htifs=
tate, uint64_t val_written)
      * 0: riscv-tests Pass/Fail Reporting Only (no syscall proxy)
      * 1: Console
      */
-    if (unlikely(device =3D=3D 0x0)) {
+    if (unlikely(device =3D=3D HTIF_DEV_SYSTEM)) {
         /* frontend syscall handler, shutdown and exit code support */
-        if (cmd =3D=3D 0x0) {
+        if (cmd =3D=3D HTIF_SYSTEM_CMD_SYSCALL) {
             if (payload & 0x1) {
                 /* exit code */
                 int exit_code =3D payload >> 1;
@@ -138,14 +170,14 @@ static void htif_handle_tohost_write(HTIFState *hti=
fstate, uint64_t val_written)
         } else {
             qemu_log("HTIF device %d: unknown command\n", device);
         }
-    } else if (likely(device =3D=3D 0x1)) {
+    } else if (likely(device =3D=3D HTIF_DEV_CONSOLE)) {
         /* HTIF Console */
-        if (cmd =3D=3D 0x0) {
+        if (cmd =3D=3D HTIF_CONSOLE_CMD_GETC) {
             /* this should be a queue, but not yet implemented as such *=
/
             htifstate->pending_read =3D val_written;
             htifstate->env->mtohost =3D 0; /* clear to indicate we read =
*/
             return;
-        } else if (cmd =3D=3D 0x1) {
+        } else if (cmd =3D=3D HTIF_CONSOLE_CMD_PUTC) {
             qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
             resp =3D 0x100 | (uint8_t)payload;
         } else {
@@ -157,15 +189,15 @@ static void htif_handle_tohost_write(HTIFState *hti=
fstate, uint64_t val_written)
             " payload: %016" PRIx64, device, cmd, payload & 0xFF, payloa=
d);
     }
     /*
-     * - latest bbl does not set fromhost to 0 if there is a value in to=
host
-     * - with this code enabled, qemu hangs waiting for fromhost to go t=
o 0
-     * - with this code disabled, qemu works with bbl priv v1.9.1 and v1=
.10
-     * - HTIF needs protocol documentation and a more complete state mac=
hine
-
-        while (!htifstate->fromhost_inprogress &&
-            htifstate->env->mfromhost !=3D 0x0) {
-        }
-    */
+     * Latest bbl does not set fromhost to 0 if there is a value in toho=
st.
+     * With this code enabled, qemu hangs waiting for fromhost to go to =
0.
+     * With this code disabled, qemu works with bbl priv v1.9.1 and v1.1=
0.
+     * HTIF needs protocol documentation and a more complete state machi=
ne.
+     *
+     *  while (!htifstate->fromhost_inprogress &&
+     *      htifstate->env->mfromhost !=3D 0x0) {
+     *  }
+     */
     htifstate->env->mfromhost =3D (val_written >> 48 << 48) | (resp << 1=
6 >> 16);
     htifstate->env->mtohost =3D 0; /* clear to indicate we read */
 }
@@ -196,7 +228,7 @@ static uint64_t htif_mm_read(void *opaque, hwaddr add=
r, unsigned size)
=20
 /* CPU wrote to an HTIF register */
 static void htif_mm_write(void *opaque, hwaddr addr,
-                            uint64_t value, unsigned size)
+                          uint64_t value, unsigned size)
 {
     HTIFState *htifstate =3D opaque;
     if (addr =3D=3D TOHOST_OFFSET1) {
--=20
2.39.0


