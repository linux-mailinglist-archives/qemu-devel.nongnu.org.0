Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C685215C8B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:03:48 +0200 (CEST)
Received: from localhost ([::1]:36498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUWx-0004EV-2m
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCO-0003jO-CU
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32098
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCI-00037w-Gp
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594053745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uKH6bDprWMUIb2yAp/kP2fo8MVORpp/N/W8X49E8GM=;
 b=YsnrHPjYrptkS4TdnGP04etasKrLXl4nMjhv53y4AkAa0OjL9BjjOHRy8uFomRXUUh3fkl
 paXhaYoLWeiLpg2vTPnHic/MlRGdsB1pLMekhKQl29QfRsXUPy3ZX4MOHEPLY0tGmZJFNi
 5gD7wrCju3g5midLs7UUk72hc7Ps9Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-RnFSLhX2NgmRv1AL3LStVw-1; Mon, 06 Jul 2020 12:42:22 -0400
X-MC-Unique: RnFSLhX2NgmRv1AL3LStVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81AB8107ACCA
 for <qemu-devel@nongnu.org>; Mon,  6 Jul 2020 16:42:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4592A71667
 for <qemu-devel@nongnu.org>; Mon,  6 Jul 2020 16:42:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/53] Makefile: simplify MINIKCONF rules
Date: Mon,  6 Jul 2020 12:41:30 -0400
Message-Id: <20200706164155.24696-29-pbonzini@redhat.com>
In-Reply-To: <20200706164155.24696-1-pbonzini@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

There is no reason to write MINIKCONF_DEPS manually, since minikconf.py
emits a dependency file, and also no reason to list multiple Kconfig
files on the command line since they can be included from a master file
in the top-level source directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Kconfig  |  4 ++++
 Makefile | 10 ++--------
 2 files changed, 6 insertions(+), 8 deletions(-)
 create mode 100644 Kconfig

diff --git a/Kconfig b/Kconfig
new file mode 100644
index 0000000000..bf694c42af
--- /dev/null
+++ b/Kconfig
@@ -0,0 +1,4 @@
+source Kconfig.host
+source backends/Kconfig
+source accel/Kconfig
+source hw/Kconfig
diff --git a/Makefile b/Makefile
index d4a971283c..32345c610e 100644
--- a/Makefile
+++ b/Makefile
@@ -404,7 +404,7 @@ endif
 # This has to be kept in sync with Kconfig.host.
 MINIKCONF_ARGS = \
     $(CONFIG_MINIKCONF_MODE) \
-    $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
+    $@ $*/config-devices.mak.d $< $(SRC_PATH)/Kconfig \
     CONFIG_TCG=$(CONFIG_TCG) \
     CONFIG_KVM=$(CONFIG_KVM) \
     CONFIG_SPICE=$(CONFIG_SPICE) \
@@ -419,15 +419,9 @@ MINIKCONF_ARGS = \
     CONFIG_LINUX=$(CONFIG_LINUX) \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
-MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
-                   $(SRC_PATH)/backends/Kconfig \
-                   $(SRC_PATH)/accel/Kconfig \
-                   $(SRC_PATH)/hw/Kconfig
-MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
-$(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
+$(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(SRC_PATH)/Kconfig $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
-- 
2.26.2



