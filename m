Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4260476224
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:50:11 +0100 (CET)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaHy-0000bE-Rb
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaA7-0004LW-Dx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxa9z-0006lv-BD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOfDKqXxhoCUTexfpJWO4hRlK2KV3C8drQlDp+KAl3E=;
 b=aWaqNll/dQohC9GC0XzBRsYZoufdY053T4rqSPfsBlpvlJ219iAT42qCZnF4MBBh+QET7E
 xVyUoAxv8LjrpYl8hTo64awhqAeBN+4M/Wy6lwbUAzBNqfEAOIywUjbxwoGGfijUihGtiU
 VQvqgrxpMQ5N6v4xGlrW+rjR7l6JoYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-AUo_XcbtNumyovdNOlG9gQ-1; Wed, 15 Dec 2021 14:41:40 -0500
X-MC-Unique: AUo_XcbtNumyovdNOlG9gQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D5418C8C00;
 Wed, 15 Dec 2021 19:41:39 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCD4D10074FD;
 Wed, 15 Dec 2021 19:41:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/25] python/aqmp: copy type definitions from qmp
Date: Wed, 15 Dec 2021 14:39:17 -0500
Message-Id: <20211215193939.3768033-4-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Copy the remaining type definitions from QMP into the qemu.aqmp.legacy
module. Now, most users don't need to import anything else but
qemu.aqmp.legacy.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py   | 22 ++++++++++++++++++++--
 python/qemu/aqmp/protocol.py | 16 ++++++++++------
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 2ccb136b02..9431fe9330 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -6,7 +6,9 @@
 
 import asyncio
 from typing import (
+    Any,
     Awaitable,
+    Dict,
     List,
     Optional,
     TypeVar,
@@ -14,13 +16,29 @@
 )
 
 import qemu.qmp
-from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
 
 from .error import AQMPError
-from .protocol import Runstate
+from .protocol import Runstate, SocketAddrT
 from .qmp_client import QMPClient
 
 
+#: QMPMessage is an entire QMP message of any kind.
+QMPMessage = Dict[str, Any]
+
+#: QMPReturnValue is the 'return' value of a command.
+QMPReturnValue = object
+
+#: QMPObject is any object in a QMP message.
+QMPObject = Dict[str, object]
+
+# QMPMessage can be outgoing commands or incoming events/returns.
+# QMPReturnValue is usually a dict/json object, but due to QAPI's
+# 'returns-whitelist', it can actually be anything.
+#
+# {'return': {}} is a QMPMessage,
+# {} is the QMPReturnValue.
+
+
 # pylint: disable=missing-docstring
 
 
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 5190b33b13..42a897e2fe 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -46,6 +46,10 @@
 _TaskFN = Callable[[], Awaitable[None]]  # aka ``async def func() -> None``
 _FutureT = TypeVar('_FutureT', bound=Optional['asyncio.Future[Any]'])
 
+InternetAddrT = Tuple[str, int]
+UnixAddrT = str
+SocketAddrT = Union[UnixAddrT, InternetAddrT]
+
 
 class Runstate(Enum):
     """Protocol session runstate."""
@@ -257,7 +261,7 @@ async def runstate_changed(self) -> Runstate:
 
     @upper_half
     @require(Runstate.IDLE)
-    async def accept(self, address: Union[str, Tuple[str, int]],
+    async def accept(self, address: SocketAddrT,
                      ssl: Optional[SSLContext] = None) -> None:
         """
         Accept a connection and begin processing message queues.
@@ -275,7 +279,7 @@ async def accept(self, address: Union[str, Tuple[str, int]],
 
     @upper_half
     @require(Runstate.IDLE)
-    async def connect(self, address: Union[str, Tuple[str, int]],
+    async def connect(self, address: SocketAddrT,
                       ssl: Optional[SSLContext] = None) -> None:
         """
         Connect to the server and begin processing message queues.
@@ -337,7 +341,7 @@ def _set_state(self, state: Runstate) -> None:
 
     @upper_half
     async def _new_session(self,
-                           address: Union[str, Tuple[str, int]],
+                           address: SocketAddrT,
                            ssl: Optional[SSLContext] = None,
                            accept: bool = False) -> None:
         """
@@ -397,7 +401,7 @@ async def _new_session(self,
     @upper_half
     async def _establish_connection(
             self,
-            address: Union[str, Tuple[str, int]],
+            address: SocketAddrT,
             ssl: Optional[SSLContext] = None,
             accept: bool = False
     ) -> None:
@@ -424,7 +428,7 @@ async def _establish_connection(
             await self._do_connect(address, ssl)
 
     @upper_half
-    async def _do_accept(self, address: Union[str, Tuple[str, int]],
+    async def _do_accept(self, address: SocketAddrT,
                          ssl: Optional[SSLContext] = None) -> None:
         """
         Acting as the transport server, accept a single connection.
@@ -482,7 +486,7 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
         self.logger.debug("Connection accepted.")
 
     @upper_half
-    async def _do_connect(self, address: Union[str, Tuple[str, int]],
+    async def _do_connect(self, address: SocketAddrT,
                           ssl: Optional[SSLContext] = None) -> None:
         """
         Acting as the transport client, initiate a connection to a server.
-- 
2.31.1


