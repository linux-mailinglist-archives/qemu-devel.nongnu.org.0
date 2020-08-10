Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F21240BAC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:12:52 +0200 (CEST)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BLv-000200-O9
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BId-0005Iu-3b
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53815
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIa-0002hS-Lt
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=EWTjIxHTAdOqleIgZjeQ/0xElBrMQ3JpG5lLpPzr220=;
 b=iS7zKYrZFrVHW3TJypa0PmzEC+soAGBWj4PZDlakxRE96o2ArDPEwequ6tRgNtfjoxR9Wn
 GS3bhKb5Uv4/A+QneRGrMuV5IdRuFYd/30SXV4/aYOguFHzC9xIU9KuE4eNeim7nLwFscg
 rJpefM6G3ZphQQZ6LFuO+yHhCUyNGIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-vlLRVn62P2CF9FuFmjjS7A-1; Mon, 10 Aug 2020 13:09:20 -0400
X-MC-Unique: vlLRVn62P2CF9FuFmjjS7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C823980BCA7
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:19 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4F0F5F1E9;
 Mon, 10 Aug 2020 17:09:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 003/147] pc-bios/s390-ccw: do not use rules.mak
Date: Mon, 10 Aug 2020 19:06:41 +0200
Message-Id: <1597079345-42801-4-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:29:25
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 50bc880..cc0f77b 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -3,10 +3,26 @@ all: build-all
 	@true
 
 include ../../config-host.mak
-include $(SRC_PATH)/rules.mak
 
+quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null > /dev/null \
+	      2>&1 && echo OK), $1, $2)
+
+VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
+set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
 $(call set-vpath, $(SRC_PATH)/pc-bios/s390-ccw)
 
+# Flags for dependency generation
+QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
+
+%.o: %.c
+	$(call quiet-command,$(CC) $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
+	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+
+%.o: %.S
+	$(call quiet-command,$(CCAS) $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
+	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
+
 .PHONY : all clean build-all
 
 OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
-- 
1.8.3.1



