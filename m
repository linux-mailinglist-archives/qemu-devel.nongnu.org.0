Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C494AF5F2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:03:08 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpQx-0000Jz-Af
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu3-0000ZP-A0
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:03 -0500
Received: from [2a00:1450:4864:20::336] (port=43863
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu1-0001M8-7y
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso1711052wms.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTzLuyjgwx6LvUN/IQumvAputN2i3zTC+jcTzUx4DwY=;
 b=b4WXALGIPEIsgegZuyHlJncMCZMvlPoI3hSup3MTMVmMte+PTjj9JxPSkAW4AeG1Gx
 D6ZnCjGDEKIgxf2QFJpQ0lv+h6yjIV1Ntiq2EvnQxXdcWn+T3lb6b4WP5x7YskUlVhBO
 u5kO8xozgTO75EhsIM59Pw/H7V67z33Vu60/aV2cvcIsDZqYjeQ1aWCMIgGgOGpq1YIV
 qlbr8uvJVaIwJ7qIejR9zSRAPja1cwfiPE2JxT77G3SZ1WdxEw390kuVt0mXY848bNdh
 r0hXa9y60R4eseBfpZQFYgRAu1OHUU/IWz78zlPDgwOKhqc9NA1hieGL54UV34dcL3tZ
 nPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTzLuyjgwx6LvUN/IQumvAputN2i3zTC+jcTzUx4DwY=;
 b=zVDnRVAxU3W0AD0vUPD7XPt8pca47xFrH6ydwTT35pmHiBdyHu/U1Yfwg/4PkRCpIz
 Mv0wKmS9CiHR9ZFabGkM1hbAbjnBDDJHORS+wK/aQqnExiF9Q6nMpRDmwGGAV8D00ICq
 ljmsBixMTArOjTI/rMvMmmINX6982KUhtR5lNbBaKzRCjPzhBSXPG7ubJWpdGQNfTsts
 eTHv81g0mpUjgc/Tbdhzh0WwzbueuqYcfH/iawxJG59b4GFHb+/njsdYS99pL/Xjm0FJ
 Oax7aufTqPgsr5TC/H34HlaFmAsPMBsiwULKVI7KTRf20k5NIa6aVFqpOVBR3fqH7SxH
 2vKw==
X-Gm-Message-State: AOAM532irbq++KkIZsUz6CgAKQpVtbrMU7HglvaP82xUIAdnZ3sKtePX
 Mz/86gblLyNra29rZCmNwNz37A==
X-Google-Smtp-Source: ABdhPJw4XVwAi+6PbdEKPV/E3Oq+7NUjogn4YmpjFNnc7CBzuwwlxUieus4NUfU25kWXmYtvnpdoCw==
X-Received: by 2002:a05:600c:4783:: with SMTP id
 k3mr2271401wmo.177.1644416699884; 
 Wed, 09 Feb 2022 06:24:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm18778436wrp.61.2022.02.09.06.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBAF71FFD2;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 27/28] linux-user: Remove the deprecated ppc64abi32 target
Date: Wed,  9 Feb 2022 14:15:28 +0000
Message-Id: <20220209141529.3418384-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Message-Id: <20220112112722.3641051-32-alex.bennee@linaro.org>

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 47a594a3b6..25b1fb8677 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -403,13 +403,6 @@ The above, converted to the current supported format::
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
index b0156e0f25..cb0575fd49 100644
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
 TCG introspection features
 --------------------------
 
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
index dfb9019b24..3a29eff5cc 100755
--- a/configure
+++ b/configure
@@ -1252,8 +1252,6 @@ if eval test -z "\${cross_cc_$cpu}"; then
 fi
 
 default_target_list=""
-deprecated_targets_list=ppc64abi32-linux-user
-deprecated_features=""
 mak_wilds=""
 
 if [ "$linux_user" != no ]; then
@@ -1281,16 +1279,6 @@ if [ "$bsd_user" = "yes" ]; then
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
@@ -1309,11 +1297,9 @@ Standard options:
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
@@ -1797,13 +1783,6 @@ else
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
@@ -3830,12 +3809,6 @@ else
   fi
 fi
 
-if test -n "${deprecated_features}"; then
-    echo "Warning, deprecated features enabled."
-    echo "Please see docs/about/deprecated.rst"
-    echo "  features: ${deprecated_features}"
-fi
-
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
 #!/bin/sh
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
index 78607effe8..4587b62ac9 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1558,7 +1558,7 @@ struct target_stat64 {
 struct target_stat {
 	abi_ulong st_dev;
 	abi_ulong st_ino;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
+#if defined(TARGET_PPC64)
 	abi_ulong st_nlink;
 	unsigned int st_mode;
 #else
@@ -1579,12 +1579,12 @@ struct target_stat {
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
index 99829faf89..9628a38361 100644
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


