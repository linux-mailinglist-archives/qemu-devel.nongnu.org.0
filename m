Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A353B674E7D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0A-0007my-OQ; Fri, 20 Jan 2023 02:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzv-0007gc-Cq
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:40 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzt-0004oc-Fy
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200377; x=1705736377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgqIy2dMtYDfHr6ysw5QTe/uCyGkNi3HjNfCfNK58Gw=;
 b=OjFKsXLHGKIgRvji1kIYBLqy2u6yYn3VMeVuEcpfljUKHhNOpLMxZA7p
 cKQOweyX7Td0xhSKmkiof2fvXMcHcTeHBCh3wqkC1ZQgddRyrVYQiRN4K
 9rLnZPOieZNqTQzwh8lK5iZN+GwJLZKDtLp36N/8w4YuJd/e1mvnHz6N5
 jl3387XCes7k4+C/dFiKwFjt1RjSQv1secKTcpfggtlWg37bcslpGF5L3
 adXTbWspUHzqRyNgYRDzGyv6ihyIQxaJjoa4vRg56UtEqfxadt53X0GA7
 H+la2HvyNE4520BcGtZ8gxS3BwbC/UiqM5H6t+I05HUGudAP2LB9urczD w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176687"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:36 +0800
IronPort-SDR: 7I0Xnhid/YJES/b6uhI6nnOTsPlYsNQAhd4EQf2gAuZww9yJd2/1EwRP8HgR2f7bgWdcalZW15
 SViJ1MR9aYhwcAbtVEFtToq5lmGxsYxcYGu5WCjHLFfhx9NG8yxS2iqjLp5Ns2/1KM1yjBLs0R
 AU0ph6YmttR6ttA97cS/d4Li8F1+PTtlA746IAqUoEqCbHvg1CUIvX3gxAqAzRiDSMK/ESeTyo
 YkFnHt3lit16VbhY5Ghhv4W7sq3wquST6QXYom6W7xHUzN6qNZO3qMGPs5XByChL+z+xQG6+Ka
 9TA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:14 -0800
IronPort-SDR: b5l9qqcDQx3cSfRF9qgbvBSv9c9yVDKSiNcBL2DWpfCG/402T3wSE3XwEJWZZuWtQHWejbxbE/
 RiIYGumiS+4SUOWpKHEjUr39GJDseNHKpgGIpfVg79O67OZ4ppf8rll02aZumiepp6g8ToBrH4
 kDJlt0XPCFSIxB/BEnFDRymoiwtgfg/jrMHpk1rGQTEzRi+rXlgtvcbDpoxzv2Y4rh6SlTHKqy
 jALQm8z8iD7MTyguVh8k/4maLEi8TX5NFnm15KwgDJDOwUrd5btMWMJ/VRTXyTq5HlpfU4IGJr
 w4E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrx371sQz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200375; x=1676792376; bh=YgqIy2dMtYDfHr6ysw
 5QTe/uCyGkNi3HjNfCfNK58Gw=; b=srv6sijrrLb9BJvaN3fklOdFU/PYh+xtic
 sGzevO2kHbulzR1X0duq9Jcdqu1P+t+0ixhi137oUOT7Lm+TWerKcl26tWldvvmh
 P2uQArKX2ysd23FzVfVCyUmpGXPOnke5hiGLwHX+QlRtST31J8zqr9g5Ipw+ifZG
 VZJb1s3uLCrhy89/MmbAiQaGnrbfomuqfvFyxTRf59dZSHwbMT3QaUlmn9+rysDZ
 /P/rZ4QQoSX0QmYZHHlSrj8ons1WUYOttT7WQPGydKbFq4IXYyIBQRgEdlLfhjIS
 PcOv0EuiLFi0xxdtwKQu4u+Y1+AjEcoeZvVxET0AZJ6IzPGcGu7Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id M1LGm5lNFRoU for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:35 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrx16ZxWz1Rwt8;
 Thu, 19 Jan 2023 23:39:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/37] hw/char: riscv_htif: Support console output via proxy
 syscall
Date: Fri, 20 Jan 2023 17:38:43 +1000
Message-Id: <20230120073913.1028407-8-alistair.francis@opensource.wdc.com>
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

At present the HTIF proxy syscall is unsupported. On RV32, only
device 0 is supported so there is no console device for RV32.
The only way to implement console funtionality on RV32 is to
support the SYS_WRITE syscall.

With this commit, the Spike machine is able to boot the 32-bit
OpenSBI generic image.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-8-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/riscv_htif.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 3bb0a37a3e..1477fc0090 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -48,6 +48,9 @@
 #define HTIF_CONSOLE_CMD_GETC   0
 #define HTIF_CONSOLE_CMD_PUTC   1
=20
+/* PK system call number */
+#define PK_SYS_WRITE            64
+
 static uint64_t fromhost_addr, tohost_addr;
 static int address_symbol_set;
=20
@@ -165,7 +168,19 @@ static void htif_handle_tohost_write(HTIFState *s, u=
int64_t val_written)
                 int exit_code =3D payload >> 1;
                 exit(exit_code);
             } else {
-                qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported=
\n");
+                uint64_t syscall[8];
+                cpu_physical_memory_read(payload, syscall, sizeof(syscal=
l));
+                if (syscall[0] =3D=3D PK_SYS_WRITE &&
+                    syscall[1] =3D=3D HTIF_DEV_CONSOLE &&
+                    syscall[3] =3D=3D HTIF_CONSOLE_CMD_PUTC) {
+                    uint8_t ch;
+                    cpu_physical_memory_read(syscall[2], &ch, 1);
+                    qemu_chr_fe_write(&s->chr, &ch, 1);
+                    resp =3D 0x100 | (uint8_t)payload;
+                } else {
+                    qemu_log_mask(LOG_UNIMP,
+                                  "pk syscall proxy not supported\n");
+                }
             }
         } else {
             qemu_log("HTIF device %d: unknown command\n", device);
--=20
2.39.0


