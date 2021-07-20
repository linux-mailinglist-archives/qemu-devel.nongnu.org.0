Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E387E3D05DE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:53:36 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zYN-0006Ht-Ss
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zPT-0004tJ-US
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:44:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zPR-00085z-I4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:44:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso480437wmj.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+lakEhYS4oxmf5efRPjQRugCOsER/QmZt+iu9N5l1M=;
 b=T2OG26Coe4kAlPQsnKm0EHNi/2k8BNvvdnPXWZPv5T5ANHjFUDTwttwF8T69wOQBx4
 u8P6SDshStLch9uPuDHORM26el8/QQFHgufzweMOb3YIgzD+JSr02YONGTjEtDHz11fB
 mQjtWAz8MOGwCOk2ivwmpNeygxxTRVxLvH+TQVKPYotv9PEZbqNzyssngv51vIWmj6Px
 TZ3+DXrQPArjOTl7q3mZaqlImoj1+3FMTlPFKmFmuRXxGShNV7wJVwuvx1VBzSDIe/UV
 lIeijZi2tr3CNxFLxw0OeNHAGIRgn+7H9pcTpo3Lo25OT/iczj8eF7oHCOKgXHI0+HIk
 vVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+lakEhYS4oxmf5efRPjQRugCOsER/QmZt+iu9N5l1M=;
 b=TBC87kvMSXDwT6JezTWnKSFkTkMPXpuZXLWRRqJ2OaeLfUHQoNlLvneVkkca28/Ry9
 TnArL+fsG5N7et+WJrRzq47Ul3kZ6QUexDpMzw47XrEP48spDq1viv72Qnnh8V5ZWuun
 yBIssKMEhfiik1ejueelNwxIdXj42a1oVjo5BLQcLRCuv45sV6rhmJf9f2C0+N+OJtxd
 REqIGg0lHZlDxW8Ch48+Rx+M2so6F5XexTlBRQihtpNUIgKziwxmT1r8opDw5QALIBiD
 EfC4hDOtnMGKEvZ2oXSWnJB9YXaU0+EmWrJ1pHYHGZl1ORwYw4fYBp0Ax9xAdmBKzdXf
 +eSg==
X-Gm-Message-State: AOAM530FH8zuXcxvDeVleMIRmxpLGV5xCQxwXYY875yEQFcem81FOOQk
 nr5Qgyry9x0ahrvVxfBTYNbwWw==
X-Google-Smtp-Source: ABdhPJwNMmweJy/rB+/XGP421i6xwD75MuIu1O95oP52s2vXoRuC9+diZRzEaJo0p605Y2VmV0oxqw==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr33828976wmb.39.1626824659674; 
 Tue, 20 Jul 2021 16:44:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm30953346wrt.0.2021.07.20.16.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:44:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B01A91FFA9;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 20/29] tcg/plugins: implement a qemu_plugin_user_exit helper
Date: Wed, 21 Jul 2021 00:26:54 +0100
Message-Id: <20210720232703.10650-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In user-mode emulation there is a small race between preexit_cleanup
and exit_group() which means we may end up calling instrumented
instructions before the kernel reaps child threads. To solve this we
implement a new helper which ensures the callbacks are flushed along
with any translations before we let the host do it's a thing.

While we are at it make the documentation of
qemu_plugin_register_atexit_cb clearer as to what the user can expect.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Acked-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210719123732.24457-1-alex.bennee@linaro.org>

---
v2
  - included qemu_plugin_disable_mem_helpers
---
 include/qemu/plugin.h      | 12 ++++++++++++
 include/qemu/qemu-plugin.h | 13 +++++++++++++
 bsd-user/syscall.c         |  6 +++---
 linux-user/exit.c          |  2 +-
 plugins/core.c             | 39 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 0fefbc6084..9a8438f683 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -190,6 +190,16 @@ void qemu_plugin_add_dyn_cb_arr(GArray *arr);
 
 void qemu_plugin_disable_mem_helpers(CPUState *cpu);
 
+/**
+ * qemu_plugin_user_exit(): clean-up callbacks before calling exit callbacks
+ *
+ * This is a user-mode only helper that ensure we have fully cleared
+ * callbacks from all threads before calling the exit callbacks. This
+ * is so the plugins themselves don't have to jump through hoops to
+ * guard against race conditions.
+ */
+void qemu_plugin_user_exit(void);
+
 #else /* !CONFIG_PLUGIN */
 
 static inline void qemu_plugin_add_opts(void)
@@ -250,6 +260,8 @@ void qemu_plugin_add_dyn_cb_arr(GArray *arr)
 static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
 { }
 
+static inline void qemu_plugin_user_exit(void)
+{ }
 #endif /* !CONFIG_PLUGIN */
 
 #endif /* QEMU_PLUGIN_H */
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index dc3496f36c..e6e815abc5 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -549,6 +549,19 @@ void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
 void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
                                    qemu_plugin_simple_cb_t cb);
 
+/**
+ * qemu_plugin_register_atexit_cb() - register exit callback
+ * @id: plugin ID
+ * @cb: callback
+ * @userdata: user data for callback
+ *
+ * The @cb function is called once execution has finished. Plugins
+ * should be able to free all their resources at this point much like
+ * after a reset/uninstall callback is called.
+ *
+ * In user-mode it is possible a few un-instrumented instructions from
+ * child threads may run before the host kernel reaps the threads.
+ */
 void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 7d986e9700..3f44311396 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -335,7 +335,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         _mcleanup();
 #endif
         gdb_exit(arg1);
-        qemu_plugin_atexit_cb();
+        qemu_plugin_user_exit();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
         ret = 0; /* avoid warning */
@@ -437,7 +437,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         _mcleanup();
 #endif
         gdb_exit(arg1);
-        qemu_plugin_atexit_cb();
+        qemu_plugin_user_exit();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
         ret = 0; /* avoid warning */
@@ -516,7 +516,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         _mcleanup();
 #endif
         gdb_exit(arg1);
-        qemu_plugin_atexit_cb();
+        qemu_plugin_user_exit();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
         ret = 0; /* avoid warning */
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 70b344048c..527e29cbc1 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -35,5 +35,5 @@ void preexit_cleanup(CPUArchState *env, int code)
         __gcov_dump();
 #endif
         gdb_exit(code);
-        qemu_plugin_atexit_cb();
+        qemu_plugin_user_exit();
 }
diff --git a/plugins/core.c b/plugins/core.c
index e1bcdb570d..7cf4f87e18 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -487,6 +487,45 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
     plugin_register_cb_udata(id, QEMU_PLUGIN_EV_ATEXIT, cb, udata);
 }
 
+/*
+ * Handle exit from linux-user. Unlike the normal atexit() mechanism
+ * we need to handle the clean-up manually as it's possible threads
+ * are still running. We need to remove all callbacks from code
+ * generation, flush the current translations and then we can safely
+ * trigger the exit callbacks.
+ */
+
+void qemu_plugin_user_exit(void)
+{
+    enum qemu_plugin_event ev;
+    CPUState *cpu;
+
+    QEMU_LOCK_GUARD(&plugin.lock);
+
+    start_exclusive();
+
+    /* un-register all callbacks except the final AT_EXIT one */
+    for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
+        if (ev != QEMU_PLUGIN_EV_ATEXIT) {
+            struct qemu_plugin_ctx *ctx;
+            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
+                plugin_unregister_cb__locked(ctx, ev);
+            }
+        }
+    }
+
+    tb_flush(current_cpu);
+
+    CPU_FOREACH(cpu) {
+        qemu_plugin_disable_mem_helpers(cpu);
+    }
+
+    end_exclusive();
+
+    /* now it's safe to handle the exit case */
+    qemu_plugin_atexit_cb();
+}
+
 /*
  * Call this function after longjmp'ing to the main loop. It's possible that the
  * last instruction of a TB might have used helpers, and therefore the
-- 
2.32.0.264.g75ae10bc75


