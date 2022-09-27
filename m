Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2545EC4C4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:42:45 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odArE-0004qq-FT
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Al-0002hF-UE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:55 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Ak-0006ZQ-6s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:47 -0400
Received: by mail-lf1-x133.google.com with SMTP id u18so15296127lfo.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8ERAEHtpnEgI1uLahCRWvXr8msK7O+zoEEquDGYtYiI=;
 b=MeGF0mVwpMcWHUvWOJUh+ESqOqzrgD/mfDtWq8MJ4HsrCFg70DbLELrBicsk26K7aJ
 0vPIny0kacB4YdvcXcgaEXLX3FX7cbcIlOWIk3T3v+dKwhZcx+nHVDjjy9840RHo9TyO
 tdlZwHmulg+rF3DukG2XL8Es6udqqbkkkouYR+vXEqDMZ5alNKvJ7LSz8mKUVUjig9P8
 KEdFxiFawGVqS/KzruzwPwR4wOWvIHk7i/JsoWoHz9OMbolipATRsKHzwA5vNSKjQVUF
 MovT8SZvzFCLPjIpJX/tr1j1/hFNdnR59IqsJ6fu5G0vKwFZSNIbfh833jxCBX/2YQDI
 /pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8ERAEHtpnEgI1uLahCRWvXr8msK7O+zoEEquDGYtYiI=;
 b=dYmGKlNThHqzMxbMsSyo1GCfhm1cIj68q/6l2LnUfEDaGJjb6NMxpS2lUSIOyENrSc
 3oEJ4FeDWK7ynEE4eTIJ0bOHOB81BjAUTbDfL/RoEXhyD6HfZFqtC25lJmmI7B0Wk/6S
 9eVyp+/BYzBms02r4LbuH9/IOfoNOZ/VEjrF3tplVL7pATEW2Eib+goFGM0tGf1DaIog
 b0VHW7+JR3Ic79Su95Z5D5FXMCLTR1ri7yDfWPXvtqhBayafgFnxZ8ZyasZPzGWM9PXQ
 DKDEpZu+O/rk5JlH49v90wnwZaUTQxxKVR5lQQeentmmo2we7zSIR1vXeuRrbw1YE0MR
 jdJg==
X-Gm-Message-State: ACrzQf2Y1gSJnBZu9wXHwQYfMu/LYw3iPjuijAXWerU9bkC1zjtgUUcl
 FWNHI7eo0df6R25xxfAEDosfvYOiTInpozSGTjM=
X-Google-Smtp-Source: AMsMyM5nterRgGBW68nbY6DBucmzJjMuCeCTOwbtD+NuFV1sEGk05h48IFzaTslRtLuNEY5YNJ/dc87d6qQUcnSFwAQ=
X-Received: by 2002:a05:6512:201b:b0:497:a29d:25c1 with SMTP id
 a27-20020a056512201b00b00497a29d25c1mr11538637lfb.276.1664279685498; Tue, 27
 Sep 2022 04:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-1-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:33 +0400
Message-ID: <CAJ+F1CLWu9NqV=pYTgFy7GqfUYKuR2t5H161Da3MOOWiJ0nAvA@mail.gmail.com>
Subject: Re: [PATCH 01/12] audio: refactor code in audio_run_out()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000760ca305e9a74f6f"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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

--000000000000760ca305e9a74f6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:43 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Refactoring the code in audio_run_out() avoids code duplication
> in the next patch. There's no functional change.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index cfa4119c05..04f685fe24 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1121,8 +1121,12 @@ static void audio_run_out (AudioState *s)
>      HWVoiceOut *hw =3D NULL;
>      SWVoiceOut *sw;
>
> -    if (!audio_get_pdo_out(s->dev)->mixing_engine) {
> -        while ((hw =3D audio_pcm_hw_find_any_enabled_out(s, hw))) {
> +    while ((hw =3D audio_pcm_hw_find_any_enabled_out(s, hw))) {
> +        size_t played, live, prev_rpos;
> +        size_t hw_free =3D audio_pcm_hw_get_free(hw);
> +        int nb_live;
> +
> +        if (!audio_get_pdo_out(s->dev)->mixing_engine) {
>              /* there is exactly 1 sw for each hw with no mixeng */
>              sw =3D hw->sw_head.lh_first;
>
> @@ -1137,14 +1141,9 @@ static void audio_run_out (AudioState *s)
>              if (sw->active) {
>                  sw->callback.fn(sw->callback.opaque, INT_MAX);
>              }
> -        }
> -        return;
> -    }
>
> -    while ((hw =3D audio_pcm_hw_find_any_enabled_out(s, hw))) {
> -        size_t played, live, prev_rpos;
> -        size_t hw_free =3D audio_pcm_hw_get_free(hw);
> -        int nb_live;
> +            continue;
> +        }
>
>          for (sw =3D hw->sw_head.lh_first; sw; sw =3D sw->entries.le_next=
) {
>              if (sw->active) {
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000760ca305e9a74f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:43 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Refactoring the code in audio_run_out() avoids code du=
plication<br>
in the next patch. There&#39;s no functional change.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/audio.c | 17 ++++++++---------<br>
=C2=A01 file changed, 8 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index cfa4119c05..04f685fe24 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1121,8 +1121,12 @@ static void audio_run_out (AudioState *s)<br>
=C2=A0 =C2=A0 =C2=A0HWVoiceOut *hw =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0SWVoiceOut *sw;<br>
<br>
-=C2=A0 =C2=A0 if (!audio_get_pdo_out(s-&gt;dev)-&gt;mixing_engine) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((hw =3D audio_pcm_hw_find_any_enabled_o=
ut(s, hw))) {<br>
+=C2=A0 =C2=A0 while ((hw =3D audio_pcm_hw_find_any_enabled_out(s, hw))) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t played, live, prev_rpos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t hw_free =3D audio_pcm_hw_get_free(hw);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int nb_live;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!audio_get_pdo_out(s-&gt;dev)-&gt;mixing_e=
ngine) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* there is exactly 1 sw fo=
r each hw with no mixeng */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sw =3D hw-&gt;sw_head.lh_fi=
rst;<br>
<br>
@@ -1137,14 +1141,9 @@ static void audio_run_out (AudioState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sw-&gt;active) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sw-&gt;callba=
ck.fn(sw-&gt;callback.opaque, INT_MAX);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 while ((hw =3D audio_pcm_hw_find_any_enabled_out(s, hw))) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t played, live, prev_rpos;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t hw_free =3D audio_pcm_hw_get_free(hw);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int nb_live;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (sw =3D hw-&gt;sw_head.lh_first; sw; =
sw =3D sw-&gt;entries.le_next) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sw-&gt;active) {<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000760ca305e9a74f6f--

