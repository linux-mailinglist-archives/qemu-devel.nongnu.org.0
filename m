Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15F6983A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMkd-0006CO-90; Wed, 15 Feb 2023 13:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSMka-0006C6-Qn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSMkY-0000kS-UB
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676486606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuwHl0pltuo3+AKziUJWpst4cnTigba2hmmPOPAJNpo=;
 b=WHYEj4HutIYH/QpcjWdT41NtVPXFaNRzYu9Y3ktV+bmh83oE2UvXXo2gwzCu56RusQ/5Hl
 3r/k0GeWQ72z6zdoHCa0IH8CtQbhxKBXt/iRS+XtEHkWSNCcKRd627F4YTmcbBsu9dEIbf
 5sUTiaIvVCdYE5yProatEmf++ImY96E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-7PTcq5TUNHWVA6Lk_GWCmw-1; Wed, 15 Feb 2023 13:43:22 -0500
X-MC-Unique: 7PTcq5TUNHWVA6Lk_GWCmw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69FE618E0924;
 Wed, 15 Feb 2023 18:43:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 319C7492B15;
 Wed, 15 Feb 2023 18:43:20 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 hczenczek@redhat.com, gmaglione@redhat.com, virtio-fs@redhat.com
Cc: pbonzini@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 2/4] virtiofsd: Remove build and docs glue
Date: Wed, 15 Feb 2023 18:43:08 +0000
Message-Id: <20230215184310.161283-3-dgilbert@redhat.com>
In-Reply-To: <20230215184310.161283-1-dgilbert@redhat.com>
References: <20230215184310.161283-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Remove all the virtiofsd build and docs infrastructure.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 MAINTAINERS                                    |  2 --
 docs/conf.py                                   |  4 ----
 docs/meson.build                               |  1 -
 docs/tools/index.rst                           |  1 -
 meson.build                                    |  1 -
 meson_options.txt                              |  2 --
 .../ci/org.centos/stream/8/x86_64/configure    |  2 --
 scripts/coverity-scan/COMPONENTS.md            |  3 ---
 scripts/meson-buildoptions.sh                  |  3 ---
 tools/meson.build                              | 13 -------------
 tools/virtiofsd/50-qemu-virtiofsd.json.in      |  5 -----
 tools/virtiofsd/meson.build                    | 18 ------------------
 12 files changed, 55 deletions(-)
 delete mode 100644 tools/virtiofsd/50-qemu-virtiofsd.json.in
 delete mode 100644 tools/virtiofsd/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..5c926e7396 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2097,10 +2097,8 @@ virtiofs
 M: Dr. David Alan Gilbert <dgilbert@redhat.com>
 M: Stefan Hajnoczi <stefanha@redhat.com>
 S: Supported
-F: tools/virtiofsd/*
 F: hw/virtio/vhost-user-fs*
 F: include/hw/virtio/vhost-user-fs.h
-F: docs/tools/virtiofsd.rst
 L: virtio-fs@redhat.com
 
 virtio-input
diff --git a/docs/conf.py b/docs/conf.py
index 73a287a4f2..00767b0e24 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -290,10 +290,6 @@
     ('tools/virtfs-proxy-helper', 'virtfs-proxy-helper',
      'QEMU 9p virtfs proxy filesystem helper',
      ['M. Mohan Kumar'], 1),
-    ('tools/virtiofsd', 'virtiofsd',
-     'QEMU virtio-fs shared file system daemon',
-     ['Stefan Hajnoczi <stefanha@redhat.com>',
-      'Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>'], 1),
 ]
 man_make_section_directory = False
 
diff --git a/docs/meson.build b/docs/meson.build
index 9136fed3b7..bbcdccce68 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -48,7 +48,6 @@ if build_docs
         'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
         'qemu-trace-stap.1': (stap.found() ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
-        'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
         'qemu.1': 'man1',
         'qemu-block-drivers.7': 'man7',
         'qemu-cpu-models.7': 'man7'
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 2151adcf78..8e65ce0dfc 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -16,4 +16,3 @@ command line utilities and other standalone programs.
    qemu-pr-helper
    qemu-trace-stap
    virtfs-proxy-helper
-   virtiofsd
diff --git a/meson.build b/meson.build
index c626ccfa82..6508b10a05 100644
--- a/meson.build
+++ b/meson.build
@@ -3870,7 +3870,6 @@ if have_block
   summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
   summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
   summary_info += {'VirtFS support':    have_virtfs}
-  summary_info += {'build virtiofs daemon': have_virtiofsd}
   summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
   summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
   summary_info += {'bochs support':     get_option('bochs').allowed()}
diff --git a/meson_options.txt b/meson_options.txt
index e5f199119e..954abb859b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -270,8 +270,6 @@ option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
 option('virtfs', type: 'feature', value: 'auto',
        description: 'virtio-9p support')
-option('virtiofsd', type: 'feature', value: 'auto',
-       description: 'build virtiofs daemon (virtiofsd)')
 option('libvduse', type: 'feature', value: 'auto',
        description: 'build VDUSE Library')
 option('vduse_blk_export', type: 'feature', value: 'auto',
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index 65eacf3c56..6e8983f39c 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -138,7 +138,6 @@
 --disable-vhost-vdpa \
 --disable-virglrenderer \
 --disable-virtfs \
---disable-virtiofsd \
 --disable-vnc \
 --disable-vnc-jpeg \
 --disable-png \
@@ -191,7 +190,6 @@
 --enable-tpm \
 --enable-trace-backends=dtrace \
 --enable-usb-redir \
---enable-virtiofsd \
 --enable-vhost-kernel \
 --enable-vhost-net \
 --enable-vhost-user \
diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 0e6ab4936e..639dcee45a 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -132,9 +132,6 @@ util
 xen
   ~ (/qemu)?(.*/xen.*)
 
-virtiofsd
-  ~ (/qemu)?(/tools/virtiofsd/.*)
-
 (headers)
   ~ (/qemu)?(/include/.*)
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c2982ea087..4651c8aacb 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -174,7 +174,6 @@ meson_options_help() {
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
-  printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
   printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vnc             VNC server'
   printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
@@ -458,8 +457,6 @@ _meson_option_parse() {
     --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
     --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
     --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
-    --enable-virtiofsd) printf "%s" -Dvirtiofsd=enabled ;;
-    --disable-virtiofsd) printf "%s" -Dvirtiofsd=disabled ;;
     --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
     --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vnc) printf "%s" -Dvnc=enabled ;;
diff --git a/tools/meson.build b/tools/meson.build
index 10eb3a043f..e69de29bb2 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,13 +0,0 @@
-have_virtiofsd = get_option('virtiofsd') \
-    .require(targetos == 'linux',
-             error_message: 'virtiofsd requires Linux') \
-    .require(seccomp.found() and libcap_ng.found(),
-             error_message: 'virtiofsd requires libcap-ng-devel and seccomp-devel') \
-    .require(have_vhost_user,
-             error_message: 'virtiofsd needs vhost-user-support') \
-    .disable_auto_if(not have_tools and not have_system) \
-    .allowed()
-
-if have_virtiofsd
-  subdir('virtiofsd')
-endif
diff --git a/tools/virtiofsd/50-qemu-virtiofsd.json.in b/tools/virtiofsd/50-qemu-virtiofsd.json.in
deleted file mode 100644
index 9bcd86f8dc..0000000000
--- a/tools/virtiofsd/50-qemu-virtiofsd.json.in
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  "description": "QEMU virtiofsd vhost-user-fs",
-  "type": "fs",
-  "binary": "@libexecdir@/virtiofsd"
-}
diff --git a/tools/virtiofsd/meson.build b/tools/virtiofsd/meson.build
deleted file mode 100644
index c134ba633f..0000000000
--- a/tools/virtiofsd/meson.build
+++ /dev/null
@@ -1,18 +0,0 @@
-executable('virtiofsd', files(
-  'buffer.c',
-  'fuse_opt.c',
-  'fuse_log.c',
-  'fuse_lowlevel.c',
-  'fuse_signals.c',
-  'fuse_virtio.c',
-  'helper.c',
-  'passthrough_ll.c',
-  'passthrough_seccomp.c'),
-  dependencies: [seccomp, qemuutil, libcap_ng, vhost_user],
-  install: true,
-  install_dir: get_option('libexecdir'))
-
-configure_file(input: '50-qemu-virtiofsd.json.in',
-               output: '50-qemu-virtiofsd.json',
-               configuration: { 'libexecdir' : get_option('prefix') / get_option('libexecdir') },
-               install_dir: qemu_datadir / 'vhost-user')
-- 
2.39.1


