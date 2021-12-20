Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6747A507
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:31:46 +0100 (CET)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCD3-0001Tf-40
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:31:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApQ-0004in-Bj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApN-0008Lj-Gg
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976594; x=1671512594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCBGjxtExN1HRAudNe4f3kIJT8L7lrBv1Z5KolgvT8k=;
 b=gFZ90vDaB00eaVsttXvKra5ovEoXZnMUuHMFhfKYUZnkKTod9YR1HNQm
 ZGn+uUSHw3mQS+NWCpxY87he3SDVInzpL3rdwQTtKaIbNE7mdOZkMteBg
 vRrIHUC3H3URizlKWMmvqhfOpBwOot6McOXHk29hfQtgFuvlsX00+55ym
 UL44S2n1qHn2Tcw66yjIEOcb8oHER7iWBscuNylvBK8zjcf86P6Th2z+F
 G+aTHMbhKCOxG7DIa+HOHr8bkhNbD5CYpf5xgxrKccRtp5IQ6DY6CU2eC
 EXu9zWZqpzHWocB3xF+9Per37XeDaWhJ1ffe7WqyDeqjPwEnSZlFnzwxQ A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680333"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:10 +0800
IronPort-SDR: vYa8pOxluU1UsqJ8e7G91sMVFmXqDLJmT0xRt3IpcDBJtb/QXzbuKuOB7YX+Whni9znfNnd0+G
 HpfDb0ISKvz2uQiWf1zyFG4lMlnjioqUDYsIdfG17HBdwowqOpzLXg1JDPuDXNt7ZKpY6C4283
 MQRpf1MCq+OYgTT8zva2b4vaCdklDeG39fE/JhFaO5g49G3EPJmvgzHrg84k4q3to1zB/qleyy
 3NdjaRDRwbpD2TTMSH/3s6ZSrofZRYn02nXq5Xcv+v6vlDA1mWZwMyYdFzzXFRQs6SXkYc4DUM
 wVG4dP++5ypYzh1tPF+Ld6Xg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:58 -0800
IronPort-SDR: 09mrtovtXR33Tq1ISAvYY52B4g6jRBDABKHIdN87z+ONxYuEz9jHgjYWyNkhg6REPwBHrJQ7EV
 WuHOJcbrG+liNHKN+z2ngDTKVjnjdy83SlKQwZMukyuZ1eT8TKWdcvIz0YIj6Uy04qS6oNk5T5
 6UkU+OE5dAgFQ2GIAslW0XtG9P2fGQ2mDVJ5t4zfZUxBn2GRz+jpepLIcESu9LqWu25AeQnlAo
 ZyfP3r6rrpdpi9fSAbGfuiNsPy+mDT6u6JZsfa6rYMQ4riZ+D4IlZZ7ZasXY+xCLCya0PRbpfG
 DrA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSB91Knpz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976528; x=1642568529; bh=fCBGjxtExN1HRAudNe
 4f3kIJT8L7lrBv1Z5KolgvT8k=; b=HhGGRlVpP5LF190UAwevu6gravovkrWcmC
 mfsWAU10r0yf/ADJfyAFDPlojJH00pDPVECwTDK+VC+ElNCikL2Dq95KqyVjIxec
 xudbPKgFs6Q+UVbV1vC67FQjzCZ959ukGri8y5WepsnZxDY682m/FU5oNOpArII5
 hXtAbQIeFk3bXfhBQxtuCRsc3lx5fMamF80GUikHm8MFYPTo2ylfdYTSrBBihQsS
 bfY0j7hXglgKlFWVNRB7nxgfgyLd0m7E4DT7okeBpzRFnpGL4Zgs1jQ8DQyxBK85
 OjWr8dEIZWDf93zQuNXP3Pnc2NFBMxa0c4kmj7frxiI1bMkxVr/w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EI5ZEL8YWrwl for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSB61RJZz1RtVG;
 Sun, 19 Dec 2021 21:02:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 73/88] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
Date: Mon, 20 Dec 2021 14:56:50 +1000
Message-Id: <20211220045705.62174-74-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-66-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/vector_helper.c            | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11a0f41b27..5d93ccdfa7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -100,7 +100,7 @@ typedef struct CPURISCVState CPURISCVState;
 #include "pmp.h"
 #endif
=20
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
=20
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a78f36b4b3..e61c873142 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -124,7 +124,7 @@ static inline int32_t vext_lmul(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bit=
s.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb =3D simd_maxsz(desc);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 42e9449118..be3f9f1327 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -567,8 +567,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
     base =3D get_gpr(s, rs1, EXT_NONE);
=20
     /*
-     * As simd_desc supports at most 256 bytes, and in this implementati=
on,
-     * the max vector group length is 2048 bytes. So split it into two p=
arts.
+     * As simd_desc supports at most 2048 bytes, and in this implementat=
ion,
+     * the max vector group length is 4096 bytes. So split it into two p=
arts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
--=20
2.31.1


