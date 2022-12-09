Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A386481E0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:39:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXF-0005sz-7h; Fri, 09 Dec 2022 06:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0004Sq-Cn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVl-0001LC-Sl
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyhopLFMyxkTH5IgcwEgCKlWTJOjEOoq7axQMQYBvrA=;
 b=hqqKu/QkoUSS2ZQtcki8rdFVXRLv5VU8nilJIrwTftrPpZ/MFm4Q9Ti5xw9eZmdvwBQtZI
 L5cWMBeFE+DtQcgeX7m3XaKmOoZuJaeEVo4wDDwDX11RDHFkfn9Xmfm7wmaNwYnNY+sqgY
 XA7YB1LrVjyWKWFr2ahCbSXlUT3LTq0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-R5ARWXgmP0G7EeAY4pOauQ-1; Fri, 09 Dec 2022 06:25:19 -0500
X-MC-Unique: R5ARWXgmP0G7EeAY4pOauQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s13-20020a056402520d00b0046c78433b54so1198513edd.16
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EyhopLFMyxkTH5IgcwEgCKlWTJOjEOoq7axQMQYBvrA=;
 b=X0VbEHWLKTN/sm2dH19Takprw0WG9YDrDHn/6vJ1p+Q6OgsVraX7XNGABXtDoDpzXE
 ViDlKtWuXRP5E8DBf+MKrIhK1r+nHFKLaQafM0BosdKI1rWw7yMqQd5INNWAcC/+OJiu
 ZvLpmBPAFt4a5BiHu49lb98piQFa+GCbRhl6Az9sBk4xCdQHYaqZ32KwxYp4YNh6/2kg
 RaJ1WpZrrpC/vh2hHv3vw4oZba5azgpIQ03y2+oiyOZKKcDbX7m/ZkanFoz3BVrBd6zF
 pLKQLH/oz8GGXRaOEAS18KxtxeEHDkqTEZZ6djE0oiWUPoBJsHgFsLKcwZcijhEsSo4e
 Z7HQ==
X-Gm-Message-State: ANoB5plzsq45VQu5FlAc/qKwTJUA6ZuxqjQJiFixtRytSMmcjnVIE5rU
 At5LzjHkULqLMQNkWzKrqpLzjNRxVGxLdbnmAR1cWHyzMC2+KhUqEP2U6Q9rzcMWcX9AEZGD8ZY
 nt/F8Wl7i5gE4yF9Nt/6Yavtl8Fy7s2RPaE085n0jkPas5VzWBasreHXWQ4BzSIYBEvg=
X-Received: by 2002:a17:907:d18:b0:7ae:1438:5892 with SMTP id
 gn24-20020a1709070d1800b007ae14385892mr6757790ejc.36.1670585117557; 
 Fri, 09 Dec 2022 03:25:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5riUbPKTLrBlzs1RWkA24fWv4UfZ2nFH6Fs4sb9EDpj6IhoK3ktxgCvMlMR7WyY/l4fQE7xA==
X-Received: by 2002:a17:907:d18:b0:7ae:1438:5892 with SMTP id
 gn24-20020a1709070d1800b007ae14385892mr6757764ejc.36.1670585117164; 
 Fri, 09 Dec 2022 03:25:17 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 la5-20020a170907780500b007c0ae137404sm458340ejc.97.2022.12.09.03.25.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/30] configure, meson: move --enable-modules to Meson
Date: Fri,  9 Dec 2022 12:23:57 +0100
Message-Id: <20221209112409.184703-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 21 +--------------------
 meson.build                   |  7 ++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index 9c336203d8d9..26d10aeffd82 100755
--- a/configure
+++ b/configure
@@ -273,7 +273,6 @@ sanitizers="no"
 tsan="no"
 fortify_source="yes"
 EXESUF=""
-modules="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
 softmmu="yes"
@@ -705,12 +704,6 @@ for opt do
   ;;
   --disable-debug-info) meson_option_add -Ddebug=false
   ;;
-  --enable-modules)
-      modules="yes"
-  ;;
-  --disable-modules)
-      modules="no"
-  ;;
   --cpu=*)
   ;;
   --target-list=*) target_list="$optarg"
@@ -1001,7 +994,6 @@ cat << EOF
   linux-user      all linux usermode emulation targets
   bsd-user        all BSD usermode emulation targets
   pie             Position Independent Executables
-  modules         modules support (non-Windows)
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
   safe-stack      SafeStack Stack Smash Protection. Depends on
@@ -1260,16 +1252,8 @@ else
   QEMU_CFLAGS="$QEMU_CFLAGS -Wno-missing-braces"
 fi
 
-# Our module code doesn't support Windows
-if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
-  error_exit "Modules are not available for Windows"
-fi
-
-# Static linking is not possible with plugins, modules or PIE
+# Resolve default for --enable-plugins
 if test "$static" = "yes" ; then
-  if test "$modules" = "yes" ; then
-    error_exit "static and modules are mutually incompatible"
-  fi
   if test "$plugins" = "yes"; then
     error_exit "static and plugins are mutually incompatible"
   else
@@ -2229,9 +2213,6 @@ if test "$solaris" = "yes" ; then
 fi
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
-if test "$modules" = "yes"; then
-  echo "CONFIG_MODULES=y" >> $config_host_mak
-fi
 
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
diff --git a/meson.build b/meson.build
index f63ab7f83bed..99c1bde4d154 100644
--- a/meson.build
+++ b/meson.build
@@ -16,7 +16,6 @@ fs = import('fs')
 
 sh = find_program('sh')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
-enable_modules = 'CONFIG_MODULES' in config_host
 targetos = host_machine.system()
 
 cc = meson.get_compiler('c')
@@ -84,6 +83,12 @@ have_ga = get_option('guest_agent') \
   .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
            error_message: 'unsupported OS for QEMU guest agent') \
   .allowed()
+enable_modules = get_option('modules') \
+  .require(targetos != 'windows',
+           error_message: 'Modules are not available for Windows') \
+  .require(not get_option('prefer_static'),
+           error_message: 'Modules are incompatible with static linking') \
+  .allowed()
 have_block = have_system or have_tools
 
 python = import('python').find_installation()
diff --git a/meson_options.txt b/meson_options.txt
index 4b749ca54900..e492aaa73fbc 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -44,6 +44,8 @@ option('fuzzing', type : 'boolean', value: false,
        description: 'build fuzzing targets')
 option('gettext', type : 'feature', value : 'auto',
        description: 'Localization of the GTK+ user interface')
+option('modules', type : 'feature', value : 'disabled',
+       description: 'modules support (non Windows)')
 option('module_upgrades', type : 'boolean', value : false,
        description: 'try to load modules from alternate paths for upgrades')
 option('install_blobs', type : 'boolean', value : true,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index aa6e30ea911e..f91797741eef 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -119,6 +119,7 @@ meson_options_help() {
   printf "%s\n" '  lzo             lzo compression support'
   printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory optimization'
   printf "%s\n" '  membarrier      membarrier system call (for Linux 4.14+ or Windows'
+  printf "%s\n" '  modules         modules support (non Windows)'
   printf "%s\n" '  mpath           Multipath persistent reservation passthrough'
   printf "%s\n" '  multiprocess    Out of process device emulation support'
   printf "%s\n" '  netmap          netmap network backend support'
@@ -338,6 +339,8 @@ _meson_option_parse() {
     --disable-membarrier) printf "%s" -Dmembarrier=disabled ;;
     --enable-module-upgrades) printf "%s" -Dmodule_upgrades=true ;;
     --disable-module-upgrades) printf "%s" -Dmodule_upgrades=false ;;
+    --enable-modules) printf "%s" -Dmodules=enabled ;;
+    --disable-modules) printf "%s" -Dmodules=disabled ;;
     --enable-mpath) printf "%s" -Dmpath=enabled ;;
     --disable-mpath) printf "%s" -Dmpath=disabled ;;
     --enable-multiprocess) printf "%s" -Dmultiprocess=enabled ;;
-- 
2.38.1


