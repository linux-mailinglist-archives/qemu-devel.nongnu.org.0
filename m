Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB4B4881BB
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 06:57:02 +0100 (CET)
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64ir-0002KW-Ld
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 00:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dN-0007rg-3a
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:21 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:24134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dK-0006jE-Kv
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621078; x=1673157078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lRlCMaj0Wh13LYQuVK9Td3eUJcO/KFfLa8lOp/wlmfo=;
 b=S2LjlhMwFGHE1DI8NVQo2UUnNvY6duECG4kUcSF44/uu24b6jmqaotjg
 78B7QgUVMH4sDiOJLzyrtkJnRKb5kdVarSSlwvMfkJ0XuGydsrP6qdEmH
 hQCpdJrdwKOnH6b0eGYYQZQtj/EUmZTBl298iWgDmHPFEdpn4BVkHMnro
 sgmr3CW2JJVbyqf8lqQfry1xnjIP7RQb5idemBjMvXJwbmX7phdu3HlHN
 xMx521ZgiBKLeLHrlRhTlO7zUlwuPXckCHMMt6q4XJHiAq/LwqlQ+BHjA
 hha/NvcHGUfFkiuI7xotpFKLMU/alPssm55Pa8bKHw69VUyFICi7prbeX w==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027331"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:16 +0800
IronPort-SDR: PwVIQzX45YPNiloPVbE8XBXvfyzawsVa7Vy57/nOC8nUivD/SH6oaO66ADFUlZz41JKqarB+D4
 gKDFMTH+VhBL/AweRYCchL58VXjlu6bqZdFxaEiXbvcYi4Jour9Kz/KLAVxo9wsDvfcWZcG53p
 hRxdptrxLWoXDeqEHe8Hwx/+1gzgJdGVGCTuZbYOppdXXzHaoXbB28RBkM90LL4YYvXYUfYkSx
 YQU5QzQDRRva9A/jlPixmY9O68BpEUmSWQKhxp1C4GkxDG0bOzpNom6LxqANZ0yy1vG1W/VWRg
 iXwlW/zDv82RRI9lUXIttUxb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:04 -0800
IronPort-SDR: lldaCdeVyt6pduq6hLd/+PiLrgHUWcRJFYBj06M2BvD25I0tWDdjZktgNaXucLe0BAQAS3t8or
 NZ/BgE7ZrhyhlYvDKMwz/gHG+2sKwgERLLVXEGtrJml734FUFwE98tS1W5T4OXEBTamSANRh8c
 9FZ5Z0K58t/Il7HueNEbgCBrXatIWpCcwyIqYni4wnSQPRulVhxBjeSp5T+B0NRE0UNHywFg/d
 E7nQ2zv7vQMVInaRD0jK0ZvIT6VcGh4RsMzqQeMJMASqOA+jwCxr0nMzJip2ZGA6V0ad26xwfo
 E3o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8N43bRBz1VSkh
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621075; x=1644213076; bh=lRlCMaj0Wh13LYQuVK
 9Td3eUJcO/KFfLa8lOp/wlmfo=; b=cHIWoMlOXyKLuoFjY9TbykenNbKX3J9VJZ
 gx4BMQyvQ1Q9+3CGhp3UpmHQbfaEj3uFXRUPXgIGKEdJXlOTNZtPFSH1C+Qvjj7/
 9M3Y07RKCVTga8tv0j6Nx/EFPhHz5ZtsCTJr9oRfIegZclQrHlhn2IRjkfRpWmhk
 HaWlyT57pwQGgKmVUBQhQgYYkjQzKxEEdJcx4Babxaaor+2YbNby1+tBCr5nkr1j
 BJdP9yUpMAMfNfd7zy4TSb8GDC1ajZZyNW3Cq8O+3wubXn9uA2M4EpYkATzIsQpW
 1CO+ZmYXQKejOxLodNSZLJ5SkZWF+hiwl23Go//M7qhtNR6x+MuQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id f4DQ1CcBy8oN for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Mz4fvgz1VSkV;
 Fri,  7 Jan 2022 21:51:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 02/37] hw/dma: sifive_pdma: support high 32-bit access of
 64-bit register
Date: Sat,  8 Jan 2022 15:50:13 +1000
Message-Id: <20220108055048.3512645-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Jim Shu <jim.shu@sifive.com>

Real PDMA supports high 32-bit read/write memory access of 64-bit
register.

The following result is PDMA tested in U-Boot on Unmatched board:

1. Real PDMA allows high 32-bit read/write to 64-bit register.
=3D> mw.l 0x3000000 0x0                      <=3D Disclaim channel 0
=3D> mw.l 0x3000000 0x1                      <=3D Claim channel 0
=3D> mw.l 0x3000010 0x80000000               <=3D Write low 32-bit NextDe=
st (NextDest =3D 0x280000000)
=3D> mw.l 0x3000014 0x2                      <=3D Write high 32-bit NextD=
est
=3D> md.l 0x3000010 1                        <=3D Dump low 32-bit NextDes=
t
03000010: 80000000
=3D> md.l 0x3000014 1                        <=3D Dump high 32-bit NextDe=
st
03000014: 00000002
=3D> mw.l 0x3000018 0x80001000               <=3D Write low 32-bit NextSr=
c (NextSrc =3D 0x280001000)
=3D> mw.l 0x300001c 0x2                      <=3D Write high 32-bit NextS=
rc
=3D> md.l 0x3000018 1                        <=3D Dump low 32-bit NextSrc
03000010: 80001000
=3D> md.l 0x300001c 1                        <=3D Dump high 32-bit NextSr=
c
03000014: 00000002

2. PDMA transfer from 0x280001000 to 0x280000000 is OK.
=3D> mw.q 0x3000008 0x4                      <=3D NextBytes =3D 4
=3D> mw.l 0x3000004 0x22000000               <=3D wsize =3D rsize =3D 2 (=
2^2 =3D 4 bytes)
=3D> mw.l 0x280000000 0x87654321             <=3D Fill test data to dst
=3D> mw.l 0x280001000 0x12345678             <=3D Fill test data to src
=3D> md.l 0x280000000 1; md.l 0x280001000 1  <=3D Dump src/dst memory con=
tents
280000000: 87654321                              !Ce.
280001000: 12345678                              xV4.
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 00000001 22000000 00000004 00000000    ......."........
03000010: 80000000 00000002 80001000 00000002    ................
=3D> mw.l 0x3000000 0x3                      <=3D Set channel 0 run and c=
laim bits
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 40000001 22000000 00000004 00000000    ...@..."........
03000010: 80000000 00000002 80001000 00000002    ................
=3D> md.l 0x280000000 1; md.l 0x280001000 1  <=3D Dump src/dst memory con=
tents
280000000: 12345678                               xV4.
280001000: 12345678                               xV4.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20220104063408.658169-2-jim.shu@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 177 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 155 insertions(+), 22 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 85fe34f5f3..f4df16449b 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -177,18 +177,44 @@ static inline void sifive_pdma_update_irq(SiFivePDM=
AState *s, int ch)
     s->chan[ch].state =3D DMA_CHAN_STATE_IDLE;
 }
=20
-static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned s=
ize)
+static uint64_t sifive_pdma_readq(SiFivePDMAState *s, int ch, hwaddr off=
set)
 {
-    SiFivePDMAState *s =3D opaque;
-    int ch =3D SIFIVE_PDMA_CHAN_NO(offset);
     uint64_t val =3D 0;
=20
-    if (ch >=3D SIFIVE_PDMA_CHANS) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
-                      __func__, ch);
-        return 0;
+    offset &=3D 0xfff;
+    switch (offset) {
+    case DMA_NEXT_BYTES:
+        val =3D s->chan[ch].next_bytes;
+        break;
+    case DMA_NEXT_DST:
+        val =3D s->chan[ch].next_dst;
+        break;
+    case DMA_NEXT_SRC:
+        val =3D s->chan[ch].next_src;
+        break;
+    case DMA_EXEC_BYTES:
+        val =3D s->chan[ch].exec_bytes;
+        break;
+    case DMA_EXEC_DST:
+        val =3D s->chan[ch].exec_dst;
+        break;
+    case DMA_EXEC_SRC:
+        val =3D s->chan[ch].exec_src;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX =
"\n",
+                      __func__, offset);
+        break;
     }
=20
+    return val;
+}
+
+static uint32_t sifive_pdma_readl(SiFivePDMAState *s, int ch, hwaddr off=
set)
+{
+    uint32_t val =3D 0;
+
     offset &=3D 0xfff;
     switch (offset) {
     case DMA_CONTROL:
@@ -198,28 +224,47 @@ static uint64_t sifive_pdma_read(void *opaque, hwad=
dr offset, unsigned size)
         val =3D s->chan[ch].next_config;
         break;
     case DMA_NEXT_BYTES:
-        val =3D s->chan[ch].next_bytes;
+        val =3D extract64(s->chan[ch].next_bytes, 0, 32);
+        break;
+    case DMA_NEXT_BYTES + 4:
+        val =3D extract64(s->chan[ch].next_bytes, 32, 32);
         break;
     case DMA_NEXT_DST:
-        val =3D s->chan[ch].next_dst;
+        val =3D extract64(s->chan[ch].next_dst, 0, 32);
+        break;
+    case DMA_NEXT_DST + 4:
+        val =3D extract64(s->chan[ch].next_dst, 32, 32);
         break;
     case DMA_NEXT_SRC:
-        val =3D s->chan[ch].next_src;
+        val =3D extract64(s->chan[ch].next_src, 0, 32);
+        break;
+    case DMA_NEXT_SRC + 4:
+        val =3D extract64(s->chan[ch].next_src, 32, 32);
         break;
     case DMA_EXEC_CONFIG:
         val =3D s->chan[ch].exec_config;
         break;
     case DMA_EXEC_BYTES:
-        val =3D s->chan[ch].exec_bytes;
+        val =3D extract64(s->chan[ch].exec_bytes, 0, 32);
+        break;
+    case DMA_EXEC_BYTES + 4:
+        val =3D extract64(s->chan[ch].exec_bytes, 32, 32);
         break;
     case DMA_EXEC_DST:
-        val =3D s->chan[ch].exec_dst;
+        val =3D extract64(s->chan[ch].exec_dst, 0, 32);
+        break;
+    case DMA_EXEC_DST + 4:
+        val =3D extract64(s->chan[ch].exec_dst, 32, 32);
         break;
     case DMA_EXEC_SRC:
-        val =3D s->chan[ch].exec_src;
+        val =3D extract64(s->chan[ch].exec_src, 0, 32);
+        break;
+    case DMA_EXEC_SRC + 4:
+        val =3D extract64(s->chan[ch].exec_src, 32, 32);
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX =
"\n",
                       __func__, offset);
         break;
     }
@@ -227,19 +272,66 @@ static uint64_t sifive_pdma_read(void *opaque, hwad=
dr offset, unsigned size)
     return val;
 }
=20
-static void sifive_pdma_write(void *opaque, hwaddr offset,
-                              uint64_t value, unsigned size)
+static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned s=
ize)
 {
     SiFivePDMAState *s =3D opaque;
     int ch =3D SIFIVE_PDMA_CHAN_NO(offset);
-    bool claimed, run;
+    uint64_t val =3D 0;
=20
     if (ch >=3D SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
                       __func__, ch);
-        return;
+        return 0;
+    }
+
+    switch (size) {
+    case 8:
+        val =3D sifive_pdma_readq(s, ch, offset);
+        break;
+    case 4:
+        val =3D sifive_pdma_readl(s, ch, offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to PDMA=
\n",
+                      __func__, size);
+        return 0;
     }
=20
+    return val;
+}
+
+static void sifive_pdma_writeq(SiFivePDMAState *s, int ch,
+                               hwaddr offset, uint64_t value)
+{
+    offset &=3D 0xfff;
+    switch (offset) {
+    case DMA_NEXT_BYTES:
+        s->chan[ch].next_bytes =3D value;
+        break;
+    case DMA_NEXT_DST:
+        s->chan[ch].next_dst =3D value;
+        break;
+    case DMA_NEXT_SRC:
+        s->chan[ch].next_src =3D value;
+        break;
+    case DMA_EXEC_BYTES:
+    case DMA_EXEC_DST:
+    case DMA_EXEC_SRC:
+        /* these are read-only registers */
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX =
"\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static void sifive_pdma_writel(SiFivePDMAState *s, int ch,
+                               hwaddr offset, uint32_t value)
+{
+    bool claimed, run;
+
     offset &=3D 0xfff;
     switch (offset) {
     case DMA_CONTROL:
@@ -282,27 +374,68 @@ static void sifive_pdma_write(void *opaque, hwaddr =
offset,
         s->chan[ch].next_config =3D value;
         break;
     case DMA_NEXT_BYTES:
-        s->chan[ch].next_bytes =3D value;
+        s->chan[ch].next_bytes =3D
+            deposit64(s->chan[ch].next_bytes, 0, 32, value);
+        break;
+    case DMA_NEXT_BYTES + 4:
+        s->chan[ch].next_bytes =3D
+            deposit64(s->chan[ch].next_bytes, 32, 32, value);
         break;
     case DMA_NEXT_DST:
-        s->chan[ch].next_dst =3D value;
+        s->chan[ch].next_dst =3D deposit64(s->chan[ch].next_dst, 0, 32, =
value);
+        break;
+    case DMA_NEXT_DST + 4:
+        s->chan[ch].next_dst =3D deposit64(s->chan[ch].next_dst, 32, 32,=
 value);
         break;
     case DMA_NEXT_SRC:
-        s->chan[ch].next_src =3D value;
+        s->chan[ch].next_src =3D deposit64(s->chan[ch].next_src, 0, 32, =
value);
+        break;
+    case DMA_NEXT_SRC + 4:
+        s->chan[ch].next_src =3D deposit64(s->chan[ch].next_src, 32, 32,=
 value);
         break;
     case DMA_EXEC_CONFIG:
     case DMA_EXEC_BYTES:
+    case DMA_EXEC_BYTES + 4:
     case DMA_EXEC_DST:
+    case DMA_EXEC_DST + 4:
     case DMA_EXEC_SRC:
+    case DMA_EXEC_SRC + 4:
         /* these are read-only registers */
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX =
"\n",
                       __func__, offset);
         break;
     }
 }
=20
+static void sifive_pdma_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size)
+{
+    SiFivePDMAState *s =3D opaque;
+    int ch =3D SIFIVE_PDMA_CHAN_NO(offset);
+
+    if (ch >=3D SIFIVE_PDMA_CHANS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
+                      __func__, ch);
+        return;
+    }
+
+    switch (size) {
+    case 8:
+        sifive_pdma_writeq(s, ch, offset, value);
+        break;
+    case 4:
+        sifive_pdma_writel(s, ch, offset, (uint32_t) value);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write size %u to PDM=
A\n",
+                      __func__, size);
+        break;
+    }
+}
+
 static const MemoryRegionOps sifive_pdma_ops =3D {
     .read =3D sifive_pdma_read,
     .write =3D sifive_pdma_write,
--=20
2.31.1


