Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDA2E8759
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 13:54:34 +0100 (CET)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvgQT-000260-Cr
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 07:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvgOM-00005C-Po; Sat, 02 Jan 2021 07:52:22 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:38192 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvgOK-0000HS-Jb; Sat, 02 Jan 2021 07:52:22 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1DF7541317;
 Sat,  2 Jan 2021 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1609591936; x=
 1611406337; bh=1UPTzxjLx3pC3bzB9AMpf02WJ5avAKXZg6ODxlGNZgo=; b=m
 jLHt2iIni0qFMr57Ekjc2DotcraaiyTaHuHmYLBsPQwBQH+JINI1z6ydO0c7rezU
 vO1rvEgaZbpCiTlXhU1XUxV/qMPyqQCHZfpCMuNYWLb+/aKm6Orb74sa2MBjvZu7
 T1qUw1oTTXTJO9OlWPbD3eI9Jot+2Oem25AQHvJoE0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ia6uzZLJrX7; Sat,  2 Jan 2021 15:52:16 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D16FD4130C;
 Sat,  2 Jan 2021 15:52:16 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 2 Jan
 2021 15:52:16 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] meson: Propagate gnutls dependency
Date: Sat, 2 Jan 2021 15:52:13 +0300
Message-ID: <20210102125213.41279-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block
 layer core" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

crypto/tlscreds.h includes GnuTLS headers if CONFIG_GNUTLS is set, but
GNUTLS_CFLAGS, that describe include path, are not propagated
transitively to all users of crypto and build fails if GnuTLS headers
reside in non-standard directory (which is a case for homebrew on Apple
Silicon).

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 block/meson.build          | 2 +-
 io/meson.build             | 2 +-
 meson.build                | 5 +++--
 storage-daemon/meson.build | 2 +-
 tests/meson.build          | 6 +++---
 ui/meson.build             | 2 +-
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 5dcc1e5cce..61fc5e5955 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -39,7 +39,7 @@ block_ss.add(files(
   'vmdk.c',
   'vpc.c',
   'write-threshold.c',
-), zstd, zlib)
+), zstd, zlib, gnutls)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
 
diff --git a/io/meson.build b/io/meson.build
index bcd8b1e737..bbcd3c53a4 100644
--- a/io/meson.build
+++ b/io/meson.build
@@ -12,4 +12,4 @@ io_ss.add(files(
   'dns-resolver.c',
   'net-listener.c',
   'task.c',
-))
+), gnutls)
diff --git a/meson.build b/meson.build
index 372576f82c..d39fc018f4 100644
--- a/meson.build
+++ b/meson.build
@@ -1567,7 +1567,7 @@ blockdev_ss.add(files(
   'blockdev-nbd.c',
   'iothread.c',
   'job-qmp.c',
-))
+), gnutls)
 
 # os-posix.c contains POSIX-specific functions used by qemu-storage-daemon,
 # os-win32.c does not
@@ -1723,6 +1723,7 @@ qmp = declare_dependency(link_whole: [libqmp])
 
 libchardev = static_library('chardev', chardev_ss.sources() + genh,
                             name_suffix: 'fa',
+                            dependencies: [gnutls],
                             build_by_default: false)
 
 chardev = declare_dependency(link_whole: libchardev)
@@ -1941,7 +1942,7 @@ if have_tools
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
-               dependencies: [blockdev, qemuutil], install: true)
+               dependencies: [blockdev, qemuutil, gnutls], install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
diff --git a/storage-daemon/meson.build b/storage-daemon/meson.build
index c5adce81c3..68852f3d25 100644
--- a/storage-daemon/meson.build
+++ b/storage-daemon/meson.build
@@ -1,6 +1,6 @@
 qsd_ss = ss.source_set()
 qsd_ss.add(files('qemu-storage-daemon.c'))
-qsd_ss.add(blockdev, chardev, qmp, qom, qemuutil)
+qsd_ss.add(blockdev, chardev, qmp, qom, qemuutil, gnutls)
 
 subdir('qapi')
 
diff --git a/tests/meson.build b/tests/meson.build
index 1fa068f27b..29ebaba48d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -159,11 +159,11 @@ if have_block
      'CONFIG_POSIX' in config_host
     tests += {
       'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-                                   tasn1, crypto],
+                                   tasn1, crypto, gnutls],
       'test-crypto-tlssession': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c', 'crypto-tls-psk-helpers.c',
-                                 tasn1, crypto],
+                                 tasn1, crypto, gnutls],
       'test-io-channel-tls': ['io-channel-helpers.c', 'crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-                              tasn1, io, crypto]}
+                              tasn1, io, crypto, gnutls]}
   endif
   if 'CONFIG_AUTH_PAM' in config_host
     tests += {'test-authz-pam': [authz]}
diff --git a/ui/meson.build b/ui/meson.build
index 013258a01c..e6655c94a6 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -29,7 +29,7 @@ vnc_ss.add(files(
   'vnc-ws.c',
   'vnc-jobs.c',
 ))
-vnc_ss.add(zlib, png, jpeg)
+vnc_ss.add(zlib, png, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-- 
2.29.2


