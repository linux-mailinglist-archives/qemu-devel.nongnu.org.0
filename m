Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA430160F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:49:24 +0100 (CET)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KE7-0001TG-G5
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxI-0003hV-Qj
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxG-0005sx-Kj
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exQwdIRyQkCJHpx1P5EM6Y7jLeOrh5wNXWqzZ8P5VD4=;
 b=Gpu9lEndFlfIyyFtLdKU0hfZ+jHsviNQbzWKKjsMeMiYJrmdIJVo4FGRzyAnWycdNoenNT
 sQ7hEp4lmnTrFzhJSiaHEQzJmxnJxiXelK4KutQvyKEdqsnJX6cpTA4X+0otu143adlSea
 3IROb8NTzEaGXyiooquaz2NmJ7+hJRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-LGqc42j_MG2egeUjQVklqg-1; Sat, 23 Jan 2021 09:31:56 -0500
X-MC-Unique: LGqc42j_MG2egeUjQVklqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16949180A093
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6CEC5D9CC;
 Sat, 23 Jan 2021 14:31:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/31] meson: Display block layer information altogether
Date: Sat, 23 Jan 2021 09:31:17 -0500
Message-Id: <20210123143128.1167797-21-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Display block layer information altogether,
when it is relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-7-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index 7bd96f8a8a..dbac95890d 100644
--- a/meson.build
+++ b/meson.build
@@ -2279,6 +2279,7 @@ summary_info = {}
 summary_info += {'Documentation':     build_docs}
 summary_info += {'system-mode emulation': have_system}
 summary_info += {'user-mode emulation': have_user}
+summary_info += {'block layer':       have_block}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
@@ -2391,6 +2392,30 @@ if have_system
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
+# Block layer
+summary_info = {}
+summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
+summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
+if have_block
+  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
+  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+  summary_info += {'VirtFS support':    have_virtfs}
+  summary_info += {'build virtiofs daemon': have_virtiofsd}
+  summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
+  summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
+  summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
+  summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
+  summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
+  summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
+  summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
+  summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
+  summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
+  summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
+  summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
+  summary_info += {'FUSE exports':      fuse.found()}
+endif
+summary(summary_info, bool_yn: true, section: 'Block layer support')
+
 summary_info = {}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
@@ -2425,10 +2450,6 @@ summary_info += {'curses support':    curses.found()}
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
-summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
-summary_info += {'VirtFS support':    have_virtfs}
-summary_info += {'build virtiofs daemon': have_virtiofsd}
 summary_info += {'Multipath support': mpathpersist.found()}
 summary_info += {'VNC support':       vnc.found()}
 if vnc.found()
@@ -2465,13 +2486,10 @@ if targetos == 'windows'
   endif
 endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
-summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
-summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
@@ -2479,23 +2497,12 @@ summary_info += {'lzfse support':     liblzfse.found()}
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
-summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
-summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
-summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
-summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
-summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
-summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
-summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
-summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
-summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
-summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true)
 
-- 
2.26.2



