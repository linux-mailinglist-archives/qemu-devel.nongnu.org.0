Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D934A37F414
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:31:45 +0200 (CEST)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6ky-0008OS-Pr
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gO-0004tH-3A
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:00 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gL-0001I3-Sf
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:59 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A1E7D2078C;
 Thu, 13 May 2021 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvrcHh9XzS4qlzg/AmEQaekxCiFH/0RIgnKkpYYShlY=;
 b=OoZyJtKZ8b1cGzHYl/1Q0FFqOYLpuhC/9ECPgTeUsFEwIImw0OIaamZ1PGEDJaTRrrLu39
 1DLlh/hnZiNAkCyD7cboD4BuNp1SM36SjXkqbolIgi9oDf8f6gkF297l87yIvHny4b6nNp
 DWcnia8BdijM1IflNDkpE1FKkZ00nNo=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/9] rename MachineInitPhase enumeration constants
Date: Thu, 13 May 2021 10:25:43 +0200
Message-Id: <20210513082549.114275-4-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This renaming is a second phase in getting the code ready for
defining MachineInitPhase in qapi (enumeration constants are
going to be generated and prefixed with a name derived from
the enumeration type, i.e. MACHINE_INIT_PHASE_.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 include/hw/qdev-core.h | 10 +++++-----
 hw/core/machine.c      |  4 ++--
 hw/core/qdev.c         |  4 ++--
 softmmu/vl.c           | 20 ++++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5e3c6d4482..dc2f63478b 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -813,30 +813,30 @@ bool qdev_should_hide_device(QemuOpts *opts);
 
 typedef enum MachineInitPhase {
     /* current_machine is NULL.  */
-    PHASE_NO_MACHINE,
+    MACHINE_INIT_PHASE_NO_MACHINE,
 
     /* current_machine is not NULL, but current_machine->accel is NULL.  */
-    PHASE_MACHINE_CREATED,
+    MACHINE_INIT_PHASE_MACHINE_CREATED,
 
     /*
      * current_machine->accel is not NULL, but the machine properties have
      * not been validated and machine_class->init has not yet been called.
      */
-    PHASE_ACCEL_CREATED,
+    MACHINE_INIT_PHASE_ACCEL_CREATED,
 
     /*
      * machine_class->init has been called, thus creating any embedded
      * devices and validating machine properties.  Devices created at
      * this time are considered to be cold-plugged.
      */
-    PHASE_MACHINE_INITIALIZED,
+    MACHINE_INIT_PHASE_INITIALIZED,
 
     /*
      * QEMU is ready to start CPUs and devices created at this time
      * are considered to be hot-plugged.  The monitor is not restricted
      * to "preconfig" commands.
      */
-    PHASE_MACHINE_READY,
+    MACHINE_INIT_PHASE_READY,
 } MachineInitPhase;
 
 extern bool phase_check(MachineInitPhase phase);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index eba046924d..16ce88407c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1230,7 +1230,7 @@ void machine_run_board_init(MachineState *machine)
     }
 
     machine_class->init(machine);
-    phase_advance(PHASE_MACHINE_INITIALIZED);
+    phase_advance(MACHINE_INIT_PHASE_INITIALIZED);
 }
 
 static NotifierList machine_init_done_notifiers =
@@ -1262,7 +1262,7 @@ void qdev_machine_creation_done(void)
      * ok, initial machine setup is done, starting from now we can
      * only create hotpluggable devices
      */
-    phase_advance(PHASE_MACHINE_READY);
+    phase_advance(MACHINE_INIT_PHASE_READY);
     qdev_assert_realized_properly();
 
     /* TODO: once all bus devices are qdevified, this should be done
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 71906170f9..350f2acf74 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1157,12 +1157,12 @@ MachineInitPhase phase_get(void)
 
 bool machine_is_initialized(void)
 {
-    return machine_phase >= PHASE_MACHINE_INITIALIZED;
+    return machine_phase >= MACHINE_INIT_PHASE_INITIALIZED;
 }
 
 bool machine_is_ready(void)
 {
-    return machine_phase >= PHASE_MACHINE_READY;
+    return machine_phase >= MACHINE_INIT_PHASE_READY;
 }
 
 static const TypeInfo device_type_info = {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3af9743ceb..88f504aff9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2510,7 +2510,7 @@ static void qemu_init_board(void)
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
-    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
+    /* From here on we enter MACHINE_INIT_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine);
 
     drive_check_orphaned();
@@ -2582,7 +2582,7 @@ static void qemu_machine_enter_phase(MachineInitPhase target_phase,
                                      Error **errp)
 {
     /* target phases before initialization are not handled here */
-    if (target_phase < PHASE_MACHINE_INITIALIZED) {
+    if (target_phase < MACHINE_INIT_PHASE_INITIALIZED) {
         error_setg(errp, "Target machine phase too early to enter this way");
         return;
     }
@@ -2597,14 +2597,14 @@ static void qemu_machine_enter_phase(MachineInitPhase target_phase,
      * if machine has not yet passed 'initialized' phase and according to the
      * target_phase it should
      */
-    if (target_phase >= PHASE_MACHINE_INITIALIZED &&
-        phase_get() < PHASE_MACHINE_INITIALIZED) {
+    if (target_phase >= MACHINE_INIT_PHASE_INITIALIZED &&
+        phase_get() < MACHINE_INIT_PHASE_INITIALIZED) {
         qemu_init_board();
         qemu_create_cli_devices();
     }
 
-    if (target_phase >= PHASE_MACHINE_READY &&
-        phase_get() < PHASE_MACHINE_READY) {
+    if (target_phase >= MACHINE_INIT_PHASE_READY &&
+        phase_get() < MACHINE_INIT_PHASE_READY) {
         qemu_machine_creation_done();
 
         if (loadvm) {
@@ -2641,7 +2641,7 @@ void qmp_x_exit_preconfig(Error **errp)
         return;
     }
 
-    qemu_machine_enter_phase(PHASE_MACHINE_READY, errp);
+    qemu_machine_enter_phase(MACHINE_INIT_PHASE_READY, errp);
 }
 
 void qemu_init(int argc, char **argv, char **envp)
@@ -3580,14 +3580,14 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_create_early_backends();
 
     qemu_apply_machine_options();
-    phase_advance(PHASE_MACHINE_CREATED);
+    phase_advance(MACHINE_INIT_PHASE_MACHINE_CREATED);
 
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
      * after machine_set_property().
      */
     configure_accelerators(argv[0]);
-    phase_advance(PHASE_ACCEL_CREATED);
+    phase_advance(MACHINE_INIT_PHASE_ACCEL_CREATED);
 
     /*
      * Beware, QOM objects created before this point miss global and
@@ -3637,7 +3637,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (!preconfig_requested) {
-        qemu_machine_enter_phase(PHASE_MACHINE_READY, &error_fatal);
+        qemu_machine_enter_phase(MACHINE_INIT_PHASE_READY, &error_fatal);
     }
     qemu_init_displays();
     accel_setup_post(current_machine);
-- 
2.25.1


