Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822814968A0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:20:34 +0100 (CET)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB48v-0006Fs-J2
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:20:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yg-0000Sm-P8
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yc-0005Bn-Gh
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdOJhruuN6fxTvu1NBxHScn9EgEMDzEHDJPjcPkDgIc=;
 b=Fgq2Q+0nMuCV9hrJtQh2mEFykxQfDDxGtu9MPevbaG1J+a/ei9hw8d/nUMxEZG8JeGawVP
 FKgYZ5ZRGzR8rlig9oQf803o/ZcXZ0BcwbYBGrlwoG7jwGsj6HHrSZZsbpJLqfYatJJc5K
 EszeQGN0WStxrCe8PNv0sM9GztvUB58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-W0f7IIq9PuufoNjgvnaq5w-1; Fri, 21 Jan 2022 19:09:50 -0500
X-MC-Unique: W0f7IIq9PuufoNjgvnaq5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA67D2F49;
 Sat, 22 Jan 2022 00:09:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6D2266E1B;
 Sat, 22 Jan 2022 00:09:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] python/aqmp: rename AQMPError to QMPError
Date: Fri, 21 Jan 2022 19:09:22 -0500
Message-Id: <20220122000931.536322-9-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is in preparation for renaming qemu.aqmp to qemu.qmp. I should have
done this from this from the very beginning, but it's a convenient time
to make sure this churn is taken care of.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/qemu/aqmp/__init__.py   |  6 +++---
 python/qemu/aqmp/error.py      | 12 ++++++------
 python/qemu/aqmp/events.py     |  4 ++--
 python/qemu/aqmp/legacy.py     |  4 ++--
 python/qemu/aqmp/protocol.py   |  8 ++++----
 python/qemu/aqmp/qmp_client.py |  8 ++++----
 6 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 05f467c141..4c22c38079 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -6,7 +6,7 @@
 QEMU Guest Agent, and the QEMU Storage Daemon.
 
 `QMPClient` provides the main functionality of this package. All errors
-raised by this library derive from `AQMPError`, see `aqmp.error` for
+raised by this library derive from `QMPError`, see `aqmp.error` for
 additional detail. See `aqmp.events` for an in-depth tutorial on
 managing QMP events.
 """
@@ -23,7 +23,7 @@
 
 import logging
 
-from .error import AQMPError
+from .error import QMPError
 from .events import EventListener
 from .message import Message
 from .protocol import (
@@ -48,7 +48,7 @@
     'Runstate',
 
     # Exceptions, most generic to most explicit
-    'AQMPError',
+    'QMPError',
     'StateError',
     'ConnectError',
     'ExecuteError',
diff --git a/python/qemu/aqmp/error.py b/python/qemu/aqmp/error.py
index 781f49b008..24ba4d5054 100644
--- a/python/qemu/aqmp/error.py
+++ b/python/qemu/aqmp/error.py
@@ -1,21 +1,21 @@
 """
-AQMP Error Classes
+QMP Error Classes
 
 This package seeks to provide semantic error classes that are intended
 to be used directly by clients when they would like to handle particular
 semantic failures (e.g. "failed to connect") without needing to know the
 enumeration of possible reasons for that failure.
 
-AQMPError serves as the ancestor for all exceptions raised by this
+QMPError serves as the ancestor for all exceptions raised by this
 package, and is suitable for use in handling semantic errors from this
 library. In most cases, individual public methods will attempt to catch
 and re-encapsulate various exceptions to provide a semantic
 error-handling interface.
 
-.. admonition:: AQMP Exception Hierarchy Reference
+.. admonition:: QMP Exception Hierarchy Reference
 
  |   `Exception`
- |    +-- `AQMPError`
+ |    +-- `QMPError`
  |         +-- `ConnectError`
  |         +-- `StateError`
  |         +-- `ExecInterruptedError`
@@ -31,11 +31,11 @@
 """
 
 
-class AQMPError(Exception):
+class QMPError(Exception):
     """Abstract error class for all errors originating from this package."""
 
 
-class ProtocolError(AQMPError):
+class ProtocolError(QMPError):
     """
     Abstract error class for protocol failures.
 
diff --git a/python/qemu/aqmp/events.py b/python/qemu/aqmp/events.py
index 5f7150c78d..f3d4e2b5e8 100644
--- a/python/qemu/aqmp/events.py
+++ b/python/qemu/aqmp/events.py
@@ -443,7 +443,7 @@ def accept(self, event) -> bool:
     Union,
 )
 
-from .error import AQMPError
+from .error import QMPError
 from .message import Message
 
 
@@ -451,7 +451,7 @@ def accept(self, event) -> bool:
 EventFilter = Callable[[Message], bool]
 
 
-class ListenerError(AQMPError):
+class ListenerError(QMPError):
     """
     Generic error class for `EventListener`-related problems.
     """
diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 9431fe9330..27df22818a 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -17,7 +17,7 @@
 
 import qemu.qmp
 
-from .error import AQMPError
+from .error import QMPError
 from .protocol import Runstate, SocketAddrT
 from .qmp_client import QMPClient
 
@@ -168,7 +168,7 @@ def __del__(self) -> None:
             # Nothing we can do about it now, but if we don't raise our
             # own error, the user will be treated to a lot of traceback
             # they might not understand.
-            raise AQMPError(
+            raise QMPError(
                 "QEMUMonitorProtocol.close()"
                 " was not called before object was garbage collected"
             )
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 5b4f2f0d0a..50e973c2f2 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -29,7 +29,7 @@
     cast,
 )
 
-from .error import AQMPError
+from .error import QMPError
 from .util import (
     bottom_half,
     create_task,
@@ -65,7 +65,7 @@ class Runstate(Enum):
     DISCONNECTING = 3
 
 
-class ConnectError(AQMPError):
+class ConnectError(QMPError):
     """
     Raised when the initial connection process has failed.
 
@@ -90,7 +90,7 @@ def __str__(self) -> str:
         return f"{self.error_message}: {cause}"
 
 
-class StateError(AQMPError):
+class StateError(QMPError):
     """
     An API command (connect, execute, etc) was issued at an inappropriate time.
 
@@ -363,7 +363,7 @@ async def _new_session(self,
             This exception will wrap a more concrete one. In most cases,
             the wrapped exception will be `OSError` or `EOFError`. If a
             protocol-level failure occurs while establishing a new
-            session, the wrapped error may also be an `AQMPError`.
+            session, the wrapped error may also be an `QMPError`.
         """
         assert self.runstate == Runstate.IDLE
 
diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index 6a985ffe30..f1a845cc82 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -20,7 +20,7 @@
     cast,
 )
 
-from .error import AQMPError, ProtocolError
+from .error import ProtocolError, QMPError
 from .events import Events
 from .message import Message
 from .models import ErrorResponse, Greeting
@@ -66,7 +66,7 @@ class NegotiationError(_WrappedProtocolError):
     """
 
 
-class ExecuteError(AQMPError):
+class ExecuteError(QMPError):
     """
     Exception raised by `QMPClient.execute()` on RPC failure.
 
@@ -87,7 +87,7 @@ def __init__(self, error_response: ErrorResponse,
         self.error_class: str = error_response.error.class_
 
 
-class ExecInterruptedError(AQMPError):
+class ExecInterruptedError(QMPError):
     """
     Exception raised by `execute()` (et al) when an RPC is interrupted.
 
@@ -641,7 +641,7 @@ def send_fd_scm(self, fd: int) -> None:
         sock = self._writer.transport.get_extra_info('socket')
 
         if sock.family != socket.AF_UNIX:
-            raise AQMPError("Sending file descriptors requires a UNIX socket.")
+            raise QMPError("Sending file descriptors requires a UNIX socket.")
 
         if not hasattr(sock, 'sendmsg'):
             # We need to void the warranty sticker.
-- 
2.31.1


