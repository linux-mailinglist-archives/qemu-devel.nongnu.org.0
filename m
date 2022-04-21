Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FB50997F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:54:02 +0200 (CEST)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRdZ-0000HR-8o
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSb-00061k-50
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:38 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSZ-0007yk-Cv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523115; x=1682059115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xVKI1KYX5p2vLhh0U6iF2jzD/ULzCfKpwwLJE4Z56Q=;
 b=XJ32uMciAidiMayKHDwrY6jyzJ3zXnOER+B5sK8D9/CoBBuTWAi262SZ
 U8FAYezhkS+R+/oWn53rVtwsYyk/YS7wWz8QaFEIf86oCTSZbk+thEFs9
 9Rt83LYYKl49YxQ9mXRLlO1ApvhxWDoRJes3TZS5mMk7YuBSdtaQ9lR3j
 JcQp5xVowGtuzTmOamiHTzBVUC8VItt/2aVI4UVTy+DGwGsEa9r+IBqVw
 d+Lue4YVzqbHY9remecI2ISjv5QZcW+lYWsRnStWiNraHAbha4jRbxjoa
 aYMVwSVaD4/5SrMH6PbX4eFgEbsbmBPmURrgE6Vj87q4sWbZpH2OuFmhA Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640022"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:07 +0800
IronPort-SDR: 6Rq28DDd0ciJJgsbW7TBbhurPwqD1cNT5VIwWDYKJM3wEOYA0zcNvuywgLdJAqU38s/abyOtuE
 OGefKBFekx3CYohdzXvEhf3xRvcMXDZraZluOgU0Lz8AhQSl8MQxolWrN1l5ABTPa6E2ZXrVL5
 ZFeYMBZa6D3PSt9ViJ9kNFgcXZjoi8FkgYYPpAJ7kkwTjxuHKiRZPr8OG70zGz7KRJk9NoZFNl
 jhwaMpoOfS9vDQyfrZ/rbfnM9kKarJrmy/Pa3j84epQWe0TbBHJ7n0nFC3VRqqnjRT5260MkZB
 GSs3FKM0rqbfb7lwGy7PHQSO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:10 -0700
IronPort-SDR: cSLGSBRCF7rJIgCxX33iiVhqsYvZYXfqcAn+UAFdrXpvpznyDZoVGEM7hKVtDtql+E7oRxQ5Fq
 Lh7Hz6TC3xEfmj3rQJ5Ylotkr3VA34VmlYLinIU/sg5LjTaQhutaS/mFokSp4EeWCdOxAzNffr
 4K15/y2d6UlR7WUivQVzixrdi8cRxCVQ4jh7lHAlk35fGXskqKIh2hkCba4lcfrpAQEWiTnJnc
 1pgwqKGki5lXzkv1DNBV1sslQM2IhwDpjFVx84fyi9Jp8fqyultyu139lNpwocwpjA4rrUkYf6
 wWg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXb4hNpz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523087; x=1653115088; bh=9xVKI1KYX5p2vLhh0U
 6iF2jzD/ULzCfKpwwLJE4Z56Q=; b=kF+SpqRIPIj1lalLI5NoaOj/2PiOkD0KUY
 iWlxIV5yYAe+7V90kiObWyWwjFVf7wDHEHPsZt0Vt5hhuwmXfoM9B+OkUjGRq3SR
 uzo8nFsH7vsTzzOx12xS5brHlaZPF5ckd42k36zh7UKjqINGsKtntLGuI0QlrrlU
 T16zlUtLOWM6InSFwQAAn7gJ4GuuSQBmWQ7cR9LF9TdrRatq4TFGilXyUasfxdIy
 F/QqW15gh+/fXVodT1qqcRxIXY6VP7jH9CBRjpOdPYuM3O9T+Rn6SdQpwBaz9sVZ
 M1TuWkRs2lQTFfXW9njfbxGqbKAt5J1XIO2eBUs831lDL11u/5wg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cUKAHDGtzNvT for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXY2npLz1Rvlx;
 Wed, 20 Apr 2022 23:38:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/31] target/riscv: cpu: Add a config option for native debug
Date: Thu, 21 Apr 2022 16:36:25 +1000
Message-Id: <20220421063630.1033608-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Add a config option to enable support for native M-mode debug.
This is disabled by default and can be enabled with 'debug=3Dtrue'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-3-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 4 +++-
 target/riscv/cpu.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 39a9ff17d3..62e53e3653 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,7 +79,8 @@ enum {
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA,
-    RISCV_FEATURE_AIA
+    RISCV_FEATURE_AIA,
+    RISCV_FEATURE_DEBUG
 };
=20
 /* Privileged specification version */
@@ -405,6 +406,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool aia;
+    bool debug;
     uint64_t resetvec;
 };
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8919928f4f..477961b619 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -548,6 +548,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         riscv_set_feature(env, RISCV_FEATURE_AIA);
     }
=20
+    if (cpu->cfg.debug) {
+        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
=20
     /* Validate that MISA_MXL is set properly. */
@@ -795,6 +799,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.35.1


