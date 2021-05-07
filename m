Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF30376557
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:40:46 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezmf-0000uz-KH
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbR-0000Yc-5N
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:09 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbJ-0001Rk-Us
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:08 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDrHY096765;
 Fri, 7 May 2021 12:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=vPLd8S54CCxMgCD/tybBxsEQ40b5Zj0zwHpYhrCodZw=;
 b=Eo2fuxMV+SugG7dVau5smdYZDc2g6x6AEKfDbFCcI4ST8AvTM3oB9t50SLJCsp77XfDI
 Oiv6c/Wo80+icw/peUlgsLcpToEmCKbis/8XHRV6PbCVE73cXvJPogNEX5Jh1ESlOR/H
 pMNjjv6ovQXpspMmPD6sAMS4B0VyyxKKxuqjaNUmY0+gJrzHj2DfLCk6JEOQKrsm9fX5
 Wz9ZH1tWBo4nofA1mxttA+6nTCeXXJBEzJeHGdVjZ13rEAsH6rp6iLvz1L0bfU8ecYYd
 FtEa7NM2JjaU3iRQ0gcwUpqI93ICK6eDqixc2EocZLtgs42yUWBAdeqagISr7imtbk6x wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38ctd89d18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGQuT173796;
 Fri, 7 May 2021 12:28:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb64f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:56 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSuxo027831;
 Fri, 7 May 2021 12:28:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 38csrtb63q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:56 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CStoK017188;
 Fri, 7 May 2021 12:28:55 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:54 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 07/22] cpr
Date: Fri,  7 May 2021 05:25:05 -0700
Message-Id: <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: e-0RGO8T30iYdqvp6ks5fDLJVEPNdg8O
X-Proofpoint-ORIG-GUID: e-0RGO8T30iYdqvp6ks5fDLJVEPNdg8O
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave and cprload functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
/usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
paused state and waits for the cprload command.

To use the restart mode, qemu must be started with the memfd-alloc machine
option.  The memfd's are saved to the environment and kept open across exec,
after which they are found from the environment and re-mmap'd.  Hence guest
ram is preserved in place, albeit with new virtual addresses in the qemu
process.  The caller resumes the guest by calling cprload, which loads
state from the file.  If the VM was running at cprsave time, then VM
execution resumes.  cprsave supports any type of guest image and block
device, but the caller must not modify guest block devices between cprsave
and cprload.

For the reboot mode, cprsave saves state and exits qemu, and the caller is
allowed to update the host kernel and system software and reboot.  The
caller resumes the guest by running qemu with the same arguments as the
original process and calling cprload.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0 or /dev/shm
PKRAM.

The reboot mode supports vfio devices if the caller suspends the guest
instead of stopping the VM, such as by issuing guest-suspend-ram to the
qemu guest agent.  The guest drivers' suspend methods flush outstanding
requests and re-initialize the devices, and thus there is no device state
to save and restore.

The restart mode supports vfio devices in a subsequent patch.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/cpr.h   |  17 +++++
 include/sysemu/runstate.h |   1 +
 migration/cpr.c           | 188 ++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build     |   1 +
 migration/savevm.h        |   2 +
 softmmu/physmem.c         |   6 +-
 softmmu/runstate.c        |  21 +++++-
 softmmu/vl.c              |   6 ++
 8 files changed, 240 insertions(+), 2 deletions(-)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c

diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..42dec4e
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_H
+#define MIGRATION_CPR_H
+
+#include "qapi/qapi-types-cpr.h"
+
+bool cpr_active(void);
+void cprsave(const char *file, CprMode mode, Error **errp);
+void cprload(const char *file, Error **errp);
+
+#endif
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index 50c84af..d69dc2d 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
 void qemu_system_suspend_request(void);
 void qemu_register_suspend_notifier(Notifier *notifier);
 bool qemu_wakeup_suspend_enabled(void);
+void qemu_system_start_on_wake_request(void);
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..e0da1cf
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,188 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "migration.h"
+#include "migration/snapshot.h"
+#include "chardev/char.h"
+#include "migration/misc.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
+#include "io/channel-buffer.h"
+#include "io/channel-file.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/replay.h"
+#include "sysemu/xen.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/virtio/vhost.h"
+#include "qemu/env.h"
+
+static int cpr_is_active;
+
+bool cpr_active(void)
+{
+    return cpr_is_active;
+}
+
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                              const char *name, Error **errp)
+{
+    QIOChannelFile *fioc;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
+        return 0;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return 0;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    object_unref(OBJECT(fioc));
+    return f;
+}
+
+static int preserve_fd(const char *name, const char *val, void *handle)
+{
+    qemu_clr_cloexec(atoi(val));
+    return 0;
+}
+
+void cprsave(const char *file, CprMode mode, Error **errp)
+{
+    int ret = 0;
+    QEMUFile *f;
+    int saved_vm_running = runstate_is_running();
+    bool restart = (mode == CPR_MODE_RESTART);
+    bool reboot = (mode == CPR_MODE_REBOOT);
+
+    if (reboot && qemu_ram_volatile(errp)) {
+        return;
+    }
+
+    if (restart && xen_enabled()) {
+        error_setg(errp, "xen does not support cprsave restart");
+        return;
+    }
+
+    if (migrate_colo_enabled()) {
+        error_setg(errp, "error: cprsave does not support x-colo");
+        return;
+    }
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        error_setg(errp, "error: cprsave does not support replay");
+        return;
+    }
+
+    f = qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, "cprsave", errp);
+    if (!f) {
+        return;
+    }
+
+    ret = global_state_store();
+    if (ret) {
+        error_setg(errp, "Error saving global state");
+        qemu_fclose(f);
+        return;
+    }
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    cpr_is_active = true;
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, QERR_IO_ERROR);
+        goto err;
+    }
+
+    if (ret < 0) {
+        if (!*errp) {
+            error_setg(errp, "Error %d while saving VM state", ret);
+        }
+        goto err;
+    }
+
+    if (reboot) {
+        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    } else if (restart) {
+        walkenv(FD_PREFIX, preserve_fd, 0);
+        setenv("QEMU_START_FREEZE", "", 1);
+        qemu_system_exec_request();
+    }
+    goto done;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+done:
+    cpr_is_active = false;
+    return;
+}
+
+void cprload(const char *file, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cprload called for a running VM");
+        return;
+    }
+
+    f = qf_file_open(file, O_RDONLY, 0, "cprload", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "error: %s is not a vmstate file", file);
+        return;
+    }
+
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        return;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            qemu_system_start_on_wake_request();
+        }
+    }
+}
diff --git a/migration/meson.build b/migration/meson.build
index 3ecedce..c756374 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel.c',
   'colo-failover.c',
   'colo.c',
+  'cpr.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342..ce5d710 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                       const char *name, Error **errp);
 
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 695aa10..b79f408 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -68,6 +68,7 @@
 #include "qemu/pmem.h"
 
 #include "qemu/memfd.h"
+#include "qemu/env.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1957,7 +1958,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
         } else {
             name = memory_region_name(new_block->mr);
             if (ms->memfd_alloc) {
-                int mfd = -1;          /* placeholder until next patch */
+                int mfd = getenv_fd(name);
                 mr->align = QEMU_VMALLOC_ALIGN;
                 if (mfd < 0) {
                     mfd = qemu_memfd_create(name, maxlen + mr->align,
@@ -1965,7 +1966,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                     if (mfd < 0) {
                         return;
                     }
+                    setenv_fd(name, mfd);
                 }
+                qemu_clr_cloexec(mfd);
                 new_block->flags |= RAM_SHARED;
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
@@ -2214,6 +2217,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    unsetenv_fd(memory_region_name(block->mr));
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index bea7513..07952cc 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
     { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
 
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
@@ -334,6 +336,7 @@ void vm_state_notify(bool running, RunState state)
     }
 }
 
+static bool start_on_wake_requested;
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
@@ -567,6 +570,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
     notifier_list_add(&suspend_notifiers, notifier);
 }
 
+void qemu_system_start_on_wake_request(void)
+{
+    start_on_wake_requested = true;
+}
+
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
 {
     trace_system_wakeup_request(reason);
@@ -579,7 +587,18 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
     if (!(wakeup_reason_mask & (1 << reason))) {
         return;
     }
-    runstate_set(RUN_STATE_RUNNING);
+
+    /*
+     * Must call vm_start if it has never been called, to invoke the state
+     * change callbacks for the first time.
+     */
+    if (start_on_wake_requested) {
+        start_on_wake_requested = false;
+        vm_start();
+    } else {
+        runstate_set(RUN_STATE_RUNNING);
+    }
+
     wakeup_reason = reason;
     qemu_notify_event();
 }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 04ab752..4654693 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3510,6 +3510,12 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     loc_set_none();
 
+    /* Equivalent to -S, but no need for parent to modify argv. */
+    if (getenv("QEMU_START_FREEZE")) {
+        unsetenv("QEMU_START_FREEZE");
+        autostart = 0;
+    }
+
     qemu_validate_options();
     qemu_process_sugar_options();
 
-- 
1.8.3.1


