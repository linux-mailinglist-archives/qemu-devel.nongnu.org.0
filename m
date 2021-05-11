Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026A37B169
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:10:34 +0200 (CEST)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaaH-0007dg-9l
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW6-0007Nw-8q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW1-0006O1-Uk
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcLCBJp2GifzvxOzMbM4f59L5eLSU4faCfjRnldxOV4=;
 b=KoW1IDw1ulf81Cj9X3a/fdfPRSGFXFgkPXoEhpp2npbOlQrWLIpjyPnTW+xum3zzDR4ALd
 chGe8RSbR5NjgxU1ddewi5pvfyJqjrmZSEG7t0IELLTKeKgd+b2ziaybPTRuoFXRI4u74t
 FcQeHZzwUCwAFvFSuMhUzH9g7o9yFpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-F9KTpqmpOzOl8ESNw8s3nA-1; Tue, 11 May 2021 18:06:05 -0400
X-MC-Unique: F9KTpqmpOzOl8ESNw8s3nA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40D81854E21;
 Tue, 11 May 2021 22:06:04 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A33ABA6F;
 Tue, 11 May 2021 22:06:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/21] qapi/source: Remove line number from QAPISourceInfo
 initializer
Date: Tue, 11 May 2021 18:05:43 -0400
Message-Id: <20210511220601.2110055-4-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the QAPISourceInfo(None, None, None) construct gone, there's no
longer any reason to have to specify that a file starts on the first
line. Remove it from the initializer and default it to 1.

Remove the last vestiges where we check for 'line' being unset, that
can't happen, now.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py |  2 +-
 scripts/qapi/source.py | 10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index a53b735e7de..39dbcc4eacc 100644
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
index 1ade864d7b9..04193cc9643 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -31,10 +31,9 @@ def __init__(self) -> None:
 class QAPISourceInfo:
     T = TypeVar('T', bound='QAPISourceInfo')
 
-    def __init__(self, fname: str, line: int,
-                 parent: Optional['QAPISourceInfo']):
+    def __init__(self, fname: str, parent: Optional['QAPISourceInfo']):
         self.fname = fname
-        self.line = line
+        self.line = 1
         self.parent = parent
         self.pragma: QAPISchemaPragma = (
             parent.pragma if parent else QAPISchemaPragma()
@@ -52,10 +51,7 @@ def next_line(self: T) -> T:
         return info
 
     def loc(self) -> str:
-        ret = self.fname
-        if self.line is not None:
-            ret += ':%d' % self.line
-        return ret
+        return f"{self.fname}:{self.line}"
 
     def in_defn(self) -> str:
         if self.defn_name:
-- 
2.30.2


