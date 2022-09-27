Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262715EC4AB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:40:09 +0200 (CEST)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAoh-0002iM-OE
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Aj-0002h8-00
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:55 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Af-0006aG-Qs
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:44 -0400
Received: by mail-lf1-x136.google.com with SMTP id d42so15418684lfv.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=U2gxc5nxmL46XGztOIFhAMX1aYULHt67avmFBvOV9OE=;
 b=S6iRnjlcL54l1Sbq+qXnEyomiM6SfO+FcbaPnTjofTXKKZwhkNOtKraM7lGAYfwMrg
 eUuNGct0St6vcLb8Hw7KhsoWUL+9uTqL3jRgGLGmsYQlulU9VI6TGGjZGD0AD3fwXu8y
 k5O79IswXSqI3fRhUq+jt+JUtdnToQu6AuDm9LgtsFH0cG/Fnag2jJS12OgxwiED4QPk
 1zYS4tnGGVdJTQfffMz+V56a9E7yKNyu7JxbZlL1jUzfZ8NUCcrT/bXmqxXMOSUpmzzi
 /4DvrzKQFOj7yJP/2/jam6fgFlSDvw6f8kmXpM2PLtT+pHYJXzlciA91EhMhHGlnZ+lY
 bDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=U2gxc5nxmL46XGztOIFhAMX1aYULHt67avmFBvOV9OE=;
 b=fyR0JVDKyUioBqk8FcXNaEidgQV8vZ2VcG9YR3gIM8zxB9o72SOJhRRvD4/fOpsHGM
 T1EavUroodo1rBx9gTS1etoTYeRM1jWzK/O4Vyk5s+so7yVGjJ6VEhLtl2isHEwkD+/B
 OZRQIqdWg+GqnGnltcOAswaxdO6nb4kFZxQ2JhFrkC5vlYvzgX7KCEY6dUBuAhaMPlNa
 tMcmfV+FufnN9j5Op5Sk8yZQXvMPokmok2vG/V+2Fc2Pf7iR2X/JOvtMAKLXQ5zb9iKb
 vfMPzDTOX3tQoL83LwO5rZtFGyJquS3LyPs7lHZCGuXXwPFFYP/f3vWfQZTIBWmCs7C8
 hPnA==
X-Gm-Message-State: ACrzQf0N85LcgNeb0EYKdIeeV+2RyEtllQqosgk6U2ankIxgkPLNqyhT
 s+ozTZJrW9ITd4ZYkwCZQH/aLLKG2ReRurjWz3U=
X-Google-Smtp-Source: AMsMyM7r6eIf91VKaHT0fr9nZTdtITQ6hIuYn562VfOJtyV125OsIoQ2Oox7HdU0sNvG57FfCGdDs9L+FRlDEqbvDEc=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr11260382lff.329.1664279677919; Tue, 27
 Sep 2022 04:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-4-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-4-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:25 +0400
Message-ID: <CAJ+F1CJMiMPKHMAEJyrpE3DT1VXXSN1t1nbSUk6TErtt62EHng@mail.gmail.com>
Subject: Re: [PATCH 04/12] alsaaudio: reduce playback latency
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000002658505e9a74f52"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--00000000000002658505e9a74f52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:51 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Change the buffer_get_free pcm_ops function to report the free
> ALSA playback buffer. The generic buffer becomes a temporary
> buffer and is empty after a call to audio_run_out().
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

lgtm
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  audio/alsaaudio.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
> index 4a61378cd7..7a2a94cd42 100644
> --- a/audio/alsaaudio.c
> +++ b/audio/alsaaudio.c
> @@ -602,6 +602,42 @@ static int alsa_open(bool in, struct alsa_params_req
> *req,
>      return -1;
>  }
>
> +static size_t alsa_buffer_get_free(HWVoiceOut *hw)
> +{
> +    ALSAVoiceOut *alsa =3D (ALSAVoiceOut *)hw;
> +    snd_pcm_sframes_t avail;
> +    size_t alsa_free, generic_free, generic_in_use;
> +
> +    avail =3D snd_pcm_avail_update(alsa->handle);
> +    if (avail < 0) {
> +        if (avail =3D=3D -EPIPE) {
> +            if (!alsa_recover(alsa->handle)) {
> +                avail =3D snd_pcm_avail_update(alsa->handle);
> +            }
> +        }
> +        if (avail < 0) {
> +            alsa_logerr(avail,
> +                        "Could not obtain number of available frames\n")=
;
> +            avail =3D 0;
> +        }
> +    }
> +
> +    alsa_free =3D avail * hw->info.bytes_per_frame;
> +    generic_free =3D audio_generic_buffer_get_free(hw);
> +    generic_in_use =3D hw->samples * hw->info.bytes_per_frame -
> generic_free;
> +    if (generic_in_use) {
> +        /*
> +         * This code can only be reached in the unlikely case that
> +         * snd_pcm_avail_update() returned a larger number of frames
> +         * than snd_pcm_writei() could write. Make sure that all
> +         * remaining bytes in the generic buffer can be written.
> +         */
> +        alsa_free =3D alsa_free > generic_in_use ? alsa_free -
> generic_in_use : 0;
> +    }
> +
> +    return alsa_free;
> +}
> +
>  static size_t alsa_write(HWVoiceOut *hw, void *buf, size_t len)
>  {
>      ALSAVoiceOut *alsa =3D (ALSAVoiceOut *) hw;
> @@ -916,7 +952,7 @@ static struct audio_pcm_ops alsa_pcm_ops =3D {
>      .init_out =3D alsa_init_out,
>      .fini_out =3D alsa_fini_out,
>      .write    =3D alsa_write,
> -    .buffer_get_free =3D audio_generic_buffer_get_free,
> +    .buffer_get_free =3D alsa_buffer_get_free,
>      .run_buffer_out =3D audio_generic_run_buffer_out,
>      .enable_out =3D alsa_enable_out,
>
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000002658505e9a74f52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:51 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Change the buffer_get_free pcm_ops function to report =
the free<br>
ALSA playback buffer. The generic buffer becomes a temporary<br>
buffer and is empty after a call to audio_run_out().<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div><div>lgtm<br></div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a h=
ref=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lure=
au@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0audio/alsaaudio.c | 38 +++++++++++++++++++++++++++++++++++++-<br>
=C2=A01 file changed, 37 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c<br>
index 4a61378cd7..7a2a94cd42 100644<br>
--- a/audio/alsaaudio.c<br>
+++ b/audio/alsaaudio.c<br>
@@ -602,6 +602,42 @@ static int alsa_open(bool in, struct alsa_params_req *=
req,<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
+static size_t alsa_buffer_get_free(HWVoiceOut *hw)<br>
+{<br>
+=C2=A0 =C2=A0 ALSAVoiceOut *alsa =3D (ALSAVoiceOut *)hw;<br>
+=C2=A0 =C2=A0 snd_pcm_sframes_t avail;<br>
+=C2=A0 =C2=A0 size_t alsa_free, generic_free, generic_in_use;<br>
+<br>
+=C2=A0 =C2=A0 avail =3D snd_pcm_avail_update(alsa-&gt;handle);<br>
+=C2=A0 =C2=A0 if (avail &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avail =3D=3D -EPIPE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!alsa_recover(alsa-&gt;handl=
e)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D snd_pcm_=
avail_update(alsa-&gt;handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avail &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa_logerr(avail,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Could not obtain number of available frames\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 alsa_free =3D avail * hw-&gt;info.bytes_per_frame;<br>
+=C2=A0 =C2=A0 generic_free =3D audio_generic_buffer_get_free(hw);<br>
+=C2=A0 =C2=A0 generic_in_use =3D hw-&gt;samples * hw-&gt;info.bytes_per_fr=
ame - generic_free;<br>
+=C2=A0 =C2=A0 if (generic_in_use) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This code can only be reached in the u=
nlikely case that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* snd_pcm_avail_update() returned a larg=
er number of frames<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* than snd_pcm_writei() could write. Mak=
e sure that all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* remaining bytes in the generic buffer =
can be written.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa_free =3D alsa_free &gt; generic_in_use ? =
alsa_free - generic_in_use : 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return alsa_free;<br>
+}<br>
+<br>
=C2=A0static size_t alsa_write(HWVoiceOut *hw, void *buf, size_t len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ALSAVoiceOut *alsa =3D (ALSAVoiceOut *) hw;<br>
@@ -916,7 +952,7 @@ static struct audio_pcm_ops alsa_pcm_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.init_out =3D alsa_init_out,<br>
=C2=A0 =C2=A0 =C2=A0.fini_out =3D alsa_fini_out,<br>
=C2=A0 =C2=A0 =C2=A0.write=C2=A0 =C2=A0 =3D alsa_write,<br>
-=C2=A0 =C2=A0 .buffer_get_free =3D audio_generic_buffer_get_free,<br>
+=C2=A0 =C2=A0 .buffer_get_free =3D alsa_buffer_get_free,<br>
=C2=A0 =C2=A0 =C2=A0.run_buffer_out =3D audio_generic_run_buffer_out,<br>
=C2=A0 =C2=A0 =C2=A0.enable_out =3D alsa_enable_out,<br>
<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000002658505e9a74f52--

