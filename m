Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24023D3E3D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:11:15 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yhe-00062t-QI
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybr-0002Vm-3t
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybp-0005uw-Ba
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y8so3050719wrt.10
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s69863l+rWiDp6mDSn3ApZU/tImeUHpGRfgaMe+i8/A=;
 b=LKFLa8WbOWQoaIfHMMrepR1LYHfYslOyuftmybS6WbDOmApNueF8zdAQkMjLiXoEsf
 pdwQ9+Zoh/dGBhtHhPDpUJvmLs7EDDf2K+J6uRnZ3PmFASsw9F190B6DOExi5S6XNJ5f
 bojt03GjMOfiFFB7fk6jlHMeF3zpCC7uBYMA6s4he7rCtUnhY6l0jLRKtCkI9vlDP79o
 YfoxlXN9RAhsqO1u9vZZymU7eHpoRgkz+XkkGYFDKa7nBl6IpTRjXxZ8phV5LDWS257K
 xJ7MOn75Ky9oBXw2oRHdNXEHVU6msgPwSXtZzfX9Av+i/yF+2vxczuKHgxuCbOayd0Xy
 yzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s69863l+rWiDp6mDSn3ApZU/tImeUHpGRfgaMe+i8/A=;
 b=VTIGd7CBEsXZectqJRqISTRuF10FRiqjxEzRrtYa6K04s6q0t9EknGPhmp9yvfDDBL
 3sE0IQlOisTpRgTfTPudd52EYadzy2lSKzNd91pc4barU7/mOo8ySGkdmHT2jsJEdz2F
 HAwifCwmJf3E+u4EcfGP481nR6V6s14FRzHepXQXKfSoQEFOvgOo1DtluPfG09iTzOhO
 kW9JRFatpLTVDA29BcLMgVGTQthkTxieUOFlzDADGotXpxXvUihPiL++uaBYXTJPg0zx
 Rjg6d6rhuSuCUYsh4s4qYknrrhnMtFoMbhC3e9cULhtHwcIbGpqDK7ykwgvgEvC/RGV/
 /VYw==
X-Gm-Message-State: AOAM533vjw7psDmzi7Ra+ZeCkR3hJimb+RpZ4EkeaOCRaGPmyLukjMmr
 hLlhnUTe+3IEPoIs0cWE1t+87g==
X-Google-Smtp-Source: ABdhPJxQEAvaszVI9oEUL2oHxNBQku6fL5Sq35KOswumWNzgZ32A4S3OwidfJ48LJsRfbzB2wwafkQ==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr6383926wrt.46.1627059912167; 
 Fri, 23 Jul 2021 10:05:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a8sm33471312wrt.61.2021.07.23.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13C231FFAA;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/28] tcg/plugins: implement a qemu_plugin_user_exit helper
Date: Fri, 23 Jul 2021 18:03:46 +0100
Message-Id: <20210723170354.18975-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
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
Message-Id: <20210720232703.10650-21-alex.bennee@linaro.org>

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
index 474db287cb..6b2490f973 100644
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
2.20.1


