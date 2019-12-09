Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D7117419
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 19:25:50 +0100 (CET)
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieNjA-0002Gb-S0
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 13:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaU-0006wH-0A
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaS-0007Gi-VX
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:49 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7351)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaS-000793-MO; Mon, 09 Dec 2019 13:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915429; x=1607451429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=38AbqMpKSlFAyAmt2P22sbgAzKpx4WRYDp8rZGy1W24=;
 b=AGPnhzq+kr88a1FxgJl4siOx7clny+wge5ovXjvTAtRwLIP36lYBVHF/
 4SfiRz4nxhAYaS17tfkbEzHiZom9poiaJzS7ybZQLAkUJAN7VAHUBAPe5
 K+wBk6sgHuE8Gxj/6S7NT8dSevcRtWgBMoDcGle6Jzexgrhhx9r0IgCCA
 wISrGQT+aAr7ksi4lw+gkpxEX9D+T2mFzrymVs/pFAB8WVRPsqNIAbA6X
 IniYTM4AaoWpLNTsZz0r5EMJ4GuUZD0tHQiv1OqZH2Aix9wVOeUT4FkZ0
 bfc6qfNR0uAckYEPDSAMj5o6y1k6GAg4oGkFzA+q9DU3yvvzTNx9wwETy g==;
IronPort-SDR: ES2iYsj0ABSkl8Yuh1yZxgX9GCLus6RCL7IlE94r725XP2kPaPXyNuNLxNkuV3QUW4i4D+JvGh
 uNJf4iIgf/N8EsWBRHAlV1Cw5oUOIOOLZ6OlDt9JJDQ2qvSEYubUl7v8A4iNVR5iuoDDvIDwVd
 IRTjSVagXdTF7NRWnrGQQDpvmqeMk4aalPRG3hr23d5A1HQCAGmRIhzULvoibRdb0soRqI1taf
 DxfymixD4zIc/2PE4j+lzLI03BpbjPojs8UkvYMx5ff5jH879IMTTxulM7frbXaaw0IZkuu34d
 5sw=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="226411946"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:17:08 +0800
IronPort-SDR: wVkgsR5aYj5UUQ4f1LRS2rZcwlQbKLCTGd8F5dXBl7D0PuRfF9vQrN/TMVBB5mW6S9kpSsQyxB
 EHxYOwWvrSYCqDxlp0qy8lgNClRW/habj2XYS7pXFBAnTjWz3lWM2x7xFr19egYfVO/kdhA52y
 MyYISsKIRVAj3BMfmF603v+qPQOA4txiUbk7CJAw0TTq4cOdcthsQNIeAcL/gPvMZin3f4KeXq
 4n6GSi6XZPR78HqznnSQhqHW65pVRpRQO1gLEwTq3FlZ8EkO5BtVu2y98iddhheVFaewADxcKC
 lBPRko402Tg/EERKnUVbl84O
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:11:04 -0800
IronPort-SDR: szeDcx6Lzw6l7llnfxVAE6Bb8IvmepzqVq/J8bU/USH+MA+zfcpFd/AdFV63l8ZW6J6UxpU92o
 zSyfwAiyOgdT57Dq38mq5lBn5ummiLwBG4gSmnu8sCKBA7bW8IRS3iEnrdXvPRrCV0vzF1ZFDw
 MP5QaKweS6CHwtOdTZ9DAy/0iRt+Qa7V0HE/jOOP9VM1Y4Y1x/0WsQaeBGiWrxGjRBcHWvZRtm
 j6ViWciw5PFK9/JW9BSJ4OV2nsa4/XCHkOZzcItiYhOExPEGHFi/FZCfxIgpaS3IcxGOGr2j6X
 FVY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 10:16:48 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 10/36] target/riscv: Print priv and virt in disas log
Date: Mon,  9 Dec 2019 10:11:06 -0800
Message-Id: <cb6b09422da8ec4c680889779188c780338a33de.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ab6a891dc3..1a379bd2ae 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -808,7 +808,15 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
 static void riscv_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
+    RISCVCPU *rvcpu = RISCV_CPU(cpu);
+    CPURISCVState *env = &rvcpu->env;
+#endif
+
     qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+#ifndef CONFIG_USER_ONLY
+    qemu_log("Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n", env->priv, env->virt);
+#endif
     log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
-- 
2.24.0


