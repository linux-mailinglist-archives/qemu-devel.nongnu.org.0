Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889104ECAAC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:31:20 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcAB-000190-IO
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:31:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZc7V-00063Y-Hg
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZc7T-0003Lz-Fb
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648661310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6q7OFJm4PAE8cOrBWZ6IJUVrtKYnBLPMNe5xmw5bFw=;
 b=aaNj0uCJrxbd+cygvYZgVpzaxZwIXjTEV0qOsdUbX/auUCfwzKaakfFakFQEIw8CjCO1qb
 TECDKPQSvhR6juBGDghkmCAugVRCrMNqvnxs3yuPPyxeqOeA2ItomNc1zc/mEeWtAbUfvm
 ALVTJxypoJZjV+XdIs4K21/+1jK9x8A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-uAJWdsvaOm2QKyqIKiIFgA-1; Wed, 30 Mar 2022 13:28:27 -0400
X-MC-Unique: uAJWdsvaOm2QKyqIKiIFgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71CED811E9B;
 Wed, 30 Mar 2022 17:28:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2567E40CF91D;
 Wed, 30 Mar 2022 17:28:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
Date: Wed, 30 Mar 2022 13:28:07 -0400
Message-Id: <20220330172812.3427355-5-jsnow@redhat.com>
In-Reply-To: <20220330172812.3427355-1-jsnow@redhat.com>
References: <20220330172812.3427355-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the docstrings out of qemu.qmp, adjusting them as necessary to
more accurately reflect the current state of this class.

(Licensing: This is copying and modifying GPLv2-only licensed docstrings
into a GPLv2-only file.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/aqmp/legacy.py | 98 ++++++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 8 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 10c7c99c4f0..dfcd20bbd23 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -1,7 +1,13 @@
 """
-Sync QMP Wrapper
+(Legacy) Sync QMP Wrapper
 
-This class pretends to be qemu.qmp.QEMUMonitorProtocol.
+This module provides the `QEMUMonitorProtocol` class, which is a
+synchronous wrapper around `QMPClient`.
+
+Its design closely resembles that of the original QEMUMonitorProtocol
+class, originally written by Luiz Capitulino. It is provided here for
+compatibility with scripts inside the QEMU source tree that expect the
+old interface.
 """
 
 #
@@ -50,9 +56,6 @@
 # {} is the QMPReturnValue.
 
 
-# pylint: disable=missing-docstring
-
-
 class QMPBadPortError(QMPError):
     """
     Unable to parse socket address: Port was non-numerical.
@@ -60,6 +63,17 @@ class QMPBadPortError(QMPError):
 
 
 class QEMUMonitorProtocol:
+    """
+    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP)
+    and then allow to handle commands and events.
+
+    :param address:  QEMU address, can be either a unix socket path (string)
+                     or a tuple in the form ( address, port ) for a TCP
+                     connection
+    :param server:   Act as the socket server. (See 'accept')
+    :param nickname: Optional nickname used for logging.
+    """
+
     def __init__(self, address: SocketAddrT,
                  server: bool = False,
                  nickname: Optional[str] = None):
@@ -121,6 +135,12 @@ def parse_address(cls, address: str) -> SocketAddrT:
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
 
@@ -130,6 +150,16 @@ def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
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
 
@@ -140,6 +170,12 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
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
@@ -158,9 +194,9 @@ def cmd(self, name: str,
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
@@ -170,6 +206,9 @@ def cmd(self, name: str,
         return self.cmd_obj(qmp_cmd)
 
     def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
+        """
+        Build and send a QMP command to the monitor, report errors if any
+        """
         return self._sync(
             self._aqmp.execute(cmd, kwds),
             self._timeout
@@ -177,6 +216,19 @@ def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
 
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
@@ -197,6 +249,20 @@ def pull_event(self,
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
@@ -205,17 +271,33 @@ def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
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
2.34.1


