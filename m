Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9245048D8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:15:57 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9RE-0001oo-4l
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xI-0001EM-Ko
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xF-0003OQ-54
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:00 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so15506215pjb.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25C7iOsGqfSeEIqOCeDhxny3HAl1dQf5ZHtQgWZYi98=;
 b=PNrKfzbz8AE8ekSFNMGR/HM/6UM1sgoNIs/tQLjBoA+Ic/j46APdoa0qZ++o2E65Qq
 +gXHNqcdf1brdqNSPqBngM25HU3XkBlK4zyjBkNmnrJX/H3/jo2DneEqQqa7QkMQET5D
 s2WA9jFW4KzJxlUFQJp3G/Y133ISZfHtjzVxmJPNsv+tM0QhrB2PQQDXHaC0fDS66ETA
 xhsXwndF/NzIqB52UdIhwstF9V8K95an/lMCYRnuErODWtz8fyfwZHjPMhUxNqOEwB9r
 BQwoLq1JGnGrmoZ86GgWKQ0b3v2ORB0j+u3rg81DehCnbhsO7US5WWNZtMOu5Pl5i8pJ
 68Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25C7iOsGqfSeEIqOCeDhxny3HAl1dQf5ZHtQgWZYi98=;
 b=KytMhme5xEeE9nhVpBITwmRMW1+QGQWLEDrfdKh0LHG4IkjfZ5nUVVHzO4/tcxpGRp
 h+eeksx9N/uMhIC9nO3NH0GkEJMpu7ZMPUVQWQq1bqlmyqp2Ya9uM6JPwLYXNqFo80ii
 qjOtEdTeL095SZol1DbcnOxnGIrHS3PWqVPd+AOBZwJ2hw0f9w5LSRQljKiQ5D/Uu0qk
 6I91pFiuRITmI1yGvlw0r0L6JxeCx+NWoDq8K93WktF2rqw9k5oPn545SV6t1XBXsuY3
 6qCaVL7d+Av1x2Dc7kFeyEvCe0PGfLDrAz0ZgCxNVMJcKjmPISJA5aucDvgZUwxIgPNR
 tdkw==
X-Gm-Message-State: AOAM532Z82KPFopu01xWdNXcA3m9O3Q+wymy7S9cnP99OE3oZv7XwnwF
 8gaRB46oCNSZolMibkLJNPf7rhdD+98jTQ==
X-Google-Smtp-Source: ABdhPJzjQN290ryDfjXA2XISuFnHbWhzFgJl6UxRkf/tLWGUkp4LBXY/LXRZXTuIUEvkFkYedUIbUg==
X-Received: by 2002:a17:902:6bc9:b0:158:a0d3:d080 with SMTP id
 m9-20020a1709026bc900b00158a0d3d080mr7753890plt.24.1650217495858; 
 Sun, 17 Apr 2022 10:44:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/60] target/arm: Name CPState type
Date: Sun, 17 Apr 2022 10:43:56 -0700
Message-Id: <20220417174426.711829-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give this enum a name and use in ARMCPRegInfo,
add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 6 +++---
 target/arm/helper.c | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 2c991ab5df..fe338730ab 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -116,11 +116,11 @@ enum {
  * Note that we rely on the values of these enums as we iterate through
  * the various states in some places.
  */
-enum {
+typedef enum {
     ARM_CP_STATE_AA32 = 0,
     ARM_CP_STATE_AA64 = 1,
     ARM_CP_STATE_BOTH = 2,
-};
+} CPState;
 
 /*
  * ARM CP register secure state flags.  These flags identify security state
@@ -262,7 +262,7 @@ struct ARMCPRegInfo {
     uint8_t opc1;
     uint8_t opc2;
     /* Execution state in which this register is visible: ARM_CP_STATE_* */
-    int state;
+    CPState state;
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 33ba77890b..8b89039667 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8503,7 +8503,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, int state, int secstate,
+                                   void *opaque, CPState state, int secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
@@ -8663,13 +8663,15 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * bits; the ARM_CP_64BIT* flag applies only to the AArch32 view of
      * the register, if any.
      */
-    int crm, opc1, opc2, state;
+    int crm, opc1, opc2;
     int crmmin = (r->crm == CP_ANY) ? 0 : r->crm;
     int crmmax = (r->crm == CP_ANY) ? 15 : r->crm;
     int opc1min = (r->opc1 == CP_ANY) ? 0 : r->opc1;
     int opc1max = (r->opc1 == CP_ANY) ? 7 : r->opc1;
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
+    CPState state;
+
     /* 64 bit registers have only CRm and Opc1 fields */
     assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
     /* op0 only exists in the AArch64 encodings */
-- 
2.25.1


