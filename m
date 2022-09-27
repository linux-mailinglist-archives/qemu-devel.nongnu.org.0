Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F875EC4CF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:44:41 +0200 (CEST)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAt6-0000tl-M9
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Ai-0002h6-3S
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:55 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Af-0006Zx-Ol
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:43 -0400
Received: by mail-lf1-x131.google.com with SMTP id bu25so13432251lfb.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9XcX+vukxwEFNX8/4TgHjhApQ3EbnOuN7LIEclCoXKs=;
 b=G5aCBljpVMK3uwwbcKHH/NEXSEiF+G5XeD0/aNu8AYKv8YlRqpb7KL2wK0evbVTrOp
 RlPkmxQH0sC5qqN+qzZRZjH0eSmMWmOIs3QbvYT5qu3QNZaNoPEelp5pcdE+HgEnuZmD
 rdOLxqkF6j26oF7drYTWAwWrGQtVpE7mLxYVhYBXCkKe5/L5y1+XAI9sBu6EWAhBIRR8
 JCZHIC2+2cAKFhX5mbqzXRVR0WMdBaQ/Xa/Hm1NuwbEhAAVjQ6VBrecj1kz+RfcVXgBL
 XlBa/Hrmjm8k5Z3DflzmA0xU7cNwBwNFza6nt8brGrdsFOAAGqaqB5VGJvyxRH1RkFJ+
 P7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9XcX+vukxwEFNX8/4TgHjhApQ3EbnOuN7LIEclCoXKs=;
 b=cPlpAbJCvBocrTbJh/Gjr+1lsDqgOcNfBzPQ2w2Pasila44q8QiyqJcSiP+36gQGO8
 ATJbslqPtN7Y67krXf49yMuiB9vDREkuuR44dSXxWheiD5zk7oKOw/cywC/SZMCRx/Z4
 eH8qrpu7koh0x0GSp3IADFZrBoM6PKuOdqDxmYHZcnGXO9jVa4F6aflMqAJmqQPu5MA6
 xyMlwHACaEtG/un6UazpIHT/P3yEfMPcymYzVAfVoptGB4XMZkLSyWofpyoEeYpGPiph
 1Zq4MQsSHnQDYVgkuHlPMDFkESronXVLi4Bk+UzBEmbQvv+n3IHf2AH2qKxlQI5l3J0b
 o2zg==
X-Gm-Message-State: ACrzQf3bQwjn35w0Q+qV5gto4x0Qb78eFdGogevg34VyrIxlbaAXDTlz
 5IzNGRH3KXwM3q+Cy8REXdsRHncQcm55Mvg5uz4=
X-Google-Smtp-Source: AMsMyM7ctstFB6TthDMIboIdjuHAUe6DBAVsZbYkZV2kzTB2obuTJ9xrLH4gv1suZblf0cAsQkxVHaJRCusqonigdaE=
X-Received: by 2002:ac2:5e66:0:b0:49e:bce2:3df5 with SMTP id
 a6-20020ac25e66000000b0049ebce23df5mr10472333lfr.362.1664279676547; Tue, 27
 Sep 2022 04:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-5-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-5-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:23 +0400
Message-ID: <CAJ+F1CKO7DCTKJgEWc4roTyN9Ozp0hw_L2OiQFvS-0nRHFKhRw@mail.gmail.com>
Subject: Re: [PATCH 05/12] audio: add more audio rate control functions
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ed77fa05e9a74ed1"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--000000000000ed77fa05e9a74ed1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:43 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> The next patch needs two new rate control functions. The first
> one returns the bytes needed at call time to maintain the
> selected rate. The second one adjusts the bytes actually sent.
>
> Split the audio_rate_get_bytes() function into these two
> functions and reintroduce audio_rate_get_bytes().
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c     | 35 ++++++++++++++++++++++++-----------
>  audio/audio_int.h |  2 ++
>  2 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 9e55834909..557538a7b7 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2250,26 +2250,39 @@ void audio_rate_start(RateCtl *rate)
>      rate->start_ticks =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  }
>
> -size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
> -                            size_t bytes_avail)
> +size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info)
>  {
>      int64_t now;
>      int64_t ticks;
>      int64_t bytes;
> -    int64_t samples;
> -    size_t ret;
> +    int64_t frames;
>
>      now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      ticks =3D now - rate->start_ticks;
>      bytes =3D muldiv64(ticks, info->bytes_per_second,
> NANOSECONDS_PER_SECOND);
> -    samples =3D (bytes - rate->bytes_sent) / info->bytes_per_frame;
> -    if (samples < 0 || samples > 65536) {
> -        AUD_log(NULL, "Resetting rate control (%" PRId64 " samples)\n",
> samples);
> +    frames =3D (bytes - rate->bytes_sent) / info->bytes_per_frame;
> +    if (frames < 0 || frames > 65536) {
> +        AUD_log(NULL, "Resetting rate control (%" PRId64 " frames)\n",
> frames);
>          audio_rate_start(rate);
> -        samples =3D 0;
> +        frames =3D 0;
>      }
>
> -    ret =3D MIN(samples * info->bytes_per_frame, bytes_avail);
> -    rate->bytes_sent +=3D ret;
> -    return ret;
> +    return frames * info->bytes_per_frame;
> +}
> +
> +void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used)
> +{
> +    rate->bytes_sent +=3D bytes_used;
> +}
> +
> +size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
> +                            size_t bytes_avail)
> +{
> +    size_t bytes;
> +
> +    bytes =3D audio_rate_peek_bytes(rate, info);
> +    bytes =3D MIN(bytes, bytes_avail);
> +    audio_rate_add_bytes(rate, bytes);
> +
> +    return bytes;
>  }
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 2a6914d2aa..97e20e8429 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -263,6 +263,8 @@ typedef struct RateCtl {
>  } RateCtl;
>
>  void audio_rate_start(RateCtl *rate);
> +size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info)=
;
> +void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);
>  size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
>                              size_t bytes_avail);
>
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ed77fa05e9a74ed1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:43 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The next patch needs two new rate control functions. T=
he first<br>
one returns the bytes needed at call time to maintain the<br>
selected rate. The second one adjusts the bytes actually sent.<br>
<br>
Split the audio_rate_get_bytes() function into these two<br>
functions and reintroduce audio_rate_get_bytes().<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/audio.c=C2=A0 =C2=A0 =C2=A0| 35 ++++++++++++++++++++++++-------=
----<br>
=C2=A0audio/audio_int.h |=C2=A0 2 ++<br>
=C2=A02 files changed, 26 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 9e55834909..557538a7b7 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -2250,26 +2250,39 @@ void audio_rate_start(RateCtl *rate)<br>
=C2=A0 =C2=A0 =C2=A0rate-&gt;start_ticks =3D qemu_clock_get_ns(QEMU_CLOCK_V=
IRTUAL);<br>
=C2=A0}<br>
<br>
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 size_t bytes_avail)<br>
+size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int64_t now;<br>
=C2=A0 =C2=A0 =C2=A0int64_t ticks;<br>
=C2=A0 =C2=A0 =C2=A0int64_t bytes;<br>
-=C2=A0 =C2=A0 int64_t samples;<br>
-=C2=A0 =C2=A0 size_t ret;<br>
+=C2=A0 =C2=A0 int64_t frames;<br>
<br>
=C2=A0 =C2=A0 =C2=A0now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
=C2=A0 =C2=A0 =C2=A0ticks =3D now - rate-&gt;start_ticks;<br>
=C2=A0 =C2=A0 =C2=A0bytes =3D muldiv64(ticks, info-&gt;bytes_per_second, NA=
NOSECONDS_PER_SECOND);<br>
-=C2=A0 =C2=A0 samples =3D (bytes - rate-&gt;bytes_sent) / info-&gt;bytes_p=
er_frame;<br>
-=C2=A0 =C2=A0 if (samples &lt; 0 || samples &gt; 65536) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AUD_log(NULL, &quot;Resetting rate control (%&=
quot; PRId64 &quot; samples)\n&quot;, samples);<br>
+=C2=A0 =C2=A0 frames =3D (bytes - rate-&gt;bytes_sent) / info-&gt;bytes_pe=
r_frame;<br>
+=C2=A0 =C2=A0 if (frames &lt; 0 || frames &gt; 65536) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AUD_log(NULL, &quot;Resetting rate control (%&=
quot; PRId64 &quot; frames)\n&quot;, frames);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0audio_rate_start(rate);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 samples =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 frames =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 ret =3D MIN(samples * info-&gt;bytes_per_frame, bytes_avail)=
;<br>
-=C2=A0 =C2=A0 rate-&gt;bytes_sent +=3D ret;<br>
-=C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 return frames * info-&gt;bytes_per_frame;<br>
+}<br>
+<br>
+void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used)<br>
+{<br>
+=C2=A0 =C2=A0 rate-&gt;bytes_sent +=3D bytes_used;<br>
+}<br>
+<br>
+size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 size_t bytes_avail)<br>
+{<br>
+=C2=A0 =C2=A0 size_t bytes;<br>
+<br>
+=C2=A0 =C2=A0 bytes =3D audio_rate_peek_bytes(rate, info);<br>
+=C2=A0 =C2=A0 bytes =3D MIN(bytes, bytes_avail);<br>
+=C2=A0 =C2=A0 audio_rate_add_bytes(rate, bytes);<br>
+<br>
+=C2=A0 =C2=A0 return bytes;<br>
=C2=A0}<br>
diff --git a/audio/audio_int.h b/audio/audio_int.h<br>
index 2a6914d2aa..97e20e8429 100644<br>
--- a/audio/audio_int.h<br>
+++ b/audio/audio_int.h<br>
@@ -263,6 +263,8 @@ typedef struct RateCtl {<br>
=C2=A0} RateCtl;<br>
<br>
=C2=A0void audio_rate_start(RateCtl *rate);<br>
+size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info);<=
br>
+void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);<br>
=C2=A0size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rat=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t bytes_avail);<br>
<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000ed77fa05e9a74ed1--

