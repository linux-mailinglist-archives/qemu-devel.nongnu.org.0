Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B501240FE65
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:11:32 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHOd-0000Xg-PM
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mRHME-0006t3-Pg
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:09:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mRHM9-00005z-V9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:09:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so14547686wrg.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+LNGoeclOK31Z/uXf8hfvJhJSrWRk0AfDQjqP6oVxQ=;
 b=SEzmOFbYj1LUZ+fooSUNwCQmQvbklELv9tUDsuSVqiJW2Zy5z6x84YzUH+9a3Iqq08
 QWlt1cYcJcxpyqiBC8No98z4VVZSXcBQGKX0xC9ZQLS/0K8KlYrGEKW3c8iAGTYngpSv
 i5JkAYBTaZy0+ypESVZ6KoXJHiovo0FU/Qmq+hKMleCj73NGkKsitNHvL3ZV/sEj22FH
 2BD2v+p8WCp4D3Nkzhv1PqaF+RS6ZpC/0WA+qBe7E2nQUJ5TZMG2Qey/26+TxHqtEi9A
 fBwTzgHHVqXhbjYU35XvQPsC8BrtKC0pX8c5YoAOMFl/knJoq/tgh+bqgl+bsr2g+mlO
 G8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+LNGoeclOK31Z/uXf8hfvJhJSrWRk0AfDQjqP6oVxQ=;
 b=xynghf6+t/viTmvthmokCeSUltw6F5PQ8PEfQRZ8NetF0JFxBBuw1MDljNuhKLlBOj
 aeTTjfW1rSna0cR0qJLSy37WxdsW6VWCgZc5mwkVaImNll41moS/62R1LYxWoDL2gYFT
 zH0GJ1J0Mw1Yn6ba/vt5bZAVT/lhd0+uDvlJhMHI4Wm/iE5LzQr74+XvWMWNzD//48D7
 L5VvaO2KqDzb5OACPjOtE+qRPrHqkXX8LdaGsB8VlSM9C93MSLbUkVCKfQSRgT6Kv8UB
 zCXJ8vKD/YfHEeMnDVWqcWlM822uYjVxMFCIAqNYAONQfE/dLclK+NLZIa3rVLmnHVVp
 zKYQ==
X-Gm-Message-State: AOAM532SwZv2gxMZjsuml9cZMmjQJUm3aH9VgnBDc5vEu26pQ7fc+HSC
 TeesyGaBJftT8AUvuwaPG64jl+ikszgk3uL+Fa4=
X-Google-Smtp-Source: ABdhPJzZ4ClndpTIZHZJ5IIhTm2nwFdoOeoBh2h1rSjVjHcqj7jpt1XKjx8fH1DxhVnmqa9c6lBp3oqOpNO8rtGxFUQ=
X-Received: by 2002:adf:e806:: with SMTP id o6mr12930208wrm.239.1631898534606; 
 Fri, 17 Sep 2021 10:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
 <20210916192239.18742-4-vr_qemu@t-online.de>
In-Reply-To: <20210916192239.18742-4-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Sep 2021 21:08:43 +0400
Message-ID: <CAJ+F1CK_7eNV_8DFDwc+3_xqWZ4H1qZqo6rAFK97zs++4EfCpA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ui/console: prevent use after free error
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="00000000000076fccd05cc33fcc7"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000076fccd05cc33fcc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 16, 2021 at 11:29 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Make chr in the QemuConsole object a strong reference to the
> referenced chardev device. This prevents a use after free error
> if the chardev device goes away unexpectedly.
>
> To reproduce the error start qemu-system built with address
> sanitizer with the the following command line options.
>
> -display sdl -chardev vc,id=3Dtest0,cols=3D132,rows=3D50.
>
> Open the monitor console with CTRL-ALT-3 and remove the
> unconnected chardev device test0.
>
> (qemu) chardev-remove test0
>
> Open the text console test0 with CTRL-ALT-2 and type a character.
> QEMU immediately exits with this error message.
>

Hmm, why is it not busy like the other chardevs?


> =3D=3D28148=3D=3DERROR: AddressSanitizer: heap-use-after-free
>   on address 0x60e000043778 at pc 0x558712ba7125
>   bp 0x7fff270980b0 sp 0x7fff270980a8
> READ of size 8 at 0x60e000043778 thread T0
>     #0 0x558712ba7124 in qemu_chr_be_can_write
>       ../qemu-master/chardev/char.c:188
>     #1 0x558711624770 in kbd_send_chars
>       ../qemu-master/ui/console.c:1113
>     #2 0x558711634e91 in kbd_put_keysym_console
>       ../qemu-master/ui/console.c:1175
>     #3 0x55871163532a in kbd_put_string_console
>       ../qemu-master/ui/console.c:1221
>     #4 0x5587120a21e4 in handle_textinput
>       ../qemu-master/ui/sdl2.c:464
>     #5 0x5587120a21e4 in sdl2_poll_events
>       ../qemu-master/ui/sdl2.c:650
>     #6 0x5587116269c3 in dpy_refresh
>       ../qemu-master/ui/console.c:1673
>     #7 0x5587116269c3 in gui_update
>       ../qemu-master/ui/console.c:158
>     #8 0x558712d3a919 in timerlist_run_timers
>       ../qemu-master/util/qemu-timer.c:573
>     #9 0x558712d3b183 in qemu_clock_run_timers
>       ../qemu-master/util/qemu-timer.c:587
>     #10 0x558712d3b183 in qemu_clock_run_all_timers
>       ../qemu-master/util/qemu-timer.c:669
>     #11 0x558712d286d9 in main_loop_wait
>       ../qemu-master/util/main-loop.c:542
>     #12 0x5587123d313b in qemu_main_loop
>       ../qemu-master/softmmu/runstate.c:726
>     #13 0x5587115f989d in main
>       ../qemu-master/softmmu/main.c:50
>     #14 0x7f832ee0934c in __libc_start_main
>       (/lib64/libc.so.6+0x2534c)
>     #15 0x55871160b6e9 in _start
>       (/home/ruemelin/rpmbuild/BUILD/qemu-6.1.50-build/
>       qemu-system-x86_64+0x1f4f6e9)
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  ui/console.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/ui/console.c b/ui/console.c
> index 29a3e3f0f5..1ef5a96295 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -2264,6 +2264,7 @@ static void vc_chr_open(Chardev *chr,
>      }
>
>      s->chr =3D chr;
> +    object_ref(chr);
>      drv->console =3D s;
>
>      if (display_state) {
>

Isn't this effectively preventing removing the chardev? Hence, it should
either be made busy, or keeping a weak pointer invalidated on
instance_finalize imho.

thanks


--=20
Marc-Andr=C3=A9 Lureau

--00000000000076fccd05cc33fcc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 11:29 PM Vo=
lker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-onli=
ne.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Make chr in the QemuConsole object a strong reference to the<br>
referenced chardev device. This prevents a use after free error<br>
if the chardev device goes away unexpectedly.<br>
<br>
To reproduce the error start qemu-system built with address<br>
sanitizer with the the following command line options.<br>
<br>
-display sdl -chardev vc,id=3Dtest0,cols=3D132,rows=3D50.<br>
<br>
Open the monitor console with CTRL-ALT-3 and remove the<br>
unconnected chardev device test0.<br>
<br>
(qemu) chardev-remove test0<br>
<br>
Open the text console test0 with CTRL-ALT-2 and type a character.<br>
QEMU immediately exits with this error message.<br></blockquote><div><br></=
div><div>Hmm, why is it not busy like the other chardevs?<br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=3D=3D28148=3D=3DERROR: AddressSanitizer: heap-use-after-free<br>
=C2=A0 on address 0x60e000043778 at pc 0x558712ba7125<br>
=C2=A0 bp 0x7fff270980b0 sp 0x7fff270980a8<br>
READ of size 8 at 0x60e000043778 thread T0<br>
=C2=A0 =C2=A0 #0 0x558712ba7124 in qemu_chr_be_can_write<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/chardev/char.c:188<br>
=C2=A0 =C2=A0 #1 0x558711624770 in kbd_send_chars<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/console.c:1113<br>
=C2=A0 =C2=A0 #2 0x558711634e91 in kbd_put_keysym_console<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/console.c:1175<br>
=C2=A0 =C2=A0 #3 0x55871163532a in kbd_put_string_console<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/console.c:1221<br>
=C2=A0 =C2=A0 #4 0x5587120a21e4 in handle_textinput<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/sdl2.c:464<br>
=C2=A0 =C2=A0 #5 0x5587120a21e4 in sdl2_poll_events<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/sdl2.c:650<br>
=C2=A0 =C2=A0 #6 0x5587116269c3 in dpy_refresh<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/console.c:1673<br>
=C2=A0 =C2=A0 #7 0x5587116269c3 in gui_update<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/ui/console.c:158<br>
=C2=A0 =C2=A0 #8 0x558712d3a919 in timerlist_run_timers<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/util/qemu-timer.c:573<br>
=C2=A0 =C2=A0 #9 0x558712d3b183 in qemu_clock_run_timers<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/util/qemu-timer.c:587<br>
=C2=A0 =C2=A0 #10 0x558712d3b183 in qemu_clock_run_all_timers<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/util/qemu-timer.c:669<br>
=C2=A0 =C2=A0 #11 0x558712d286d9 in main_loop_wait<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/util/main-loop.c:542<br>
=C2=A0 =C2=A0 #12 0x5587123d313b in qemu_main_loop<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/softmmu/runstate.c:726<br>
=C2=A0 =C2=A0 #13 0x5587115f989d in main<br>
=C2=A0 =C2=A0 =C2=A0 ../qemu-master/softmmu/main.c:50<br>
=C2=A0 =C2=A0 #14 0x7f832ee0934c in __libc_start_main<br>
=C2=A0 =C2=A0 =C2=A0 (/lib64/libc.so.6+0x2534c)<br>
=C2=A0 =C2=A0 #15 0x55871160b6e9 in _start<br>
=C2=A0 =C2=A0 =C2=A0 (/home/ruemelin/rpmbuild/BUILD/qemu-6.1.50-build/<br>
=C2=A0 =C2=A0 =C2=A0 qemu-system-x86_64+0x1f4f6e9)<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
---<br>
=C2=A0ui/console.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index 29a3e3f0f5..1ef5a96295 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -2264,6 +2264,7 @@ static void vc_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;chr =3D chr;<br>
+=C2=A0 =C2=A0 object_ref(chr);<br>
=C2=A0 =C2=A0 =C2=A0drv-&gt;console =3D s;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (display_state) {<br clear=3D"all"></blockquote><div=
><br></div><div>Isn&#39;t this effectively preventing removing the chardev?=
 Hence, it should either be made busy, or keeping a weak pointer invalidate=
d on instance_finalize imho.</div><div><br></div><div>thanks<br></div><div>=
=C2=A0</div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Mar=
c-Andr=C3=A9 Lureau<br></div></div>

--00000000000076fccd05cc33fcc7--

