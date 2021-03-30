Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707734EF48
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:22:47 +0200 (CEST)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI4j-0002Gu-Ub
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1H-0000KJ-1v
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1A-0003Zj-08
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yy2KDBGt63RHFos2sPk1VkUB0gymERc4cCZyUbvON2M=;
 b=JZDE9uBe4tvmwDc/GXB3CqV+ooTSwUrLGvi6u00OBOfC+Diyf/CbZ5j3M8bU+QWh+i0ZlL
 10DAxgO5ThxYcfX/BqcV0iQri0iv34fWfTR2JfY0VHG9CapWGUpPJ8gzEIQOcxHNWaMh/v
 644nmpQyzzWSTRwxM2F0oi0y4iTe5+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-GtM_C4qdPQubMwiy7mVkoA-1; Tue, 30 Mar 2021 13:19:00 -0400
X-MC-Unique: GtM_C4qdPQubMwiy7mVkoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2379318C8C00;
 Tue, 30 Mar 2021 17:18:59 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1498360861;
 Tue, 30 Mar 2021 17:18:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 7/8] qapi/error: Add type hints
Date: Tue, 30 Mar 2021 13:18:43 -0400
Message-Id: <20210330171844.1197918-8-jsnow@redhat.com>
In-Reply-To: <20210330171844.1197918-1-jsnow@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index 2183b8c6b7..6ba54821c9 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -11,6 +11,10 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+from typing import Optional
+
+from .source import QAPISourceInfo
+
 
 class QAPIError(Exception):
     """Base class for all exceptions from the QAPI package."""
@@ -18,13 +22,16 @@ class QAPIError(Exception):
 
 class QAPISourceError(QAPIError):
     """Error class for all exceptions identifying a source location."""
-    def __init__(self, info, msg, col=None):
+    def __init__(self,
+                 info: Optional[QAPISourceInfo],
+                 msg: str,
+                 col: Optional[int] = None):
         super().__init__()
         self.info = info
         self.msg = msg
         self.col = col
 
-    def __str__(self):
+    def __str__(self) -> str:
         assert self.info is not None
         loc = str(self.info)
         if self.col is not None:
-- 
2.30.2


