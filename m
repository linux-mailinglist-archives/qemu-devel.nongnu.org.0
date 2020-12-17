Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666B2DD2CD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:19:32 +0100 (CET)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpu7v-00036I-8s
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpu4x-0001SM-Q1
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:16:27 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpu4u-00017j-FP
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:16:27 -0500
Received: by mail-ed1-x536.google.com with SMTP id b2so28824817edm.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PjpbLKWuzgO2dEQFPUOeiLGkSoZ9jzlwRgJDrQ3A2lw=;
 b=MQuepSwfKWuj9a/pE2lwOPl9Duq405uLu8X1zfFHBOjJYjyFB58JTId1bGIL1qogzn
 vEzuPm3hrMxKDOscHHXxy4fv/lEdEhCrSyB+8YV8MWsBDJDWGLHw8zVVzas0HFmZqx/N
 qg3MVPx0MJfg6v4z2JzNfnJn9Vghr3E6wiUdOxouLDVtKPXeNDu/JtN567EX8ubnYisU
 BXS5dbPOOskveorpPxbXfTmj3cweQtyEh98quKVTAee8G7o0ay0/v/euiV4i0wn1HkV+
 UmIZ6wZTQU74+gGSlJOQWbIGkjsWJFiMxSP98HPtyZIShF5muY3Y026swd2dc59s39Ek
 +rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjpbLKWuzgO2dEQFPUOeiLGkSoZ9jzlwRgJDrQ3A2lw=;
 b=BVF9q43vISusrirHoG+mO70zhAIt6vi2H5WG7WDHQF1Qma9rZq6pCUL0uz5ZBJPDV4
 AAKyx/qkZYBC2i1UF9FbRQ+ahzAkfrJZmopgvKjeVGp3oAXdwEsVfoFD4KVPGHJc9sGp
 nND0YHZPZNXa3tEiYdZOsDJaDxYRcmIodveU3qeuuBymx0i5McCDvnDykhxBwlLV0dBC
 LegilK6H0r1Bx16ZLHO2CdK3lfIUvcj8vF5tknthkW1Tx0Fsw8xFPHOXfVHTCcgF4TLL
 vmvXc0aipTUEuwlIdNYstf9CWSR+b8KeQ87vSesiLfRfOnnuDZJGvLX3vEBBOmUbBxmM
 FKWQ==
X-Gm-Message-State: AOAM530Z2lDX1YZg99Rwf+kQaXit8jkb2dmyO5cnxaFrFIcP+4Md7WJr
 oYhohbpiQuNGmcnP+w5htlu49I6TGtclsvrAjfI=
X-Google-Smtp-Source: ABdhPJzYfTKHj+gE3vCM2cFDV0xxi+TiRD68Bt/iuc/Dy73DMypHeJHAdMbjxitxBDuQAdjxGiUK6aaRcrNdMfgBKIQ=
X-Received: by 2002:aa7:cb16:: with SMTP id s22mr1689205edt.53.1608214581153; 
 Thu, 17 Dec 2020 06:16:21 -0800 (PST)
MIME-Version: 1.0
References: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
In-Reply-To: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Dec 2020 18:16:08 +0400
Message-ID: <CAJ+F1C+moy=Bhq=gTGzbutxHCjyqcRKc5bCJLu8AUP4_B7+sYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via
 DTR and DCD
To: "Darrin M. Gorski" <darrin@gorski.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d51b1c05b6a9a215"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d51b1c05b6a9a215
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 2:54 AM Darrin M. Gorski <darrin@gorski.net> wrote:

>
> This patch adds a 'modemctl' option to "-chardev socket" to enable contro=
l
> of the socket via the guest serial port.
> The default state of the option is disabled.
>
> 1. disconnect a connected socket when DTR transitions to low, also reject
> new connections while DTR is low.
> 2. provide socket connection status through the carrier detect line (CD o=
r
> DCD) on the guest serial port
>

That sounds like a good idea to me, but others may have different opinions.


> Buglink: https://bugs.launchpad.net/qemu/+bug/1213196
>
> Signed-off-by: Darrin M. Gorski <darrin@gorski.net>
>
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 213a4c8dd0..94dd28e0cd 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -36,6 +36,7 @@
>  #include "qapi/qapi-visit-sockets.h"
>
>  #include "chardev/char-io.h"
> +#include "chardev/char-serial.h"
>  #include "qom/object.h"
>
>  /***********************************************************/
> @@ -85,6 +86,9 @@ struct SocketChardev {
>      bool connect_err_reported;
>
>      QIOTask *connect_task;
> +
> +    bool is_modemctl;
> +    int modem_state;
>

Can we make this generic over all chardevs by moving it to the base class?

 };
>  typedef struct SocketChardev SocketChardev;
>
> @@ -98,12 +102,18 @@ static void tcp_chr_change_state(SocketChardev *s,
> TCPChardevState state)
>  {
>      switch (state) {
>      case TCP_CHARDEV_STATE_DISCONNECTED:
> +        if(s->is_modemctl) {
> +            s->modem_state &=3D ~(CHR_TIOCM_CAR);
> +        }
>          break;
>      case TCP_CHARDEV_STATE_CONNECTING:
>          assert(s->state =3D=3D TCP_CHARDEV_STATE_DISCONNECTED);
>          break;
>      case TCP_CHARDEV_STATE_CONNECTED:
>          assert(s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING);
> +        if(s->is_modemctl) {
> +            s->modem_state |=3D CHR_TIOCM_CAR;
> +        }
>          break;
>      }
>      s->state =3D state;
> @@ -947,6 +957,12 @@ static void tcp_chr_accept(QIONetListener *listener,
>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      tcp_chr_set_client_ioc_name(chr, cioc);
>      tcp_chr_new_client(chr, cioc);
> +
> +    if(s->is_modemctl) {
> +        if(!(s->modem_state & CHR_TIOCM_DTR)) {
> +            tcp_chr_disconnect(chr); /* disconnect if DTR is low */
> +        }
> +    }
>  }
>
>
> @@ -1322,12 +1338,17 @@ static void qmp_chardev_open_socket(Chardev *chr,
>      bool is_tn3270      =3D sock->has_tn3270  ? sock->tn3270  : false;
>      bool is_waitconnect =3D sock->has_wait    ? sock->wait    : false;
>      bool is_websock     =3D sock->has_websocket ? sock->websocket : fals=
e;
> +    bool is_modemctl     =3D sock->has_modemctl ? sock->modemctl : false=
;
>      int64_t reconnect   =3D sock->has_reconnect ? sock->reconnect : 0;
>      SocketAddress *addr;
>
>      s->is_listen =3D is_listen;
>      s->is_telnet =3D is_telnet;
>      s->is_tn3270 =3D is_tn3270;
> +    s->is_modemctl =3D is_modemctl;
> +    if(is_modemctl) {
> +      s->modem_state =3D CHR_TIOCM_CTS | CHR_TIOCM_DSR;
> +    }
>      s->is_websock =3D is_websock;
>      s->do_nodelay =3D do_nodelay;
>      if (sock->tls_creds) {
> @@ -1448,6 +1469,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts,
> ChardevBackend *backend,
>      sock->tls_creds =3D g_strdup(qemu_opt_get(opts, "tls-creds"));
>      sock->has_tls_authz =3D qemu_opt_get(opts, "tls-authz");
>      sock->tls_authz =3D g_strdup(qemu_opt_get(opts, "tls-authz"));
> +    sock->has_modemctl =3D qemu_opt_get(opts, "modemctl");
> +    sock->modemctl =3D qemu_opt_get_bool(opts, "modemctl", false);
>
>      addr =3D g_new0(SocketAddressLegacy, 1);
>      if (path) {
> @@ -1501,6 +1524,51 @@ char_socket_get_connected(Object *obj, Error **err=
p)
>      return s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED;
>  }
>
> +/* ioctl support: allow guest to control/track socket state
> + * via modem control lines (DCD/DTR)
> + */
> +static int
> +char_socket_ioctl(Chardev *chr, int cmd, void *arg)
> +{
> +    SocketChardev *s =3D SOCKET_CHARDEV(chr);
> +
> +    if(!(s->is_modemctl)) {
> +        return -ENOTSUP;
> +    }
> +
> +    switch (cmd) {
> +        case CHR_IOCTL_SERIAL_GET_TIOCM:
> +            {
> +                int *targ =3D (int *)arg;
> +                *targ =3D s->modem_state;
> +            }
> +            break;
> +        case CHR_IOCTL_SERIAL_SET_TIOCM:
> +            {
> +                int sarg =3D *(int *)arg;
> +                if (sarg & CHR_TIOCM_RTS) {
> +                    s->modem_state |=3D CHR_TIOCM_RTS;
> +                } else {
> +                    s->modem_state &=3D ~(CHR_TIOCM_RTS);
> +                }
> +                if (sarg & CHR_TIOCM_DTR) {
> +                    s->modem_state |=3D CHR_TIOCM_DTR;
> +                } else {
> +                    s->modem_state &=3D ~(CHR_TIOCM_DTR);
> +                    /* disconnect if DTR goes low */
> +                    if(s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {
> +                        tcp_chr_disconnect(chr);
> +                    }
> +                }
> +            }
> +            break;
> +        default:
> +            return -ENOTSUP;
> +    }
> +
> +    return 0;
> +}
> +
>  static void char_socket_class_init(ObjectClass *oc, void *data)
>  {
>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
> @@ -1516,6 +1584,7 @@ static void char_socket_class_init(ObjectClass *oc,
> void *data)
>      cc->chr_add_client =3D tcp_chr_add_client;
>      cc->chr_add_watch =3D tcp_chr_add_watch;
>      cc->chr_update_read_handler =3D tcp_chr_update_read_handler;
> +    cc->chr_ioctl =3D char_socket_ioctl;
>
>      object_class_property_add(oc, "addr", "SocketAddress",
>                                char_socket_get_addr, NULL,
> diff --git a/chardev/char.c b/chardev/char.c
> index a9b8c5a9aa..601d818f81 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -928,6 +928,9 @@ QemuOptsList qemu_chardev_opts =3D {
>          },{
>              .name =3D "logappend",
>              .type =3D QEMU_OPT_BOOL,
> +        },{
> +            .name =3D "modemctl",
> +            .type =3D QEMU_OPT_BOOL,
>  #ifdef CONFIG_LINUX
>          },{
>              .name =3D "tight",
> diff --git a/qapi/char.json b/qapi/char.json
> index 58338ed62d..f352bd6350 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -271,6 +271,9 @@
>  #             then attempt a reconnect after the given number of seconds=
.
>  #             Setting this to zero disables this function. (default: 0)
>  #             (Since: 2.2)
> +# @modemctl: allow guest to use modem control signals to control/monitor
> +#            the socket state (CD follows is_connected, DTR influences
> +#            connect/accept) (default: false) (Since: 5.2)
>  #
>  # Since: 1.4
>  ##
> @@ -284,6 +287,7 @@
>              '*telnet': 'bool',
>              '*tn3270': 'bool',
>              '*websocket': 'bool',
> +            '*modemctl': 'bool',
>              '*reconnect': 'int' },
>    'base': 'ChardevCommon' }
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 459c916d3d..f09072afbf 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2991,11 +2991,13 @@ DEFHEADING(Character device options:)
>  DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>      "-chardev help\n"
>      "-chardev null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3D=
on|off]\n"
> -    "-chardev
> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodelay=
][,reconnect=3Dseconds]\n"
> -    "
> [,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds][,mux=3Don|o=
ff]\n"
> -    "
> [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID] =
(tcp)\n"
> -    "-chardev
> socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket][,reconn=
ect=3Dseconds]\n"
> -    "
> [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|off]=
[,tight=3Don|off]
> (unix)\n"
> +    "-chardev
> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodelay=
]\n"
> +    "
> [,reconnect=3Dseconds][,server][,nowait][,telnet][,websocket]\n"
> +    "
> [,modemctl][,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> +    "         [,tls-creds=3DID][,tls-authz=3DID] (tcp)\n"
> +    "-chardev
> socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket]\n"
> +    "
> [,reconnect=3Dseconds][,modemctl][,mux=3Don|off][,logfile=3DPATH]\n"
> +    "         [,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|off]
> (unix)\n"
>      "-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dlocalad=
dr]\n"
>      "         [,localport=3Dlocalport][,ipv4][,ipv6][,mux=3Don|off]\n"
>      "         [,logfile=3DPATH][,logappend=3Don|off]\n"
>

This feature will need some new tests in tests/test-char.c.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d51b1c05b6a9a215
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 2:54 AM Dar=
rin M. Gorski &lt;<a href=3D"mailto:darrin@gorski.net">darrin@gorski.net</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div><font face=3D"monospace"><br></font></div><div><font fac=
e=3D"monospace">This patch adds a &#39;modemctl&#39; option to &quot;-chard=
ev socket&quot; to enable control of the socket via the guest serial port.<=
/font></div><div><div><font face=3D"monospace">The default state of the opt=
ion is disabled.</font></div><div><font face=3D"monospace"><br></font></div=
><div></div></div><div><span style=3D"font-family:monospace">1. disconnect =
a connected socket when DTR transitions to low, also reject new connections=
 while DTR is low.</span><br></div><div><div><font face=3D"monospace">2. pr=
ovide socket connection status through the carrier detect line (CD or DCD) =
on the guest serial port</font></div></div></div></blockquote><div><br></di=
v><div>That sounds like a good idea to me, but others may have different op=
inions.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div><font face=3D"monospace"><br></font></div><div><p=
re style=3D"padding:0px;margin-top:0px;margin-bottom:0px;color:rgb(0,0,0);f=
ont-size:13.3333px">Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bu=
g/1213196" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1213196</=
a></pre><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;color:rg=
b(0,0,0);font-size:13.3333px">Signed-off-by: Darrin M. Gorski &lt;<a href=
=3D"mailto:darrin@gorski.net" target=3D"_blank">darrin@gorski.net</a>&gt;</=
pre></div><div><font face=3D"monospace"><br>diff --git a/chardev/char-socke=
t.c b/chardev/char-socket.c<br>index 213a4c8dd0..94dd28e0cd 100644<br>--- a=
/chardev/char-socket.c<br>+++ b/chardev/char-socket.c<br>@@ -36,6 +36,7 @@<=
br>=C2=A0#include &quot;qapi/qapi-visit-sockets.h&quot;<br><br>=C2=A0#inclu=
de &quot;chardev/char-io.h&quot;<br>+#include &quot;chardev/char-serial.h&q=
uot;<br>=C2=A0#include &quot;qom/object.h&quot;<br><br>=C2=A0/*************=
**********************************************/<br>@@ -85,6 +86,9 @@ struct=
 SocketChardev {<br>=C2=A0 =C2=A0 =C2=A0bool connect_err_reported;<br><br>=
=C2=A0 =C2=A0 =C2=A0QIOTask *connect_task;<br>+<br>+ =C2=A0 =C2=A0bool is_m=
odemctl;<br>+ =C2=A0 =C2=A0int modem_state;<br></font></div></div></blockqu=
ote><div><br></div><div>Can we make this generic over all chardevs by movin=
g it to the base class?</div><div> <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div><font face=3D"monospace">=C2=A0};=
<br>=C2=A0typedef struct SocketChardev SocketChardev;<br><br>@@ -98,12 +102=
,18 @@ static void tcp_chr_change_state(SocketChardev *s, TCPChardevState s=
tate)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0switch (state) {<br>=C2=A0 =C2=A0 =
=C2=A0case TCP_CHARDEV_STATE_DISCONNECTED:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if(s-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt=
;modem_state &amp;=3D ~(CHR_TIOCM_CAR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0case TCP_=
CHARDEV_STATE_CONNECTING:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s-&gt=
;state =3D=3D TCP_CHARDEV_STATE_DISCONNECTED);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STATE_CONNECTED:<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s-&gt;state =3D=3D TCP_CHARDEV_S=
TATE_CONNECTING);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;is_modemctl) {<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIO=
CM_CAR;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;state =
=3D state;<br>@@ -947,6 +957,12 @@ static void tcp_chr_accept(QIONetListene=
r *listener,<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STA=
TE_CONNECTING);<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, cio=
c);<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, cioc);<br>+<br>+ =C2=A0 =
=C2=A0if(s-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!(s-&gt;mo=
dem_state &amp; CHR_TIOCM_DTR)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tcp_chr_disconnect(chr); /* disconnect if DTR is low */<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0}<br>=C2=A0}<br><br><br>@@ -1322,12=
 +1338,17 @@ static void qmp_chardev_open_socket(Chardev *chr,<br>=C2=A0 =
=C2=A0 =C2=A0bool is_tn3270 =C2=A0 =C2=A0 =C2=A0=3D sock-&gt;has_tn3270 =C2=
=A0? sock-&gt;tn3270 =C2=A0: false;<br>=C2=A0 =C2=A0 =C2=A0bool is_waitconn=
ect =3D sock-&gt;has_wait =C2=A0 =C2=A0? sock-&gt;wait =C2=A0 =C2=A0: false=
;<br>=C2=A0 =C2=A0 =C2=A0bool is_websock =C2=A0 =C2=A0 =3D sock-&gt;has_web=
socket ? sock-&gt;websocket : false;<br>+ =C2=A0 =C2=A0bool is_modemctl =C2=
=A0 =C2=A0 =3D sock-&gt;has_modemctl ? sock-&gt;modemctl : false;<br>=C2=A0=
 =C2=A0 =C2=A0int64_t reconnect =C2=A0 =3D sock-&gt;has_reconnect ? sock-&g=
t;reconnect : 0;<br>=C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br><br>=C2=A0 =
=C2=A0 =C2=A0s-&gt;is_listen =3D is_listen;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is=
_telnet =3D is_telnet;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_tn3270 =3D is_tn3270=
;<br>+ =C2=A0 =C2=A0s-&gt;is_modemctl =3D is_modemctl;<br>+ =C2=A0 =C2=A0if=
(is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state =3D CHR_TIOCM_CT=
S | CHR_TIOCM_DSR;<br>+ =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_webs=
ock =3D is_websock;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;do_nodelay =3D do_nodelay;=
<br>=C2=A0 =C2=A0 =C2=A0if (sock-&gt;tls_creds) {<br>@@ -1448,6 +1469,8 @@ =
static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,<=
br>=C2=A0 =C2=A0 =C2=A0sock-&gt;tls_creds =3D g_strdup(qemu_opt_get(opts, &=
quot;tls-creds&quot;));<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;has_tls_authz =3D q=
emu_opt_get(opts, &quot;tls-authz&quot;);<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;t=
ls_authz =3D g_strdup(qemu_opt_get(opts, &quot;tls-authz&quot;));<br>+ =C2=
=A0 =C2=A0sock-&gt;has_modemctl =3D qemu_opt_get(opts, &quot;modemctl&quot;=
);<br>+ =C2=A0 =C2=A0sock-&gt;modemctl =3D qemu_opt_get_bool(opts, &quot;mo=
demctl&quot;, false);<br><br>=C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddr=
essLegacy, 1);<br>=C2=A0 =C2=A0 =C2=A0if (path) {<br>@@ -1501,6 +1524,51 @@=
 char_socket_get_connected(Object *obj, Error **errp)<br>=C2=A0 =C2=A0 =C2=
=A0return s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNECTED;<br>=C2=A0}<br><br=
>+/* ioctl support: allow guest to control/track socket state<br>+ * via mo=
dem control lines (DCD/DTR)<br>+ */<br>+static int<br>+char_socket_ioctl(Ch=
ardev *chr, int cmd, void *arg)<br>+{<br>+ =C2=A0 =C2=A0SocketChardev *s =
=3D SOCKET_CHARDEV(chr);<br>+<br>+ =C2=A0 =C2=A0if(!(s-&gt;is_modemctl)) {<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>+ =C2=A0 =C2=A0}<br>+<b=
r>+ =C2=A0 =C2=A0switch (cmd) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0case CHR_IO=
CTL_SERIAL_GET_TIOCM:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *targ =3D (int *=
)arg;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*targ =3D=
 s-&gt;modem_state;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0case CHR_IOCTL_SERIAL_SET_TIOCM:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int=
 sarg =3D *(int *)arg;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (sarg &amp; CHR_TIOCM_RTS) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_R=
TS;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&=
gt;modem_state &amp;=3D ~(CHR_TIOCM_RTS);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (sarg &amp; CHR_TIOCM_DTR) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIO=
CM_DTR;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else =
{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s-&gt;modem_state &amp;=3D ~(CHR_TIOCM_DTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disconnect if DTR goes l=
ow */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if(s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc=
p_chr_disconnect(chr);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
fault:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>+ =
=C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0return 0;<br>+}<br>+<br>=C2=A0static =
void char_socket_class_init(ObjectClass *oc, void *data)<br>=C2=A0{<br>=C2=
=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDEV_CLASS(oc);<br>@@ -1516,6 +158=
4,7 @@ static void char_socket_class_init(ObjectClass *oc, void *data)<br>=
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_add_client =3D tcp_chr_add_client;<br>=C2=A0=
 =C2=A0 =C2=A0cc-&gt;chr_add_watch =3D tcp_chr_add_watch;<br>=C2=A0 =C2=A0 =
=C2=A0cc-&gt;chr_update_read_handler =3D tcp_chr_update_read_handler;<br>+ =
=C2=A0 =C2=A0cc-&gt;chr_ioctl =3D char_socket_ioctl;<br><br>=C2=A0 =C2=A0 =
=C2=A0object_class_property_add(oc, &quot;addr&quot;, &quot;SocketAddress&q=
uot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_get_addr, NULL,<br=
>diff --git a/chardev/char.c b/chardev/char.c<br>index a9b8c5a9aa..601d818f=
81 100644<br>--- a/chardev/char.c<br>+++ b/chardev/char.c<br>@@ -928,6 +928=
,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0},{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quo=
t;logappend&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type=
 =3D QEMU_OPT_BOOL,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;modemctl&quot;,<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br>=C2=A0#ifdef CON=
FIG_LINUX<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;tight&quot;,<br>diff --git a/qap=
i/char.json b/qapi/char.json<br>index 58338ed62d..f352bd6350 100644<br>--- =
a/qapi/char.json<br>+++ b/qapi/char.json<br>@@ -271,6 +271,9 @@<br>=C2=A0# =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then attempt a reconnect after th=
e given number of seconds.<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Setting this to zero disables this function. (default: 0)<br>=C2=A0#=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Since: 2.2)<br>+# @modemctl: al=
low guest to use modem control signals to control/monitor<br>+# =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the socket state (CD follows is_connected, D=
TR influences<br>+# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connect/accept=
) (default: false) (Since: 5.2)<br>=C2=A0#<br>=C2=A0# Since: 1.4<br>=C2=A0#=
#<br>@@ -284,6 +287,7 @@<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;*telnet&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;*tn3270&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*websocket&#39;: &#39;bool&#39;,<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*modemctl&#39;: &#39;bool&#39;,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*reconnect&#39;: &#=
39;int&#39; },<br>=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br=
><br>diff --git a/qemu-options.hx b/qemu-options.hx<br>index 459c916d3d..f0=
9072afbf 100644<br>--- a/qemu-options.hx<br>+++ b/qemu-options.hx<br>@@ -29=
91,11 +2991,13 @@ DEFHEADING(Character device options:)<br>=C2=A0DEF(&quot;=
chardev&quot;, HAS_ARG, QEMU_OPTION_chardev,<br>=C2=A0 =C2=A0 =C2=A0&quot;-=
chardev help\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev null,id=3Did[,mu=
x=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>- =C2=A0 =C2=
=A0&quot;-chardev socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4]=
[,ipv6][,nodelay][,reconnect=3Dseconds]\n&quot;<br>- =C2=A0 =C2=A0&quot; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [,server][,nowait][,telnet][,websocket][,reconn=
ect=3Dseconds][,mux=3Don|off]\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,=
tls-authz=3DID] (tcp)\n&quot;<br>- =C2=A0 =C2=A0&quot;-chardev socket,id=3D=
id,path=3Dpath[,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds]=
\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,mux=3Don|of=
f][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|of=
f] (unix)\n&quot;<br>+ =C2=A0 =C2=A0&quot;-chardev socket,id=3Did[,host=3Dh=
ost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodelay]\n&quot;<br>+ =C2=A0 =C2=
=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,reconnect=3Dseconds][,server][,nowa=
it][,telnet][,websocket]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [,modemctl][,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]=
\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,tls-creds=
=3DID][,tls-authz=3DID] (tcp)\n&quot;<br>+ =C2=A0 =C2=A0&quot;-chardev sock=
et,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket]\n&quot;<br>+ =
=C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,reconnect=3Dseconds][,mod=
emctl][,mux=3Don|off][,logfile=3DPATH]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [,logappend=3Don|off][,abstract=3Don|off][,tight=
=3Don|off] (unix)\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev udp,id=3Did=
[,host=3Dhost],port=3Dport[,localaddr=3Dlocaladdr]\n&quot;<br>=C2=A0 =C2=A0=
 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,localport=3Dlocalport][,ipv4][,=
ipv6][,mux=3Don|off]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [,logfile=3DPATH][,logappend=3Don|off]\n&quot;</font><br></di=
v></div>
</blockquote></div><div><br></div><div>This feature will need some new test=
s in tests/test-char.c.<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d51b1c05b6a9a215--

