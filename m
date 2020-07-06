Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E89B215C41
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 18:53:02 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUMX-0008HA-HV
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 12:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCK-0003ZS-6u
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47401
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCE-00036s-Fm
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594053740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5s+sAeYDUk0TzmUTnGyLrClXVPQQF4D9LFrxoQkWDKk=;
 b=L5St/trNeF1Gv28OzAPweTldbIBIizEkyOOLfiL54Qp80NByJcpDBu0p2G4+S5fRXuNUR9
 MAdhlonDh535BHVH+f6sy4rH55ZOXq69U79bcq7ecgtIrW/ZG+5GrAwzFhsOQ8oqH6L8y5
 qLlPB1Acv2DTVA87LRE3bGtISooiZTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-pQOXfu33Ov-bxSdjbGW5hw-1; Mon, 06 Jul 2020 12:42:17 -0400
X-MC-Unique: pQOXfu33Ov-bxSdjbGW5hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 720EB800D5C;
 Mon,  6 Jul 2020 16:42:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F07A971667;
 Mon,  6 Jul 2020 16:42:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/53] Makefile: Write MINIKCONF variables as one entry per line
Date: Mon,  6 Jul 2020 12:41:26 -0400
Message-Id: <20200706164155.24696-25-pbonzini@redhat.com>
In-Reply-To: <20200706164155.24696-1-pbonzini@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:22:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index e7d8f1f027..b96a2d8790 100644
--- a/Makefile
+++ b/Makefile
@@ -418,12 +418,16 @@ MINIKCONF_ARGS = \
     CONFIG_LINUX=$(CONFIG_LINUX) \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
-MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/backends/Kconfig $(SRC_PATH)/hw/Kconfig
-MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/backends/Kconfig \
+                   $(SRC_PATH)/hw/Kconfig
+MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
-	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
+	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
 	    mv $@.tmp $@; \
-- 
2.26.2



