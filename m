Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD71C5EBBBF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:41:32 +0200 (CEST)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5Df-0003yI-Pm
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48i-0005nR-Ox
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:22 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48f-0001Eu-Gj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260337; x=1695796337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FwSK71pVMw1FYuopiiGywl//m0q01lu9hgyxW+3Y8os=;
 b=qpWQgoQOIY7dwjyHwOE+58IpzQBkrUqRFnhRQb3NdrBpzLyH21VW2QrU
 4hQtXPYnknpUstbBETk/vX7F5JNqpCiT1IpD7ic69Domk0IBkQ2pEVR3U
 L9JqbprKRtS6kTwuOi6+MBSR3AcKtelZM9CjzSgnHuwqOjyCSh2kpaz5T
 w67hQUCBmhla3xOuUm5PwGd1fbBDwEc6K3N12SZONPE0XdhW11tfB45vz
 k8qgcHIf98cFTU6kOtrVgSF7zwLPXqC1bjekoR4PgfW9MaW7wHuzqsHwi
 cjnr1RbYQqBBif0jQPblOrNrWYeYD8N+M4T5BAwDBtYHFf0+0q+lx4lZN w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530931"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:46 +0800
IronPort-SDR: U6tNRtwhJ/XpIdCWw571wqeP+m1zhHttLKxCWM80Ap8HS8ysO8v3ReVbQ9qYwu4HM9EOVy2FMa
 4rqnZCp7x9wb4fLbJlPFEhcnPem6fsdSpk/9PpBGJlIJlyY+uUm5aZrN741vpy5IWgkwmguIc5
 fxIzG6QOS+0tk7fChpJYmEVnM9VMdIdqlcjOEI8Vp8j/4xsrSKqdGMaVX/HSHmrunr+bF5MNGm
 uDzxEzVjFI2sVhgyZRxTDB1n6LJ7AxEcmGTWR262WSFG3+iq7jSCbV2NAkzjiHJmAxQlYlAvsf
 ztVXiqwiK0Dqd03U9wxBpzRr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:43 -0700
IronPort-SDR: WRVXRRnPzteNNtv4e8yN4cZ0EI4MWkuNo1wscJmLnQCVEaCn38hi1DUy+91vFTdKGAsxpmlR99
 v/xdpodKCPqsa7ujkjTQ5Nc/thUbm+Hq2OgT4CVMFHUQlhZ8nenUA+I4pgUI88z96pW6C7/XiQ
 Dpr+DdP9hnY5yhuWrsf3s7CD4ehhdxBP4NHYmLbpBmJFFXVpZtyrMRjHclsu8g/DoEdxGmpEVv
 F0Rucf82NEa6gAhZmL/Bxee4jsoQhK2dJajn2NVKPMGBmQ8YyFme2xL7ic2QHS5Vy6qwvlZbxq
 8lg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8ss280Jz1Rwt8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260304; x=1666852305; bh=FwSK71pVMw1FYuopii
 Gywl//m0q01lu9hgyxW+3Y8os=; b=b93vRu9TRKC8LZgOX4DVi8Cm0Uez5+bXbO
 XVy0lEku6Lc9YuR0zBHnV9sIkL26gFjHJgJd7O8JdP1PHT+nfwwlRqKdV2d3wF1Q
 QRIzLaIv06ceKr12ltZm6EJ6ZZB65uUot9d/F1j/pyzzey4X+CofK9JF4C5t+MaW
 OO30HGI2Z4WnJYZxLDIY1x3tQelfEVNvVCWSkdbSIUFjn+JDodDv2u9Iw/CbvQ1d
 7Gvrlj/kR6gxVg1hJSLAGM3OsqGuO7LxuzODWQQLZ7C4UQxEuow1Oy7BRPKfMWVq
 EJMJhVZZ1pB49+qGWFuM/83W6NsvLnl7imE9FcjIU/sed98tSrmg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iAVlOeWtTScZ for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:44 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sq1R7kz1Rwrq;
 Mon, 26 Sep 2022 23:31:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 20/22] target/riscv: debug: Add initial support of type 6
 trigger
Date: Tue, 27 Sep 2022 16:31:02 +1000
Message-Id: <20220927063104.2846825-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

Type 6 trigger is similar to a type 2 trigger, but provides additional
functionality and should be used instead of type 2 in newer
implementations.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220909134215.1843865-9-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.h |  18 +++++
 target/riscv/debug.c | 174 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 4 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 0e4859cf74..a1226b4d29 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -85,6 +85,24 @@ typedef enum {
 #define TYPE2_HIT       BIT(20)
 #define TYPE2_SIZEHI    (0x3 << 21) /* RV64 only */
=20
+/* mcontrol6 field masks */
+
+#define TYPE6_LOAD      BIT(0)
+#define TYPE6_STORE     BIT(1)
+#define TYPE6_EXEC      BIT(2)
+#define TYPE6_U         BIT(3)
+#define TYPE6_S         BIT(4)
+#define TYPE6_M         BIT(6)
+#define TYPE6_MATCH     (0xf << 7)
+#define TYPE6_CHAIN     BIT(11)
+#define TYPE6_ACTION    (0xf << 12)
+#define TYPE6_SIZE      (0xf << 16)
+#define TYPE6_TIMING    BIT(20)
+#define TYPE6_SELECT    BIT(21)
+#define TYPE6_HIT       BIT(22)
+#define TYPE6_VU        BIT(23)
+#define TYPE6_VS        BIT(24)
+
 /* access size */
 enum {
     SIZE_ANY =3D 0,
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index e16d5c070a..26ea764407 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -39,7 +39,7 @@
  * - tdata3
  * - tinfo
  *
- * The following triggers are implemented:
+ * The following triggers are initialized by default:
  *
  * Index | Type |          tdata mapping | Description
  * ------+------+------------------------+------------
@@ -103,10 +103,12 @@ static trigger_action_t get_trigger_action(CPURISCV=
State *env,
     case TRIGGER_TYPE_AD_MATCH:
         action =3D (tdata1 & TYPE2_ACTION) >> 12;
         break;
+    case TRIGGER_TYPE_AD_MATCH6:
+        action =3D (tdata1 & TYPE6_ACTION) >> 12;
+        break;
     case TRIGGER_TYPE_INST_CNT:
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
-    case TRIGGER_TYPE_AD_MATCH6:
     case TRIGGER_TYPE_EXT_SRC:
         qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
                       trigger_type);
@@ -379,6 +381,123 @@ static void type2_reg_write(CPURISCVState *env, tar=
get_ulong index,
     return;
 }
=20
+/* type 6 trigger */
+
+static inline bool type6_breakpoint_enabled(target_ulong ctrl)
+{
+    bool mode =3D !!(ctrl & (TYPE6_VU | TYPE6_VS | TYPE6_U | TYPE6_S | T=
YPE6_M));
+    bool rwx =3D !!(ctrl & (TYPE6_LOAD | TYPE6_STORE | TYPE6_EXEC));
+
+    return mode && rwx;
+}
+
+static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
+                                             target_ulong ctrl)
+{
+    target_ulong val;
+    uint32_t size;
+
+    /* validate the generic part first */
+    val =3D tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH6);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, TYPE6_MATCH, "match");
+    warn_always_zero_bit(ctrl, TYPE6_CHAIN, "chain");
+    warn_always_zero_bit(ctrl, TYPE6_ACTION, "action");
+    warn_always_zero_bit(ctrl, TYPE6_TIMING, "timing");
+    warn_always_zero_bit(ctrl, TYPE6_SELECT, "select");
+    warn_always_zero_bit(ctrl, TYPE6_HIT, "hit");
+
+    /* validate size encoding */
+    size =3D extract32(ctrl, 16, 4);
+    if (access_size[size] =3D=3D -1) {
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using=
 SIZE_ANY\n",
+                      size);
+    } else {
+        val |=3D (ctrl & TYPE6_SIZE);
+    }
+
+    /* keep the mode and attribute bits */
+    val |=3D (ctrl & (TYPE6_VU | TYPE6_VS | TYPE6_U | TYPE6_S | TYPE6_M =
|
+                    TYPE6_LOAD | TYPE6_STORE | TYPE6_EXEC));
+
+    return val;
+}
+
+static void type6_breakpoint_insert(CPURISCVState *env, target_ulong ind=
ex)
+{
+    target_ulong ctrl =3D env->tdata1[index];
+    target_ulong addr =3D env->tdata2[index];
+    bool enabled =3D type6_breakpoint_enabled(ctrl);
+    CPUState *cs =3D env_cpu(env);
+    int flags =3D BP_CPU | BP_STOP_BEFORE_ACCESS;
+    uint32_t size;
+
+    if (!enabled) {
+        return;
+    }
+
+    if (ctrl & TYPE6_EXEC) {
+        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[inde=
x]);
+    }
+
+    if (ctrl & TYPE6_LOAD) {
+        flags |=3D BP_MEM_READ;
+    }
+
+    if (ctrl & TYPE6_STORE) {
+        flags |=3D BP_MEM_WRITE;
+    }
+
+    if (flags & BP_MEM_ACCESS) {
+        size =3D extract32(ctrl, 16, 4);
+        if (size !=3D 0) {
+            cpu_watchpoint_insert(cs, addr, size, flags,
+                                  &env->cpu_watchpoint[index]);
+        } else {
+            cpu_watchpoint_insert(cs, addr, 8, flags,
+                                  &env->cpu_watchpoint[index]);
+        }
+    }
+}
+
+static void type6_breakpoint_remove(CPURISCVState *env, target_ulong ind=
ex)
+{
+    type2_breakpoint_remove(env, index);
+}
+
+static void type6_reg_write(CPURISCVState *env, target_ulong index,
+                            int tdata_index, target_ulong val)
+{
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        new_val =3D type6_mcontrol6_validate(env, val);
+        if (new_val !=3D env->tdata1[index]) {
+            env->tdata1[index] =3D new_val;
+            type6_breakpoint_remove(env, index);
+            type6_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA2:
+        if (val !=3D env->tdata2[index]) {
+            env->tdata2[index] =3D val;
+            type6_breakpoint_remove(env, index);
+            type6_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for type 6 trigger\n");
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
     switch (tdata_index) {
@@ -407,10 +526,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_=
index, target_ulong val)
     case TRIGGER_TYPE_AD_MATCH:
         type2_reg_write(env, env->trigger_cur, tdata_index, val);
         break;
+    case TRIGGER_TYPE_AD_MATCH6:
+        type6_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
     case TRIGGER_TYPE_INST_CNT:
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
-    case TRIGGER_TYPE_AD_MATCH6:
     case TRIGGER_TYPE_EXT_SRC:
         qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
                       trigger_type);
@@ -428,7 +549,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_in=
dex, target_ulong val)
 target_ulong tinfo_csr_read(CPURISCVState *env)
 {
     /* assume all triggers support the same types of triggers */
-    return BIT(TRIGGER_TYPE_AD_MATCH);
+    return BIT(TRIGGER_TYPE_AD_MATCH) |
+           BIT(TRIGGER_TYPE_AD_MATCH6);
 }
=20
 void riscv_cpu_debug_excp_handler(CPUState *cs)
@@ -479,6 +601,24 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                     }
                 }
                 break;
+            case TRIGGER_TYPE_AD_MATCH6:
+                ctrl =3D env->tdata1[i];
+                pc =3D env->tdata2[i];
+
+                if ((ctrl & TYPE6_EXEC) && (bp->pc =3D=3D pc)) {
+                    if (riscv_cpu_virt_enabled(env)) {
+                        /* check VU/VS bit against current privilege lev=
el */
+                        if ((ctrl >> 23) & BIT(env->priv)) {
+                            return true;
+                        }
+                    } else {
+                        /* check U/S/M bit against current privilege lev=
el */
+                        if ((ctrl >> 3) & BIT(env->priv)) {
+                            return true;
+                        }
+                    }
+                }
+                break;
             default:
                 /* other trigger types are not supported or irrelevant *=
/
                 break;
@@ -527,6 +667,32 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, =
CPUWatchpoint *wp)
                 }
             }
             break;
+        case TRIGGER_TYPE_AD_MATCH6:
+            ctrl =3D env->tdata1[i];
+            addr =3D env->tdata2[i];
+            flags =3D 0;
+
+            if (ctrl & TYPE6_LOAD) {
+                flags |=3D BP_MEM_READ;
+            }
+            if (ctrl & TYPE6_STORE) {
+                flags |=3D BP_MEM_WRITE;
+            }
+
+            if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
+                if (riscv_cpu_virt_enabled(env)) {
+                    /* check VU/VS bit against current privilege level *=
/
+                    if ((ctrl >> 23) & BIT(env->priv)) {
+                        return true;
+                    }
+                } else {
+                    /* check U/S/M bit against current privilege level *=
/
+                    if ((ctrl >> 3) & BIT(env->priv)) {
+                        return true;
+                    }
+                }
+            }
+            break;
         default:
             /* other trigger types are not supported */
             break;
--=20
2.37.3


