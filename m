Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DD5ACA4F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 08:07:36 +0200 (CEST)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV5Gg-0006zd-Mr
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 02:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oV5Dw-0005OE-Ui
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:04:45 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:41811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oV5Du-0000YC-GG
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:04:44 -0400
Received: by mail-lj1-x22f.google.com with SMTP id b19so8131886ljf.8
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 23:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=t3HsWAuAHKnztW9gmI8ntJuG2panfCYIeeKTRf7gQQI=;
 b=VSn+FpkCOjzfIWdVbhOHe6lEV1l9eb0Ddh3nsDio5zREz8bLZmeA4pOK6CkbqRiUAr
 Y1tLJE5WMEBqVvPK2Ey2jdNtpA64iQX4urw62sfIH6dNLo+4fLBYtFCfsVia1EouFae4
 LmnkF9GAOpbn1Cdct0wB6mQF6QKfXrESbzUo1LVd9TvvKNdoIfAe+r8OMwUIGFyxjSVQ
 7JvaACaURI2QFRkEYusqMZCfQ28x8RpwvWbithjlPd5Svis+LNugOMcFoftZzD7+LZ12
 4rMvxQeAX564NVVUEUgA2Kpji5Gi95UHTXdaCQgEvfKZZcv1V5BP/cEihoS0DlSd8sdf
 VWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=t3HsWAuAHKnztW9gmI8ntJuG2panfCYIeeKTRf7gQQI=;
 b=ZTd3Ygc6a/LCbRl1bQ/SssodHEHElJsUyuvAr13boOEgORWJ5qSMpSq1tE0NsyYt6L
 unYQ7gt9Q/jkDOXavcKz9UPCw5QySTugsQv3+hLEuomMzMmVmse1wuBMwvaZG4SBw+tR
 ZrlXJmlGBqKlydGesFqp47a/ZvmGXQmtj2pFjw5DxIqvtKZLmFgqd27G0XtZEHKyisSY
 Z4k+9s0/e/ng13sVzT9acH8UYxkCDFiital1kxBQNdsiMjg4WB5sPd4akjsrAFDmMt9d
 CWVq0DY1JEsHO9J2u47TuG92JseCLa9djL+MCSHYaVHY9Hn1O2AaIHIodYz16lG+uE3G
 tIWQ==
X-Gm-Message-State: ACgBeo1XGfV30c4qPGl5TTz7JLyJrrOmnTcx+zrw1QuK+hHj5iIbFcXZ
 pA3cOsKxROXj4kM3ofz6nmYS4a2Oe5n+BmWOmtc=
X-Google-Smtp-Source: AA6agR6HFqupKyzjhKUsloqSN5Tz4iEG+nUB+MyPnm0Kmhd317kiHaN2ZijQCKY1EaTC+TcEWs0M0/bOWwHG638EYME=
X-Received: by 2002:a05:651c:451:b0:263:7cfc:1c0b with SMTP id
 g17-20020a05651c045100b002637cfc1c0bmr10716888ljg.94.1662357879717; Sun, 04
 Sep 2022 23:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
In-Reply-To: <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 10:04:27 +0400
Message-ID: <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e9052505e7e7dae3"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9052505e7e7dae3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Sep 4, 2022 at 10:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Thu, Sep 1, 2022 at 8:58 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Wed, Aug 24, 2022 at 2:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> >> Random failure was observed when running qtests on Windows due to
> >> "Broken pipe" detected by qmp_fd_receive(). What happened is that
> >> the qtest executable sends testing data over a socket to the QEMU
> >> under test but no response is received. The errno of the recv()
> >> call from the qtest executable indicates ETIMEOUT, due to the qmp
> >> chardev's tcp_chr_read() is never called to receive testing data
> >> hence no response is sent to the other side.
> >>
> >> tcp_chr_read() is registered as the callback of the socket watch
> >> GSource. The reason of the callback not being called by glib, is
> >> that the source check fails to indicate the source is ready. There
> >> are two socket watch sources created to monitor the same socket
> >> event object from the char-socket backend in update_ioc_handlers().
> >>
> >> During the source check phase, qio_channel_socket_source_check()
> >> calls WSAEnumNetworkEvents() to discovers occurrences of network
> >> events for the indicated socket, clear internal network event records,
> >> and reset the event object. Testing shows that if we don't reset the
> >> event object by not passing the event handle to WSAEnumNetworkEvents()
> >> the symptom goes away and qtest runs very stably.
> >>
> >> It looks we don't need to call WSAEnumNetworkEvents() at all, as we
> >> don't parse the result of WSANETWORKEVENTS returned from this API.
> >> We use select() to poll the socket status. Fix this instability by
> >> dropping the WSAEnumNetworkEvents() call.
> >>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> >
> > What clears the event then?
> >
>
> It seems we don't need to clear the event as everything still works as
> expected.
>

Well, it can "work" but are you sure it doesn't have a busy loop?

>>
> >> ---
> >> During the testing, I removed the following codes in
> update_ioc_handlers():
> >>
> >>     remove_hup_source(s);
> >>     s->hup_source =3D qio_channel_create_watch(s->ioc, G_IO_HUP);
> >>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
> >>                           chr, NULL);
> >>     g_source_attach(s->hup_source, chr->gcontext);
> >>
> >> and such change also makes the symptom go away.
> >>
> >> And if I moved the above codes to the beginning, before the call to
> >> io_add_watch_poll(), the symptom also goes away.
> >>
> >> It seems two sources watching on the same socket event object is
> >> the key that leads to the instability. The order of adding a source
> >> watch seems to also play a role but I can't explain why.
> >> Hopefully a Windows and glib expert could explain this behavior.
> >>
> >
> > Feel free to leave that comment in the commit message.
>
> Sure, will add the above message into the commit in v2.
>
> >
> > This is strange, as both sources should have different events, clearing
> one shouldn't affect the other.
>
> Both sources have the same event, as one QIO channel only has one
> socket, and one socket can only be bound to one event.
>

 "one socket can only be bound to one event", is that a WSAEventSelect
limitation?


> >
> > I guess it's WSAEnumNetworkEvents clearing of the internal network even=
t
> records that is problematic.
> >
> > Can you check if you replace the call with ResetEvent() everything work=
s?
>
> No, ResetEvent() does not work, and is not recommended by MSDN [1]
> too, which says:
>

It probably works to some extent (I see glib is using it
https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/giowin32.c#L903), What
you mean is that it doesn't solve the issue, I guess.

>
> The proper way to reset the state of an event object used with the
> WSAEventSelect function is to pass the handle of the event object to
> the WSAEnumNetworkEvents function in the hEventObject parameter. This
> will reset the event object and adjust the status of active FD events
> on the socket in an atomic fashion.
>
>
This is not what you want though if you have multiple event objects for the
same socket.


> [1]
> https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-w=
saeventselect
>
> >
> >
> >>
> >>  io/channel-watch.c | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/io/channel-watch.c b/io/channel-watch.c
> >> index 89f3c8a88a..e34d86e810 100644
> >> --- a/io/channel-watch.c
> >> +++ b/io/channel-watch.c
> >> @@ -115,17 +115,13 @@ static gboolean
> >>  qio_channel_socket_source_check(GSource *source)
> >>  {
> >>      static struct timeval tv0;
> >> -
> >>      QIOChannelSocketSource *ssource =3D (QIOChannelSocketSource *)sou=
rce;
> >> -    WSANETWORKEVENTS ev;
> >>      fd_set rfds, wfds, xfds;
> >>
> >>      if (!ssource->condition) {
> >>          return 0;
> >>      }
> >>
> >> -    WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
> >> -
> >>      FD_ZERO(&rfds);
> >>      FD_ZERO(&wfds);
> >>      FD_ZERO(&xfds);
> >
> >
> > Unrelated, after this chunk, there is
> >         FD_SET((SOCKET)ssource->socket, &rfds);
> >
> > it seems we can drop the cast. Feel free to send another patch.
> >
>
> Yeah, this cast is unnecessary. Will spin a new patch in v2. Thanks!
>
> Regards,
> Bin
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e9052505e7e7dae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Sep 4, 2022 at 10:24 AM Bin Meng &lt;=
<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Sep 1, 2022=
 at 8:58 PM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Wed, Aug 24, 2022 at 2:49 PM Bin Meng &lt;<a href=3D"mailto:bmeng.c=
n@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Random failure was observed when running qtests on Windows due to<=
br>
&gt;&gt; &quot;Broken pipe&quot; detected by qmp_fd_receive(). What happene=
d is that<br>
&gt;&gt; the qtest executable sends testing data over a socket to the QEMU<=
br>
&gt;&gt; under test but no response is received. The errno of the recv()<br=
>
&gt;&gt; call from the qtest executable indicates ETIMEOUT, due to the qmp<=
br>
&gt;&gt; chardev&#39;s tcp_chr_read() is never called to receive testing da=
ta<br>
&gt;&gt; hence no response is sent to the other side.<br>
&gt;&gt;<br>
&gt;&gt; tcp_chr_read() is registered as the callback of the socket watch<b=
r>
&gt;&gt; GSource. The reason of the callback not being called by glib, is<b=
r>
&gt;&gt; that the source check fails to indicate the source is ready. There=
<br>
&gt;&gt; are two socket watch sources created to monitor the same socket<br=
>
&gt;&gt; event object from the char-socket backend in update_ioc_handlers()=
.<br>
&gt;&gt;<br>
&gt;&gt; During the source check phase, qio_channel_socket_source_check()<b=
r>
&gt;&gt; calls WSAEnumNetworkEvents() to discovers occurrences of network<b=
r>
&gt;&gt; events for the indicated socket, clear internal network event reco=
rds,<br>
&gt;&gt; and reset the event object. Testing shows that if we don&#39;t res=
et the<br>
&gt;&gt; event object by not passing the event handle to WSAEnumNetworkEven=
ts()<br>
&gt;&gt; the symptom goes away and qtest runs very stably.<br>
&gt;&gt;<br>
&gt;&gt; It looks we don&#39;t need to call WSAEnumNetworkEvents() at all, =
as we<br>
&gt;&gt; don&#39;t parse the result of WSANETWORKEVENTS returned from this =
API.<br>
&gt;&gt; We use select() to poll the socket status. Fix this instability by=
<br>
&gt;&gt; dropping the WSAEnumNetworkEvents() call.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.c=
om" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; What clears the event then?<br>
&gt;<br>
<br>
It seems we don&#39;t need to clear the event as everything still works as =
expected.<br></blockquote><div><br></div>Well, it can &quot;work&quot; but =
are you sure it doesn&#39;t have a busy loop?</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; During the testing, I removed the following codes in update_ioc_ha=
ndlers():<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0remove_hup_source(s);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0s-&gt;hup_source =3D qio_channel_create_watch(s=
-&gt;ioc, G_IO_HUP);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0g_source_set_callback(s-&gt;hup_source, (GSourc=
eFunc)tcp_chr_hup,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chr, NULL);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0g_source_attach(s-&gt;hup_source, chr-&gt;gcont=
ext);<br>
&gt;&gt;<br>
&gt;&gt; and such change also makes the symptom go away.<br>
&gt;&gt;<br>
&gt;&gt; And if I moved the above codes to the beginning, before the call t=
o<br>
&gt;&gt; io_add_watch_poll(), the symptom also goes away.<br>
&gt;&gt;<br>
&gt;&gt; It seems two sources watching on the same socket event object is<b=
r>
&gt;&gt; the key that leads to the instability. The order of adding a sourc=
e<br>
&gt;&gt; watch seems to also play a role but I can&#39;t explain why.<br>
&gt;&gt; Hopefully a Windows and glib expert could explain this behavior.<b=
r>
&gt;&gt;<br>
&gt;<br>
&gt; Feel free to leave that comment in the commit message.<br>
<br>
Sure, will add the above message into the commit in v2.<br>
<br>
&gt;<br>
&gt; This is strange, as both sources should have different events, clearin=
g one shouldn&#39;t affect the other.<br>
<br>
Both sources have the same event, as one QIO channel only has one<br>
socket, and one socket can only be bound to one event.<br></blockquote><div=
><br></div><div>=C2=A0&quot;one socket can only be bound to one event&quot;=
, is that a WSAEventSelect limitation?<br></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; I guess it&#39;s WSAEnumNetworkEvents clearing of the internal network=
 event records that is problematic.<br>
&gt;<br>
&gt; Can you check if you replace the call with ResetEvent() everything wor=
ks?<br>
<br>
No, ResetEvent() does not work, and is not recommended by MSDN [1]<br>
too, which says:<br></blockquote><div><br></div><div>It probably works to s=
ome extent (I see glib is using it <a href=3D"https://gitlab.gnome.org/GNOM=
E/glib/-/blob/main/glib/giowin32.c#L903">https://gitlab.gnome.org/GNOME/gli=
b/-/blob/main/glib/giowin32.c#L903</a>), What you mean is that it doesn&#39=
;t solve the issue, I guess. </div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
The proper way to reset the state of an event object used with the<br>
WSAEventSelect function is to pass the handle of the event object to<br>
the WSAEnumNetworkEvents function in the hEventObject parameter. This<br>
will reset the event object and adjust the status of active FD events<br>
on the socket in an atomic fashion.<br>
<br></blockquote><div><br></div><div>This is not what you want though if yo=
u have multiple event objects for the same socket.<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
[1] <a href=3D"https://docs.microsoft.com/en-us/windows/win32/api/winsock2/=
nf-winsock2-wsaeventselect" rel=3D"noreferrer" target=3D"_blank">https://do=
cs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-wsaeventselec=
t</a><br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 io/channel-watch.c | 4 ----<br>
&gt;&gt;=C2=A0 1 file changed, 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/io/channel-watch.c b/io/channel-watch.c<br>
&gt;&gt; index 89f3c8a88a..e34d86e810 100644<br>
&gt;&gt; --- a/io/channel-watch.c<br>
&gt;&gt; +++ b/io/channel-watch.c<br>
&gt;&gt; @@ -115,17 +115,13 @@ static gboolean<br>
&gt;&gt;=C2=A0 qio_channel_socket_source_check(GSource *source)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 static struct timeval tv0;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QIOChannelSocketSource *ssource =3D (QIOChanne=
lSocketSource *)source;<br>
&gt;&gt; -=C2=A0 =C2=A0 WSANETWORKEVENTS ev;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fd_set rfds, wfds, xfds;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (!ssource-&gt;condition) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 WSAEnumNetworkEvents(ssource-&gt;socket, ssource-&g=
t;ioc-&gt;event, &amp;ev);<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 FD_ZERO(&amp;rfds);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 FD_ZERO(&amp;wfds);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 FD_ZERO(&amp;xfds);<br>
&gt;<br>
&gt;<br>
&gt; Unrelated, after this chunk, there is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FD_SET((SOCKET)ssource-&gt;socket, &a=
mp;rfds);<br>
&gt;<br>
&gt; it seems we can drop the cast. Feel free to send another patch.<br>
&gt;<br>
<br>
Yeah, this cast is unnecessary. Will spin a new patch in v2. Thanks!<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e9052505e7e7dae3--

