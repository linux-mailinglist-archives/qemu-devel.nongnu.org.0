Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D42398323
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:38:08 +0200 (CEST)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLS3-0002K9-4l
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQL-00089G-9v
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQI-0003hk-GM
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPjGjafq/De/+fhFVkI1KhrCHBMBJePWzus2vIvXU2E=;
 b=IrXn6Z4q9I6TJCtsVRIn6FEZsOwGMpP1AFfRwdlWAapq5HvMf5HYz2yCsA32yqMcrP8vRG
 XHo7lWqFqImBjylkiLczHur6NrubnU4tWMk8CjQV8JzaNS5tuDyEtyz676UyHFSYu4ridM
 +IJNd/iFqQcaIt0qXEvsJ/BL3Sn//WE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-4HyStmxTOL6XmS_loDslaQ-1; Wed, 02 Jun 2021 03:36:15 -0400
X-MC-Unique: 4HyStmxTOL6XmS_loDslaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4285C800D55;
 Wed,  2 Jun 2021 07:36:14 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14CB05C737;
 Wed,  2 Jun 2021 07:36:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/17] docs: fix references to docs/devel/atomics.rst
Date: Wed,  2 Jun 2021 09:35:51 +0200
Message-Id: <20210602073606.338994-3-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 15e8699f00 ("atomics: convert to reStructuredText") converted
docs/devel/atomics.txt to docs/devel/atomics.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/atomics.txt/atomics.rst/ $(git grep -l docs/devel/atomics.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210517151702.109066-3-sgarzare@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/lockcnt.txt   | 2 +-
 include/qemu/atomic.h    | 4 ++--
 include/qemu/atomic128.h | 2 +-
 tcg/README               | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/lockcnt.txt b/docs/devel/lockcnt.txt
index 2d85462fe3..a3fb3bc5d8 100644
--- a/docs/devel/lockcnt.txt
+++ b/docs/devel/lockcnt.txt
@@ -145,7 +145,7 @@ can also be more efficient in two ways:
 - on some platforms, one can implement QemuLockCnt to hold the lock
   and the mutex in a single word, making the fast path no more expensive
   than simply managing a counter using atomic operations (see
-  docs/devel/atomics.txt).  This can be very helpful if concurrent access to
+  docs/devel/atomics.rst).  This can be very helpful if concurrent access to
   the data structure is expected to be rare.
 
 
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 8f4b3a80fb..3ccf84fd46 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -8,7 +8,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
- * See docs/devel/atomics.txt for discussion about the guarantees each
+ * See docs/devel/atomics.rst for discussion about the guarantees each
  * atomic primitive is meant to provide.
  */
 
@@ -432,7 +432,7 @@
  * sequentially consistent operations.
  *
  * As long as they are used as paired operations they are safe to
- * use. See docs/devel/atomics.txt for more discussion.
+ * use. See docs/devel/atomics.rst for more discussion.
  */
 
 #ifndef qatomic_mb_read
diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index ad2bcf45b4..adb9a1a260 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -6,7 +6,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
- * See docs/devel/atomics.txt for discussion about the guarantees each
+ * See docs/devel/atomics.rst for discussion about the guarantees each
  * atomic primitive is meant to provide.
  */
 
diff --git a/tcg/README b/tcg/README
index 0cf9e2727c..8510d823e3 100644
--- a/tcg/README
+++ b/tcg/README
@@ -461,7 +461,7 @@ when MTTCG is enabled.
 The guest translators should generate this opcode for all guest instructions
 which have ordering side effects.
 
-Please see docs/devel/atomics.txt for more information on memory barriers.
+Please see docs/devel/atomics.rst for more information on memory barriers.
 
 ********* 64-bit guest on 32-bit host support
 
-- 
2.27.0


