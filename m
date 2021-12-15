Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B24762A1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:08:37 +0100 (CET)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaZo-0005Vp-9J
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaC2-0007M9-HI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaBp-00023x-84
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjKEAV9UvhRVVqz+3CvakmMoNWarxGXgoqhLYUzGXDQ=;
 b=Cb7oPfQJNesPHoTlAGTRsLw8qZRPJlq99nixMnE2LxTtLgd4H5TfIr4iqVj5jdDYw6QZ0z
 NB6oVtaym+Eq0hAKaHcHvuhC4lpV8WynTvrMnAW12m41a5dtK9yQ87uOJZ6wTOZ//QXLCi
 5r+2OuqqFAnz6ZEjqjlUpb4qQlbFOio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-VNRXOeAGORGBmJjjInZRig-1; Wed, 15 Dec 2021 14:43:45 -0500
X-MC-Unique: VNRXOeAGORGBmJjjInZRig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 885A88042E1;
 Wed, 15 Dec 2021 19:43:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46D7A10074FD;
 Wed, 15 Dec 2021 19:43:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/25] python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
Date: Wed, 15 Dec 2021 14:39:36 -0500
Message-Id: <20211215193939.3768033-23-jsnow@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the docstrings out of qemu.qmp, adjusting them as necessary to
more accurately reflect the current state of this class.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 110 ++++++++++++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 8 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 8f38e7d912..6c250cd46a 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -1,9 +1,23 @@
 """
-Sync QMP Wrapper
+(Legacy) Sync QMP Wrapper
 
-This class pretends to be qemu.qmp.QEMUMonitorProtocol.
+This module provides the `QEMUMonitorProtocol` class, which is a
+synchronous wrapper around `QMPClient`.
+
+Its design closely resembles that of the original QEMUMonitorProtocol
+class, originally written by Luiz Capitulino.
 """
 
+# Copyright (C) 2009, 2010, 2021 Red Hat Inc.
+#
+# Authors:
+#  Luiz Capitulino <lcapitulino@redhat.com>
+#  John Snow <jsnow@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+
 import asyncio
 from types import TracebackType
 from typing import (
@@ -39,9 +53,6 @@
 # {} is the QMPReturnValue.
 
 
-# pylint: disable=missing-docstring
-
-
 class QMPBadPortError(QMPError):
     """
     Unable to parse socket address: Port was non-numerical.
@@ -49,6 +60,21 @@ class QMPBadPortError(QMPError):
 
 
 class QEMUMonitorProtocol:
+    """
+    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP)
+    and then allow to handle commands and events.
+
+    :param address:  QEMU address, can be either a unix socket path (string)
+                     or a tuple in the form ( address, port ) for a TCP
+                     connection
+    :param server:   Deprecated, ignored. (See 'accept')
+    :param nickname: Optional nickname used for logging.
+
+    ..note::
+        No connection is established during `__init__`, this is done by
+        the `connect()` or `accept()` methods.
+    """
+
     def __init__(self, address: SocketAddrT,
                  server: bool = False,  # pylint: disable=unused-argument
                  nickname: Optional[str] = None):
@@ -108,6 +134,12 @@ def parse_address(cls, address: str) -> SocketAddrT:
         return address
 
     def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
+        """
+        Connect to the QMP Monitor and perform capabilities negotiation.
+
+        :return: QMP greeting dict, or None if negotiate is false
+        :raise ConnectError: on connection errors
+        """
         self._aqmp.await_greeting = negotiate
         self._aqmp.negotiate = negotiate
 
@@ -117,6 +149,16 @@ def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         return self._get_greeting()
 
     def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
+        """
+        Await connection from QMP Monitor and perform capabilities negotiation.
+
+        :param timeout:
+            timeout in seconds (nonnegative float number, or None).
+            If None, there is no timeout, and this may block forever.
+
+        :return: QMP greeting dict
+        :raise ConnectError: on connection errors
+        """
         self._aqmp.await_greeting = True
         self._aqmp.negotiate = True
 
@@ -130,6 +172,12 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
         return ret
 
     def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
+        """
+        Send a QMP command to the QMP Monitor.
+
+        :param qmp_cmd: QMP command to be sent as a Python dict
+        :return: QMP response as a Python dict
+        """
         return dict(
             self._sync(
                 # pylint: disable=protected-access
@@ -148,9 +196,9 @@ def cmd(self, name: str,
         """
         Build a QMP command and send it to the QMP Monitor.
 
-        @param name: command name (string)
-        @param args: command arguments (dict)
-        @param cmd_id: command id (dict, list, string or int)
+        :param name: command name (string)
+        :param args: command arguments (dict)
+        :param cmd_id: command id (dict, list, string or int)
         """
         qmp_cmd: QMPMessage = {'execute': name}
         if args:
@@ -160,6 +208,9 @@ def cmd(self, name: str,
         return self.cmd_obj(qmp_cmd)
 
     def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
+        """
+        Build and send a QMP command to the monitor, report errors if any
+        """
         return self._sync(
             self._aqmp.execute(cmd, kwds),
             self._timeout
@@ -167,6 +218,19 @@ def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
 
     def pull_event(self,
                    wait: Union[bool, float] = False) -> Optional[QMPMessage]:
+        """
+        Pulls a single event.
+
+        :param wait:
+            If False or 0, do not wait. Return None if no events ready.
+            If True, wait forever until the next event.
+            Otherwise, wait for the specified number of seconds.
+
+        :raise asyncio.TimeoutError:
+            When a timeout is requested and the timeout period elapses.
+
+        :return: The first available QMP event, or None.
+        """
         if not wait:
             # wait is False/0: "do not wait, do not except."
             if self._aqmp.events.empty():
@@ -187,6 +251,20 @@ def pull_event(self,
         )
 
     def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
+        """
+        Get a list of QMP events and clear all pending events.
+
+        :param wait:
+            If False or 0, do not wait. Return None if no events ready.
+            If True, wait until we have at least one event.
+            Otherwise, wait for up to the specified number of seconds for at
+            least one event.
+
+        :raise asyncio.TimeoutError:
+            When a timeout is requested and the timeout period elapses.
+
+        :return: A list of QMP events.
+        """
         events = [dict(x) for x in self._aqmp.events.clear()]
         if events:
             return events
@@ -195,17 +273,33 @@ def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
         return [event] if event is not None else []
 
     def clear_events(self) -> None:
+        """Clear current list of pending events."""
         self._aqmp.events.clear()
 
     def close(self) -> None:
+        """Close the connection."""
         self._sync(
             self._aqmp.disconnect()
         )
 
     def settimeout(self, timeout: Optional[float]) -> None:
+        """
+        Set the timeout for QMP RPC execution.
+
+        This timeout affects the `cmd`, `cmd_obj`, and `command` methods.
+        The `accept`, `pull_event` and `get_event` methods have their
+        own configurable timeouts.
+
+        :param timeout:
+            timeout in seconds, or None.
+            None will wait indefinitely.
+        """
         self._timeout = timeout
 
     def send_fd_scm(self, fd: int) -> None:
+        """
+        Send a file descriptor to the remote via SCM_RIGHTS.
+        """
         self._aqmp.send_fd_scm(fd)
 
     def __del__(self) -> None:
-- 
2.31.1


