Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D54C0275
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:53:02 +0100 (CET)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbDY-0001ub-VB
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1k-0000Hl-1M
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1i-00084O-60
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645558845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0VBOMKwrp2WmWwIazOMoGHx8MdlvWtcmMVOmJtamyw=;
 b=LF0zgZ1y9fqOkXvf72ikvFpvR3IPFESieg+vkoBhnJx96CQKP7lql4U1iastzUrsYDVKxn
 weZjCGkUI1Mqe/CRJOXn32MABfxL2QwSEJky6816PM/tdPEklKHVg5iEML9h8GGHWp3uHR
 XegArB8RwUZRTIGcRFWsJ9RwgHWYSDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-Hk3VoSHSOR-gzmhyDyES1A-1; Tue, 22 Feb 2022 14:40:42 -0500
X-MC-Unique: Hk3VoSHSOR-gzmhyDyES1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37CC31091DA2;
 Tue, 22 Feb 2022 19:40:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A351345D71;
 Tue, 22 Feb 2022 19:40:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] meson: drop the .fa library suffix
Date: Tue, 22 Feb 2022 23:40:04 +0400
Message-Id: <20220222194008.610377-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220222194008.610377-1-marcandre.lureau@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The .fa suffix was a temporary hack introduced in commit
1f0a1d8a51 ("build-sys hack: link with whole .fa archives") when the
build system was mixed between meson & makefiles. It is no longer
needed.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/build-system.rst    |  5 -----
 meson.build                    | 18 +++---------------
 tests/qtest/libqos/meson.build |  1 -
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 431caba7aa06..75c30b819799 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -154,15 +154,10 @@ Subsystem sourcesets:
   are then turned into static libraries as follows::
 
     libchardev = static_library('chardev', chardev_ss.sources(),
-                                name_suffix: 'fa',
                                 build_by_default: false)
 
     chardev = declare_dependency(link_whole: libchardev)
 
-  As of Meson 0.55.1, the special ``.fa`` suffix should be used for everything
-  that is used with ``link_whole``, to ensure that the link flags are placed
-  correctly in the command line.
-
 Target-independent emulator sourcesets:
   Various general purpose helper code is compiled only once and
   the .o files are linked into all output binaries that need it.
diff --git a/meson.build b/meson.build
index 101a3f2d31ee..40abe86767e8 100644
--- a/meson.build
+++ b/meson.build
@@ -2940,15 +2940,13 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
 
 qom_ss = qom_ss.apply(config_host, strict: false)
 libqom = static_library('qom', qom_ss.sources() + genh,
-                        dependencies: [qom_ss.dependencies()],
-                        name_suffix: 'fa')
+                        dependencies: [qom_ss.dependencies()])
 
 qom = declare_dependency(link_whole: libqom)
 
 authz_ss = authz_ss.apply(config_host, strict: false)
 libauthz = static_library('authz', authz_ss.sources() + genh,
                           dependencies: [authz_ss.dependencies()],
-                          name_suffix: 'fa',
                           build_by_default: false)
 
 authz = declare_dependency(link_whole: libauthz,
@@ -2957,7 +2955,6 @@ authz = declare_dependency(link_whole: libauthz,
 crypto_ss = crypto_ss.apply(config_host, strict: false)
 libcrypto = static_library('crypto', crypto_ss.sources() + genh,
                            dependencies: [crypto_ss.dependencies()],
-                           name_suffix: 'fa',
                            build_by_default: false)
 
 crypto = declare_dependency(link_whole: libcrypto,
@@ -2967,13 +2964,11 @@ io_ss = io_ss.apply(config_host, strict: false)
 libio = static_library('io', io_ss.sources() + genh,
                        dependencies: [io_ss.dependencies()],
                        link_with: libqemuutil,
-                       name_suffix: 'fa',
                        build_by_default: false)
 
 io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
 
 libmigration = static_library('migration', sources: migration_files + genh,
-                              name_suffix: 'fa',
                               build_by_default: false)
 migration = declare_dependency(link_with: libmigration,
                                dependencies: [zlib, qom, io])
@@ -2983,7 +2978,6 @@ block_ss = block_ss.apply(config_host, strict: false)
 libblock = static_library('block', block_ss.sources() + genh,
                           dependencies: block_ss.dependencies(),
                           link_depends: block_syms,
-                          name_suffix: 'fa',
                           build_by_default: false)
 
 block = declare_dependency(link_whole: [libblock],
@@ -2993,7 +2987,6 @@ block = declare_dependency(link_whole: [libblock],
 blockdev_ss = blockdev_ss.apply(config_host, strict: false)
 libblockdev = static_library('blockdev', blockdev_ss.sources() + genh,
                              dependencies: blockdev_ss.dependencies(),
-                             name_suffix: 'fa',
                              build_by_default: false)
 
 blockdev = declare_dependency(link_whole: [libblockdev],
@@ -3002,13 +2995,11 @@ blockdev = declare_dependency(link_whole: [libblockdev],
 qmp_ss = qmp_ss.apply(config_host, strict: false)
 libqmp = static_library('qmp', qmp_ss.sources() + genh,
                         dependencies: qmp_ss.dependencies(),
-                        name_suffix: 'fa',
                         build_by_default: false)
 
 qmp = declare_dependency(link_whole: [libqmp])
 
 libchardev = static_library('chardev', chardev_ss.sources() + genh,
-                            name_suffix: 'fa',
                             dependencies: [gnutls],
                             build_by_default: false)
 
@@ -3016,7 +3007,6 @@ chardev = declare_dependency(link_whole: libchardev)
 
 hwcore_ss = hwcore_ss.apply(config_host, strict: false)
 libhwcore = static_library('hwcore', sources: hwcore_ss.sources() + genh,
-                           name_suffix: 'fa',
                            build_by_default: false)
 hwcore = declare_dependency(link_whole: libhwcore)
 common_ss.add(hwcore)
@@ -3047,8 +3037,7 @@ common_all = static_library('common',
                             sources: common_all.sources() + genh,
                             include_directories: common_user_inc,
                             implicit_include_directories: false,
-                            dependencies: common_all.dependencies(),
-                            name_suffix: 'fa')
+                            dependencies: common_all.dependencies())
 
 feature_to_c = find_program('scripts/feature_to_c.sh')
 
@@ -3145,8 +3134,7 @@ foreach target : target_dirs
                  objects: objects,
                  include_directories: target_inc,
                  c_args: c_args,
-                 build_by_default: false,
-                 name_suffix: 'fa')
+                 build_by_default: false)
 
   if target.endswith('-softmmu')
     execs = [{
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index e988d1579172..c175c57768cd 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -57,7 +57,6 @@ libqos_srcs = files('../libqtest.c',
 )
 
 libqos = static_library('qos', libqos_srcs + genh,
-                        name_suffix: 'fa',
                         build_by_default: false)
 
 qos = declare_dependency(link_whole: libqos)
-- 
2.35.1.273.ge6ebfd0e8cbb


