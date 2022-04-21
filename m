Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C550A480
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:41:12 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYvf-0008AO-Gy
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXf-0003tU-4E
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXX-0005ps-2J
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPK30BpE9eYbb+HSe4qCY2Ru3K7Ql+SVgBjxhuheg7I=;
 b=clKXPgtHHyFzufoJGgJ+fwfbgtFM3KNuH1nWeT8zXPNw6f2OrEJkaftRRmFtXoq+ufszlp
 GCK/KK1f35Td7TYN91Dhw/i6uzo9MIYHEggunKTwFIFwWjFq6MNNbJ5JZqujGElyVcWUMs
 5+XlMPcxvf9SJox8YzI/jJZpPQeKuOY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-FzNFQMJ2Mb2z6BbuiYbzgw-1; Thu, 21 Apr 2022 11:16:10 -0400
X-MC-Unique: FzNFQMJ2Mb2z6BbuiYbzgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B67681E15C05;
 Thu, 21 Apr 2022 15:16:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D4940D016A;
 Thu, 21 Apr 2022 15:16:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] python: rename qemu.aqmp to qemu.qmp
Date: Thu, 21 Apr 2022 11:15:58 -0400
Message-Id: <20220421151600.984189-16-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we are fully switched over to the new QMP library, move it back
over the old namespace. This is being done primarily so that we may
upload this package simply as "qemu.qmp" without introducing confusion
over whether or not "aqmp" is a new protocol or not.

The trade-off is increased confusion inside the QEMU developer
tree. Sorry!

Note: the 'private' member "_aqmp" in legacy.py also changes to "_qmp";
not out of necessity, but just to remove any traces of the "aqmp"
name.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Message-id: 20220330172812.3427355-8-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/PACKAGE.rst                        |  4 +--
 python/README.rst                         |  4 +--
 python/qemu/machine/machine.py            |  4 +--
 python/qemu/machine/qtest.py              |  2 +-
 python/qemu/{aqmp => qmp}/__init__.py     |  6 ++--
 python/qemu/{aqmp => qmp}/aqmp_tui.py     |  0
 python/qemu/{aqmp => qmp}/error.py        |  0
 python/qemu/{aqmp => qmp}/events.py       |  2 +-
 python/qemu/{aqmp => qmp}/legacy.py       | 38 +++++++++++------------
 python/qemu/{aqmp => qmp}/message.py      |  0
 python/qemu/{aqmp => qmp}/models.py       |  0
 python/qemu/{aqmp => qmp}/protocol.py     |  4 +--
 python/qemu/{aqmp => qmp}/py.typed        |  0
 python/qemu/{aqmp => qmp}/qmp_client.py   | 16 +++++-----
 python/qemu/{aqmp => qmp}/qmp_shell.py    |  4 +--
 python/qemu/{aqmp => qmp}/util.py         |  0
 python/qemu/utils/qemu_ga_client.py       |  4 +--
 python/qemu/utils/qom.py                  |  2 +-
 python/qemu/utils/qom_common.py           |  4 +--
 python/qemu/utils/qom_fuse.py             |  2 +-
 python/setup.cfg                          | 10 +++---
 python/tests/protocol.py                  | 14 ++++-----
 scripts/cpu-x86-uarch-abi.py              |  2 +-
 scripts/device-crash-test                 |  4 +--
 scripts/qmp/qmp-shell                     |  2 +-
 scripts/qmp/qmp-shell-wrap                |  2 +-
 scripts/render_block_graph.py             |  4 +--
 scripts/simplebench/bench_block_job.py    |  2 +-
 tests/qemu-iotests/iotests.py             |  2 +-
 tests/qemu-iotests/tests/mirror-top-perms |  4 +--
 30 files changed, 71 insertions(+), 71 deletions(-)
 rename python/qemu/{aqmp => qmp}/__init__.py (87%)
 rename python/qemu/{aqmp => qmp}/aqmp_tui.py (100%)
 rename python/qemu/{aqmp => qmp}/error.py (100%)
 rename python/qemu/{aqmp => qmp}/events.py (99%)
 rename python/qemu/{aqmp => qmp}/legacy.py (91%)
 rename python/qemu/{aqmp => qmp}/message.py (100%)
 rename python/qemu/{aqmp => qmp}/models.py (100%)
 rename python/qemu/{aqmp => qmp}/protocol.py (99%)
 rename python/qemu/{aqmp => qmp}/py.typed (100%)
 rename python/qemu/{aqmp => qmp}/qmp_client.py (97%)
 rename python/qemu/{aqmp => qmp}/qmp_shell.py (99%)
 rename python/qemu/{aqmp => qmp}/util.py (100%)

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
index ddfa9ba3f59..b0b86cc4c31 100644
--- a/python/PACKAGE.rst
+++ b/python/PACKAGE.rst
@@ -8,11 +8,11 @@ to change at any time.
 Usage
 -----
 
-The ``qemu.aqmp`` subpackage provides a library for communicating with
+The ``qemu.qmp`` subpackage provides a library for communicating with
 QMP servers. The ``qemu.machine`` subpackage offers rudimentary
 facilities for launching and managing QEMU processes. Refer to each
 package's documentation
-(``>>> help(qemu.aqmp)``, ``>>> help(qemu.machine)``)
+(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
 for more information.
 
 Contributing
diff --git a/python/README.rst b/python/README.rst
index eb5213337d2..9c1fceaee73 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -3,7 +3,7 @@ QEMU Python Tooling
 
 This directory houses Python tooling used by the QEMU project to build,
 configure, and test QEMU. It is organized by namespace (``qemu``), and
-then by package (e.g. ``qemu/machine``, ``qemu/aqmp``, etc).
+then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
 
 ``setup.py`` is used by ``pip`` to install this tooling to the current
 environment. ``setup.cfg`` provides the packaging configuration used by
@@ -59,7 +59,7 @@ Package installation also normally provides executable console scripts,
 so that tools like ``qmp-shell`` are always available via $PATH. To
 invoke them without installation, you can invoke e.g.:
 
-``> PYTHONPATH=~/src/qemu/python python3 -m qemu.aqmp.qmp_shell``
+``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
 
 The mappings between console script name and python module path can be
 found in ``setup.cfg``.
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 41be025ac7b..07ac5a710be 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -40,8 +40,8 @@
     TypeVar,
 )
 
-from qemu.aqmp import SocketAddrT
-from qemu.aqmp.legacy import (
+from qemu.qmp import SocketAddrT
+from qemu.qmp.legacy import (
     QEMUMonitorProtocol,
     QMPMessage,
     QMPReturnValue,
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 13e0aaff846..1a1fc6c9b08 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,7 +26,7 @@
     TextIO,
 )
 
-from qemu.aqmp import SocketAddrT
+from qemu.qmp import SocketAddrT
 
 from .machine import QEMUMachine
 
diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/qmp/__init__.py
similarity index 87%
rename from python/qemu/aqmp/__init__.py
rename to python/qemu/qmp/__init__.py
index 2b69b264f4f..69190d057a5 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -6,8 +6,8 @@
 QEMU Guest Agent, and the QEMU Storage Daemon.
 
 `QMPClient` provides the main functionality of this package. All errors
-raised by this library derive from `QMPError`, see `aqmp.error` for
-additional detail. See `aqmp.events` for an in-depth tutorial on
+raised by this library derive from `QMPError`, see `qmp.error` for
+additional detail. See `qmp.events` for an in-depth tutorial on
 managing QMP events.
 """
 
@@ -36,7 +36,7 @@
 
 
 # Suppress logging unless an application engages it.
-logging.getLogger('qemu.aqmp').addHandler(logging.NullHandler())
+logging.getLogger('qemu.qmp').addHandler(logging.NullHandler())
 
 
 # The order of these fields impact the Sphinx documentation order.
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/qmp/aqmp_tui.py
similarity index 100%
rename from python/qemu/aqmp/aqmp_tui.py
rename to python/qemu/qmp/aqmp_tui.py
diff --git a/python/qemu/aqmp/error.py b/python/qemu/qmp/error.py
similarity index 100%
rename from python/qemu/aqmp/error.py
rename to python/qemu/qmp/error.py
diff --git a/python/qemu/aqmp/events.py b/python/qemu/qmp/events.py
similarity index 99%
rename from python/qemu/aqmp/events.py
rename to python/qemu/qmp/events.py
index f3d4e2b5e85..6199776cc66 100644
--- a/python/qemu/aqmp/events.py
+++ b/python/qemu/qmp/events.py
@@ -1,5 +1,5 @@
 """
-AQMP Events and EventListeners
+QMP Events and EventListeners
 
 Asynchronous QMP uses `EventListener` objects to listen for events. An
 `EventListener` is a FIFO event queue that can be pre-filtered to listen
diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/qmp/legacy.py
similarity index 91%
rename from python/qemu/aqmp/legacy.py
rename to python/qemu/qmp/legacy.py
index dfcd20bbd23..a8629b44dff 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -78,13 +78,13 @@ def __init__(self, address: SocketAddrT,
                  server: bool = False,
                  nickname: Optional[str] = None):
 
-        self._aqmp = QMPClient(nickname)
+        self._qmp = QMPClient(nickname)
         self._aloop = asyncio.get_event_loop()
         self._address = address
         self._timeout: Optional[float] = None
 
         if server:
-            self._sync(self._aqmp.start_server(self._address))
+            self._sync(self._qmp.start_server(self._address))
 
     _T = TypeVar('_T')
 
@@ -96,9 +96,9 @@ def _sync(
         )
 
     def _get_greeting(self) -> Optional[QMPMessage]:
-        if self._aqmp.greeting is not None:
+        if self._qmp.greeting is not None:
             # pylint: disable=protected-access
-            return self._aqmp.greeting._asdict()
+            return self._qmp.greeting._asdict()
         return None
 
     def __enter__(self: _T) -> _T:
@@ -141,11 +141,11 @@ def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         :return: QMP greeting dict, or None if negotiate is false
         :raise ConnectError: on connection errors
         """
-        self._aqmp.await_greeting = negotiate
-        self._aqmp.negotiate = negotiate
+        self._qmp.await_greeting = negotiate
+        self._qmp.negotiate = negotiate
 
         self._sync(
-            self._aqmp.connect(self._address)
+            self._qmp.connect(self._address)
         )
         return self._get_greeting()
 
@@ -160,10 +160,10 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
         :return: QMP greeting dict
         :raise ConnectError: on connection errors
         """
-        self._aqmp.await_greeting = True
-        self._aqmp.negotiate = True
+        self._qmp.await_greeting = True
+        self._qmp.negotiate = True
 
-        self._sync(self._aqmp.accept(), timeout)
+        self._sync(self._qmp.accept(), timeout)
 
         ret = self._get_greeting()
         assert ret is not None
@@ -183,7 +183,7 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
                 # _raw() isn't a public API, because turning off
                 # automatic ID assignment is discouraged. For
                 # compatibility with iotests *only*, do it anyway.
-                self._aqmp._raw(qmp_cmd, assign_id=False),
+                self._qmp._raw(qmp_cmd, assign_id=False),
                 self._timeout
             )
         )
@@ -210,7 +210,7 @@ def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
         Build and send a QMP command to the monitor, report errors if any
         """
         return self._sync(
-            self._aqmp.execute(cmd, kwds),
+            self._qmp.execute(cmd, kwds),
             self._timeout
         )
 
@@ -231,7 +231,7 @@ def pull_event(self,
         """
         if not wait:
             # wait is False/0: "do not wait, do not except."
-            if self._aqmp.events.empty():
+            if self._qmp.events.empty():
                 return None
 
         # If wait is 'True', wait forever. If wait is False/0, the events
@@ -243,7 +243,7 @@ def pull_event(self,
 
         return dict(
             self._sync(
-                self._aqmp.events.get(),
+                self._qmp.events.get(),
                 timeout
             )
         )
@@ -263,7 +263,7 @@ def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
 
         :return: A list of QMP events.
         """
-        events = [dict(x) for x in self._aqmp.events.clear()]
+        events = [dict(x) for x in self._qmp.events.clear()]
         if events:
             return events
 
@@ -272,12 +272,12 @@ def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
 
     def clear_events(self) -> None:
         """Clear current list of pending events."""
-        self._aqmp.events.clear()
+        self._qmp.events.clear()
 
     def close(self) -> None:
         """Close the connection."""
         self._sync(
-            self._aqmp.disconnect()
+            self._qmp.disconnect()
         )
 
     def settimeout(self, timeout: Optional[float]) -> None:
@@ -298,10 +298,10 @@ def send_fd_scm(self, fd: int) -> None:
         """
         Send a file descriptor to the remote via SCM_RIGHTS.
         """
-        self._aqmp.send_fd_scm(fd)
+        self._qmp.send_fd_scm(fd)
 
     def __del__(self) -> None:
-        if self._aqmp.runstate == Runstate.IDLE:
+        if self._qmp.runstate == Runstate.IDLE:
             return
 
         if not self._aloop.is_running():
diff --git a/python/qemu/aqmp/message.py b/python/qemu/qmp/message.py
similarity index 100%
rename from python/qemu/aqmp/message.py
rename to python/qemu/qmp/message.py
diff --git a/python/qemu/aqmp/models.py b/python/qemu/qmp/models.py
similarity index 100%
rename from python/qemu/aqmp/models.py
rename to python/qemu/qmp/models.py
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/qmp/protocol.py
similarity index 99%
rename from python/qemu/aqmp/protocol.py
rename to python/qemu/qmp/protocol.py
index 36fae57f277..6ea86650ad2 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -196,9 +196,9 @@ class AsyncProtocol(Generic[T]):
 
     :param name:
         Name used for logging messages, if any. By default, messages
-        will log to 'qemu.aqmp.protocol', but each individual connection
+        will log to 'qemu.qmp.protocol', but each individual connection
         can be given its own logger by giving it a name; messages will
-        then log to 'qemu.aqmp.protocol.${name}'.
+        then log to 'qemu.qmp.protocol.${name}'.
     """
     # pylint: disable=too-many-instance-attributes
 
diff --git a/python/qemu/aqmp/py.typed b/python/qemu/qmp/py.typed
similarity index 100%
rename from python/qemu/aqmp/py.typed
rename to python/qemu/qmp/py.typed
diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
similarity index 97%
rename from python/qemu/aqmp/qmp_client.py
rename to python/qemu/qmp/qmp_client.py
index 90a8737f03a..5dcda04a756 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/qmp/qmp_client.py
@@ -192,7 +192,7 @@ async def run(self, address='/tmp/qemu.socket'):
               await self.qmp.runstate_changed.wait()
               await self.disconnect()
 
-    See `aqmp.events` for more detail on event handling patterns.
+    See `qmp.events` for more detail on event handling patterns.
     """
     #: Logger object used for debugging messages.
     logger = logging.getLogger(__name__)
@@ -416,7 +416,7 @@ def _do_send(self, msg: Message) -> None:
 
     @upper_half
     def _get_exec_id(self) -> str:
-        exec_id = f"__aqmp#{self._execute_id:05d}"
+        exec_id = f"__qmp#{self._execute_id:05d}"
         self._execute_id += 1
         return exec_id
 
@@ -476,7 +476,7 @@ async def _execute(self, msg: Message, assign_id: bool = True) -> Message:
         An execution ID will be assigned if assign_id is `True`. It can be
         disabled, but this requires that an ID is manually assigned
         instead. For manually assigned IDs, you must not use the string
-        '__aqmp#' anywhere in the ID.
+        '__qmp#' anywhere in the ID.
 
         :param msg: The QMP `Message` to execute.
         :param assign_id: If True, assign a new execution ID.
@@ -490,7 +490,7 @@ async def _execute(self, msg: Message, assign_id: bool = True) -> Message:
             msg['id'] = self._get_exec_id()
         elif 'id' in msg:
             assert isinstance(msg['id'], str)
-            assert '__aqmp#' not in msg['id']
+            assert '__qmp#' not in msg['id']
 
         exec_id = await self._issue(msg)
         return await self._reply(exec_id)
@@ -512,7 +512,7 @@ async def _raw(
             Assign an arbitrary execution ID to this message. If
             `False`, the existing id must either be absent (and no other
             such pending execution may omit an ID) or a string. If it is
-            a string, it must not start with '__aqmp#' and no other such
+            a string, it must not start with '__qmp#' and no other such
             pending execution may currently be using that ID.
 
         :return: Execution reply from the server.
@@ -524,7 +524,7 @@ async def _raw(
             When assign_id is `False`, an ID is given, and it is not a string.
         :raise ValueError:
             When assign_id is `False`, but the ID is not usable;
-            Either because it starts with '__aqmp#' or it is already in-use.
+            Either because it starts with '__qmp#' or it is already in-use.
         """
         # 1. convert generic Mapping or bytes to a QMP Message
         # 2. copy Message objects so that we assign an ID only to the copy.
@@ -534,9 +534,9 @@ async def _raw(
         if not assign_id and 'id' in msg:
             if not isinstance(exec_id, str):
                 raise TypeError(f"ID ('{exec_id}') must be a string.")
-            if exec_id.startswith('__aqmp#'):
+            if exec_id.startswith('__qmp#'):
                 raise ValueError(
-                    f"ID ('{exec_id}') must not start with '__aqmp#'."
+                    f"ID ('{exec_id}') must not start with '__qmp#'."
                 )
 
         if not assign_id and exec_id in self._pending:
diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
similarity index 99%
rename from python/qemu/aqmp/qmp_shell.py
rename to python/qemu/qmp/qmp_shell.py
index c23f1b19280..619ab42cedd 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -98,8 +98,8 @@
     Sequence,
 )
 
-from qemu.aqmp import ConnectError, QMPError, SocketAddrT
-from qemu.aqmp.legacy import (
+from qemu.qmp import ConnectError, QMPError, SocketAddrT
+from qemu.qmp.legacy import (
     QEMUMonitorProtocol,
     QMPBadPortError,
     QMPMessage,
diff --git a/python/qemu/aqmp/util.py b/python/qemu/qmp/util.py
similarity index 100%
rename from python/qemu/aqmp/util.py
rename to python/qemu/qmp/util.py
diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
index 15ed430c618..8c38a7ac9c0 100644
--- a/python/qemu/utils/qemu_ga_client.py
+++ b/python/qemu/utils/qemu_ga_client.py
@@ -50,8 +50,8 @@
     Sequence,
 )
 
-from qemu.aqmp import ConnectError, SocketAddrT
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.qmp import ConnectError, SocketAddrT
+from qemu.qmp.legacy import QEMUMonitorProtocol
 
 
 # This script has not seen many patches or careful attention in quite
diff --git a/python/qemu/utils/qom.py b/python/qemu/utils/qom.py
index bb5d1a78f59..bcf192f4774 100644
--- a/python/qemu/utils/qom.py
+++ b/python/qemu/utils/qom.py
@@ -32,7 +32,7 @@
 
 import argparse
 
-from qemu.aqmp import ExecuteError
+from qemu.qmp import ExecuteError
 
 from .qom_common import QOMCommand
 
diff --git a/python/qemu/utils/qom_common.py b/python/qemu/utils/qom_common.py
index e034a6f2476..80da1b23041 100644
--- a/python/qemu/utils/qom_common.py
+++ b/python/qemu/utils/qom_common.py
@@ -27,8 +27,8 @@
     TypeVar,
 )
 
-from qemu.aqmp import QMPError
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.qmp import QMPError
+from qemu.qmp.legacy import QEMUMonitorProtocol
 
 
 class ObjectPropertyInfo:
diff --git a/python/qemu/utils/qom_fuse.py b/python/qemu/utils/qom_fuse.py
index 653a76b93b9..8dcd59fcde6 100644
--- a/python/qemu/utils/qom_fuse.py
+++ b/python/qemu/utils/qom_fuse.py
@@ -48,7 +48,7 @@
 import fuse
 from fuse import FUSE, FuseOSError, Operations
 
-from qemu.aqmp import ExecuteError
+from qemu.qmp import ExecuteError
 
 from .qom_common import QOMCommand
 
diff --git a/python/setup.cfg b/python/setup.cfg
index 49e3c285f19..773e51b34e7 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -24,7 +24,7 @@ classifiers =
 [options]
 python_requires = >= 3.6
 packages =
-    qemu.aqmp
+    qemu.qmp
     qemu.machine
     qemu.utils
 
@@ -66,9 +66,9 @@ console_scripts =
     qom-tree = qemu.utils.qom:QOMTree.entry_point
     qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.utils.qemu_ga_client:main
-    qmp-shell = qemu.aqmp.qmp_shell:main
-    qmp-shell-wrap = qemu.aqmp.qmp_shell:main_wrap
-    aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
+    qmp-shell = qemu.qmp.qmp_shell:main
+    qmp-shell-wrap = qemu.qmp.qmp_shell:main_wrap
+    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
@@ -84,7 +84,7 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
-[mypy-qemu.aqmp.aqmp_tui]
+[mypy-qemu.qmp.aqmp_tui]
 # urwid and urwid_readline have no type stubs:
 allow_subclassing_any = True
 
diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index d6849ad3062..56c4d441f9c 100644
--- a/python/tests/protocol.py
+++ b/python/tests/protocol.py
@@ -6,9 +6,9 @@
 
 import avocado
 
-from qemu.aqmp import ConnectError, Runstate
-from qemu.aqmp.protocol import AsyncProtocol, StateError
-from qemu.aqmp.util import asyncio_run, create_task
+from qemu.qmp import ConnectError, Runstate
+from qemu.qmp.protocol import AsyncProtocol, StateError
+from qemu.qmp.util import asyncio_run, create_task
 
 
 class NullProtocol(AsyncProtocol[None]):
@@ -183,7 +183,7 @@ def testDefaultName(self):
     def testLogger(self):
         self.assertEqual(
             self.proto.logger.name,
-            'qemu.aqmp.protocol'
+            'qemu.qmp.protocol'
         )
 
     def testName(self):
@@ -196,7 +196,7 @@ def testName(self):
 
         self.assertEqual(
             self.proto.logger.name,
-            'qemu.aqmp.protocol.Steve'
+            'qemu.qmp.protocol.Steve'
         )
 
         self.assertEqual(
@@ -431,7 +431,7 @@ async def _bad_connection(self, family: str):
             await self.proto.start_server_and_accept('/dev/null')
 
     async def _hanging_connection(self):
-        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
+        with TemporaryDirectory(suffix='.qmp') as tmpdir:
             sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
             await self.proto.start_server_and_accept(sock)
 
@@ -587,7 +587,7 @@ async def _asyncTearDown(self):
 
     @TestBase.async_test
     async def testSmoke(self):
-        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
+        with TemporaryDirectory(suffix='.qmp') as tmpdir:
             sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
             server_task = create_task(self.server.start_server_and_accept(sock))
 
diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index c262d2f0277..82ff07582f8 100644
--- a/scripts/cpu-x86-uarch-abi.py
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -6,7 +6,7 @@
 # compatibility levels for each CPU model.
 #
 
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.qmp.legacy import QEMUMonitorProtocol
 import sys
 
 if len(sys.argv) != 2:
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 7fbd99158be..4bfc68c0087 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -36,7 +36,7 @@ from itertools import chain
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
 from qemu.machine import QEMUMachine
-from qemu.aqmp import ConnectError
+from qemu.qmp import ConnectError
 
 logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
@@ -517,7 +517,7 @@ def main():
         # Async QMP, when in use, is chatty about connection failures.
         # This script knowingly generates a ton of connection errors.
         # Silence this logger.
-        logging.getLogger('qemu.aqmp.qmp_client').setLevel(logging.CRITICAL)
+        logging.getLogger('qemu.qmp.qmp_client').setLevel(logging.CRITICAL)
 
     fatal_failures = []
     wl_stats = {}
diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 31b19d73e22..4a20f97db70 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.aqmp import qmp_shell
+from qemu.qmp import qmp_shell
 
 
 if __name__ == '__main__':
diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
index 66846e36d1f..9e94da114f5 100755
--- a/scripts/qmp/qmp-shell-wrap
+++ b/scripts/qmp/qmp-shell-wrap
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.aqmp import qmp_shell
+from qemu.qmp import qmp_shell
 
 
 if __name__ == '__main__':
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index b33fb70d5ee..8f731a5cfe1 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -25,8 +25,8 @@
 from graphviz import Digraph
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.aqmp import QMPError
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.qmp import QMPError
+from qemu.qmp.legacy import QEMUMonitorProtocol
 
 
 def perm(arr):
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index af9d1646a46..56191db44b2 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -27,7 +27,7 @@
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
-from qemu.aqmp import ConnectError
+from qemu.qmp import ConnectError
 
 
 def bench_block_job(cmd, cmd_args, qemu_args):
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6f9aa38e0e8..33a44671aa8 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -37,8 +37,8 @@
 
 from contextlib import contextmanager
 
-from qemu.aqmp.legacy import QMPMessage, QEMUMonitorProtocol
 from qemu.machine import qtest
+from qemu.qmp.legacy import QMPMessage, QEMUMonitorProtocol
 from qemu.utils import VerboseProcessError
 
 # Use this logger for logging messages directly from the iotests module
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index a9f275cd7f2..8bca5927089 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -97,8 +97,8 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
         self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
         try:
-            # Silence AQMP logging errors temporarily.
-            with change_log_level('qemu.aqmp'):
+            # Silence QMP logging errors temporarily.
+            with change_log_level('qemu.qmp'):
                 self.vm_b.launch()
                 print('ERROR: VM B launched successfully, '
                       'this should not have happened')
-- 
2.34.1


