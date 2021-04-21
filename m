Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1536737D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:33:56 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIbj-0006Ug-54
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIR5-00041l-1e
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIR1-0005dW-WC
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619032971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7B7hkrDfVXmz2SvFNkwRPgkbsX8rXgk8lpQh6GeMUkk=;
 b=UclIVKY0OQ2Lk4IL+dLQFV1qlfvAD/b5DSUYS0xtqcMyZB4iZGKpAN4SeqEinZZiqPzf6i
 oCQLabTWrEmmb3S911spJKe6ne70aunJR521hNCkvnaOF/hAAXrUTavQVF1bKaLkFbQUZ7
 LBWW0m9xPpU5mcQVfnuiVOXpz3Xr+jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-cux0jnaGMqG3Fkf-shKeKg-1; Wed, 21 Apr 2021 15:22:42 -0400
X-MC-Unique: cux0jnaGMqG3Fkf-shKeKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929B11020C20;
 Wed, 21 Apr 2021 19:22:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C43A35C1B4;
 Wed, 21 Apr 2021 19:22:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 7/8] qapi/error: Add type hints
Date: Wed, 21 Apr 2021 15:22:32 -0400
Message-Id: <20210421192233.3542904-8-jsnow@redhat.com>
In-Reply-To: <20210421192233.3542904-1-jsnow@redhat.com>
References: <20210421192233.3542904-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change.

Note: QAPISourceError's info parameter is Optional[] because schema.py
treats the info property of its various classes as Optional to
accommodate built-in types, which have no source. See prior commit
'qapi/error: assert QAPISourceInfo is not None'.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Random aside: It may appear clunky to have to type __str__, but after I
mentioned it on the Python typing SIG list, it was noted that this is
actually one of very few magic methods that has a "known" type in
advance, so there wasn't much desire to special case the typing for it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index 6723c5a9d9a..e35e4ddb26a 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -17,6 +17,10 @@
 parser.py.
 """
 
+from typing import Optional
+
+from .source import QAPISourceInfo
+
 
 class QAPIError(Exception):
     """Base class for all exceptions from the QAPI package."""
@@ -24,13 +28,16 @@ class QAPIError(Exception):
 
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


