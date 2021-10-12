Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A042AFB8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:38:15 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQPW-0002Pt-CO
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maQMO-0007RQ-Rc
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maQMG-0001zS-Oj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634078092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAVrEwDzEg01rdEaU0TH40MGZEH0sGEHGDA8ZQp1bM8=;
 b=d9OM2vPScNXdD/ItSlmrRueNBfuh8Qg3vnxRAXCwY2u6i15WOGxSxA1DTKGz8Ers6SE80C
 B+lBLMyoKuk+3eD456YcED2XJuhxfR4ddu4cWWF7W7MI4NhhH3CT0Ykab0RPxCAyQm7b5v
 NoOb7id2oKut69qZ2paySU9UtWEEwYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-2Dcmb5EhNZS3O4MuEY-8AQ-1; Tue, 12 Oct 2021 18:34:49 -0400
X-MC-Unique: 2Dcmb5EhNZS3O4MuEY-8AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE7A80158D;
 Tue, 12 Oct 2021 22:34:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6288319C79;
 Tue, 12 Oct 2021 22:34:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] python/machine: remove has_quit argument
Date: Tue, 12 Oct 2021 18:34:39 -0400
Message-Id: <20211012223445.1051101-2-jsnow@redhat.com>
In-Reply-To: <20211012223445.1051101-1-jsnow@redhat.com>
References: <20211012223445.1051101-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

If we spy on the QMP commands instead, we don't need callers to remember
to pass it. Seems like a fair trade-off.

The one slightly weird bit is overloading this instance variable for
wait(), where we use it to mean "don't issue the qmp 'quit'
command". This means that wait() will "fail" if the QEMU process does
not terminate of its own accord.

In most cases, we probably did already actually issue quit -- some
iotests do this -- but in some others, we may be waiting for QEMU to
terminate for some other reason, such as a test wherein we tell the
guest (directly) to shut down.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 34 +++++++++++++++++++---------------
 tests/qemu-iotests/040         |  7 +------
 tests/qemu-iotests/218         |  2 +-
 tests/qemu-iotests/255         |  2 +-
 4 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 056d340e355..0bd40bc2f76 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -170,6 +170,7 @@ def __init__(self,
         self._console_socket: Optional[socket.socket] = None
         self._remove_files: List[str] = []
         self._user_killed = False
+        self._quit_issued = False
 
     def __enter__(self: _T) -> _T:
         return self
@@ -368,6 +369,7 @@ def _post_shutdown(self) -> None:
                 command = ''
             LOG.warning(msg, -int(exitcode), command)
 
+        self._quit_issued = False
         self._user_killed = False
         self._launched = False
 
@@ -443,15 +445,13 @@ def _hard_shutdown(self) -> None:
         self._subp.kill()
         self._subp.wait(timeout=60)
 
-    def _soft_shutdown(self, timeout: Optional[int],
-                       has_quit: bool = False) -> None:
+    def _soft_shutdown(self, timeout: Optional[int]) -> None:
         """
         Perform early cleanup, attempt to gracefully shut down the VM, and wait
         for it to terminate.
 
         :param timeout: Timeout in seconds for graceful shutdown.
                         A value of None is an infinite wait.
-        :param has_quit: When True, don't attempt to issue 'quit' QMP command
 
         :raise ConnectionReset: On QMP communication errors
         :raise subprocess.TimeoutExpired: When timeout is exceeded waiting for
@@ -460,21 +460,19 @@ def _soft_shutdown(self, timeout: Optional[int],
         self._early_cleanup()
 
         if self._qmp_connection:
-            if not has_quit:
+            if not self._quit_issued:
                 # Might raise ConnectionReset
-                self._qmp.cmd('quit')
+                self.qmp('quit')
 
         # May raise subprocess.TimeoutExpired
         self._subp.wait(timeout=timeout)
 
-    def _do_shutdown(self, timeout: Optional[int],
-                     has_quit: bool = False) -> None:
+    def _do_shutdown(self, timeout: Optional[int]) -> None:
         """
         Attempt to shutdown the VM gracefully; fallback to a hard shutdown.
 
         :param timeout: Timeout in seconds for graceful shutdown.
                         A value of None is an infinite wait.
-        :param has_quit: When True, don't attempt to issue 'quit' QMP command
 
         :raise AbnormalShutdown: When the VM could not be shut down gracefully.
             The inner exception will likely be ConnectionReset or
@@ -482,13 +480,13 @@ def _do_shutdown(self, timeout: Optional[int],
             may result in its own exceptions, likely subprocess.TimeoutExpired.
         """
         try:
-            self._soft_shutdown(timeout, has_quit)
+            self._soft_shutdown(timeout)
         except Exception as exc:
             self._hard_shutdown()
             raise AbnormalShutdown("Could not perform graceful shutdown") \
                 from exc
 
-    def shutdown(self, has_quit: bool = False,
+    def shutdown(self,
                  hard: bool = False,
                  timeout: Optional[int] = 30) -> None:
         """
@@ -498,7 +496,6 @@ def shutdown(self, has_quit: bool = False,
         If the VM has not yet been launched, or shutdown(), wait(), or kill()
         have already been called, this method does nothing.
 
-        :param has_quit: When true, do not attempt to issue 'quit' QMP command.
         :param hard: When true, do not attempt graceful shutdown, and
                      suppress the SIGKILL warning log message.
         :param timeout: Optional timeout in seconds for graceful shutdown.
@@ -512,7 +509,7 @@ def shutdown(self, has_quit: bool = False,
                 self._user_killed = True
                 self._hard_shutdown()
             else:
-                self._do_shutdown(timeout, has_quit)
+                self._do_shutdown(timeout)
         finally:
             self._post_shutdown()
 
@@ -529,7 +526,8 @@ def wait(self, timeout: Optional[int] = 30) -> None:
         :param timeout: Optional timeout in seconds. Default 30 seconds.
                         A value of `None` is an infinite wait.
         """
-        self.shutdown(has_quit=True, timeout=timeout)
+        self._quit_issued = True
+        self.shutdown(timeout=timeout)
 
     def set_qmp_monitor(self, enabled: bool = True) -> None:
         """
@@ -574,7 +572,10 @@ def qmp(self, cmd: str,
             conv_keys = True
 
         qmp_args = self._qmp_args(conv_keys, args)
-        return self._qmp.cmd(cmd, args=qmp_args)
+        ret = self._qmp.cmd(cmd, args=qmp_args)
+        if cmd == 'quit' and 'error' not in ret and 'return' in ret:
+            self._quit_issued = True
+        return ret
 
     def command(self, cmd: str,
                 conv_keys: bool = True,
@@ -585,7 +586,10 @@ def command(self, cmd: str,
         On failure raise an exception.
         """
         qmp_args = self._qmp_args(conv_keys, args)
-        return self._qmp.command(cmd, **qmp_args)
+        ret = self._qmp.command(cmd, **qmp_args)
+        if cmd == 'quit':
+            self._quit_issued = True
+        return ret
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
         """
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index f3677de9dfd..6af5ab9e764 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -92,10 +92,9 @@ class TestSingleDrive(ImageCommitTestCase):
         self.vm.add_device('virtio-scsi')
         self.vm.add_device("scsi-hd,id=scsi0,drive=drive0")
         self.vm.launch()
-        self.has_quit = False
 
     def tearDown(self):
-        self.vm.shutdown(has_quit=self.has_quit)
+        self.vm.shutdown()
         os.remove(test_img)
         os.remove(mid_img)
         os.remove(backing_img)
@@ -127,8 +126,6 @@ class TestSingleDrive(ImageCommitTestCase):
         result = self.vm.qmp('quit')
         self.assert_qmp(result, 'return', {})
 
-        self.has_quit = True
-
     # Same as above, but this time we add the filter after starting the job
     @iotests.skip_if_unsupported(['throttle'])
     def test_commit_plus_filter_and_quit(self):
@@ -147,8 +144,6 @@ class TestSingleDrive(ImageCommitTestCase):
         result = self.vm.qmp('quit')
         self.assert_qmp(result, 'return', {})
 
-        self.has_quit = True
-
     def test_device_not_found(self):
         result = self.vm.qmp('block-commit', device='nonexistent', top='%s' % mid_img)
         self.assert_qmp(result, 'error/class', 'DeviceNotFound')
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 325d8244fb9..4922b4d3b6f 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -187,4 +187,4 @@ with iotests.VM() as vm, \
     log(vm.qmp('quit'))
 
     with iotests.Timeout(5, 'Timeout waiting for VM to quit'):
-        vm.shutdown(has_quit=True)
+        vm.shutdown()
diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index c43aa9c67ac..3d6d0e80cb5 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -123,4 +123,4 @@ with iotests.FilePath('src.qcow2') as src_path, \
     vm.qmp_log('block-job-cancel', device='job0')
     vm.qmp_log('quit')
 
-    vm.shutdown(has_quit=True)
+    vm.shutdown()
-- 
2.31.1


