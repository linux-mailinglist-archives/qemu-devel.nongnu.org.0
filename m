Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99843154DD4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:21:50 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izoar-0008Om-Jm
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoZ8-0006X7-4y
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoZ6-0008S1-O2
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:02 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41074
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoZ6-0008Nw-JX
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HsZqZAAxuacUr1PKSBiegihy6z8eAmpj917iCo77kY=;
 b=c5/ox/lnFmCQCchNTy70UJRGbXOfT1vSoClH9VLjqhj488HheXJGDdLH4qHXDeZKSQ9QpK
 ZDfAaAH/oH9jRKz+zy+AC24pObL3m+iPiCzQ4rTQkBoW20xpBc0KxsLdJ5ZA1L5S1rty0m
 rYlIxvgnRjZBiCHMHMSHdSVXBa6XPXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-7cIwW1M_OO6vueBkC_f-Yg-1; Thu, 06 Feb 2020 16:19:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50D7F189F760
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 21:19:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 095EB60BEC;
 Thu,  6 Feb 2020 21:19:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/46] python/qemu: Delint the qmp module
Date: Thu,  6 Feb 2020 22:18:52 +0100
Message-Id: <20200206211936.17098-3-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 7cIwW1M_OO6vueBkC_f-Yg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

This clean up the pylint-3 report on qmp:

************* Module qemu.qmp
python/qemu/qmp.py:1:0: C0111: Missing module docstring (missing-docstring)
python/qemu/qmp.py:17:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:21:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:25:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:29:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:33:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:33:0: R0205: Class 'QEMUMonitorProtocol' inherits from o=
bject, can be safely removed from bases in python3 (useless-object-inherita=
nce)
python/qemu/qmp.py:80:4: R1710: Either all return statements in a function =
should return an expression, or none of them should. (inconsistent-return-s=
tatements)
python/qemu/qmp.py:131:4: R1710: Either all return statements in a function=
 should return an expression, or none of them should. (inconsistent-return-=
statements)
python/qemu/qmp.py:159:4: R1710: Either all return statements in a function=
 should return an expression, or none of them should. (inconsistent-return-=
statements)
python/qemu/qmp.py:245:4: C0111: Missing method docstring (missing-docstrin=
g)
python/qemu/qmp.py:249:4: C0111: Missing method docstring (missing-docstrin=
g)
python/qemu/qmp.py:252:4: C0111: Missing method docstring (missing-docstrin=
g)
python/qemu/qmp.py:255:4: C0111: Missing method docstring (missing-docstrin=
g)

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20191227134101.244496-3-wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 python/qemu/qmp.py | 51 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 8c6c9847d0..f4e04a6683 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -1,5 +1,4 @@
-# QEMU Monitor Protocol Python class
-#
+""" QEMU Monitor Protocol Python class """
 # Copyright (C) 2009, 2010 Red Hat Inc.
 #
 # Authors:
@@ -15,22 +14,34 @@ import logging
=20
=20
 class QMPError(Exception):
-    pass
+    """
+    QMP base exception
+    """
=20
=20
 class QMPConnectError(QMPError):
-    pass
+    """
+    QMP connection exception
+    """
=20
=20
 class QMPCapabilitiesError(QMPError):
-    pass
+    """
+    QMP negotiate capabilities exception
+    """
=20
=20
 class QMPTimeoutError(QMPError):
-    pass
+    """
+    QMP timeout exception
+    """
=20
=20
-class QEMUMonitorProtocol(object):
+class QEMUMonitorProtocol:
+    """
+    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and =
then
+    allow to handle commands and events.
+    """
=20
     #: Logger object for debugging messages
     logger =3D logging.getLogger('QMP')
@@ -81,7 +92,7 @@ class QEMUMonitorProtocol(object):
         while True:
             data =3D self.__sockfile.readline()
             if not data:
-                return
+                return None
             resp =3D json.loads(data)
             if 'event' in resp:
                 self.logger.debug("<<< %s", resp)
@@ -132,7 +143,7 @@ class QEMUMonitorProtocol(object):
         """
         Connect to the QMP Monitor and perform capabilities negotiation.
=20
-        @return QMP greeting dict
+        @return QMP greeting dict, or None if negotiate is false
         @raise OSError on socket connection errors
         @raise QMPConnectError if the greeting is not received
         @raise QMPCapabilitiesError if fails to negotiate capabilities
@@ -141,6 +152,7 @@ class QEMUMonitorProtocol(object):
         self.__sockfile =3D self.__sock.makefile()
         if negotiate:
             return self.__negotiate_capabilities()
+        return None
=20
     def accept(self):
         """
@@ -169,7 +181,7 @@ class QEMUMonitorProtocol(object):
             self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
         except OSError as err:
             if err.errno =3D=3D errno.EPIPE:
-                return
+                return None
             raise err
         resp =3D self.__json_read()
         self.logger.debug("<<< %s", resp)
@@ -243,14 +255,33 @@ class QEMUMonitorProtocol(object):
         self.__events =3D []
=20
     def close(self):
+        """
+        Close the socket and socket file.
+        """
         self.__sock.close()
         self.__sockfile.close()
=20
     def settimeout(self, timeout):
+        """
+        Set the socket timeout.
+
+        @param timeout (float): timeout in seconds, or None.
+        @note This is a wrap around socket.settimeout
+        """
         self.__sock.settimeout(timeout)
=20
     def get_sock_fd(self):
+        """
+        Get the socket file descriptor.
+
+        @return The file descriptor number.
+        """
         return self.__sock.fileno()
=20
     def is_scm_available(self):
+        """
+        Check if the socket allows for SCM_RIGHTS.
+
+        @return True if SCM_RIGHTS is available, otherwise False.
+        """
         return self.__sock.family =3D=3D socket.AF_UNIX
--=20
2.21.1


