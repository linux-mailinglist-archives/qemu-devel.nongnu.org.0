Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E22F194880
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:15:17 +0100 (CET)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYuK-0004SB-I2
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYLR-0000Sw-2y
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:39:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYLP-0002Es-V2
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:39:12 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41685)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYLP-0002El-RC
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:39:11 -0400
Received: by mail-qk1-x742.google.com with SMTP id q188so8167815qke.8
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hXS64xfFQVpKibsj9LpVhJbK9gFfN+Viw10h78ZF2Vg=;
 b=E9zgmuKxYSK0VF+OHcKpZMN5Quqt4ZtwwOOyy+HnVdwmgxWDlDjrwjYSwgnOO8bvwq
 LyILHWqzwhVFkJGJNru3QIuWDvrvSaw1jEzhI/w6/SGfNUa1TNbeMMQk2CHlWe6qBE8o
 otaIjLoKoqZbyhN9MXtKwfckI817FkMl9UVyYvGb67QL7udL+fKpbxeC5rN61HFAPGV9
 vTv+dnIfBBQtNp4XobXLlNzkar+MBo8C/yW6Pt5cl8nVnohC2xE/Qkp52qBNrihpgmjO
 sadr+T6BhVJot1p/pu9kcERYtfsq+K8UTjYEc6XRvfIM+Rt+Ux5ydzt3w5vnkUDlMlnG
 iBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hXS64xfFQVpKibsj9LpVhJbK9gFfN+Viw10h78ZF2Vg=;
 b=A0QicGhx8v/lnc53JP/BwEzUKXIoFXL2MbMZCv1LM0QXxRZRidhhuRjluaXcnuGMcs
 SWfLPXT8CNT0VEf/QYbxLEcVAb8ndtv+JDAEZyj1RjefujzXrU62DDzHoF8a7puc4FAs
 h5gNPbzaHx1pAnR7OiI6TmUSmYmEgMQgWnYocV4/t+dSlDAD9lwvfeQNTHYagg83ylch
 NMPSqiysDpWGdill8SBZTDQD32Kgr0IgGuVbC24md+QYVdNz9lBTxpDjBqSnE7C/AxFZ
 D9CPfDO3qwo1vlsB2qGEcDugYkuNg5TJoMiYRxQr9kHEpf60J2CccnaHaOIyuatanUYm
 0JSg==
X-Gm-Message-State: ANhLgQ1oKS1KW08TFekGBIToUH7MMDo24663eDoJno5mMN1XQRCgh1vS
 2LE7tC3EACuKYilECznb9q+oM7AIO2Y77g==
X-Google-Smtp-Source: ADFU+vvMFRDxCqugl08snGGIMuHg1kr1vyHpfx1oOkGbe9V5K7mz8aAJnH2A6i5TxrqnxCFf7KLcDw==
X-Received: by 2002:a37:410:: with SMTP id 16mr9858852qke.485.1585251551100;
 Thu, 26 Mar 2020 12:39:11 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:39:10 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 70/74] cpu: rename all_cpu_threads_idle to
 qemu_tcg_rr_all_cpu_threads_idle
Date: Thu, 26 Mar 2020 15:31:52 -0400
Message-Id: <20200326193156.4322-71-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: richard.henderson@linaro.org, "Emilio G. Cota" <cota@braap.org>,
 alex.bennee@linaro.org, robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This function is only called from TCG rr mode, so add
a prefix to mark this as well as an assertion.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 cpus.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/cpus.c b/cpus.c
index 50ced4369f..05de56bd53 100644
--- a/cpus.c
+++ b/cpus.c
@@ -232,10 +232,12 @@ static bool cpu_thread_is_idle(CPUState *cpu)
     return true;
 }
 
-static bool all_cpu_threads_idle(void)
+static bool qemu_tcg_rr_all_cpu_threads_idle(void)
 {
     CPUState *cpu;
 
+    g_assert(qemu_is_tcg_rr());
+
     CPU_FOREACH(cpu) {
         if (!cpu_thread_is_idle(cpu)) {
             return false;
@@ -643,7 +645,7 @@ void qemu_start_warp_timer(void)
     }
 
     if (replay_mode != REPLAY_MODE_PLAY) {
-        if (!all_cpu_threads_idle()) {
+        if (!qemu_tcg_rr_all_cpu_threads_idle()) {
             return;
         }
 
@@ -1295,7 +1297,7 @@ static void qemu_tcg_rr_wait_io_event(void)
 {
     CPUState *cpu;
 
-    while (all_cpu_threads_idle()) {
+    while (qemu_tcg_rr_all_cpu_threads_idle()) {
         stop_tcg_kick_timer();
         qemu_cond_wait(first_cpu->halt_cond, &qemu_global_mutex);
     }
@@ -1651,7 +1653,7 @@ static void *qemu_tcg_rr_cpu_thread_fn(void *arg)
             atomic_mb_set(&cpu->exit_request, 0);
         }
 
-        if (use_icount && all_cpu_threads_idle()) {
+        if (use_icount && qemu_tcg_rr_all_cpu_threads_idle()) {
             /*
              * When all cpus are sleeping (e.g in WFI), to avoid a deadlock
              * in the main_loop, wake it up in order to start the warp timer.
-- 
2.17.1


