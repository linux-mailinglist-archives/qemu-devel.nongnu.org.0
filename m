Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3823E254
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:36:53 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3lh6-00033j-VK
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lOP-0004ef-Ij
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54516
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lOM-0006T1-IP
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPueCnpxNL8nRrBwUbP6OFH4+X/CEejPf3/nhc7SSbw=;
 b=aHjuMTLeyNoYx0yvSRPfNL+3Qmn+tcJr6ePn+pMgCWKYQc3DdZjIM2AGLMN0rZ7AHpvNtm
 coserZSbqcafZ+dy/r8fEShydNO+9ez0bOegT0hZg2GfWFubLXsmA9+WpBWQ64wDqaW2wX
 pp5vNs7IgqSWCBJMZQTBd79s4hFbrcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-t63TXwoQNmOCM6BpvTap7A-1; Thu, 06 Aug 2020 15:17:25 -0400
X-MC-Unique: t63TXwoQNmOCM6BpvTap7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF957100AA21
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:24 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D3C5FC3B;
 Thu,  6 Aug 2020 19:17:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 033/143] meson: convert qemu-ga
Date: Thu,  6 Aug 2020 21:14:29 +0200
Message-Id: <1596741379-12902-34-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                  | 53 ++++++-----------------------------------------
 Makefile.objs             |  1 -
 configure                 |  9 ++++----
 meson.build               | 22 ++++++++++++++++++--
 qga/Makefile.objs         |  9 --------
 qga/installer/qemu-ga.wxs |  2 +-
 qga/meson.build           | 45 ++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.include    |  4 ++--
 tests/test-qga.c          |  8 +++----
 9 files changed, 82 insertions(+), 71 deletions(-)
 create mode 100644 qga/meson.build

diff --git a/Makefile b/Makefile
index 39bf0c4..05f774d 100644
--- a/Makefile
+++ b/Makefile
@@ -285,7 +285,6 @@ endif
 dummy := $(call unnest-vars,, \
                 authz-obj-y \
                 chardev-obj-y \
-                qga-obj-y \
                 qga-vss-dll-obj-y \
                 block-obj-y \
                 block-obj-m \
@@ -433,52 +432,15 @@ endif
 qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx $(SRC_PATH)/scripts/hxtool
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"GEN","$@")
 
-qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
-qemu-ga$(EXESUF): QEMU_CFLAGS += -I qga/qapi-generated
-
 qemu-keymap$(EXESUF): LIBS += $(XKBCOMMON_LIBS)
 qemu-keymap$(EXESUF): QEMU_CFLAGS += $(XKBCOMMON_CFLAGS)
 
-qapi-py = $(SRC_PATH)/scripts/qapi/__init__.py \
-$(SRC_PATH)/scripts/qapi/commands.py \
-$(SRC_PATH)/scripts/qapi/common.py \
-$(SRC_PATH)/scripts/qapi/doc.py \
-$(SRC_PATH)/scripts/qapi/error.py \
-$(SRC_PATH)/scripts/qapi/events.py \
-$(SRC_PATH)/scripts/qapi/expr.py \
-$(SRC_PATH)/scripts/qapi/gen.py \
-$(SRC_PATH)/scripts/qapi/introspect.py \
-$(SRC_PATH)/scripts/qapi/parser.py \
-$(SRC_PATH)/scripts/qapi/schema.py \
-$(SRC_PATH)/scripts/qapi/source.py \
-$(SRC_PATH)/scripts/qapi/types.py \
-$(SRC_PATH)/scripts/qapi/visit.py \
-$(SRC_PATH)/scripts/qapi-gen.py
-
-qga/qapi-generated/qga-qapi-types.c qga/qapi-generated/qga-qapi-types.h \
-qga/qapi-generated/qga-qapi-visit.c qga/qapi-generated/qga-qapi-visit.h \
-qga/qapi-generated/qga-qapi-commands.h qga/qapi-generated/qga-qapi-commands.c \
-qga/qapi-generated/qga-qapi-init-commands.h qga/qapi-generated/qga-qapi-init-commands.c \
-qga/qapi-generated/qga-qapi-doc.texi: \
-qga/qapi-generated/qapi-gen-timestamp ;
-qga/qapi-generated/qapi-gen-timestamp: $(SRC_PATH)/qga/qapi-schema.json $(qapi-py)
-	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-gen.py \
-		-o qga/qapi-generated -p "qga-" $<, \
-		"GEN","$(@:%-timestamp=%)")
-	@>$@
-
-QGALIB_GEN=$(addprefix qga/qapi-generated/, qga-qapi-types.h qga-qapi-visit.h qga-qapi-commands.h qga-qapi-init-commands.h)
-$(qga-obj-y): $(QGALIB_GEN)
-
-qemu-ga$(EXESUF): $(qga-obj-y) $(COMMON_LDADDS)
-	$(call LINK, $^)
-
 ifdef QEMU_GA_MSI_ENABLED
 QEMU_GA_MSI=qemu-ga-$(ARCH).msi
 
 msi: $(QEMU_GA_MSI)
 
-$(QEMU_GA_MSI): qemu-ga.exe $(QGA_VSS_PROVIDER)
+$(QEMU_GA_MSI): qga/qemu-ga.exe $(QGA_VSS_PROVIDER)
 
 $(QEMU_GA_MSI): config-host.mak
 
@@ -491,8 +453,8 @@ msi:
 endif
 
 ifneq ($(EXESUF),)
-.PHONY: qemu-ga
-qemu-ga: qemu-ga$(EXESUF) $(QGA_VSS_PROVIDER) $(QEMU_GA_MSI)
+.PHONY: qga/qemu-ga
+qga/qemu-ga: qga/qemu-ga$(EXESUF) $(QGA_VSS_PROVIDER) $(QEMU_GA_MSI)
 endif
 
 module_block.h: $(SRC_PATH)/scripts/modules/module_block.py config-host.mak
@@ -516,9 +478,6 @@ clean: recurse-clean
 	rm -f qemu-img-cmds.h
 	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
 	rm -f $(foreach f,$(generated-files-y),$(f) $(f)-timestamp)
-	rm -f qapi-gen-timestamp
-	rm -f storage-daemon/qapi/qapi-gen-timestamp
-	rm -rf qga/qapi-generated
 	rm -f config-all-devices.mak
 	rm -f $(SUBDIR_DEVICES_MAK)
 
@@ -637,7 +596,7 @@ endif
 ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/tools/qemu-trace-stap.1 "$(DESTDIR)$(mandir)/man1"
 endif
-ifneq (,$(findstring qemu-ga,$(TOOLS)))
+ifeq ($(CONFIG_GUEST_AGENT),y)
 	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/interop/qemu-ga.8 "$(DESTDIR)$(mandir)/man8"
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)/interop"
 	$(INSTALL_DATA) docs/interop/qemu-ga-ref.html "$(DESTDIR)$(qemu_docdir)/interop"
@@ -658,7 +617,7 @@ install-datadir:
 
 install-localstatedir:
 ifdef CONFIG_POSIX
-ifneq (,$(findstring qemu-ga,$(TOOLS)))
+ifeq ($(CONFIG_GUEST_AGENT),y)
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_localstatedir)"/run
 endif
 endif
@@ -850,7 +809,7 @@ $(MANUAL_BUILDDIR)/index.html: $(SRC_PATH)/docs/index.html.in qemu-version.h
 docs/interop/qemu-qmp-qapi.texi: qapi/qapi-doc.texi
 	@cp -p $< $@
 
-docs/interop/qemu-ga-qapi.texi: qga/qapi-generated/qga-qapi-doc.texi
+docs/interop/qemu-ga-qapi.texi: qga/qga-qapi-doc.texi
 	@cp -p $< $@
 
 html: docs/interop/qemu-qmp-ref.html docs/interop/qemu-ga-ref.html sphinxdocs
diff --git a/Makefile.objs b/Makefile.objs
index 1486254..259f993 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -98,5 +98,4 @@ version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
 # FIXME: a few definitions from qapi/qapi-types.o and
 # qapi/qapi-visit.o are needed by libqemuutil.a.  These should be
 # extracted into a QAPI schema module, or perhaps a separate schema.
-qga-obj-y = qga/
 qga-vss-dll-obj-y = qga/
diff --git a/configure b/configure
index b57968b..e0ef3f7 100755
--- a/configure
+++ b/configure
@@ -3949,7 +3949,6 @@ for i in $glib_modules; do
         glib_libs=$($pkg_config --libs $i)
         QEMU_CFLAGS="$glib_cflags $QEMU_CFLAGS"
         LIBS="$glib_libs $LIBS"
-        libs_qga="$glib_libs $libs_qga"
     else
         error_exit "glib-$glib_req_ver $i is required to compile QEMU"
     fi
@@ -5169,7 +5168,6 @@ if compile_prog "" "" ; then
   :
 elif compile_prog "" "-lm" ; then
   LIBS="-lm $LIBS"
-  libs_qga="-lm $libs_qga"
 else
   error_exit "libm check failed"
 fi
@@ -5194,7 +5192,6 @@ if compile_prog "" "" ; then
 # we need pthread for static linking. use previous pthread test result
 elif compile_prog "" "$pthread_lib -lrt" ; then
   LIBS="$LIBS -lrt"
-  libs_qga="$libs_qga -lrt"
 fi
 
 # Check whether we need to link libutil for openpty()
@@ -6689,7 +6686,6 @@ if [ "$guest_agent" != "no" ]; then
   if [ "$softmmu" = no -a "$want_tools" = no ] ; then
       guest_agent=no
   elif [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" -o "$mingw32" = "yes" ] ; then
-      tools="qemu-ga\$(EXESUF) $tools"
       guest_agent=yes
   elif [ "$guest_agent" != yes ]; then
       guest_agent=no
@@ -6935,6 +6931,9 @@ fi
 if test "$want_tools" = "yes" ; then
   echo "CONFIG_TOOLS=y" >> $config_host_mak
 fi
+if test "$guest_agent" = "yes" ; then
+  echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
+fi
 if test "$slirp" != "no"; then
   echo "CONFIG_SLIRP=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
@@ -7792,7 +7791,7 @@ echo "PTHREAD_LIB=$PTHREAD_LIB" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "DSOSUF=$DSOSUF" >> $config_host_mak
 echo "LDFLAGS_SHARED=$LDFLAGS_SHARED" >> $config_host_mak
-echo "LIBS_QGA+=$libs_qga" >> $config_host_mak
+echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 echo "TASN1_LIBS=$tasn1_libs" >> $config_host_mak
 echo "TASN1_CFLAGS=$tasn1_cflags" >> $config_host_mak
 echo "POD2MAN=$POD2MAN" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 21e822e..a68c7b4 100644
--- a/meson.build
+++ b/meson.build
@@ -111,6 +111,10 @@ if 'CONFIG_CURL' in config_host
   curl = declare_dependency(compile_args: config_host['CURL_CFLAGS'].split(),
                             link_args: config_host['CURL_LIBS'].split())
 endif
+libudev = not_found
+if 'CONFIG_LIBUDEV' in config_host
+  libudev = declare_dependency(link_args: config_host['LIBUDEV_LIBS'].split())
+endif
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_user = false
@@ -125,13 +129,23 @@ have_block = have_system or have_tools
 # Generators
 
 qapi_gen = find_program('scripts/qapi-gen.py')
-qapi_gen_depends = [ meson.source_root() / 'scripts/qapi/events.py',
+qapi_gen_depends = [ meson.source_root() / 'scripts/qapi/__init__.py',
+                     meson.source_root() / 'scripts/qapi/commands.py',
+                     meson.source_root() / 'scripts/qapi/common.py',
+                     meson.source_root() / 'scripts/qapi/doc.py',
+                     meson.source_root() / 'scripts/qapi/error.py',
+                     meson.source_root() / 'scripts/qapi/events.py',
+                     meson.source_root() / 'scripts/qapi/expr.py',
+                     meson.source_root() / 'scripts/qapi/gen.py',
                      meson.source_root() / 'scripts/qapi/introspect.py',
+                     meson.source_root() / 'scripts/qapi/parser.py',
+                     meson.source_root() / 'scripts/qapi/schema.py',
+                     meson.source_root() / 'scripts/qapi/source.py',
                      meson.source_root() / 'scripts/qapi/types.py',
                      meson.source_root() / 'scripts/qapi/visit.py',
                      meson.source_root() / 'scripts/qapi/common.py',
                      meson.source_root() / 'scripts/qapi/doc.py',
-                     meson.source_root() / 'scripts/qapi-gen.py' ]
+]
 
 # Collect sourcesets.
 
@@ -257,6 +271,10 @@ qemuutil = declare_dependency(link_with: libqemuutil,
 
 # Other build targets
 
+if 'CONFIG_GUEST_AGENT' in config_host
+  subdir('qga')
+endif
+
 if have_tools
   subdir('contrib/rdmacm-mux')
   subdir('contrib/elf2dmp')
diff --git a/qga/Makefile.objs b/qga/Makefile.objs
index 9c558ae..9ecf249 100644
--- a/qga/Makefile.objs
+++ b/qga/Makefile.objs
@@ -1,10 +1 @@
-commands-posix.o-libs := $(LIBUDEV_LIBS)
-qga-obj-y = commands.o guest-agent-command-state.o main.o
-qga-obj-$(CONFIG_POSIX) += commands-posix.o channel-posix.o
-qga-obj-$(CONFIG_WIN32) += commands-win32.o channel-win32.o service-win32.o
-qga-obj-$(CONFIG_WIN32) += vss-win32.o
-qga-obj-y += qapi-generated/qga-qapi-types.o qapi-generated/qga-qapi-visit.o
-qga-obj-y += qapi-generated/qga-qapi-commands.o
-qga-obj-y += qapi-generated/qga-qapi-init-commands.o
-
 qga-vss-dll-obj-$(CONFIG_QGA_VSS) += vss-win32/
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index f678175..9cb4c3d 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -66,7 +66,7 @@
       <Directory Id="$(var.GaProgramFilesFolder)" Name="QEMU Guest Agent">
         <Directory Id="qemu_ga_directory" Name="Qemu-ga">
           <Component Id="qemu_ga" Guid="{908B7199-DE2A-4DC6-A8D0-27A5AE444FEA}">
-            <File Id="qemu_ga.exe" Name="qemu-ga.exe" Source="$(env.BUILD_DIR)/qemu-ga.exe" KeyPath="yes" DiskId="1"/>
+            <File Id="qemu_ga.exe" Name="qemu-ga.exe" Source="$(env.BUILD_DIR)/qga/qemu-ga.exe" KeyPath="yes" DiskId="1"/>
             <ServiceInstall
               Id="ServiceInstaller"
               Type="ownProcess"
diff --git a/qga/meson.build b/qga/meson.build
new file mode 100644
index 0000000..e963e43
--- /dev/null
+++ b/qga/meson.build
@@ -0,0 +1,45 @@
+qga_qapi_outputs = [
+  'qga-qapi-commands.c',
+  'qga-qapi-commands.h',
+  'qga-qapi-doc.texi',
+  'qga-qapi-emit-events.c',
+  'qga-qapi-emit-events.h',
+  'qga-qapi-events.c',
+  'qga-qapi-events.h',
+  'qga-qapi-init-commands.c',
+  'qga-qapi-init-commands.h',
+  'qga-qapi-introspect.c',
+  'qga-qapi-introspect.h',
+  'qga-qapi-types.c',
+  'qga-qapi-types.h',
+  'qga-qapi-visit.c',
+  'qga-qapi-visit.h',
+]
+
+qga_qapi_files = custom_target('QGA QAPI files',
+                               output: qga_qapi_outputs,
+                               input: 'qapi-schema.json',
+                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
+                               depend_files: qapi_gen_depends)
+qga_ss = ss.source_set()
+qga_ss.add(qga_qapi_files)
+qga_ss.add(files(
+  'commands.c',
+  'guest-agent-command-state.c',
+  'main.c',
+))
+qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
+  'channel-posix.c',
+  'commands-posix.c'))
+qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
+  'channel-win32.c',
+  'commands-win32.c',
+  'service-win32.c',
+  'vss-win32.c'
+))
+
+qga_ss = qga_ss.apply(config_host, strict: false)
+
+qga = executable('qemu-ga', qga_ss.sources(),
+                 link_args: config_host['LIBS_QGA'].split(),
+                 dependencies: [qemuutil, libudev])
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 5e9dff9..1a20657 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -129,7 +129,7 @@ ifndef CONFIG_TSAN
 # https://github.com/google/sanitizers/issues/1116
 check-unit-$(CONFIG_SOFTMMU) += tests/test-char$(EXESUF)
 check-unit-$(CONFIG_SOFTMMU) += tests/test-qdev-global-props$(EXESUF)
-ifneq (,$(findstring qemu-ga,$(TOOLS)))
+ifeq ($(CONFIG_GUEST_AGENT),y)
 check-unit-$(call land,$(CONFIG_LINUX),$(CONFIG_VIRTIO_SERIAL)) += tests/test-qga$(EXESUF)
 endif
 endif
@@ -603,7 +603,7 @@ tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
 
 include $(SRC_PATH)/tests/qtest/Makefile.include
 
-tests/test-qga$(EXESUF): qemu-ga$(EXESUF)
+tests/test-qga$(EXESUF): qga/qemu-ga$(EXESUF)
 tests/test-qga$(EXESUF): tests/test-qga.o $(qtest-obj-y)
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-obj-y) libvhost-user.a
 tests/qemu-iotests/socket_scm_helper$(EXESUF): tests/qemu-iotests/socket_scm_helper.o
diff --git a/tests/test-qga.c b/tests/test-qga.c
index d2b2435..d1b4c3e 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -61,8 +61,8 @@ fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
 
     path = g_build_filename(fixture->test_dir, "sock", NULL);
     cwd = g_get_current_dir();
-    cmd = g_strdup_printf("%s%cqemu-ga -m unix-listen -t %s -p %s %s %s",
-                          cwd, G_DIR_SEPARATOR,
+    cmd = g_strdup_printf("%s%cqga%cqemu-ga -m unix-listen -t %s -p %s %s %s",
+                          cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR,
                           fixture->test_dir, path,
                           getenv("QTEST_LOG") ? "-v" : "",
                           extra_arg ?: "");
@@ -699,8 +699,8 @@ static void test_qga_config(gconstpointer data)
     GKeyFile *kf;
 
     cwd = g_get_current_dir();
-    cmd = g_strdup_printf("%s%cqemu-ga -D",
-                          cwd, G_DIR_SEPARATOR);
+    cmd = g_strdup_printf("%s%cqga%cqemu-ga -D",
+                          cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
     g_free(cwd);
     g_shell_parse_argv(cmd, NULL, &argv, &error);
     g_free(cmd);
-- 
1.8.3.1



