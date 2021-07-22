Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369753D2476
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:18:09 +0200 (CEST)
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YaW-0004Kw-A6
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6YZC-0003XL-Bf
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:16:46 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m6YZ7-0007tT-FX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:16:45 -0400
Received: by mail-ej1-x630.google.com with SMTP id qa36so8300649ejc.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MbN/IGteXHqnGlakQiCgwqn6emjrgcYv0cADc0LEQI=;
 b=pFbH1/FajaC9is3Qp8ZOB7A9ztWo23pSedsSMlHN2eUO/SpCWNKDBu/LHwmZ/ni9fW
 t75FIppz/2QPv7y7IuMwtnMlbdaBypSidPteSJG9Hf5jNJwTRLsnOwOZbMtxXXv8+3lL
 fLe8MheNaZz1hC2ZtMExGNGFWcm/LKVz4ESe6Hx0x84OfXd1LZiT37ck0M34UrGr/VG9
 XFYe3Jmk98wHXIPlPEw32JwV+BPylnOgHPPSlu0cmR0DekzytAisB2OZIcQikvkUPqFO
 sRIccCDhveSPLg0QFMfT1SpPR8LmxJpx2ztdLMVvMheK0WQMJqkwkqgPtsoJ9tDCP2rL
 /Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MbN/IGteXHqnGlakQiCgwqn6emjrgcYv0cADc0LEQI=;
 b=CamJ4StanhVxiqnsXNjMuBRz/KflcUxc3rMagOyZ31jLpQ1m8TWnpBibTEwB+cypz4
 +MzXDcawBNkI5b2Kzf6t4uH6khyEu71aKzdzXap6oqaFPGyFlnWdI2tUHNeZ0xnbtqiM
 patyYX2aMtxE21c0ljylb1moC/dtS473G09Z4NFiUMYuoDxwx5fdTN4OyBEhz8G0MG/r
 I60eqmXMMI1Gp9ELEvFsNpSmb8BL/pVJAK8Nge6nLx6a/BaoaKWVzs0V/UKgFr7ID3rE
 nLC+678lx9OQowRrJ8R0EayBvi45JbwNqU6Sa4WqZBevpFHmFvcmB8+sBzdPbRYWqdKN
 XN5g==
X-Gm-Message-State: AOAM532mcL81MVErU28Duf+1DD/5Zn/1jH/zDUP9hrq/Pg1KDNUvypW2
 TZawBJe3AqM0vCF4H4B/qOGkQv/wfSE0o0Cxl2w=
X-Google-Smtp-Source: ABdhPJyw59gA9pNeCANMPlHpITPimxPMT3en6LLN1BpUuHfMb/2AHPVH9MipYtzRv17lC+e0eNxdxD5lt5TIbOJXyuY=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr43847434ejw.92.1626959798365; 
 Thu, 22 Jul 2021 06:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210702123221.942432-1-marcandre.lureau@redhat.com>
 <20210722121120.epu7cciuvefks64c@sirius.home.kraxel.org>
 <CAJ+F1CLJmcihAVL-vFPuEg64wAwgNDaHBck_cNyimz+uZqMO_w@mail.gmail.com>
In-Reply-To: <CAJ+F1CLJmcihAVL-vFPuEg64wAwgNDaHBck_cNyimz+uZqMO_w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Jul 2021 17:16:26 +0400
Message-ID: <CAJ+F1CKLSHH-pETTeTsazrHW+M7R4PrOTNyTFpWBkdEG0S3MJg@mail.gmail.com>
Subject: Re: [PATCH] hw/display: fix virgl reset regression
To: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d8718005c7b61801"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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

--000000000000d8718005c7b61801
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 22, 2021 at 4:51 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, Jul 22, 2021 at 4:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>> On Fri, Jul 02, 2021 at 04:32:21PM +0400, marcandre.lureau@redhat.com
>> wrote:
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Before commit 49afbca3b00e8e517d54964229a794b51768deaf ("virtio-gpu:
>> drop
>> > use_virgl_renderer"), use_virgl_renderer was preventing calling GL
>> > functions from non-GL context threads. The innocuously looking
>> >
>> >   g->parent_obj.use_virgl_renderer =3D false;
>> >
>> > was set the first time virtio_gpu_gl_reset() was called, during
>> > pc_machine_reset() in the main thread. Further virtio_gpu_gl_reset()
>> > calls in IO threads, without associated GL context, were thus skipping
>> > GL calls and avoided warnings or crashes (see also
>> > https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/226).
>>
>> Conflicts with patch by Akihiko Odaki fixing the same thing or a
>> related issue:
>>
>> virtio-gpu: Call Virgl only in the main thread
>>
>>
>> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210617113520.259=
73-1-akihiko.odaki@gmail.com/
>>
>> Can you have a look please and suggest how to handle this?
>>
>
> Thanks, I didn't notice we were trying to solve the same issue.
>
> Akihiko's patch indeed seems to solve the crash, but doesn't solve the
> flood of asserts (on wayland):
> qemu-system-x86_64: Gtk: gtk_gl_area_make_current: assertion
> 'gtk_widget_get_realized (widget)' failed
> qemu-system-x86_64: Gdk: gdk_window_create_gl_context: assertion
> 'GDK_IS_WINDOW (window)' failed
> qemu-system-x86_64: Gdk: gdk_gl_context_set_required_version: assertion
> 'GDK_IS_GL_CONTEXT (context)' failed
> ... and many more
>
> My patch cleans it for me, I would suggest to take mine.
>
> Fwiw, I just tested also on X11, and we have another regression that seem=
s
> unrelated:
> qemu-system-x86_64: ../src/dispatch_common.c:858: epoxy_get_proc_address:
> Assertion `0 && "Couldn't find current GLX or EGL context.\n"' failed.
>
> sigh..
>
>
That assert is fixed with "vl: add virtio-vga-gl to the default_list" patch
(
https://patchew.org/QEMU/20210701062421.721414-1-marcandre.lureau@redhat.co=
m/
).


--=20
Marc-Andr=C3=A9 Lureau

--000000000000d8718005c7b61801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 4:51 PM Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marca=
ndre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22=
, 2021 at 4:12 PM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" ta=
rget=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, Jul 02, 2021 at 04:32:21PM +0400, =
<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.=
lureau@redhat.com</a> wrote:<br>
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
n&quot;&#39; failed.</div><div><br></div><div>sigh..<br></div><br clear=3D"=
all"></div></div></blockquote><div><br></div><div>That assert is fixed with=
 &quot;vl: add virtio-vga-gl to the default_list&quot; patch (<a href=3D"ht=
tps://patchew.org/QEMU/20210701062421.721414-1-marcandre.lureau@redhat.com/=
">https://patchew.org/QEMU/20210701062421.721414-1-marcandre.lureau@redhat.=
com/</a>).<br></div><div>=C2=A0</div></div><br>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d8718005c7b61801--

