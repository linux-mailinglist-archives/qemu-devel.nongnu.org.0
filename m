Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51B276E0D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLO2P-00014f-HK
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNU1-0001fF-D4
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTy-00068L-3z
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qosqWaVCW70nHPj7Njwr2XC/xGhCuEevp3Y/Mal6D+I=;
 b=SKxjpazLejS8Adg1972jJ55BRtaFKaxC89qocl0Gx12cuPWWMbfN5PEJagd3b8+f6xa57F
 SU7lFG2m70YSPYxW/ZOwbfvsYlrjIGHmPojeQc+q7GDhtOuImTAcm5HWIrs8xZRgBsuC96
 eWfPT7qg9BGXtmjOI6DGkhLONjeafJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-gxMX46t_P1K2j1TyLSzX8A-1; Thu, 24 Sep 2020 05:24:03 -0400
X-MC-Unique: gxMX46t_P1K2j1TyLSzX8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63B94801001;
 Thu, 24 Sep 2020 09:24:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2354A5C1DC;
 Thu, 24 Sep 2020 09:24:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 59/92] configure: cleanup invocation of submodule Make
Date: Thu, 24 Sep 2020 05:22:41 -0400
Message-Id: <20200924092314.1722645-60-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move common command line options to SUBDIR_MAKEFLAGS, thus simplifying
the rules themselves.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 897246d77c..f83226e0e1 100644
--- a/Makefile
+++ b/Makefile
@@ -137,7 +137,13 @@ configure: ;
 .PHONY: all clean distclean install \
 	recurse-all dist msi FORCE
 
-SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
+SUBMODULE_CFLAGS = $(QEMU_CFLAGS) $(CFLAGS)
+SUBDIR_MAKEFLAGS = $(if $(V),,--no-print-directory --quiet)
+SUBDIR_HOST_VARS = 							\
+	PKG_CONFIG="$(PKG_CONFIG)" 					\
+	CC="$(CC)" AR="$(AR)" LD="$(LD)" RANLIB="$(RANLIB)"		\
+	CFLAGS="$(SUBMODULE_CFLAGS)" LDFLAGS="$(SUBMODULE_LDFLAGS)"	\
+	ARFLAGS="$(ARFLAGS)"
 
 include $(SRC_PATH)/tests/Makefile.include
 
@@ -146,12 +152,12 @@ Makefile: $(addsuffix /all, $(SUBDIRS))
 
 # LIBFDT_lib="": avoid breaking existing trees with objects requiring -fPIC
 DTC_MAKE_ARGS=-I$(SRC_PATH)/dtc VPATH=$(SRC_PATH)/dtc -C dtc V="$(V)" LIBFDT_lib=""
-DTC_CFLAGS=$(CFLAGS) $(QEMU_CFLAGS)
 DTC_CPPFLAGS=-I$(SRC_PATH)/dtc/libfdt
 
 .PHONY: dtc/all
 dtc/all: .git-submodule-status dtc/libfdt
-	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS="$(DTC_CPPFLAGS)" CFLAGS="$(DTC_CFLAGS)" LDFLAGS="$(QEMU_LDFLAGS)" ARFLAGS="$(ARFLAGS)" CC="$(CC)" AR="$(AR)" LD="$(LD)" $(SUBDIR_MAKEFLAGS) libfdt,)
+	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS)			\
+            CPPFLAGS="$(DTC_CPPFLAGS)" $(SUBDIR_MAKEFLAGS) $(SUBDIR_HOST_VARS) libfdt,)
 
 dtc/%: .git-submodule-status
 	@mkdir -p $@
@@ -161,7 +167,7 @@ dtc/%: .git-submodule-status
 # Therefore we replicate some of the logic in the sub-makefile.
 # Remove all the extra -Warning flags that QEMU uses that Capstone doesn't;
 # no need to annoy QEMU developers with such things.
-CAP_CFLAGS = $(patsubst -W%,,$(CFLAGS) $(QEMU_CFLAGS)) $(CAPSTONE_CFLAGS)
+CAP_CFLAGS := $(patsubst -W%,,$(SUBMODULE_CFLAGS)) $(CAPSTONE_CFLAGS)
 CAP_CFLAGS += -DCAPSTONE_USE_SYS_DYN_MEM
 CAP_CFLAGS += -DCAPSTONE_HAS_ARM
 CAP_CFLAGS += -DCAPSTONE_HAS_ARM64
@@ -169,16 +175,17 @@ CAP_CFLAGS += -DCAPSTONE_HAS_POWERPC
 CAP_CFLAGS += -DCAPSTONE_HAS_X86
 
 .PHONY: capstone/all
+capstone/all: SUBMODULE_CFLAGS = $(CAP_CFLAGS)
 capstone/all: .git-submodule-status
-	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/capstone CAPSTONE_SHARED=no BUILDDIR="$(BUILD_DIR)/capstone" CC="$(CC)" AR="$(AR)" LD="$(LD)" RANLIB="$(RANLIB)" CFLAGS="$(CAP_CFLAGS)" $(SUBDIR_MAKEFLAGS) $(BUILD_DIR)/capstone/$(LIBCAPSTONE))
+	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/capstone 		\
+            CAPSTONE_SHARED=no BUILDDIR="$(BUILD_DIR)/capstone" 	\
+            $(SUBDIR_MAKEFLAGS) $(SUBDIR_HOST_VARS) $(BUILD_DIR)/capstone/$(LIBCAPSTONE))
 
 .PHONY: slirp/all
 slirp/all: .git-submodule-status
 	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/slirp		\
-		BUILD_DIR="$(BUILD_DIR)/slirp" 			\
-		PKG_CONFIG="$(PKG_CONFIG)" 				\
-		CC="$(CC)" AR="$(AR)" 	LD="$(LD)" RANLIB="$(RANLIB)"	\
-		CFLAGS="$(QEMU_CFLAGS) $(CFLAGS)" LDFLAGS="$(QEMU_LDFLAGS)")
+		BUILD_DIR="$(BUILD_DIR)/slirp" 				\
+		$(SUBDIR_MAKEFLAGS) $(SUBDIR_HOST_VARS))
 
 ROM_DIRS = $(addprefix pc-bios/, $(ROMS))
 ROM_DIRS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROM_DIRS)))
-- 
2.26.2



