Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14292DED57
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 06:36:34 +0100 (CET)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqUuv-0002wl-Dj
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 00:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrin@gorski.net>) id 1kqUsk-0001ts-UA
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 00:34:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrin@gorski.net>) id 1kqUsg-0000ze-6a
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 00:34:18 -0500
Received: by mail-ej1-x630.google.com with SMTP id x16so6253493ejj.7
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 21:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gorski-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BV2oq2YWi5QrJzHcIevaU3FRKQwqlHXDwiRSs7P2O8s=;
 b=TPbP71wnomRxG/gGQ9CELDnZkA/+cjhnGZJXNGAe8O//g2tIO6zQRM5WqM6nx1ZrE8
 scx/SbATxLtfcQUWaveL/Xvb9Hdzg41xaQonbn7HKzWdFYiF2c5ECAzBDm7/GNUUoBGr
 y+1TCc0E7mWbPag3qG/HCQsjAxIXoTSsH/Xy41NR9L2BLe6P3zHmlxsubasfq1ak+Pv5
 xyAvfcD1KzdcTSBz2n1NVcZteIe5itAKToSe1x1FlJlFZdwB0+pzGCHNPLovMuzYt3lb
 k3yGCKrPzVicQSyTKqPYgtY7fircD/kycVA2ywll8zjudVd5mUjHtrwhKAwfs7pXz7Hr
 jNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BV2oq2YWi5QrJzHcIevaU3FRKQwqlHXDwiRSs7P2O8s=;
 b=WRedyxgH2Ag/AE7OkmIpPH9NYKfg1vv1NLZW6foJ12NOqd+TitEpfMI5e6oLNGUj/t
 4MlhbF2I+GmrFdenda3b1JFP9bbDWDiILsXHxYBKG/4X/IzDDnC1DZAO9Hy+PcryUvso
 tiD3fH1P4S3+Ywnr/EB/GY1TLdcx5IIbPoap7JSFXECpt0ssRaSUIy4ZdrhIELsmaifd
 1yy0DbiJbfdpZG42Q8slkWV7z+XRpvxseQFeKcQSkACe4JaHwlGd3KyaPQmJja/R2JO2
 QfrBk4Q43pAibAlTsGwwgfjXoB2r8poUtyup8n+j2061iavOeNIbqmQ6YOcHELCZHe/M
 HKpg==
X-Gm-Message-State: AOAM530XI1gFR7phMAnyztU1as/EObd9qnEV6vKNS+pdj2/ZlXJVaBBO
 Ii8sMYkhIjNybK+AKvoqoGHzL21dQds30Vpgsr4Zhg==
X-Google-Smtp-Source: ABdhPJxD5CVQLfUAn4zhUo4o8BWCgthqfUP0aIy2YUrb9FppGXbgdz4eYsq2kc9qON27xhOSWPnStJFSMeHMbbzAt6g=
X-Received: by 2002:a17:906:3153:: with SMTP id
 e19mr7415288eje.17.1608356051878; 
 Fri, 18 Dec 2020 21:34:11 -0800 (PST)
MIME-Version: 1.0
References: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
 <CAJ+F1C+moy=Bhq=gTGzbutxHCjyqcRKc5bCJLu8AUP4_B7+sYg@mail.gmail.com>
 <CACdcev+VZ5xAgcdv_38QaZRrLv6Ev3LAa6MEeGy6eizjEQ-Hmg@mail.gmail.com>
 <CAJ+F1CK8R1S7i-rBWiDpkk-B9Q-nY-qwLoR_AMF7NAjFX1X1AA@mail.gmail.com>
In-Reply-To: <CAJ+F1CK8R1S7i-rBWiDpkk-B9Q-nY-qwLoR_AMF7NAjFX1X1AA@mail.gmail.com>
From: "Darrin M. Gorski" <darrin@gorski.net>
Date: Sat, 19 Dec 2020 00:34:00 -0500
Message-ID: <CACdcevK5KLJ6fDj4+NtK2TBPkN9qOO2=Pwystpf8P14zOpvQRA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via
 DTR and DCD
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000025195805b6ca9352"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=darrin@gorski.net; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000025195805b6ca9352
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> Yes, but they can override the default behaviour, or just reuse some
code.
>> If it doesn't fit, don't worry about it, we can just start with socket.

Whew.  I spent several hours yesterday trying to figure out how to alter
the base class to support this - DCD could be reasonably simple, but DTR is
another matter.  I will continue to look at that, but I do think moving
forward with sockets (since this patch already works that way) is a good
compromise.

> You can look at char_socket_server_test.

Will do.

- Darrin

On Fri, Dec 18, 2020 at 6:57 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, Dec 17, 2020 at 9:54 PM Darrin M. Gorski <darrin@gorski.net>
> wrote:
>
>>
>> > That sounds like a good idea to me, but others may have different
>> opinions.
>>
>> My original idea was simply to allow DCD to track socket state, because
>> this is what I need.  The DTR idea came from the referenced bug.  The
>> feature defaults to disabled like many of the other edge cases (like tel=
net
>> and tn3270), and it's a reasonably small non-intrusive change.
>>
>> > Can we make this generic over all chardevs by moving it to the base
>> class?
>>
>> I'll take a closer look at the base class. I admit I did not spend much
>> time studying it.  This seemed like a socket specific feature to me.  It
>> seems like it might conflict with other chardevs like pty and serial as
>> they are already using ioctl for interaction with real tty devices.
>>
>
> Yes, but they can override the default behaviour, or just reuse some code=
.
>
> If it doesn't fit, don't worry about it, we can just start with socket.
>
>
>> > This feature will need some new tests in tests/test-char.c.
>>
>> I would be happy to add tests but would need some guidance.
>>
>
> You can look at char_socket_server_test. You can extend
> CharSocketServerTestConfig to check for modemctl behaviour. It will need =
to
> send the ioctl with qemu_chr_fe_ioctl (I admit it wasn't tested so far,
> because only serial and parallel chardev did implement it, and it's not
> easy to test those)
>
> Let me know if you need more help
>
>
>> - Darrin
>>
>> On Thu, Dec 17, 2020 at 9:16 AM Marc-Andr=C3=A9 Lureau <
>> marcandre.lureau@gmail.com> wrote:
>>
>>> Hi
>>>
>>> On Thu, Dec 17, 2020 at 2:54 AM Darrin M. Gorski <darrin@gorski.net>
>>> wrote:
>>>
>>>>
>>>> This patch adds a 'modemctl' option to "-chardev socket" to enable
>>>> control of the socket via the guest serial port.
>>>> The default state of the option is disabled.
>>>>
>>>> 1. disconnect a connected socket when DTR transitions to low, also
>>>> reject new connections while DTR is low.
>>>> 2. provide socket connection status through the carrier detect line (C=
D
>>>> or DCD) on the guest serial port
>>>>
>>>
>>> That sounds like a good idea to me, but others may have different
>>> opinions.
>>>
>>>
>>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1213196
>>>>
>>>> Signed-off-by: Darrin M. Gorski <darrin@gorski.net>
>>>>
>>>>
>>>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>>>> index 213a4c8dd0..94dd28e0cd 100644
>>>> --- a/chardev/char-socket.c
>>>> +++ b/chardev/char-socket.c
>>>> @@ -36,6 +36,7 @@
>>>>  #include "qapi/qapi-visit-sockets.h"
>>>>
>>>>  #include "chardev/char-io.h"
>>>> +#include "chardev/char-serial.h"
>>>>  #include "qom/object.h"
>>>>
>>>>  /***********************************************************/
>>>> @@ -85,6 +86,9 @@ struct SocketChardev {
>>>>      bool connect_err_reported;
>>>>
>>>>      QIOTask *connect_task;
>>>> +
>>>> +    bool is_modemctl;
>>>> +    int modem_state;
>>>>
>>>
>>> Can we make this generic over all chardevs by moving it to the base
>>> class?
>>>
>>>  };
>>>>  typedef struct SocketChardev SocketChardev;
>>>>
>>>> @@ -98,12 +102,18 @@ static void tcp_chr_change_state(SocketChardev *s=
,
>>>> TCPChardevState state)
>>>>  {
>>>>      switch (state) {
>>>>      case TCP_CHARDEV_STATE_DISCONNECTED:
>>>> +        if(s->is_modemctl) {
>>>> +            s->modem_state &=3D ~(CHR_TIOCM_CAR);
>>>> +        }
>>>>          break;
>>>>      case TCP_CHARDEV_STATE_CONNECTING:
>>>>          assert(s->state =3D=3D TCP_CHARDEV_STATE_DISCONNECTED);
>>>>          break;
>>>>      case TCP_CHARDEV_STATE_CONNECTED:
>>>>          assert(s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING);
>>>> +        if(s->is_modemctl) {
>>>> +            s->modem_state |=3D CHR_TIOCM_CAR;
>>>> +        }
>>>>          break;
>>>>      }
>>>>      s->state =3D state;
>>>> @@ -947,6 +957,12 @@ static void tcp_chr_accept(QIONetListener
>>>> *listener,
>>>>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>>>>      tcp_chr_set_client_ioc_name(chr, cioc);
>>>>      tcp_chr_new_client(chr, cioc);
>>>> +
>>>> +    if(s->is_modemctl) {
>>>> +        if(!(s->modem_state & CHR_TIOCM_DTR)) {
>>>> +            tcp_chr_disconnect(chr); /* disconnect if DTR is low */
>>>> +        }
>>>> +    }
>>>>  }
>>>>
>>>>
>>>> @@ -1322,12 +1338,17 @@ static void qmp_chardev_open_socket(Chardev
>>>> *chr,
>>>>      bool is_tn3270      =3D sock->has_tn3270  ? sock->tn3270  : false=
;
>>>>      bool is_waitconnect =3D sock->has_wait    ? sock->wait    : false=
;
>>>>      bool is_websock     =3D sock->has_websocket ? sock->websocket :
>>>> false;
>>>> +    bool is_modemctl     =3D sock->has_modemctl ? sock->modemctl : fa=
lse;
>>>>      int64_t reconnect   =3D sock->has_reconnect ? sock->reconnect : 0=
;
>>>>      SocketAddress *addr;
>>>>
>>>>      s->is_listen =3D is_listen;
>>>>      s->is_telnet =3D is_telnet;
>>>>      s->is_tn3270 =3D is_tn3270;
>>>> +    s->is_modemctl =3D is_modemctl;
>>>> +    if(is_modemctl) {
>>>> +      s->modem_state =3D CHR_TIOCM_CTS | CHR_TIOCM_DSR;
>>>> +    }
>>>>      s->is_websock =3D is_websock;
>>>>      s->do_nodelay =3D do_nodelay;
>>>>      if (sock->tls_creds) {
>>>> @@ -1448,6 +1469,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
,
>>>> ChardevBackend *backend,
>>>>      sock->tls_creds =3D g_strdup(qemu_opt_get(opts, "tls-creds"));
>>>>      sock->has_tls_authz =3D qemu_opt_get(opts, "tls-authz");
>>>>      sock->tls_authz =3D g_strdup(qemu_opt_get(opts, "tls-authz"));
>>>> +    sock->has_modemctl =3D qemu_opt_get(opts, "modemctl");
>>>> +    sock->modemctl =3D qemu_opt_get_bool(opts, "modemctl", false);
>>>>
>>>>      addr =3D g_new0(SocketAddressLegacy, 1);
>>>>      if (path) {
>>>> @@ -1501,6 +1524,51 @@ char_socket_get_connected(Object *obj, Error
>>>> **errp)
>>>>      return s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED;
>>>>  }
>>>>
>>>> +/* ioctl support: allow guest to control/track socket state
>>>> + * via modem control lines (DCD/DTR)
>>>> + */
>>>> +static int
>>>> +char_socket_ioctl(Chardev *chr, int cmd, void *arg)
>>>> +{
>>>> +    SocketChardev *s =3D SOCKET_CHARDEV(chr);
>>>> +
>>>> +    if(!(s->is_modemctl)) {
>>>> +        return -ENOTSUP;
>>>> +    }
>>>> +
>>>> +    switch (cmd) {
>>>> +        case CHR_IOCTL_SERIAL_GET_TIOCM:
>>>> +            {
>>>> +                int *targ =3D (int *)arg;
>>>> +                *targ =3D s->modem_state;
>>>> +            }
>>>> +            break;
>>>> +        case CHR_IOCTL_SERIAL_SET_TIOCM:
>>>> +            {
>>>> +                int sarg =3D *(int *)arg;
>>>> +                if (sarg & CHR_TIOCM_RTS) {
>>>> +                    s->modem_state |=3D CHR_TIOCM_RTS;
>>>> +                } else {
>>>> +                    s->modem_state &=3D ~(CHR_TIOCM_RTS);
>>>> +                }
>>>> +                if (sarg & CHR_TIOCM_DTR) {
>>>> +                    s->modem_state |=3D CHR_TIOCM_DTR;
>>>> +                } else {
>>>> +                    s->modem_state &=3D ~(CHR_TIOCM_DTR);
>>>> +                    /* disconnect if DTR goes low */
>>>> +                    if(s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {
>>>> +                        tcp_chr_disconnect(chr);
>>>> +                    }
>>>> +                }
>>>> +            }
>>>> +            break;
>>>> +        default:
>>>> +            return -ENOTSUP;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  static void char_socket_class_init(ObjectClass *oc, void *data)
>>>>  {
>>>>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
>>>> @@ -1516,6 +1584,7 @@ static void char_socket_class_init(ObjectClass
>>>> *oc, void *data)
>>>>      cc->chr_add_client =3D tcp_chr_add_client;
>>>>      cc->chr_add_watch =3D tcp_chr_add_watch;
>>>>      cc->chr_update_read_handler =3D tcp_chr_update_read_handler;
>>>> +    cc->chr_ioctl =3D char_socket_ioctl;
>>>>
>>>>      object_class_property_add(oc, "addr", "SocketAddress",
>>>>                                char_socket_get_addr, NULL,
>>>> diff --git a/chardev/char.c b/chardev/char.c
>>>> index a9b8c5a9aa..601d818f81 100644
>>>> --- a/chardev/char.c
>>>> +++ b/chardev/char.c
>>>> @@ -928,6 +928,9 @@ QemuOptsList qemu_chardev_opts =3D {
>>>>          },{
>>>>              .name =3D "logappend",
>>>>              .type =3D QEMU_OPT_BOOL,
>>>> +        },{
>>>> +            .name =3D "modemctl",
>>>> +            .type =3D QEMU_OPT_BOOL,
>>>>  #ifdef CONFIG_LINUX
>>>>          },{
>>>>              .name =3D "tight",
>>>> diff --git a/qapi/char.json b/qapi/char.json
>>>> index 58338ed62d..f352bd6350 100644
>>>> --- a/qapi/char.json
>>>> +++ b/qapi/char.json
>>>> @@ -271,6 +271,9 @@
>>>>  #             then attempt a reconnect after the given number of
>>>> seconds.
>>>>  #             Setting this to zero disables this function. (default: =
0)
>>>>  #             (Since: 2.2)
>>>> +# @modemctl: allow guest to use modem control signals to
>>>> control/monitor
>>>> +#            the socket state (CD follows is_connected, DTR influence=
s
>>>> +#            connect/accept) (default: false) (Since: 5.2)
>>>>  #
>>>>  # Since: 1.4
>>>>  ##
>>>> @@ -284,6 +287,7 @@
>>>>              '*telnet': 'bool',
>>>>              '*tn3270': 'bool',
>>>>              '*websocket': 'bool',
>>>> +            '*modemctl': 'bool',
>>>>              '*reconnect': 'int' },
>>>>    'base': 'ChardevCommon' }
>>>>
>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>> index 459c916d3d..f09072afbf 100644
>>>> --- a/qemu-options.hx
>>>> +++ b/qemu-options.hx
>>>> @@ -2991,11 +2991,13 @@ DEFHEADING(Character device options:)
>>>>  DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>>>>      "-chardev help\n"
>>>>      "-chardev
>>>> null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
>>>> -    "-chardev
>>>> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,node=
lay][,reconnect=3Dseconds]\n"
>>>> -    "
>>>> [,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds][,mux=3Do=
n|off]\n"
>>>> -    "
>>>> [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DI=
D] (tcp)\n"
>>>> -    "-chardev
>>>> socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket][,rec=
onnect=3Dseconds]\n"
>>>> -    "
>>>> [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|o=
ff][,tight=3Don|off]
>>>> (unix)\n"
>>>> +    "-chardev
>>>> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,node=
lay]\n"
>>>> +    "
>>>> [,reconnect=3Dseconds][,server][,nowait][,telnet][,websocket]\n"
>>>> +    "
>>>> [,modemctl][,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
>>>> +    "         [,tls-creds=3DID][,tls-authz=3DID] (tcp)\n"
>>>> +    "-chardev
>>>> socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket]\n"
>>>> +    "
>>>> [,reconnect=3Dseconds][,modemctl][,mux=3Don|off][,logfile=3DPATH]\n"
>>>> +    "         [,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|o=
ff]
>>>> (unix)\n"
>>>>      "-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dloca=
laddr]\n"
>>>>      "         [,localport=3Dlocalport][,ipv4][,ipv6][,mux=3Don|off]\n=
"
>>>>      "         [,logfile=3DPATH][,logappend=3Don|off]\n"
>>>>
>>>
>>> This feature will need some new tests in tests/test-char.c.
>>>
>>> --
>>> Marc-Andr=C3=A9 Lureau
>>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000025195805b6ca9352
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><div>&gt;&gt; Yes, but they can override the defa=
ult behaviour, or just reuse some code.</div><div>&gt;&gt; If it doesn&#39;=
t fit, don&#39;t worry about it, we can just start with socket.</div></div>=
<div><br></div><div>Whew.=C2=A0 I spent several hours=C2=A0yesterday trying=
 to figure out how to alter the base class to support this - DCD could be r=
easonably simple, but DTR is another matter.=C2=A0 I will continue to look =
at that, but I do think moving forward with sockets (since this patch alrea=
dy works that way) is a good compromise.</div><div><br></div><div>&gt; You =
can look at char_socket_server_test.</div><div><br></div><div>Will do.</div=
><div><br></div><div>- Darrin</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 6:57 AM Marc-And=
r=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.=
lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 202=
0 at 9:54 PM Darrin M. Gorski &lt;<a href=3D"mailto:darrin@gorski.net" targ=
et=3D"_blank">darrin@gorski.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">&gt; That sounds like a good idea to me, but others may =
have different opinions.</div><div></div><div><br></div><div>My original id=
ea was simply to allow DCD to track socket state,=C2=A0because this is what=
 I need.=C2=A0 The DTR idea came from the referenced bug.=C2=A0 The feature=
 defaults to disabled like many of the other edge cases (like telnet and tn=
3270), and it&#39;s a reasonably small non-intrusive change.</div><div><br>=
</div><div>&gt; Can we make this generic over all chardevs by moving it to =
the base class?</div><div></div><div><br></div><div>I&#39;ll take a closer =
look at the base class. I admit I did not spend much time studying it.=C2=
=A0 This seemed like a socket=C2=A0specific feature to me.=C2=A0 It seems l=
ike it might conflict=C2=A0with other chardevs like pty and serial as they =
are already using ioctl for interaction with real tty devices.</div></div><=
/blockquote><div><br></div><div>Yes, but they can override the default beha=
viour, or just reuse some code.</div><div><br></div><div>If it doesn&#39;t =
fit, don&#39;t worry about it, we can just start with socket.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div></div><div>&gt; This feature will need some new tests in tests/te=
st-char.c.</div><div><br></div><div>I would be happy to add tests but would=
 need some guidance.</div></div></blockquote><div><br></div><div>You can lo=
ok at char_socket_server_test. You can extend CharSocketServerTestConfig to=
 check for modemctl behaviour. It will need to send the ioctl with qemu_chr=
_fe_ioctl (I admit it wasn&#39;t tested so far, because only serial and par=
allel chardev did implement it, and it&#39;s not easy to test those)</div><=
div><br></div><div>Let me know if you need more help<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
>- Darrin</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Dec 17, 2020 at 9:16 AM Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 2:5=
4 AM Darrin M. Gorski &lt;<a href=3D"mailto:darrin@gorski.net" target=3D"_b=
lank">darrin@gorski.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div><font face=3D"monospace"><br><=
/font></div><div><font face=3D"monospace">This patch adds a &#39;modemctl&#=
39; option to &quot;-chardev socket&quot; to enable control of the socket v=
ia the guest serial port.</font></div><div><div><font face=3D"monospace">Th=
e default state of the option is disabled.</font></div><div><font face=3D"m=
onospace"><br></font></div><div></div></div><div><span style=3D"font-family=
:monospace">1. disconnect a connected socket when DTR transitions to low, a=
lso reject new connections while DTR is low.</span><br></div><div><div><fon=
t face=3D"monospace">2. provide socket connection status through the carrie=
r detect line (CD or DCD) on the guest serial port</font></div></div></div>=
</blockquote><div><br></div><div>That sounds like a good idea to me, but ot=
hers may have different opinions.</div><div> <br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div><font face=3D"monospace=
"><br></font></div><div><pre style=3D"padding:0px;margin-top:0px;margin-bot=
tom:0px;color:rgb(0,0,0);font-size:13.3333px">Buglink: <a href=3D"https://b=
ugs.launchpad.net/qemu/+bug/1213196" target=3D"_blank">https://bugs.launchp=
ad.net/qemu/+bug/1213196</a></pre><pre style=3D"padding:0px;margin-top:0px;=
margin-bottom:0px;color:rgb(0,0,0);font-size:13.3333px">Signed-off-by: Darr=
in M. Gorski &lt;<a href=3D"mailto:darrin@gorski.net" target=3D"_blank">dar=
rin@gorski.net</a>&gt;</pre></div><div><font face=3D"monospace"><br>diff --=
git a/chardev/char-socket.c b/chardev/char-socket.c<br>index 213a4c8dd0..94=
dd28e0cd 100644<br>--- a/chardev/char-socket.c<br>+++ b/chardev/char-socket=
.c<br>@@ -36,6 +36,7 @@<br>=C2=A0#include &quot;qapi/qapi-visit-sockets.h&q=
uot;<br><br>=C2=A0#include &quot;chardev/char-io.h&quot;<br>+#include &quot=
;chardev/char-serial.h&quot;<br>=C2=A0#include &quot;qom/object.h&quot;<br>=
<br>=C2=A0/***********************************************************/<br>=
@@ -85,6 +86,9 @@ struct SocketChardev {<br>=C2=A0 =C2=A0 =C2=A0bool connec=
t_err_reported;<br><br>=C2=A0 =C2=A0 =C2=A0QIOTask *connect_task;<br>+<br>+=
 =C2=A0 =C2=A0bool is_modemctl;<br>+ =C2=A0 =C2=A0int modem_state;<br></fon=
t></div></div></blockquote><div><br></div><div>Can we make this generic ove=
r all chardevs by moving it to the base class?</div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><font face=
=3D"monospace">=C2=A0};<br>=C2=A0typedef struct SocketChardev SocketChardev=
;<br><br>@@ -98,12 +102,18 @@ static void tcp_chr_change_state(SocketCharde=
v *s, TCPChardevState state)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0switch (stat=
e) {<br>=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STATE_DISCONNECTED:<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0s-&gt;modem_state &amp;=3D ~(CHR_TIOCM_CAR);<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=
=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STATE_CONNECTING:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0assert(s-&gt;state =3D=3D TCP_CHARDEV_STATE_DISCONNECTED);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0case TC=
P_CHARDEV_STATE_CONNECTED:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s-&g=
t;state =3D=3D TCP_CHARDEV_STATE_CONNECTING);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if(s-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-=
&gt;modem_state |=3D CHR_TIOCM_CAR;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0=
 =C2=A0 =C2=A0s-&gt;state =3D state;<br>@@ -947,6 +957,12 @@ static void tc=
p_chr_accept(QIONetListener *listener,<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_chang=
e_state(s, TCP_CHARDEV_STATE_CONNECTING);<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_se=
t_client_ioc_name(chr, cioc);<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr=
, cioc);<br>+<br>+ =C2=A0 =C2=A0if(s-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if(!(s-&gt;modem_state &amp; CHR_TIOCM_DTR)) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_disconnect(chr); /* disconnect if DT=
R is low */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0}<br>=C2=A0=
}<br><br><br>@@ -1322,12 +1338,17 @@ static void qmp_chardev_open_socket(Ch=
ardev *chr,<br>=C2=A0 =C2=A0 =C2=A0bool is_tn3270 =C2=A0 =C2=A0 =C2=A0=3D s=
ock-&gt;has_tn3270 =C2=A0? sock-&gt;tn3270 =C2=A0: false;<br>=C2=A0 =C2=A0 =
=C2=A0bool is_waitconnect =3D sock-&gt;has_wait =C2=A0 =C2=A0? sock-&gt;wai=
t =C2=A0 =C2=A0: false;<br>=C2=A0 =C2=A0 =C2=A0bool is_websock =C2=A0 =C2=
=A0 =3D sock-&gt;has_websocket ? sock-&gt;websocket : false;<br>+ =C2=A0 =
=C2=A0bool is_modemctl =C2=A0 =C2=A0 =3D sock-&gt;has_modemctl ? sock-&gt;m=
odemctl : false;<br>=C2=A0 =C2=A0 =C2=A0int64_t reconnect =C2=A0 =3D sock-&=
gt;has_reconnect ? sock-&gt;reconnect : 0;<br>=C2=A0 =C2=A0 =C2=A0SocketAdd=
ress *addr;<br><br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_listen =3D is_listen;<br>=
=C2=A0 =C2=A0 =C2=A0s-&gt;is_telnet =3D is_telnet;<br>=C2=A0 =C2=A0 =C2=A0s=
-&gt;is_tn3270 =3D is_tn3270;<br>+ =C2=A0 =C2=A0s-&gt;is_modemctl =3D is_mo=
demctl;<br>+ =C2=A0 =C2=A0if(is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0s-&gt;=
modem_state =3D CHR_TIOCM_CTS | CHR_TIOCM_DSR;<br>+ =C2=A0 =C2=A0}<br>=C2=
=A0 =C2=A0 =C2=A0s-&gt;is_websock =3D is_websock;<br>=C2=A0 =C2=A0 =C2=A0s-=
&gt;do_nodelay =3D do_nodelay;<br>=C2=A0 =C2=A0 =C2=A0if (sock-&gt;tls_cred=
s) {<br>@@ -1448,6 +1469,8 @@ static void qemu_chr_parse_socket(QemuOpts *o=
pts, ChardevBackend *backend,<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;tls_creds =3D=
 g_strdup(qemu_opt_get(opts, &quot;tls-creds&quot;));<br>=C2=A0 =C2=A0 =C2=
=A0sock-&gt;has_tls_authz =3D qemu_opt_get(opts, &quot;tls-authz&quot;);<br=
>=C2=A0 =C2=A0 =C2=A0sock-&gt;tls_authz =3D g_strdup(qemu_opt_get(opts, &qu=
ot;tls-authz&quot;));<br>+ =C2=A0 =C2=A0sock-&gt;has_modemctl =3D qemu_opt_=
get(opts, &quot;modemctl&quot;);<br>+ =C2=A0 =C2=A0sock-&gt;modemctl =3D qe=
mu_opt_get_bool(opts, &quot;modemctl&quot;, false);<br><br>=C2=A0 =C2=A0 =
=C2=A0addr =3D g_new0(SocketAddressLegacy, 1);<br>=C2=A0 =C2=A0 =C2=A0if (p=
ath) {<br>@@ -1501,6 +1524,51 @@ char_socket_get_connected(Object *obj, Err=
or **errp)<br>=C2=A0 =C2=A0 =C2=A0return s-&gt;state =3D=3D TCP_CHARDEV_STA=
TE_CONNECTED;<br>=C2=A0}<br><br>+/* ioctl support: allow guest to control/t=
rack socket state<br>+ * via modem control lines (DCD/DTR)<br>+ */<br>+stat=
ic int<br>+char_socket_ioctl(Chardev *chr, int cmd, void *arg)<br>+{<br>+ =
=C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>+<br>+ =C2=A0 =C2=
=A0if(!(s-&gt;is_modemctl)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTS=
UP;<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0switch (cmd) {<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_SERIAL_GET_TIOCM:<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int *targ =3D (int *)arg;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*targ =3D s-&gt;modem_state;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bre=
ak;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_SERIAL_SET_TIOCM:<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sarg =3D *(int *)arg;<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sarg &amp; CHR_TIOCM_RTS) {<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&=
gt;modem_state |=3D CHR_TIOCM_RTS;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state &amp;=3D ~(CHR_TIOCM_RTS);<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sarg &amp; CHR_TIOCM_DTR) =
{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s-&gt;modem_state |=3D CHR_TIOCM_DTR;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state &amp;=3D ~(CHR_TIOCM_D=
TR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* disconnect if DTR goes low */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;state =3D=3D TCP_CHARDEV_STA=
TE_CONNECTED) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_disconnect(chr);<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOTSUP;<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0retur=
n 0;<br>+}<br>+<br>=C2=A0static void char_socket_class_init(ObjectClass *oc=
, void *data)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDE=
V_CLASS(oc);<br>@@ -1516,6 +1584,7 @@ static void char_socket_class_init(Ob=
jectClass *oc, void *data)<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_add_client =3D=
 tcp_chr_add_client;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_add_watch =3D tcp_ch=
r_add_watch;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_update_read_handler =3D tcp_=
chr_update_read_handler;<br>+ =C2=A0 =C2=A0cc-&gt;chr_ioctl =3D char_socket=
_ioctl;<br><br>=C2=A0 =C2=A0 =C2=A0object_class_property_add(oc, &quot;addr=
&quot;, &quot;SocketAddress&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0char_socket_get_addr, NULL,<br>diff --git a/chardev/char.c b/chardev/cha=
r.c<br>index a9b8c5a9aa..601d818f81 100644<br>--- a/chardev/char.c<br>+++ b=
/chardev/char.c<br>@@ -928,6 +928,9 @@ QemuOptsList qemu_chardev_opts =3D {=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;logappend&quot;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0},{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &q=
uot;modemctl&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D=
 QEMU_OPT_BOOL,<br>=C2=A0#ifdef CONFIG_LINUX<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0},{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &qu=
ot;tight&quot;,<br>diff --git a/qapi/char.json b/qapi/char.json<br>index 58=
338ed62d..f352bd6350 100644<br>--- a/qapi/char.json<br>+++ b/qapi/char.json=
<br>@@ -271,6 +271,9 @@<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 then attempt a reconnect after the given number of seconds.<br>=C2=A0# =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Setting this to zero disables thi=
s function. (default: 0)<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (Since: 2.2)<br>+# @modemctl: allow guest to use modem control signals =
to control/monitor<br>+# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the socke=
t state (CD follows is_connected, DTR influences<br>+# =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0connect/accept) (default: false) (Since: 5.2)<br>=C2=
=A0#<br>=C2=A0# Since: 1.4<br>=C2=A0##<br>@@ -284,6 +287,7 @@<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*telnet&#39;: &#39;bool&#39;,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*tn3270&#39;: &#39;bo=
ol&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*websocket=
&#39;: &#39;bool&#39;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*=
modemctl&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;*reconnect&#39;: &#39;int&#39; },<br>=C2=A0 =C2=A0&#39;base&#39=
;: &#39;ChardevCommon&#39; }<br><br>diff --git a/qemu-options.hx b/qemu-opt=
ions.hx<br>index 459c916d3d..f09072afbf 100644<br>--- a/qemu-options.hx<br>=
+++ b/qemu-options.hx<br>@@ -2991,11 +2991,13 @@ DEFHEADING(Character devic=
e options:)<br>=C2=A0DEF(&quot;chardev&quot;, HAS_ARG, QEMU_OPTION_chardev,=
<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev help\n&quot;<br>=C2=A0 =C2=A0 =C2=A0=
&quot;-chardev null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don=
|off]\n&quot;<br>- =C2=A0 =C2=A0&quot;-chardev socket,id=3Did[,host=3Dhost]=
,port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodelay][,reconnect=3Dseconds]\n&quot=
;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,server][,nowait][,=
telnet][,websocket][,reconnect=3Dseconds][,mux=3Don|off]\n&quot;<br>- =C2=
=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,logfile=3DPATH][,logappend=
=3Don|off][,tls-creds=3DID][,tls-authz=3DID] (tcp)\n&quot;<br>- =C2=A0 =C2=
=A0&quot;-chardev socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,we=
bsocket][,reconnect=3Dseconds]\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,ab=
stract=3Don|off][,tight=3Don|off] (unix)\n&quot;<br>+ =C2=A0 =C2=A0&quot;-c=
hardev socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,no=
delay]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,recon=
nect=3Dseconds][,server][,nowait][,telnet][,websocket]\n&quot;<br>+ =C2=A0 =
=C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,modemctl][,mux=3Don|off][,logfil=
e=3DPATH][,logappend=3Don|off]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 [,tls-creds=3DID][,tls-authz=3DID] (tcp)\n&quot;<br>+ =C2=
=A0 =C2=A0&quot;-chardev socket,id=3Did,path=3Dpath[,server][,nowait][,teln=
et][,websocket]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [,reconnect=3Dseconds][,modemctl][,mux=3Don|off][,logfile=3DPATH]\n&quo=
t;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,logappend=3Don|of=
f][,abstract=3Don|off][,tight=3Don|off] (unix)\n&quot;<br>=C2=A0 =C2=A0 =C2=
=A0&quot;-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dlocala=
ddr]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,lo=
calport=3Dlocalport][,ipv4][,ipv6][,mux=3Don|off]\n&quot;<br>=C2=A0 =C2=A0 =
=C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,logfile=3DPATH][,logappend=3Don|=
off]\n&quot;</font><br></div></div>
</blockquote></div><div><br></div><div>This feature will need some new test=
s in tests/test-char.c.<br></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=
=A9 Lureau<br></div></div>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>

--00000000000025195805b6ca9352--

