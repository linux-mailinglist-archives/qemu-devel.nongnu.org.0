Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0739EB03
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:51:07 +0200 (CEST)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPxS-0006EN-Gy
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfL-0004R6-QE
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:23 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfK-0004dW-1e
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112341; x=1654648341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RuDtRDJEQJWkWTiDDCv2n37Ja4ZoSh95S/aQvF4IvVo=;
 b=YrpS+Rr81mQ9Mp9buxnYySJ97s9NnyFT727d7agIabJsrqPXt8/rjVVd
 nqY79Atl1m+QIeBDcEoJ0XKxZHJX3m0y45ayOTf7IJCq6BGFFcy/FgCgh
 Z88QQFCQeX/YzKkZT6YbNAJ2HlGDDpLSLGmLCvjKhWv+5A7mRZ2Xh/czq
 JVi14yGyjp3OSStoGraajZ0e+z7eod8PJxXLqyQMOYjnK43oHFITzzWnR
 nYSZylmYo0yppXLRJGKG6zfd+E1CyfVwpKVFNuz4ukDJS6ilyqtKwybWZ
 7IXIFCXPyIKwC1CYfB9kX/7VxCFkOvU9i2iJ6c1w3IRd2saTsO1aMkuTx A==;
IronPort-SDR: cxIN62t3YHRq4J7GMIrXSCfrMQbAwKdDeAvYjaSem9ydpOEHaH3H030nICbNfnDqCJ+FyLS+MJ
 qfQ59loELtyWRK7mLuGZSh5VttwRqykaDAX8iEZ6XDm52uFQKTm0Lkb2e6b8/V9P6AoFn+aiWs
 QUcyRPWnpM5clV7ybKrDExQxnkSDws3e4hgjU+sL3nt04hiFLoa1WdMIvGdrlnt8sEEvcXUxzk
 vq9KAz/xe4+Eo99of4hDTbaXbsqqbIIlJd5yT2n/fM6gdZp050hk0JfxRj0ykdKSXai3TorJOW
 3IM=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087480"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:57 +0800
IronPort-SDR: ypXSyvyMAlBhC1yn1f1NTdSmoLW7rRqoFykBpCCWLfC/rrV7IOYt4RDIKCJHOZhlRIl2gjUai+
 NW/XgAV3LOR0edFAiXuXi/Nznq8nLtOXdkmPUXRefxr53ekVF4Cwo3rMTOX7Opll+UmZGxNY7j
 K9DRTnKaKtA+ComSKvOOD2TJaSNyakqPX8ZZUmPEFhCeKAiYmvDgySUa3yTVKqXE+jGCHm1j1J
 iQNrkSbQdl0L1iHL87aeRiYTB+Zwr6/ky/nE6r2q90JEBVb9IND584U0lw/tK2mrNho79nAoqa
 slBazzNQheve+b1sR8L315av
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:11:04 -0700
IronPort-SDR: 08qq6Ph5bn9WJQEyG1UFotIkE96+6kfufyKsbFWcKMR+QN76s+Jq3+QRWAV+3GmixIdEmttvDk
 JUVPmmpBbeNqR4DB1neOEEYT0b6pyF398WXCXDyXo5vyKLwLDgbtz35jpzZmHLHrM9ZuzKg8ly
 5ra0DdJCIctoIe1UBPkw/WK148fOvb013zrWfXVAzxYqikxOoUxA28SgER6GyKosq02pMAtyJD
 zjgAGe/VswoODaFxzuE7wRTCJbEIWzytYux4ggymimf9jIdABtA7CrKKT/U/W5aCylITNKb1hI
 uOY=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 31/32] target/riscv: rvb: support and turn on B-extension from
 command line
Date: Tue,  8 Jun 2021 10:29:46 +1000
Message-Id: <20210608002947.1649775-32-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210505160620.15723-17-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0c99c3d8d..de9262c930 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -286,6 +286,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ee2523f66b..5702c53c62 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -489,6 +489,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -559,6 +562,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
-- 
2.31.1


