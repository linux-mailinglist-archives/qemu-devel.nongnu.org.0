Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44EB3D23E0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:53:36 +0200 (CEST)
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YCl-0008Ln-TT
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6YBN-0006ku-12
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:52:09 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6YBL-0003Q2-3u
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:52:08 -0400
Received: by mail-ed1-x52c.google.com with SMTP id k27so6644257edk.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Nlm22A/4yxbyTHnjq+Wdq+T9QOS9Vf9NxG8mjXUEiM=;
 b=HSoKQ/qt0NnbnPFHciPngqVxYIlXIoEWw+wx1MUPYK6nxn+JqAsLD1eIEYKS6mdX/y
 HZ9AIxeJHWXvYb3/gJVRWu87etiBwCzMMl1FTTLxRJPMqnb3mJpu5PN3xlRFL6yk0LUa
 21VpPADDUFCAnLxWKGY4kLg1NUGZoyQv4OTZ+0g/bJHgKrjQ5T2oPAnj2JuW+X0C6R9p
 ABlZMWzTcUSOXbxmGNo52zboyvW/eyqou7vdjOAE8PG1b1X0wYdAGCdas1udvyKnThXh
 UFWg+qKQDY4fTLren/Fc4aodxYB5Ix5VMghsF7lvUukvMMy98nVRRBqdpZCB+ngR21AM
 HtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Nlm22A/4yxbyTHnjq+Wdq+T9QOS9Vf9NxG8mjXUEiM=;
 b=ifisWBZNwCQnDr0U8jppibde8YuT3s+RBRJ8ADiC/n8R+X+yXj6o7eq05eqdfptHXe
 rpPqS9+fAnv3lqbvPgW4p9FncncRh7GCqUELnD1jSCBKZZcHjj/VqOCyy2owAn1P+iaw
 1KOk0gv7WqGeXBmEhmxiz/bt0nhRfATV3ecJxkhH70a4JehCa9ipgl+U/d6d76GK1Ee0
 A3jtidiAyl+kWnpamwervZQQLd1O8pA+XQAyNziTHu4mXn/ZwFnOEqjcEIvpdFrIzc94
 tBrwpa8q64z4DvLhR0Jn2meWDTuQkV9udm3FAVuBcKMCJI73zQvy/6C6WU0pWUDjZpDj
 6KLA==
X-Gm-Message-State: AOAM530NMe9dwC6nlNklv+GTGQ/XH5VEJ3sAZfBDU7YESrwZzKqmSzzS
 yJ9BXDxd9+E+h7NVlWKVRm0OWetzUaEbwzrGyy8=
X-Google-Smtp-Source: ABdhPJy6M26/rtIkVbkRpFT632Zm8WchbwFiW5Zfb0QZzOVK8WZrW3vvtNNa8wuMhoZle6CuUtXnbZw5GvTLMP+i7I4=
X-Received: by 2002:a50:fe95:: with SMTP id d21mr54229211edt.257.1626958325642; 
 Thu, 22 Jul 2021 05:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210702123221.942432-1-marcandre.lureau@redhat.com>
 <20210722121120.epu7cciuvefks64c@sirius.home.kraxel.org>
In-Reply-To: <20210722121120.epu7cciuvefks64c@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Jul 2021 16:51:53 +0400
Message-ID: <CAJ+F1CLJmcihAVL-vFPuEg64wAwgNDaHBck_cNyimz+uZqMO_w@mail.gmail.com>
Subject: Re: [PATCH] hw/display: fix virgl reset regression
To: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000107b1405c7b5c1fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
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

--000000000000107b1405c7b5c1fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 22, 2021 at 4:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Fri, Jul 02, 2021 at 04:32:21PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Before commit 49afbca3b00e8e517d54964229a794b51768deaf ("virtio-gpu: dr=
op
> > use_virgl_renderer"), use_virgl_renderer was preventing calling GL
> > functions from non-GL context threads. The innocuously looking
> >
> >   g->parent_obj.use_virgl_renderer =3D false;
> >
> > was set the first time virtio_gpu_gl_reset() was called, during
> > pc_machine_reset() in the main thread. Further virtio_gpu_gl_reset()
> > calls in IO threads, without associated GL context, were thus skipping
> > GL calls and avoided warnings or crashes (see also
> > https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/226).
>
> Conflicts with patch by Akihiko Odaki fixing the same thing or a
> related issue:
>
> virtio-gpu: Call Virgl only in the main thread
>
>
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210617113520.2597=
3-1-akihiko.odaki@gmail.com/
>
> Can you have a look please and suggest how to handle this?
>

Thanks, I didn't notice we were trying to solve the same issue.

Akihiko's patch indeed seems to solve the crash, but doesn't solve the
flood of asserts (on wayland):
qemu-system-x86_64: Gtk: gtk_gl_area_make_current: assertion
'gtk_widget_get_realized (widget)' failed
qemu-system-x86_64: Gdk: gdk_window_create_gl_context: assertion
'GDK_IS_WINDOW (window)' failed
qemu-system-x86_64: Gdk: gdk_gl_context_set_required_version: assertion
'GDK_IS_GL_CONTEXT (context)' failed
... and many more

My patch cleans it for me, I would suggest to take mine.

Fwiw, I just tested also on X11, and we have another regression that seems
unrelated:
qemu-system-x86_64: ../src/dispatch_common.c:858: epoxy_get_proc_address:
Assertion `0 && "Couldn't find current GLX or EGL context.\n"' failed.

sigh..



--=20
Marc-Andr=C3=A9 Lureau

--000000000000107b1405c7b5c1fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 4:12 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxe=
l@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, Jul 02, 2021 at 04:32:21PM +0400, <a href=3D"mailto:mar=
candre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>=
 wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Before commit 49afbca3b00e8e517d54964229a794b51768deaf (&quot;virtio-g=
pu: drop<br>
&gt; use_virgl_renderer&quot;), use_virgl_renderer was preventing calling G=
L<br>
&gt; functions from non-GL context threads. The innocuously looking<br>
&gt; <br>
&gt;=C2=A0 =C2=A0g-&gt;parent_obj.use_virgl_renderer =3D false;<br>
&gt; <br>
&gt; was set the first time virtio_gpu_gl_reset() was called, during<br>
&gt; pc_machine_reset() in the main thread. Further virtio_gpu_gl_reset()<b=
r>
&gt; calls in IO threads, without associated GL context, were thus skipping=
<br>
&gt; GL calls and avoided warnings or crashes (see also<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues=
/226" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/v=
irgl/virglrenderer/-/issues/226</a>).<br>
<br>
Conflicts with patch by Akihiko Odaki fixing the same thing or a<br>
related issue:<br>
<br>
virtio-gpu: Call Virgl only in the main thread<br>
<br>
<a href=3D"https://patchwork.ozlabs.org/project/qemu-devel/patch/2021061711=
3520.25973-1-akihiko.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_blank"=
>https://patchwork.ozlabs.org/project/qemu-devel/patch/20210617113520.25973=
-1-akihiko.odaki@gmail.com/</a><br>
<br>
Can you have a look please and suggest how to handle this?<br clear=3D"all"=
></blockquote><div><br></div><div>Thanks, I didn&#39;t notice we were tryin=
g to solve the same issue.</div><div><br></div><div>Akihiko&#39;s patch ind=
eed seems to solve the crash, but doesn&#39;t solve the flood of asserts (o=
n wayland):</div><div>qemu-system-x86_64: Gtk: gtk_gl_area_make_current: as=
sertion &#39;gtk_widget_get_realized (widget)&#39; failed<br>qemu-system-x8=
6_64: Gdk: gdk_window_create_gl_context: assertion &#39;GDK_IS_WINDOW (wind=
ow)&#39; failed<br>qemu-system-x86_64: Gdk: gdk_gl_context_set_required_ver=
sion: assertion &#39;GDK_IS_GL_CONTEXT (context)&#39; failed</div><div>... =
and many more<br></div><div><br></div><div>My patch cleans it for me, I wou=
ld suggest to take mine.<br></div><div><br></div><div>Fwiw, I just tested a=
lso on X11, and we have another regression that seems unrelated:</div><div>=
qemu-system-x86_64: ../src/dispatch_common.c:858: epoxy_get_proc_address: A=
ssertion `0 &amp;&amp; &quot;Couldn&#39;t find current GLX or EGL context.\=
n&quot;&#39; failed.</div><div><br></div><div>sigh..<br></div><div><br></di=
v><div><br></div></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<b=
r></div></div>

--000000000000107b1405c7b5c1fa--

