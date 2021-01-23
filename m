Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B27530160B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:46:49 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KBc-0006EQ-GP
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxI-0003gV-Fd
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxG-0005sr-Ci
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUbLvna6ndicFX6PQT1r6QyMA5nKUayYCTgP8P+sH2c=;
 b=JCVPFb9quQjTup7hqcYPFRwug8TRWu1dPyfwGlb9ybEZPVavyJSsa9nm3SZ6AEwAFRLvFe
 hfKKIRHjVyDGcwzSprOuMgbRTWr2iDQVXOmr/sj3DUdnAK0xvtLLWJkvpV/Xm91H/8qmTi
 YLhK75BRBuAwSxq3osPxsJWW5cuQJ8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-5Ah0jY9-NoesitrasZEClQ-1; Sat, 23 Jan 2021 09:31:55 -0500
X-MC-Unique: 5Ah0jY9-NoesitrasZEClQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23D07806679
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D421419C44;
 Sat, 23 Jan 2021 14:31:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/31] meson: Display accelerators and selected targets
 altogether
Date: Sat, 23 Jan 2021 09:31:16 -0500
Message-Id: <20210123143128.1167797-20-pbonzini@redhat.com>
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

Display accelerators and selected targets altogether,
avoid to display unuseful information when not relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-6-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index 3b2332b94d..7bd96f8a8a 100644
--- a/meson.build
+++ b/meson.build
@@ -2277,6 +2277,8 @@ summary(summary_info, bool_yn: true, section: 'Host binaries')
 # Configurable features
 summary_info = {}
 summary_info += {'Documentation':     build_docs}
+summary_info += {'system-mode emulation': have_system}
+summary_info += {'user-mode emulation': have_user}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
@@ -2366,8 +2368,30 @@ summary_info += {'sparse':            sparse.found() ? sparse.full_path() : fals
 summary_info += {'mingw32 support':   targetos == 'windows'}
 summary(summary_info, bool_yn: true, section: 'Compilation')
 
+# Targets and accelerators
 summary_info = {}
+if have_system
+  summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
+  summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
+  summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
+  summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+  summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
+  if config_host.has_key('CONFIG_XEN_BACKEND')
+    summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+  endif
+endif
+summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
+if config_all.has_key('CONFIG_TCG')
+  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
+  summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
+endif
 summary_info += {'target list':       ' '.join(target_dirs)}
+if have_system
+  summary_info += {'default devices':   get_option('default_devices')}
+endif
+summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
+
+summary_info = {}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
 endif
@@ -2412,25 +2436,12 @@ if vnc.found()
   summary_info += {'VNC JPEG support':  jpeg.found()}
   summary_info += {'VNC PNG support':   png.found()}
 endif
-summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
-if config_host.has_key('CONFIG_XEN_BACKEND')
-  summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
-endif
 summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
 summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
-summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
-summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
-summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
-summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
-if config_all.has_key('CONFIG_TCG')
-  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
-endif
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
@@ -2482,7 +2493,6 @@ summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capst
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
-- 
2.26.2



