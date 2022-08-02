Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A3587DA0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:54:21 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsLk-0008Aw-TF
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs69-0003fQ-7s
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs67-0002c9-HF
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKLB1zn4KzIvFXNRcX/kMzg32O3R5iZJUQDpAHKsDxk=;
 b=VJDolWqLfl0JQbdaMs55i6NJuh1YwIzpUkaQiE/UoSdFTF0xSC4nUIwQZ9XjBY9IwvQFtL
 0mHpEH+DZqiyYKHZ5SSEKbPip4ycuEYyHVSZD9s8OkemrbrwsL10bXqs3/h33Q8tFbM9D2
 dNyz1lXrFFUBESQ8n21XoGabha6/XV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-gIZUC_aIOuK6-iiN4wJX4w-1; Tue, 02 Aug 2022 09:38:09 -0400
X-MC-Unique: gIZUC_aIOuK6-iiN4wJX4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9C961C08967;
 Tue,  2 Aug 2022 13:38:08 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29E742166B26;
 Tue,  2 Aug 2022 13:38:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 7/7] main loop: add missing documentation links to GS/IO macros
Date: Tue,  2 Aug 2022 15:37:57 +0200
Message-Id: <20220802133757.138016-8-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

If we go directly to GLOBAL_STATE_CODE, IO_CODE or IO_OR_GS_CODE
definition, we just find that they "mark and check that the function
is part of the {category} API".
However, ther is no definition on what {category} API is, they are
in include/block/block-*.h
Therefore, add a comment that refers to such documentation.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220609122206.1016936-1-eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.35.3


