Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C911D2758
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 08:16:07 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ7A6-0005HG-5c
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 02:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ6pu-0006V8-Tp
 for qemu-devel@nongnu.org; Thu, 14 May 2020 01:55:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40870
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ6ps-0001r1-QG
 for qemu-devel@nongnu.org; Thu, 14 May 2020 01:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589435712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZECHhV+TqMBrIwTO7CtRiDUPW4cHqkvQIRGtpY5qcc=;
 b=ibPb0EOi30/Rv5/7rwAgry4NN28lGzYzACPpzXf9094U9LGTT++bYdMwi44QxhCbDrbofj
 RNT6ORX8/2VKutg3vJT4arOb6ZTdzXLBz69aRvaxrkpgjsSTrQo0mxqP4AvJzeRLKuvYom
 9xvHbwEsftKtWAZkWgnAp+UbImL8/eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-NGbBqpWQOgOnsr5ZaCTvWw-1; Thu, 14 May 2020 01:55:07 -0400
X-MC-Unique: NGbBqpWQOgOnsr5ZaCTvWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CEE6107ACF3;
 Thu, 14 May 2020 05:55:06 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-9.rdu2.redhat.com [10.10.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75B706A977;
 Thu, 14 May 2020 05:55:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 32/32] python/qemu/lib: Add mypy type annotations
Date: Thu, 14 May 2020 01:54:03 -0400
Message-Id: <20200514055403.18902-33-jsnow@redhat.com>
In-Reply-To: <20200514055403.18902-1-jsnow@redhat.com>
References: <20200514055403.18902-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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

These should all be purely annotations with no changes in behavior at
all.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/lib/accel.py   |  8 ++--
 python/qemu/lib/machine.py | 94 +++++++++++++++++++++-----------------
 python/qemu/lib/qmp.py     | 44 ++++++++++--------
 python/qemu/lib/qtest.py   | 27 ++++++-----
 4 files changed, 99 insertions(+), 74 deletions(-)

diff --git a/python/qemu/lib/accel.py b/python/qemu/lib/accel.py
index 7fabe62920..4325114e51 100644
--- a/python/qemu/lib/accel.py
+++ b/python/qemu/lib/accel.py
@@ -17,6 +17,7 @@
 import logging
 import os
 import subprocess
+from typing import List, Optional
 
 LOG = logging.getLogger(__name__)
 
@@ -29,7 +30,7 @@
 }
 
 
-def list_accel(qemu_bin):
+def list_accel(qemu_bin: str) -> List[str]:
     """
     List accelerators enabled in the QEMU binary.
 
@@ -49,7 +50,8 @@ def list_accel(qemu_bin):
     return [acc.strip() for acc in out.splitlines()[1:]]
 
 
-def kvm_available(target_arch=None, qemu_bin=None):
+def kvm_available(target_arch: Optional[str] = None,
+                  qemu_bin: Optional[str] = None) -> bool:
     """
     Check if KVM is available using the following heuristic:
       - Kernel module is present in the host;
@@ -72,7 +74,7 @@ def kvm_available(target_arch=None, qemu_bin=None):
     return True
 
 
-def tcg_available(qemu_bin):
+def tcg_available(qemu_bin: str) -> bool:
     """
     Check if TCG is available.
 
diff --git a/python/qemu/lib/machine.py b/python/qemu/lib/machine.py
index ec2bb28b86..c84db2bf8f 100644
--- a/python/qemu/lib/machine.py
+++ b/python/qemu/lib/machine.py
@@ -27,6 +27,7 @@
 import tempfile
 from typing import (
     Any,
+    BinaryIO,
     Dict,
     List,
     Optional,
@@ -37,7 +38,7 @@
 from types import TracebackType
 
 from . import qmp
-from .qmp import SocketAddrT, QMPMessage
+from .qmp import QMPMessage, QMPReturnValue, SocketAddrT
 
 LOG = logging.getLogger(__name__)
 
@@ -60,7 +61,7 @@ class QEMUMachineAddDeviceError(QEMUMachineError):
 
 class QEMUMachine:
     """
-    A QEMU VM
+    A QEMU VM.
 
     Use this object as a context manager to ensure
     the QEMU process terminates::
@@ -77,7 +78,8 @@ def __init__(self,
                  name: Optional[str] = None,
                  test_dir: str = "/var/tmp",
                  monitor_address: Optional[SocketAddrT] = None,
-                 socket_scm_helper=None, sock_dir=None):
+                 socket_scm_helper: Optional[str] = None,
+                 sock_dir: Optional[str] = None):
         '''
         Initialize a QEMUMachine
 
@@ -111,27 +113,27 @@ def __init__(self,
             self._remove_monitor_sockfile = True
 
         # Runstate
-        self._qemu_log_path = None
-        self._qemu_log_file = None
+        self._qemu_log_path: Optional[str] = None
+        self._qemu_log_file: Optional[BinaryIO] = None
         self._popen: Optional['subprocess.Popen[bytes]'] = None
-        self._events = []
-        self._iolog = None
+        self._events: List[QMPMessage] = []
+        self._iolog: Optional[str] = None
         self._qmp_set = True   # Enable QMP monitor by default.
         self._qmp_connection: Optional[qmp.QEMUMonitorProtocol] = None
         self._qemu_full_args: Tuple[str, ...] = ()
-        self._temp_dir = None
+        self._temp_dir: Optional[str] = None
         self._launched = False
-        self._machine = None
+        self._machine: Optional[str] = None
         self._console_index = 0
         self._console_set = False
-        self._console_device_type = None
+        self._console_device_type: Optional[str] = None
         self._console_address = os.path.join(
             self._sock_dir, f"{self._name}-console.sock"
         )
-        self._console_socket = None
-        self._remove_files = []
+        self._console_socket: Optional[socket.socket] = None
+        self._remove_files: List[str] = []
 
-    def __enter__(self):
+    def __enter__(self) -> 'QEMUMachine':
         return self
 
     def __exit__(self,
@@ -140,14 +142,15 @@ def __exit__(self,
                  exc_tb: Optional[TracebackType]) -> None:
         self.shutdown()
 
-    def add_monitor_null(self):
+    def add_monitor_null(self) -> None:
         """
         This can be used to add an unused monitor instance.
         """
         self._args.append('-monitor')
         self._args.append('null')
 
-    def add_fd(self, fd, fdset, opaque, opts=''):
+    def add_fd(self, fd: int, fdset: int,
+               opaque: str, opts: str = '') -> 'QEMUMachine':
         """
         Pass a file descriptor to the VM
         """
@@ -166,7 +169,8 @@ def add_fd(self, fd, fdset, opaque, opts=''):
         self._args.append(','.join(options))
         return self
 
-    def send_fd_scm(self, fd=None, file_path=None):
+    def send_fd_scm(self, fd: Optional[int] = None,
+                    file_path: Optional[str] = None) -> int:
         """
         Send an fd or file_path to socket_scm_helper.
 
@@ -210,7 +214,7 @@ def send_fd_scm(self, fd=None, file_path=None):
         return proc.returncode
 
     @staticmethod
-    def _remove_if_exists(path):
+    def _remove_if_exists(path: str) -> None:
         """
         Remove file object at path if it exists
         """
@@ -221,7 +225,7 @@ def _remove_if_exists(path):
                 return
             raise
 
-    def is_running(self):
+    def is_running(self) -> bool:
         """Returns true if the VM is running."""
         return self._popen is not None and self._popen.poll() is None
 
@@ -231,19 +235,19 @@ def _subp(self) -> 'subprocess.Popen[bytes]':
             raise QEMUMachineError('Subprocess pipe not present')
         return self._popen
 
-    def exitcode(self):
+    def exitcode(self) -> Optional[int]:
         """Returns the exit code if possible, or None."""
         if self._popen is None:
             return None
         return self._popen.poll()
 
-    def get_pid(self):
+    def get_pid(self) -> Optional[int]:
         """Returns the PID of the running process, or None."""
         if not self.is_running():
             return None
         return self._subp.pid
 
-    def _load_io_log(self):
+    def _load_io_log(self) -> None:
         if self._qemu_log_path is not None:
             with open(self._qemu_log_path, "r") as iolog:
                 self._iolog = iolog.read()
@@ -277,7 +281,7 @@ def _base_args(self) -> List[str]:
                 args.extend(['-device', device])
         return args
 
-    def _pre_launch(self):
+    def _pre_launch(self) -> None:
         self._temp_dir = tempfile.mkdtemp(dir=self._test_dir)
         self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
@@ -295,11 +299,11 @@ def _pre_launch(self):
                 nickname=self._name
             )
 
-    def _post_launch(self):
+    def _post_launch(self) -> None:
         if self._qmp:
             self._qmp.accept()
 
-    def _post_shutdown(self):
+    def _post_shutdown(self) -> None:
         if self._qemu_log_file is not None:
             self._qemu_log_file.close()
             self._qemu_log_file = None
@@ -313,7 +317,7 @@ def _post_shutdown(self):
         while len(self._remove_files) > 0:
             self._remove_if_exists(self._remove_files.pop())
 
-    def launch(self):
+    def launch(self) -> None:
         """
         Launch the VM and make sure we cleanup and expose the
         command line/output in case of exception
@@ -337,7 +341,7 @@ def launch(self):
                 LOG.debug('Output: %r', self._iolog)
             raise
 
-    def _launch(self):
+    def _launch(self) -> None:
         """
         Launch the VM and establish a QMP connection
         """
@@ -358,7 +362,7 @@ def _launch(self):
                                        close_fds=False)
         self._post_launch()
 
-    def wait(self):
+    def wait(self) -> None:
         """
         Wait for the VM to power off
         """
@@ -413,7 +417,7 @@ def shutdown(self, has_quit: bool = False) -> None:
 
         self._launched = False
 
-    def set_qmp_monitor(self, enabled=True):
+    def set_qmp_monitor(self, enabled: bool = True) -> None:
         """
         Set the QMP monitor.
 
@@ -453,7 +457,9 @@ def qmp(self, cmd: str,
         qmp_args = self._qmp_args(conv_keys, **args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
-    def command(self, cmd, conv_keys=True, **args):
+    def command(self, cmd: str,
+                conv_keys: bool = True,
+                **args: Any) -> QMPReturnValue:
         """
         Invoke a QMP command.
         On success return the response dict.
@@ -462,7 +468,7 @@ def command(self, cmd, conv_keys=True, **args):
         qmp_args = self._qmp_args(conv_keys, **args)
         return self._qmp.command(cmd, **qmp_args)
 
-    def get_qmp_event(self, wait=False):
+    def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
         """
         Poll for one queued QMP events and return it
         """
@@ -470,7 +476,7 @@ def get_qmp_event(self, wait=False):
             return self._events.pop(0)
         return self._qmp.pull_event(wait=wait)
 
-    def get_qmp_events(self, wait=False):
+    def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
         """
         Poll for queued QMP events and return a list of dicts
         """
@@ -481,7 +487,7 @@ def get_qmp_events(self, wait=False):
         return events
 
     @staticmethod
-    def event_match(event, match=None):
+    def event_match(event: Any, match: Optional[Any]) -> bool:
         """
         Check if an event matches optional match criteria.
 
@@ -511,9 +517,11 @@ def event_match(event, match=None):
             return True
         except TypeError:
             # either match or event wasn't iterable (not a dict)
-            return match == event
+            return bool(match == event)
 
-    def event_wait(self, name, timeout=60.0, match=None):
+    def event_wait(self, name: str,
+                   timeout: float = 60.0,
+                   match: Optional[QMPMessage] = None) -> Optional[QMPMessage]:
         """
         event_wait waits for and returns a named event from QMP with a timeout.
 
@@ -523,7 +531,9 @@ def event_wait(self, name, timeout=60.0, match=None):
         """
         return self.events_wait([(name, match)], timeout)
 
-    def events_wait(self, events, timeout=60.0):
+    def events_wait(self,
+                    events: Sequence[Tuple[str, Any]],
+                    timeout: float = 60.0) -> Optional[QMPMessage]:
         """
         events_wait waits for and returns a named event
         from QMP with a timeout.
@@ -533,7 +543,7 @@ def events_wait(self, events, timeout=60.0):
                 See event_match for details.
         timeout: QEMUMonitorProtocol.pull_event timeout parameter.
         """
-        def _match(event):
+        def _match(event: QMPMessage) -> bool:
             for name, match in events:
                 if event['event'] == name and self.event_match(event, match):
                     return True
@@ -558,20 +568,20 @@ def _match(event):
 
         return None
 
-    def get_log(self):
+    def get_log(self) -> Optional[str]:
         """
         After self.shutdown or failed qemu execution, this returns the output
         of the qemu process.
         """
         return self._iolog
 
-    def add_args(self, *args):
+    def add_args(self, *args: str) -> None:
         """
         Adds to the list of extra arguments to be given to the QEMU binary
         """
         self._args.extend(args)
 
-    def set_machine(self, machine_type):
+    def set_machine(self, machine_type: str) -> None:
         """
         Sets the machine type
 
@@ -580,7 +590,9 @@ def set_machine(self, machine_type):
         """
         self._machine = machine_type
 
-    def set_console(self, device_type=None, console_index=0):
+    def set_console(self,
+                    device_type: Optional[str] = None,
+                    console_index: int = 0) -> None:
         """
         Sets the device type for a console device
 
@@ -611,7 +623,7 @@ def set_console(self, device_type=None, console_index=0):
         self._console_index = console_index
 
     @property
-    def console_socket(self):
+    def console_socket(self) -> socket.socket:
         """
         Returns a socket connected to the console
         """
diff --git a/python/qemu/lib/qmp.py b/python/qemu/lib/qmp.py
index 1aefc00c93..1ae535ddb3 100644
--- a/python/qemu/lib/qmp.py
+++ b/python/qemu/lib/qmp.py
@@ -15,6 +15,7 @@
     Any,
     cast,
     Dict,
+    List,
     Optional,
     TextIO,
     Type,
@@ -90,7 +91,9 @@ class QEMUMonitorProtocol:
     #: Logger object for debugging messages
     logger = logging.getLogger('QMP')
 
-    def __init__(self, address, server=False, nickname=None):
+    def __init__(self, address: SocketAddrT,
+                 server: bool = False,
+                 nickname: Optional[str] = None):
         """
         Create a QEMUMonitorProtocol class.
 
@@ -102,7 +105,7 @@ def __init__(self, address, server=False, nickname=None):
         @note No connection is established, this is done by the connect() or
               accept() methods
         """
-        self.__events = []
+        self.__events: List[QMPMessage] = []
         self.__address = address
         self.__sock = self.__get_sock()
         self.__sockfile: Optional[TextIO] = None
@@ -114,14 +117,14 @@ def __init__(self, address, server=False, nickname=None):
             self.__sock.bind(self.__address)
             self.__sock.listen(1)
 
-    def __get_sock(self):
+    def __get_sock(self) -> socket.socket:
         if isinstance(self.__address, tuple):
             family = socket.AF_INET
         else:
             family = socket.AF_UNIX
         return socket.socket(family, socket.SOCK_STREAM)
 
-    def __negotiate_capabilities(self):
+    def __negotiate_capabilities(self) -> QMPMessage:
         greeting = self.__json_read()
         if greeting is None or "QMP" not in greeting:
             raise QMPConnectError
@@ -131,7 +134,7 @@ def __negotiate_capabilities(self):
             return greeting
         raise QMPCapabilitiesError
 
-    def __json_read(self, only_event=False):
+    def __json_read(self, only_event: bool = False) -> Optional[QMPMessage]:
         assert self.__sockfile is not None
         while True:
             data = self.__sockfile.readline()
@@ -148,7 +151,7 @@ def __json_read(self, only_event=False):
                     continue
             return resp
 
-    def __get_events(self, wait=False):
+    def __get_events(self, wait: Union[bool, float] = False) -> None:
         """
         Check for new events in the stream and cache them in __events.
 
@@ -186,7 +189,7 @@ def __get_events(self, wait=False):
                 raise QMPConnectError("Error while reading from socket")
             self.__sock.settimeout(None)
 
-    def __enter__(self):
+    def __enter__(self) -> 'QEMUMonitorProtocol':
         # Implement context manager enter function.
         return self
 
@@ -199,7 +202,7 @@ def __exit__(self,
         # Implement context manager exit function.
         self.close()
 
-    def connect(self, negotiate=True):
+    def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         """
         Connect to the QMP Monitor and perform capabilities negotiation.
 
@@ -214,7 +217,7 @@ def connect(self, negotiate=True):
             return self.__negotiate_capabilities()
         return None
 
-    def accept(self, timeout=15.0):
+    def accept(self, timeout: float = 15.0) -> QMPMessage:
         """
         Await connection from QMP Monitor and perform capabilities negotiation.
 
@@ -250,7 +253,9 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
         self.logger.debug("<<< %s", resp)
         return resp
 
-    def cmd(self, name, args=None, cmd_id=None):
+    def cmd(self, name: str,
+            args: Optional[Dict[str, Any]] = None,
+            cmd_id: Optional[Any] = None) -> QMPMessage:
         """
         Build a QMP command and send it to the QMP Monitor.
 
@@ -258,14 +263,14 @@ def cmd(self, name, args=None, cmd_id=None):
         @param args: command arguments (dict)
         @param cmd_id: command id (dict, list, string or int)
         """
-        qmp_cmd = {'execute': name}
+        qmp_cmd: QMPMessage = {'execute': name}
         if args:
             qmp_cmd['arguments'] = args
         if cmd_id:
             qmp_cmd['id'] = cmd_id
         return self.cmd_obj(qmp_cmd)
 
-    def command(self, cmd, **kwds):
+    def command(self, cmd: str, **kwds: Any) -> QMPReturnValue:
         """
         Build and send a QMP command to the monitor, report errors if any
         """
@@ -278,7 +283,8 @@ def command(self, cmd, **kwds):
             )
         return cast(QMPReturnValue, ret['return'])
 
-    def pull_event(self, wait=False):
+    def pull_event(self,
+                   wait: Union[bool, float] = False) -> Optional[QMPMessage]:
         """
         Pulls a single event.
 
@@ -298,7 +304,7 @@ def pull_event(self, wait=False):
             return self.__events.pop(0)
         return None
 
-    def get_events(self, wait=False):
+    def get_events(self, wait: bool = False) -> List[QMPMessage]:
         """
         Get a list of available QMP events.
 
@@ -315,13 +321,13 @@ def get_events(self, wait=False):
         self.__get_events(wait)
         return self.__events
 
-    def clear_events(self):
+    def clear_events(self) -> None:
         """
         Clear current list of pending events.
         """
         self.__events = []
 
-    def close(self):
+    def close(self) -> None:
         """
         Close the socket and socket file.
         """
@@ -330,7 +336,7 @@ def close(self):
         if self.__sockfile:
             self.__sockfile.close()
 
-    def settimeout(self, timeout):
+    def settimeout(self, timeout: float) -> None:
         """
         Set the socket timeout.
 
@@ -339,7 +345,7 @@ def settimeout(self, timeout):
         """
         self.__sock.settimeout(timeout)
 
-    def get_sock_fd(self):
+    def get_sock_fd(self) -> int:
         """
         Get the socket file descriptor.
 
@@ -347,7 +353,7 @@ def get_sock_fd(self):
         """
         return self.__sock.fileno()
 
-    def is_scm_available(self):
+    def is_scm_available(self) -> bool:
         """
         Check if the socket allows for SCM_RIGHTS.
 
diff --git a/python/qemu/lib/qtest.py b/python/qemu/lib/qtest.py
index ae4661d4d3..df6300cd4f 100644
--- a/python/qemu/lib/qtest.py
+++ b/python/qemu/lib/qtest.py
@@ -24,6 +24,8 @@
     Optional,
     Sequence,
     TextIO,
+    Tuple,
+    Union,
 )
 
 from .machine import QEMUMachine
@@ -43,7 +45,8 @@ class QEMUQtestProtocol:
        No conection is estabalished by __init__(), this is done
        by the connect() or accept() methods.
     """
-    def __init__(self, address, server=False):
+    def __init__(self, address: Union[Tuple[str, str], str],
+                 server: bool = False):
         self._address = address
         self._sock = self._get_sock()
         self._sockfile: Optional[TextIO] = None
@@ -51,14 +54,14 @@ def __init__(self, address, server=False):
             self._sock.bind(self._address)
             self._sock.listen(1)
 
-    def _get_sock(self):
+    def _get_sock(self) -> socket.socket:
         if isinstance(self._address, tuple):
             family = socket.AF_INET
         else:
             family = socket.AF_UNIX
         return socket.socket(family, socket.SOCK_STREAM)
 
-    def connect(self):
+    def connect(self) -> None:
         """
         Connect to the qtest socket.
 
@@ -67,7 +70,7 @@ def connect(self):
         self._sock.connect(self._address)
         self._sockfile = self._sock.makefile(mode='r')
 
-    def accept(self):
+    def accept(self) -> None:
         """
         Await connection from QEMU.
 
@@ -76,7 +79,7 @@ def accept(self):
         self._sock, _ = self._sock.accept()
         self._sockfile = self._sock.makefile(mode='r')
 
-    def cmd(self, qtest_cmd):
+    def cmd(self, qtest_cmd: str) -> str:
         """
         Send a qtest command on the wire.
 
@@ -87,14 +90,16 @@ def cmd(self, qtest_cmd):
         resp = self._sockfile.readline()
         return resp
 
-    def close(self):
-        """Close this socket."""
+    def close(self) -> None:
+        """
+        Close this socket.
+        """
         self._sock.close()
         if self._sockfile:
             self._sockfile.close()
             self._sockfile = None
 
-    def settimeout(self, timeout):
+    def settimeout(self, timeout: Optional[float]) -> None:
         """Set a timeout, in seconds."""
         self._sock.settimeout(timeout)
 
@@ -118,7 +123,7 @@ def __init__(self,
         super().__init__(binary, args, name=name, test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
-        self._qtest = None
+        self._qtest: Optional[QEMUQtestProtocol] = None
         self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
 
     @property
@@ -130,7 +135,7 @@ def _base_args(self) -> List[str]:
         ])
         return args
 
-    def _pre_launch(self):
+    def _pre_launch(self) -> None:
         super()._pre_launch()
         self._qtest = QEMUQtestProtocol(self._qtest_path, server=True)
 
@@ -139,7 +144,7 @@ def _post_launch(self) -> None:
         super()._post_launch()
         self._qtest.accept()
 
-    def _post_shutdown(self):
+    def _post_shutdown(self) -> None:
         super()._post_shutdown()
         self._remove_if_exists(self._qtest_path)
 
-- 
2.21.1


