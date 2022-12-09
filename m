Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C156481E9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:43:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bX7-0005rJ-QW; Fri, 09 Dec 2022 06:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bW3-0004gl-Fh
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVp-0001Z6-RL
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZ9ZXklDjX5+p2BH+atkHNrEIUqXaenKUpdY1uzmlM8=;
 b=fAZ8mWKQM04dNBSMzQNZ/lsBQQZF13aYHzUYLJAa0BCCmUcQ6z8NIQEvGnvnFxj43mHtEZ
 voEIiqJ83o9oys+QcKujSbGAnsU4qonWIWlGyj7037ckkX0wi04yrgtwmNOvK/nW+ulM22
 7h6ljAcldZTJypudX1X02sILKhHnIDQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183--7Byw8FwMoSFnGmyFZm3cQ-1; Fri, 09 Dec 2022 06:25:40 -0500
X-MC-Unique: -7Byw8FwMoSFnGmyFZm3cQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hp16-20020a1709073e1000b007adf5a83df7so2910129ejc.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZ9ZXklDjX5+p2BH+atkHNrEIUqXaenKUpdY1uzmlM8=;
 b=qOEzGrmeCRfwmJMZIArr7HByT0rpf4kNpWAWxXaDEZAPAT25oSMxxWQ+ekWe8G91zw
 SnOc+aPM9A/KkADOEq7pZ21m2V2T+HG8rgsCew9Cesh54scA90Fe/iWKweLGLebCrPDW
 Hd82k+XXdxFrQTBPGExR+x5xZAXytisqrFV7CtxJXK0lNNG2lzdwxck5eRkoy5AZ0mY0
 28UQ9M+Zhpxh2FI0J2lo23xBmtOHeqoRqv9Q9FCdsyN2yJ5ikvEMZDE8+l4yxspkgBCO
 dxvcV/t9ayjMUL+v+QD0GS+ibWU+aBnI27U6n5pjs5sEVHYYsQqgdS9+uLWz7nhuSu/x
 CZPw==
X-Gm-Message-State: ANoB5plfgQ9colSsb7ujw3e41PzSxmDl3ya3xTmzno30fyhH0uaNz7BO
 o9F3Iqw2RN2tWk94E9gCwSMxyNPI8iQV10a6NtnccczNx8URA7AqqVibXEnzG0eJ79DzUsCKo2p
 ozrssxYcyE0K2tBtgYkuLxSfsmplRbKPA5aT2PF2hWIGXlvxXivWOFjyzcqRjhO8KVTU=
X-Received: by 2002:a17:906:4dc9:b0:7c1:6fc:6048 with SMTP id
 f9-20020a1709064dc900b007c106fc6048mr4310042ejw.24.1670585138607; 
 Fri, 09 Dec 2022 03:25:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6SqpPVXRnwKkP3GsvItdgQQzPQMs77kcmKrqLSzrTdMH9KsOiJP8pNajaDHm6o0hYQ1y8Zxg==
X-Received: by 2002:a17:906:4dc9:b0:7c1:6fc:6048 with SMTP id
 f9-20020a1709064dc900b007c106fc6048mr4310022ejw.24.1670585138065; 
 Fri, 09 Dec 2022 03:25:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170906960400b007be2687186fsm456348ejx.21.2022.12.09.03.25.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/30] build: move warning flag selection to meson
Date: Fri,  9 Dec 2022 12:24:04 +0100
Message-Id: <20221209112409.184703-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Meson already knows to test with the positive form of the flag, which
simplifies the test.  Warnings are now tested explicitly for the C++
compiler, instead of hardcoding those that are only available for
the C language.

At this point all compiler flags in QEMU_CFLAGS are global and only
depend on the OS.  No feature tests are performed in configure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                | 94 ----------------------------------------
 contrib/plugins/Makefile |  3 +-
 meson.build              | 72 ++++++++++++++++++++----------
 3 files changed, 51 insertions(+), 118 deletions(-)

diff --git a/configure b/configure
index 5d31294f316f..6df61f4337e4 100755
--- a/configure
+++ b/configure
@@ -75,7 +75,6 @@ fi
 TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
-TMPM="${TMPDIR1}/${TMPB}.m"
 TMPE="${TMPDIR1}/${TMPB}.exe"
 
 rm -f config.log
@@ -157,15 +156,6 @@ do_cc() {
     do_compiler_werror "$cc" $CPU_CFLAGS "$@"
 }
 
-do_objc() {
-    do_compiler_werror "$objcc" $CPU_CFLAGS "$@"
-}
-
-# Append $2 to the variable named $1, with space separation
-add_to() {
-    eval $1=\${$1:+\"\$$1 \"}\$2
-}
-
 compile_object() {
   local_cflags="$1"
   do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
@@ -1091,89 +1081,6 @@ if ! compile_prog "" "" ; then
     error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
 fi
 
-# Accumulate -Wfoo and -Wno-bar separately.
-# We will list all of the enable flags first, and the disable flags second.
-# Note that we do not add -Werror, because that would enable it for all
-# configure tests. If a configure test failed due to -Werror this would
-# just silently disable some features, so it's too error prone.
-
-warn_flags=
-add_to warn_flags -Wundef
-add_to warn_flags -Wwrite-strings
-add_to warn_flags -Wmissing-prototypes
-add_to warn_flags -Wstrict-prototypes
-add_to warn_flags -Wredundant-decls
-add_to warn_flags -Wold-style-declaration
-add_to warn_flags -Wold-style-definition
-add_to warn_flags -Wtype-limits
-add_to warn_flags -Wformat-security
-add_to warn_flags -Wformat-y2k
-add_to warn_flags -Winit-self
-add_to warn_flags -Wignored-qualifiers
-add_to warn_flags -Wempty-body
-add_to warn_flags -Wnested-externs
-add_to warn_flags -Wendif-labels
-add_to warn_flags -Wexpansion-to-defined
-add_to warn_flags -Wimplicit-fallthrough=2
-
-nowarn_flags=
-add_to nowarn_flags -Wno-initializer-overrides
-add_to nowarn_flags -Wno-missing-include-dirs
-add_to nowarn_flags -Wno-shift-negative-value
-add_to nowarn_flags -Wno-string-plus-int
-add_to nowarn_flags -Wno-typedef-redefinition
-add_to nowarn_flags -Wno-tautological-type-limit-compare
-add_to nowarn_flags -Wno-psabi
-add_to nowarn_flags -Wno-gnu-variable-sized-type-not-at-end
-
-gcc_flags="$warn_flags $nowarn_flags"
-
-cc_has_warning_flag() {
-    write_c_skeleton;
-
-    # Use the positive sense of the flag when testing for -Wno-wombat
-    # support (gcc will happily accept the -Wno- form of unknown
-    # warning options).
-    optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
-    compile_prog "-Werror $optflag" ""
-}
-
-objcc_has_warning_flag() {
-    cat > $TMPM <<EOF
-int main(void) { return 0; }
-EOF
-
-    # Use the positive sense of the flag when testing for -Wno-wombat
-    # support (gcc will happily accept the -Wno- form of unknown
-    # warning options).
-    optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
-    do_objc -Werror $optflag \
-      $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
-      -o $TMPE $TMPM
-}
-
-for flag in $gcc_flags; do
-    if cc_has_warning_flag $flag ; then
-        QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-    fi
-    if objcc_has_warning_flag $flag ; then
-        QEMU_OBJCFLAGS="$QEMU_OBJCFLAGS $flag"
-    fi
-done
-
-# Disable -Wmissing-braces on older compilers that warn even for
-# the "universal" C zero initializer {0}.
-cat > $TMPC << EOF
-struct {
-  int a[2];
-} x = {0};
-EOF
-if compile_object "-Werror" "" ; then
-  :
-else
-  QEMU_CFLAGS="$QEMU_CFLAGS -Wno-missing-braces"
-fi
-
 # Resolve default for --enable-plugins
 if test "$static" = "yes" ; then
   if test "$plugins" = "yes"; then
@@ -1928,7 +1835,6 @@ echo "NINJA=$ninja" >> $config_host_mak
 echo "PKG_CONFIG=${pkg_config_exe}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
-echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 8a316cd76f2f..b2b9db9f51af 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -27,8 +27,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
 CFLAGS := $(shell $(PKG_CONFIG) --cflags glib-2.0)
-CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
-CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
+CFLAGS += -fPIC -Wall
 CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
diff --git a/meson.build b/meson.build
index c5a8dce9e1d6..4ec8104b73a3 100644
--- a/meson.build
+++ b/meson.build
@@ -190,16 +190,8 @@ endif
 # Compiler flags #
 ##################
 
-qemu_common_flags = []
+qemu_common_flags = config_host['QEMU_CFLAGS'].split()
 qemu_cflags = []
-foreach arg : config_host['QEMU_CFLAGS'].split()
-  if arg.startswith('-W')
-    qemu_cflags += arg
-  else
-    qemu_common_flags += arg
-  endif
-endforeach
-qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = []
 
 if get_option('gprof')
@@ -380,20 +372,49 @@ endif
 add_global_arguments(qemu_common_flags, native: false, language: all_languages)
 add_global_link_arguments(qemu_ldflags, native: false, language: all_languages)
 
+# Collect warnings that we want to enable
+
+warn_flags = [
+  '-Wundef',
+  '-Wwrite-strings',
+  '-Wmissing-prototypes',
+  '-Wstrict-prototypes',
+  '-Wredundant-decls',
+  '-Wold-style-declaration',
+  '-Wold-style-definition',
+  '-Wtype-limits',
+  '-Wformat-security',
+  '-Wformat-y2k',
+  '-Winit-self',
+  '-Wignored-qualifiers',
+  '-Wempty-body',
+  '-Wnested-externs',
+  '-Wendif-labels',
+  '-Wexpansion-to-defined',
+  '-Wimplicit-fallthrough=2',
+  '-Wno-initializer-overrides',
+  '-Wno-missing-include-dirs',
+  '-Wno-shift-negative-value',
+  '-Wno-string-plus-int',
+  '-Wno-typedef-redefinition',
+  '-Wno-tautological-type-limit-compare',
+  '-Wno-psabi',
+  '-Wno-gnu-variable-sized-type-not-at-end',
+]
+
+if not cc.compiles('''
+  struct {
+    int a[2];
+  } x = {0};''', args: ['-Werror'])
+  warn_flags += ['-Wno-missing-braces']
+endif
+
 # Check that the C++ compiler exists and works with the C compiler.
 link_language = 'c'
 linker = cc
 qemu_cxxflags = []
 if 'cpp' in all_languages
-  add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS', '-D__STDC_FORMAT_MACROS'],
-                       native: false, language: 'cpp')
-  foreach k: qemu_cflags
-    if k not in ['-Wstrict-prototypes', '-Wmissing-prototypes', '-Wnested-externs',
-                 '-Wold-style-declaration', '-Wold-style-definition', '-Wredundant-decls']
-      qemu_cxxflags += [k]
-    endif
-  endforeach
-
+  qemu_cxxflags = ['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS', '-D__STDC_FORMAT_MACROS'] + qemu_cflags
   if cxx.links(files('scripts/main.c'), args: qemu_cflags)
     link_language = 'cpp'
     linker = cxx
@@ -413,9 +434,16 @@ if get_option('optimization') != '0' and targetos == 'linux'
   endif
 endif
 
-add_project_arguments(qemu_cflags, native: false, language: 'c')
-add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
-add_project_arguments(qemu_objcflags, native: false, language: 'objc')
+add_project_arguments(qemu_cflags, native: false, language: 'objc')
+add_project_arguments(cc.get_supported_arguments(warn_flags), native: false, language: 'c')
+if 'cpp' in all_languages
+  add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
+  add_project_arguments(cxx.get_supported_arguments(warn_flags), native: false, language: 'cpp')
+endif
+if 'objc' in all_languages
+  # Note sanitizer flags are not applied to Objective-C sources!
+  add_project_arguments(objc.get_supported_arguments(warn_flags), native: false, language: 'objc')
+endif
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
                         '-isystem', 'linux-headers',
@@ -3927,7 +3955,7 @@ if 'cpp' in all_languages
   summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_common_flags + qemu_cxxflags)}
 endif
 if 'objc' in all_languages
-  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags + qemu_objcflags)}
+  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags)}
 endif
 summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
 summary_info += {'profiler':          get_option('profiler')}
-- 
2.38.1


