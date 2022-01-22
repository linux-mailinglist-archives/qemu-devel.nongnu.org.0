Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCB496897
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:17:34 +0100 (CET)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB461-0000Xa-Mq
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yg-0000Sh-Ov
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yc-0005C3-PJ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0v2bi/iKnBQnHBGcnKL71IR3kbZ4pUQZWZvaG0s/sbo=;
 b=Lu25/cJYs2suFCR/wIeu3g06fwfRi706pzGfzO8vi7CGk0ryRgK/VdmuTvwB3VOjEEI/Ea
 cd716MkISbqrPJVVLkh+iDHMiJotozOCMdEWSIz+P3YEpv+XXZqhmqJq2tN/dwEv6fgmZg
 03s+1hjLilWW/sHxSjDM7tvyhgSyqqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-vhHBUj1cPeyDQweJomYntw-1; Fri, 21 Jan 2022 19:09:49 -0500
X-MC-Unique: vhHBUj1cPeyDQweJomYntw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE201083F60;
 Sat, 22 Jan 2022 00:09:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B715766E1B;
 Sat, 22 Jan 2022 00:09:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] python/aqmp: copy type definitions from qmp
Date: Fri, 21 Jan 2022 19:09:20 -0500
Message-Id: <20220122000931.536322-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the remaining type definitions from QMP into the qemu.aqmp.legacy
module. Now, users that require the legacy interface don't need to
import anything else but qemu.aqmp.legacy wrapper.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
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
index c4fbe35a0e..5b4f2f0d0a 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -46,6 +46,10 @@
 _U = TypeVar('_U')
 _TaskFN = Callable[[], Awaitable[None]]  # aka ``async def func() -> None``
 
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


