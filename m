Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F9A4CFDCA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:07:07 +0100 (CET)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRC8o-0002M5-Gm
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRByw-0007rn-R3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:56:54 -0500
Received: from [2a00:1450:4864:20::42d] (port=34545
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRByu-0004WE-ST
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:56:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j26so12474787wrb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NL7wzH4iuvcvOGUZ0VLOmjFXOODpPxqOBovPueSPFk4=;
 b=U0joIZKPHsQ2DCGTPu6gudcBZoe7OlygkFn4C5eKPhnjvfVVUMK9O1YbXp4d4HHWuq
 owZzk8qqHNH04uFXcb7omgavi19syxMctxIo5k74cE18VvqhtvqSkjmLKTbEexTLQ/Ng
 8Nvq/Eb1L7ke6PhWNFuToR0arNacFKM07+LyTbL2TkP11KuFeQB8JzKwr9Q6XrlbMgN5
 o0WznNuRiWyLwp7FLhOgC8v8i8TTwbyRL4zkyIerNoPBXccZLjWhl/gR6Dmz2hkSmWew
 NP9mrRuj072tLaag/WbByo8mozjWdfh4M0U1yFNxja/bbiVc+pLI6KYscb9PKGlsQAhP
 HMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NL7wzH4iuvcvOGUZ0VLOmjFXOODpPxqOBovPueSPFk4=;
 b=e61dE17WthdK3CEMr/wTj8RmQjRNC8eTOZlR6tWYdm9T5Wsam9cKIcrOROw0zFitvg
 TstjTdExV/8jlkxTt92ZUoTMHl4jvNu9xSdwt5n0nYp48k3kDjkXmnuKM29LKYIYNwkf
 iavS8yN/tDnMRjNdH09W+MbGp1Dp/lf51bv4mh2AwB9mSTS75QBW8lmzqNO8X+7n5EbZ
 FXxOU1XasohEIupPEaUF9Ag6VEb4rL+FYMYhVUDp2WDw+CTULr0vSEJU2YHbxyJiPkL7
 uX1jgEoJrgQ5s+TiXX+uKjFo8MTRO14LMjeSUiI+JPpbJxjqlz4Iqfd0rBOxGuSi1Cv6
 6O+w==
X-Gm-Message-State: AOAM530MtHAGCnWnlJreZ7Av+h4vL+9HYajf1VItA+zOpRaZoJk0g/4C
 499SqIIm43g0bYmu7aXsSHTMsVoolEz2EuDopT2nnv6xjfHA2Q==
X-Google-Smtp-Source: ABdhPJyp2nOk8BSVWGyk6udLOWlnsJk2iauPVdkGLOfyRU5KwBeszt0IwWhsZE7R9xa8nhLqtDbnuwMLXlXisrUFCtU=
X-Received: by 2002:a5d:58d3:0:b0:1f1:dfb1:ab63 with SMTP id
 o19-20020a5d58d3000000b001f1dfb1ab63mr7727090wrf.326.1646654211423; Mon, 07
 Mar 2022 03:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
 <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
 <CAJ+F1CJsrfL-PiPM5W4Ydp4WLMfrZOaYydUp4wrX1LbFCxiSaA@mail.gmail.com>
 <CAMVc7JVADz6A+xA7bcZOCd5Y+=2bAqyPGyxqu-Z1gawKGRtiGw@mail.gmail.com>
 <CAJ+F1CKE3utVzLGLUk8FP9D_3YMprn3fLnuq-k+EJNiSXFBj=g@mail.gmail.com>
In-Reply-To: <CAJ+F1CKE3utVzLGLUk8FP9D_3YMprn3fLnuq-k+EJNiSXFBj=g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Mar 2022 15:56:39 +0400
Message-ID: <CAJ+F1CK4b5w=PGaMm+KJ-JE==O-=3A-8cvO-gaha=OrDwwov9w@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000057027b05d99f8f6f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057027b05d99f8f6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 17, 2022 at 9:36 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

>
> On Thu, Feb 17, 2022 at 9:25 PM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
>
>> >> > btw, I suppose you checked your DBus changes against the WIP
>> "qemu-display" project. What was your experience? I don't think many peo=
ple
>> have tried it yet. Do you think this could be made to work on macOS? at
>> least the non-dmabuf support should work, as long as Gtk4 has good macOS
>> support. I don't know if dmabuf or similar exist there, any idea?
>> >>
>> >> I tested it on Fedora. I think it would probably work on macOS but
>> >> maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in
>> >> macOS but its situation is bad; it must be delivered via macOS's own
>> >> IPC mechanisms (Mach port and XPC), but they are for server-client
>> >> model and not for P2P. fileport mechanism allows to convert Mach port
>> >> to file descriptor, but it is not documented. (In reality, I think al=
l
>> >> of the major browsers, Chromium, Firefox and Safari use fileport for
>> >> this purpose. Apple should really document it if they use it for thei=
r
>> >> app.) It is also possible to share IOSurface with a global number, bu=
t
>> >> it can be brute-forced and is insecure.
>> >>
>> >
>> > Thanks, the Gtk developers might have some clue. They have been workin=
g
>> on improving macOS support, and it can use opengl now (
>> https://blogs.gnome.org/chergert/2020/12/15/gtk-4-got-a-new-macos-backen=
d-now-with-opengl/
>> ).
>>
>> They don't need IPC for passing textures so that is a different story.
>>
>
> Yes but they have web-engine and video decoding concerns (beside
> qemu/dmabuf gtk display they should be aware of).  I'll try to reach
> Christian about it.
>
>

fwiw, here is Christian Hergert comment about texture sharing & gtk on
macos:

"There is, and we are using it in GTK 4 as of 4.6 to render from OpenGL
to a surface we can attach to CALayers or OpenGL textures. It has
allowed us to do a bunch of tricks to ensure we have opaque surfaces
since NSWindow doesn't have anything like set_opaque_region() from Wayland.

It's called IOSurface and the browsers use this to pass rendererings
between processes."

--=20
Marc-Andr=C3=A9 Lureau

--00000000000057027b05d99f8f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 17, 2022 at 9:36 PM Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marca=
ndre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 17, 2022 at 9:25 PM Akihiko Oda=
ki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko=
.odaki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt;&gt; &gt; btw, I suppose you checked your DBus changes against the WIP =
&quot;qemu-display&quot; project. What was your experience? I don&#39;t thi=
nk many people have tried it yet. Do you think this could be made to work o=
n macOS? at least the non-dmabuf support should work, as long as Gtk4 has g=
ood macOS support. I don&#39;t know if dmabuf or similar exist there, any i=
dea?<br>
&gt;&gt;<br>
&gt;&gt; I tested it on Fedora. I think it would probably work on macOS but=
<br>
&gt;&gt; maybe require some tweaks. IOSurface is a counterpart of DMA-BUF i=
n<br>
&gt;&gt; macOS but its situation is bad; it must be delivered via macOS&#39=
;s own<br>
&gt;&gt; IPC mechanisms (Mach port and XPC), but they are for server-client=
<br>
&gt;&gt; model and not for P2P. fileport mechanism allows to convert Mach p=
ort<br>
&gt;&gt; to file descriptor, but it is not documented. (In reality, I think=
 all<br>
&gt;&gt; of the major browsers, Chromium, Firefox and Safari use fileport f=
or<br>
&gt;&gt; this purpose. Apple should really document it if they use it for t=
heir<br>
&gt;&gt; app.) It is also possible to share IOSurface with a global number,=
 but<br>
&gt;&gt; it can be brute-forced and is insecure.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thanks, the Gtk developers might have some clue. They have been workin=
g on improving macOS support, and it can use opengl now (<a href=3D"https:/=
/blogs.gnome.org/chergert/2020/12/15/gtk-4-got-a-new-macos-backend-now-with=
-opengl/" rel=3D"noreferrer" target=3D"_blank">https://blogs.gnome.org/cher=
gert/2020/12/15/gtk-4-got-a-new-macos-backend-now-with-opengl/</a>).<br>
<br>
They don&#39;t need IPC for passing textures so that is a different story.<=
br></blockquote><div><br></div><div>Yes but they have web-engine and video =
decoding concerns (beside qemu/dmabuf gtk display they should be aware of).=
=C2=A0 I&#39;ll try to reach Christian about it.<br></div><div>=C2=A0<br></=
div></div></div></blockquote><div><br></div><div>fwiw, here is Christian He=
rgert comment about texture sharing &amp; gtk on macos:</div><div><br></div=
><div>&quot;There is, and we are using it in GTK 4 as of 4.6 to render from=
 OpenGL <br>
to a surface we can attach to CALayers or OpenGL textures. It has <br>
allowed us to do a bunch of tricks to ensure we have opaque surfaces <br>
since NSWindow doesn&#39;t have anything like set_opaque_region() from Wayl=
and.<br>
<br>
It&#39;s called IOSurface and the browsers use this to pass rendererings <b=
r>
between processes.&quot;</div><div><span class=3D"gmail-im"><br></span></di=
v></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 L=
ureau<br></div></div>

--00000000000057027b05d99f8f6f--

