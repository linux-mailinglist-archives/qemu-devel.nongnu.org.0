Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185294762B8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:10:15 +0100 (CET)
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxabO-0000LJ-8N
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaC8-0007Mb-O0
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaC4-00026h-G4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xb4PplQhbL7wdZi1aX6SAsAGZLeng6zxrf339ML0LoI=;
 b=A5XvC4nA+oadLhDq7NZYsvyGbSMo0Nc+pAijWpcP5EflvldE3ci2JnH3o0ciLEAtsqEoIk
 +w6rTBnOXG0XFathE1myrDVvKucPuR/cTZDywB1sAHHTRFw+BuBiE7soUc5ZtlpUGhvgpR
 7O7J/QoyftkPkBkyqXkclU7SjtfQy1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-va_jTYPTPx62WhRZKXrRVQ-1; Wed, 15 Dec 2021 14:43:55 -0500
X-MC-Unique: va_jTYPTPx62WhRZKXrRVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C113D18C8C00;
 Wed, 15 Dec 2021 19:43:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EF391036D00;
 Wed, 15 Dec 2021 19:43:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/25] python: rename qemu.aqmp to qemu.qmp
Date: Wed, 15 Dec 2021 14:39:39 -0500
Message-Id: <20211215193939.3768033-26-jsnow@redhat.com>
In-Reply-To: <20211215193939.3768033-1-jsnow@redhat.com>
References: <20211215193939.3768033-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we are fully switched over to the new QMP library, move it back
over the old namespace. This is being done primarily so that we may
upload this package simply as "qemu.qmp" without introducing confusion
over whether or not "aqmp" is a new protocol or not.

The trade-off is increased confusion inside the QEMU developer
tree. Sorry!

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/PACKAGE.rst                        |  4 ++--
 python/README.rst                         |  4 ++--
 python/qemu/machine/machine.py            |  4 ++--
 python/qemu/machine/qtest.py              |  2 +-
 python/qemu/{aqmp => qmp}/__init__.py     |  6 +++---
 python/qemu/{aqmp => qmp}/aqmp_tui.py     |  0
 python/qemu/{aqmp => qmp}/error.py        |  0
 python/qemu/{aqmp => qmp}/events.py       |  2 +-
 python/qemu/{aqmp => qmp}/legacy.py       |  0
 python/qemu/{aqmp => qmp}/message.py      |  0
 python/qemu/{aqmp => qmp}/models.py       |  0
 python/qemu/{aqmp => qmp}/protocol.py     |  4 ++--
 python/qemu/{aqmp => qmp}/py.typed        |  0
 python/qemu/{aqmp => qmp}/qmp_client.py   | 16 ++++++++--------
 python/qemu/{aqmp => qmp}/qmp_shell.py    |  4 ++--
 python/qemu/{aqmp => qmp}/util.py         |  0
 python/qemu/utils/qemu_ga_client.py       |  4 ++--
 python/qemu/utils/qom.py                  |  2 +-
 python/qemu/utils/qom_common.py           |  4 ++--
 python/qemu/utils/qom_fuse.py             |  2 +-
 python/setup.cfg                          |  8 ++++----
 python/tests/protocol.py                  | 14 +++++++-------
 scripts/cpu-x86-uarch-abi.py              |  2 +-
 scripts/device-crash-test                 |  4 ++--
 scripts/qmp/qmp-shell                     |  2 +-
 scripts/render_block_graph.py             |  4 ++--
 scripts/simplebench/bench_block_job.py    |  2 +-
 tests/qemu-iotests/iotests.py             |  2 +-
 tests/qemu-iotests/tests/mirror-top-perms |  6 +++---
 29 files changed, 51 insertions(+), 51 deletions(-)
 rename python/qemu/{aqmp => qmp}/__init__.py (87%)
 rename python/qemu/{aqmp => qmp}/aqmp_tui.py (100%)
 rename python/qemu/{aqmp => qmp}/error.py (100%)
 rename python/qemu/{aqmp => qmp}/events.py (99%)
 rename python/qemu/{aqmp => qmp}/legacy.py (100%)
 rename python/qemu/{aqmp => qmp}/message.py (100%)
 rename python/qemu/{aqmp => qmp}/models.py (100%)
 rename python/qemu/{aqmp => qmp}/protocol.py (99%)
 rename python/qemu/{aqmp => qmp}/py.typed (100%)
 rename python/qemu/{aqmp => qmp}/qmp_client.py (97%)
 rename python/qemu/{aqmp => qmp}/qmp_shell.py (99%)
 rename python/qemu/{aqmp => qmp}/util.py (100%)

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
index ddfa9ba3f5..b0b86cc4c3 100644
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
index eb5213337d..9c1fceaee7 100644
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
index 21fb4a4f30..6e4bf6520c 100644
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
index 817c8a5425..f29d5c1042 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,7 +26,7 @@
     TextIO,
 )
 
-from qemu.aqmp.protocol import SocketAddrT
+from qemu.qmp.protocol import SocketAddrT
 
 from .machine import QEMUMachine
 
diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/qmp/__init__.py
similarity index 87%
rename from python/qemu/aqmp/__init__.py
rename to python/qemu/qmp/__init__.py
index e1efab00af..b3f1d919e2 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -6,8 +6,8 @@
 QEMU Guest Agent, and the QEMU Storage Daemon.
 
 `QMPClient` provides the main functionality of this package. All errors
-raised by this library dervive from `QMPError`, see `aqmp.error` for
-additional detail. See `aqmp.events` for an in-depth tutorial on
+raised by this library dervive from `QMPError`, see `qmp.error` for
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
index f3d4e2b5e8..6199776cc6 100644
--- a/python/qemu/aqmp/events.py
+++ b/python/qemu/qmp/events.py
@@ -1,5 +1,5 @@
 """
-AQMP Events and EventListeners
+QMP Events and EventListeners
 
 Asynchronous QMP uses `EventListener` objects to listen for events. An
 `EventListener` is a FIFO event queue that can be pre-filtered to listen
diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/qmp/legacy.py
similarity index 100%
rename from python/qemu/aqmp/legacy.py
rename to python/qemu/qmp/legacy.py
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
index 9ee6fe4ae2..5d417a95c3 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -193,9 +193,9 @@ class AsyncProtocol(Generic[T]):
 
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
index f1a845cc82..8ea9e45115 100644
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
index d11bf54b00..571110f4f8 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -95,8 +95,8 @@
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
index 15ed430c61..8c38a7ac9c 100644
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
index bb5d1a78f5..bcf192f477 100644
--- a/python/qemu/utils/qom.py
+++ b/python/qemu/utils/qom.py
@@ -32,7 +32,7 @@
 
 import argparse
 
-from qemu.aqmp import ExecuteError
+from qemu.qmp import ExecuteError
 
 from .qom_common import QOMCommand
 
diff --git a/python/qemu/utils/qom_common.py b/python/qemu/utils/qom_common.py
index 6f07451dfa..7f5682fc04 100644
--- a/python/qemu/utils/qom_common.py
+++ b/python/qemu/utils/qom_common.py
@@ -27,8 +27,8 @@
     TypeVar,
 )
 
-from qemu.aqmp import QMPError
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.qmp import QMPError
+from qemu.qmp.legacy import QEMUMonitorProtocol
 
 
 # The following is needed only for a type alias.
diff --git a/python/qemu/utils/qom_fuse.py b/python/qemu/utils/qom_fuse.py
index 653a76b93b..8dcd59fcde 100644
--- a/python/qemu/utils/qom_fuse.py
+++ b/python/qemu/utils/qom_fuse.py
@@ -48,7 +48,7 @@
 import fuse
 from fuse import FUSE, FuseOSError, Operations
 
-from qemu.aqmp import ExecuteError
+from qemu.qmp import ExecuteError
 
 from .qom_common import QOMCommand
 
diff --git a/python/setup.cfg b/python/setup.cfg
index c341e922c2..911ae02de7 100644
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
 
@@ -66,8 +66,8 @@ console_scripts =
     qom-tree = qemu.utils.qom:QOMTree.entry_point
     qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.utils.qemu_ga_client:main
-    qmp-shell = qemu.aqmp.qmp_shell:main
-    aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
+    qmp-shell = qemu.qmp.qmp_shell:main
+    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
@@ -83,7 +83,7 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
-[mypy-qemu.aqmp.aqmp_tui]
+[mypy-qemu.qmp.aqmp_tui]
 # urwid and urwid_readline have no type stubs:
 allow_subclassing_any = True
 
diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index 5cd7938be3..8864e66a94 100644
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
@@ -170,7 +170,7 @@ def testDefaultName(self):
     def testLogger(self):
         self.assertEqual(
             self.proto.logger.name,
-            'qemu.aqmp.protocol'
+            'qemu.qmp.protocol'
         )
 
     def testName(self):
@@ -183,7 +183,7 @@ def testName(self):
 
         self.assertEqual(
             self.proto.logger.name,
-            'qemu.aqmp.protocol.Steve'
+            'qemu.qmp.protocol.Steve'
         )
 
         self.assertEqual(
@@ -418,7 +418,7 @@ async def _bad_connection(self, family: str):
             await self.proto.accept('/dev/null')
 
     async def _hanging_connection(self):
-        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
+        with TemporaryDirectory(suffix='.qmp') as tmpdir:
             sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
             await self.proto.accept(sock)
 
@@ -574,7 +574,7 @@ async def _asyncTearDown(self):
 
     @TestBase.async_test
     async def testSmoke(self):
-        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
+        with TemporaryDirectory(suffix='.qmp') as tmpdir:
             sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
             server_task = create_task(self.server.accept(sock))
 
diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index c262d2f027..82ff07582f 100644
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
index 7fbd99158b..4bfc68c008 100755
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
index 31b19d73e2..4a20f97db7 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.aqmp import qmp_shell
+from qemu.qmp import qmp_shell
 
 
 if __name__ == '__main__':
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index 97778927f3..26f43fef27 100755
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
index af9d1646a4..56191db44b 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -27,7 +27,7 @@
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
-from qemu.aqmp import ConnectError
+from qemu.qmp import ConnectError
 
 
 def bench_block_job(cmd, cmd_args, qemu_args):
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index cb21aebe36..28c1cbc30f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -37,7 +37,7 @@
 from contextlib import contextmanager
 
 from qemu.machine import qtest
-from qemu.aqmp.legacy import QMPMessage
+from qemu.qmp.legacy import QMPMessage
 
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index f394931a00..d0b4449b35 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -21,7 +21,7 @@
 
 import os
 
-from qemu.aqmp import ConnectError
+from qemu.qmp import ConnectError
 from qemu.machine import machine
 
 import iotests
@@ -99,10 +99,10 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
         self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
         try:
-            # Silence AQMP errors temporarily.
+            # Silence QMP errors temporarily.
             # TODO: Remove change_log_level and allow the errors to be logged.
             #       This necessitates a PID filter on *all* logging output.
-            with change_log_level('qemu.aqmp'):
+            with change_log_level('qemu.qmp'):
                 self.vm_b.launch()
                 print('ERROR: VM B launched successfully, '
                       'this should not have happened')
-- 
2.31.1


