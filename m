Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB91251EC7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 20:02:58 +0200 (CEST)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdHd-0004hz-Th
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 14:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAdDm-0008HN-L6
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 13:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAdDk-0003SV-Rj
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 13:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598378335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrB6eiMbxp32SBkm8uz7db0X+q445dB/jQqAAccAcZY=;
 b=Ryq4XiQPm2PQKF16+LzuSbX0IwBCcg/rJ4Oa9MU84kiWq2qrjFxhhHex2UDh7UmWffvhDD
 uaZLFJyeekmtQVfr4aMKGI+MBu6Qqx1ynqLdY1pOuslDtPgpAzUqrXYN1zlkclqE33OVHI
 QGa1v7xR5XKa5+aAvzdgVb+jYywhYL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-c5Dy4VhmPdOaTfGdua117g-1; Tue, 25 Aug 2020 13:58:50 -0400
X-MC-Unique: c5Dy4VhmPdOaTfGdua117g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F7D81F01A;
 Tue, 25 Aug 2020 17:58:49 +0000 (UTC)
Received: from localhost (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D914419144;
 Tue, 25 Aug 2020 17:58:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] meson: use meson datadir instead of qemu_datadir
Date: Tue, 25 Aug 2020 21:58:24 +0400
Message-Id: <20200825175827.355940-3-marcandre.lureau@redhat.com>
In-Reply-To: <20200825175827.355940-1-marcandre.lureau@redhat.com>
References: <20200825175827.355940-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: sw@weilnetz.de, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When cross-compiling, by default qemu_datadir is 'c:\Program
Files\QEMU', which is not recognized as being an absolute path, and
meson will end up adding the prefix again.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/meson.build | 2 +-
 meson.build                        | 3 ++-
 pc-bios/descriptors/meson.build    | 2 +-
 pc-bios/keymaps/meson.build        | 6 +++---
 pc-bios/meson.build                | 2 +-
 tools/virtiofsd/meson.build        | 2 +-
 trace/meson.build                  | 2 +-
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index 6c1459f54a..8df4c13bc5 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -9,5 +9,5 @@ if 'CONFIG_TOOLS' in config_host and 'CONFIG_VIRGL' in config_host \
   configure_file(input: '50-qemu-gpu.json.in',
                  output: '50-qemu-gpu.json',
                  configuration: config_host,
-                 install_dir: config_host['qemu_datadir'] / 'vhost-user')
+                 install_dir: qemu_datadir / 'vhost-user')
 endif
diff --git a/meson.build b/meson.build
index f0fe5f8799..20f20a7bfc 100644
--- a/meson.build
+++ b/meson.build
@@ -17,6 +17,7 @@ config_all_disas = keyval.load(meson.current_build_dir() / 'config-all-disas.mak
 enable_modules = 'CONFIG_MODULES' in config_host
 enable_static = 'CONFIG_STATIC' in config_host
 build_docs = 'BUILD_DOCS' in config_host
+qemu_datadir = get_option('datadir') + get_option('confsuffix')
 config_host_data = configuration_data()
 genh = []
 
@@ -1039,7 +1040,7 @@ foreach target : target_dirs
                       output: exe_name + stp['ext'],
                       capture: true,
                       install: stp['install'],
-                      install_dir: config_host['qemu_datadir'] / '../systemtap/tapset',
+                      install_dir: qemu_datadir / '../systemtap/tapset',
                       command: [
                         tracetool, '--group=all', '--format=' + stp['fmt'],
                         '--binary=' + stp['bin'],
diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index 7c715bace8..3798d32372 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -10,5 +10,5 @@ foreach f: [
                  output: f,
                  configuration: {'DATADIR': config_host['qemu_datadir']},
                  install: install_blobs,
-                 install_dir: config_host['qemu_datadir'] / 'firmware')
+                 install_dir: qemu_datadir / 'firmware')
 endforeach
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index b737c82230..bbac83ece3 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -44,13 +44,13 @@ foreach km, args: keymaps
                      build_by_default: true,
                      output: km,
                      command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                     install_dir: config_host['qemu_datadir'] / 'keymaps')
+                     install_dir: qemu_datadir / 'keymaps')
 endforeach
 if t.length() > 0
   alias_target('update-keymaps', t)
 else
   # install from the source tree
-  install_data(keymaps.keys(), install_dir: config_host['qemu_datadir'] / 'keymaps')
+  install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: config_host['qemu_datadir'] / 'keymaps')
+install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index b6389f5148..c11e52ba26 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -19,7 +19,7 @@ if 'DECOMPRESS_EDK2_BLOBS' in config_host
                   input: '@0@.bz2'.format(f),
                   capture: true,
                   install: install_blobs,
-                  install_dir: config_host['qemu_datadir'],
+                  install_dir: qemu_datadir,
                   command: [ bzip2, '-dc', '@INPUT0@' ])
   endforeach
 endif
diff --git a/tools/virtiofsd/meson.build b/tools/virtiofsd/meson.build
index d1e23c5760..50022ed89e 100644
--- a/tools/virtiofsd/meson.build
+++ b/tools/virtiofsd/meson.build
@@ -16,4 +16,4 @@ executable('virtiofsd', files(
 configure_file(input: '50-qemu-virtiofsd.json.in',
                output: '50-qemu-virtiofsd.json',
                configuration: config_host,
-               install_dir: config_host['qemu_datadir'] / 'vhost-user')
+               install_dir: qemu_datadir / 'vhost-user')
diff --git a/trace/meson.build b/trace/meson.build
index 56e870848e..5f0bf11cb5 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -55,7 +55,7 @@ trace_events_all = custom_target('trace-events-all',
                                  command: [ 'cat', '@INPUT@' ],
                                  capture: true,
                                  install: true,
-                                 install_dir: config_host['qemu_datadir'])
+                                 install_dir: qemu_datadir)
 
 foreach d : [
   ['generated-tcg-tracers.h', 'tcg-h'],
-- 
2.26.2


