Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2C5473CA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:35:56 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyTD-0003bF-6l
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQl-0001LB-CB
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQj-00069H-Pg
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso758100wmr.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uo2YIfU574dI280rF8iVMdiygQnubCcepIz3cr4Oar0=;
 b=c3L1/UeJEz6RFaBZ/FhjBz2hATTnJhv1wKyfgx4EfWOM/4j5WiHyuC3qEPC+XymQi1
 Lv6wHmt0dwFh3KzL92S4Z6WBMYZbtIVQn4usMt1MZ4FsQL/2X9qnATzUTFHprQ+MjrHG
 t0UZ9fq9+gB0BMovvLfoVw7fVyP046RYWYBc5mTxcGgD/vRRt7aqxeR+ANLsyiXbP74H
 dfOGPlsGTfnhcC1FaEmLxX87859suSHwYg23AwW81hFyXzYY2bCc3guefo33MLN0dT1Y
 l81+ZojhGrER9PtL8K6c3r1CagLU/dIZqMzj4jlNdV/cGpYPFkvxatK/WXM9ogSXYUVa
 RY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uo2YIfU574dI280rF8iVMdiygQnubCcepIz3cr4Oar0=;
 b=ZmEwrhro/8im/kh+yyQrImJTFjd7c1/J1rJvjJI3IzAHCt0JYaIy5SEzNofTJ3eiIZ
 ohkgAAb7vjfuwDBaqeI1DJSZOMKwtwpSeUrt23yPvzIzOXtdH9UwuX0scA5kDy65UKax
 zXZ6Pv9h5nOzfHJ+WND4uZXNZFknMh3XYp4S+iuRFOtaNQc4Je9VGoJnLS83pyY3o1Cw
 aZ97VYg2bhaeMwbg0ohtLu5PMzuB3aisYfN7Mw7/APrl7KH3EIGKgB+OF9CS7lQdMQIo
 mWunb2Anxh/lvV/sYiMlfD/V7Ux3Aw3DrBsdbDSQKsCN49g02AtCqGGTWOaUfBV+O2Jt
 x6rg==
X-Gm-Message-State: AOAM531eF9JQbT3YBr/AG7XF/TQYOxOzYZEf8KaMzCk81MtikAbUcG2/
 NWQk3uTd6oNWSRahgfeOtp5uqK++KTc=
X-Google-Smtp-Source: ABdhPJyupcpBKF4PerPKlrcfAbuvJsrUriDiOJGS2DSVXQaSRtTbLwJCwhPOKGfvZxqvfKQZiQ4+Aw==
X-Received: by 2002:a1c:7901:0:b0:39c:4252:d7f1 with SMTP id
 l1-20020a1c7901000000b0039c4252d7f1mr4136851wme.178.1654943600146; 
 Sat, 11 Jun 2022 03:33:20 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 n39-20020a05600c3ba700b00397342e3830sm13180059wms.0.2022.06.11.03.33.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 David Daney <david.daney@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/49] target/mips: Fix WatchHi.M handling
Date: Sat, 11 Jun 2022 12:32:24 +0200
Message-Id: <20220611103312.67773-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marcin Nowakowski <marcin.nowakowski@fungible.com>

bit 31 (M) of WatchHiN register is a read-only register indicating
whether the next WatchHi register is present. It must not be reset
during user writes to the register.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Reviewed-by: David Daney <david.daney@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
Message-Id: <20220511212953.74738-1-philmd@fungible.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c                   | 2 +-
 target/mips/cpu.h                   | 1 +
 target/mips/tcg/sysemu/cp0_helper.c | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ad74fbe636..c15c955367 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -305,7 +305,7 @@ static void mips_cpu_reset(DeviceState *dev)
 
         for (i = 0; i < 7; i++) {
             env->CP0_WatchLo[i] = 0;
-            env->CP0_WatchHi[i] = 0x80000000;
+            env->CP0_WatchHi[i] = 1 << CP0WH_M;
         }
         env->CP0_WatchLo[7] = 0;
         env->CP0_WatchHi[7] = 0;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5335ac10a3..6b6b8776d1 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1005,6 +1005,7 @@ typedef struct CPUArchState {
  */
     uint64_t CP0_WatchHi[8];
 #define CP0WH_ASID 16
+#define CP0WH_M    31
 /*
  * CP0 Register 20
  */
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index aae2af6ecc..5da1124589 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -1396,10 +1396,11 @@ void helper_mtc0_watchlo(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 void helper_mtc0_watchhi(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 {
     uint64_t mask = 0x40000FF8 | (env->CP0_EntryHi_ASID_mask << CP0WH_ASID);
+    uint64_t m_bit = env->CP0_WatchHi[sel] & (1 << CP0WH_M); /* read-only */
     if ((env->CP0_Config5 >> CP0C5_MI) & 1) {
         mask |= 0xFFFFFFFF00000000ULL; /* MMID */
     }
-    env->CP0_WatchHi[sel] = arg1 & mask;
+    env->CP0_WatchHi[sel] = m_bit | (arg1 & mask);
     env->CP0_WatchHi[sel] &= ~(env->CP0_WatchHi[sel] & arg1 & 0x7);
 }
 
-- 
2.36.1


