Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E021AE7B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 07:24:07 +0200 (CEST)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtlW2-0000dv-3T
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 01:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUW-0007Ew-A2
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53037
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUU-0008CO-DV
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594358549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8yNpM8ZFzLT1bZ25F2U4O7aip1EBVa97Zsuy0QTJgw=;
 b=LZ9kWNkFiDYk69y8+F45tMmhEPuH4HXb8g2/xIr73Ccl9ywvEOSpFNhGFMua43oSIXart6
 7FtiOGpobpNJIbmHjjUQYu5la45oIKSbL8Z8aD1cjalWi5Ai0se9JOSzBrPqmOP12pu6QY
 I1MqaT8udmBrhgdd4ayIn50RDaa+zg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-nFLNDyOnMtmuWAkUzks-WQ-1; Fri, 10 Jul 2020 01:22:25 -0400
X-MC-Unique: nFLNDyOnMtmuWAkUzks-WQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83EAD91C955;
 Fri, 10 Jul 2020 05:22:24 +0000 (UTC)
Received: from probe.redhat.com (ovpn-118-196.rdu2.redhat.com [10.10.118.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81A42920CF;
 Fri, 10 Jul 2020 05:22:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/16] iotests.py: use qemu.qmp type aliases
Date: Fri, 10 Jul 2020 01:22:06 -0400
Message-Id: <20200710052220.3306-3-jsnow@redhat.com>
In-Reply-To: <20200710052220.3306-1-jsnow@redhat.com>
References: <20200710052220.3306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 00:55:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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

iotests.py should use the type definitions from qmp.py instead of its
own.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index f1e0733dda..4457786f09 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -35,13 +35,10 @@
 # pylint: disable=import-error, wrong-import-position
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qtest
+from qemu.qmp import QMPMessage
 
 assert sys.version_info >= (3, 6)
 
-# Type Aliases
-QMPResponse = Dict[str, Any]
-
-
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
 logger.addHandler(logging.NullHandler())
@@ -554,7 +551,7 @@ def add_incoming(self, addr):
         self._args.append(addr)
         return self
 
-    def hmp(self, command_line: str, use_log: bool = False) -> QMPResponse:
+    def hmp(self, command_line: str, use_log: bool = False) -> QMPMessage:
         cmd = 'human-monitor-command'
         kwargs = {'command-line': command_line}
         if use_log:
@@ -575,7 +572,7 @@ def resume_drive(self, drive: str) -> None:
         self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
 
     def hmp_qemu_io(self, drive: str, cmd: str,
-                    use_log: bool = False) -> QMPResponse:
+                    use_log: bool = False) -> QMPMessage:
         """Write to a given drive using an HMP command"""
         return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
 
-- 
2.21.3


