Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D005D453D51
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 01:48:18 +0100 (CET)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn97Z-0001M7-V7
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 19:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8uR-0007Rq-61
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8uP-000716-9n
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637109280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMXqwS/lTynPT0MsdUnHeYXKbtNyeUjQz54JVmB+DAE=;
 b=Lo244D6E3shGqG9Ac0TY+tWadFxMSuo67oFnQhqHrWwhWZJ7SY1cOd1TEIPMoVpDuCWnzO
 bleU7Yv9WLHmfk2LNBkQkFB5PCStt45CDV75tWeGeDGT2Bs1IVYNo6BE5vY+5WY4bx9djE
 eR7KWf4Pr5FVC9OULaopupY6FO2swWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-yUctiMlpM9i3lqqDSLhnow-1; Tue, 16 Nov 2021 19:34:37 -0500
X-MC-Unique: yUctiMlpM9i3lqqDSLhnow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CEFD8799E0;
 Wed, 17 Nov 2021 00:34:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ECC167842;
 Wed, 17 Nov 2021 00:34:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] scripts/device-crash-test: hide tracebacks for QMP connect
 errors
Date: Tue, 16 Nov 2021 19:33:17 -0500
Message-Id: <20211117003317.2844087-6-jsnow@redhat.com>
In-Reply-To: <20211117003317.2844087-1-jsnow@redhat.com>
References: <20211117003317.2844087-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generally, the traceback for a connection failure is uninteresting and
all we need to know is that the connection attempt failed.

Reduce the verbosity in these cases, except when debugging.

Signed-off-by: John Snow <jsnow@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-id: 20211111143719.2162525-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/device-crash-test | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 49bcd61b4f..3db0ffe5b8 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -36,6 +36,7 @@ from itertools import chain
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
 from qemu.machine import QEMUMachine
+from qemu.aqmp import ConnectError
 
 logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
@@ -355,10 +356,12 @@ def checkOneCase(args, testcase):
     dbg("will launch QEMU: %s", cmdline)
     vm = QEMUMachine(binary=binary, args=args)
 
+    exc = None
     exc_traceback = None
     try:
         vm.launch()
-    except Exception:
+    except Exception as this_exc:
+        exc = this_exc
         exc_traceback = traceback.format_exc()
         dbg("Exception while running test case")
     finally:
@@ -366,8 +369,9 @@ def checkOneCase(args, testcase):
         ec = vm.exitcode()
         log = vm.get_log()
 
-    if exc_traceback is not None or ec != 0:
-        return {'exc_traceback':exc_traceback,
+    if exc is not None or ec != 0:
+        return {'exc': exc,
+                'exc_traceback':exc_traceback,
                 'exitcode':ec,
                 'log':log,
                 'testcase':testcase,
@@ -455,6 +459,17 @@ def logFailure(f, level):
     for l in f['log'].strip().split('\n'):
         logger.log(level, "log: %s", l)
     logger.log(level, "exit code: %r", f['exitcode'])
+
+    # If the Exception is merely a QMP connect error,
+    # reduce the logging level for its traceback to
+    # improve visual clarity.
+    if isinstance(f.get('exc'), ConnectError):
+        logger.log(level, "%s.%s: %s",
+                   type(f['exc']).__module__,
+                   type(f['exc']).__qualname__,
+                   str(f['exc']))
+        level = logging.DEBUG
+
     if f['exc_traceback']:
         logger.log(level, "exception:")
         for l in f['exc_traceback'].split('\n'):
-- 
2.31.1


