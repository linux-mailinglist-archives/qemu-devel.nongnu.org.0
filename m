Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1757B1DC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:38:29 +0200 (CEST)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4Hs-0000jz-4c
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oE4GE-0007aa-IH
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:36:46 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oE4Fz-0004Md-4B
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:36:46 -0400
Received: by mail-lf1-x12d.google.com with SMTP id e28so28781358lfj.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hoEbBI3G4zCxFIWR9PXDRYeY61hp+CWFuLQz/BkHwY=;
 b=E9aoargMWfkO6uz7N1VT42DdODUxHfVe2vp+VfchHNc0n2rJ6Hg4iLy+OGgrlWMEiD
 MmxRSZ8rPINrLDAPOBrwqrwAHJzUrJNUBKYJ0k/rLsPqeSEe+NVNGmJbLpxZ5w9xnG1f
 ZXn8ppV7x/4y13NZP1oU8Kd55uVYT+qhLSIxvmBSgn+n+Qs/Tg4JowKSHiNYQu4MJtW1
 /qtvJQGu3NE7xcAQWaO0a/Z0qkOXJhLutCFbCh2+SiiSww3RUXw7LBHT5LipxX2uH0A5
 NSSfMayXRMVaYlRTp0ksUbTvw+wemN9KqiPWXyPIVM6+gHXwpS5Hmkv1/9+24VvR99QG
 GoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hoEbBI3G4zCxFIWR9PXDRYeY61hp+CWFuLQz/BkHwY=;
 b=rgdav61vlM5XwD0jWUmakddo7Oua6AU3SwZrmKwNpT0NeP+FhikrZ8iyHf+E1cIXaa
 hXuQJCNiMxllg8RpQEvno17uuhn2ak8evT66jG1TVMH2a70wnL4ME5VEkVEjeIsXjlRa
 orwkmjkVxx+DsZA4l+SNBLAylM/ZJ/2+mVOcj2YOok5HR2WlKq8UwjvT9grjOeXhlFDM
 ypIRMHAj2te5hgCnQ2e2ibrzkPsm9uQkrzAwxrGH2rg5X9NyGSu9OSZjA4At4FpYa74Q
 MrL8T6aGLxAkM7P8imLsh89ncjwApPemwzVpfg6d4NPxq8oRLNpfBlS5V/UW7PDrlFhl
 rjRw==
X-Gm-Message-State: AJIora+O5JyZRJAbfi0BgBAXywoiZfPBWWweV/AaxMiV0oYbqUyPksaA
 ApcEV9qedAKhaCH/8sWggXA+WuJEk5Q/usy/77s=
X-Google-Smtp-Source: AGRyM1sOi9F6btHLO3D7Lv5GXl9fUd7HT+cbgX6LzdecTZGG60YsCZTfdB6UX8ToA0Mk8CLs6pujtvyqE7+8awntOdg=
X-Received: by 2002:a05:6512:31d1:b0:489:cfee:3600 with SMTP id
 j17-20020a05651231d100b00489cfee3600mr19473041lfe.432.1658302579076; Wed, 20
 Jul 2022 00:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220720071057.1745-1-hogan.wang@huawei.com>
In-Reply-To: <20220720071057.1745-1-hogan.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Jul 2022 11:36:07 +0400
Message-ID: <CAJ+F1CL6ppZ_J_HK4-hHQG21=cerzBmArL7tkUcy1eYpMLcYUA@mail.gmail.com>
Subject: Re: [PATCH v2] chardev: avoid use-after-free when client disconnect
To: Hogan Wang <hogan.wang@huawei.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 wangxinxin.wang@huawei.com
Content-Type: multipart/alternative; boundary="00000000000027f5a905e437a803"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000027f5a905e437a803
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 20, 2022 at 11:13 AM Hogan Wang via <qemu-devel@nongnu.org>
wrote:

> IOWatchPoll object did not hold the @ioc and @src objects reference,
> then io_watch_poll_prepare execute in IO thread, if IOWatchPoll
> removed by mian thread, then io_watch_poll_prepare access @ioc or
>

mian->main


> @src concurrently lead to coredump.
>
> In IO thread monitor scene, the IO thread used to accept client,
> receive qmp request and handle hung-up event. Main thread used to
> handle qmp request and send response, it will remove IOWatchPoll
> and free @ioc when send response fail, then cause use-after-free
>

I wonder if we are misusing GSources in that case, by removing sources from
different threads.. Could you be more specific about the code path that
leads to that?


> like this:
>
> (gdb) bt
> 0  0x00007f4d121c8edf in g_source_remove_child_source
> (source=3D0x7f4c58003560, child_source=3D0x7f4c58009b10)
> 1  0x00007f4d11e0705c in io_watch_poll_prepare (source=3D0x7f4c58003560,
> timeout=3Dtimeout@entry=3D0x7f4c7fffed94
> 2  0x00007f4d121ca419 in g_main_context_prepare (context=3Dcontext@entry=
=3D0x55a1463f8260,
> priority=3Dpriority@entry=3D0x7f4c7fffee20)
> 3  0x00007f4d121cadeb in g_main_context_iterate (context=3D0x55a1463f8260=
,
> block=3Dblock@entry=3D1, dispatch=3Ddispatch@entry=3D1, self=3Dself@entry
> =3D0x7f4c94002260)
> 4  0x00007f4d121cb21d in g_main_loop_run (loop=3D0x55a146c90920)
> 5  0x00007f4d11de3ea1 in iothread_run (opaque=3D0x55a146411820)
> 6  0x00007f4d11d77470 in qemu_thread_start (args=3D0x55a146b1f3c0)
> 7  0x00007f4d11f2ef3b in ?? () from /usr/lib64/libpthread.so.0
> 8  0x00007f4d120ba550 in clone () from /usr/lib64/libc.so.6
> (gdb) p iwp
> $1 =3D (IOWatchPoll *) 0x7f4c58003560
> (gdb) p *iwp
> $2 =3D {parent =3D {callback_data =3D 0x0,
>                 callback_funcs =3D 0x0,
>                 source_funcs =3D 0x7f4d11f10760 <io_watch_poll_funcs>,
>                 ref_count =3D 1,
>                 context =3D 0x55a1463f8260,
>                 priority =3D 0,
>                 flags =3D 0,
>                 source_id =3D 544,
>                 poll_fds =3D 0x0,
>                 prev =3D 0x55a147a47a30,
>                 next =3D 0x55a14712fb80,
>                 name =3D 0x7f4c580036d0 "chardev-iowatch-charmonitor",
>                 priv =3D 0x7f4c58003060},
>        ioc =3D 0x7f4c580033f0,
>        src =3D 0x7f4c58009b10,
>        fd_can_read =3D 0x7f4d11e0a5d0 <tcp_chr_read_poll>,
>        fd_read =3D 0x7f4d11e0a380 <tcp_chr_read>,
>        opaque =3D 0x55a1463aeea0 }
> (gdb) p iwp->ioc
> $3 =3D (QIOChannel *) 0x7f4c580033f0
> (gdb) p *iwp->ioc
> $4 =3D {parent =3D {class =3D 0x55a14707f400,
>                 free =3D 0x55a146313010,
>                 properties =3D 0x55a147b37b60,
>                 ref =3D 0,
>                 parent =3D 0x0},
>       features =3D 3,
>       name =3D 0x7f4c580085f0 "\240F",
>       ctx =3D 0x0,
>       read_coroutine =3D 0x0,
>       write_coroutine =3D 0x0}
>

That backtrace isn't so useful. If you can produce an ASAN error though,
that would be more explicit. Not a blocker.

>
> Solution: IOWatchPoll object hold the @ioc and @src objects reference
> and release the reference in GSource finalize callback function.
>

ok, if we are not misusing GSource, otherwise seems needless or misleading


>
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> ---
>  chardev/char-io.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char-io.c b/chardev/char-io.c
> index 4451128cba..6b10217a70 100644
> --- a/chardev/char-io.c
> +++ b/chardev/char-io.c
> @@ -55,9 +55,9 @@ static gboolean io_watch_poll_prepare(GSource *source,
>              iwp->ioc, G_IO_IN | G_IO_ERR | G_IO_HUP | G_IO_NVAL);
>          g_source_set_callback(iwp->src, iwp->fd_read, iwp->opaque, NULL)=
;
>          g_source_add_child_source(source, iwp->src);
> -        g_source_unref(iwp->src);
>      } else {
>          g_source_remove_child_source(source, iwp->src);
> +        g_source_unref(iwp->src);
>          iwp->src =3D NULL;
>      }
>      return FALSE;
> @@ -69,9 +69,17 @@ static gboolean io_watch_poll_dispatch(GSource *source=
,
> GSourceFunc callback,
>      return G_SOURCE_CONTINUE;
>  }
>
> +static void io_watch_poll_finalize(GSource *source)
> +{
> +    IOWatchPoll *iwp =3D io_watch_poll_from_source(source);
> +    g_clear_pointer(&iwp->src, g_source_unref);
> +    g_clear_pointer(&iwp->ioc, object_unref);
> +}
> +
>  static GSourceFuncs io_watch_poll_funcs =3D {
>      .prepare =3D io_watch_poll_prepare,
>      .dispatch =3D io_watch_poll_dispatch,
> +    .finalize =3D io_watch_poll_finalize,
>  };
>
>  GSource *io_add_watch_poll(Chardev *chr,
> @@ -88,7 +96,7 @@ GSource *io_add_watch_poll(Chardev *chr,
>                                         sizeof(IOWatchPoll));
>      iwp->fd_can_read =3D fd_can_read;
>      iwp->opaque =3D user_data;
> -    iwp->ioc =3D ioc;
> +    iwp->ioc =3D object_ref(ioc);
>      iwp->fd_read =3D (GSourceFunc) fd_read;
>      iwp->src =3D NULL;
>

Daniel, Markus, please take a look


--=20
Marc-Andr=C3=A9 Lureau

--00000000000027f5a905e437a803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 20, 2022 at 11:13 AM Ho=
gan Wang via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">IOWatchPoll object did not hold the @ioc and @src objects reference,<br=
>
then io_watch_poll_prepare execute in IO thread, if IOWatchPoll<br>
removed by mian thread, then io_watch_poll_prepare access @ioc or<br></bloc=
kquote><div><br></div><div>mian-&gt;main</div><div>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
@src concurrently lead to coredump.<br>
<br>
In IO thread monitor scene, the IO thread used to accept client,<br>
receive qmp request and handle hung-up event. Main thread used to<br>
handle qmp request and send response, it will remove IOWatchPoll<br>
and free @ioc when send response fail, then cause use-after-free<br></block=
quote><div><br></div><div>I wonder if we are misusing GSources in that case=
, by removing sources from different threads.. Could you be more specific a=
bout the code path that leads to that?<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
like this:<br>
<br>
(gdb) bt<br>
0=C2=A0 0x00007f4d121c8edf in g_source_remove_child_source (source=3D0x7f4c=
58003560, child_source=3D0x7f4c58009b10)<br>
1=C2=A0 0x00007f4d11e0705c in io_watch_poll_prepare (source=3D0x7f4c5800356=
0, timeout=3Dtimeout@entry=3D0x7f4c7fffed94<br>
2=C2=A0 0x00007f4d121ca419 in g_main_context_prepare (context=3Dcontext@ent=
ry=3D0x55a1463f8260, priority=3Dpriority@entry=3D0x7f4c7fffee20)<br>
3=C2=A0 0x00007f4d121cadeb in g_main_context_iterate (context=3D0x55a1463f8=
260, block=3Dblock@entry=3D1, dispatch=3Ddispatch@entry=3D1, self=3Dself@en=
try=3D0x7f4c94002260)<br>
4=C2=A0 0x00007f4d121cb21d in g_main_loop_run (loop=3D0x55a146c90920)<br>
5=C2=A0 0x00007f4d11de3ea1 in iothread_run (opaque=3D0x55a146411820)<br>
6=C2=A0 0x00007f4d11d77470 in qemu_thread_start (args=3D0x55a146b1f3c0)<br>
7=C2=A0 0x00007f4d11f2ef3b in ?? () from /usr/lib64/libpthread.so.0<br>
8=C2=A0 0x00007f4d120ba550 in clone () from /usr/lib64/libc.so.6<br>
(gdb) p iwp<br>
$1 =3D (IOWatchPoll *) 0x7f4c58003560<br>
(gdb) p *iwp<br>
$2 =3D {parent =3D {callback_data =3D 0x0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback_funcs =3D =
0x0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source_funcs =3D 0x=
7f4d11f10760 &lt;io_watch_poll_funcs&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ref_count =3D 1,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context =3D 0x55a14=
63f8260,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priority =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source_id =3D 544,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 poll_fds =3D 0x0,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D 0x55a147a4=
7a30,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D 0x55a14712=
fb80,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D 0x7f4c5800=
36d0 &quot;chardev-iowatch-charmonitor&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D 0x7f4c5800=
3060},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ioc =3D 0x7f4c580033f0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D 0x7f4c58009b10,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fd_can_read =3D 0x7f4d11e0a5d0 &lt;tcp_chr_read_=
poll&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fd_read =3D 0x7f4d11e0a380 &lt;tcp_chr_read&gt;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0opaque =3D 0x55a1463aeea0 }<br>
(gdb) p iwp-&gt;ioc<br>
$3 =3D (QIOChannel *) 0x7f4c580033f0<br>
(gdb) p *iwp-&gt;ioc<br>
$4 =3D {parent =3D {class =3D 0x55a14707f400,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free =3D 0x55a14631=
3010,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 properties =3D 0x55=
a147b37b60,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ref =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent =3D 0x0},<br=
>
=C2=A0 =C2=A0 =C2=A0 features =3D 3,<br>
=C2=A0 =C2=A0 =C2=A0 name =3D 0x7f4c580085f0 &quot;\240F&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 ctx =3D 0x0,<br>
=C2=A0 =C2=A0 =C2=A0 read_coroutine =3D 0x0,<br>
=C2=A0 =C2=A0 =C2=A0 write_coroutine =3D 0x0}<br></blockquote><div><br></di=
v><div>That backtrace isn&#39;t so useful. If you can produce an ASAN error=
 though, that would be more explicit. Not a blocker.<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Solution: IOWatchPoll object hold the @ioc and @src objects reference<br>
and release the reference in GSource finalize callback function.<br></block=
quote><div><br></div><div>ok, if we are not misusing GSource, otherwise see=
ms needless or misleading<br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Hogan Wang &lt;<a href=3D"mailto:hogan.wang@huawei.com" targ=
et=3D"_blank">hogan.wang@huawei.com</a>&gt;<br>
---<br>
=C2=A0chardev/char-io.c | 12 ++++++++++--<br>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/char-io.c b/chardev/char-io.c<br>
index 4451128cba..6b10217a70 100644<br>
--- a/chardev/char-io.c<br>
+++ b/chardev/char-io.c<br>
@@ -55,9 +55,9 @@ static gboolean io_watch_poll_prepare(GSource *source,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iwp-&gt;ioc, G_IO_IN | G_IO=
_ERR | G_IO_HUP | G_IO_NVAL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_source_set_callback(iwp-&gt;src, iwp-&g=
t;fd_read, iwp-&gt;opaque, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_source_add_child_source(source, iwp-&gt=
;src);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_unref(iwp-&gt;src);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_source_remove_child_source(source, iwp-=
&gt;src);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_unref(iwp-&gt;src);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iwp-&gt;src =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
@@ -69,9 +69,17 @@ static gboolean io_watch_poll_dispatch(GSource *source, =
GSourceFunc callback,<br>
=C2=A0 =C2=A0 =C2=A0return G_SOURCE_CONTINUE;<br>
=C2=A0}<br>
<br>
+static void io_watch_poll_finalize(GSource *source)<br>
+{<br>
+=C2=A0 =C2=A0 IOWatchPoll *iwp =3D io_watch_poll_from_source(source);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;iwp-&gt;src, g_source_unref);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;iwp-&gt;ioc, object_unref);<br>
+}<br>
+<br>
=C2=A0static GSourceFuncs io_watch_poll_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0.prepare =3D io_watch_poll_prepare,<br>
=C2=A0 =C2=A0 =C2=A0.dispatch =3D io_watch_poll_dispatch,<br>
+=C2=A0 =C2=A0 .finalize =3D io_watch_poll_finalize,<br>
=C2=A0};<br>
<br>
=C2=A0GSource *io_add_watch_poll(Chardev *chr,<br>
@@ -88,7 +96,7 @@ GSource *io_add_watch_poll(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(I=
OWatchPoll));<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;fd_can_read =3D fd_can_read;<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;opaque =3D user_data;<br>
-=C2=A0 =C2=A0 iwp-&gt;ioc =3D ioc;<br>
+=C2=A0 =C2=A0 iwp-&gt;ioc =3D object_ref(ioc);<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;fd_read =3D (GSourceFunc) fd_read;<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;src =3D NULL;<br></blockquote><div><br></div><d=
iv>Daniel, Markus, please take a look<br></div></div><br clear=3D"all"><br>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br=
></div></div>

--00000000000027f5a905e437a803--

