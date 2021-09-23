Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E104154DC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:55:10 +0200 (CEST)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD14-0001VC-02
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvy-00015x-Dn
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvu-0006Hc-HT
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ponxyzT7Lqgj6M3QRiGvD/FVQngFAkHL1gvgwFgVGck=;
 b=V/7aJEXo5X+5Ec5oW97T8WT6PNjlnJ/omp5AB5OM7aoILh7NYIKZY5xm+mFwKeBrvGDB46
 ou7G/NpivzTP1iz9n9q2B0+Ky/3HtGQBXzNdqvmn31DEjvDA8omVbjW50B4dAXET2op9Eu
 JQYAbIL69Q02Q0ZldDVf9iyijhXU6R4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-zj5SFD6zM5m3ZbijMPG59Q-1; Wed, 22 Sep 2021 20:49:47 -0400
X-MC-Unique: zj5SFD6zM5m3ZbijMPG59Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6C7D8145E6;
 Thu, 23 Sep 2021 00:49:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7507D60BF1;
 Thu, 23 Sep 2021 00:49:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/17] python/aqmp: add .empty() method to EventListener
Date: Wed, 22 Sep 2021 20:49:23 -0400
Message-Id: <20210923004938.3999963-3-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Synchronous clients may want to know if they're about to block waiting
for an event or not. A method such as this is necessary to implement a
compatible interface for the old QEMUMonitorProtocol using the new async
internals.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/aqmp/events.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/python/qemu/aqmp/events.py b/python/qemu/aqmp/events.py
index fb81d216102..271899f6b82 100644
--- a/python/qemu/aqmp/events.py
+++ b/python/qemu/aqmp/events.py
@@ -556,6 +556,12 @@ async def get(self) -> Message:
         """
         return await self._queue.get()
 
+    def empty(self) -> bool:
+        """
+        Return `True` if there are no pending events.
+        """
+        return self._queue.empty()
+
     def clear(self) -> None:
         """
         Clear this listener of all pending events.
-- 
2.31.1


