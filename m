Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889C6F8240
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:47:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puttn-0002Uw-1d; Fri, 05 May 2023 07:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1putte-0002UR-8p
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:46:47 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1puttc-0003kk-1b
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:46:45 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so1910977e87.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683287201; x=1685879201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/M6dnLolMuetUo4YFAN/8L2NUwZuBJhWcSP4+XN98xw=;
 b=LU9YFGRmqu4gizYGPID/2Pdy+UGGzLb3o+9OTabdpXUQBQrKJky1oBrpR3ANAF4zBN
 7l37rhEdjH4O3S41jBvcejZnq64UcQ2LTixT23dbfLJZKFka+4TY1smcVg47/rAeVmt6
 5XX/KLsChE3z67o1vACJnzcprwwSNyNm7fnBpM4wRjiTfJzkcS/3HWd9rOhbK0ksieOz
 x+KNuSKovg3CWEDDnxJ6UM7TpiFDoI3iv2HWmbWUB6CXQTxzjpUKinZIQ5zgmllnsRo0
 1HrogpFEm2wI5ruOmyL3RpuWeZGiCMXql6/hCw6ulRfjlW3Rvc1iD1sWi8vzqIPBaIk/
 BwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683287201; x=1685879201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/M6dnLolMuetUo4YFAN/8L2NUwZuBJhWcSP4+XN98xw=;
 b=ICxWcvOqVEuzClDg9JijXd/kKuO6fihJQJFIJudtc4ci2KubFDjNVptVSf+vRR3wx9
 dVdFnXANp0ZTP9+Jzm22B/Ig5KcLi6xitvMga+rzAbt7jmZ/WeUGL0hH2OtTh6GIFTW2
 70Rf3T2LIpJjODOjUYXatrRsR8M3zITmyRrib9p3RTxpERMdPtEnjxpOAwubKg0Qt9Xz
 32L70nE9TnmIYGw3b9+h84WzqEUnbxT8WbnfXpytnRVDHkXz/F40AXKkZYSp3E3E5O/X
 g8d1xrLpNidVcSLlUM+JFFpOOWcPEseT+UY0oyLQM7pRZs7jLn7mp5G56/O+jG034CxV
 EJrA==
X-Gm-Message-State: AC+VfDy0kEP4kzths6Jz9AhW4v2OAJ0eGBYgeNBpf/7Vm9c/PADSZfIh
 lExmglaT05r8nfgQSOWvdIB0Jn3JPu9xJ2xfGLg=
X-Google-Smtp-Source: ACHHUZ5edsykZCBe/rCT1hCS4Ixhscns1GNNYHedXTnXxvKH9mT1W7ErRWPKZcVJbjS+aNIiNJMl0iTEUqkiSHN+0xA=
X-Received: by 2002:ac2:5583:0:b0:4ef:eeea:1b85 with SMTP id
 v3-20020ac25583000000b004efeeea1b85mr454452lfg.18.1683287201235; Fri, 05 May
 2023 04:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113947.3301944-1-marcandre.lureau@redhat.com>
 <20230505113947.3301944-2-marcandre.lureau@redhat.com>
 <ZFTro47CbUGFrCyq@redhat.com>
In-Reply-To: <ZFTro47CbUGFrCyq@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 5 May 2023 15:46:29 +0400
Message-ID: <CAJ+F1CL0s-0amwRcNvMLmS8EMYE4pD+NN+r7AjzpGEa0s_sjig@mail.gmail.com>
Subject: Re: [PULL 1/1] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Dorinda Bassey <dbassey@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000af473805faf0d744"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000af473805faf0d744
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 5, 2023 at 3:43=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com>
wrote:

> On Fri, May 05, 2023 at 03:39:47PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Dorinda Bassey <dbassey@redhat.com>
> >
> > This commit adds a new audiodev backend to allow QEMU to use Pipewire a=
s
> > both an audio sink and source. This backend is available on most system=
s
> >
> > Add Pipewire entry points for QEMU Pipewire audio backend
> > Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> > qpw_write function returns the current state of the stream to pwaudio
> > and Writes some data to the server for playback streams using pipewire
> > spa_ringbuffer implementation.
> > qpw_read function returns the current state of the stream to pwaudio an=
d
> > reads some data from the server for capture streams using pipewire
> > spa_ringbuffer implementation. These functions qpw_write and qpw_read
> > are called during playback and capture.
> > Added some functions that convert pw audio formats to QEMU audio format
> > and vice versa which would be needed in the pipewire audio sink and
> > source functions qpw_init_in() & qpw_init_out().
> > These methods that implement playback and recording will create streams
> > for playback and capture that will start processing and will result in
> > the on_process callbacks to be called.
> > Built a connection to the Pipewire sound system server in the
> > qpw_audio_init() method.
> >
> > Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> > Reviewed-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> > Message-Id: <20230417105654.32328-1-dbassey@redhat.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  meson.build                   |   8 +
> >  qapi/audio.json               |  44 ++
> >  audio/audio_template.h        |   4 +
> >  audio/audio.c                 |   3 +
> >  audio/pwaudio.c               | 915 ++++++++++++++++++++++++++++++++++
> >  audio/meson.build             |   1 +
> >  audio/trace-events            |   8 +
> >  meson_options.txt             |   4 +-
> >  qemu-options.hx               |  21 +
> >  scripts/meson-buildoptions.sh |   8 +-
> >  10 files changed, 1013 insertions(+), 3 deletions(-)
> >  create mode 100644 audio/pwaudio.c
>
> This doesn't add pipewire dev packages to the dockerfiles, so none of
> this will get built during CI unless something else we have happens to
> be pulling in pipewire dev packages indirectly.
>
>
I was working on it, and further cleanups, but they can be added on top to
avoid having to ask Dorinda and spread the work.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000af473805faf0d744
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 5, 2023 at 3:43=E2=80=
=AFPM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">be=
rrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, May 05, 2023 at 03:39:47PM +0400, <a href=3D"mailt=
o:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.co=
m</a> wrote:<br>
&gt; From: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com" target=
=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This commit adds a new audiodev backend to allow QEMU to use Pipewire =
as<br>
&gt; both an audio sink and source. This backend is available on most syste=
ms<br>
&gt; <br>
&gt; Add Pipewire entry points for QEMU Pipewire audio backend<br>
&gt; Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()<br>
&gt; qpw_write function returns the current state of the stream to pwaudio<=
br>
&gt; and Writes some data to the server for playback streams using pipewire=
<br>
&gt; spa_ringbuffer implementation.<br>
&gt; qpw_read function returns the current state of the stream to pwaudio a=
nd<br>
&gt; reads some data from the server for capture streams using pipewire<br>
&gt; spa_ringbuffer implementation. These functions qpw_write and qpw_read<=
br>
&gt; are called during playback and capture.<br>
&gt; Added some functions that convert pw audio formats to QEMU audio forma=
t<br>
&gt; and vice versa which would be needed in the pipewire audio sink and<br=
>
&gt; source functions qpw_init_in() &amp; qpw_init_out().<br>
&gt; These methods that implement playback and recording will create stream=
s<br>
&gt; for playback and capture that will start processing and will result in=
<br>
&gt; the on_process callbacks to be called.<br>
&gt; Built a connection to the Pipewire sound system server in the<br>
&gt; qpw_audio_init() method.<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dbassey@redhat.com=
" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-onlin=
e.de" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20230417105654.32328-1-dbassey@redha=
t.com" target=3D"_blank">20230417105654.32328-1-dbassey@redhat.com</a>&gt;<=
br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 qapi/audio.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 44 ++<br>
&gt;=C2=A0 audio/audio_template.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
4 +<br>
&gt;=C2=A0 audio/audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 audio/pwaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 915 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 audio/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 audio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 +<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 21 +<br>
&gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 10 files changed, 1013 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 audio/pwaudio.c<br>
<br>
This doesn&#39;t add pipewire dev packages to the dockerfiles, so none of<b=
r>
this will get built during CI unless something else we have happens to<br>
be pulling in pipewire dev packages indirectly.<br>
<br></blockquote><div>=C2=A0</div><div>I was working on it, and further cle=
anups, but they can be added on top to avoid having to ask Dorinda and spre=
ad the work.<br></div></div><br clear=3D"all"><br><span class=3D"gmail_sign=
ature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc=
-Andr=C3=A9 Lureau<br></div></div>

--000000000000af473805faf0d744--

