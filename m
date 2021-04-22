Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12E43677BC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:09:36 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPih-00082k-LN
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgr-0006LH-9U
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgh-0006Ro-HV
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7gEPdebCE6paPsNskhQIQjVSM3mJoBcyzJdr5zoIOc=;
 b=DuVdFvpevaKHXRJpXMbX7ovXNuGMpu+BAtZcYMnLI1PGn7IfbnLEsYgmpPc5xZzLAICjpO
 H6s1ZV9yNlViB5hnGRH4P2YwpWG2zLpWxC6qN7dijpkj9WDa3NgkAXGG5IcuRIZzmHWVax
 FY6vtKWVi7jNgEf7RMupEyIB6yqUeIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-VT97YbiIMr-3bPzbwYNgqQ-1; Wed, 21 Apr 2021 23:07:24 -0400
X-MC-Unique: VT97YbiIMr-3bPzbwYNgqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE3B801814;
 Thu, 22 Apr 2021 03:07:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54364607CB;
 Thu, 22 Apr 2021 03:07:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/22] qapi/source: Remove line number from QAPISourceInfo
 initializer
Date: Wed, 21 Apr 2021 23:07:01 -0400
Message-Id: <20210422030720.3685766-4-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the QAPISourceInfo(None, None, None) construct gone, there's not
really any reason to have to specify that a file starts on the first
line.

Remove it from the initializer and have it default to 1.

Remove the last vestiges where we check for 'line' being unset. That
won't happen again, now!

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py |  2 +-
 scripts/qapi/source.py | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b378fa33807..edd0af33ae0 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -47,7 +47,7 @@ def __init__(self, fname, previously_included=None, incl_info=None):
         if self.src == '' or self.src[-1] != '\n':
             self.src += '\n'
         self.cursor = 0
-        self.info = QAPISourceInfo(fname, 1, incl_info)
+        self.info = QAPISourceInfo(fname, incl_info)
         self.line_pos = 0
         self.exprs = []
         self.docs = []
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index 21090b9fe78..afa21518974 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -37,10 +37,9 @@ def __init__(self) -> None:
 class QAPISourceInfo:
     T = TypeVar('T', bound='QAPISourceInfo')
 
-    def __init__(self, fname: str, line: int,
-                 parent: Optional['QAPISourceInfo']):
+    def __init__(self, fname: str, parent: Optional['QAPISourceInfo'] = None):
         self.fname = fname
-        self.line = line
+        self.line = 1
         self._column: Optional[int] = None
         self.parent = parent
         self.pragma: QAPISchemaPragma = (
@@ -59,12 +58,7 @@ def next_line(self: T) -> T:
         return info
 
     def loc(self) -> str:
-        # column cannot be provided meaningfully when line is absent.
-        assert self.line or self._column is None
-
-        ret = self.fname
-        if self.line is not None:
-            ret += ':%d' % self.line
+        ret = f"{self.fname}:{self.line}"
         if self._column is not None:
             ret += ':%d' % self._column
         return ret
-- 
2.30.2


