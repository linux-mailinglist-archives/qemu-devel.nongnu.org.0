Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E22DC94A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 23:55:48 +0100 (CET)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpfhy-0000r6-OF
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 17:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrin@gorski.net>) id 1kpewu-0001mG-A2
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:07:08 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrin@gorski.net>) id 1kpewr-0005PW-Hn
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:07:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id c7so26529512edv.6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 14:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gorski-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GKAhj4tB5HeYcFNc/jbem46mrLhdJ63kPO0cbvcjq3o=;
 b=GFkNyj8Ier6d3+0Dlh56QoGcpVQ/mFENVfQ8iJs1TizCbvEBUlqhUdPzkoyAHSYmEr
 bKcbDvzkgk6I32jEv/kJhvPYD0sp7ZjaQ7AsaOJFB4LUY95eNHYhvg25ccXOuuij1QHc
 +tjz0doaPi4JKTuUouq38xLny55lC9vWT+2Nv/a+p8RVDrj/DMcjKz9tw6Q48cXF8W9v
 qE8y3bMFOmIs0QCSv/AWflmQYNg1+rZ/pzfTfUAVvYlRbNyTgDeGzI7NP0Cgbiea1rFl
 6Vctji9+G09SXjdmxOaE9Iz344D1VMQyjdp4PXdvjhLkgAZ8KXynWLo5DXk2cSSWnMwS
 d4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GKAhj4tB5HeYcFNc/jbem46mrLhdJ63kPO0cbvcjq3o=;
 b=hqC0FLBWRxrA3rsdfoemTz3wxSDeGChRud+hldqW+3NmYPpHbZrXQRhg8Fu2xmk06z
 /zSTTnxAP2lcJ0g4elbYPQGFgXqMEPKzfInNIJjdtwU9kIHNuGlHbc8DCwgJsrzrM/sV
 562l9Fcy5YDI/FbNCsR3BgvJlOEK+xMKNd4HYHbcK6d3EHxqMkjl2O95z5Om4ilcdX8l
 kxECoR+f6gcbM230URhTwR3vJ1W7AfqXrW8A6QVrkoIgJP8OC9+XS4gBzJ5cxXzKe/V1
 e21d/b5PnIaqN0kDA4JIHmwizFxgtPb5WG57MNh+pXTLD3xaYKUWnXuYyURndJa40AZ1
 CznQ==
X-Gm-Message-State: AOAM533wsDEi7FjoWcRrJmNVl/wUBKGDFSBpWnbb73fs+NrlJQ6N2aeV
 NdiihL5n7U3652wB52GJjVLGzA9nlWKfAqdk01euGelHogEO0RF3
X-Google-Smtp-Source: ABdhPJwBS3yHqViqBlJP0ZpMpE6DbkE4fUbIXnoNyIyWHDygZtzHHRGaNmnElETfuSmzSC1vLaX3CnYUOX4ewbpQ7sM=
X-Received: by 2002:a05:6402:1684:: with SMTP id
 a4mr19035413edv.348.1608156422817; 
 Wed, 16 Dec 2020 14:07:02 -0800 (PST)
MIME-Version: 1.0
From: "Darrin M. Gorski" <darrin@gorski.net>
Date: Wed, 16 Dec 2020 17:06:51 -0500
Message-ID: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
Subject: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via DTR
 and DCD
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000535ef605b69c1850"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=darrin@gorski.net; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Dec 2020 17:53:48 -0500
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000535ef605b69c1850
Content-Type: text/plain; charset="UTF-8"

This patch adds a 'modemctl' option to "-chardev socket" to enable control
of the socket via the guest serial port.
The default state of the option is disabled.

1. disconnect a connected socket when DTR transitions to low, also reject
new connections while DTR is low.
2. provide socket connection status through the carrier detect line (CD or
DCD) on the guest serial port

Buglink: https://bugs.launchpad.net/qemu/+bug/1213196

Signed-off-by: Darrin M. Gorski <darrin@gorski.net>


diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8dd0..94dd28e0cd 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-visit-sockets.h"

 #include "chardev/char-io.h"
+#include "chardev/char-serial.h"
 #include "qom/object.h"

 /***********************************************************/
@@ -85,6 +86,9 @@ struct SocketChardev {
     bool connect_err_reported;

     QIOTask *connect_task;
+
+    bool is_modemctl;
+    int modem_state;
 };
 typedef struct SocketChardev SocketChardev;

@@ -98,12 +102,18 @@ static void tcp_chr_change_state(SocketChardev *s,
TCPChardevState state)
 {
     switch (state) {
     case TCP_CHARDEV_STATE_DISCONNECTED:
+        if(s->is_modemctl) {
+            s->modem_state &= ~(CHR_TIOCM_CAR);
+        }
         break;
     case TCP_CHARDEV_STATE_CONNECTING:
         assert(s->state == TCP_CHARDEV_STATE_DISCONNECTED);
         break;
     case TCP_CHARDEV_STATE_CONNECTED:
         assert(s->state == TCP_CHARDEV_STATE_CONNECTING);
+        if(s->is_modemctl) {
+            s->modem_state |= CHR_TIOCM_CAR;
+        }
         break;
     }
     s->state = state;
@@ -947,6 +957,12 @@ static void tcp_chr_accept(QIONetListener *listener,
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, cioc);
     tcp_chr_new_client(chr, cioc);
+
+    if(s->is_modemctl) {
+        if(!(s->modem_state & CHR_TIOCM_DTR)) {
+            tcp_chr_disconnect(chr); /* disconnect if DTR is low */
+        }
+    }
 }


@@ -1322,12 +1338,17 @@ static void qmp_chardev_open_socket(Chardev *chr,
     bool is_tn3270      = sock->has_tn3270  ? sock->tn3270  : false;
     bool is_waitconnect = sock->has_wait    ? sock->wait    : false;
     bool is_websock     = sock->has_websocket ? sock->websocket : false;
+    bool is_modemctl     = sock->has_modemctl ? sock->modemctl : false;
     int64_t reconnect   = sock->has_reconnect ? sock->reconnect : 0;
     SocketAddress *addr;

     s->is_listen = is_listen;
     s->is_telnet = is_telnet;
     s->is_tn3270 = is_tn3270;
+    s->is_modemctl = is_modemctl;
+    if(is_modemctl) {
+      s->modem_state = CHR_TIOCM_CTS | CHR_TIOCM_DSR;
+    }
     s->is_websock = is_websock;
     s->do_nodelay = do_nodelay;
     if (sock->tls_creds) {
@@ -1448,6 +1469,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts,
ChardevBackend *backend,
     sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
     sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
     sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
+    sock->has_modemctl = qemu_opt_get(opts, "modemctl");
+    sock->modemctl = qemu_opt_get_bool(opts, "modemctl", false);

     addr = g_new0(SocketAddressLegacy, 1);
     if (path) {
@@ -1501,6 +1524,51 @@ char_socket_get_connected(Object *obj, Error **errp)
     return s->state == TCP_CHARDEV_STATE_CONNECTED;
 }

+/* ioctl support: allow guest to control/track socket state
+ * via modem control lines (DCD/DTR)
+ */
+static int
+char_socket_ioctl(Chardev *chr, int cmd, void *arg)
+{
+    SocketChardev *s = SOCKET_CHARDEV(chr);
+
+    if(!(s->is_modemctl)) {
+        return -ENOTSUP;
+    }
+
+    switch (cmd) {
+        case CHR_IOCTL_SERIAL_GET_TIOCM:
+            {
+                int *targ = (int *)arg;
+                *targ = s->modem_state;
+            }
+            break;
+        case CHR_IOCTL_SERIAL_SET_TIOCM:
+            {
+                int sarg = *(int *)arg;
+                if (sarg & CHR_TIOCM_RTS) {
+                    s->modem_state |= CHR_TIOCM_RTS;
+                } else {
+                    s->modem_state &= ~(CHR_TIOCM_RTS);
+                }
+                if (sarg & CHR_TIOCM_DTR) {
+                    s->modem_state |= CHR_TIOCM_DTR;
+                } else {
+                    s->modem_state &= ~(CHR_TIOCM_DTR);
+                    /* disconnect if DTR goes low */
+                    if(s->state == TCP_CHARDEV_STATE_CONNECTED) {
+                        tcp_chr_disconnect(chr);
+                    }
+                }
+            }
+            break;
+        default:
+            return -ENOTSUP;
+    }
+
+    return 0;
+}
+
 static void char_socket_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
@@ -1516,6 +1584,7 @@ static void char_socket_class_init(ObjectClass *oc,
void *data)
     cc->chr_add_client = tcp_chr_add_client;
     cc->chr_add_watch = tcp_chr_add_watch;
     cc->chr_update_read_handler = tcp_chr_update_read_handler;
+    cc->chr_ioctl = char_socket_ioctl;

     object_class_property_add(oc, "addr", "SocketAddress",
                               char_socket_get_addr, NULL,
diff --git a/chardev/char.c b/chardev/char.c
index a9b8c5a9aa..601d818f81 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -928,6 +928,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "logappend",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "modemctl",
+            .type = QEMU_OPT_BOOL,
 #ifdef CONFIG_LINUX
         },{
             .name = "tight",
diff --git a/qapi/char.json b/qapi/char.json
index 58338ed62d..f352bd6350 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -271,6 +271,9 @@
 #             then attempt a reconnect after the given number of seconds.
 #             Setting this to zero disables this function. (default: 0)
 #             (Since: 2.2)
+# @modemctl: allow guest to use modem control signals to control/monitor
+#            the socket state (CD follows is_connected, DTR influences
+#            connect/accept) (default: false) (Since: 5.2)
 #
 # Since: 1.4
 ##
@@ -284,6 +287,7 @@
             '*telnet': 'bool',
             '*tn3270': 'bool',
             '*websocket': 'bool',
+            '*modemctl': 'bool',
             '*reconnect': 'int' },
   'base': 'ChardevCommon' }

diff --git a/qemu-options.hx b/qemu-options.hx
index 459c916d3d..f09072afbf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2991,11 +2991,13 @@ DEFHEADING(Character device options:)
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
     "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev
socket,id=id[,host=host],port=port[,to=to][,ipv4][,ipv6][,nodelay][,reconnect=seconds]\n"
-    "
[,server][,nowait][,telnet][,websocket][,reconnect=seconds][,mux=on|off]\n"
-    "
[,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
-    "-chardev
socket,id=id,path=path[,server][,nowait][,telnet][,websocket][,reconnect=seconds]\n"
-    "
[,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off]
(unix)\n"
+    "-chardev
socket,id=id[,host=host],port=port[,to=to][,ipv4][,ipv6][,nodelay]\n"
+    "
[,reconnect=seconds][,server][,nowait][,telnet][,websocket]\n"
+    "         [,modemctl][,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "-chardev
socket,id=id,path=path[,server][,nowait][,telnet][,websocket]\n"
+    "
[,reconnect=seconds][,modemctl][,mux=on|off][,logfile=PATH]\n"
+    "         [,logappend=on|off][,abstract=on|off][,tight=on|off]
(unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4][,ipv6][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off]\n"

--000000000000535ef605b69c1850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"monospace"><br></font></div><div><font =
face=3D"monospace">This patch adds a &#39;modemctl&#39; option to &quot;-ch=
ardev socket&quot; to enable control of the socket via the guest serial por=
t.</font></div><div><div><font face=3D"monospace">The default state of the =
option is disabled.</font></div><div><font face=3D"monospace"><br></font></=
div><div></div></div><div><span style=3D"font-family:monospace">1. disconne=
ct a connected socket when DTR transitions to low, also reject new connecti=
ons while DTR is low.</span><br></div><div><div><font face=3D"monospace">2.=
 provide socket connection status through the carrier detect line (CD or DC=
D) on the guest serial port</font></div></div><div><font face=3D"monospace"=
><br></font></div><div><pre style=3D"padding:0px;margin-top:0px;margin-bott=
om:0px;color:rgb(0,0,0);font-size:13.3333px">Buglink: <a href=3D"https://bu=
gs.launchpad.net/qemu/+bug/1213196">https://bugs.launchpad.net/qemu/+bug/12=
13196</a></pre><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;c=
olor:rgb(0,0,0);font-size:13.3333px">Signed-off-by: Darrin M. Gorski &lt;<a=
 href=3D"mailto:darrin@gorski.net">darrin@gorski.net</a>&gt;</pre></div><di=
v><font face=3D"monospace"><br>diff --git a/chardev/char-socket.c b/chardev=
/char-socket.c<br>index 213a4c8dd0..94dd28e0cd 100644<br>--- a/chardev/char=
-socket.c<br>+++ b/chardev/char-socket.c<br>@@ -36,6 +36,7 @@<br>=C2=A0#inc=
lude &quot;qapi/qapi-visit-sockets.h&quot;<br><br>=C2=A0#include &quot;char=
dev/char-io.h&quot;<br>+#include &quot;chardev/char-serial.h&quot;<br>=C2=
=A0#include &quot;qom/object.h&quot;<br><br>=C2=A0/************************=
***********************************/<br>@@ -85,6 +86,9 @@ struct SocketChar=
dev {<br>=C2=A0 =C2=A0 =C2=A0bool connect_err_reported;<br><br>=C2=A0 =C2=
=A0 =C2=A0QIOTask *connect_task;<br>+<br>+ =C2=A0 =C2=A0bool is_modemctl;<b=
r>+ =C2=A0 =C2=A0int modem_state;<br>=C2=A0};<br>=C2=A0typedef struct Socke=
tChardev SocketChardev;<br><br>@@ -98,12 +102,18 @@ static void tcp_chr_cha=
nge_state(SocketChardev *s, TCPChardevState state)<br>=C2=A0{<br>=C2=A0 =C2=
=A0 =C2=A0switch (state) {<br>=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STATE_DI=
SCONNECTED:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;is_modemctl) {<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state &amp;=3D ~(CHR_T=
IOCM_CAR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STATE_CONNECTING:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s-&gt;state =3D=3D TCP_CHARDEV_STA=
TE_DISCONNECTED);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=
=A0 =C2=A0case TCP_CHARDEV_STATE_CONNECTED:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0assert(s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNECTING);<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if(s-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_CAR;<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0=
 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;state =3D state;<br>@@ -947,6 +957,12=
 @@ static void tcp_chr_accept(QIONetListener *listener,<br>=C2=A0 =C2=A0 =
=C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);<br>=C2=A0 =C2=
=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, cioc);<br>=C2=A0 =C2=A0 =C2=A0tc=
p_chr_new_client(chr, cioc);<br>+<br>+ =C2=A0 =C2=A0if(s-&gt;is_modemctl) {=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!(s-&gt;modem_state &amp; CHR_TIOCM_DTR=
)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_disconnect(chr);=
 /* disconnect if DTR is low */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=
=A0 =C2=A0}<br>=C2=A0}<br><br><br>@@ -1322,12 +1338,17 @@ static void qmp_c=
hardev_open_socket(Chardev *chr,<br>=C2=A0 =C2=A0 =C2=A0bool is_tn3270 =C2=
=A0 =C2=A0 =C2=A0=3D sock-&gt;has_tn3270 =C2=A0? sock-&gt;tn3270 =C2=A0: fa=
lse;<br>=C2=A0 =C2=A0 =C2=A0bool is_waitconnect =3D sock-&gt;has_wait =C2=
=A0 =C2=A0? sock-&gt;wait =C2=A0 =C2=A0: false;<br>=C2=A0 =C2=A0 =C2=A0bool=
 is_websock =C2=A0 =C2=A0 =3D sock-&gt;has_websocket ? sock-&gt;websocket :=
 false;<br>+ =C2=A0 =C2=A0bool is_modemctl =C2=A0 =C2=A0 =3D sock-&gt;has_m=
odemctl ? sock-&gt;modemctl : false;<br>=C2=A0 =C2=A0 =C2=A0int64_t reconne=
ct =C2=A0 =3D sock-&gt;has_reconnect ? sock-&gt;reconnect : 0;<br>=C2=A0 =
=C2=A0 =C2=A0SocketAddress *addr;<br><br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_liste=
n =3D is_listen;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_telnet =3D is_telnet;<br>=
=C2=A0 =C2=A0 =C2=A0s-&gt;is_tn3270 =3D is_tn3270;<br>+ =C2=A0 =C2=A0s-&gt;=
is_modemctl =3D is_modemctl;<br>+ =C2=A0 =C2=A0if(is_modemctl) {<br>+ =C2=
=A0 =C2=A0 =C2=A0s-&gt;modem_state =3D CHR_TIOCM_CTS | CHR_TIOCM_DSR;<br>+ =
=C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_websock =3D is_websock;<br>=
=C2=A0 =C2=A0 =C2=A0s-&gt;do_nodelay =3D do_nodelay;<br>=C2=A0 =C2=A0 =C2=
=A0if (sock-&gt;tls_creds) {<br>@@ -1448,6 +1469,8 @@ static void qemu_chr_=
parse_socket(QemuOpts *opts, ChardevBackend *backend,<br>=C2=A0 =C2=A0 =C2=
=A0sock-&gt;tls_creds =3D g_strdup(qemu_opt_get(opts, &quot;tls-creds&quot;=
));<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;has_tls_authz =3D qemu_opt_get(opts, &q=
uot;tls-authz&quot;);<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;tls_authz =3D g_strdu=
p(qemu_opt_get(opts, &quot;tls-authz&quot;));<br>+ =C2=A0 =C2=A0sock-&gt;ha=
s_modemctl =3D qemu_opt_get(opts, &quot;modemctl&quot;);<br>+ =C2=A0 =C2=A0=
sock-&gt;modemctl =3D qemu_opt_get_bool(opts, &quot;modemctl&quot;, false);=
<br><br>=C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddressLegacy, 1);<br>=C2=
=A0 =C2=A0 =C2=A0if (path) {<br>@@ -1501,6 +1524,51 @@ char_socket_get_conn=
ected(Object *obj, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0return s-&gt;state =
=3D=3D TCP_CHARDEV_STATE_CONNECTED;<br>=C2=A0}<br><br>+/* ioctl support: al=
low guest to control/track socket state<br>+ * via modem control lines (DCD=
/DTR)<br>+ */<br>+static int<br>+char_socket_ioctl(Chardev *chr, int cmd, v=
oid *arg)<br>+{<br>+ =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);=
<br>+<br>+ =C2=A0 =C2=A0if(!(s-&gt;is_modemctl)) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOTSUP;<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0switc=
h (cmd) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_SERIAL_GET_TIOCM:<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *targ =3D (int *)arg;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*targ =3D s-&gt;modem_state;<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_S=
ERIAL_SET_TIOCM:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sarg =3D *(int *)ar=
g;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sarg &am=
p; CHR_TIOCM_RTS) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_RTS;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state &a=
mp;=3D ~(CHR_TIOCM_RTS);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(sarg &amp; CHR_TIOCM_DTR) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_DTR;<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_s=
tate &amp;=3D ~(CHR_TIOCM_DTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disconnect if DTR goes low */<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;sta=
te =3D=3D TCP_CHARDEV_STATE_CONNECTED) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_disconnect(c=
hr);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>+ =C2=A0 =C2=A0}<br>+=
<br>+ =C2=A0 =C2=A0return 0;<br>+}<br>+<br>=C2=A0static void char_socket_cl=
ass_init(ObjectClass *oc, void *data)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0Cha=
rdevClass *cc =3D CHARDEV_CLASS(oc);<br>@@ -1516,6 +1584,7 @@ static void c=
har_socket_class_init(ObjectClass *oc, void *data)<br>=C2=A0 =C2=A0 =C2=A0c=
c-&gt;chr_add_client =3D tcp_chr_add_client;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;=
chr_add_watch =3D tcp_chr_add_watch;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_upda=
te_read_handler =3D tcp_chr_update_read_handler;<br>+ =C2=A0 =C2=A0cc-&gt;c=
hr_ioctl =3D char_socket_ioctl;<br><br>=C2=A0 =C2=A0 =C2=A0object_class_pro=
perty_add(oc, &quot;addr&quot;, &quot;SocketAddress&quot;,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0char_socket_get_addr, NULL,<br>diff --git a/chardev=
/char.c b/chardev/char.c<br>index a9b8c5a9aa..601d818f81 100644<br>--- a/ch=
ardev/char.c<br>+++ b/chardev/char.c<br>@@ -928,6 +928,9 @@ QemuOptsList qe=
mu_chardev_opts =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;logappend&quot;,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.name =3D &quot;modemctl&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br>=C2=A0#ifdef CONFIG_LINUX<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.name =3D &quot;tight&quot;,<br>diff --git a/qapi/char.json b/qapi/c=
har.json<br>index 58338ed62d..f352bd6350 100644<br>--- a/qapi/char.json<br>=
+++ b/qapi/char.json<br>@@ -271,6 +271,9 @@<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 then attempt a reconnect after the given number of se=
conds.<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Setting this to=
 zero disables this function. (default: 0)<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (Since: 2.2)<br>+# @modemctl: allow guest to use modem=
 control signals to control/monitor<br>+# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0the socket state (CD follows is_connected, DTR influences<br>+# =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connect/accept) (default: false) (=
Since: 5.2)<br>=C2=A0#<br>=C2=A0# Since: 1.4<br>=C2=A0##<br>@@ -284,6 +287,=
7 @@<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*telnet&#39;: =
&#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*tn=
3270&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;*websocket&#39;: &#39;bool&#39;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;*modemctl&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*reconnect&#39;: &#39;int&#39; },<br>=C2=A0=
 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br><br>diff --git a/qemu-o=
ptions.hx b/qemu-options.hx<br>index 459c916d3d..f09072afbf 100644<br>--- a=
/qemu-options.hx<br>+++ b/qemu-options.hx<br>@@ -2991,11 +2991,13 @@ DEFHEA=
DING(Character device options:)<br>=C2=A0DEF(&quot;chardev&quot;, HAS_ARG, =
QEMU_OPTION_chardev,<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev help\n&quot;<br>=
=C2=A0 =C2=A0 =C2=A0&quot;-chardev null,id=3Did[,mux=3Don|off][,logfile=3DP=
ATH][,logappend=3Don|off]\n&quot;<br>- =C2=A0 =C2=A0&quot;-chardev socket,i=
d=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodelay][,reconne=
ct=3Dseconds]\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds][,mux=3Don|off=
]\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,logfile=3D=
PATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID] (tcp)\n&quot;<=
br>- =C2=A0 =C2=A0&quot;-chardev socket,id=3Did,path=3Dpath[,server][,nowai=
t][,telnet][,websocket][,reconnect=3Dseconds]\n&quot;<br>- =C2=A0 =C2=A0&qu=
ot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,mux=3Don|off][,logfile=3DPATH][,logappend=
=3Don|off][,abstract=3Don|off][,tight=3Don|off] (unix)\n&quot;<br>+ =C2=A0 =
=C2=A0&quot;-chardev socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ip=
v4][,ipv6][,nodelay]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 [,reconnect=3Dseconds][,server][,nowait][,telnet][,websocket]\n&quot=
;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,modemctl][,mux=3Do=
n|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>+ =C2=A0 =C2=A0&quo=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,tls-creds=3DID][,tls-authz=3DID] (tcp)\n&q=
uot;<br>+ =C2=A0 =C2=A0&quot;-chardev socket,id=3Did,path=3Dpath[,server][,=
nowait][,telnet][,websocket]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 [,reconnect=3Dseconds][,modemctl][,mux=3Don|off][,logfile=3D=
PATH]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,logapp=
end=3Don|off][,abstract=3Don|off][,tight=3Don|off] (unix)\n&quot;<br>=C2=A0=
 =C2=A0 =C2=A0&quot;-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localad=
dr=3Dlocaladdr]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 [,localport=3Dlocalport][,ipv4][,ipv6][,mux=3Don|off]\n&quot;<br>=C2=
=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,logfile=3DPATH][,loga=
ppend=3Don|off]\n&quot;</font><br></div></div>

--000000000000535ef605b69c1850--

