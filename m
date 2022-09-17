Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE1A5BB800
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 13:31:02 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZW2H-00034d-Dt
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 07:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVx1-0005ni-Nq
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVx0-0006nR-8P
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwxK7wYQtcwNhi0HUgX6kqCDO02Xtmtv+VavZ3REWNU=; b=xjr/DJHpYQy+1kf8dR5tbXivRS
 86DZIevXsrVjZo12lfk4rZUbdMkSYb6pIB6zv6lucRZGFB+aRMdDVMLViGUG/D/HMYpCxqYjN9q6G
 mKIXIf+P76sgsnghrHAg776rSbMCDjGQZR/A5dhuA4R+mcWbokz0YE8g4hhsJdKm1B/otobgWuMyW
 ItWPbnp9sEdS1+lFS1GWBEpF4N1gSVKS9n9XEWkZs4quKvsJiV2Ckk3q8RmarX+VxP5C9o0qOfy75
 mMSpsUCbR+LQjLmtiHk8GfkgYHUWFsFpbRoad0YoGaE+oKHTlU0Af2PGwfA3GBBsNTSp6OuVlXxvJ
 8RDOTcWcX5oQiD2NpaC0zDlYPe18LK4XJbETPAJB4kP2Ihzku/LZZAtEpk/8HEYL+mI3LG0goxskg
 AYjoh7R8lRx+XxSZIvHtGLCzEwJNLtqxdiuArVeOOmPi5MMNVrfOLwOhBIrGHBlQEBJjenjO7wEsi
 +hZ+1xR0mjew0oB+8Mp41LTcCwrHvtLdYEAaH1CuWB3wQUv6syTDqfWgcPLfPKZhrKubYupAMowRh
 tTXpybZ0VaQh2EdURZf+u9KzZlcatUVnSy7n1zB81VNEcwvFrsbJQcB6MjRC6acHW/OiPJtOAULMF
 pTwejlCMRuV7Zu2z+qpETPYKoPS6Q6WKXY59XHCdk=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVvI-000C7q-UD; Sat, 17 Sep 2022 12:23:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sat, 17 Sep 2022 12:25:13 +0100
Message-Id: <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/4] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

There are already 32 feature bits in use, so change the size of the m68k
CPU features to uint64_t (allong with the associated m68k_feature()
functions) to allow up to 64 feature bits to be used.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.c | 4 ++--
 target/m68k/cpu.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index f681be3a2a..7b4797e2f1 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
-    env->features |= (1u << feature);
+    env->features |= (1ul << feature);
 }
 
 static void m68k_unset_feature(CPUM68KState *env, int feature)
 {
-    env->features &= (-1u - (1u << feature));
+    env->features &= (-1ul - (1ul << feature));
 }
 
 static void m68k_cpu_reset(DeviceState *dev)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 67b6c12c28..d3384e5d98 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -154,7 +154,7 @@ typedef struct CPUArchState {
     struct {} end_reset_fields;
 
     /* Fields from here on are preserved across CPU reset. */
-    uint32_t features;
+    uint64_t features;
 } CPUM68KState;
 
 /*
@@ -539,9 +539,9 @@ enum m68k_features {
     M68K_FEATURE_TRAPCC,
 };
 
-static inline int m68k_feature(CPUM68KState *env, int feature)
+static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
 {
-    return (env->features & (1u << feature)) != 0;
+    return (env->features & (1ul << feature)) != 0;
 }
 
 void m68k_cpu_list(void);
-- 
2.30.2


