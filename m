Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2A29047D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:57:31 +0200 (CEST)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTOMU-0003cw-NQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODh-0000Sx-SU
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODe-0002oY-1L
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wiPjYc6Em8HOqlNdKvEdGTuMiqk8PUd2qPFD0ObUZ7o=;
 b=DQ8RVIzmBca3eIe7Cgc6pXLrh9Qp3ahzigo/kChvbRESQgYu/2qzV4glXcb92lAKYH7jsM
 CVuIL/4wbIKLM77XyXoStaxgShhbsuMNK+2zEwRuPnAkA5/GacAdCEH+GeXxIVgHgE7apn
 6y5RMfGTj8mXqhfbAGBcfVg6PUCCtzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-FisGifmEPs2hwj0sseAaPQ-1; Fri, 16 Oct 2020 07:48:19 -0400
X-MC-Unique: FisGifmEPs2hwj0sseAaPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BF91019626
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 11:48:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E655B76640
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 11:48:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/22] build: cleanups to Makefile
Date: Fri, 16 Oct 2020 07:48:01 -0400
Message-Id: <20201016114814.1564523-10-pbonzini@redhat.com>
In-Reply-To: <20201016114814.1564523-1-pbonzini@redhat.com>
References: <20201016114814.1564523-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 03:57:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Group similar rules, add comments to "else" and "endif" lines,
detect too-old config-host.mak before messing things up.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 91c62a26c8..53d624a0be 100644
--- a/Makefile
+++ b/Makefile
@@ -30,13 +30,21 @@ UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
     help check-help print-% \
     docker docker-% vm-help vm-test vm-build-%
 
+all:
+.PHONY: all clean distclean recurse-all dist msi FORCE
+
+# Don't try to regenerate Makefile or configure
+# We don't generate any of them
+Makefile: ;
+configure: ;
+
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
-# Put the all: rule here so that config-host.mak can contain dependencies.
-all:
 include config-host.mak
 
 git-submodule-update:
+.git-submodule-status: git-submodule-update config-host.mak
+Makefile: .git-submodule-status
 
 .PHONY: git-submodule-update
 
@@ -84,9 +92,7 @@ Makefile.mtest: build.ninja scripts/mtest2make.py
 -include Makefile.mtest
 endif
 
-Makefile: .git-submodule-status
-.git-submodule-status: git-submodule-update config-host.mak
-
+# Ensure the build tree is okay.
 # Check that we're not trying to do an out-of-tree build from
 # a tree that's been used for an in-tree build.
 ifneq ($(realpath $(SRC_PATH)),$(realpath .))
@@ -97,6 +103,20 @@ seems to have been used for an in-tree build. You can fix this by running \
 endif
 endif
 
+# force a rerun of configure if config-host.mak is too old or corrupted
+ifeq ($(MESON),)
+.PHONY: config-host.mak
+x := $(shell rm -rf meson-private meson-info meson-logs)
+endif
+ifeq ($(NINJA),)
+.PHONY: config-host.mak
+x := $(shell rm -rf meson-private meson-info meson-logs)
+endif
+ifeq ($(wildcard build.ninja),)
+.PHONY: config-host.mak
+x := $(shell rm -rf meson-private meson-info meson-logs)
+endif
+
 config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
 	@echo $@ is out-of-date, running configure
 	@if test -f meson-private/coredata.dat; then \
@@ -114,15 +134,15 @@ plugins:
 	$(call quiet-command,\
 		$(MAKE) $(SUBDIR_MAKEFLAGS) -C contrib/plugins V="$(V)", \
 		"BUILD", "example plugins")
-endif
+endif # $(CONFIG_PLUGIN)
 
-else
+else # config-host.mak does not exist
 config-host.mak:
 ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
 	@echo "Please call configure before running make!"
 	@exit 1
 endif
-endif
+endif # config-host.mak does not exist
 
 # Only needed in case Makefile.ninja does not exist.
 .PHONY: ninja-clean ninja-distclean clean-ctlist
@@ -131,20 +151,11 @@ ninja-clean::
 ninja-distclean::
 build.ninja: config-host.mak
 
-# Don't try to regenerate Makefile or configure
-# We don't generate any of them
-Makefile: ;
-configure: ;
-
-.PHONY: all clean distclean install \
-	recurse-all dist msi FORCE
-
 SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
 
 include $(SRC_PATH)/tests/Makefile.include
 
 all: recurse-all
-Makefile:
 
 ROM_DIRS = $(addprefix pc-bios/, $(ROMS))
 ROM_DIRS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROM_DIRS)))
-- 
2.26.2



