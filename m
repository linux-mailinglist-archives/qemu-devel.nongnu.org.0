Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB712F615A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:59:08 +0100 (CET)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02DT-0005k3-Kl
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BN-0003Dj-AK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BL-0004tH-4u
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bi7M6sFiTeSLDO9o5rxARuw7tLtXIltjoyENfz9lds=;
 b=OLxQbl9VqO8VxQvdc8g1M0J3qzwiLQk4KDoUOhQsEWEDAT8w6Fp08LYqNGcsJpEA6aezT4
 xn9BHkArV1MYOAz4zxdnLbtiJcX8hM9FWAgu1z5VUNbD/DqDZETmRxEsWb+8/UAYVcdY4I
 60jmCeaL3EJABoTdcwm0pjVB49M3k98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-ln8QJ7mKMrqWhH5fST2dWA-1; Thu, 14 Jan 2021 07:56:48 -0500
X-MC-Unique: ln8QJ7mKMrqWhH5fST2dWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B10A84A606;
 Thu, 14 Jan 2021 12:56:47 +0000 (UTC)
Received: from localhost (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CECEE63BA7;
 Thu, 14 Jan 2021 12:56:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] build-sys: make libslirp a meson subproject
Date: Thu, 14 Jan 2021 16:56:05 +0400
Message-Id: <20210114125605.1227742-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
References: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, j@getutm.app,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Remove the manual build.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                     |  2 +-
 meson.build                   | 62 +++--------------------------------
 .gitmodules                   |  6 ++--
 slirp => subprojects/libslirp |  0
 4 files changed, 8 insertions(+), 62 deletions(-)
 rename slirp => subprojects/libslirp (100%)

diff --git a/configure b/configure
index 64c09f7d58..e2ed041f66 100755
--- a/configure
+++ b/configure
@@ -5210,7 +5210,7 @@ case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
     if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
-      git_submodules="${git_submodules} slirp"
+      git_submodules="${git_submodules} subprojects/libslirp"
     fi
     ;;
 esac
diff --git a/meson.build b/meson.build
index a4adf06997..5f1121d135 100644
--- a/meson.build
+++ b/meson.build
@@ -1457,7 +1457,7 @@ slirp_opt = 'disabled'
 if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
-    have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libslirp/meson.build')
     slirp = dependency('slirp', static: enable_static,
                        method: 'pkg-config',
                        required: slirp_opt == 'system' or
@@ -1471,63 +1471,9 @@ if have_system
     endif
   endif
   if slirp_opt == 'internal'
-    slirp_deps = []
-    if targetos == 'windows'
-      slirp_deps = cc.find_library('iphlpapi')
-    endif
-    slirp_conf = configuration_data()
-    slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
-    slirp_conf.set('SLIRP_MINOR_VERSION', meson.project_version().split('.')[1])
-    slirp_conf.set('SLIRP_MICRO_VERSION', meson.project_version().split('.')[2])
-    slirp_conf.set_quoted('SLIRP_VERSION_STRING', meson.project_version())
-    slirp_cargs = ['-DG_LOG_DOMAIN="Slirp"']
-    slirp_files = [
-      'slirp/src/arp_table.c',
-      'slirp/src/bootp.c',
-      'slirp/src/cksum.c',
-      'slirp/src/dhcpv6.c',
-      'slirp/src/dnssearch.c',
-      'slirp/src/if.c',
-      'slirp/src/ip6_icmp.c',
-      'slirp/src/ip6_input.c',
-      'slirp/src/ip6_output.c',
-      'slirp/src/ip_icmp.c',
-      'slirp/src/ip_input.c',
-      'slirp/src/ip_output.c',
-      'slirp/src/mbuf.c',
-      'slirp/src/misc.c',
-      'slirp/src/ncsi.c',
-      'slirp/src/ndp_table.c',
-      'slirp/src/sbuf.c',
-      'slirp/src/slirp.c',
-      'slirp/src/socket.c',
-      'slirp/src/state.c',
-      'slirp/src/stream.c',
-      'slirp/src/tcp_input.c',
-      'slirp/src/tcp_output.c',
-      'slirp/src/tcp_subr.c',
-      'slirp/src/tcp_timer.c',
-      'slirp/src/tftp.c',
-      'slirp/src/udp.c',
-      'slirp/src/udp6.c',
-      'slirp/src/util.c',
-      'slirp/src/version.c',
-      'slirp/src/vmstate.c',
-    ]
-
-    configure_file(
-      input : 'slirp/src/libslirp-version.h.in',
-      output : 'libslirp-version.h',
-      configuration: slirp_conf)
-
-    slirp_inc = include_directories('slirp', 'slirp/src')
-    libslirp = static_library('slirp',
-                              sources: slirp_files,
-                              c_args: slirp_cargs,
-                              include_directories: slirp_inc)
-    slirp = declare_dependency(link_with: libslirp,
-                               dependencies: slirp_deps,
-                               include_directories: slirp_inc)
+    libslirp = subproject('libslirp',
+                          default_options: ['default_library=static'])
+    slirp = libslirp.get_variable('libslirp_dep')
   endif
 endif
 
diff --git a/.gitmodules b/.gitmodules
index 2bdeeacef8..80fd9c7199 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -49,9 +49,6 @@
 [submodule "roms/edk2"]
 	path = roms/edk2
 	url = https://git.qemu.org/git/edk2.git
-[submodule "slirp"]
-	path = slirp
-	url = https://git.qemu.org/git/libslirp.git
 [submodule "roms/opensbi"]
 	path = roms/opensbi
 	url = 	https://git.qemu.org/git/opensbi.git
@@ -64,3 +61,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://git.qemu.org/git/vbootrom.git
+[submodule "subprojects/libslirp"]
+	path = subprojects/libslirp
+	url = https://git.qemu.org/git/libslirp.git
diff --git a/slirp b/subprojects/libslirp
similarity index 100%
rename from slirp
rename to subprojects/libslirp
-- 
2.29.0


