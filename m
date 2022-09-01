Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305CE5A97FA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:01:30 +0200 (CEST)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjp2-0003wt-Op
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTjmP-00026d-N1
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:58:45 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTjmN-0007CS-8j
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:58:45 -0400
Received: by mail-lj1-x234.google.com with SMTP id b26so10882920ljk.12
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=I1W2BovgMqyQTL1/sMc5n005k1NtKqgnyQ17az3Vk+4=;
 b=GozJjSoz28ZiIds8AWsdNnyBPGM9Akm5wSAA/99ws/4CXm3Xc8C7BURkERa3+l+We8
 pSmLmPvqYwL2JOUBYNrBW7O6GSf4PYbZwNpXl8zn3oCW88CWeRnqaR1M01B3d33x9G3r
 wIYJG+tW20srjBxE8SM/ALYTMvfiigmtnLden7GGO8GpzaJyGrFWgywcr5wpnhMHLBQY
 b0lxivTGQ3WrrLGLWqdfEjO1XnmZipXAIfz6wceV14HfpaO+2szmZwcoPoVVwttVoJta
 EUFmKYNSa8xhr7jlJL4TgC6h5jUN7EUHzqeGNgJRCCK12FTXJwoTtnq4LqPCn2yNjR0R
 knpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I1W2BovgMqyQTL1/sMc5n005k1NtKqgnyQ17az3Vk+4=;
 b=azutftkcroOIkcnkfAxirVvB24dD1AmQiHUV01B90cou7sdbvDOge69ZQBEjOjl6KB
 l/JrSvvcwwGqczi6f4D+u/jpjpWbjnh9ybvIJ+RArSkpiu1lCJEqgxeqqqRU+FIdLAEd
 AqQFA7wRkTeC6N+MiWmy2l+Mdwqu4Rwj8uVA32RbOa0svYubjfbRFloajQcH5iWBcAt6
 N6nubR2brLPN+La5qFusooiY/tiq3VfvtL0iYv+ZrYcFPuil5im2jkFgE/FbJcIY3V0A
 vMoUq7a4E9pTAUr6zTEo/yFfWR1FJJRjlbvVAxrAh++5YnmBgCLOKK9LuS85L4BkP+EA
 Z5Og==
X-Gm-Message-State: ACgBeo2ZwaGg60lgykuRE3AJItI9m2iXx3hu5GGhteFUARkBx82DceLj
 Nxx5LF7tAkZniLNrFvmZ/H88LzMKCUUaZA1A8aQ=
X-Google-Smtp-Source: AA6agR5unkIlcIKTvuCAJDQETILw5T1puaGDQOJGbQ/mTSmCd02yl1QNzBFsHEcWacjsOtBIQLRKmiO3+DbOJFhWgNQ=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr9196412ljh.267.1662037109618; Thu, 01
 Sep 2022 05:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-50-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 16:58:18 +0400
Message-ID: <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000085bd4205e79d2b4a"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

--00000000000085bd4205e79d2b4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Random failure was observed when running qtests on Windows due to
> "Broken pipe" detected by qmp_fd_receive(). What happened is that
> the qtest executable sends testing data over a socket to the QEMU
> under test but no response is received. The errno of the recv()
> call from the qtest executable indicates ETIMEOUT, due to the qmp
> chardev's tcp_chr_read() is never called to receive testing data
> hence no response is sent to the other side.
>
> tcp_chr_read() is registered as the callback of the socket watch
> GSource. The reason of the callback not being called by glib, is
> that the source check fails to indicate the source is ready. There
> are two socket watch sources created to monitor the same socket
> event object from the char-socket backend in update_ioc_handlers().
>
During the source check phase, qio_channel_socket_source_check()
> calls WSAEnumNetworkEvents() to discovers occurrences of network
> events for the indicated socket, clear internal network event records,
> and reset the event object. Testing shows that if we don't reset the
> event object by not passing the event handle to WSAEnumNetworkEvents()
> the symptom goes away and qtest runs very stably.
>
> It looks we don't need to call WSAEnumNetworkEvents() at all, as we
> don't parse the result of WSANETWORKEVENTS returned from this API.
> We use select() to poll the socket status. Fix this instability by
> dropping the WSAEnumNetworkEvents() call.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

What clears the event then?



> ---
> During the testing, I removed the following codes in update_ioc_handlers(=
):
>
>     remove_hup_source(s);
>     s->hup_source =3D qio_channel_create_watch(s->ioc, G_IO_HUP);
>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
>                           chr, NULL);
>     g_source_attach(s->hup_source, chr->gcontext);
>
> and such change also makes the symptom go away.
>
> And if I moved the above codes to the beginning, before the call to
> io_add_watch_poll(), the symptom also goes away.
>
> It seems two sources watching on the same socket event object is
> the key that leads to the instability. The order of adding a source
> watch seems to also play a role but I can't explain why.
> Hopefully a Windows and glib expert could explain this behavior.
>
>
Feel free to leave that comment in the commit message.

This is strange, as both sources should have different events, clearing one
shouldn't affect the other.

I guess it's WSAEnumNetworkEvents clearing of the internal network event
records that is problematic.

Can you check if you replace the call with ResetEvent() everything works?



>  io/channel-watch.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/io/channel-watch.c b/io/channel-watch.c
> index 89f3c8a88a..e34d86e810 100644
> --- a/io/channel-watch.c
> +++ b/io/channel-watch.c
> @@ -115,17 +115,13 @@ static gboolean
>  qio_channel_socket_source_check(GSource *source)
>  {
>      static struct timeval tv0;
> -
>      QIOChannelSocketSource *ssource =3D (QIOChannelSocketSource *)source=
;
> -    WSANETWORKEVENTS ev;
>      fd_set rfds, wfds, xfds;
>
>      if (!ssource->condition) {
>          return 0;
>      }
>
> -    WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
> -
>      FD_ZERO(&rfds);
>      FD_ZERO(&wfds);
>      FD_ZERO(&xfds);
>

Unrelated, after this chunk, there is
        FD_SET((SOCKET)ssource->socket, &rfds);

it seems we can drop the cast. Feel free to send another patch.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000085bd4205e79d2b4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:49 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Random failure was observed when running qtests on Windows due to<br>
&quot;Broken pipe&quot; detected by qmp_fd_receive(). What happened is that=
<br>
the qtest executable sends testing data over a socket to the QEMU<br>
under test but no response is received. The errno of the recv()<br>
call from the qtest executable indicates ETIMEOUT, due to the qmp<br>
chardev&#39;s tcp_chr_read() is never called to receive testing data<br>
hence no response is sent to the other side.<br>
<br>
tcp_chr_read() is registered as the callback of the socket watch<br>
GSource. The reason of the callback not being called by glib, is<br>
that the source check fails to indicate the source is ready. There<br>
are two socket watch sources created to monitor the same socket<br>
event object from the char-socket backend in update_ioc_handlers(). <br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
During the source check phase, qio_channel_socket_source_check()<br>
calls WSAEnumNetworkEvents() to discovers occurrences of network<br>
events for the indicated socket, clear internal network event records,<br>
and reset the event object. Testing shows that if we don&#39;t reset the<br=
>
event object by not passing the event handle to WSAEnumNetworkEvents()<br>
the symptom goes away and qtest runs very stably.<br>
<br>
It looks we don&#39;t need to call WSAEnumNetworkEvents() at all, as we<br>
don&#39;t parse the result of WSANETWORKEVENTS returned from this API.<br>
We use select() to poll the socket status. Fix this instability by<br>
dropping the WSAEnumNetworkEvents() call.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>What clears the event then?</div><br><div>=C2=A0<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
---<br>
During the testing, I removed the following codes in update_ioc_handlers():=
<br>
<br>
=C2=A0 =C2=A0 remove_hup_source(s);<br>
=C2=A0 =C2=A0 s-&gt;hup_source =3D qio_channel_create_watch(s-&gt;ioc, G_IO=
_HUP);<br>
=C2=A0 =C2=A0 g_source_set_callback(s-&gt;hup_source, (GSourceFunc)tcp_chr_=
hup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 chr, NULL);<br>
=C2=A0 =C2=A0 g_source_attach(s-&gt;hup_source, chr-&gt;gcontext);<br>
<br>
and such change also makes the symptom go away.<br>
<br>
And if I moved the above codes to the beginning, before the call to<br>
io_add_watch_poll(), the symptom also goes away.<br>
<br>
It seems two sources watching on the same socket event object is<br>
the key that leads to the instability. The order of adding a source<br>
watch seems to also play a role but I can&#39;t explain why.<br>
Hopefully a Windows and glib expert could explain this behavior.<br>
<br></blockquote><div><br></div><div>Feel free to leave that comment in the=
 commit message.</div><div><br></div><div>This is strange, as both sources =
should have different events, clearing one shouldn&#39;t affect the other.<=
/div><div><br></div><div>I guess it&#39;s WSAEnumNetworkEvents clearing of =
the internal network event records that is problematic.</div><div><br></div=
><div>Can you check if you replace the call with ResetEvent() everything wo=
rks?<br></div><div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
=C2=A0io/channel-watch.c | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/io/channel-watch.c b/io/channel-watch.c<br>
index 89f3c8a88a..e34d86e810 100644<br>
--- a/io/channel-watch.c<br>
+++ b/io/channel-watch.c<br>
@@ -115,17 +115,13 @@ static gboolean<br>
=C2=A0qio_channel_socket_source_check(GSource *source)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static struct timeval tv0;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0QIOChannelSocketSource *ssource =3D (QIOChannelSocketSo=
urce *)source;<br>
-=C2=A0 =C2=A0 WSANETWORKEVENTS ev;<br>
=C2=A0 =C2=A0 =C2=A0fd_set rfds, wfds, xfds;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!ssource-&gt;condition) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 WSAEnumNetworkEvents(ssource-&gt;socket, ssource-&gt;ioc-&gt=
;event, &amp;ev);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0FD_ZERO(&amp;rfds);<br>
=C2=A0 =C2=A0 =C2=A0FD_ZERO(&amp;wfds);<br>
=C2=A0 =C2=A0 =C2=A0FD_ZERO(&amp;xfds);<br></blockquote><div><br></div><div=
>Unrelated, after this chunk, there is=C2=A0 <br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 FD_SET((SOCKET)ssource-&gt;socket, &amp;rfds);<br></div></div=
><div><br></div><div>it seems we can drop the cast. Feel free to send anoth=
er patch.<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Ma=
rc-Andr=C3=A9 Lureau<br></div></div>

--00000000000085bd4205e79d2b4a--

