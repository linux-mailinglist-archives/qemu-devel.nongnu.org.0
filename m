Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48463407EFC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:34:35 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTNC-0001mZ-BO
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTH0-0005sT-Rw
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGv-0004Vj-Cg
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id b6so10894054wrh.10
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTlRxPmHW1MMBzxLKQbK3V9oXhvEdGh1iTdPd/VuorU=;
 b=DhYgYpEAEWJcnaaKKWlUEGAGFTdtbCfP9xsTmf9HzAfGe5hEtahL57cWM6F8YCBt1f
 Lu7jrYAL5ZMRxevRYG71IYREH3fzlMDtaZvj42jZZxmqbECY/V2ePRuDRoGUaAK56nFT
 UW+ecqqg3OV8WoWAPhVJT11Rx8G+TnRAfQGdsUxdOFMpfkImlx8WUM+Lgg+wdg7VraC2
 KOkY3FJcfztorlRTkWLqqFO4mFcliVn/W4oVrowA7vz5P5LwQFq6ZIgYgH+nE9S0l1RF
 fkeNp37IzfvOIPcwM4TwcyRHyYVUPIhFPw+W9/6TpSr1nynwbNVfBbG7Tnp1dFgzOtmB
 h0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WTlRxPmHW1MMBzxLKQbK3V9oXhvEdGh1iTdPd/VuorU=;
 b=aK4gu8k5Hiago+Vap+NOVUVW5Bdhh1/wxy1FH9LLwA6KUuhquMr1Fndvn2MlAmYtwR
 XRstnS2kMkGh0Skhow5PNm/qtXyy3pTqDYBzGHoRm0Z9RNLwaGKvTVZvTKvXkiDpfkKX
 ZWy/Uk26otgIh7/WTSr8f0FR9JeCqion85Rj9PdvAJcmR0NqmQElqJsiNJnl/c8Qx+QD
 zxn4fLaoNsMo9V++PzORf0eHhwROe2+GRmzokcghuCN8YOgyjOc29j0sGnQf224HjT5M
 JX3dPK4D+5bu8Xc3oTB7JJumFEippU1bhz6vr+XtpFVKdGV+KZHRlOjVxiWS5DsyJA5m
 TIAA==
X-Gm-Message-State: AOAM533i3mm/HU1ecOePu331RiLo9EQsDKYE1ppbzwHYki+ImapBQvx7
 kJzs/jg+EctPQWIvKqwVXAB5V9cvYus=
X-Google-Smtp-Source: ABdhPJzV4478kF6HL6N3eMFNnVx/0ZGwoc+WwakP9h3V+WNiSG+Jpd9ENWLBwzg9c1dpGPhqRXFVDw==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr4291840wrr.275.1631467682937; 
 Sun, 12 Sep 2021 10:28:02 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n26sm2872141wmi.43.2021.09.12.10.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/30] accel/whpx: Implement AccelOpsClass::has_work()
Date: Sun, 12 Sep 2021 19:27:07 +0200
Message-Id: <20210912172731.789788-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement WHPX has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c                    | 4 +---
 target/i386/whpx/whpx-accel-ops.c | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 3db7bd4eb4d..6bce52ce561 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -41,7 +41,6 @@
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
-#include "sysemu/whpx.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 #include "trace.h"
@@ -89,8 +88,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
     if (cpu_is_stopped(cpu)) {
         return true;
     }
-    if (!cpu->halted || cpu_has_work(cpu) ||
-        whpx_apic_in_platform()) {
+    if (!cpu->halted || cpu_has_work(cpu)) {
         return false;
     }
     return true;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 6bc47c53098..1f9c6d52c27 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -83,6 +83,11 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
     }
 }
 
+static bool whpx_cpu_has_work(CPUState *cpu)
+{
+    return whpx_apic_in_platform();
+}
+
 static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
     ops->synchronize_state = whpx_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
+    ops->has_work = whpx_cpu_has_work;
 }
 
 static const TypeInfo whpx_accel_ops_type = {
-- 
2.31.1


