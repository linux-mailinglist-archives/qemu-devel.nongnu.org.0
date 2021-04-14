Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3735F225
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:23:07 +0200 (CEST)
Received: from localhost ([::1]:54698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWdbu-0002FJ-9n
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZS-0000UK-IV
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZP-0001kg-RZ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618399231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHRr0N2veFub02XSfrReSb3Md2yvPR//bVW1YOV4PVA=;
 b=DjtA5MLGKmSLn6tD0gn6kcCS8ZFPFnVV2UthIOoU3KotcUNFnQi0nTJI6G2kchQs3mx/4p
 cX9EaaC/r5humcp8qfls7E2wp2e99/Svxjz49PPbj6AF9kDlWobql/63y3bX05gOWz7rU+
 kVW16FnqSDMScUluFaE6kixigbfNy4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-wdq5FaGuNr66d4xAwya-jQ-1; Wed, 14 Apr 2021 07:20:27 -0400
X-MC-Unique: wdq5FaGuNr66d4xAwya-jQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41819107ACCD;
 Wed, 14 Apr 2021 11:20:26 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C05F101E24F;
 Wed, 14 Apr 2021 11:20:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1 4/4] configure: Poison all current target-specific
 #defines
Date: Wed, 14 Apr 2021 13:20:04 +0200
Message-Id: <20210414112004.943383-5-thuth@redhat.com>
In-Reply-To: <20210414112004.943383-1-thuth@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generating a lot of target-specific defines in the *-config-devices.h
and *-config-target.h files. Using them in common code is wrong and leads
to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
as expected. To avoid these issues, we are already poisoning many of the
macros in include/exec/poison.h - but it's cumbersome to maintain this
list manually. Thus let's generate an additional list of poisoned macros
automatically from the current config switches - this should give us a
much better test coverage via the different CI configurations.

Note that CONFIG_TCG (which is also defined in config-host.h) and
CONFIG_USER_ONLY are special, so we have to filter these out.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile              | 2 +-
 configure             | 5 +++++
 include/exec/poison.h | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bcbbec71a1..4cab10a2a4 100644
--- a/Makefile
+++ b/Makefile
@@ -213,7 +213,7 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak config-host.h*
+	rm -f config-host.mak config-host.h* config-poison.h
 	rm -f tests/tcg/config-*.mak
 	rm -f config-all-disas.mak config.status
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
diff --git a/configure b/configure
index 4f374b4889..a0f0601e7e 100755
--- a/configure
+++ b/configure
@@ -6440,6 +6440,11 @@ if test -n "${deprecated_features}"; then
     echo "  features: ${deprecated_features}"
 fi
 
+sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
+    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
+    *-config-devices.h *-config-target.h | \
+    sort -u > config-poison.h
+
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
 #!/bin/sh
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 3250fc1d52..ae2f9d1e70 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -4,6 +4,8 @@
 #ifndef HW_POISON_H
 #define HW_POISON_H
 
+#include "config-poison.h"
+
 #pragma GCC poison TARGET_I386
 #pragma GCC poison TARGET_X86_64
 #pragma GCC poison TARGET_AARCH64
-- 
2.27.0


