Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E365B21AE89
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 07:27:00 +0200 (CEST)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtlYp-0007d1-RO
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 01:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUV-0007E9-TR
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31704
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUU-0008CQ-71
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594358549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNhPhaxByI3BTfZupYYGTKC0C0PPGE+d9nTXAs0uWH4=;
 b=H4snuNdr+thasC9wHjVs1dUWbf3JKdmWbd4UrtnIQHTXzuicMwwRUQzZhj8s83kwrASC0W
 z9DX6B5S2+lPpuBuwEmZXtmXEiGZoe8aCME/K5+4ekqC2hejEfner6pqW9bSjHwOzho79N
 pYV8HB+eGRJx1sl8ylKq28pXmxjEiG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-9kKgvxRmMNqybuXdkor2Rg-1; Fri, 10 Jul 2020 01:22:27 -0400
X-MC-Unique: 9kKgvxRmMNqybuXdkor2Rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB7C9100A614;
 Fri, 10 Jul 2020 05:22:26 +0000 (UTC)
Received: from probe.redhat.com (ovpn-118-196.rdu2.redhat.com [10.10.118.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCE65920C2;
 Fri, 10 Jul 2020 05:22:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/16] python/qmp.py: Do not return None from cmd_obj
Date: Fri, 10 Jul 2020 01:22:08 -0400
Message-Id: <20200710052220.3306-5-jsnow@redhat.com>
In-Reply-To: <20200710052220.3306-1-jsnow@redhat.com>
References: <20200710052220.3306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 22:08:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes typing the qmp library difficult, as it necessitates wrapping
Optional[] around the type for every return type up the stack. At some
point, it becomes difficult to discern or remember why it's None instead
of the expected object.

Use the python exception system to tell us exactly why we didn't get an
object. Remove this special-cased return.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/qmp.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index aa8a666b8a..ef3c919b76 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -225,22 +225,18 @@ def accept(self, timeout=15.0):
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
2.21.3


