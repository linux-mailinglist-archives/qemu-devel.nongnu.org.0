Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597C05747E6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:11:04 +0200 (CEST)
Received: from localhost ([::1]:58066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBusB-0004FF-6b
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujt-00056F-Dd
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujn-0005ub-RG
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuZojlBvMJHakpry/pxYzjDQngsN2NNKxuawl1RMhPU=;
 b=iHYtwsfbdZJc7i2ec8P78jXYDcqKSrQUqmCfyjjhvty89NcrZUOdqxLRpsKRGpp4o1NAXb
 Ug5ivHRnbiO8CGkJBrsPMXVxwfCVXDw4RpjFInI5dwpM2O6bQ7wl86GvR1DOnGWE1uPcKH
 uF58QVFxra1neEIO4CXIHUr9TRglodE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-MqQ9yY68N96reyfVW6TU0g-1; Thu, 14 Jul 2022 05:02:21 -0400
X-MC-Unique: MqQ9yY68N96reyfVW6TU0g-1
Received: by mail-ej1-f70.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso507962ejj.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PuZojlBvMJHakpry/pxYzjDQngsN2NNKxuawl1RMhPU=;
 b=3YBy/JZ0bsfg7+u2LbN0PBQtsyrwqHeZ4Jz1ZvRmhNkl+6iLbor24HRr51+So4ihsu
 2ger11Oe3FJoHMq2RLGQLqQtGuROF/50e1wApDRryRmPH1x7oKui4JvHNWMb44DDkYx7
 vIgvoDTbSUnkJyTQtR7IquekjF7G93Wwk40DHQNbmCgbN8btoSEGEdn/9JSSASLiCLW6
 RGahnYHqE2kc3b4gymuMKG+Irw55d4jGTtFTgW6zeaXeuYo3Al2HaIIboRwH2fe6AvME
 ptY6K3n2RGyP/j/48Ckj3cZhK65vCgZYMMnlQvRRAKd2WOhh909LjhmfCrW7ecWaBmYS
 WkCw==
X-Gm-Message-State: AJIora/sR4CcNdF7jYSpd/vIoKOUIfq6SODcxshTUhwXafSvUpuaSDQ4
 jVMA63CXVrISekVbExJqRggTR/dTuONFFOk/LN00VkVmBrtt7yZJpXYSzvOauH8wn92m5Houd0r
 e9+Yz8WMX8Ebmg3vYBv/yvJ4DBVPJajfx5anBRPvgIZ+fhzq8RiDG2RtsqzqaoxN/o5s=
X-Received: by 2002:a17:906:4786:b0:722:e5ac:7d96 with SMTP id
 cw6-20020a170906478600b00722e5ac7d96mr8071565ejc.172.1657789339587; 
 Thu, 14 Jul 2022 02:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1szn6ZZSS89yyjVTCMqwCayjt6Bl/sdpOAXFSd9CezXduDrr0t9lwp//DH9/CE4P2bVlVjq5A==
X-Received: by 2002:a17:906:4786:b0:722:e5ac:7d96 with SMTP id
 cw6-20020a170906478600b00722e5ac7d96mr8071538ejc.172.1657789339218; 
 Thu, 14 Jul 2022 02:02:19 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1709063d2900b00722f66fb36csm447677ejf.112.2022.07.14.02.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 03/20] datadir: Use bundle mechanism
Date: Thu, 14 Jul 2022 11:01:54 +0200
Message-Id: <20220714090211.304305-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

softmmu/datadir.c had its own implementation to find files in the
build tree, but now bundle mechanism provides the unified
implementation which works for datadir and the other files.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220624145039.49929-4-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .travis.yml                 |  2 +-
 pc-bios/keymaps/meson.build | 21 ++++++---------------
 pc-bios/meson.build         | 13 +++----------
 scripts/oss-fuzz/build.sh   |  8 ++++----
 softmmu/datadir.c           | 22 +---------------------
 tests/qtest/fuzz/fuzz.c     | 18 ------------------
 6 files changed, 15 insertions(+), 69 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 9afc4a54b8..4fdc9a6785 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -223,7 +223,7 @@ jobs:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
         - |
           if [ "$BUILD_RC" -eq 0 ] ; then
-              mv pc-bios/s390-ccw/*.img pc-bios/ ;
+              mv pc-bios/s390-ccw/*.img qemu-bundle/usr/local/share/qemu ;
               ${TEST_CMD} ;
           else
               $(exit $BUILD_RC);
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 44247a12b5..2837eb34f4 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -40,9 +40,9 @@ else
 endif
 cp = find_program('cp')
 
-t = []
-foreach km, args: keymaps
-  if native_qemu_keymap.found()
+if native_qemu_keymap.found()
+  t = []
+  foreach km, args: keymaps
     # generate with qemu-kvm
     t += custom_target(km,
                        build_by_default: true,
@@ -50,20 +50,11 @@ foreach km, args: keymaps
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
                        install: true,
                        install_dir: qemu_datadir / 'keymaps')
-  else
-    # copy from source tree
-    t += custom_target(km,
-                       build_by_default: true,
-                       input: km,
-                       output: km,
-                       command: [cp, '@INPUT@', '@OUTPUT@'],
-                       install: true,
-                       install_dir: qemu_datadir / 'keymaps')
-  endif
-endforeach
+  endforeach
 
-if native_qemu_keymap.found()
   alias_target('update-keymaps', t)
+else
+  install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
 install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 41ba1c0ec7..388e0db6e4 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -85,16 +85,9 @@ blobs = [
   'vof-nvram.bin',
 ]
 
-ln_s = [find_program('ln', required: true), '-sf']
-foreach f : blobs
-  roms += custom_target(f,
-                build_by_default: have_system,
-                output: f,
-                input: files('meson.build'),            # dummy input
-                install: get_option('install_blobs'),
-                install_dir: qemu_datadir,
-                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
-endforeach
+if get_option('install_blobs')
+  install_data(blobs, install_dir: qemu_datadir)
+endif
 
 subdir('descriptors')
 subdir('keymaps')
diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index aaf485cb55..2656a89aea 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -64,7 +64,7 @@ mkdir -p "$DEST_DIR/lib/"  # Copy the shared libraries here
 
 # Build once to get the list of dynamic lib paths, and copy them over
 ../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
-    --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
+    --prefix="/opt/qemu-oss-fuzz" \
     --extra-cflags="$EXTRA_CFLAGS" --target-list="i386-softmmu"
 
 if ! make "-j$(nproc)" qemu-fuzz-i386; then
@@ -81,14 +81,14 @@ if [ "$GITLAB_CI" != "true" ]; then
 
     # Build a second time to build the final binary with correct rpath
     ../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
-        --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
+        --prefix="/opt/qemu-oss-fuzz" \
         --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="-Wl,-rpath,\$ORIGIN/lib" \
         --target-list="i386-softmmu"
     make "-j$(nproc)" qemu-fuzz-i386 V=1
 fi
 
-# Copy over the datadir
-cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
+# Prepare a preinstalled tree
+make install DESTDIR=$DEST_DIR/qemu-bundle
 
 targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a..697cffea93 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -83,26 +83,6 @@ void qemu_add_data_dir(char *path)
     data_dir[data_dir_idx++] = path;
 }
 
-/*
- * Find a likely location for support files using the location of the binary.
- * When running from the build tree this will be "$bindir/pc-bios".
- * Otherwise, this is CONFIG_QEMU_DATADIR (possibly relocated).
- *
- * The caller must use g_free() to free the returned data when it is
- * no longer required.
- */
-static char *find_datadir(void)
-{
-    g_autofree char *dir = NULL;
-
-    dir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
-    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-        return g_steal_pointer(&dir);
-    }
-
-    return get_relocated_path(CONFIG_QEMU_DATADIR);
-}
-
 void qemu_add_default_firmwarepath(void)
 {
     char **dirs;
@@ -116,7 +96,7 @@ void qemu_add_default_firmwarepath(void)
     g_strfreev(dirs);
 
     /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
+    qemu_add_data_dir(get_relocated_path(CONFIG_QEMU_DATADIR));
 }
 
 void qemu_list_data_dirs(void)
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 0ad4ba9e94..2b3bc1fb9d 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -158,8 +158,6 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
 {
 
     char *target_name;
-    const char *bindir;
-    char *datadir;
     GString *cmd_line;
     gchar *pretty_cmd_line;
     bool serialize = false;
@@ -174,22 +172,6 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     target_name = strstr(**argv, "-target-");
     if (target_name) {        /* The binary name specifies the target */
         target_name += strlen("-target-");
-        /*
-         * With oss-fuzz, the executable is kept in the root of a directory (we
-         * cannot assume the path). All data (including bios binaries) must be
-         * in the same dir, or a subdir. Thus, we cannot place the pc-bios so
-         * that it would be in exec_dir/../pc-bios.
-         * As a workaround, oss-fuzz allows us to use argv[0] to get the
-         * location of the executable. Using this we add exec_dir/pc-bios to
-         * the datadirs.
-         */
-        bindir = qemu_get_exec_dir();
-        datadir = g_build_filename(bindir, "pc-bios", NULL);
-        if (g_file_test(datadir, G_FILE_TEST_IS_DIR)) {
-            qemu_add_data_dir(datadir);
-        } else {
-            g_free(datadir);
-	}
     } else if (*argc > 1) {  /* The target is specified as an argument */
         target_name = (*argv)[1];
         if (!strstr(target_name, "--fuzz-target=")) {
-- 
2.36.1



