Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8AD50A44E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:34:00 +0200 (CEST)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYoh-00015m-OJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXd-0003pE-Hf
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXW-0005pG-1L
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTGdixfWR1PNir2LvH7KJ8M3T7qE7uzhgvv2MYlhnZs=;
 b=ibmCvq61Cbv2G5R0sNJwZjL90b+dHfcYcr1/KAArAOcXiK55SBWRBHrLn2HNo5KyRoq93+
 TbFBeHSKjzwIgukGcb0BzRyKvgNMGX6rKbS/e3LuLbCFOyebMIyiIy60kI/FW4yI1nI4AB
 N97XxiFbT3sk+BJwYf/vuxcYyuATZsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-DnE2N4eFOXSxnDfAi8t4hA-1; Thu, 21 Apr 2022 11:16:09 -0400
X-MC-Unique: DnE2N4eFOXSxnDfAi8t4hA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C41E1815CFA;
 Thu, 21 Apr 2022 15:16:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2015040D016A;
 Thu, 21 Apr 2022 15:16:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] python: remove the old QMP package
Date: Thu, 21 Apr 2022 11:15:56 -0400
Message-Id: <20220421151600.984189-14-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for your service!

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-id: 20220330172812.3427355-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/PACKAGE.rst          |   4 +-
 python/README.rst           |   2 +-
 python/qemu/qmp/README.rst  |   9 -
 python/qemu/qmp/__init__.py | 396 ------------------------------------
 python/qemu/qmp/py.typed    |   0
 python/setup.cfg            |   3 +-
 6 files changed, 4 insertions(+), 410 deletions(-)
 delete mode 100644 python/qemu/qmp/README.rst
 delete mode 100644 python/qemu/qmp/__init__.py
 delete mode 100644 python/qemu/qmp/py.typed

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
index b0b86cc4c31..ddfa9ba3f59 100644
--- a/python/PACKAGE.rst
+++ b/python/PACKAGE.rst
@@ -8,11 +8,11 @@ to change at any time.
 Usage
 -----
 
-The ``qemu.qmp`` subpackage provides a library for communicating with
+The ``qemu.aqmp`` subpackage provides a library for communicating with
 QMP servers. The ``qemu.machine`` subpackage offers rudimentary
 facilities for launching and managing QEMU processes. Refer to each
 package's documentation
-(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
+(``>>> help(qemu.aqmp)``, ``>>> help(qemu.machine)``)
 for more information.
 
 Contributing
diff --git a/python/README.rst b/python/README.rst
index fcf74f69eae..eb5213337d2 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -3,7 +3,7 @@ QEMU Python Tooling
 
 This directory houses Python tooling used by the QEMU project to build,
 configure, and test QEMU. It is organized by namespace (``qemu``), and
-then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
+then by package (e.g. ``qemu/machine``, ``qemu/aqmp``, etc).
 
 ``setup.py`` is used by ``pip`` to install this tooling to the current
 environment. ``setup.cfg`` provides the packaging configuration used by
diff --git a/python/qemu/qmp/README.rst b/python/qemu/qmp/README.rst
deleted file mode 100644
index 5bfb82535f8..00000000000
--- a/python/qemu/qmp/README.rst
+++ /dev/null
@@ -1,9 +0,0 @@
-qemu.qmp package
-================
-
-This package provides a library used for connecting to and communicating
-with QMP servers. It is used extensively by iotests, vm tests,
-avocado tests, and other utilities in the ./scripts directory. It is
-not a fully-fledged SDK and is subject to change at any time.
-
-See the documentation in ``__init__.py`` for more information.
diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
deleted file mode 100644
index 4e086411544..00000000000
--- a/python/qemu/qmp/__init__.py
+++ /dev/null
@@ -1,396 +0,0 @@
-"""
-QEMU Monitor Protocol (QMP) development library & tooling.
-
-This package provides a fairly low-level class for communicating to QMP
-protocol servers, as implemented by QEMU, the QEMU Guest Agent, and the
-QEMU Storage Daemon. This library is not intended for production use.
-
-`QEMUMonitorProtocol` is the primary class of interest, and all errors
-raised derive from `QMPError`.
-"""
-
-# Copyright (C) 2009, 2010 Red Hat Inc.
-#
-# Authors:
-#  Luiz Capitulino <lcapitulino@redhat.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
-
-import errno
-import json
-import logging
-import socket
-import struct
-from types import TracebackType
-from typing import (
-    Any,
-    Dict,
-    List,
-    Optional,
-    TextIO,
-    Tuple,
-    Type,
-    TypeVar,
-    Union,
-    cast,
-)
-
-
-#: QMPMessage is an entire QMP message of any kind.
-QMPMessage = Dict[str, Any]
-
-#: QMPReturnValue is the 'return' value of a command.
-QMPReturnValue = object
-
-#: QMPObject is any object in a QMP message.
-QMPObject = Dict[str, object]
-
-# QMPMessage can be outgoing commands or incoming events/returns.
-# QMPReturnValue is usually a dict/json object, but due to QAPI's
-# 'returns-whitelist', it can actually be anything.
-#
-# {'return': {}} is a QMPMessage,
-# {} is the QMPReturnValue.
-
-
-InternetAddrT = Tuple[str, int]
-UnixAddrT = str
-SocketAddrT = Union[InternetAddrT, UnixAddrT]
-
-
-class QMPError(Exception):
-    """
-    QMP base exception
-    """
-
-
-class QMPConnectError(QMPError):
-    """
-    QMP connection exception
-    """
-
-
-class QMPCapabilitiesError(QMPError):
-    """
-    QMP negotiate capabilities exception
-    """
-
-
-class QMPTimeoutError(QMPError):
-    """
-    QMP timeout exception
-    """
-
-
-class QMPProtocolError(QMPError):
-    """
-    QMP protocol error; unexpected response
-    """
-
-
-class QMPResponseError(QMPError):
-    """
-    Represents erroneous QMP monitor reply
-    """
-    def __init__(self, reply: QMPMessage):
-        try:
-            desc = reply['error']['desc']
-        except KeyError:
-            desc = reply
-        super().__init__(desc)
-        self.reply = reply
-
-
-class QEMUMonitorProtocol:
-    """
-    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and then
-    allow to handle commands and events.
-    """
-
-    #: Logger object for debugging messages
-    logger = logging.getLogger('QMP')
-
-    def __init__(self, address: SocketAddrT,
-                 server: bool = False,
-                 nickname: Optional[str] = None):
-        """
-        Create a QEMUMonitorProtocol class.
-
-        @param address: QEMU address, can be either a unix socket path (string)
-                        or a tuple in the form ( address, port ) for a TCP
-                        connection
-        @param server: server mode listens on the socket (bool)
-        @raise OSError on socket connection errors
-        @note No connection is established, this is done by the connect() or
-              accept() methods
-        """
-        self.__events: List[QMPMessage] = []
-        self.__address = address
-        self.__sock = self.__get_sock()
-        self.__sockfile: Optional[TextIO] = None
-        self._nickname = nickname
-        if self._nickname:
-            self.logger = logging.getLogger('QMP').getChild(self._nickname)
-        if server:
-            self.__sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
-            self.__sock.bind(self.__address)
-            self.__sock.listen(1)
-
-    def __get_sock(self) -> socket.socket:
-        if isinstance(self.__address, tuple):
-            family = socket.AF_INET
-        else:
-            family = socket.AF_UNIX
-        return socket.socket(family, socket.SOCK_STREAM)
-
-    def __negotiate_capabilities(self) -> QMPMessage:
-        greeting = self.__json_read()
-        if greeting is None or "QMP" not in greeting:
-            raise QMPConnectError
-        # Greeting seems ok, negotiate capabilities
-        resp = self.cmd('qmp_capabilities')
-        if resp and "return" in resp:
-            return greeting
-        raise QMPCapabilitiesError
-
-    def __json_read(self, only_event: bool = False) -> Optional[QMPMessage]:
-        assert self.__sockfile is not None
-        while True:
-            data = self.__sockfile.readline()
-            if not data:
-                return None
-            # By definition, any JSON received from QMP is a QMPMessage,
-            # and we are asserting only at static analysis time that it
-            # has a particular shape.
-            resp: QMPMessage = json.loads(data)
-            if 'event' in resp:
-                self.logger.debug("<<< %s", resp)
-                self.__events.append(resp)
-                if not only_event:
-                    continue
-            return resp
-
-    def __get_events(self, wait: Union[bool, float] = False) -> None:
-        """
-        Check for new events in the stream and cache them in __events.
-
-        @param wait (bool): block until an event is available.
-        @param wait (float): If wait is a float, treat it as a timeout value.
-
-        @raise QMPTimeoutError: If a timeout float is provided and the timeout
-                                period elapses.
-        @raise QMPConnectError: If wait is True but no events could be
-                                retrieved or if some other error occurred.
-        """
-
-        # Current timeout and blocking status
-        current_timeout = self.__sock.gettimeout()
-
-        # Check for new events regardless and pull them into the cache:
-        self.__sock.settimeout(0)  # i.e. setblocking(False)
-        try:
-            self.__json_read()
-        except OSError as err:
-            # EAGAIN: No data available; not critical
-            if err.errno != errno.EAGAIN:
-                raise
-        finally:
-            self.__sock.settimeout(current_timeout)
-
-        # Wait for new events, if needed.
-        # if wait is 0.0, this means "no wait" and is also implicitly false.
-        if not self.__events and wait:
-            if isinstance(wait, float):
-                self.__sock.settimeout(wait)
-            try:
-                ret = self.__json_read(only_event=True)
-            except socket.timeout as err:
-                raise QMPTimeoutError("Timeout waiting for event") from err
-            except Exception as err:
-                msg = "Error while reading from socket"
-                raise QMPConnectError(msg) from err
-            finally:
-                self.__sock.settimeout(current_timeout)
-
-            if ret is None:
-                raise QMPConnectError("Error while reading from socket")
-
-    T = TypeVar('T')
-
-    def __enter__(self: T) -> T:
-        # Implement context manager enter function.
-        return self
-
-    def __exit__(self,
-                 # pylint: disable=duplicate-code
-                 # see https://github.com/PyCQA/pylint/issues/3619
-                 exc_type: Optional[Type[BaseException]],
-                 exc_val: Optional[BaseException],
-                 exc_tb: Optional[TracebackType]) -> None:
-        # Implement context manager exit function.
-        self.close()
-
-    def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
-        """
-        Connect to the QMP Monitor and perform capabilities negotiation.
-
-        @return QMP greeting dict, or None if negotiate is false
-        @raise OSError on socket connection errors
-        @raise QMPConnectError if the greeting is not received
-        @raise QMPCapabilitiesError if fails to negotiate capabilities
-        """
-        self.__sock.connect(self.__address)
-        self.__sockfile = self.__sock.makefile(mode='r')
-        if negotiate:
-            return self.__negotiate_capabilities()
-        return None
-
-    def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
-        """
-        Await connection from QMP Monitor and perform capabilities negotiation.
-
-        @param timeout: timeout in seconds (nonnegative float number, or
-                        None). The value passed will set the behavior of the
-                        underneath QMP socket as described in [1].
-                        Default value is set to 15.0.
-
-        @return QMP greeting dict
-        @raise OSError on socket connection errors
-        @raise QMPConnectError if the greeting is not received
-        @raise QMPCapabilitiesError if fails to negotiate capabilities
-
-        [1]
-        https://docs.python.org/3/library/socket.html#socket.socket.settimeout
-        """
-        self.__sock.settimeout(timeout)
-        self.__sock, _ = self.__sock.accept()
-        self.__sockfile = self.__sock.makefile(mode='r')
-        return self.__negotiate_capabilities()
-
-    def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
-        """
-        Send a QMP command to the QMP Monitor.
-
-        @param qmp_cmd: QMP command to be sent as a Python dict
-        @return QMP response as a Python dict
-        """
-        self.logger.debug(">>> %s", qmp_cmd)
-        self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
-        resp = self.__json_read()
-        if resp is None:
-            raise QMPConnectError("Unexpected empty reply from server")
-        self.logger.debug("<<< %s", resp)
-        return resp
-
-    def cmd(self, name: str,
-            args: Optional[Dict[str, object]] = None,
-            cmd_id: Optional[object] = None) -> QMPMessage:
-        """
-        Build a QMP command and send it to the QMP Monitor.
-
-        @param name: command name (string)
-        @param args: command arguments (dict)
-        @param cmd_id: command id (dict, list, string or int)
-        """
-        qmp_cmd: QMPMessage = {'execute': name}
-        if args:
-            qmp_cmd['arguments'] = args
-        if cmd_id:
-            qmp_cmd['id'] = cmd_id
-        return self.cmd_obj(qmp_cmd)
-
-    def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
-        """
-        Build and send a QMP command to the monitor, report errors if any
-        """
-        ret = self.cmd(cmd, kwds)
-        if 'error' in ret:
-            raise QMPResponseError(ret)
-        if 'return' not in ret:
-            raise QMPProtocolError(
-                "'return' key not found in QMP response '{}'".format(str(ret))
-            )
-        return cast(QMPReturnValue, ret['return'])
-
-    def pull_event(self,
-                   wait: Union[bool, float] = False) -> Optional[QMPMessage]:
-        """
-        Pulls a single event.
-
-        @param wait (bool): block until an event is available.
-        @param wait (float): If wait is a float, treat it as a timeout value.
-
-        @raise QMPTimeoutError: If a timeout float is provided and the timeout
-                                period elapses.
-        @raise QMPConnectError: If wait is True but no events could be
-                                retrieved or if some other error occurred.
-
-        @return The first available QMP event, or None.
-        """
-        self.__get_events(wait)
-
-        if self.__events:
-            return self.__events.pop(0)
-        return None
-
-    def get_events(self, wait: bool = False) -> List[QMPMessage]:
-        """
-        Get a list of available QMP events and clear all pending events.
-
-        @param wait (bool): block until an event is available.
-        @param wait (float): If wait is a float, treat it as a timeout value.
-
-        @raise QMPTimeoutError: If a timeout float is provided and the timeout
-                                period elapses.
-        @raise QMPConnectError: If wait is True but no events could be
-                                retrieved or if some other error occurred.
-
-        @return The list of available QMP events.
-        """
-        self.__get_events(wait)
-        events = self.__events
-        self.__events = []
-        return events
-
-    def clear_events(self) -> None:
-        """
-        Clear current list of pending events.
-        """
-        self.__events = []
-
-    def close(self) -> None:
-        """
-        Close the socket and socket file.
-        """
-        if self.__sock:
-            self.__sock.close()
-        if self.__sockfile:
-            self.__sockfile.close()
-
-    def settimeout(self, timeout: Optional[float]) -> None:
-        """
-        Set the socket timeout.
-
-        @param timeout (float): timeout in seconds (non-zero), or None.
-        @note This is a wrap around socket.settimeout
-
-        @raise ValueError: if timeout was set to 0.
-        """
-        if timeout == 0:
-            msg = "timeout cannot be 0; this engages non-blocking mode."
-            msg += " Use 'None' instead to disable timeouts."
-            raise ValueError(msg)
-        self.__sock.settimeout(timeout)
-
-    def send_fd_scm(self, fd: int) -> None:
-        """
-        Send a file descriptor to the remote via SCM_RIGHTS.
-        """
-        if self.__sock.family != socket.AF_UNIX:
-            raise RuntimeError("Can't use SCM_RIGHTS on non-AF_UNIX socket.")
-
-        self.__sock.sendmsg(
-            [b' '],
-            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
-        )
diff --git a/python/qemu/qmp/py.typed b/python/qemu/qmp/py.typed
deleted file mode 100644
index e69de29bb2d..00000000000
diff --git a/python/setup.cfg b/python/setup.cfg
index cdeced44d2b..4340c29a24f 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -24,10 +24,9 @@ classifiers =
 [options]
 python_requires = >= 3.6
 packages =
-    qemu.qmp
+    qemu.aqmp
     qemu.machine
     qemu.utils
-    qemu.aqmp
 
 [options.package_data]
 * = py.typed
-- 
2.34.1


