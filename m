Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3E4EACA3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:50:11 +0200 (CEST)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAMT-0005A9-63
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:50:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZAFb-0002ov-0m
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:43:15 -0400
Received: from [2a00:1450:4864:20::429] (port=36719
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZAFY-0003mV-Tw
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:43:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id u3so24422322wrg.3
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EMAlqliWsJGLkgwocWHmAoF34oJad12U1FjSATvnE6Y=;
 b=W34klvdLy43e3O/gbz0FHJ5Zbe/X0SD9s/VEYyCoz8oZKTbX2ebZoTHv/Ok3d2nOvQ
 qvCVLpwJPrUA8x1nteON6Zc0TLqJVEwLNSWjB2I72OPN1xjT0v2P4Ql8AoJ4j2ob+fR6
 lSLearWbB01/viJWBTb4k+TVRABp9CNky4E4gEE6ft8yoMCSBSstCdUbRWXQDZiUVoZ9
 UCXqPhXXProOdYO2J876cy8FzqTJ6ApRntVsQUpseIY+QHT10ot+En5AvXP3ISwP9hum
 Lt2lzuvQdS9aLgMHjrCaGMrSP/YRDxXSj95xhj0UlpYkwP//OdAj0K+us6++GybemZyt
 i1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EMAlqliWsJGLkgwocWHmAoF34oJad12U1FjSATvnE6Y=;
 b=csTwR29RNHGkoOVTCjVYnlV7BFF2Lytz/Kzbl2bf3MOrEtS92LmyEnXknUwOaWPBDn
 5blDe8zQ0HWbzlgEJL2cqWXNz4zTJ8dF9CzY8VGljTQ58Cnn+Q96KZepMHtZJdnBhy2M
 oMtvgMI3iqyfLHesNpibP/HvGFuuxtjo/9mwq/vjj3zKo4DZlqrg7oRKvF+VjYm2Rq3j
 XToznDHQgO2c6shSMnhL5d6xcFyjx9uqCkaoytEX/Py6009/CR8awY7h7vfVRFEtRr7L
 2ow5Rf0PHCGUvN0Xegtb0wkNQfSw5DwXxV48IXwDYb3e1v0soJh/c7bGkSYL4I2jUH9l
 3OQA==
X-Gm-Message-State: AOAM533+hkvkDsmAkjm87kxFL8kM9A6EKXyRmcs4nVwV0BC9JtmOR1Om
 rNnxQDpeGJd48gTgmM0Sx7mqDKDQKj5WbcbNamU=
X-Google-Smtp-Source: ABdhPJymv/3flUl+sOJ6TfKTVyWO99Tvud2Xf2fMj7AK+G1Y9GgvpNdHudX7z60pjnjDiQK9yNGnB3LHELJUMktpkX4=
X-Received: by 2002:adf:f9c4:0:b0:203:e021:5eb0 with SMTP id
 w4-20020adff9c4000000b00203e0215eb0mr30346494wrr.529.1648554179069; Tue, 29
 Mar 2022 04:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220328082207.2525-1-hogan.wang@huawei.com>
In-Reply-To: <20220328082207.2525-1-hogan.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 29 Mar 2022 15:42:47 +0400
Message-ID: <CAJ+F1CKfbPc88csKxA3bgzc4cRQTAnJ=wXd1hF-OCRRjNC5eMg@mail.gmail.com>
Subject: Re: [PATCH] chardev: avoid use-after-free when client disconnect
To: Hogan Wang <hogan.wang@huawei.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003c8dd305db59ee67"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, wangxinxin.wang@huawei.com,
 weidong.huang@huawei.com, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c8dd305db59ee67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 28, 2022 at 12:22 PM Hogan Wang via <qemu-devel@nongnu.org>
wrote:

> IOWatchPoll object did not hold the @ioc and @src objects reference,
> then io_watch_poll_prepare execute in IO thread, if IOWatchPoll
> removed by mian thread, io_watch_poll_prepare may execute at last
> chance and access the freed @ioc or @src object.
>
> In IO thread monitor scene, the IO thread used to accept client,
> receive qmp request and handle hung-up event. Main thread used to
> handle qmp request and send response, it will remove IOWatchPoll
> and free @ioc when send response fail, then cause use-after-free
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
> Solution: IOWatchPoll object hold the @ioc and @src objects reference
> and release the reference in GSource finalize callback function.
>
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> ---
>  chardev/char-io.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char-io.c b/chardev/char-io.c
> index 8ced184160..3af388eeaa 100644
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
>

This change looks unnecessary. According to g_source_add_child_source()
documentation: *"**source* will hold a reference on *child_source* while
*child_source* is attached to it."


>          iwp->src =3D NULL;
>      }
>      return FALSE;
> @@ -69,9 +69,23 @@ static gboolean io_watch_poll_dispatch(GSource *source=
,
> GSourceFunc callback,
>      return G_SOURCE_CONTINUE;
>  }
>
> +static void io_watch_poll_finalize(GSource *source)
> +{
> +    IOWatchPoll *iwp =3D io_watch_poll_from_source(source);
> +    if (iwp->src) {
> +        g_source_unref(iwp->src);
>

(see above)


> +        iwp->src =3D NULL;
> +    }
> +    if (iwp->ioc) {
> +        object_unref(OBJECT(iwp->ioc));
> +        iwp->ioc =3D NULL;
> +    }
>

replace with g_clear_pointer(&iwp->ioc, object_unref);


> +}
> +
>  static GSourceFuncs io_watch_poll_funcs =3D {
>      .prepare =3D io_watch_poll_prepare,
>      .dispatch =3D io_watch_poll_dispatch,
> +    .finalize =3D io_watch_poll_finalize,
>  };
>
>  GSource *io_add_watch_poll(Chardev *chr,
> @@ -88,6 +102,7 @@ GSource *io_add_watch_poll(Chardev *chr,
>                                         sizeof(IOWatchPoll));
>      iwp->fd_can_read =3D fd_can_read;
>      iwp->opaque =3D user_data;
> +    object_ref(OBJECT(ioc));
>      iwp->ioc =3D ioc;
>

please use "iwp->ioc =3D object_ref(ioc)"


>      iwp->fd_read =3D (GSourceFunc) fd_read;
>      iwp->src =3D NULL;
> --
> 2.33.0
>
>
>
Daniel, please review
thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003c8dd305db59ee67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 28, 2022 at 12:22 PM Ho=
gan Wang via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">IOWatchPoll object did not hold the @ioc and @src objects reference,<br=
>
then io_watch_poll_prepare execute in IO thread, if IOWatchPoll<br>
removed by mian thread, io_watch_poll_prepare may execute at last<br>
chance and access the freed @ioc or @src object.<br>
<br>
In IO thread monitor scene, the IO thread used to accept client,<br>
receive qmp request and handle hung-up event. Main thread used to<br>
handle qmp request and send response, it will remove IOWatchPoll<br>
and free @ioc when send response fail, then cause use-after-free<br>
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
=C2=A0 =C2=A0 =C2=A0 write_coroutine =3D 0x0}<br>
<br>
Solution: IOWatchPoll object hold the @ioc and @src objects reference<br>
and release the reference in GSource finalize callback function.<br>
<br>
Signed-off-by: Hogan Wang &lt;<a href=3D"mailto:hogan.wang@huawei.com" targ=
et=3D"_blank">hogan.wang@huawei.com</a>&gt;<br>
---<br>
=C2=A0chardev/char-io.c | 17 ++++++++++++++++-<br>
=C2=A01 file changed, 16 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/char-io.c b/chardev/char-io.c<br>
index 8ced184160..3af388eeaa 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_unref(iwp-&gt;src);<br></blockquote><=
div><br></div><div>This change looks unnecessary. According to g_source_add=
_child_source() documentation: <code><em>&quot;</em></code><em class=3D"gma=
il-parameter" style=3D"font-style:normal"><code>source</code></em><span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0</span>will hold a reference on<sp=
an class=3D"gmail-Apple-converted-space">=C2=A0</span><em class=3D"gmail-pa=
rameter" style=3D"font-style:normal"><code>child_source</code></em><span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0</span>while<span class=3D"gmail-=
Apple-converted-space">=C2=A0</span><em class=3D"gmail-parameter" style=3D"=
font-style:normal"><code>child_source</code></em><span class=3D"gmail-Apple=
-converted-space">=C2=A0</span>is attached to it.&quot;<br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iwp-&gt;src =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
@@ -69,9 +69,23 @@ static gboolean io_watch_poll_dispatch(GSource *source, =
GSourceFunc callback,<br>
=C2=A0 =C2=A0 =C2=A0return G_SOURCE_CONTINUE;<br>
=C2=A0}<br>
<br>
+static void io_watch_poll_finalize(GSource *source)<br>
+{<br>
+=C2=A0 =C2=A0 IOWatchPoll *iwp =3D io_watch_poll_from_source(source);<br>
+=C2=A0 =C2=A0 if (iwp-&gt;src) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_unref(iwp-&gt;src);<br></blockquote><=
div><br></div>(see above)<br></div><div class=3D"gmail_quote">=C2=A0<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iwp-&gt;src =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (iwp-&gt;ioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(iwp-&gt;ioc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iwp-&gt;ioc =3D NULL;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>replace with g_clear_p=
ointer(&amp;iwp-&gt;ioc, object_unref);</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
=C2=A0static GSourceFuncs io_watch_poll_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0.prepare =3D io_watch_poll_prepare,<br>
=C2=A0 =C2=A0 =C2=A0.dispatch =3D io_watch_poll_dispatch,<br>
+=C2=A0 =C2=A0 .finalize =3D io_watch_poll_finalize,<br>
=C2=A0};<br>
<br>
=C2=A0GSource *io_add_watch_poll(Chardev *chr,<br>
@@ -88,6 +102,7 @@ GSource *io_add_watch_poll(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(I=
OWatchPoll));<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;fd_can_read =3D fd_can_read;<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;opaque =3D user_data;<br>
+=C2=A0 =C2=A0 object_ref(OBJECT(ioc));<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;ioc =3D ioc;<br></blockquote><div><br></div><di=
v>please use &quot;iwp-&gt;ioc =3D object_ref(ioc)&quot;</div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0iwp-&gt;fd_read =3D (GSourceFunc) fd_read;<br>
=C2=A0 =C2=A0 =C2=A0iwp-&gt;src =3D NULL;<br>
-- <br>
2.33.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>Daniel, please review</div><div>t=
hanks<br></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003c8dd305db59ee67--

