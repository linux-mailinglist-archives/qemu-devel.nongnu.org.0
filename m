Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F085A47624D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:56:52 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaOS-0003cJ-3e
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaC4-0007MR-TU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaBy-00024Y-Gj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZwa1mX4YRq0vgVxI4TWWloUUhZpDz5osaOtoQ8t8H0=;
 b=N9Ts5cy2InMWv6zIoRu9GngHYNVL+1AJPmGnBtgMdvczbaYpWAIzsNgaemmIWVsfjOV5Y2
 BLphPJhGAA8IdklioI/ssbgsvV6fmxwJN70q9ZgL2yYGczEw4TnSN8ywrJygnpHik1wbTm
 mnawabBWww37ZOdD5FxHbnKqpyzNvSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-XTFfCmoiPeeIIZlJezV48w-1; Wed, 15 Dec 2021 14:43:47 -0500
X-MC-Unique: XTFfCmoiPeeIIZlJezV48w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04F43100C660;
 Wed, 15 Dec 2021 19:43:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA6561036D00;
 Wed, 15 Dec 2021 19:43:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/25] python: remove the old QMP package
Date: Wed, 15 Dec 2021 14:39:37 -0500
Message-Id: <20211215193939.3768033-24-jsnow@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for your service!

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
index b0b86cc4c3..ddfa9ba3f5 100644
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
index fcf74f69ea..eb5213337d 100644
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
index 5bfb82535f..0000000000
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
index 4e08641154..0000000000
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
index e69de29bb2..0000000000
diff --git a/python/setup.cfg b/python/setup.cfg
index 510df23698..5140a5b322 100644
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
2.31.1


