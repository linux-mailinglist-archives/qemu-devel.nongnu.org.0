Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA6416FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:59:19 +0200 (CEST)
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThzC-0006EV-6S
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgU-0004Ma-HB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgS-0006i0-Tq
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i24so9562385wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BYMbs0TcChkwFeeNZ8rPK4jjNXuJ+c6QHnkutAyXs4=;
 b=piuXccYlN3pEG3QB6KUJxZROq8gtYy7hkcwhGJTm/x2GBBhHfBeMIyKJ4LHCbVCO35
 S3VVWTh66mDq7BepwM4Tzu8xVWntL38jfkgKRK3zdUkfnoGp12fv25h6TYw7GVRChCI0
 lIz6RgT6x6AxQHYBY3gRv5fV5euyNBg6nUUDp78XLnzOsvabKwg1PD+aYu6ZPJ7ZVFZA
 pdY2WfRKp2HeQMI3X8K03SCJRqlFVRCAKKFWnSj1TrqR27fZYOP+GEBMS89ISRxTCq0i
 gsncAXuB/0Pv/6tTPEqpHv+ZIuII6RZrjIj7GyNqM3JjJzzXu1y/J6ghibdd7l+ikGrX
 RIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0BYMbs0TcChkwFeeNZ8rPK4jjNXuJ+c6QHnkutAyXs4=;
 b=NXto56xva/pT9Y/7L85L7a38NnGVdNC2ARobB8yKwRYMWCdx9rjBXvkvvYQi8sF5Ak
 WBje1mMG9rvlkfSRapLDcrxzEGPvDt6Hp8LuKY6V+djST8cg6L/6QE2dCNvXKL5ezmW/
 802GtKarNZ007lXMcBAfVw1wVau5bpaL3UVJcf3uUqVO0GZGZbYPp52l7qkFSVYnzfJj
 FEIdEagNDQQnGVaKnEKqG1HA6j5rx1ZFhaL3ik8MqdLESFE3Ufv+KhcDqxee/TRKvvWH
 o88mLnzD+R8zoL/aguzLMmEF9zGFwHQurRXUF4ypjTlzaZJYH0Nb9hkio/XzveUF4S9I
 kJLA==
X-Gm-Message-State: AOAM532zuTfmU97TqnPIQCG4sAH5xvLd+QvNHTp0zFzQXbKQFDl/YFmv
 lNuihT7q06325EjZl+8H70UzaSIHbc8=
X-Google-Smtp-Source: ABdhPJzxEbLjNXVAhVczmkZLoaNcSxiI1KyrqlrNQ4c9XeN7cFaT/3PSW+YZkjGxd5XD2IVVFvohXA==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr1075873wmc.15.1632476395366; 
 Fri, 24 Sep 2021 02:39:55 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y8sm7518713wrh.44.2021.09.24.02.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/40] accel/tcg: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:21 +0200
Message-Id: <20210924093847.1014331-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All accelerators but TCG implement their AccelOpsClass::has_work()
handler, meaning all the remaining CPUClass::has_work() ones are
only reachable from TCG accelerator; and these has_work() handlers
belong to TCGCPUOps.

We will gradually move each target CPUClass::has_work() to
TCGCPUOps in the following commits.
For now, move the CPUClass::has_work() call to tcg_cpu_has_work(),
the TCG AccelOpsClass::has_work() implementation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h     |  2 +-
 accel/tcg/tcg-accel-ops.c | 11 +++++++++++
 softmmu/cpus.c            |  5 -----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e2dd171a13f..114eb3b9b2c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,7 +89,7 @@ struct SysemuCPUOps;
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do.
+ * @has_work: Callback for checking if there is work to do. Only used by TCG.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd6..ebaacff1842 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -73,6 +73,16 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static bool tcg_cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->has_work) {
+        return cc->has_work(cpu);
+    }
+    return false;
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -108,6 +118,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     }
+    ops->has_work = tcg_cpu_has_work;
 }
 
 static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 5ffa02f9cef..bb16a25bcef 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,11 +251,6 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->has_work && cc->has_work(cpu)) {
-        return true;
-    }
     if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
         return true;
     }
-- 
2.31.1


