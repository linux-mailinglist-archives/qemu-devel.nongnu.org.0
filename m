Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC9301602
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:43:47 +0100 (CET)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K8f-0002d5-Uf
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxF-0003Z4-FC
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx7-0005q0-4G
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bfN5Mv8mL3o3qc9Q7KWOfykZwiG+JX8rh4mqFuxTgw=;
 b=CBRu6L6/an7/Bxv2Q7Ka9EoYpGQa9cmA+28Gzjif+rm+AqJhmwc5AdoLCLGsl6hKKxlYD1
 JqICN6DG08WY4r93A+SLK8zbP9rlXigB9DgubwvsoAn2h1pCG70a82+GE2LSQoenSA5l5l
 AyRXMgv0EJ3rULCVnuAsAymvp85jEIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-5aNR-RMBOSuvt7-7jLYmsA-1; Sat, 23 Jan 2021 09:31:44 -0500
X-MC-Unique: 5aNR-RMBOSuvt7-7jLYmsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C63E6E745
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE4A19C44;
 Sat, 23 Jan 2021 14:31:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/31] slirp: update to git master
Date: Sat, 23 Jan 2021 09:31:08 -0500
Message-Id: <20210123143128.1167797-12-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

git cherry-diff:

Commits on bacb71f1c3ed5f40e393afd8be81bedfba13a401 branch that is not on 8f43a99191afb47ca3f3c6972f6306209f367ece branch
+ 1021b0dc38d39f1dc95a296fe3e05a24a087cdc6 disable_dns option
+ 0f94ceec752592e4ac632a24e3c64a97dd09bf4c limit vnameserver_addr to port 53
+ b57bafa852ef16b133907a13678ec69e9531f177 libslirp.h: fix SlirpConfig v3 documentation
+ 1abf18b2b5edb462797629ed47ad4515a195686e Update CHANGELOG
+ ff4ecf9b6c6542b24b4ac6ea178be9d44e159f79 Release v4.3.0
+ 21f1d933050a40d62612c6274c32de60b811d9ea changelog: post-release
+ 376187c4b14c795763d472214812826eebe7e9c2 Release v4.3.1
+ 73336e08902a7e826f7d960453df037380266186 changelog: post-release
+ 5c1c9d43be61571608e9b14615045b67b830daf5 udp, udp6, icmp: handle TTL value
+ 73ed49ab71998d4288e71e954ef6214b70f23d79 icmp, icmp6: Add icmp_forward_error and icmp6_forward_error
+ 7a4840a57ec7dbc37cca1ab96f058a9610b26950 udp, udp6, icmp, icmp6: Enable forwarding errors on Linux
+ e9b2bc19ae652a2907f247e621b2e4773bdd2aab TCPIPHDR_DELTA: Fix potential negative value
+ 39f9a363eec082f04513413046321abd04163148 .gitlab-ci: add a Coverity stage
+ 1b0093b973cfa0dc041522e5d4e6f576b2df642e sosendoob: better document what urgc is used for
+ 5b9ad89ebbb8afa50162c9156fabd5fc56291088 Add G_GNUC_PRINTF to local function slirp_vsnprintf
+ 8a808aa493980e212b4d5f5465330905c8294e59 meson: remove meson-dist script
+ 0b669b5fbe4d3c25a682a67f1059d8633c963b3d meson: support compiling as subproject
+ 9f82a47b81f2864422b82c1e40e51a2ed9c6ac32 Add DNS resolving for iOS
+ c0eac03e8ce1b9a743231f2fe21e7cb579fc9339 Remove the QEMU-special make build-system
+ 1bfd4d9368f9fa2e4f0731e1266bec05bbc83a80 socket: consume empty packets
+ 92413be68914f8cae2f5bad4bf3ab8491dcbc5d7 Release v4.4.0
+ 07e8cfac69766081871ab620d9f16a630543d302 changelog: post-release
+ 4c4e035813313d02b63fdeb920d56fb2fdc0a5b1 Remove some needless (void)casts

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210114125605.1227742-5-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitmodules          |  6 ++---
 configure            |  2 +-
 meson.build          | 62 +++-----------------------------------------
 slirp                |  1 -
 subprojects/libslirp |  1 +
 5 files changed, 9 insertions(+), 63 deletions(-)
 delete mode 160000 slirp
 create mode 160000 subprojects/libslirp

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
diff --git a/configure b/configure
index ff099cb8ca..753d0dd18e 100755
--- a/configure
+++ b/configure
@@ -5206,7 +5206,7 @@ case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
     if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
-      git_submodules="${git_submodules} slirp"
+      git_submodules="${git_submodules} subprojects/libslirp"
     fi
     ;;
 esac
diff --git a/meson.build b/meson.build
index e813814fb0..deda061c86 100644
--- a/meson.build
+++ b/meson.build
@@ -1460,7 +1460,7 @@ slirp_opt = 'disabled'
 if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
-    have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libslirp/meson.build')
     slirp = dependency('slirp', static: enable_static,
                        method: 'pkg-config',
                        required: slirp_opt == 'system' or
@@ -1474,63 +1474,9 @@ if have_system
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
 
diff --git a/slirp b/slirp
deleted file mode 160000
index 8f43a99191..0000000000
--- a/slirp
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
diff --git a/subprojects/libslirp b/subprojects/libslirp
new file mode 160000
index 0000000000..bacb71f1c3
--- /dev/null
+++ b/subprojects/libslirp
@@ -0,0 +1 @@
+Subproject commit bacb71f1c3ed5f40e393afd8be81bedfba13a401
-- 
2.26.2



