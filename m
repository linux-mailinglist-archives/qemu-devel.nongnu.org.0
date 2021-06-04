Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0E39BCD4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:15:49 +0200 (CEST)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCU8-000798-KG
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAt-0001CO-Rk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAl-0001W9-Vl
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54sqjr9wbeFj3idsTg9R70lwcdtZnQkFQTrwyK+XX9Y=;
 b=KJBGlNk2F5PfXUafhyjsP2Iz1Sqp+oLTRLWghu9HcJJWHDN7PyhCoxe5/xNp5JCDJ2qamx
 5OYSVzjXG+tQSPNml6u4WlbQOJ8s3TiGDOeCWVAGhJLgA9OtFw5PWrbehvyLiWSRwKEkhA
 /7PEoIkbZAIA91ay+uP38lZ8SAzwgAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-mS07WCrxOeaux6IasYmp2g-1; Fri, 04 Jun 2021 11:55:43 -0400
X-MC-Unique: mS07WCrxOeaux6IasYmp2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604FF9F93A;
 Fri,  4 Jun 2021 15:55:42 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A52B5620DE;
 Fri,  4 Jun 2021 15:55:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] scripts/qemu-ga-client: add mypy type hints
Date: Fri,  4 Jun 2021 11:55:29 -0400
Message-Id: <20210604155532.1499282-9-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script is in slightly rough shape, but it still works. A lot of
care went into its initial development. In good faith, I'm updating it
to the latest Python coding standards. If there is in interest in this
script, though, I'll be asking for a contributor to take care of it
further.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 89 +++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index ece9f74fa8..a7d0ef8347 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -44,10 +44,18 @@ import errno
 import os
 import random
 import sys
+from typing import (
+    Any,
+    Callable,
+    Dict,
+    Optional,
+    Sequence,
+)
 
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
+from qemu.qmp import SocketAddrT
 
 
 # This script has not seen many patches or careful attention in quite
@@ -58,18 +66,18 @@ from qemu import qmp
 
 
 class QemuGuestAgent(qmp.QEMUMonitorProtocol):
-    def __getattr__(self, name):
-        def wrapper(**kwds):
+    def __getattr__(self, name: str) -> Callable[..., Any]:
+        def wrapper(**kwds: object) -> object:
             return self.command('guest-' + name.replace('_', '-'), **kwds)
         return wrapper
 
 
 class QemuGuestAgentClient:
-    def __init__(self, address):
+    def __init__(self, address: SocketAddrT):
         self.qga = QemuGuestAgent(address)
         self.qga.connect(negotiate=False)
 
-    def sync(self, timeout=3):
+    def sync(self, timeout: Optional[float] = 3) -> None:
         # Avoid being blocked forever
         if not self.ping(timeout):
             raise EnvironmentError('Agent seems not alive')
@@ -79,9 +87,9 @@ class QemuGuestAgentClient:
             if isinstance(ret, int) and int(ret) == uid:
                 break
 
-    def __file_read_all(self, handle):
+    def __file_read_all(self, handle: int) -> bytes:
         eof = False
-        data = ''
+        data = b''
         while not eof:
             ret = self.qga.file_read(handle=handle, count=1024)
             _data = base64.b64decode(ret['buf-b64'])
@@ -89,7 +97,7 @@ class QemuGuestAgentClient:
             eof = ret['eof']
         return data
 
-    def read(self, path):
+    def read(self, path: str) -> bytes:
         handle = self.qga.file_open(path=path)
         try:
             data = self.__file_read_all(handle)
@@ -97,7 +105,7 @@ class QemuGuestAgentClient:
             self.qga.file_close(handle=handle)
         return data
 
-    def info(self):
+    def info(self) -> str:
         info = self.qga.info()
 
         msgs = []
@@ -113,14 +121,14 @@ class QemuGuestAgentClient:
         return '\n'.join(msgs)
 
     @classmethod
-    def __gen_ipv4_netmask(cls, prefixlen):
+    def __gen_ipv4_netmask(cls, prefixlen: int) -> str:
         mask = int('1' * prefixlen + '0' * (32 - prefixlen), 2)
         return '.'.join([str(mask >> 24),
                          str((mask >> 16) & 0xff),
                          str((mask >> 8) & 0xff),
                          str(mask & 0xff)])
 
-    def ifconfig(self):
+    def ifconfig(self) -> str:
         nifs = self.qga.network_get_interfaces()
 
         msgs = []
@@ -141,7 +149,7 @@ class QemuGuestAgentClient:
 
         return '\n'.join(msgs)
 
-    def ping(self, timeout):
+    def ping(self, timeout: Optional[float]) -> bool:
         self.qga.settimeout(timeout)
         try:
             self.qga.ping()
@@ -149,37 +157,40 @@ class QemuGuestAgentClient:
             return False
         return True
 
-    def fsfreeze(self, cmd):
+    def fsfreeze(self, cmd: str) -> object:
         if cmd not in ['status', 'freeze', 'thaw']:
             raise Exception('Invalid command: ' + cmd)
-
+        # Can be int (freeze, thaw) or GuestFsfreezeStatus (status)
         return getattr(self.qga, 'fsfreeze' + '_' + cmd)()
 
-    def fstrim(self, minimum=0):
-        return getattr(self.qga, 'fstrim')(minimum=minimum)
+    def fstrim(self, minimum: int) -> Dict[str, object]:
+        # returns GuestFilesystemTrimResponse
+        ret = getattr(self.qga, 'fstrim')(minimum=minimum)
+        assert isinstance(ret, dict)
+        return ret
 
-    def suspend(self, mode):
+    def suspend(self, mode: str) -> None:
         if mode not in ['disk', 'ram', 'hybrid']:
             raise Exception('Invalid mode: ' + mode)
 
         try:
             getattr(self.qga, 'suspend' + '_' + mode)()
             # On error exception will raise
-        except self.qga.timeout:
+        except TimeoutError:
             # On success command will timed out
             return
 
-    def shutdown(self, mode='powerdown'):
+    def shutdown(self, mode: str = 'powerdown') -> None:
         if mode not in ['powerdown', 'halt', 'reboot']:
             raise Exception('Invalid mode: ' + mode)
 
         try:
             self.qga.shutdown(mode=mode)
-        except self.qga.timeout:
-            return
+        except TimeoutError:
+            pass
 
 
-def _cmd_cat(client, args):
+def _cmd_cat(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     if len(args) != 1:
         print('Invalid argument')
         print('Usage: cat <file>')
@@ -187,7 +198,7 @@ def _cmd_cat(client, args):
     print(client.read(args[0]))
 
 
-def _cmd_fsfreeze(client, args):
+def _cmd_fsfreeze(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     usage = 'Usage: fsfreeze status|freeze|thaw'
     if len(args) != 1:
         print('Invalid argument')
@@ -201,13 +212,14 @@ def _cmd_fsfreeze(client, args):
     ret = client.fsfreeze(cmd)
     if cmd == 'status':
         print(ret)
-    elif cmd == 'freeze':
-        print("%d filesystems frozen" % ret)
-    else:
-        print("%d filesystems thawed" % ret)
+        return
 
+    assert isinstance(ret, int)
+    verb = 'frozen' if cmd == 'freeze' else 'thawed'
+    print(f"{ret:d} filesystems {verb}")
 
-def _cmd_fstrim(client, args):
+
+def _cmd_fstrim(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     if len(args) == 0:
         minimum = 0
     else:
@@ -215,28 +227,25 @@ def _cmd_fstrim(client, args):
     print(client.fstrim(minimum))
 
 
-def _cmd_ifconfig(client, args):
+def _cmd_ifconfig(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     assert not args
     print(client.ifconfig())
 
 
-def _cmd_info(client, args):
+def _cmd_info(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     assert not args
     print(client.info())
 
 
-def _cmd_ping(client, args):
-    if len(args) == 0:
-        timeout = 3
-    else:
-        timeout = float(args[0])
+def _cmd_ping(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
+    timeout = 3.0 if len(args) == 0 else float(args[0])
     alive = client.ping(timeout)
     if not alive:
         print("Not responded in %s sec" % args[0])
         sys.exit(1)
 
 
-def _cmd_suspend(client, args):
+def _cmd_suspend(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     usage = 'Usage: suspend disk|ram|hybrid'
     if len(args) != 1:
         print('Less argument')
@@ -249,7 +258,7 @@ def _cmd_suspend(client, args):
     client.suspend(args[0])
 
 
-def _cmd_shutdown(client, args):
+def _cmd_shutdown(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     assert not args
     client.shutdown()
 
@@ -257,12 +266,12 @@ def _cmd_shutdown(client, args):
 _cmd_powerdown = _cmd_shutdown
 
 
-def _cmd_halt(client, args):
+def _cmd_halt(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     assert not args
     client.shutdown('halt')
 
 
-def _cmd_reboot(client, args):
+def _cmd_reboot(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
     assert not args
     client.shutdown('reboot')
 
@@ -270,7 +279,7 @@ def _cmd_reboot(client, args):
 commands = [m.replace('_cmd_', '') for m in dir() if '_cmd_' in m]
 
 
-def send_command(address, cmd, args):
+def send_command(address: str, cmd: str, args: Sequence[str]) -> None:
     if not os.path.exists(address):
         print('%s not found' % address)
         sys.exit(1)
@@ -296,7 +305,7 @@ def send_command(address, cmd, args):
     globals()['_cmd_' + cmd](client, args)
 
 
-def main():
+def main() -> None:
     address = os.environ.get('QGA_CLIENT_ADDRESS')
 
     parser = argparse.ArgumentParser()
-- 
2.31.1


