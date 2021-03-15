Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E281D33B5F6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:57:50 +0100 (CET)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnjB-0006Z3-L4
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLnfq-0002zO-Uw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLnfn-0003Em-HM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615816457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JbPStmWjilW+FBtzt6eJe2p3Bl14UnD5FXHKr41V3XE=;
 b=hY9eF63u30W3bn6f5ya7Hz0Uu/KXPdP6Ly8PfMn8OAZn9q2Ou4XtwrdECnHyo1pkXF1em2
 zV+pXc6Tq3FDWDfj2qLmUtXzAK9M+tLEAu+j1AvVFNw34BZlwvi0fWHbIEThFHFbeyA+Ui
 a9yA7iuie2Pf6mJnjrOauWQxGFoopJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-qeQZKTUVOT6-myx_NHr_Yg-1; Mon, 15 Mar 2021 09:54:14 -0400
X-MC-Unique: qeQZKTUVOT6-myx_NHr_Yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E9E8189C8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 13:54:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B188620DE;
 Mon, 15 Mar 2021 13:54:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] configure: Poison (almost) all target-specific #defines
Date: Mon, 15 Mar 2021 14:54:10 +0100
Message-Id: <20210315135410.221729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generating a lot of target-specific defines in the *-config-devices.h
and *-config-target.h files. Using them in common code is wrong and leads
to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
as expected. To avoid these issues, we are already poisoning some of the
macros in include/exec/poison.h - but maintaining this list manually is
cumbersome. Thus let's generate the list of poisoned macros automatically
instead.
Note that CONFIG_TCG (which is also defined in config-host.h) and
CONFIG_USER_ONLY are special, so we have to filter these out.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 RFC since the shell stuff in "configure" is quite ugly ... maybe there's
 a better way to do this via meson, but my meson-foo is still lacking...

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
index f7d022a5db..c7b5df3a5c 100755
--- a/configure
+++ b/configure
@@ -6441,6 +6441,11 @@ if test -n "${deprecated_features}"; then
     echo "  features: ${deprecated_features}"
 fi
 
+cat *-config-devices.h *-config-target.h | grep '^#define '  \
+    | grep -v CONFIG_TCG | grep -v CONFIG_USER_ONLY \
+    | sed -e 's/#define //' -e 's/ .*//' | sort -u \
+    | sed -e 's/^/#pragma GCC poison /' > config-poison.h
+
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
 #!/bin/sh
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 4cd3f8abb4..9e55d5aec2 100644
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


