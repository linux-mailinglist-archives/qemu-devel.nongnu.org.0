Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F31D2701
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 08:06:00 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ70J-0004Dk-Jw
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 02:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ6pS-0005Tz-7v
 for qemu-devel@nongnu.org; Thu, 14 May 2020 01:54:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57396
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ6pR-0001fu-An
 for qemu-devel@nongnu.org; Thu, 14 May 2020 01:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589435684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eUmzzQu8a5o0hG7jybwr3x5Au0DzMhehJQhftFqcec=;
 b=W0uwU29oljMxdASLDlRAich+xt9PeUmA3121RuoroAsK+0HIpxN0vXNdIZrKnZ5cOPHOYS
 whaWouopA0JjDJBKmS66jVRezUfRdHxxE3V/iOFC8T/KKgX/G4xVO1zca4xlVaFJLGOAGc
 D8q85c2yUlaImj7hjvoI7swvy827naM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-PJwNSWEuM1utyleX3BIXag-1; Thu, 14 May 2020 01:54:42 -0400
X-MC-Unique: PJwNSWEuM1utyleX3BIXag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8567461;
 Thu, 14 May 2020 05:54:40 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-9.rdu2.redhat.com [10.10.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B2A47D951;
 Thu, 14 May 2020 05:54:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 17/32] python//qmp.py: Do not return None from cmd_obj
Date: Thu, 14 May 2020 01:53:48 -0400
Message-Id: <20200514055403.18902-18-jsnow@redhat.com>
In-Reply-To: <20200514055403.18902-1-jsnow@redhat.com>
References: <20200514055403.18902-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes typing the qmp library difficult, as it necessitates wrapping
Optional[] around the type for every return type up the stack. At some
point, it becomes difficult to discern or remember why it's None instead
of the expected object.

Use the python exception system to tell us exactly why we didn't get an
object. Remove this special-cased return.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/lib/qmp.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/python/qemu/lib/qmp.py b/python/qemu/lib/qmp.py
index 82f86b4e45..0036204218 100644
--- a/python/qemu/lib/qmp.py
+++ b/python/qemu/lib/qmp.py
@@ -224,22 +224,18 @@ def accept(self, timeout=15.0):
         self.__sockfile = self.__sock.makefile(mode='r')
         return self.__negotiate_capabilities()
 
-    def cmd_obj(self, qmp_cmd):
+    def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
         """
         Send a QMP command to the QMP Monitor.
 
         @param qmp_cmd: QMP command to be sent as a Python dict
-        @return QMP response as a Python dict or None if the connection has
-                been closed
+        @return QMP response as a Python dict
         """
         self.logger.debug(">>> %s", qmp_cmd)
-        try:
-            self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
-        except OSError as err:
-            if err.errno == errno.EPIPE:
-                return None
-            raise err
+        self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
         resp = self.__json_read()
+        if resp is None:
+            raise QMPConnectError("Unexpected empty reply from server")
         self.logger.debug("<<< %s", resp)
         return resp
 
-- 
2.21.1


