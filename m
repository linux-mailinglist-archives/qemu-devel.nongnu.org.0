Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6339EAF8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:48:01 +0200 (CEST)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPuS-0006DK-53
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfN-0004Yr-L8
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfL-0004Zo-L5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112343; x=1654648343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMkkhhbua+g6Iz8QiZvGaBIyn4F0tdj2bXdISutzIUM=;
 b=DXu40gPqgunwNLyJ1Vvh1HH9Mkd9FB/mUZ1QaLQXKYG952codo6CjOWC
 92i5uTacipwYOJfZY5WfxqGGsyxTkyOsIl8bLcjhdLN1M6PMfxckGZk4E
 BUMhzS5N3MIj/yLd5VoqGSMlPJlDe6XPq2Rnf79L+gyZ2LMBnaLMeaML2
 FKFo+vSPSaj8YMCj0B1YRDXJkygX0zV7pz0HALs5ATy4d4kuyQwEZFQsG
 wOZSINJabT6/wKNVfyaW9Oz3kR356I/vYrMB7+9HI+4sKqSS6zXHSli2G
 4cBMO83V9dvTnsn/94HskQyWkPxtydt+RIpIh24qitBKvb6UwUOJojygD g==;
IronPort-SDR: Srds2GAmTgdNVwzHCai2GHfZ17zjaVKdg0eEH94xd9Xu2qh2Cb+V99774semGaCiMhZpSl311Y
 iA3cYljF3mfD5rgI67/cTl/P4Rlbyem24oBREOzugQjX85diud6MuxbRbEP72ebaHqzp//rmvA
 7Z6qdurO8M3MSgxgNUnsLm2NOFfPRYF8iNPvge72F7uLT4RZGPPBKv/loaEZ+inM4VWO69dphb
 Ipx3Tzo3CpUgVUELI76ZvXn4lpr0dLzYI3PbMNHeoiZWssiGYu5CTwCvsP1YG1O0oypDmRuTjg
 ekM=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087485"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:32:00 +0800
IronPort-SDR: sy5iA6SZulh+pQHXSOrllT/XA13EWM/5MpgH80uz86DxV/aeRTGjtTwqdHEQmAYTRS1/6kos6L
 L0pwmchiLdqLaGPbToRkWAxR6FlrIRyw00fhBV8MxCIGL/vXvpl6nbFIlS1hGldHRiTQnvriRn
 WbIn1B1Yk2J5CL5uSc2LC5Nzlj5xCpjGoK4vgybNHzk75NILbQJAVx2CBQcR5keE9ER1nqW3em
 61+6cWYNIsXj3BjDm34EVkOkwS6rIIIDL6y2pOPlhiRNTguxGZhS0FGJcFqY6OK4qjAYBAn4XY
 s/Y4hTbH9nLWn0DIoOfwfJEo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:11:08 -0700
IronPort-SDR: O5qCwl5nYegjTxT1TcotmGZdaSPzZzi4xd0/Digs+XIwcI+RxgJiUPnVofwQDwlezzDuEtAV+b
 5izWQlc4DaZN9tLZUO+psIsn/Y7Qg423Vnx36mR430Tqc1V6LzoIRYQqdvwq3i69sq+3Q3iqYB
 7eYNe6B9OJ6OR7zlX+n9DJp/sR1Rb+7s2Myg/TTWglblvC7atMjzaTJrurkTC81CoZ+7gMTCWd
 lry30+ks+7rZAM73K/Q6/ig20vYcjQc4vbIL7CvDxIJ34mDixNk+dkNHr8y+Xn6zLpZc8pvPWm
 k7U=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:58 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 32/32] target/riscv: rvb: add b-ext version cpu option
Date: Tue,  8 Jun 2021 10:29:47 +1000
Message-Id: <20210608002947.1649775-33-alistair.francis@wdc.com>
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Default b-ext version is v0.93.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210505160620.15723-18-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  3 +++
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de9262c930..bf1c899c00 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -83,6 +83,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
+#define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
 
 enum {
@@ -132,6 +133,7 @@ struct CPURISCVState {
     target_ulong guest_phys_fault_addr;
 
     target_ulong priv_ver;
+    target_ulong bext_ver;
     target_ulong vext_ver;
     target_ulong misa;
     target_ulong misa_mask;
@@ -297,6 +299,7 @@ struct RISCVCPU {
 
         char *priv_spec;
         char *user_spec;
+        char *bext_spec;
         char *vext_spec;
         uint16_t vlen;
         uint16_t elen;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5702c53c62..991a6bb760 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,6 +127,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
+static void set_bext_version(CPURISCVState *env, int bext_ver)
+{
+    env->bext_ver = bext_ver;
+}
+
 static void set_vext_version(CPURISCVState *env, int vext_ver)
 {
     env->vext_ver = vext_ver;
@@ -388,6 +393,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
+    int bext_version = BEXT_VERSION_0_93_0;
     int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
@@ -412,6 +418,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
+    set_bext_version(env, bext_version);
     set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
@@ -491,6 +498,21 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
         if (cpu->cfg.ext_b) {
             target_misa |= RVB;
+
+            if (cpu->cfg.bext_spec) {
+                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
+                    bext_version = BEXT_VERSION_0_93_0;
+                } else {
+                    error_setg(errp,
+                           "Unsupported bitmanip spec version '%s'",
+                           cpu->cfg.bext_spec);
+                    return;
+                }
+            } else {
+                qemu_log("bitmanip version is not specified, "
+                         "use the default value v0.93\n");
+            }
+            set_bext_version(env, bext_version);
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -569,6 +591,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
-- 
2.31.1


