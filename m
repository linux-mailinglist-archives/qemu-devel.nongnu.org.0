Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777125EC468
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:28:44 +0200 (CEST)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAdf-0007Ts-IU
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AW-0002cE-0o
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:37 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AR-0006Yx-9v
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:31 -0400
Received: by mail-lf1-x12f.google.com with SMTP id a2so15311908lfb.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wJMZAtJg+mckNFI52ekXM0rmA0Xe7VWM5hEnUgz3Ngw=;
 b=bFBavcq9t2baPSf0H2PHCFuBYtiC/0eoz4hPLn5K7aQ+eWmLbo0NSuOd8+IE616BQ8
 2nQO0cn1M9TOT8DuH3TKR4w9Z2RkmkK18paWNC04dz23H8hGVohQyznOQex/ByrBi/HS
 SC5h1l40kFTAS822RIXJNtlmvdNUqaT4T/Zjazjq1ssqZvSq3N7r5hHQfzj1pzrWx3Zb
 kNUWkV4F52k3cHdUvQlhUa28KLxiqCwGW5huCexxgpLoO9EFB7mmSQVtwP4IUsc6VTZd
 AlmV2fkac2u9HqcVfYmaRM8YY1qkm6WQ61sMi7BUj4K+YjU5CK4UMtaq3EAZ6/tefoW0
 QqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wJMZAtJg+mckNFI52ekXM0rmA0Xe7VWM5hEnUgz3Ngw=;
 b=YXmxEuiyuNmcdw2csS+ewiI2+unUL3JrEKVo2JGkEDny0MqTtotrg97CmkSgPmgBxO
 +gbB84wRCeKF/GGncJ7vjrdPLs7QCrkgDo4/9E8FpGYuwv3C/p4V1oVB36hx726EqVcQ
 Dyo3J7iRSQIgJknGt3u3KXUj2ATdSZfQo9/lVv5VIj6jVKozfm5TQpOpdocxW1l3Ye0m
 SM7Hg4Md9D0+hIeSzJw3xCDhHllM81JrCAVUZ+cPEtoDrG4Rkff8AgZQ1P8USf3jzbcb
 qkiGQhEtzVsHW58FymKvxh8OAdr1diR7tOZDxe7Fb5IIWf17z20Ms5DGkZ7pdZxs3prZ
 1ihg==
X-Gm-Message-State: ACrzQf3+SCXzSrnuCDuszKtfDCNChcAi9RxlNUZOrim/YX+3yL+vpUAX
 FKbUhsXk67qQvUHzj0O3iGjKT+Mj19Eo25s54Pw=
X-Google-Smtp-Source: AMsMyM6tNrtXHsF7DGSceW2gMO9lrVOOxxtik0eqgcbKaUeWyEBAaBb147cACj3KcZdgDzPVv1RrHsmb24OunjHvCXk=
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id
 d24-20020a0565123d1800b00498fafb229fmr12000903lfv.356.1664279665577; Tue, 27
 Sep 2022 04:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-9-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-9-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:13 +0400
Message-ID: <CAJ+F1CJCgXyxzZ5_oXLK=AqNDXMe_fsN7Pu6i7=KKNvcArJCbQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] audio: rename audio_sw_bytes_free()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000046156105e9a74ea8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

--00000000000046156105e9a74ea8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:38 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Rename and refactor audio_sw_bytes_free(). This function is not
> limited to calculate the free audio buffer size. The renamed
> function returns the number of frames instead of bytes.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 233a86c440..dd66b745e5 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1010,9 +1010,16 @@ static size_t audio_get_avail (SWVoiceIn *sw)
>      return (((int64_t) live << 32) / sw->ratio) *
> sw->info.bytes_per_frame;
>  }
>
> -static size_t audio_sw_bytes_free(SWVoiceOut *sw, size_t free)
> +/**
> + * audio_frontend_frames_out() - returns the number of frames needed to
> + * get frames_out frames after resampling
> + *
> + * @sw: audio playback frontend
> + * @frames_out: number of frames
> + */
> +static size_t audio_frontend_frames_out(SWVoiceOut *sw, size_t frames_ou=
t)
>  {
> -    return (((int64_t)free << 32) / sw->ratio) * sw->info.bytes_per_fram=
e;
> +    return ((int64_t)frames_out << 32) / sw->ratio;
>  }
>
>  static size_t audio_get_free(SWVoiceOut *sw)
> @@ -1034,8 +1041,8 @@ static size_t audio_get_free(SWVoiceOut *sw)
>      dead =3D sw->hw->mix_buf->size - live;
>
>  #ifdef DEBUG_OUT
> -    dolog("%s: get_free live %zu dead %zu sw_bytes %zu\n",
> -          SW_NAME(sw), live, dead, audio_sw_bytes_free(sw, dead));
> +    dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
> +          SW_NAME(sw), live, dead, audio_frontend_frames_out(sw, dead));
>  #endif
>
>      return dead;
> @@ -1156,13 +1163,14 @@ static void audio_run_out (AudioState *s)
>                  size_t free;
>
>                  if (hw_free > sw->total_hw_samples_mixed) {
> -                    free =3D audio_sw_bytes_free(sw,
> +                    free =3D audio_frontend_frames_out(sw,
>                          MIN(sw_free, hw_free -
> sw->total_hw_samples_mixed));
>                  } else {
>                      free =3D 0;
>                  }
>                  if (free > 0) {
> -                    sw->callback.fn(sw->callback.opaque, free);
> +                    sw->callback.fn(sw->callback.opaque,
> +                                    free * sw->info.bytes_per_frame);
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

--00000000000046156105e9a74ea8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:38 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Rename and refactor audio_sw_bytes_free(). This functi=
on is not<br>
limited to calculate the free audio buffer size. The renamed<br>
function returns the number of frames instead of bytes.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/audio.c | 20 ++++++++++++++------<br>
=C2=A01 file changed, 14 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 233a86c440..dd66b745e5 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1010,9 +1010,16 @@ static size_t audio_get_avail (SWVoiceIn *sw)<br>
=C2=A0 =C2=A0 =C2=A0return (((int64_t) live &lt;&lt; 32) / sw-&gt;ratio) * =
sw-&gt;info.bytes_per_frame;<br>
=C2=A0}<br>
<br>
-static size_t audio_sw_bytes_free(SWVoiceOut *sw, size_t free)<br>
+/**<br>
+ * audio_frontend_frames_out() - returns the number of frames needed to<br=
>
+ * get frames_out frames after resampling<br>
+ *<br>
+ * @sw: audio playback frontend<br>
+ * @frames_out: number of frames<br>
+ */<br>
+static size_t audio_frontend_frames_out(SWVoiceOut *sw, size_t frames_out)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (((int64_t)free &lt;&lt; 32) / sw-&gt;ratio) * sw-&gt=
;info.bytes_per_frame;<br>
+=C2=A0 =C2=A0 return ((int64_t)frames_out &lt;&lt; 32) / sw-&gt;ratio;<br>
=C2=A0}<br>
<br>
=C2=A0static size_t audio_get_free(SWVoiceOut *sw)<br>
@@ -1034,8 +1041,8 @@ static size_t audio_get_free(SWVoiceOut *sw)<br>
=C2=A0 =C2=A0 =C2=A0dead =3D sw-&gt;hw-&gt;mix_buf-&gt;size - live;<br>
<br>
=C2=A0#ifdef DEBUG_OUT<br>
-=C2=A0 =C2=A0 dolog(&quot;%s: get_free live %zu dead %zu sw_bytes %zu\n&qu=
ot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SW_NAME(sw), live, dead, audio_sw_bytes=
_free(sw, dead));<br>
+=C2=A0 =C2=A0 dolog(&quot;%s: get_free live %zu dead %zu frontend frames %=
zu\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SW_NAME(sw), live, dead, audio_frontend=
_frames_out(sw, dead));<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0return dead;<br>
@@ -1156,13 +1163,14 @@ static void audio_run_out (AudioState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t free;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hw_free &=
gt; sw-&gt;total_hw_samples_mixed) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free=
 =3D audio_sw_bytes_free(sw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free=
 =3D audio_frontend_frames_out(sw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MIN(sw_free, hw_free - sw-&gt;total_hw_samples_mixed));<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0free =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (free &gt;=
 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw-&=
gt;callback.fn(sw-&gt;callback.opaque, free);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw-&=
gt;callback.fn(sw-&gt;callback.opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free * sw-&gt;info.byt=
es_per_frame);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000046156105e9a74ea8--

