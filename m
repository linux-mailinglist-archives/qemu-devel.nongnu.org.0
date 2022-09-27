Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB415EC4CD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:44:36 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAt1-0000fL-OO
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AL-0002b2-Kn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:33 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AJ-0006Yb-Op
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:21 -0400
Received: by mail-lj1-x235.google.com with SMTP id b24so10615533ljk.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BdSaBqL7fuI/PStfMOb9OT43dBauY0V6RP0J/6i4BPY=;
 b=VEKp+Kp0YgR2m23TfBOMN0SE1Rdx7qbUZfoKfwjy6tLKnmUUW2mzHS7n7gh+MYiRt5
 U+QPFrqZJcR7vixO6ugbTpX9eFBC+ZnQ918VcZjqN4o2yqLI7pLZrD1S6zdhQNnQx/SC
 Qtl87Dyn5wxOuwJFvEfYNLOovaqDe3cGw2bUxeOLxwRRvf42mK7XQ19FlVkt25VXNVEa
 33qyeG+Bc4H65uZC9/tbHyza2XvOTq0Bz08860NqNn4B0OGXNwzy1Htf4Q+Y5VTP2/19
 eJnbHk59ATp/c7Sl8/FEiKCl0jKUSEFOXF2Ir3jjKXmOjHyjDL4wG6BaPAkarYt9Ht7W
 uHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BdSaBqL7fuI/PStfMOb9OT43dBauY0V6RP0J/6i4BPY=;
 b=kzLdGYIR784LXoPTYf0C/JE4yHARSml9dp5/xL9LeUWqDJ5gT1L1Lt6LcSJh+iRONQ
 Rgn8rhQ8lmF111W+S450q+TW4MHV2q6u0yVHErV16NnfLlPc+SUaNxis1GYHUUkyhRs2
 8r4K1uwY7JJG2kOAdSt8MmY8oRnEbzx9rxyrwvursh5kvpjoK1S71pSBOOg8QEcuqnuN
 6GtXRI5sqg3H5zobKG7q0NpoRp5VkdXd3uKIORtZtwedO2CFfOYdWOirheFhVm4NxLhS
 KfyJAqsk5nXZccpVey3GEUX77NdqcZ+IzHjl4FpX8wiNCbblAoDpvccxSDMoEpqZ/e4l
 JEIQ==
X-Gm-Message-State: ACrzQf3+P9O0wZKATJlyc8hepRuXdnj7I9iMbYN8D00r/JV5u5S5vJLB
 7TMdYYjlXbbFkVsn2NwFisSYHbWx7y9A1XI2XDk=
X-Google-Smtp-Source: AMsMyM7FafYCPr2OX/g4eFMuTURwvutVfBg8K9NhKKelPQ3m4NlduuSgq02SnbxuY1c2KgQSDPsGthxNCb+ktOpDAUE=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr9080091ljp.267.1664279657768; Tue, 27
 Sep 2022 04:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-11-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-11-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:05 +0400
Message-ID: <CAJ+F1CLnjL80zO7_FHDQp-w2_rkXa2-U1pgVOTmAsJLP23DT1A@mail.gmail.com>
Subject: Re: [PATCH 11/12] audio: fix sw->buf size for audio recording
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ceeb1f05e9a74dd3"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000ceeb1f05e9a74dd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:48 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> The calculation of the buffer size needed to store audio samples
> after resampling is wrong for audio recording. For audio recording
> sw->ratio is calculated as
>
> sw->ratio =3D frontend sample rate / backend sample rate.
>
> From this follows
>
> frontend samples =3D frontend sample rate / backend sample rate
>  * backend samples
> frontend samples =3D sw->ratio * backend samples
>
> In 2 of 3 places in the audio recording code where sw->ratio
> is used in a calculation to get the number of frontend frames,
> the calculation is wrong. Fix this. The 3rd formula in
> audio_pcm_sw_read() is correct.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/71
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Would you mind adding the test to qtest?

lgtm
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c          | 2 +-
>  audio/audio_template.h | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index ba0c62b120..60c7472d37 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -995,7 +995,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
>   */
>  static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
>  {
> -    return ((int64_t)frames_in << 32) / sw->ratio;
> +    return (int64_t)frames_in * sw->ratio >> 32;
>  }
>
>  static size_t audio_get_avail (SWVoiceIn *sw)
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 7192b19e73..6a0337ac6b 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -112,7 +112,11 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE=
)
> (SW *sw)
>          return 0;
>      }
>
> +#ifdef DAC
>      samples =3D ((int64_t) sw->HWBUF->size << 32) / sw->ratio;
> +#else
> +    samples =3D (int64_t)sw->HWBUF->size * sw->ratio >> 32;
> +#endif
>
>      sw->buf =3D audio_calloc(__func__, samples, sizeof(struct st_sample)=
);
>      if (!sw->buf) {
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ceeb1f05e9a74dd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:48 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The calculation of the buffer size needed to store aud=
io samples<br>
after resampling is wrong for audio recording. For audio recording<br>
sw-&gt;ratio is calculated as<br>
<br>
sw-&gt;ratio =3D frontend sample rate / backend sample rate.<br>
<br>
From this follows<br>
<br>
frontend samples =3D frontend sample rate / backend sample rate<br>
=C2=A0* backend samples<br>
frontend samples =3D sw-&gt;ratio * backend samples<br>
<br>
In 2 of 3 places in the audio recording code where sw-&gt;ratio<br>
is used in a calculation to get the number of frontend frames,<br>
the calculation is wrong. Fix this. The 3rd formula in<br>
audio_pcm_sw_read() is correct.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/71" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/71</a><br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Would you mind adding the test to qtest?</div></div><div class=3D=
"gmail_quote"><div><br></div><div>lgtm<br></div><div>Acked-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/audio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0audio/audio_template.h | 4 ++++<br>
=C2=A02 files changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index ba0c62b120..60c7472d37 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -995,7 +995,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)<br>
=C2=A0 */<br>
=C2=A0static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_i=
n)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return ((int64_t)frames_in &lt;&lt; 32) / sw-&gt;ratio;<br>
+=C2=A0 =C2=A0 return (int64_t)frames_in * sw-&gt;ratio &gt;&gt; 32;<br>
=C2=A0}<br>
<br>
=C2=A0static size_t audio_get_avail (SWVoiceIn *sw)<br>
diff --git a/audio/audio_template.h b/audio/audio_template.h<br>
index 7192b19e73..6a0337ac6b 100644<br>
--- a/audio/audio_template.h<br>
+++ b/audio/audio_template.h<br>
@@ -112,7 +112,11 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) =
(SW *sw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#ifdef DAC<br>
=C2=A0 =C2=A0 =C2=A0samples =3D ((int64_t) sw-&gt;HWBUF-&gt;size &lt;&lt; 3=
2) / sw-&gt;ratio;<br>
+#else<br>
+=C2=A0 =C2=A0 samples =3D (int64_t)sw-&gt;HWBUF-&gt;size * sw-&gt;ratio &g=
t;&gt; 32;<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0sw-&gt;buf =3D audio_calloc(__func__, samples, sizeof(s=
truct st_sample));<br>
=C2=A0 =C2=A0 =C2=A0if (!sw-&gt;buf) {<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000ceeb1f05e9a74dd3--

