Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260C544E13
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:52:45 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIaZ-0005jF-Us
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzHB1-0004IK-3Z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzHAz-0006yE-4j
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LNB0GdbPIWsIRmP1mLhdRCXowL12lFQy0gLkdeuqgDw=;
 b=XXm+95Vw48g/uEvuxscwZdDk0Luhq92u0b1QESnICS2c3l+AP/YHh2kB8PFQbs8GOzHqQJ
 l93x5x/Q08S0Lug++fVnFJ1Tj1VwklFq5ph+wXnZsYpl7dkVmigzs5TfWHcSxvbJXm5GCR
 I/qromn51BkrGTcS+lnV05NONXhrMMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-uOdryO_NMaaKEo_1WgbZ7A-1; Thu, 09 Jun 2022 08:22:09 -0400
X-MC-Unique: uOdryO_NMaaKEo_1WgbZ7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFB0680A095;
 Thu,  9 Jun 2022 12:22:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 914D540CF8E2;
 Thu,  9 Jun 2022 12:22:08 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] main loop: add missing documentation links to GS/IO macros
Date: Thu,  9 Jun 2022 08:22:06 -0400
Message-Id: <20220609122206.1016936-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we go directly to GLOBAL_STATE_CODE, IO_CODE or IO_OR_GS_CODE
definition, we just find that they "mark and check that the function
is part of the {category} API".
However, ther is no definition on what {category} API is, they are
in include/block/block-*.h
Therefore, add a comment that refers to such documentation.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/main-loop.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 5518845299..c50d1b7e3a 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -279,7 +279,11 @@ bool qemu_mutex_iothread_locked(void);
  */
 bool qemu_in_main_thread(void);
 
-/* Mark and check that the function is part of the global state API. */
+/*
+ * Mark and check that the function is part of the Global State API.
+ * Please refer to include/block/block-global-state.h for more
+ * information about GS API.
+ */
 #ifdef CONFIG_COCOA
 /*
  * When using the Cocoa UI, addRemovableDevicesMenuItems() is called from
@@ -298,13 +302,21 @@ bool qemu_in_main_thread(void);
     } while (0)
 #endif /* CONFIG_COCOA */
 
-/* Mark and check that the function is part of the I/O API. */
+/*
+ * Mark and check that the function is part of the I/O API.
+ * Please refer to include/block/block-io.h for more
+ * information about IO API.
+ */
 #define IO_CODE()                                                   \
     do {                                                            \
         /* nop */                                                   \
     } while (0)
 
-/* Mark and check that the function is part of the "I/O OR GS" API. */
+/*
+ * Mark and check that the function is part of the "I/O OR GS" API.
+ * Please refer to include/block/block-io.h for more
+ * information about "IO or GS" API.
+ */
 #define IO_OR_GS_CODE()                                             \
     do {                                                            \
         /* nop */                                                   \
-- 
2.31.1


