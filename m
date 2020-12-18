Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB552DE23B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:58:56 +0100 (CET)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEPO-0004SZ-2s
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqENu-0003gr-0O
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:57:22 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kqENp-0004zA-Tu
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:57:21 -0500
Received: by mail-ej1-x636.google.com with SMTP id ce23so2809762ejb.8
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BqB5FlU/C113SzekQ36ySHY0Ao6zpLFQNowiFLFXI0Y=;
 b=MbqKMkuwYUowaWINqogz+BUvViUYXAyqGwtTsaFyunrA0j4fZ8PRZEWdVZzyEpZmzu
 P7Jd5Wr1FAQXr7h3VbALsiAIeN5f/ANukERrOawPSKdFQ6FdF+CcNisNjJ4Q+MDHni84
 IYHfXBYN0BFABMnH6qn58gXx1l82hcdTpYBThujrftJq46/kBH+f+8G4pI96LqQdYLeA
 tbaSL47DTGsERVvTfRIQJlCNnF2AdLC/3wCUxvc0jOutpe60/l3RCJGQLMrArR9ROBLO
 /2x5rz/9dHyEz6mCTn5tEB2g/vHfxDUQrybkyQKXzCQt2O9MyjYzgfbV/RjYUwaFdLUV
 v+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BqB5FlU/C113SzekQ36ySHY0Ao6zpLFQNowiFLFXI0Y=;
 b=Nfuk1BQ2bH7WXyRDB8mq6fWlUrm07Rtv86ClpS9yFo37PpGWW4rqDwg3MzSWrjOLto
 gCamCjmEUGdwv8iwa7lYLJJmtVIhO9bEOikNQCda4jtZtR7FWLgHrxjsV+5bumwUzn94
 BWcXH6Qud+GaBi546j90HYukAW2GIdYAcbxcEH+1+tE1DW2PiwmXHaYh1MJO7o1mK8nj
 whNUqEnOSqy1eEax9gxzQJTjV9mmpb5tqE0PE6nVMdn6Z2yFXERG3W0T2qkxdPGGjpQu
 Bqa6njB3p87xYFk4+uMKmmEZHkAdDBoNl00QogG8RuZwn3vW9FmfjJtM/kx0r+ul60YS
 MYyQ==
X-Gm-Message-State: AOAM530Xd1C0xjw/EZIJ3M9iMKAMYyh+RqF/1bh7Ts3LoYJBlz3iT5u8
 NklSSA21GDeb2jjWv8kOXZmaM7OiO4k0wx5v92U=
X-Google-Smtp-Source: ABdhPJxa7anx0rKjffati7whAa3lUJTUOV7vFv3HfCurIuH+ONck9/bbyhExFYROCb0W8evUxMWZdp4fquT9edxVckE=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr3653877ejx.389.1608292635388; 
 Fri, 18 Dec 2020 03:57:15 -0800 (PST)
MIME-Version: 1.0
References: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
 <CAJ+F1C+moy=Bhq=gTGzbutxHCjyqcRKc5bCJLu8AUP4_B7+sYg@mail.gmail.com>
 <CACdcev+VZ5xAgcdv_38QaZRrLv6Ev3LAa6MEeGy6eizjEQ-Hmg@mail.gmail.com>
In-Reply-To: <CACdcev+VZ5xAgcdv_38QaZRrLv6Ev3LAa6MEeGy6eizjEQ-Hmg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Dec 2020 15:57:02 +0400
Message-ID: <CAJ+F1CK8R1S7i-rBWiDpkk-B9Q-nY-qwLoR_AMF7NAjFX1X1AA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via
 DTR and DCD
To: "Darrin M. Gorski" <darrin@gorski.net>
Content-Type: multipart/alternative; boundary="0000000000003a3c2d05b6bbcf3b"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003a3c2d05b6bbcf3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 9:54 PM Darrin M. Gorski <darrin@gorski.net> wrote:

>
> > That sounds like a good idea to me, but others may have different
> opinions.
>
> My original idea was simply to allow DCD to track socket state, because
> this is what I need.  The DTR idea came from the referenced bug.  The
> feature defaults to disabled like many of the other edge cases (like teln=
et
> and tn3270), and it's a reasonably small non-intrusive change.
>
> > Can we make this generic over all chardevs by moving it to the base
> class?
>
> I'll take a closer look at the base class. I admit I did not spend much
> time studying it.  This seemed like a socket specific feature to me.  It
> seems like it might conflict with other chardevs like pty and serial as
> they are already using ioctl for interaction with real tty devices.
>

Yes, but they can override the default behaviour, or just reuse some code.

If it doesn't fit, don't worry about it, we can just start with socket.


> > This feature will need some new tests in tests/test-char.c.
>
> I would be happy to add tests but would need some guidance.
>

You can look at char_socket_server_test. You can extend
CharSocketServerTestConfig to check for modemctl behaviour. It will need to
send the ioctl with qemu_chr_fe_ioctl (I admit it wasn't tested so far,
because only serial and parallel chardev did implement it, and it's not
easy to test those)

Let me know if you need more help


> - Darrin
>
> On Thu, Dec 17, 2020 at 9:16 AM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
>
>> Hi
>>
>> On Thu, Dec 17, 2020 at 2:54 AM Darrin M. Gorski <darrin@gorski.net>
>> wrote:
>>
>>>
>>> This patch adds a 'modemctl' option to "-chardev socket" to enable
>>> control of the socket via the guest serial port.
>>> The default state of the option is disabled.
>>>
>>> 1. disconnect a connected socket when DTR transitions to low, also
>>> reject new connections while DTR is low.
>>> 2. provide socket connection status through the carrier detect line (CD
>>> or DCD) on the guest serial port
>>>
>>
>> That sounds like a good idea to me, but others may have different
>> opinions.
>>
>>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1213196
>>>
>>> Signed-off-by: Darrin M. Gorski <darrin@gorski.net>
>>>
>>>
>>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>>> index 213a4c8dd0..94dd28e0cd 100644
>>> --- a/chardev/char-socket.c
>>> +++ b/chardev/char-socket.c
>>> @@ -36,6 +36,7 @@
>>>  #include "qapi/qapi-visit-sockets.h"
>>>
>>>  #include "chardev/char-io.h"
>>> +#include "chardev/char-serial.h"
>>>  #include "qom/object.h"
>>>
>>>  /***********************************************************/
>>> @@ -85,6 +86,9 @@ struct SocketChardev {
>>>      bool connect_err_reported;
>>>
>>>      QIOTask *connect_task;
>>> +
>>> +    bool is_modemctl;
>>> +    int modem_state;
>>>
>>
>> Can we make this generic over all chardevs by moving it to the base clas=
s?
>>
>>  };
>>>  typedef struct SocketChardev SocketChardev;
>>>
>>> @@ -98,12 +102,18 @@ static void tcp_chr_change_state(SocketChardev *s,
>>> TCPChardevState state)
>>>  {
>>>      switch (state) {
>>>      case TCP_CHARDEV_STATE_DISCONNECTED:
>>> +        if(s->is_modemctl) {
>>> +            s->modem_state &=3D ~(CHR_TIOCM_CAR);
>>> +        }
>>>          break;
>>>      case TCP_CHARDEV_STATE_CONNECTING:
>>>          assert(s->state =3D=3D TCP_CHARDEV_STATE_DISCONNECTED);
>>>          break;
>>>      case TCP_CHARDEV_STATE_CONNECTED:
>>>          assert(s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING);
>>> +        if(s->is_modemctl) {
>>> +            s->modem_state |=3D CHR_TIOCM_CAR;
>>> +        }
>>>          break;
>>>      }
>>>      s->state =3D state;
>>> @@ -947,6 +957,12 @@ static void tcp_chr_accept(QIONetListener *listene=
r,
>>>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>>>      tcp_chr_set_client_ioc_name(chr, cioc);
>>>      tcp_chr_new_client(chr, cioc);
>>> +
>>> +    if(s->is_modemctl) {
>>> +        if(!(s->modem_state & CHR_TIOCM_DTR)) {
>>> +            tcp_chr_disconnect(chr); /* disconnect if DTR is low */
>>> +        }
>>> +    }
>>>  }
>>>
>>>
>>> @@ -1322,12 +1338,17 @@ static void qmp_chardev_open_socket(Chardev *ch=
r,
>>>      bool is_tn3270      =3D sock->has_tn3270  ? sock->tn3270  : false;
>>>      bool is_waitconnect =3D sock->has_wait    ? sock->wait    : false;
>>>      bool is_websock     =3D sock->has_websocket ? sock->websocket : fa=
lse;
>>> +    bool is_modemctl     =3D sock->has_modemctl ? sock->modemctl : fal=
se;
>>>      int64_t reconnect   =3D sock->has_reconnect ? sock->reconnect : 0;
>>>      SocketAddress *addr;
>>>
>>>      s->is_listen =3D is_listen;
>>>      s->is_telnet =3D is_telnet;
>>>      s->is_tn3270 =3D is_tn3270;
>>> +    s->is_modemctl =3D is_modemctl;
>>> +    if(is_modemctl) {
>>> +      s->modem_state =3D CHR_TIOCM_CTS | CHR_TIOCM_DSR;
>>> +    }
>>>      s->is_websock =3D is_websock;
>>>      s->do_nodelay =3D do_nodelay;
>>>      if (sock->tls_creds) {
>>> @@ -1448,6 +1469,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts,
>>> ChardevBackend *backend,
>>>      sock->tls_creds =3D g_strdup(qemu_opt_get(opts, "tls-creds"));
>>>      sock->has_tls_authz =3D qemu_opt_get(opts, "tls-authz");
>>>      sock->tls_authz =3D g_strdup(qemu_opt_get(opts, "tls-authz"));
>>> +    sock->has_modemctl =3D qemu_opt_get(opts, "modemctl");
>>> +    sock->modemctl =3D qemu_opt_get_bool(opts, "modemctl", false);
>>>
>>>      addr =3D g_new0(SocketAddressLegacy, 1);
>>>      if (path) {
>>> @@ -1501,6 +1524,51 @@ char_socket_get_connected(Object *obj, Error
>>> **errp)
>>>      return s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED;
>>>  }
>>>
>>> +/* ioctl support: allow guest to control/track socket state
>>> + * via modem control lines (DCD/DTR)
>>> + */
>>> +static int
>>> +char_socket_ioctl(Chardev *chr, int cmd, void *arg)
>>> +{
>>> +    SocketChardev *s =3D SOCKET_CHARDEV(chr);
>>> +
>>> +    if(!(s->is_modemctl)) {
>>> +        return -ENOTSUP;
>>> +    }
>>> +
>>> +    switch (cmd) {
>>> +        case CHR_IOCTL_SERIAL_GET_TIOCM:
>>> +            {
>>> +                int *targ =3D (int *)arg;
>>> +                *targ =3D s->modem_state;
>>> +            }
>>> +            break;
>>> +        case CHR_IOCTL_SERIAL_SET_TIOCM:
>>> +            {
>>> +                int sarg =3D *(int *)arg;
>>> +                if (sarg & CHR_TIOCM_RTS) {
>>> +                    s->modem_state |=3D CHR_TIOCM_RTS;
>>> +                } else {
>>> +                    s->modem_state &=3D ~(CHR_TIOCM_RTS);
>>> +                }
>>> +                if (sarg & CHR_TIOCM_DTR) {
>>> +                    s->modem_state |=3D CHR_TIOCM_DTR;
>>> +                } else {
>>> +                    s->modem_state &=3D ~(CHR_TIOCM_DTR);
>>> +                    /* disconnect if DTR goes low */
>>> +                    if(s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {
>>> +                        tcp_chr_disconnect(chr);
>>> +                    }
>>> +                }
>>> +            }
>>> +            break;
>>> +        default:
>>> +            return -ENOTSUP;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>  static void char_socket_class_init(ObjectClass *oc, void *data)
>>>  {
>>>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
>>> @@ -1516,6 +1584,7 @@ static void char_socket_class_init(ObjectClass
>>> *oc, void *data)
>>>      cc->chr_add_client =3D tcp_chr_add_client;
>>>      cc->chr_add_watch =3D tcp_chr_add_watch;
>>>      cc->chr_update_read_handler =3D tcp_chr_update_read_handler;
>>> +    cc->chr_ioctl =3D char_socket_ioctl;
>>>
>>>      object_class_property_add(oc, "addr", "SocketAddress",
>>>                                char_socket_get_addr, NULL,
>>> diff --git a/chardev/char.c b/chardev/char.c
>>> index a9b8c5a9aa..601d818f81 100644
>>> --- a/chardev/char.c
>>> +++ b/chardev/char.c
>>> @@ -928,6 +928,9 @@ QemuOptsList qemu_chardev_opts =3D {
>>>          },{
>>>              .name =3D "logappend",
>>>              .type =3D QEMU_OPT_BOOL,
>>> +        },{
>>> +            .name =3D "modemctl",
>>> +            .type =3D QEMU_OPT_BOOL,
>>>  #ifdef CONFIG_LINUX
>>>          },{
>>>              .name =3D "tight",
>>> diff --git a/qapi/char.json b/qapi/char.json
>>> index 58338ed62d..f352bd6350 100644
>>> --- a/qapi/char.json
>>> +++ b/qapi/char.json
>>> @@ -271,6 +271,9 @@
>>>  #             then attempt a reconnect after the given number of
>>> seconds.
>>>  #             Setting this to zero disables this function. (default: 0=
)
>>>  #             (Since: 2.2)
>>> +# @modemctl: allow guest to use modem control signals to control/monit=
or
>>> +#            the socket state (CD follows is_connected, DTR influences
>>> +#            connect/accept) (default: false) (Since: 5.2)
>>>  #
>>>  # Since: 1.4
>>>  ##
>>> @@ -284,6 +287,7 @@
>>>              '*telnet': 'bool',
>>>              '*tn3270': 'bool',
>>>              '*websocket': 'bool',
>>> +            '*modemctl': 'bool',
>>>              '*reconnect': 'int' },
>>>    'base': 'ChardevCommon' }
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 459c916d3d..f09072afbf 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -2991,11 +2991,13 @@ DEFHEADING(Character device options:)
>>>  DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>>>      "-chardev help\n"
>>>      "-chardev
>>> null,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
>>> -    "-chardev
>>> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodel=
ay][,reconnect=3Dseconds]\n"
>>> -    "
>>> [,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds][,mux=3Don=
|off]\n"
>>> -    "
>>> [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID=
] (tcp)\n"
>>> -    "-chardev
>>> socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket][,reco=
nnect=3Dseconds]\n"
>>> -    "
>>> [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off][,abstract=3Don|of=
f][,tight=3Don|off]
>>> (unix)\n"
>>> +    "-chardev
>>> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodel=
ay]\n"
>>> +    "
>>> [,reconnect=3Dseconds][,server][,nowait][,telnet][,websocket]\n"
>>> +    "
>>> [,modemctl][,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
>>> +    "         [,tls-creds=3DID][,tls-authz=3DID] (tcp)\n"
>>> +    "-chardev
>>> socket,id=3Did,path=3Dpath[,server][,nowait][,telnet][,websocket]\n"
>>> +    "
>>> [,reconnect=3Dseconds][,modemctl][,mux=3Don|off][,logfile=3DPATH]\n"
>>> +    "         [,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|of=
f]
>>> (unix)\n"
>>>      "-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dlocal=
addr]\n"
>>>      "         [,localport=3Dlocalport][,ipv4][,ipv6][,mux=3Don|off]\n"
>>>      "         [,logfile=3DPATH][,logappend=3Don|off]\n"
>>>
>>
>> This feature will need some new tests in tests/test-char.c.
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003a3c2d05b6bbcf3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 9:54 PM Dar=
rin M. Gorski &lt;<a href=3D"mailto:darrin@gorski.net">darrin@gorski.net</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; That sounds =
like a good idea to me, but others may have different opinions.</div><div><=
/div><div><br></div><div>My original idea was simply to allow DCD to track =
socket state,=C2=A0because this is what I need.=C2=A0 The DTR idea came fro=
m the referenced bug.=C2=A0 The feature defaults to disabled like many of t=
he other edge cases (like telnet and tn3270), and it&#39;s a reasonably sma=
ll non-intrusive change.</div><div><br></div><div>&gt; Can we make this gen=
eric over all chardevs by moving it to the base class?</div><div></div><div=
><br></div><div>I&#39;ll take a closer look at the base class. I admit I di=
d not spend much time studying it.=C2=A0 This seemed like a socket=C2=A0spe=
cific feature to me.=C2=A0 It seems like it might conflict=C2=A0with other =
chardevs like pty and serial as they are already using ioctl for interactio=
n with real tty devices.</div></div></blockquote><div><br></div><div>Yes, b=
ut they can override the default behaviour, or just reuse some code.</div><=
div><br></div><div>If it doesn&#39;t fit, don&#39;t worry about it, we can =
just start with socket.<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>&gt; This feature=
 will need some new tests in tests/test-char.c.</div><div><br></div><div>I =
would be happy to add tests but would need some guidance.</div></div></bloc=
kquote><div><br></div><div>You can look at char_socket_server_test. You can=
 extend CharSocketServerTestConfig to check for modemctl behaviour. It will=
 need to send the ioctl with qemu_chr_fe_ioctl (I admit it wasn&#39;t teste=
d so far, because only serial and parallel chardev did implement it, and it=
&#39;s not easy to test those)</div><div><br></div><div>Let me know if you =
need more help<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div>- Darrin</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 9:16 =
AM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com"=
 target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"l=
tr">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Dec 17, 2020 at 2:54 AM Darrin M. Gorski &lt;<a href=3D"m=
ailto:darrin@gorski.net" target=3D"_blank">darrin@gorski.net</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div><font face=3D"monospace"><br></font></div><div><font face=3D"monospa=
ce">This patch adds a &#39;modemctl&#39; option to &quot;-chardev socket&qu=
ot; to enable control of the socket via the guest serial port.</font></div>=
<div><div><font face=3D"monospace">The default state of the option is disab=
led.</font></div><div><font face=3D"monospace"><br></font></div><div></div>=
</div><div><span style=3D"font-family:monospace">1. disconnect a connected =
socket when DTR transitions to low, also reject new connections while DTR i=
s low.</span><br></div><div><div><font face=3D"monospace">2. provide socket=
 connection status through the carrier detect line (CD or DCD) on the guest=
 serial port</font></div></div></div></blockquote><div><br></div><div>That =
sounds like a good idea to me, but others may have different opinions.</div=
><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><font face=3D"monospace"><br></font></div><div><pre style=3D"=
padding:0px;margin-top:0px;margin-bottom:0px;color:rgb(0,0,0);font-size:13.=
3333px">Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1213196" t=
arget=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1213196</a></pre><pre=
 style=3D"padding:0px;margin-top:0px;margin-bottom:0px;color:rgb(0,0,0);fon=
t-size:13.3333px">Signed-off-by: Darrin M. Gorski &lt;<a href=3D"mailto:dar=
rin@gorski.net" target=3D"_blank">darrin@gorski.net</a>&gt;</pre></div><div=
><font face=3D"monospace"><br>diff --git a/chardev/char-socket.c b/chardev/=
char-socket.c<br>index 213a4c8dd0..94dd28e0cd 100644<br>--- a/chardev/char-=
socket.c<br>+++ b/chardev/char-socket.c<br>@@ -36,6 +36,7 @@<br>=C2=A0#incl=
ude &quot;qapi/qapi-visit-sockets.h&quot;<br><br>=C2=A0#include &quot;chard=
ev/char-io.h&quot;<br>+#include &quot;chardev/char-serial.h&quot;<br>=C2=A0=
#include &quot;qom/object.h&quot;<br><br>=C2=A0/***************************=
********************************/<br>@@ -85,6 +86,9 @@ struct SocketChardev=
 {<br>=C2=A0 =C2=A0 =C2=A0bool connect_err_reported;<br><br>=C2=A0 =C2=A0 =
=C2=A0QIOTask *connect_task;<br>+<br>+ =C2=A0 =C2=A0bool is_modemctl;<br>+ =
=C2=A0 =C2=A0int modem_state;<br></font></div></div></blockquote><div><br><=
/div><div>Can we make this generic over all chardevs by moving it to the ba=
se class?</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div><font face=3D"monospace">=C2=A0};<br>=C2=A0type=
def struct SocketChardev SocketChardev;<br><br>@@ -98,12 +102,18 @@ static =
void tcp_chr_change_state(SocketChardev *s, TCPChardevState state)<br>=C2=
=A0{<br>=C2=A0 =C2=A0 =C2=A0switch (state) {<br>=C2=A0 =C2=A0 =C2=A0case TC=
P_CHARDEV_STATE_DISCONNECTED:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;is_m=
odemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state =
&amp;=3D ~(CHR_TIOCM_CAR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STAT=
E_CONNECTING:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s-&gt;state =3D=
=3D TCP_CHARDEV_STATE_DISCONNECTED);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=
reak;<br>=C2=A0 =C2=A0 =C2=A0case TCP_CHARDEV_STATE_CONNECTED:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONN=
ECTING);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(s-&gt;is_modemctl) {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_CAR;=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bre=
ak;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;state =3D state;<=
br>@@ -947,6 +957,12 @@ static void tcp_chr_accept(QIONetListener *listener=
,<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTI=
NG);<br>=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, cioc);<br>=C2=
=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, cioc);<br>+<br>+ =C2=A0 =C2=A0if(s=
-&gt;is_modemctl) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!(s-&gt;modem_state =
&amp; CHR_TIOCM_DTR)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_c=
hr_disconnect(chr); /* disconnect if DTR is low */<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>+ =C2=A0 =C2=A0}<br>=C2=A0}<br><br><br>@@ -1322,12 +1338,17 =
@@ static void qmp_chardev_open_socket(Chardev *chr,<br>=C2=A0 =C2=A0 =C2=
=A0bool is_tn3270 =C2=A0 =C2=A0 =C2=A0=3D sock-&gt;has_tn3270 =C2=A0? sock-=
&gt;tn3270 =C2=A0: false;<br>=C2=A0 =C2=A0 =C2=A0bool is_waitconnect =3D so=
ck-&gt;has_wait =C2=A0 =C2=A0? sock-&gt;wait =C2=A0 =C2=A0: false;<br>=C2=
=A0 =C2=A0 =C2=A0bool is_websock =C2=A0 =C2=A0 =3D sock-&gt;has_websocket ?=
 sock-&gt;websocket : false;<br>+ =C2=A0 =C2=A0bool is_modemctl =C2=A0 =C2=
=A0 =3D sock-&gt;has_modemctl ? sock-&gt;modemctl : false;<br>=C2=A0 =C2=A0=
 =C2=A0int64_t reconnect =C2=A0 =3D sock-&gt;has_reconnect ? sock-&gt;recon=
nect : 0;<br>=C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br><br>=C2=A0 =C2=A0 =
=C2=A0s-&gt;is_listen =3D is_listen;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_telnet=
 =3D is_telnet;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_tn3270 =3D is_tn3270;<br>+ =
=C2=A0 =C2=A0s-&gt;is_modemctl =3D is_modemctl;<br>+ =C2=A0 =C2=A0if(is_mod=
emctl) {<br>+ =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state =3D CHR_TIOCM_CTS | CHR=
_TIOCM_DSR;<br>+ =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;is_websock =3D=
 is_websock;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;do_nodelay =3D do_nodelay;<br>=C2=
=A0 =C2=A0 =C2=A0if (sock-&gt;tls_creds) {<br>@@ -1448,6 +1469,8 @@ static =
void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,<br>=C2=
=A0 =C2=A0 =C2=A0sock-&gt;tls_creds =3D g_strdup(qemu_opt_get(opts, &quot;t=
ls-creds&quot;));<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;has_tls_authz =3D qemu_op=
t_get(opts, &quot;tls-authz&quot;);<br>=C2=A0 =C2=A0 =C2=A0sock-&gt;tls_aut=
hz =3D g_strdup(qemu_opt_get(opts, &quot;tls-authz&quot;));<br>+ =C2=A0 =C2=
=A0sock-&gt;has_modemctl =3D qemu_opt_get(opts, &quot;modemctl&quot;);<br>+=
 =C2=A0 =C2=A0sock-&gt;modemctl =3D qemu_opt_get_bool(opts, &quot;modemctl&=
quot;, false);<br><br>=C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddressLega=
cy, 1);<br>=C2=A0 =C2=A0 =C2=A0if (path) {<br>@@ -1501,6 +1524,51 @@ char_s=
ocket_get_connected(Object *obj, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0retur=
n s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNECTED;<br>=C2=A0}<br><br>+/* ioc=
tl support: allow guest to control/track socket state<br>+ * via modem cont=
rol lines (DCD/DTR)<br>+ */<br>+static int<br>+char_socket_ioctl(Chardev *c=
hr, int cmd, void *arg)<br>+{<br>+ =C2=A0 =C2=A0SocketChardev *s =3D SOCKET=
_CHARDEV(chr);<br>+<br>+ =C2=A0 =C2=A0if(!(s-&gt;is_modemctl)) {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=
=A0 =C2=A0switch (cmd) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_SER=
IAL_GET_TIOCM:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *targ =3D (int *)arg;<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*targ =3D s-&gt;=
modem_state;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ca=
se CHR_IOCTL_SERIAL_SET_TIOCM:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sarg =
=3D *(int *)arg;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (sarg &amp; CHR_TIOCM_RTS) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_RTS;<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;mod=
em_state &amp;=3D ~(CHR_TIOCM_RTS);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (sarg &amp; CHR_TIOCM_DTR) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;modem_state |=3D CHR_TIOCM_D=
TR;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&=
gt;modem_state &amp;=3D ~(CHR_TIOCM_DTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disconnect if DTR goes low */<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
(s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_d=
isconnect(chr);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>+ =C2=A0 =
=C2=A0}<br>+<br>+ =C2=A0 =C2=A0return 0;<br>+}<br>+<br>=C2=A0static void ch=
ar_socket_class_init(ObjectClass *oc, void *data)<br>=C2=A0{<br>=C2=A0 =C2=
=A0 =C2=A0ChardevClass *cc =3D CHARDEV_CLASS(oc);<br>@@ -1516,6 +1584,7 @@ =
static void char_socket_class_init(ObjectClass *oc, void *data)<br>=C2=A0 =
=C2=A0 =C2=A0cc-&gt;chr_add_client =3D tcp_chr_add_client;<br>=C2=A0 =C2=A0=
 =C2=A0cc-&gt;chr_add_watch =3D tcp_chr_add_watch;<br>=C2=A0 =C2=A0 =C2=A0c=
c-&gt;chr_update_read_handler =3D tcp_chr_update_read_handler;<br>+ =C2=A0 =
=C2=A0cc-&gt;chr_ioctl =3D char_socket_ioctl;<br><br>=C2=A0 =C2=A0 =C2=A0ob=
ject_class_property_add(oc, &quot;addr&quot;, &quot;SocketAddress&quot;,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_get_addr, NULL,<br>diff -=
-git a/chardev/char.c b/chardev/char.c<br>index a9b8c5a9aa..601d818f81 1006=
44<br>--- a/chardev/char.c<br>+++ b/chardev/char.c<br>@@ -928,6 +928,9 @@ Q=
emuOptsList qemu_chardev_opts =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},=
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;logapp=
end&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEM=
U_OPT_BOOL,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;modemctl&quot;,<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_BOOL,<br>=C2=A0#ifdef CONFIG_LIN=
UX<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;tight&quot;,<br>diff --git a/qapi/char.=
json b/qapi/char.json<br>index 58338ed62d..f352bd6350 100644<br>--- a/qapi/=
char.json<br>+++ b/qapi/char.json<br>@@ -271,6 +271,9 @@<br>=C2=A0# =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then attempt a reconnect after the given=
 number of seconds.<br>=C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Se=
tting this to zero disables this function. (default: 0)<br>=C2=A0# =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Since: 2.2)<br>+# @modemctl: allow gues=
t to use modem control signals to control/monitor<br>+# =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0the socket state (CD follows is_connected, DTR infl=
uences<br>+# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connect/accept) (defa=
ult: false) (Since: 5.2)<br>=C2=A0#<br>=C2=A0# Since: 1.4<br>=C2=A0##<br>@@=
 -284,6 +287,7 @@<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*=
telnet&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;*tn3270&#39;: &#39;bool&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;*websocket&#39;: &#39;bool&#39;,<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*modemctl&#39;: &#39;bool&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*reconnect&#39;: &#39;int&#39=
; },<br>=C2=A0 =C2=A0&#39;base&#39;: &#39;ChardevCommon&#39; }<br><br>diff =
--git a/qemu-options.hx b/qemu-options.hx<br>index 459c916d3d..f09072afbf 1=
00644<br>--- a/qemu-options.hx<br>+++ b/qemu-options.hx<br>@@ -2991,11 +299=
1,13 @@ DEFHEADING(Character device options:)<br>=C2=A0DEF(&quot;chardev&qu=
ot;, HAS_ARG, QEMU_OPTION_chardev,<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev he=
lp\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev null,id=3Did[,mux=3Don|off=
][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>- =C2=A0 =C2=A0&quot;-ch=
ardev socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nod=
elay][,reconnect=3Dseconds]\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds]=
[,mux=3Don|off]\n&quot;<br>- =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [,logfile=3DPATH][,logappend=3Don|off][,tls-creds=3DID][,tls-authz=3DID=
] (tcp)\n&quot;<br>- =C2=A0 =C2=A0&quot;-chardev socket,id=3Did,path=3Dpath=
[,server][,nowait][,telnet][,websocket][,reconnect=3Dseconds]\n&quot;<br>- =
=C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,mux=3Don|off][,logfile=3D=
PATH][,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|off] (unix)\n&qu=
ot;<br>+ =C2=A0 =C2=A0&quot;-chardev socket,id=3Did[,host=3Dhost],port=3Dpo=
rt[,to=3Dto][,ipv4][,ipv6][,nodelay]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [,reconnect=3Dseconds][,server][,nowait][,telnet][=
,websocket]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,=
modemctl][,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>+=
 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,tls-creds=3DID][,tls-aut=
hz=3DID] (tcp)\n&quot;<br>+ =C2=A0 =C2=A0&quot;-chardev socket,id=3Did,path=
=3Dpath[,server][,nowait][,telnet][,websocket]\n&quot;<br>+ =C2=A0 =C2=A0&q=
uot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,reconnect=3Dseconds][,modemctl][,mux=3Do=
n|off][,logfile=3DPATH]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [,logappend=3Don|off][,abstract=3Don|off][,tight=3Don|off] (unix=
)\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot;-chardev udp,id=3Did[,host=3Dhost],p=
ort=3Dport[,localaddr=3Dlocaladdr]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [,localport=3Dlocalport][,ipv4][,ipv6][,mux=3Do=
n|off]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [,=
logfile=3DPATH][,logappend=3Don|off]\n&quot;</font><br></div></div>
</blockquote></div><div><br></div><div>This feature will need some new test=
s in tests/test-char.c.<br></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=
=A9 Lureau<br></div></div>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003a3c2d05b6bbcf3b--

