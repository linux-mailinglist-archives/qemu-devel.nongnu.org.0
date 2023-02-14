Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657B6968CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxqP-0008Ei-2u; Tue, 14 Feb 2023 11:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRxqM-000870-S8
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRxqL-00024i-7R
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676390864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CBc+Cd5Tox2ybmbHMedNCUhzuHinYJLIeKs4Q4H24oY=;
 b=h5w9R0mrEDQPE8hA9wOLIJRLBqBfw5iBRh1XhcjCOY192U/jvhIgJVIPfzz23GJTXXvb2L
 3X8DPd8ZjToML1CaMuqbjgM1c9K00cpv1J9n0AQNWJmAuaAkpl9uEhn9fd5uQpzsGAV2sS
 pgthTVAUCgc6T5DKPcDpN6MNiB/hXp4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-bg4o3L1-Nx6Wbh1DAcomMQ-1; Tue, 14 Feb 2023 11:07:40 -0500
X-MC-Unique: bg4o3L1-Nx6Wbh1DAcomMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00FF02807D6B
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 16:07:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84AECC15BA0;
 Tue, 14 Feb 2023 16:07:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PATCH] Change the default for Mixed declarations.
Date: Tue, 14 Feb 2023 17:07:38 +0100
Message-Id: <20230214160738.88614-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

I want to enter a discussion about changing the default of the style
guide.

There are several reasons for that:
- they exist since C99 (i.e. all supported compilers support them)
- they eliminate the posibility of an unitialized variable.
- (at least for me), declaring the index inside the for make clear
  that index is not used outside the for.
- Current documentation already declares that they are allowed in some
  cases.
- Lots of places already use them.

We can change the text to whatever you want, just wondering if it is
valib to change the standard.

Doing a trivial grep through my local qemu messages (around 100k) it
shows that some people are complaining that they are not allowed, and
other saying that they are used all over the place.

Discuss.
---
 docs/devel/style.rst | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 68aa776930..dc248aa9e4 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -202,15 +202,20 @@ Furthermore, it is the QEMU coding style.
 Declarations
 ============
 
-Mixed declarations (interleaving statements and declarations within
-blocks) are generally not allowed; declarations should be at the beginning
-of blocks.
-
-Every now and then, an exception is made for declarations inside a
-#ifdef or #ifndef block: if the code looks nicer, such declarations can
-be placed at the top of the block even if there are statements above.
-On the other hand, however, it's often best to move that #ifdef/#ifndef
-block to a separate function altogether.
+Declaring variables at first use has two advantages:
+- we can see the right type of the variable just to the use
+- we completely remove the posibility of using a variable that is
+  unitialized.
+
+It is especially the case when we are in a for statement.
+
+for (int i = X; i++; ..) {
+    ...
+}
+
+Makes clear visually that this variable is not useed outside of the for.
+
+Mixing declarations an code has been allowed since the C99 standard.
 
 Conditional statements
 ======================
-- 
2.39.1


