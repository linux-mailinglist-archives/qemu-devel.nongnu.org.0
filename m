Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BE31D0C3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:14:28 +0100 (CET)
Received: from localhost ([::1]:40810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5nl-0004UE-AL
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kE-0002fC-BI
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kB-0004PN-L5
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7f3cF9FLPLfOmolQQ3RotNpTPiBGv5wPzbwCXGPIZOw=;
 b=C/UPRc3wxYtcAYKN2HGlerv7VQDx9Janiui8IrVY7FMFA6cRUoLF59OLG8QWy/+5KtgRs5
 Z9LxPqF5n2PDbcWDt5jrQFlQzzUb0D1weOOCLnuDU0A/EJRdzZds+RAaF+Z+KLKettWnqr
 a+kV+mX3iSZ7RoRAYALtfa5vTV+gWJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-rvVesU8NPb6xYR__JriovA-1; Tue, 16 Feb 2021 14:10:38 -0500
X-MC-Unique: rvVesU8NPb6xYR__JriovA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A4FCC287;
 Tue, 16 Feb 2021 19:10:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC485C1B4;
 Tue, 16 Feb 2021 19:10:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] qemu-options: update to show preferred boolean syntax
 for -chardev
Date: Tue, 16 Feb 2021 19:10:19 +0000
Message-Id: <20210216191027.595031-3-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 78 ++++++++++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 6c34c7050f..972ef412cc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3032,13 +3032,13 @@ DEFHEADING(Character device options:)
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
     "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4][,ipv6][,nodelay][,reconnect=seconds]\n"
-    "         [,server][,nowait][,telnet][,websocket][,reconnect=seconds][,mux=on|off]\n"
+    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,delay=on|off][,reconnect=seconds]\n"
+    "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
-    "-chardev socket,id=id,path=path[,server][,nowait][,telnet][,websocket][,reconnect=seconds]\n"
+    "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
-    "         [,localport=localport][,ipv4][,ipv6][,mux=on|off]\n"
+    "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off]\n"
     "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
@@ -3148,21 +3148,21 @@ The available backends are:
     A void device. This device will not emit any data, and will drop any
     data it receives. The null backend does not take any options.
 
-``-chardev socket,id=id[,TCP options or unix options][,server][,nowait][,telnet][,websocket][,reconnect=seconds][,tls-creds=id][,tls-authz=id]``
+``-chardev socket,id=id[,TCP options or unix options][,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,tls-creds=id][,tls-authz=id]``
     Create a two-way stream socket, which can be either a TCP or a unix
     socket. A unix socket will be created if ``path`` is specified.
     Behaviour is undefined if TCP options are specified for a unix
     socket.
 
-    ``server`` specifies that the socket shall be a listening socket.
+    ``server=on|off`` specifies that the socket shall be a listening socket.
 
-    ``nowait`` specifies that QEMU should not block waiting for a client
+    ``wait=on|off`` specifies that QEMU should not block waiting for a client
     to connect to a listening socket.
 
-    ``telnet`` specifies that traffic on the socket should interpret
+    ``telnet=on|off`` specifies that traffic on the socket should interpret
     telnet escape sequences.
 
-    ``websocket`` specifies that the socket uses WebSocket protocol for
+    ``websocket=on|off`` specifies that the socket uses WebSocket protocol for
     communication.
 
     ``reconnect`` sets the timeout for reconnecting on non-server
@@ -3183,7 +3183,7 @@ The available backends are:
 
     TCP and unix socket options are given below:
 
-    ``TCP options: port=port[,host=host][,to=to][,ipv4][,ipv6][,nodelay]``
+    ``TCP options: port=port[,host=host][,to=to][,ipv4=on|off][,ipv6=on|off][,delay=on|off]``
         ``host`` for a listening socket specifies the local address to
         be bound. For a connecting socket species the remote host to
         connect to. ``host`` is optional for listening sockets. If not
@@ -3199,21 +3199,21 @@ The available backends are:
         bind to subsequent ports up to and including ``to`` until it
         succeeds. ``to`` must be specified as a port number.
 
-        ``ipv4`` and ``ipv6`` specify that either IPv4 or IPv6 must be
-        used. If neither is specified the socket may use either
-        protocol.
+        ``ipv4=on|off`` and ``ipv6=on|off`` specify that either IPv4
+        or IPv6 must be used. If neither is specified the socket may
+        use either protocol.
 
-        ``nodelay`` disables the Nagle algorithm.
+        ``delay=on|off`` disables the Nagle algorithm.
 
     ``unix options: path=path[,abstract=on|off][,tight=on|off]``
         ``path`` specifies the local path of the unix socket. ``path``
         is required.
-        ``abstract`` specifies the use of the abstract socket namespace,
+        ``abstract=on|off`` specifies the use of the abstract socket namespace,
         rather than the filesystem.  Optional, defaults to false.
-        ``tight`` sets the socket length of abstract sockets to their minimum,
+        ``tight=on|off`` sets the socket length of abstract sockets to their minimum,
         rather than the full sun_path length.  Optional, defaults to true.
 
-``-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr][,localport=localport][,ipv4][,ipv6]``
+``-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr][,localport=localport][,ipv4=on|off][,ipv6=on|off]``
     Sends all traffic from the guest to a remote host over UDP.
 
     ``host`` specifies the remote host to connect to. If not specified
@@ -3228,7 +3228,7 @@ The available backends are:
     ``localport`` specifies the local port to bind to. If not specified
     any available local port will be used.
 
-    ``ipv4`` and ``ipv6`` specify that either IPv4 or IPv6 must be used.
+    ``ipv4=on|off`` and ``ipv6=on|off`` specify that either IPv4 or IPv6 must be used.
     If neither is specified the device may use either protocol.
 
 ``-chardev msmouse,id=id``
@@ -3592,30 +3592,30 @@ SRST
         ``telnet options:``
             localhost 5555
 
-    ``tcp:[host]:port[,server][,nowait][,nodelay][,reconnect=seconds]``
+    ``tcp:[host]:port[,server=on|off][,wait=on|off][,delay=on|off][,reconnect=seconds]``
         The TCP Net Console has two modes of operation. It can send the
         serial I/O to a location or wait for a connection from a
         location. By default the TCP Net Console is sent to host at the
-        port. If you use the server option QEMU will wait for a client
+        port. If you use the ``server=on`` option QEMU will wait for a client
         socket application to connect to the port before continuing,
-        unless the ``nowait`` option was specified. The ``nodelay``
-        option disables the Nagle buffering algorithm. The ``reconnect``
-        option only applies if noserver is set, if the connection goes
+        unless the ``wait=on|off`` option was specified. The ``delay=on|off``
+        option disables the Nagle buffering algorithm. The ``reconnect=on``
+        option only applies if ``server=no`` is set, if the connection goes
         down it will attempt to reconnect at the given interval. If host
         is omitted, 0.0.0.0 is assumed. Only one TCP connection at a
-        time is accepted. You can use ``telnet`` to connect to the
+        time is accepted. You can use ``telnet=on`` to connect to the
         corresponding character device.
 
         ``Example to send tcp console to 192.168.0.2 port 4444``
             -serial tcp:192.168.0.2:4444
 
         ``Example to listen and wait on port 4444 for connection``
-            -serial tcp::4444,server
+            -serial tcp::4444,server=on
 
         ``Example to not wait and listen on ip 192.168.0.100 port 4444``
-            -serial tcp:192.168.0.100:4444,server,nowait
+            -serial tcp:192.168.0.100:4444,server=on,wait=off
 
-    ``telnet:host:port[,server][,nowait][,nodelay]``
+    ``telnet:host:port[,server=on|off][,wait=on|off][,delay=on|off]``
         The telnet protocol is used instead of raw tcp sockets. The
         options work the same as if you had specified ``-serial tcp``.
         The difference is that the port acts like a telnet server or
@@ -3625,11 +3625,11 @@ SRST
         you do it with Control-] and then type "send break" followed by
         pressing the enter key.
 
-    ``websocket:host:port,server[,nowait][,nodelay]``
+    ``websocket:host:port,server=on[,wait=on|off][,delay=on|off]``
         The WebSocket protocol is used instead of raw tcp socket. The
         port acts as a WebSocket server. Client mode is not supported.
 
-    ``unix:path[,server][,nowait][,reconnect=seconds]``
+    ``unix:path[,server=on|off][,wait=on|off][,reconnect=seconds]``
         A unix domain socket is used instead of a tcp socket. The option
         works the same as if you had specified ``-serial tcp`` except
         the unix domain socket path is used for connections.
@@ -3642,7 +3642,7 @@ SRST
         multiplex the monitor onto a telnet server listening on port
         4444 would be:
 
-        ``-serial mon:telnet::4444,server,nowait``
+        ``-serial mon:telnet::4444,server=on,wait=off``
 
         When the monitor is multiplexed to stdio in this way, Ctrl+C
         will not terminate QEMU any more but will be passed to the guest
@@ -4815,11 +4815,11 @@ SRST
             primary:
             -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
             -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
-            -chardev socket,id=mirror0,host=3.3.3.3,port=9003,server,nowait
-            -chardev socket,id=compare1,host=3.3.3.3,port=9004,server,nowait
-            -chardev socket,id=compare0,host=3.3.3.3,port=9001,server,nowait
+            -chardev socket,id=mirror0,host=3.3.3.3,port=9003,server=on,wait=off
+            -chardev socket,id=compare1,host=3.3.3.3,port=9004,server=on,wait=off
+            -chardev socket,id=compare0,host=3.3.3.3,port=9001,server=on,wait=off
             -chardev socket,id=compare0-0,host=3.3.3.3,port=9001
-            -chardev socket,id=compare_out,host=3.3.3.3,port=9005,server,nowait
+            -chardev socket,id=compare_out,host=3.3.3.3,port=9005,server=on,wait=off
             -chardev socket,id=compare_out0,host=3.3.3.3,port=9005
             -object iothread,id=iothread1
             -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0
@@ -4841,13 +4841,13 @@ SRST
             primary:
             -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
             -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
-            -chardev socket,id=mirror0,host=3.3.3.3,port=9003,server,nowait
-            -chardev socket,id=compare1,host=3.3.3.3,port=9004,server,nowait
-            -chardev socket,id=compare0,host=3.3.3.3,port=9001,server,nowait
+            -chardev socket,id=mirror0,host=3.3.3.3,port=9003,server=on,wait=off
+            -chardev socket,id=compare1,host=3.3.3.3,port=9004,server=on,wait=off
+            -chardev socket,id=compare0,host=3.3.3.3,port=9001,server=on,wait=off
             -chardev socket,id=compare0-0,host=3.3.3.3,port=9001
-            -chardev socket,id=compare_out,host=3.3.3.3,port=9005,server,nowait
+            -chardev socket,id=compare_out,host=3.3.3.3,port=9005,server=on,wait=off
             -chardev socket,id=compare_out0,host=3.3.3.3,port=9005
-            -chardev socket,id=notify_way,host=3.3.3.3,port=9009,server,nowait
+            -chardev socket,id=notify_way,host=3.3.3.3,port=9009,server=on,wait=off
             -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0
             -object filter-redirector,netdev=hn0,id=redire0,queue=rx,indev=compare_out
             -object filter-redirector,netdev=hn0,id=redire1,queue=rx,outdev=compare0
-- 
2.29.2


