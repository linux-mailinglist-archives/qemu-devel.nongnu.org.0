Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B224D3EA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:27:22 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95Cb-0004x8-8i
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Eq-00040v-JC
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60629
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ee-0001y8-Gp
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/MX6gGzR4nifVmk7o4WBP4FBHG2TAPSAUCLE6oDk3c=;
 b=DZQ9tUk2/AXlG2ytF+mXCLw7ZFGc5YKA/uhTcLFUe333sT/m4+V9fZW4h7zEBRforKwx5w
 WSEuqVHMKS/GFgF1rfnM8RaqOAkyS4VN1z9kzj1HqI2qmdja7AknMPX8PFv5r2m581B4ye
 D+6x/5UTYTKGsPmwdonBIbfX9JGlXZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-pnBUK4pXNFSAlsFI0bgbyg-1; Fri, 21 Aug 2020 06:25:21 -0400
X-MC-Unique: pnBUK4pXNFSAlsFI0bgbyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8371801AE8
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96A5C7AEC5;
 Fri, 21 Aug 2020 10:25:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 138/152] rules.mak: remove version.o
Date: Fri, 21 Aug 2020 06:23:15 -0400
Message-Id: <20200821102329.29777-139-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile      | 5 -----
 Makefile.objs | 4 ----
 rules.mak     | 4 +---
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index fe8c63acad..1bd6106f87 100644
--- a/Makefile
+++ b/Makefile
@@ -241,11 +241,6 @@ recurse-clean: $(addsuffix /clean, $(TARGET_DIRS) $(ROM_DIRS))
 recurse-install: $(addsuffix /install, $(TARGET_DIRS))
 $(addsuffix /install, $(TARGET_DIRS)): all
 
-$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h
-	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"RC","version.o")
-
-Makefile: $(version-obj-y)
-
 ######################################################################
 
 clean: recurse-clean ninja-clean clean-ctlist
diff --git a/Makefile.objs b/Makefile.objs
index 5295c3a623..c351b59641 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -32,7 +32,3 @@ crypto-obj-y = crypto/libcrypto.fa
 io-obj-y = io/libio.fa
 
 endif # CONFIG_SOFTMMU or CONFIG_TOOLS
-
-######################################################################
-# Resource file for Windows executables
-version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
diff --git a/rules.mak b/rules.mak
index b983c7f83f..6d89001f0a 100644
--- a/rules.mak
+++ b/rules.mak
@@ -77,8 +77,6 @@ expand-objs = $(strip $(sort $(filter %.o,$1)) \
 	$(call quiet-command,$(CC) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
 	       $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) $($@-cflags) \
 	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
-%.o: %.rc
-	$(call quiet-command,$(WINDRES) -I. -o $@ $<,"RC","$(TARGET_DIR)$@")
 
 # If we have a CXX we might have some C++ objects, in which case we
 # must link with the C++ compiler, not the plain C compiler.
@@ -86,7 +84,7 @@ LINKPROG = $(or $(CXX),$(CC))
 
 LINK = $(call quiet-command, $(LINKPROG) $(CFLAGS) $(QEMU_LDFLAGS) -o $@ \
        $(call process-archive-undefs, $1) \
-       $(version-obj-y) $(call extract-libs,$1) $(LIBS),"LINK","$(TARGET_DIR)$@")
+       $(call extract-libs,$1) $(LIBS),"LINK","$(TARGET_DIR)$@")
 
 %.o: %.S
 	$(call quiet-command,$(CCAS) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
-- 
2.26.2



