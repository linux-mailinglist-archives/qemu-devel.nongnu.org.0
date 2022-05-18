Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686A52B5A3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:17:57 +0200 (CEST)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFoZ-0000qh-RF
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbz-0008Fy-J1
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004NQ-5D
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akAoBwwSWaFULFcDYz2V0O+8vn45H8TDz8aOJOkcGk8=;
 b=VEtMXJpdSb1C8xudob2ZAxqi2NiuISFL28uqDWrbE7u4Jn7pbFgd4JZT7S2vKW4y7ggPzB
 TCFQNpq2XW4ts8hY6eoqfVmU+njaNOdN0bqsXQXhX2a8BwDAZMfM0hTRkaudWqSE4f3iAF
 yovscHdeblMDXOkoiAVn9P4fsWbLz4M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-lWSnxpgpOYGSivYUeBEtEg-1; Wed, 18 May 2022 05:04:46 -0400
X-MC-Unique: lWSnxpgpOYGSivYUeBEtEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ED7880B718;
 Wed, 18 May 2022 09:04:46 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18BA11410DD5;
 Wed, 18 May 2022 09:04:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 8/8] capstone: Remove the capstone submodule
Date: Wed, 18 May 2022 11:04:38 +0200
Message-Id: <20220518090438.158475-9-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we allow compiling with Capstone v3.0.5 again, all our supported
build hosts should provide at least this version of the disassembler
library, so we do not need to ship this as a submodule anymore.

Message-Id: <20220516145823.148450-4-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                     |  21 -------
 meson.build                   | 113 ++--------------------------------
 .gitlab-ci.d/buildtest.yml    |   4 +-
 .gitlab-ci.d/windows.yml      |   5 +-
 .gitmodules                   |   3 -
 capstone                      |   1 -
 meson_options.txt             |   3 +-
 scripts/meson-buildoptions.sh |   5 +-
 8 files changed, 11 insertions(+), 144 deletions(-)
 delete mode 160000 capstone

diff --git a/configure b/configure
index 103a7b02e8..180ee688dc 100755
--- a/configure
+++ b/configure
@@ -307,10 +307,8 @@ skip_meson=no
 
 # 1. Track which submodules are needed
 if test "$default_feature" = no ; then
-  capstone="disabled"
   slirp="disabled"
 else
-  capstone="auto"
   slirp="auto"
 fi
 fdt="auto"
@@ -869,14 +867,6 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --disable-capstone) capstone="disabled"
-  ;;
-  --enable-capstone) capstone="enabled"
-  ;;
-  --enable-capstone=git) capstone="internal"
-  ;;
-  --enable-capstone=*) capstone="$optarg"
-  ;;
   --with-git=*) git="$optarg"
   ;;
   --with-git-submodules=*)
@@ -1566,16 +1556,6 @@ case "$fdt" in
     ;;
 esac
 
-##########################################
-# capstone
-
-case "$capstone" in
-  auto | enabled | internal)
-    # Simpler to always update submodule, even if not needed.
-    git_submodules="${git_submodules} capstone"
-    ;;
-esac
-
 ##########################################
 # check and set a backend for coroutine
 
@@ -2220,7 +2200,6 @@ if test "$skip_meson" = no; then
   test "$werror" = yes && meson_option_add -Dwerror=true
 
   # QEMU options
-  test "$capstone" != auto && meson_option_add "-Dcapstone=$capstone"
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
   test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
diff --git a/meson.build b/meson.build
index 526ff29a86..c4fb8fa5d0 100644
--- a/meson.build
+++ b/meson.build
@@ -2522,13 +2522,10 @@ genh += custom_target('config-poison.h',
 ##############
 
 capstone = not_found
-capstone_opt = get_option('capstone')
-if capstone_opt in ['enabled', 'auto', 'system']
-  have_internal = fs.exists(meson.current_source_dir() / 'capstone/Makefile')
+if not get_option('capstone').auto() or have_system or have_user
   capstone = dependency('capstone', version: '>=3.0.5',
                         kwargs: static_kwargs, method: 'pkg-config',
-                        required: capstone_opt == 'system' or
-                                  capstone_opt == 'enabled' and not have_internal)
+                        required: get_option('capstone'))
 
   # Some versions of capstone have broken pkg-config file
   # that reports a wrong -I path, causing the #include to
@@ -2537,110 +2534,10 @@ if capstone_opt in ['enabled', 'auto', 'system']
   if capstone.found() and not cc.compiles('#include <capstone.h>',
                                           dependencies: [capstone])
     capstone = not_found
-    if capstone_opt == 'system'
-      error('system capstone requested, it does not appear to work')
+    if get_option('capstone').enabled()
+      error('capstone requested, but it does not appear to work')
     endif
   endif
-
-  if capstone.found()
-    capstone_opt = 'system'
-  elif have_internal
-    capstone_opt = 'internal'
-  else
-    capstone_opt = 'disabled'
-  endif
-endif
-if capstone_opt == 'internal'
-  capstone_data = configuration_data()
-  capstone_data.set('CAPSTONE_USE_SYS_DYN_MEM', '1')
-
-  capstone_files = files(
-    'capstone/cs.c',
-    'capstone/MCInst.c',
-    'capstone/MCInstrDesc.c',
-    'capstone/MCRegisterInfo.c',
-    'capstone/SStream.c',
-    'capstone/utils.c'
-  )
-
-  if 'CONFIG_ARM_DIS' in config_all_disas
-    capstone_data.set('CAPSTONE_HAS_ARM', '1')
-    capstone_files += files(
-      'capstone/arch/ARM/ARMDisassembler.c',
-      'capstone/arch/ARM/ARMInstPrinter.c',
-      'capstone/arch/ARM/ARMMapping.c',
-      'capstone/arch/ARM/ARMModule.c'
-    )
-  endif
-
-  # FIXME: This config entry currently depends on a c++ compiler.
-  # Which is needed for building libvixl, but not for capstone.
-  if 'CONFIG_ARM_A64_DIS' in config_all_disas
-    capstone_data.set('CAPSTONE_HAS_ARM64', '1')
-    capstone_files += files(
-      'capstone/arch/AArch64/AArch64BaseInfo.c',
-      'capstone/arch/AArch64/AArch64Disassembler.c',
-      'capstone/arch/AArch64/AArch64InstPrinter.c',
-      'capstone/arch/AArch64/AArch64Mapping.c',
-      'capstone/arch/AArch64/AArch64Module.c'
-    )
-  endif
-
-  if 'CONFIG_PPC_DIS' in config_all_disas
-    capstone_data.set('CAPSTONE_HAS_POWERPC', '1')
-    capstone_files += files(
-      'capstone/arch/PowerPC/PPCDisassembler.c',
-      'capstone/arch/PowerPC/PPCInstPrinter.c',
-      'capstone/arch/PowerPC/PPCMapping.c',
-      'capstone/arch/PowerPC/PPCModule.c'
-    )
-  endif
-
-  if 'CONFIG_S390_DIS' in config_all_disas
-    capstone_data.set('CAPSTONE_HAS_SYSZ', '1')
-    capstone_files += files(
-      'capstone/arch/SystemZ/SystemZDisassembler.c',
-      'capstone/arch/SystemZ/SystemZInstPrinter.c',
-      'capstone/arch/SystemZ/SystemZMapping.c',
-      'capstone/arch/SystemZ/SystemZModule.c',
-      'capstone/arch/SystemZ/SystemZMCTargetDesc.c'
-    )
-  endif
-
-  if 'CONFIG_I386_DIS' in config_all_disas
-    capstone_data.set('CAPSTONE_HAS_X86', 1)
-    capstone_files += files(
-      'capstone/arch/X86/X86Disassembler.c',
-      'capstone/arch/X86/X86DisassemblerDecoder.c',
-      'capstone/arch/X86/X86ATTInstPrinter.c',
-      'capstone/arch/X86/X86IntelInstPrinter.c',
-      'capstone/arch/X86/X86InstPrinterCommon.c',
-      'capstone/arch/X86/X86Mapping.c',
-      'capstone/arch/X86/X86Module.c'
-    )
-  endif
-
-  configure_file(output: 'capstone-defs.h', configuration: capstone_data)
-
-  capstone_cargs = [
-    # FIXME: There does not seem to be a way to completely replace the c_args
-    # that come from add_project_arguments() -- we can only add to them.
-    # So: disable all warnings with a big hammer.
-    '-Wno-error', '-w',
-
-    # Include all configuration defines via a header file, which will wind up
-    # as a dependency on the object file, and thus changes here will result
-    # in a rebuild.
-    '-include', 'capstone-defs.h'
-  ]
-
-  libcapstone = static_library('capstone',
-                               build_by_default: false,
-                               sources: capstone_files,
-                               c_args: capstone_cargs,
-                               include_directories: 'capstone/include')
-  capstone = declare_dependency(link_with: libcapstone,
-                                include_directories: 'capstone/include/capstone')
 endif
 
 slirp = not_found
@@ -3970,7 +3867,7 @@ summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': numa}
-summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
+summary_info += {'capstone':          capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
 summary_info += {'libudev':           libudev}
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index a4d43d743b..e9620c3074 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,7 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
-        --enable-capstone=system
+        --enable-capstone
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -119,7 +119,7 @@ build-system-fedora:
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
-             --enable-fdt=system --enable-slirp=system --enable-capstone=system
+             --enable-fdt=system --enable-slirp=system --enable-capstone
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 47f6073773..cf7724b8e5 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -57,7 +57,7 @@ msys2-64bit:
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone=system --without-default-devices'
+      --enable-capstone --without-default-devices'
   - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
   - .\msys64\usr\bin\bash -lc 'make -j2'
   - .\msys64\usr\bin\bash -lc 'make check'
@@ -90,7 +90,6 @@ msys2-32bit:
   - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu
-      --enable-capstone=system"
+  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
   - ..\msys64\usr\bin\bash -lc 'make -j2'
   - ..\msys64\usr\bin\bash -lc 'make check'
diff --git a/.gitmodules b/.gitmodules
index f4b6a9b401..b8bff47df8 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -31,9 +31,6 @@
 [submodule "ui/keycodemapdb"]
 	path = ui/keycodemapdb
 	url = https://gitlab.com/qemu-project/keycodemapdb.git
-[submodule "capstone"]
-	path = capstone
-	url = https://gitlab.com/qemu-project/capstone.git
 [submodule "roms/seabios-hppa"]
 	path = roms/seabios-hppa
 	url = https://gitlab.com/qemu-project/seabios-hppa.git
diff --git a/capstone b/capstone
deleted file mode 160000
index f8b1b83301..0000000000
--- a/capstone
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
diff --git a/meson_options.txt b/meson_options.txt
index 29c6b90cec..fcdc43f7db 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -252,8 +252,7 @@ option('virtfs', type: 'feature', value: 'auto',
 option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
 
-option('capstone', type: 'combo', value: 'auto',
-       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
+option('capstone', type: 'feature', value: 'auto',
        description: 'Whether and how to find the capstone library')
 option('slirp', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 5d2172bfb4..7fc56d3f4a 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -16,9 +16,6 @@ meson_options_help() {
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
   printf "%s\n" '                           use block whitelist also in tools instead of only'
   printf "%s\n" '                           QEMU'
-  printf "%s\n" '  --enable-capstone[=CHOICE]'
-  printf "%s\n" '                           Whether and how to find the capstone library'
-  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
@@ -77,6 +74,7 @@ meson_options_help() {
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
   printf "%s\n" '  cap-ng          cap_ng support'
+  printf "%s\n" '  capstone        Whether and how to find the capstone library'
   printf "%s\n" '  cloop           cloop image format support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
@@ -209,7 +207,6 @@ _meson_option_parse() {
     --disable-cap-ng) printf "%s" -Dcap_ng=disabled ;;
     --enable-capstone) printf "%s" -Dcapstone=enabled ;;
     --disable-capstone) printf "%s" -Dcapstone=disabled ;;
-    --enable-capstone=*) quote_sh "-Dcapstone=$2" ;;
     --enable-cfi) printf "%s" -Dcfi=true ;;
     --disable-cfi) printf "%s" -Dcfi=false ;;
     --enable-cfi-debug) printf "%s" -Dcfi_debug=true ;;
-- 
2.27.0


