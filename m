Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1438301601
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:40:27 +0100 (CET)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K5S-0007b4-JB
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxG-0003cF-Of
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxE-0005sA-Bb
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uybAWdoLQwQvU7VwVmZxQwP2o4hxWTfnK5pVNZ0fiZg=;
 b=eLAixVqHHRDcwdaTRgUv9r8WZ4P2UNSGg3OYC+SR4bSSk3nuaa2xt+92hw+ExcAnkcPHYD
 U1SMdeM1eyYW5atOM69f0KN7x1+WM27J7yZAC1LNN0v1ShVToWGl4Mph/EJ4sV3Xa5W/8L
 KBNn7p5qkN1AlrHFB3XwL0B8skgMI5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-2KCFRnnzNyOr80gu5-ocrQ-1; Sat, 23 Jan 2021 09:31:53 -0500
X-MC-Unique: 2KCFRnnzNyOr80gu5-ocrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBC2FE751
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8E8C19C44;
 Sat, 23 Jan 2021 14:31:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/31] meson: Display host binaries information altogether
Date: Sat, 23 Jan 2021 09:31:13 -0500
Message-Id: <20210123143128.1167797-17-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index f50a85e728..bda28de52c 100644
--- a/meson.build
+++ b/meson.build
@@ -2256,8 +2256,25 @@ summary_info += {'Source path':       meson.current_source_dir()}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
 summary(summary_info, bool_yn: true, section: 'Directories')
 
+# Host binaries
+summary_info = {}
+summary_info += {'git':               config_host['GIT']}
+summary_info += {'make':              config_host['MAKE']}
+summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
+summary_info += {'sphinx-build':      sphinx_build.found()}
+if config_host.has_key('HAVE_GDB_BIN')
+  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
+endif
+summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
+if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
+  summary_info += {'wixl':            wixl.found() ? wixl.full_path() : false}
+endif
+if slirp_opt != 'disabled'
+  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
+endif
+summary(summary_info, bool_yn: true, section: 'Host binaries')
+
 summary_info = {}
-summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2283,15 +2300,8 @@ if link_args.length() > 0
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
-summary_info += {'make':              config_host['MAKE']}
-summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
-summary_info += {'sphinx-build':      sphinx_build.found()}
-summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-if slirp_opt != 'disabled'
-  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
-endif
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
@@ -2415,7 +2425,6 @@ if targetos == 'windows'
   if config_host.has_key('CONFIG_GUEST_AGENT')
     summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
     summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
-    summary_info += {'QGA MSI support':   wixl.found()}
   endif
 endif
 summary_info += {'seccomp support':   seccomp.found()}
@@ -2459,9 +2468,6 @@ summary_info += {'libudev':           libudev.found()}
 summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
-if config_host.has_key('HAVE_GDB_BIN')
-  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
-endif
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
-- 
2.26.2



