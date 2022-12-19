Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B4650659
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75j8-0008Ji-D6; Sun, 18 Dec 2022 21:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75j6-0008JV-VV
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75j5-00015O-6D
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416279; x=1702952279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Q1etqXq6mt77HOH608vmTWlV47LCAy3tVEsE1U6I48=;
 b=A7T3vQDvSScLNiyalBrlXV2olTHz9OArJ1vvYw8tF5V2CDBBDoh6Nr3g
 D90k+0f5SNIIRz49vbKPj36NCxEr4ojtQjmPCUZ81wLgDUngNEc/k5FyR
 e0RUR+jXxlAOXBZqpZyurEo4NjE0/0R1BhcIA/HGN99K3gWcO4NCdOn7Q
 VOFt4QQ4z7Z/TSpBp1z4AuUZWfkPwWBleeegLatTdbVI+zAyxP+q4PA6r
 00oii80rY4yIzZWKy9MPJs4fVsx6ruvpzSX3Gv3Q116vDOC7Z/88tQm5F
 BRw0RdAYmfxvfxxcEyA5bJZJHkgB6nJJ6kE9FsKB4a5de25W+OX8+3ASO A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199323"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:48 +0800
IronPort-SDR: Uy/RV5FAGaHnYTjWeRkTd6KRj2YaP2JWj9kLtTnbzdSo0dlUAdJfA/p44YpwmhPNl5qDMZm3wf
 14/WLYvqnhFYayXg7D4DX0ZSk34mor5RxqqpJJ7IAjSB4MrFKPzUUSvBPw9D/X2jZinHtayHSt
 bJIsMKBdDNIS5h9BtR3KNdUnZ15hwQRp7XRmBI69w5aF96HD4u0ty4j9SUT5ETZQUWL0vAfNsm
 U/1Zz5hH3VXrtIjNWtVs7EW9yHwdzvNr5JdOjleBOFnVJ2lw9AIOF4QN9Fg3w6wLQIbx9H+8/Q
 bws=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:21 -0800
IronPort-SDR: 5DV74qRMteWXn5ZM9tztGAmALfL/xzbCRc+pdaZEhOdOmJhrAUyMs3wEPMo+koF1GVCKCedW4B
 oCHnX+mh8EakBJh1bVsnG0pKzWghAU4JYMwbx8anuL8G9Y1YojEMUPcbpWjTyOK6gKhtQN6S4D
 1yZdF1dRj6Huj4JHh63EGDo9ovOJTOZmYEV7j37LyadF1wKYurHw/FFPdBU+KVLQ5CKUajgW9a
 9kJR7o1lbPES7a9Uq82kQfC/lSEaxEQbvZWtcA0gntbTeCBAw09KlNon2BtBH5Vmx8laEAeCN8
 ItY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3JX2dMFz1RvTp
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416267; x=1674008268; bh=6Q1etqXq6mt77HOH60
 8vmTWlV47LCAy3tVEsE1U6I48=; b=RoC1D6ZM1d4VUVlUryv7+f0+L6qoLrLu1P
 1bJb/2W5aWdg+ggL19A+x8thtpHknbGKew/4sKfjYRLOdyxPfMsZMqbJav/xKvNg
 CYQ/bk9jOr3UFeYJDd0Vxx/FEzElERznClnDFATUzZeHq2UjR09fdubCA+JcwuNk
 ayZiBlaEDzwpB/aYXD4rmmnssf7h1+ht7Ku1YPvWhDodHLPxbrxHK9sDgLlj7oDQ
 /7ySrzU3OBet1wd3NURo6zeKA4aNU4YQUar9bCGXOrfRF6jZoVSKXygBZxm2qRln
 vpcDVxOgnmLc1jhfy16qcmoUofmSFRdh0NrNKCT9TynXCdF8pPyQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CR_cMG_5W8_3 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3JV5gY8z1RvLy;
 Sun, 18 Dec 2022 18:17:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/45] target/riscv: Enable native debug itrigger
Date: Mon, 19 Dec 2022 12:16:32 +1000
Message-Id: <20221219021703.20473-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

When QEMU is not in icount mode, execute instruction one by one. The
tdata1 can be read directly.

When QEMU is in icount mode, use a timer to simulate the itrigger. The
tdata1 may be not right because of lazy update of count in tdata1. Thus,
We should pack the adjusted count into tdata1 before read it back.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221013062946.7530-4-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 371862cf38..b3574b250f 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -624,10 +624,80 @@ void riscv_itrigger_update_priv(CPURISCVState *env)
     riscv_itrigger_update_count(env);
 }
=20
+static target_ulong itrigger_validate(CPURISCVState *env,
+                                      target_ulong ctrl)
+{
+    target_ulong val;
+
+    /* validate the generic part first */
+    val =3D tdata1_validate(env, ctrl, TRIGGER_TYPE_INST_CNT);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, ITRIGGER_ACTION, "action");
+    warn_always_zero_bit(ctrl, ITRIGGER_HIT, "hit");
+    warn_always_zero_bit(ctrl, ITRIGGER_PENDING, "pending");
+
+    /* keep the mode and attribute bits */
+    val |=3D ctrl & (ITRIGGER_VU | ITRIGGER_VS | ITRIGGER_U | ITRIGGER_S=
 |
+                   ITRIGGER_M | ITRIGGER_COUNT);
+
+    return val;
+}
+
+static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
+                               int tdata_index, target_ulong val)
+{
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        /* set timer for icount */
+        new_val =3D itrigger_validate(env, val);
+        if (new_val !=3D env->tdata1[index]) {
+            env->tdata1[index] =3D new_val;
+            if (icount_enabled()) {
+                env->last_icount =3D icount_get_raw();
+                /* set the count to timer */
+                timer_mod(env->itrigger_timer[index],
+                          env->last_icount + itrigger_get_count(env, ind=
ex));
+            }
+        }
+        break;
+    case TDATA2:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata2 is not supported for icount trigger\n");
+        break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for icount trigger\n");
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
+static int itrigger_get_adjust_count(CPURISCVState *env)
+{
+    int count =3D itrigger_get_count(env, env->trigger_cur), executed;
+    if ((count !=3D 0) && check_itrigger_priv(env, env->trigger_cur)) {
+        executed =3D icount_get_raw() - env->last_icount;
+        count +=3D executed;
+    }
+    return count;
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
+    int trigger_type;
     switch (tdata_index) {
     case TDATA1:
+        trigger_type =3D extract_trigger_type(env, env->tdata1[env->trig=
ger_cur]);
+        if ((trigger_type =3D=3D TRIGGER_TYPE_INST_CNT) && icount_enable=
d()) {
+            return deposit64(env->tdata1[env->trigger_cur], 10, 14,
+                             itrigger_get_adjust_count(env));
+        }
         return env->tdata1[env->trigger_cur];
     case TDATA2:
         return env->tdata2[env->trigger_cur];
@@ -656,6 +726,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_in=
dex, target_ulong val)
         type6_reg_write(env, env->trigger_cur, tdata_index, val);
         break;
     case TRIGGER_TYPE_INST_CNT:
+        itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
--=20
2.38.1


