Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C855EC563
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:03:23 +0200 (CEST)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBBC-0007hO-3c
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AV-0002bq-3p
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:33 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AO-0006Yt-RL
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:29 -0400
Received: by mail-lj1-x22c.google.com with SMTP id p5so10592811ljc.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UjSA9GI8lbrHc5ZlS6OZVv1Ikmsuc6snCawJSbByiv8=;
 b=pF5Fn2lguBkyfy03jg4Pv/1YNX61O6JO208VTtfm+hxMX81GQeYcaKi1AgnJxqgZZ5
 3tNfdn1SpNpP+6fn5YQM4sRWgqq/GoaFOKNVEy0UibSfcUVVZuqCDvvL8aJQlunh+jUj
 5oGrE98w0ZVErS5ZuvIqIrZXdiJb4kccVnRDl9kAH+81Z26FGktJOViWJWHaRkhD+N73
 fGWRQk8WryMzLcilfEh3X1t/Fbpft063UPulWNRkEuc1bdUs5k2K2FoAN/Pe7Y5jgLeO
 dZb8IX3bwl+6RbnGZt73RPrISQ8ajrY39MkQbYXmqJBSy0Y5atw9Qzalz1xGgAepIypF
 AfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UjSA9GI8lbrHc5ZlS6OZVv1Ikmsuc6snCawJSbByiv8=;
 b=3dxwHI1/1nZT1NGe+Obiu7KvQT6lDpJUqxzvB5VbZVAbYiffwexAVWqdXzLujNGqQw
 5tHEHnusyoQt5RALc8eTUCGdmgPhCMyd63f9FRMkmUN17Ln1iQs24mvVV0UC9PE8x9wE
 8BwxNZPZ3HpwyETC9/gfztQe1vcjfO7EHwOBL/FFJ1BpMgwMnOX7PpRnkZ+XRHVu8UL+
 b9TLW5AxTlbhE8fbOmL7ySPpfcPiAdgfoV4SMuagI+heD2JvxWtssXfibP3/aEX4zw3Y
 INYpEB4+Xq+cv2iO6GcTXVULvQ6F8farvs2AqRnwQ0Se0fNlcOgsPZHyCiAT8P+Xar1c
 mWsQ==
X-Gm-Message-State: ACrzQf1D36HFezZGQoYOvy7QdS/HgEKv1GdHVqNq6AKmxTHDFLtrU/Xt
 88xRZuWF9tXB5h1BeVs3xDnBwhYSnUyxhi9XI28=
X-Google-Smtp-Source: AMsMyM4AnY7k73e5es4xR380O7AtJnWSYBebVpQV72RgerQgyrMOfYK/ZLjOgjc/OBwVffkwm6Q9CoBvb2FewGwYGRA=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr9206060ljn.94.1664279663122; Tue, 27
 Sep 2022 04:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-10-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-10-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:10 +0400
Message-ID: <CAJ+F1CJ8c0sE3=p8zgHiTD5w_kUMujrcp+QxJNZiP3fvHaTOcA@mail.gmail.com>
Subject: Re: [PATCH 10/12] audio: refactor audio_get_avail()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000209d6505e9a74e8d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000209d6505e9a74e8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:51 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Split out the code in audio_get_avail() that calculates the
> buffer size that the audio frontend can read. This is similar
> to the code changes in audio_get_free().
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index dd66b745e5..ba0c62b120 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -986,6 +986,18 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
>      }
>  }
>
> +/**
> + * audio_frontend_frames_in() - returns the number of frames the
> resampling
> + * code generates from frames_in frames
> + *
> + * @sw: audio recording frontend
> + * @frames_in: number of frames
> + */
> +static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
> +{
> +    return ((int64_t)frames_in << 32) / sw->ratio;
> +}
> +
>  static size_t audio_get_avail (SWVoiceIn *sw)
>  {
>      size_t live;
> @@ -1002,12 +1014,12 @@ static size_t audio_get_avail (SWVoiceIn *sw)
>      }
>
>      ldebug (
> -        "%s: get_avail live %zu ret %" PRId64 "\n",
> +        "%s: get_avail live %zu frontend frames %zu\n",
>          SW_NAME (sw),
> -        live, (((int64_t) live << 32) / sw->ratio) *
> sw->info.bytes_per_frame
> +        live, audio_frontend_frames_in(sw, live)
>          );
>
> -    return (((int64_t) live << 32) / sw->ratio) *
> sw->info.bytes_per_frame;
> +    return live;
>  }
>
>  /**
> @@ -1309,11 +1321,13 @@ static void audio_run_in (AudioState *s)
>              sw->total_hw_samples_acquired -=3D min;
>
>              if (sw->active) {
> +                size_t sw_avail =3D audio_get_avail(sw);
>                  size_t avail;
>
> -                avail =3D audio_get_avail (sw);
> +                avail =3D audio_frontend_frames_in(sw, sw_avail);
>                  if (avail > 0) {
> -                    sw->callback.fn (sw->callback.opaque, avail);
> +                    sw->callback.fn(sw->callback.opaque,
> +                                    avail * sw->info.bytes_per_frame);
>                  }
>              }
>          }
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000209d6505e9a74e8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:51 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Split out the code in audio_get_avail() that calculate=
s the<br>
buffer size that the audio frontend can read. This is similar<br>
to the code changes in audio_get_free().<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/audio.c | 24 +++++++++++++++++++-----<br>
=C2=A01 file changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index dd66b745e5..ba0c62b120 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -986,6 +986,18 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/**<br>
+ * audio_frontend_frames_in() - returns the number of frames the resamplin=
g<br>
+ * code generates from frames_in frames<br>
+ *<br>
+ * @sw: audio recording frontend<br>
+ * @frames_in: number of frames<br>
+ */<br>
+static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)<br=
>
+{<br>
+=C2=A0 =C2=A0 return ((int64_t)frames_in &lt;&lt; 32) / sw-&gt;ratio;<br>
+}<br>
+<br>
=C2=A0static size_t audio_get_avail (SWVoiceIn *sw)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0size_t live;<br>
@@ -1002,12 +1014,12 @@ static size_t audio_get_avail (SWVoiceIn *sw)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ldebug (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: get_avail live %zu ret %&quot; PRId6=
4 &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: get_avail live %zu frontend frames %=
zu\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SW_NAME (sw),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 live, (((int64_t) live &lt;&lt; 32) / sw-&gt;r=
atio) * sw-&gt;info.bytes_per_frame<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 live, audio_frontend_frames_in(sw, live)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
<br>
-=C2=A0 =C2=A0 return (((int64_t) live &lt;&lt; 32) / sw-&gt;ratio) * sw-&g=
t;info.bytes_per_frame;<br>
+=C2=A0 =C2=A0 return live;<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -1309,11 +1321,13 @@ static void audio_run_in (AudioState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sw-&gt;total_hw_samples_acq=
uired -=3D min;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sw-&gt;active) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t sw_avail =
=3D audio_get_avail(sw);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t avail;=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D audio_ge=
t_avail (sw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D audio_fr=
ontend_frames_in(sw, sw_avail);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (avail &gt=
; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw-&=
gt;callback.fn (sw-&gt;callback.opaque, avail);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw-&=
gt;callback.fn(sw-&gt;callback.opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avail * sw-&gt;info.by=
tes_per_frame);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000209d6505e9a74e8d--

