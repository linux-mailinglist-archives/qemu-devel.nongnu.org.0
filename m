Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C6028C5C2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 02:32:08 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS8EZ-0001bm-By
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 20:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kS8B9-00088q-Ni
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 20:28:35 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:32910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kS8B6-0004n0-3V
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 20:28:35 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b19so9682087pld.0
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 17:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=njq8LwCRNcFNSShSa2dCop+cPHvQa+V3OA16N3iGgms=;
 b=a98uxeOg91xO3hS0pMf1yGSSx/ZSTOUOB20C5DhhPwAdxcIIyybtYfQlafb6J/SjwX
 RrYM9g316fH7rEcpgzoJF6H0RzBrKXHmlCy7OQoDxkmp9ksjCwQ0k5c1N2ycDy0IaWs3
 srZ+jzyFXtdf1Bp2Vg2KJjd77vEBX+PSAv2iFion9T3c0RElZcJpgKFtw9BnnVnJg/pc
 ondVvasty4WfC5nBbQE+8M4n9u899XdG/gHjPaulkaHP27F2MkeQmBUXWD6i4P5gpw0Q
 w/0yezFy0GNcD7C3aTV1oKoVWlWAI7q8uMSVwoL+UBoQvxrPY9GxyehrwBWpbsBM0CZB
 4YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njq8LwCRNcFNSShSa2dCop+cPHvQa+V3OA16N3iGgms=;
 b=I1JHbKaHl8EXTNWPmUa6nj5WJVxxHQm9hnk+kWSZo0XoKYkdIHwfBCioFqi69BHgQq
 CYSTgE4Ux7vtHA8a1zNMhPPYf5LZSMoOWPnX9EsbfiTXpcWvLfDPejWQj3Fi1xoLBE5C
 IqPIAaNhtKznrbsLum3JtKCAV1iDEzMoMHSqzXaUCo6Wr6wDNEcZWAe1ecM19cPDC8At
 V4OUXp3Y/Zbp0+KiogjvrbZ/l5Beu6UERoR7bLZIWO7bbFybP+ffVwwLhoScclDos1jO
 vhYeNVpJ5t290tCqyZVXj7oymh+UfUfOAXpZ3vjZsIK8piXV/LVhDt4LRP9gZ39PPM+Z
 /Gyg==
X-Gm-Message-State: AOAM533bfOUiAvHVMR2kEpVSC6dtfl/4xCIBmKb/hLdcpTIN77jX824p
 8qAaf9Xt5nQw6GIADwcfzDU2DNdQgsiNKg==
X-Google-Smtp-Source: ABdhPJydNAB9G+qbBJYRlrWWCRK5B7AtyOyZJKizm4HaJJPcJ+g82vQt51QjaL0D1OGdzTNVFMulhw==
X-Received: by 2002:a17:902:fe86:b029:d4:d451:eb56 with SMTP id
 x6-20020a170902fe86b02900d4d451eb56mr9774423plm.79.1602548909794; 
 Mon, 12 Oct 2020 17:28:29 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y5sm22565925pge.62.2020.10.12.17.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 17:28:28 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/5] plugins: Getting qemu-plugin works under win32.
Date: Tue, 13 Oct 2020 08:28:04 +0800
Message-Id: <20201013002806.1447-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201013002806.1447-1-luoyonggang@gmail.com>
References: <20201013002806.1447-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define QEMU_PLUGIN_API_IMPLEMENTATION in api.c and core.c
We removed the need of .symbols file, so is the
configure script, if we one expose a function to qemu-plugin
just need prefix the function with QEMU_PLUGIN_EXPORT

We use QEMU_PLUGIN_EXPORT export the functions in api.c and core.c
and loading it in qemu_plugin_initialize, so we need a list of function pointer
deceleration such as
QEMU_PLUGIN_EXTERN qemu_plugin_uninstall_t qemu_plugin_uninstall;

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 Makefile                     |   1 -
 configure                    |  71 -------------
 include/qemu/qemu-plugin.h   | 198 +++++++++++++++++++++++++++--------
 meson.build                  |   6 +-
 plugins/api.c                | 105 +++++++++++--------
 plugins/core.c               |  15 ++-
 plugins/loader.c             |  50 ++++++++-
 plugins/meson.build          |  10 +-
 plugins/plugin.h             |   1 +
 plugins/qemu-plugins.symbols |  40 -------
 10 files changed, 277 insertions(+), 220 deletions(-)
 delete mode 100644 plugins/qemu-plugins.symbols

diff --git a/Makefile b/Makefile
index c37e513431..cd6079bb78 100644
--- a/Makefile
+++ b/Makefile
@@ -105,7 +105,6 @@ config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
 
 # Force configure to re-run if the API symbols are updated
 ifeq ($(CONFIG_PLUGIN),y)
-config-host.mak: $(SRC_PATH)/plugins/qemu-plugins.symbols
 
 .PHONY: plugins
 plugins:
diff --git a/configure b/configure
index 0829b7d3b4..f26212813e 100755
--- a/configure
+++ b/configure
@@ -5201,61 +5201,6 @@ if compile_prog "" "" ; then
   atomic64=yes
 fi
 
-#########################################
-# See if --dynamic-list is supported by the linker
-ld_dynamic_list="no"
-if test "$static" = "no" ; then
-    cat > $TMPTXT <<EOF
-{
-  foo;
-};
-EOF
-
-    cat > $TMPC <<EOF
-#include <stdio.h>
-void foo(void);
-
-void foo(void)
-{
-  printf("foo\n");
-}
-
-int main(void)
-{
-  foo();
-  return 0;
-}
-EOF
-
-    if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
-        ld_dynamic_list="yes"
-    fi
-fi
-
-#########################################
-# See if -exported_symbols_list is supported by the linker
-
-ld_exported_symbols_list="no"
-if test "$static" = "no" ; then
-    cat > $TMPTXT <<EOF
-  _foo
-EOF
-
-    if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
-        ld_exported_symbols_list="yes"
-    fi
-fi
-
-if  test "$plugins" = "yes" &&
-    test "$ld_dynamic_list" = "no" &&
-    test "$ld_exported_symbols_list" = "no" ; then
-  error_exit \
-      "Plugin support requires dynamic linking and specifying a set of symbols " \
-      "that are exported to plugins. Unfortunately your linker doesn't " \
-      "support the flag (--dynamic-list or -exported_symbols_list) used " \
-      "for this purpose. You can't build with --static."
-fi
-
 ########################################
 # See if __attribute__((alias)) is supported.
 # This false for Xcode 9, but has been remedied for Xcode 10.
@@ -6745,22 +6690,6 @@ fi
 
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
-    # Copy the export object list to the build dir
-    if test "$ld_dynamic_list" = "yes" ; then
-	echo "CONFIG_HAS_LD_DYNAMIC_LIST=yes" >> $config_host_mak
-	ld_symbols=qemu-plugins-ld.symbols
-	cp "$source_path/plugins/qemu-plugins.symbols" $ld_symbols
-    elif test "$ld_exported_symbols_list" = "yes" ; then
-	echo "CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST=yes" >> $config_host_mak
-	ld64_symbols=qemu-plugins-ld64.symbols
-	echo "# Automatically generated by configure - do not modify" > $ld64_symbols
-	grep 'qemu_' "$source_path/plugins/qemu-plugins.symbols" | sed 's/;//g' | \
-	    sed -E 's/^[[:space:]]*(.*)/_\1/' >> $ld64_symbols
-    else
-	error_exit \
-	    "If \$plugins=yes, either \$ld_dynamic_list or " \
-	    "\$ld_exported_symbols_list should have been set to 'yes'."
-    fi
 fi
 
 if test -n "$gdb_bin" ; then
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index daac8291b8..af2f6ccb78 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -21,11 +21,7 @@
  *   https://gcc.gnu.org/wiki/Visibility
  */
 #if defined _WIN32 || defined __CYGWIN__
-  #ifdef BUILDING_DLL
-    #define QEMU_PLUGIN_EXPORT __declspec(dllexport)
-  #else
-    #define QEMU_PLUGIN_EXPORT __declspec(dllimport)
-  #endif
+  #define QEMU_PLUGIN_EXPORT __declspec(dllexport)
   #define QEMU_PLUGIN_LOCAL
 #else
   #if __GNUC__ >= 4
@@ -52,7 +48,9 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 0
+#define QEMU_PLUGIN_VERSION 1
+
+typedef void *(*qemu_plugin_global_dlsym_t)(void *context, const char *name);
 
 typedef struct {
     /* string describing architecture */
@@ -73,8 +71,23 @@ typedef struct {
             int max_vcpus;
         } system;
     };
+    void *context;
+    qemu_plugin_global_dlsym_t dlsym;
 } qemu_info_t;
 
+/**
+ * qemu_plugin_initialize() - Initialize a plugin before install
+ * @info: a block describing some details about the guest
+ *
+ * All plugins must export this symbol, and in most case using qemu-plugin.h
+ * provided implementation directly.
+ * For plugin provide this function, the QEMU_PLUGIN_VERSION should >= 1
+ *
+ * Note: This function only used to loading qemu's exported functions, nothing
+ * else should doding in this function.
+ */
+QEMU_PLUGIN_EXPORT int qemu_plugin_initialize(const qemu_info_t *info);
+
 /**
  * qemu_plugin_install() - Install a plugin
  * @id: this plugin's opaque ID
@@ -121,7 +134,7 @@ typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
  *
  * Note: Calling this function from qemu_plugin_install() is a bug.
  */
-void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
+typedef void (*qemu_plugin_uninstall_t)(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
 
 /**
  * qemu_plugin_reset() - Reset a plugin
@@ -134,7 +147,7 @@ void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
  * Plugins are reset asynchronously, and therefore the given plugin receives
  * callbacks until @cb is called.
  */
-void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
+typedef void (*qemu_plugin_reset_t)(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
 
 /**
  * qemu_plugin_register_vcpu_init_cb() - register a vCPU initialization callback
@@ -145,7 +158,7 @@ void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
  *
  * See also: qemu_plugin_register_vcpu_exit_cb()
  */
-void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_vcpu_init_cb_t)(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb);
 
 /**
@@ -157,7 +170,7 @@ void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
  *
  * See also: qemu_plugin_register_vcpu_init_cb()
  */
-void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_vcpu_exit_cb_t)(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb);
 
 /**
@@ -167,7 +180,7 @@ void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
  *
  * The @cb function is called every time a vCPU idles.
  */
-void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_vcpu_idle_cb_t)(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb);
 
 /**
@@ -177,7 +190,7 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
  *
  * The @cb function is called every time a vCPU resumes execution.
  */
-void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_vcpu_resume_cb_t)(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_simple_cb_t cb);
 
 /*
@@ -214,7 +227,7 @@ enum qemu_plugin_mem_rw {
 typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
                                                struct qemu_plugin_tb *tb);
 
-void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
                                            qemu_plugin_vcpu_tb_trans_cb_t cb);
 
 /**
@@ -226,7 +239,7 @@ void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
  *
  * The @cb function is called every time a translated unit executes.
  */
-void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
+typedef void (*qemu_plugin_register_vcpu_tb_exec_cb_t)(struct qemu_plugin_tb *tb,
                                           qemu_plugin_vcpu_udata_cb_t cb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *userdata);
@@ -246,7 +259,7 @@ enum qemu_plugin_op {
  * Useful if you just want to increment a single counter somewhere in
  * memory.
  */
-void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
+typedef void (*qemu_plugin_register_vcpu_tb_exec_inline_t)(struct qemu_plugin_tb *tb,
                                               enum qemu_plugin_op op,
                                               void *ptr, uint64_t imm);
 
@@ -259,7 +272,7 @@ void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
  *
  * The @cb function is called every time an instruction is executed
  */
-void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
+typedef void (*qemu_plugin_register_vcpu_insn_exec_cb_t)(struct qemu_plugin_insn *insn,
                                             qemu_plugin_vcpu_udata_cb_t cb,
                                             enum qemu_plugin_cb_flags flags,
                                             void *userdata);
@@ -275,26 +288,26 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
  * Insert an inline op to every time an instruction executes. Useful
  * if you just want to increment a single counter somewhere in memory.
  */
-void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
-                                                enum qemu_plugin_op op,
-                                                void *ptr, uint64_t imm);
+typedef void (*qemu_plugin_register_vcpu_insn_exec_inline_t)(
+    struct qemu_plugin_insn *insn, enum qemu_plugin_op op,
+    void *ptr, uint64_t imm);
 
 /*
  * Helpers to query information about the instructions in a block
  */
-size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
+typedef size_t (*qemu_plugin_tb_n_insns_t)(const struct qemu_plugin_tb *tb);
 
-uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
+typedef uint64_t (*qemu_plugin_tb_vaddr_t)(const struct qemu_plugin_tb *tb);
 
-struct qemu_plugin_insn *
-qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
+typedef struct qemu_plugin_insn *
+(*qemu_plugin_tb_get_insn_t)(const struct qemu_plugin_tb *tb, size_t idx);
 
-const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
+typedef const void *(*qemu_plugin_insn_data_t)(const struct qemu_plugin_insn *insn);
 
-size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
+typedef size_t (*qemu_plugin_insn_size_t)(const struct qemu_plugin_insn *insn);
 
-uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
-void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
+typedef uint64_t (*qemu_plugin_insn_vaddr_t)(const struct qemu_plugin_insn *insn);
+typedef void *(*qemu_plugin_insn_haddr_t)(const struct qemu_plugin_insn *insn);
 
 /*
  * Memory Instrumentation
@@ -307,10 +320,10 @@ typedef uint32_t qemu_plugin_meminfo_t;
 struct qemu_plugin_hwaddr;
 
 /* meminfo queries */
-unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
-bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
-bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
-bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
+typedef unsigned int (*qemu_plugin_mem_size_shift_t)(qemu_plugin_meminfo_t info);
+typedef bool (*qemu_plugin_mem_is_sign_extended_t)(qemu_plugin_meminfo_t info);
+typedef bool (*qemu_plugin_mem_is_big_endian_t)(qemu_plugin_meminfo_t info);
+typedef bool (*qemu_plugin_mem_is_store_t)(qemu_plugin_meminfo_t info);
 
 /*
  * qemu_plugin_get_hwaddr():
@@ -324,7 +337,7 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
  * information about the handle should be recovered before the
  * callback returns.
  */
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
+typedef struct qemu_plugin_hwaddr *(*qemu_plugin_get_hwaddr_t)(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
 /*
@@ -332,21 +345,22 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
  * to return information about it. For non-IO accesses the device
  * offset will be into the appropriate block of RAM.
  */
-bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+typedef bool (*qemu_plugin_hwaddr_is_io_t)(const struct qemu_plugin_hwaddr *haddr);
+typedef uint64_t (*qemu_plugin_hwaddr_device_offset_t)(
+    const struct qemu_plugin_hwaddr *haddr);
 
 typedef void
 (*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
                              qemu_plugin_meminfo_t info, uint64_t vaddr,
                              void *userdata);
 
-void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
+typedef void (*qemu_plugin_register_vcpu_mem_cb_t)(struct qemu_plugin_insn *insn,
                                       qemu_plugin_vcpu_mem_cb_t cb,
                                       enum qemu_plugin_cb_flags flags,
                                       enum qemu_plugin_mem_rw rw,
                                       void *userdata);
 
-void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
+typedef void (*qemu_plugin_register_vcpu_mem_inline_t)(struct qemu_plugin_insn *insn,
                                           enum qemu_plugin_mem_rw rw,
                                           enum qemu_plugin_op op, void *ptr,
                                           uint64_t imm);
@@ -359,15 +373,15 @@ typedef void
                                  uint64_t a3, uint64_t a4, uint64_t a5,
                                  uint64_t a6, uint64_t a7, uint64_t a8);
 
-void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_vcpu_syscall_cb_t)(qemu_plugin_id_t id,
                                           qemu_plugin_vcpu_syscall_cb_t cb);
 
 typedef void
 (*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_idx,
                                      int64_t num, int64_t ret);
 
-void
-qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
+typedef void
+(*qemu_plugin_register_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_syscall_ret_cb_t cb);
 
 
@@ -378,7 +392,7 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
  * Returns an allocated string containing the disassembly
  */
 
-char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
+typedef char *(*qemu_plugin_insn_disas_t)(const struct qemu_plugin_insn *insn);
 
 /**
  * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
@@ -389,25 +403,117 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
  *
  * See also: qemu_plugin_register_vcpu_init_cb()
  */
-void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_vcpu_for_each_t)(qemu_plugin_id_t id,
                                qemu_plugin_vcpu_simple_cb_t cb);
 
-void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_flush_cb_t)(qemu_plugin_id_t id,
                                    qemu_plugin_simple_cb_t cb);
 
-void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
+typedef void (*qemu_plugin_register_atexit_cb_t)(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
 /* returns -1 in user-mode */
-int qemu_plugin_n_vcpus(void);
+typedef int (*qemu_plugin_n_vcpus_t)(void);
 
 /* returns -1 in user-mode */
-int qemu_plugin_n_max_vcpus(void);
+typedef int (*qemu_plugin_n_max_vcpus_t)(void);
 
 /**
  * qemu_plugin_outs() - output string via QEMU's logging system
  * @string: a string
  */
-void qemu_plugin_outs(const char *string);
+typedef void (*qemu_plugin_outs_t)(const char *string);
+
+#if !defined(QEMU_PLUGIN_API_IMPLEMENTATION)
+
+#define qemu_plugin_decl_symbol(symbol_name) symbol_name##_t symbol_name
+
+#define qemu_plugin_load_symbol(info, symbol_name) do {\
+    symbol_name = info->dlsym(info->context, #symbol_name); \
+    if (NULL == symbol_name) { \
+        return -1; \
+    } \
+} while (0)
+
+qemu_plugin_decl_symbol(qemu_plugin_uninstall);
+qemu_plugin_decl_symbol(qemu_plugin_reset);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_init_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_exit_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_idle_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_resume_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_tb_trans_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_tb_exec_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_tb_exec_inline);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_insn_exec_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_insn_exec_inline);
+qemu_plugin_decl_symbol(qemu_plugin_tb_n_insns);
+qemu_plugin_decl_symbol(qemu_plugin_tb_vaddr);
+qemu_plugin_decl_symbol(qemu_plugin_tb_get_insn);
+qemu_plugin_decl_symbol(qemu_plugin_insn_data);
+qemu_plugin_decl_symbol(qemu_plugin_insn_size);
+qemu_plugin_decl_symbol(qemu_plugin_insn_vaddr);
+qemu_plugin_decl_symbol(qemu_plugin_insn_haddr);
+qemu_plugin_decl_symbol(qemu_plugin_mem_size_shift);
+qemu_plugin_decl_symbol(qemu_plugin_mem_is_sign_extended);
+qemu_plugin_decl_symbol(qemu_plugin_mem_is_big_endian);
+qemu_plugin_decl_symbol(qemu_plugin_mem_is_store);
+qemu_plugin_decl_symbol(qemu_plugin_get_hwaddr);
+qemu_plugin_decl_symbol(qemu_plugin_hwaddr_is_io);
+qemu_plugin_decl_symbol(qemu_plugin_hwaddr_device_offset);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_mem_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_mem_inline);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_syscall_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_vcpu_syscall_ret_cb);
+qemu_plugin_decl_symbol(qemu_plugin_insn_disas);
+qemu_plugin_decl_symbol(qemu_plugin_vcpu_for_each);
+qemu_plugin_decl_symbol(qemu_plugin_register_flush_cb);
+qemu_plugin_decl_symbol(qemu_plugin_register_atexit_cb);
+qemu_plugin_decl_symbol(qemu_plugin_n_vcpus);
+qemu_plugin_decl_symbol(qemu_plugin_n_max_vcpus);
+qemu_plugin_decl_symbol(qemu_plugin_outs);
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_initialize(const qemu_info_t *info)
+{
+    qemu_plugin_load_symbol(info, qemu_plugin_uninstall);
+    qemu_plugin_load_symbol(info, qemu_plugin_reset);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_init_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_exit_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_idle_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_resume_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_tb_trans_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_tb_exec_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_tb_exec_inline);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_insn_exec_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_insn_exec_inline);
+    qemu_plugin_load_symbol(info, qemu_plugin_tb_n_insns);
+    qemu_plugin_load_symbol(info, qemu_plugin_tb_vaddr);
+    qemu_plugin_load_symbol(info, qemu_plugin_tb_get_insn);
+    qemu_plugin_load_symbol(info, qemu_plugin_insn_data);
+    qemu_plugin_load_symbol(info, qemu_plugin_insn_size);
+    qemu_plugin_load_symbol(info, qemu_plugin_insn_vaddr);
+    qemu_plugin_load_symbol(info, qemu_plugin_insn_haddr);
+    qemu_plugin_load_symbol(info, qemu_plugin_mem_size_shift);
+    qemu_plugin_load_symbol(info, qemu_plugin_mem_is_sign_extended);
+    qemu_plugin_load_symbol(info, qemu_plugin_mem_is_big_endian);
+    qemu_plugin_load_symbol(info, qemu_plugin_mem_is_store);
+    qemu_plugin_load_symbol(info, qemu_plugin_get_hwaddr);
+    qemu_plugin_load_symbol(info, qemu_plugin_hwaddr_is_io);
+    qemu_plugin_load_symbol(info, qemu_plugin_hwaddr_device_offset);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_mem_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_mem_inline);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_syscall_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_vcpu_syscall_ret_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_insn_disas);
+    qemu_plugin_load_symbol(info, qemu_plugin_vcpu_for_each);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_flush_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_register_atexit_cb);
+    qemu_plugin_load_symbol(info, qemu_plugin_n_vcpus);
+    qemu_plugin_load_symbol(info, qemu_plugin_n_max_vcpus);
+    qemu_plugin_load_symbol(info, qemu_plugin_outs);
+    return 0;
+}
+
+#endif /* QEMU_PLUGIN_API_IMPLEMENTATION */
+
 
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/meson.build b/meson.build
index 8ad600a91a..4c073f5460 100644
--- a/meson.build
+++ b/meson.build
@@ -326,7 +326,11 @@ endif
 rt = cc.find_library('rt', required: false)
 libdl = not_found
 if 'CONFIG_PLUGIN' in config_host
-  libdl = cc.find_library('dl', required: true)
+  if targetos == 'windows'
+    libdl = declare_dependency(compile_args: [], link_args: [])
+  else
+    libdl = cc.find_library('dl', required: true)
+  endif
 endif
 libiscsi = not_found
 if 'CONFIG_LIBISCSI' in config_host
diff --git a/plugins/api.c b/plugins/api.c
index 13177d3578..9964b8bdc7 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -35,6 +35,7 @@
  */
 
 #include "qemu/osdep.h"
+#define QEMU_PLUGIN_API_IMPLEMENTATION
 #include "qemu/plugin.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -48,14 +49,18 @@
 #endif
 #include "trace/mem.h"
 
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wmissing-prototypes"
+
 /* Uninstall and Reset handlers */
 
-void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
+QEMU_PLUGIN_EXPORT void qemu_plugin_uninstall(
+    qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
 {
     plugin_reset_uninstall(id, cb, false);
 }
 
-void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
+QEMU_PLUGIN_EXPORT void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
 {
     plugin_reset_uninstall(id, cb, true);
 }
@@ -67,19 +72,19 @@ void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
  * during the translation.
  */
 
-void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_INIT, cb);
 }
 
-void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_EXIT, cb);
 }
 
-void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           qemu_plugin_vcpu_udata_cb_t cb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *udata)
@@ -88,25 +93,28 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                   cb, flags, udata);
 }
 
-void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
-                                              enum qemu_plugin_op op,
-                                              void *ptr, uint64_t imm)
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_tb_exec_inline(
+    struct qemu_plugin_tb *tb,
+    enum qemu_plugin_op op,
+    void *ptr, uint64_t imm)
 {
     plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
 }
 
-void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
-                                            qemu_plugin_vcpu_udata_cb_t cb,
-                                            enum qemu_plugin_cb_flags flags,
-                                            void *udata)
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_insn_exec_cb(
+    struct qemu_plugin_insn *insn,
+    qemu_plugin_vcpu_udata_cb_t cb,
+    enum qemu_plugin_cb_flags flags,
+    void *udata)
 {
     plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
         cb, flags, udata);
 }
 
-void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
-                                                enum qemu_plugin_op op,
-                                                void *ptr, uint64_t imm)
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_insn_exec_inline(
+    struct qemu_plugin_insn *insn,
+    enum qemu_plugin_op op,
+    void *ptr, uint64_t imm)
 {
     plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
                               0, op, ptr, imm);
@@ -114,38 +122,40 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
 
 
 
-void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
-                                      qemu_plugin_vcpu_mem_cb_t cb,
-                                      enum qemu_plugin_cb_flags flags,
-                                      enum qemu_plugin_mem_rw rw,
-                                      void *udata)
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_mem_cb(
+    struct qemu_plugin_insn *insn,
+    qemu_plugin_vcpu_mem_cb_t cb,
+    enum qemu_plugin_cb_flags flags,
+    enum qemu_plugin_mem_rw rw,
+    void *udata)
 {
     plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
                                 cb, flags, rw, udata);
 }
 
-void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
-                                          enum qemu_plugin_mem_rw rw,
-                                          enum qemu_plugin_op op, void *ptr,
-                                          uint64_t imm)
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_mem_inline(
+    struct qemu_plugin_insn *insn,
+    enum qemu_plugin_mem_rw rw,
+    enum qemu_plugin_op op, void *ptr,
+    uint64_t imm)
 {
     plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
         rw, op, ptr, imm);
 }
 
-void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
                                            qemu_plugin_vcpu_tb_trans_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_TB_TRANS, cb);
 }
 
-void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
                                           qemu_plugin_vcpu_syscall_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_SYSCALL, cb);
 }
 
-void
+QEMU_PLUGIN_EXPORT void
 qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_syscall_ret_cb_t cb)
 {
@@ -168,17 +178,17 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
  * each translated instruction.
  */
 
-size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb)
+QEMU_PLUGIN_EXPORT size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb)
 {
     return tb->n;
 }
 
-uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
 {
     return tb->vaddr;
 }
 
-struct qemu_plugin_insn *
+QEMU_PLUGIN_EXPORT struct qemu_plugin_insn *
 qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
 {
     if (unlikely(idx >= tb->n)) {
@@ -194,27 +204,27 @@ qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
  * instruction being translated.
  */
 
-const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn)
+QEMU_PLUGIN_EXPORT const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn)
 {
     return insn->data->data;
 }
 
-size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn)
+QEMU_PLUGIN_EXPORT size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn)
 {
     return insn->data->len;
 }
 
-uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn)
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn)
 {
     return insn->vaddr;
 }
 
-void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn)
+QEMU_PLUGIN_EXPORT void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn)
 {
     return insn->haddr;
 }
 
-char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
+QEMU_PLUGIN_EXPORT char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
 {
     CPUState *cpu = current_cpu;
     return plugin_disas(cpu, insn->vaddr, insn->data->len);
@@ -225,22 +235,22 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
  * memory access.
  */
 
-unsigned qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info)
+QEMU_PLUGIN_EXPORT unsigned qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info)
 {
     return info & TRACE_MEM_SZ_SHIFT_MASK;
 }
 
-bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info)
+QEMU_PLUGIN_EXPORT bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info)
 {
     return !!(info & TRACE_MEM_SE);
 }
 
-bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info)
+QEMU_PLUGIN_EXPORT bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info)
 {
     return !!(info & TRACE_MEM_BE);
 }
 
-bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
+QEMU_PLUGIN_EXPORT bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
 {
     return !!(info & TRACE_MEM_ST);
 }
@@ -253,8 +263,8 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
 static __thread struct qemu_plugin_hwaddr hwaddr_info;
 #endif
 
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
-                                                  uint64_t vaddr)
+QEMU_PLUGIN_EXPORT struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(
+    qemu_plugin_meminfo_t info, uint64_t vaddr)
 {
 #ifdef CONFIG_SOFTMMU
     CPUState *cpu = current_cpu;
@@ -273,7 +283,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
 #endif
 }
 
-bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
+QEMU_PLUGIN_EXPORT bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 {
 #ifdef CONFIG_SOFTMMU
     return haddr->is_io;
@@ -282,7 +292,8 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 #endif
 }
 
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_hwaddr_device_offset(
+    const struct qemu_plugin_hwaddr *haddr)
 {
 #ifdef CONFIG_SOFTMMU
     if (haddr) {
@@ -313,7 +324,7 @@ static MachineState * get_ms(void)
 }
 #endif
 
-int qemu_plugin_n_vcpus(void)
+QEMU_PLUGIN_EXPORT int qemu_plugin_n_vcpus(void)
 {
 #ifdef CONFIG_USER_ONLY
     return -1;
@@ -322,7 +333,7 @@ int qemu_plugin_n_vcpus(void)
 #endif
 }
 
-int qemu_plugin_n_max_vcpus(void)
+QEMU_PLUGIN_EXPORT int qemu_plugin_n_max_vcpus(void)
 {
 #ifdef CONFIG_USER_ONLY
     return -1;
@@ -334,7 +345,9 @@ int qemu_plugin_n_max_vcpus(void)
 /*
  * Plugin output
  */
-void qemu_plugin_outs(const char *string)
+QEMU_PLUGIN_EXPORT void qemu_plugin_outs(const char *string)
 {
     qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
 }
+
+#pragma GCC diagnostic pop
diff --git a/plugins/core.c b/plugins/core.c
index 51bfc94787..3df3e7d9af 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -32,6 +32,9 @@
 #include "trace/mem-internal.h" /* mem_info macros */
 #include "plugin.h"
 
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wmissing-prototypes"
+
 struct qemu_plugin_cb {
     struct qemu_plugin_ctx *ctx;
     union qemu_plugin_cb_sig f;
@@ -233,7 +236,7 @@ static void plugin_vcpu_for_each(gpointer k, gpointer v, gpointer udata)
     args->cb(args->ctx->id, cpu_index);
 }
 
-void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
                                qemu_plugin_vcpu_simple_cb_t cb)
 {
     struct plugin_for_each_args args;
@@ -384,19 +387,19 @@ void qemu_plugin_vcpu_resume_cb(CPUState *cpu)
     plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_RESUME);
 }
 
-void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_IDLE, cb);
 }
 
-void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_simple_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_RESUME, cb);
 }
 
-void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
                                    qemu_plugin_simple_cb_t cb)
 {
     plugin_register_cb(id, QEMU_PLUGIN_EV_FLUSH, cb);
@@ -463,7 +466,7 @@ void qemu_plugin_atexit_cb(void)
     plugin_cb__udata(QEMU_PLUGIN_EV_ATEXIT);
 }
 
-void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
+QEMU_PLUGIN_EXPORT void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb,
                                     void *udata)
 {
@@ -500,3 +503,5 @@ static void __attribute__((__constructor__)) plugin_init(void)
              QHT_MODE_AUTO_RESIZE);
     atexit(qemu_plugin_atexit_cb);
 }
+
+#pragma GCC diagnostic pop
diff --git a/plugins/loader.c b/plugins/loader.c
index 8ac5dbc20f..38e050ff9b 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -63,6 +63,7 @@ QemuOptsList qemu_plugin_opts = {
     },
 };
 
+typedef int (*qemu_plugin_initialize_func_t)(const qemu_info_t *);
 typedef int (*qemu_plugin_install_func_t)(qemu_plugin_id_t, const qemu_info_t *, int, char **);
 
 extern struct qemu_plugin_state plugin;
@@ -152,10 +153,12 @@ static uint64_t xorshift64star(uint64_t x)
 
 static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
 {
+    qemu_plugin_initialize_func_t initialize = NULL;
     qemu_plugin_install_func_t install;
     struct qemu_plugin_ctx *ctx;
     gpointer sym;
     int rc;
+    int version = -1;
 
     ctx = qemu_memalign(qemu_dcache_linesize, sizeof(*ctx));
     memset(ctx, 0, sizeof(*ctx));
@@ -184,7 +187,7 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
                      desc->path, g_module_error());
         goto err_symbol;
     } else {
-        int version = *(int *)sym;
+        version = *(int *)sym;
         if (version < QEMU_PLUGIN_MIN_VERSION) {
             error_report("TCG plugin %s requires API version %d, but "
                          "this QEMU supports only a minimum version of %d",
@@ -198,6 +201,21 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
         }
     }
 
+    if (version >= QEMU_PLUGIN_VERSION_1) {
+        /* This version should call to qemu_plugin_initialize first */
+        if (!g_module_symbol(ctx->handle, "qemu_plugin_initialize", &sym)) {
+            error_report("%s: %s", __func__, g_module_error());
+            goto err_symbol;
+        }
+        initialize = (qemu_plugin_initialize_func_t) sym;
+        /* symbol was found; it could be NULL though */
+        if (initialize == NULL) {
+            error_report("%s: %s: qemu_plugin_initialize is NULL",
+                        __func__, desc->path);
+            goto err_symbol;
+        }
+    }
+
     qemu_rec_mutex_lock(&plugin.lock);
 
     /* find an unused random id with &ctx as the seed */
@@ -216,6 +234,16 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
         }
     }
     QTAILQ_INSERT_TAIL(&plugin.ctxs, ctx, entry);
+    if (initialize != NULL) {
+        rc = initialize(info);
+        if (rc) {
+            error_report("%s: qemu_plugin_initialize returned error code %d",
+                        __func__, rc);
+            /* qemu_plugin_initialize only loading function symbols */
+            goto err_symbol;
+        }
+    }
+
     ctx->installing = true;
     rc = install(ctx->id, info, desc->argc, desc->argv);
     ctx->installing = false;
@@ -254,6 +282,17 @@ static void plugin_desc_free(struct qemu_plugin_desc *desc)
     g_free(desc);
 }
 
+static void *qemu_plugin_global_dlsym(void* context, const char *name)
+{
+    GModule *global_handle = context;
+    gpointer sym = NULL;
+    if (!g_module_symbol(global_handle, name, &sym)) {
+        error_report("%s: %s", __func__, g_module_error());
+        return NULL;
+    }
+    return sym;
+}
+
 /**
  * qemu_plugin_load_list - load a list of plugins
  * @head: head of the list of descriptors of the plugins to be loaded
@@ -267,6 +306,7 @@ int qemu_plugin_load_list(QemuPluginList *head)
 {
     struct qemu_plugin_desc *desc, *next;
     g_autofree qemu_info_t *info = g_new0(qemu_info_t, 1);
+    GModule *global_handle = NULL;
 
     info->target_name = TARGET_NAME;
     info->version.min = QEMU_PLUGIN_MIN_VERSION;
@@ -276,6 +316,12 @@ int qemu_plugin_load_list(QemuPluginList *head)
     info->system_emulation = true;
     info->system.smp_vcpus = ms->smp.cpus;
     info->system.max_vcpus = ms->smp.max_cpus;
+    global_handle = g_module_open(NULL, G_MODULE_BIND_LOCAL);
+    if (global_handle == NULL) {
+        goto err_dlopen;
+    }
+    info->dlsym = qemu_plugin_global_dlsym;
+    info->context = (void *)global_handle;
 #else
     info->system_emulation = false;
 #endif
@@ -289,6 +335,8 @@ int qemu_plugin_load_list(QemuPluginList *head)
         }
         QTAILQ_REMOVE(head, desc, entry);
     }
+
+err_dlopen:
     return 0;
 }
 
diff --git a/plugins/meson.build b/plugins/meson.build
index e77723010e..b48d2046ff 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,13 +1,5 @@
-if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-  plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
-elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-  plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
-else
-  plugin_ldflags = []
-endif
-
 specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
   'loader.c',
   'core.c',
   'api.c',
-), declare_dependency(link_args: plugin_ldflags)])
+), declare_dependency(link_args: [], compile_args: [])])
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 1aa29dcadd..406f246a72 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -15,6 +15,7 @@
 #include <gmodule.h>
 
 #define QEMU_PLUGIN_MIN_VERSION 0
+#define QEMU_PLUGIN_VERSION_1 1
 
 /* global state */
 struct qemu_plugin_state {
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
deleted file mode 100644
index 4bdb381f48..0000000000
--- a/plugins/qemu-plugins.symbols
+++ /dev/null
@@ -1,40 +0,0 @@
-{
-  qemu_plugin_uninstall;
-  qemu_plugin_reset;
-  qemu_plugin_register_vcpu_init_cb;
-  qemu_plugin_register_vcpu_exit_cb;
-  qemu_plugin_register_vcpu_idle_cb;
-  qemu_plugin_register_vcpu_resume_cb;
-  qemu_plugin_register_vcpu_insn_exec_cb;
-  qemu_plugin_register_vcpu_insn_exec_inline;
-  qemu_plugin_register_vcpu_mem_cb;
-  qemu_plugin_register_vcpu_mem_haddr_cb;
-  qemu_plugin_register_vcpu_mem_inline;
-  qemu_plugin_ram_addr_from_host;
-  qemu_plugin_register_vcpu_tb_trans_cb;
-  qemu_plugin_register_vcpu_tb_exec_cb;
-  qemu_plugin_register_vcpu_tb_exec_inline;
-  qemu_plugin_register_flush_cb;
-  qemu_plugin_register_vcpu_syscall_cb;
-  qemu_plugin_register_vcpu_syscall_ret_cb;
-  qemu_plugin_register_atexit_cb;
-  qemu_plugin_tb_n_insns;
-  qemu_plugin_tb_get_insn;
-  qemu_plugin_tb_vaddr;
-  qemu_plugin_insn_data;
-  qemu_plugin_insn_size;
-  qemu_plugin_insn_vaddr;
-  qemu_plugin_insn_haddr;
-  qemu_plugin_insn_disas;
-  qemu_plugin_mem_size_shift;
-  qemu_plugin_mem_is_sign_extended;
-  qemu_plugin_mem_is_big_endian;
-  qemu_plugin_mem_is_store;
-  qemu_plugin_get_hwaddr;
-  qemu_plugin_hwaddr_is_io;
-  qemu_plugin_hwaddr_to_raddr;
-  qemu_plugin_vcpu_for_each;
-  qemu_plugin_n_vcpus;
-  qemu_plugin_n_max_vcpus;
-  qemu_plugin_outs;
-};
-- 
2.28.0.windows.1


