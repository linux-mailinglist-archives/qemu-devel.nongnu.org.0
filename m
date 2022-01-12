Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4D48C39E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:59:26 +0100 (CET)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cHl-0000oB-Ac
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvP-0007Th-NX
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:19 -0500
Received: from [2a00:1450:4864:20::52a] (port=38743
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvN-0004jp-F5
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:19 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u21so8725923edd.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qU0qCSSl4pmUaHPJTCWU5SfjM+Bm5LpUHH3/TENBYHM=;
 b=Iv0+jBC7qicZ7diSUyFAhN7ud0F5/tUaKDSr4vHF07TsOMwIUV0amTw313XyG1NS+v
 QRu92YorPOkmx9QcJuLqYFfMtF1EJ1Kc04QBneMGftkL5oGXvQqpQOYHOjZ0n2WG6skA
 75htYfPw/BPwo3/w4GQFV0tIY2MDJ/cahE2wY0lmCuBg23YJGefL1rI1GFgthdn7Vvd0
 hEssFGGRHb9jDVEbwo8lIZ05EWV5qowzRYNjcnjWTT1aqQ+w1Fa/PITi1WDVBVp07Lzz
 VvyZCQVabFZI9MydoAR0948TeMw6x1J/9RnQsJXdPJDj/ojkvzRUtWKZt4bH/HI0mFx8
 07Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qU0qCSSl4pmUaHPJTCWU5SfjM+Bm5LpUHH3/TENBYHM=;
 b=04+42rsuGoulozKabTvr/YYoUM+oXWeUc9cYt6ZdzcMTLt1kyPN+3WiqpzLBGEFpJo
 pxdCbzlL/J6dovy3sAnqnEm3n0NlkWCbU9vQM3y1qfwxMEblvL7Vmkvvj+Lc8JM5etAc
 eBkxmQr4rf2DuV44w/8lygD6Ce1/j3vdzRY+VDhyV76yCSPzwrSMJU7U49BHYmEqvJBM
 eEQLdNMnrDubEBH2QwCEt7HAgGx33oLlXjp5LrKlaARh2AC1q8TqWAsqk3ctU4fh2FjE
 jDmnEvZx+unS9JoFgOacu8d831O52l/uiD38CZ2ZBarEuy/SfgadqHGLQaKTW1WtRFnu
 YBhA==
X-Gm-Message-State: AOAM5305ba60wRGL3tj/t+1qsCbWF1m3oDmX6PcN8WZppUElUi/WYWSz
 DnTTYa5GhBedksO1F8ihJ9Koeg==
X-Google-Smtp-Source: ABdhPJwRmxv/pzhEVVNlsB9WDlePl+v1cwm5ODffjRbLpXuPwG+VkHxj4sI4uOaIVAZyHRM0SbZWqw==
X-Received: by 2002:a17:907:94d6:: with SMTP id
 dn22mr7097836ejc.541.1641987376014; 
 Wed, 12 Jan 2022 03:36:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm5959878edt.13.2022.01.12.03.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56AED1FFD7;
 Wed, 12 Jan 2022 11:27:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 31/31] linux-user: Remove the deprecated ppc64abi32 target
Date: Wed, 12 Jan 2022 11:27:22 +0000
Message-Id: <20220112112722.3641051-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

It's likely broken, and nobody cared for picking it up again
during the deprecation phase, so let's remove this now.

Since this is the last entry in deprecated_targets_list, remove
the related code in the configure script, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215084958.185214-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220105135009.1584676-35-alex.bennee@linaro.org>

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e21e07478f..6f85afdee4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -390,13 +390,6 @@ The above, converted to the current supported format::
 linux-user mode CPUs
 --------------------
 
-``ppc64abi32`` CPUs (since 5.2)
-'''''''''''''''''''''''''''''''
-
-The ``ppc64abi32`` architecture has a number of issues which regularly
-trip up our CI testing and is suspected to be quite broken. For that
-reason the maintainers strongly suspect no one actually uses it.
-
 MIPS ``I7200`` CPU (since 5.2)
 ''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4c4da20d0f..380a1b30ea 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -601,6 +601,14 @@ the upstream Linux kernel in 2018, and it has also been dropped from glibc, so
 there is no new Linux development taking place with this architecture. For
 running the old binaries, you can use older versions of QEMU.
 
+``ppc64abi32`` CPUs (removed in 7.0)
+''''''''''''''''''''''''''''''''''''
+
+The ``ppc64abi32`` architecture has a number of issues which regularly
+tripped up the CI testing and was suspected to be quite broken. For that
+reason the maintainers strongly suspected no one actually used it.
+
+
 System emulator devices
 -----------------------
 
diff --git a/docs/user/main.rst b/docs/user/main.rst
index e08d4be63b..6f2ffa080f 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -166,7 +166,6 @@ Other binaries
 
 -  user mode (PowerPC)
 
-   * ``qemu-ppc64abi32`` TODO.
    * ``qemu-ppc64`` TODO.
    * ``qemu-ppc`` TODO.
 
diff --git a/configure b/configure
index 030728d11e..0c57a063c6 100755
--- a/configure
+++ b/configure
@@ -1273,8 +1273,6 @@ if [ "$ARCH" = "unknown" ]; then
 fi
 
 default_target_list=""
-deprecated_targets_list=ppc64abi32-linux-user
-deprecated_features=""
 mak_wilds=""
 
 if [ "$softmmu" = "yes" ]; then
@@ -1287,16 +1285,6 @@ if [ "$bsd_user" = "yes" ]; then
     mak_wilds="${mak_wilds} $source_path/configs/targets/*-bsd-user.mak"
 fi
 
-# If the user doesn't explicitly specify a deprecated target we will
-# skip it.
-if test -z "$target_list"; then
-    if test -z "$target_list_exclude"; then
-        target_list_exclude="$deprecated_targets_list"
-    else
-        target_list_exclude="$target_list_exclude,$deprecated_targets_list"
-    fi
-fi
-
 for config in $mak_wilds; do
     target="$(basename "$config" .mak)"
     if echo "$target_list_exclude" | grep -vq "$target"; then
@@ -1315,11 +1303,9 @@ Standard options:
   --prefix=PREFIX          install in PREFIX [$prefix]
   --interp-prefix=PREFIX   where to find shared libraries, etc.
                            use %M for cpu name [$interp_prefix]
-  --target-list=LIST       set target list (default: build all non-deprecated)
+  --target-list=LIST       set target list (default: build all)
 $(echo Available targets: $default_target_list | \
   fold -s -w 53 | sed -e 's/^/                           /')
-$(echo Deprecated targets: $deprecated_targets_list | \
-  fold -s -w 53 | sed -e 's/^/                           /')
   --target-list-exclude=LIST exclude a set of targets from the default target-list
 
 Advanced options (experts only):
@@ -1804,13 +1790,6 @@ else
     done
 fi
 
-for target in $target_list; do
-    # if a deprecated target is enabled we note it here
-    if echo "$deprecated_targets_list" | grep -q "$target"; then
-        add_to deprecated_features $target
-    fi
-done
-
 # see if system emulation was really requested
 case " $target_list " in
   *"-softmmu "*) softmmu=yes
@@ -3950,12 +3929,6 @@ else
   fi
 fi
 
-if test -n "${deprecated_features}"; then
-    echo "Warning, deprecated features enabled."
-    echo "Please see docs/about/deprecated.rst"
-    echo "  features: ${deprecated_features}"
-fi
-
 # Create list of config switches that should be poisoned in common code...
 # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
 target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
diff --git a/configs/targets/ppc64abi32-linux-user.mak b/configs/targets/ppc64abi32-linux-user.mak
deleted file mode 100644
index 0945451081..0000000000
--- a/configs/targets/ppc64abi32-linux-user.mak
+++ /dev/null
@@ -1,8 +0,0 @@
-TARGET_ARCH=ppc64
-TARGET_ABI32=y
-TARGET_BASE_ARCH=ppc
-TARGET_ABI_DIR=ppc
-TARGET_SYSTBL_ABI=common,nospu,32
-TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
-TARGET_XML_FILES= gdb-xml/power64-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml gdb-xml/power-vsx.xml
diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
index 8b364697d4..7df9118937 100644
--- a/linux-user/ppc/target_syscall.h
+++ b/linux-user/ppc/target_syscall.h
@@ -36,7 +36,7 @@ struct target_pt_regs {
 	abi_ulong link;
 	abi_ulong xer;
 	abi_ulong ccr;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
         abi_ulong softe;
 #else
 	abi_ulong mq;		/* 601 only (not used at present) */
@@ -58,7 +58,7 @@ struct target_revectored_struct {
  * flags masks
  */
 
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
 #ifdef TARGET_WORDS_BIGENDIAN
 #define UNAME_MACHINE "ppc64"
 #else
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index cca561f622..dc7dcad6f7 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1607,7 +1607,7 @@ struct target_stat64 {
 struct target_stat {
 	abi_ulong st_dev;
 	abi_ulong st_ino;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
 	abi_ulong st_nlink;
 	unsigned int st_mode;
 #else
@@ -1628,12 +1628,12 @@ struct target_stat {
 	abi_ulong  target_st_ctime_nsec;
 	abi_ulong  __unused4;
 	abi_ulong  __unused5;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
 	abi_ulong  __unused6;
 #endif
 };
 
-#if !defined(TARGET_PPC64) || defined(TARGET_ABI32)
+#if !defined(TARGET_PPC64)
 #define TARGET_HAS_STRUCT_STAT64
 struct QEMU_PACKED target_stat64 {
 	unsigned long long st_dev;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index cb2f01ff01..107796c44d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -718,7 +718,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define ELF_MACHINE    PPC_ELF_MACHINE
 #define ELF_START_MMAP 0x80000000
 
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
 
 #define elf_check_arch(x) ( (x) == EM_PPC64 )
 
@@ -870,7 +870,7 @@ static uint32_t get_elf_hwcap2(void)
 static inline void init_thread(struct target_pt_regs *_regs, struct image_info *infop)
 {
     _regs->gpr[1] = infop->start_stack;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
     if (get_ppc64_abi(infop) < 2) {
         uint64_t val;
         get_user_u64(val, infop->entry + 8);
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 176c9d8503..ec0b9c0df3 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -477,9 +477,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     int i, err = 0;
 #if defined(TARGET_PPC64)
     struct target_sigcontext *sc = 0;
-#if !defined(TARGET_ABI32)
     struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
-#endif
 #endif
 
     rt_sf_addr = get_sigframe(ka, env, sizeof(*rt_sf));
@@ -530,7 +528,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->gpr[5] = (target_ulong) h2g(&rt_sf->uc);
     env->gpr[6] = (target_ulong) h2g(rt_sf);
 
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
     if (get_ppc64_abi(image) < 2) {
         /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
         struct target_func_ptr *handler =
@@ -562,7 +560,7 @@ sigsegv:
 
 }
 
-#if !defined(TARGET_PPC64) || defined(TARGET_ABI32)
+#if !defined(TARGET_PPC64)
 long do_sigreturn(CPUPPCState *env)
 {
     struct target_sigcontext *sc = NULL;
@@ -575,12 +573,9 @@ long do_sigreturn(CPUPPCState *env)
     if (!lock_user_struct(VERIFY_READ, sc, sc_addr, 1))
         goto sigsegv;
 
-#if defined(TARGET_PPC64)
-    set.sig[0] = sc->oldmask + ((uint64_t)(sc->_unused[3]) << 32);
-#else
     __get_user(set.sig[0], &sc->oldmask);
     __get_user(set.sig[1], &sc->_unused[3]);
-#endif
+
     target_to_host_sigset_internal(&blocked, &set);
     set_sigmask(&blocked);
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f2a3c8f5b..0aa70213fb 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -473,33 +473,6 @@ tsan-build:
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
 
-# These targets are on the way out
-build-deprecated:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools
-    MAKE_CHECK_ARGS: build-tcg
-    TARGETS: ppc64abi32-linux-user
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-# We split the check-tcg step as test failures are expected but we still
-# want to catch the build breaking.
-check-deprecated:
-  extends: .native_test_job_template
-  needs:
-    - job: build-deprecated
-      artifacts: true
-  variables:
-    IMAGE: debian-all-test-cross
-    MAKE_CHECK_ARGS: check-tcg
-  allow_failure: true
-
 # gprof/gcov are GCC features
 build-gprof-gcov:
   extends: .native_build_job_template
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 1146a06be6..5de12b01cd 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -16,7 +16,7 @@ RUN apt update && \
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
-ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
+ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user
 
 # Install extra libraries to increase code coverage
 RUN apt update && \
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 309335a2bd..763e9b6ad8 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -167,7 +167,7 @@ for target in $target_list; do
       container_image=debian-nios2-cross
       container_cross_cc=nios2-linux-gnu-gcc
       ;;
-    ppc-*|ppc64abi32-*)
+    ppc-*)
       container_hosts=x86_64
       container_image=debian-powerpc-test-cross
       container_cross_cc=powerpc-linux-gnu-gcc-10
-- 
2.30.2


