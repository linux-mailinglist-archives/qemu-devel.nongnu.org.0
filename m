Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC0276D9A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:38:01 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNhQ-0002oV-Te
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTf-0000os-BM
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTX-00060v-45
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntPmSBCfbzMvBnQ7AeL6nrkcCAwUFiK5wJ+BZs89mls=;
 b=N7XKnCjYf1k32qaRQp0fdCOLFY6jqibFl2qnh1VXqpQKdTvPBYEJIjSLq9km3NsL1Lbpxz
 7hHFNYqpycyTFLwvSH+HAbWCrzNfQcEwIkPitNLXj9uIojiZFzq/rkWJ6naMQbddu2kjq+
 NSU5Iae4g5/KxitmR9TEYlLo3jhK2gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-cjHQbwpgNzmgN-qpH9x01w-1; Thu, 24 Sep 2020 05:23:33 -0400
X-MC-Unique: cjHQbwpgNzmgN-qpH9x01w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAE1802EA3
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:23:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A81667881A;
 Thu, 24 Sep 2020 09:23:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/92] configure: rename QEMU_GA_MSI_ENABLED to CONFIG_QGA_MSI
Date: Thu, 24 Sep 2020 05:22:00 -0400
Message-Id: <20200924092314.1722645-19-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The QEMU_GA_MSI_ENABLED config-host.mak variable is emitted by
./configure. meson.build actually checks for CONFIG_QGA_MSI_ENABLED:

  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI_ENABLED')}

Rename QEMU_GA_MSI_ENABLED to CONFIG_QGA_MSI for consistency with
CONFIG_QGA_VSS. Also use 'y' instead of 'yes' for consistency.

This fixes the feature summary printed by meson.build.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200914095231.621068-4-stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile    | 2 +-
 configure   | 2 +-
 meson.build | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 7c60b9dcb8..42d90cb597 100644
--- a/Makefile
+++ b/Makefile
@@ -285,7 +285,7 @@ endif
 ifdef CONFIG_WIN32
 	@echo  'Windows targets:'
 	$(call print-help,installer,Build NSIS-based installer for QEMU)
-ifdef QEMU_GA_MSI_ENABLED
+ifdef CONFIG_QGA_MSI
 	$(call print-help,msi,Build MSI-based installer for qemu-ga)
 endif
 	@echo  ''
diff --git a/configure b/configure
index db9ec3231f..01fce2e94b 100755
--- a/configure
+++ b/configure
@@ -6576,7 +6576,7 @@ if test "$mingw32" = "yes" ; then
     echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
   fi
   if test "$guest_agent_msi" = "yes"; then
-    echo "QEMU_GA_MSI_ENABLED=yes" >> $config_host_mak
+    echo "CONFIG_QGA_MSI=y" >> $config_host_mak
     echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
     echo "QEMU_GA_MSI_WITH_VSS=${QEMU_GA_MSI_WITH_VSS}" >> $config_host_mak
     echo "QEMU_GA_MSI_ARCH=${QEMU_GA_MSI_ARCH}" >> $config_host_mak
diff --git a/meson.build b/meson.build
index bb4259e7f0..c48ca0d12a 100644
--- a/meson.build
+++ b/meson.build
@@ -1482,7 +1482,7 @@ if targetos == 'windows'
   endif
   summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
   summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
-  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI_ENABLED')}
+  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
-- 
2.26.2



