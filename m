Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA45747F6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:12:13 +0200 (CEST)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oButI-0005Sq-BC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujn-00050s-Vt
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujl-0005uO-LA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fX03v0kOkH7rjZboIn4udYC6Bm8zLRFu9JPvkv7s92s=;
 b=dr98QUMLzqy5x/ecMJbL8/DuI7APbcNE5FnYIwtOTV2CZ1lNsD921AjE+rFwln+VoHQ9BZ
 Naud8clZ+yjBqpXyMW6PRLxKhyhHZHsBTG3kQKzUL4H0T8q81pbb4bzC5OHRjRpcbVSiv0
 iiZqPBikPgL8lJrLao4jdfzgg9zP0f8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77--iWUFzGwOOKGq5lizLeVCA-1; Thu, 14 Jul 2022 05:02:19 -0400
X-MC-Unique: -iWUFzGwOOKGq5lizLeVCA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so1098907edc.20
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fX03v0kOkH7rjZboIn4udYC6Bm8zLRFu9JPvkv7s92s=;
 b=oJ4eH9ZBNp9dog1SCnul2RF5RTOne0oIiMTWtEHcibrGYPmXhqY4DA7aalWSLP4GYI
 /9GgCmLtSpuJLnQWWHVb9kXgN9JaTgwmz9yYuPkIgBMPO22K/l28XTOFRzeVfmZE4Pph
 LS6sjOpnJcKa7pdq67o1p7xrZMER54dOzS6w8LH8UhYt62tk0ZEAoqWyDA5wjlj+QaWK
 OmNiFuU2t48nix94so2hggkabUvzD4LBGACC6RjsIO21//kvCpzeV/qfYDIkfm51RNOa
 8Bu/9rX6Ln3IU+azItEbTTQ46pUY6dkFnfEnASOpL3/3ntHZfqTjWebbWuRjaPLIOeBZ
 8Wxw==
X-Gm-Message-State: AJIora9v081t0+opqcBKVx6TFfdte3PzqzSJWR+fwN8IPNSl+qggQRWJ
 afb1piuYHBFnhtjB3eQR2ng7DF4u0ePEcQzIstpyndzOX/8nuXIDOAP3NxXuxblc+mpJ54o/lYc
 q40NIZh6UCd6re9VJO99G1eF/0/cQI4vM0T7/6quOqJ9qTKIK92KtHJg6l8tN71OIDwA=
X-Received: by 2002:a05:6402:42c8:b0:43a:a1ee:a097 with SMTP id
 i8-20020a05640242c800b0043aa1eea097mr10826056edc.150.1657789337772; 
 Thu, 14 Jul 2022 02:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t8mcBP6RVEwVkjfl0g6SDFObhG/kl39YNBjb5ls03fDdfQrUyNAmpr6ZwH4rV+EX/x90MLyA==
X-Received: by 2002:a05:6402:42c8:b0:43a:a1ee:a097 with SMTP id
 i8-20020a05640242c800b0043aa1eea097mr10826026edc.150.1657789337396; 
 Thu, 14 Jul 2022 02:02:17 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170906038600b00711edab7622sm455347eja.40.2022.07.14.02.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 02/20] cutils: Introduce bundle mechanism
Date: Thu, 14 Jul 2022 11:01:53 +0200
Message-Id: <20220714090211.304305-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files in the installation
tree. The build tree will have a new directory, qemu-bundle, to
represent what files the installation tree would have for reference by
the executables.

Note that it abandons compatibility with Windows older than 8. The
extended support for the prior version, 7 ended more than 2 years ago,
and it is unlikely that someone would like to run the latest QEMU on
such an old system.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220624145039.49929-3-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                        |  2 +-
 docs/about/build-platforms.rst  |  2 +-
 include/qemu/cutils.h           | 18 +++++++--
 meson.build                     |  4 ++
 scripts/symlink-install-tree.py | 33 +++++++++++++++++
 util/cutils.c                   | 66 +++++++++++++++++++++++----------
 util/meson.build                |  1 +
 7 files changed, 101 insertions(+), 25 deletions(-)
 create mode 100644 scripts/symlink-install-tree.py

diff --git a/Makefile b/Makefile
index b4feda93c8..13234f2aa4 100644
--- a/Makefile
+++ b/Makefile
@@ -216,7 +216,7 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak
+	rm -f config-host.mak qemu-bundle
 	rm -f tests/tcg/config-*.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 1958edb430..ebde20f981 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -88,7 +88,7 @@ Windows
 
 The project aims to support the two most recent versions of Windows that are
 still supported by the vendor. The minimum Windows API that is currently
-targeted is "Windows 7", so theoretically the QEMU binaries can still be run
+targeted is "Windows 8", so theoretically the QEMU binaries can still be run
 on older versions of Windows, too. However, such old versions of Windows are
 not tested anymore, so it is recommended to use one of the latest versions of
 Windows instead.
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index d3e532b64c..92c436d8c7 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -224,9 +224,21 @@ const char *qemu_get_exec_dir(void);
  * @dir: the directory (typically a `CONFIG_*DIR` variable) to be relocated.
  *
  * Returns a path for @dir that uses the directory of the running executable
- * as the prefix.  For example, if `bindir` is `/usr/bin` and @dir is
- * `/usr/share/qemu`, the function will append `../share/qemu` to the
- * directory that contains the running executable and return the result.
+ * as the prefix.
+ *
+ * When a directory named `qemu-bundle` exists in the directory of the running
+ * executable, the path to the directory will be prepended to @dir. For
+ * example, if the directory of the running executable is `/qemu/build` @dir
+ * is `/usr/share/qemu`, the result will be
+ * `/qemu/build/qemu-bundle/usr/share/qemu`. The directory is expected to exist
+ * in the build tree.
+ *
+ * Otherwise, the directory of the running executable will be used as the
+ * prefix and it appends the relative path from `bindir` to @dir. For example,
+ * if the directory of the running executable is `/opt/qemu/bin`, `bindir` is
+ * `/usr/bin` and @dir is `/usr/share/qemu`, the result will be
+ * `/opt/qemu/bin/../share/qemu`.
+ *
  * The returned string should be freed by the caller.
  */
 char *get_relocated_path(const char *dir);
diff --git a/meson.build b/meson.build
index ad92d288a6..da76edc7c7 100644
--- a/meson.build
+++ b/meson.build
@@ -7,6 +7,8 @@ add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
 add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
 add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
 
+meson.add_postconf_script(find_program('scripts/symlink-install-tree.py'))
+
 not_found = dependency('', required: false)
 keyval = import('keyval')
 ss = import('sourceset')
@@ -356,10 +358,12 @@ nvmm =not_found
 hvf = not_found
 midl = not_found
 widl = not_found
+pathcch = not_found
 host_dsosuf = '.so'
 if targetos == 'windows'
   midl = find_program('midl', required: false)
   widl = find_program('widl', required: false)
+  pathcch = cc.find_library('pathcch')
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
 
diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
new file mode 100644
index 0000000000..a5bf0b0d6d
--- /dev/null
+++ b/scripts/symlink-install-tree.py
@@ -0,0 +1,33 @@
+#!/usr/bin/env python3
+
+from pathlib import PurePath
+import errno
+import json
+import os
+import subprocess
+import sys
+
+def destdir_join(d1: str, d2: str) -> str:
+    if not d1:
+        return d2
+    # c:\destdir + c:\prefix must produce c:\destdir\prefix
+    return str(PurePath(d1, *PurePath(d2).parts[1:]))
+
+introspect = os.environ.get('MESONINTROSPECT')
+out = subprocess.run([*introspect.split(' '), '--installed'],
+                     stdout=subprocess.PIPE, check=True).stdout
+for source, dest in json.loads(out).items():
+    assert os.path.isabs(source)
+    bundle_dest = destdir_join('qemu-bundle', dest)
+    path = os.path.dirname(bundle_dest)
+    try:
+        os.makedirs(path, exist_ok=True)
+    except BaseException as e:
+        print(f'error making directory {path}', file=sys.stderr)
+        raise e
+    try:
+        os.symlink(source, bundle_dest)
+    except BaseException as e:
+        if not isinstance(e, OSError) or e.errno != errno.EEXIST:
+            print(f'error making symbolic link {dest}', file=sys.stderr)
+            raise e
diff --git a/util/cutils.c b/util/cutils.c
index 6d04e52907..8199dac598 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -35,6 +35,11 @@
 #include <sys/sysctl.h>
 #endif
 
+#ifdef G_OS_WIN32
+#include <pathcch.h>
+#include <wchar.h>
+#endif
+
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
@@ -1074,31 +1079,52 @@ char *get_relocated_path(const char *dir)
 
     /* Fail if qemu_init_exec_dir was not called.  */
     assert(exec_dir[0]);
-    if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
-        return g_strdup(dir);
-    }
 
     result = g_string_new(exec_dir);
+    g_string_append(result, "/qemu-bundle");
+    if (access(result->str, R_OK) == 0) {
+#ifdef G_OS_WIN32
+        size_t size = mbsrtowcs(NULL, &dir, 0, &(mbstate_t){0}) + 1;
+        PWSTR wdir = g_new(WCHAR, size);
+        mbsrtowcs(wdir, &dir, size, &(mbstate_t){0});
 
-    /* Advance over common components.  */
-    len_dir = len_bindir = prefix_len;
-    do {
-        dir += len_dir;
-        bindir += len_bindir;
-        dir = next_component(dir, &len_dir);
-        bindir = next_component(bindir, &len_bindir);
-    } while (len_dir && len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
+        PCWSTR wdir_skipped_root;
+        PathCchSkipRoot(wdir, &wdir_skipped_root);
 
-    /* Ascend from bindir to the common prefix with dir.  */
-    while (len_bindir) {
-        bindir += len_bindir;
-        g_string_append(result, "/..");
-        bindir = next_component(bindir, &len_bindir);
+        size = wcsrtombs(NULL, &wdir_skipped_root, 0, &(mbstate_t){0});
+        char *cursor = result->str + result->len;
+        g_string_set_size(result, result->len + size);
+        wcsrtombs(cursor, &wdir_skipped_root, size + 1, &(mbstate_t){0});
+        g_free(wdir);
+#else
+        g_string_append(result, dir);
+#endif
+    } else if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
+        g_string_assign(result, dir);
+    } else {
+        g_string_assign(result, exec_dir);
+
+        /* Advance over common components.  */
+        len_dir = len_bindir = prefix_len;
+        do {
+            dir += len_dir;
+            bindir += len_bindir;
+            dir = next_component(dir, &len_dir);
+            bindir = next_component(bindir, &len_bindir);
+        } while (len_dir && len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
+
+        /* Ascend from bindir to the common prefix with dir.  */
+        while (len_bindir) {
+            bindir += len_bindir;
+            g_string_append(result, "/..");
+            bindir = next_component(bindir, &len_bindir);
+        }
+
+        if (*dir) {
+            assert(G_IS_DIR_SEPARATOR(dir[-1]));
+            g_string_append(result, dir - 1);
+        }
     }
 
-    if (*dir) {
-        assert(G_IS_DIR_SEPARATOR(dir[-1]));
-        g_string_append(result, dir - 1);
-    }
     return g_string_free(result, false);
 }
diff --git a/util/meson.build b/util/meson.build
index 8cce8f8968..5e282130df 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -23,6 +23,7 @@ util_ss.add(when: 'CONFIG_WIN32', if_true: files('event_notifier-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('oslib-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('qemu-thread-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: winmm)
+util_ss.add(when: 'CONFIG_WIN32', if_true: pathcch)
 util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
-- 
2.36.1



