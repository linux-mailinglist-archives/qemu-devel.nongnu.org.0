Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54A4E9914
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:14:10 +0200 (CEST)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYq8H-0007vO-RS
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:14:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxM-0001kb-7R
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxG-0004jy-C2
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYZwtxJx1KTt808SLTj8mlOncqUzb/TqWSg4OJZ+FQE=;
 b=LF5kjnruvyKjWq8sH0yqURXqrlPGxgxBSdHAhzOmsOxmhl6r6j0+2uGihuwNwoeAL+l/TT
 ggqy7EOo1kMSF9a8qJd5HQnrsA6aO4GVjPnq4IytvleWfTAvJwDstMy6uNwPMvotOHbnbh
 +earQdahujIjXl2ikmzEsewJkLZuHyU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-L8Pvua7FPzSQPjPg0Dwb5Q-1; Mon, 28 Mar 2022 10:02:42 -0400
X-MC-Unique: L8Pvua7FPzSQPjPg0Dwb5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D3DE280552F;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 140F71121321;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] tests/tcg: remove CONFIG_USER_ONLY from
 config-target.mak
Date: Mon, 28 Mar 2022 10:02:35 -0400
Message-Id: <20220328140240.40798-11-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target |  8 ++++----
 tests/tcg/configure.sh    | 12 +++---------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index ae8004c76e..083b09c742 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -32,7 +32,7 @@
 all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
-ifeq ($(CONFIG_USER_ONLY),y)
+ifeq ($(filter %-softmmu, $(TARGET)),)
 -include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
 endif
 
@@ -42,7 +42,7 @@ COMMA := ,
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # $1 = test name, $2 = cmd, $3 = desc
-ifdef CONFIG_USER_ONLY
+ifeq ($(filter %-softmmu, $(TARGET)),)
 run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
 	"TEST",$3)
 else
@@ -89,7 +89,7 @@ QEMU_OPTS=
 #   90s    with --enable-tcg-interpreter
 TIMEOUT=90
 
-ifdef CONFIG_USER_ONLY
+ifeq ($(filter %-softmmu, $(TARGET)),)
 # The order we include is important. We include multiarch first and
 # then the target. If there are common tests shared between
 # sub-targets (e.g. ARM & AArch64) then it is up to
@@ -151,7 +151,7 @@ extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
 
 RUN_TESTS+=$(EXTRA_RUNS)
 
-ifdef CONFIG_USER_ONLY
+ifeq ($(filter %-softmmu, $(TARGET)),)
 run-%: %
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
 
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index b09956c14d..a17db8ce64 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -225,18 +225,12 @@ for target in $target_list; do
   echo "TARGET_NAME=$arch" >> $config_target_mak
   echo "target=$target" >> $config_target_mak
   case $target in
-    *-linux-user)
-      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
-      ;;
-    *-bsd-user)
-      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
-      ;;
     *-softmmu)
-      echo "CONFIG_SOFTMMU=y" >> $config_target_mak
       echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
       ;;
+    *)
+      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
+      ;;
   esac
 
   eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
-- 
2.31.1



