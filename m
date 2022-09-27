Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4835EC3E0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:12:15 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odANg-00059I-CG
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od8kG-0000Rb-Vy
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:27:25 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od8kF-0001fC-5v
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:27:24 -0400
Received: by mail-lf1-x12f.google.com with SMTP id d42so15320299lfv.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wrJ5d1TFH9u4pNDGV8o1Ar9UEOiRD4ujhdhIZd9eZqk=;
 b=e4cetqUXw6QfYk2jg1SCrp3/3zCp5eHqIzIt021On9yNpVMUQlh8IQLi99p7SzYpyH
 Jvbs+8EvaWKmwAzFbm5HbbuvJX+9jNz87EYMkqxrrOh/REVaRql/H4hDcfB96TnCuDoe
 ge104tMoSbE+3o684tA0FshpGynm0m68YtFYvFcyHZw63xk2yTomtSpIaAnPhimGar6Z
 emxAeflDU7zT8Wnhm0nQjKLSr8LwCA+6n0bej0eynvXCGG40lk5KJmDJKgoUpjLRydZR
 M7dUgNA8HRwHeiN1mOH1DkoIDVnveyRCDBxM0m3vq+Y4RfrFoJqlslE6kRoMWE/5DYwK
 nzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wrJ5d1TFH9u4pNDGV8o1Ar9UEOiRD4ujhdhIZd9eZqk=;
 b=YKaVGmYOZv/WWi0pTh53zRyR7pMRX5u9+h1wEp3xRJOhbc081tLliJrsmDQaVh/yuC
 KXD/fcAn3kWhs113SuhYNYlCqFRMj5yQMJi9OcoVbXrejyO/VS/JB3m+GcCCiv6PEDrl
 d/QxpiDoffuW0dtNke3lowDhLa9wjUcezjzxV25FcbXGJtzlHau0wDeCS26IRgo0tCQG
 w/in55Ec/INt3GQcku0I6nGuwyKKhjdqpUNccgYR/FVnT4NL4yNULLaTNGSGhw9L2O7A
 PKQo2gzeRJnEvh3OcVCSsoh/e19GOk/Ki3kCXCSS+xDk6rUsDAMFwm/sgrgzdVCFPKGD
 R6cg==
X-Gm-Message-State: ACrzQf0r2JhYddrKel0+8/PbPVsp5oSSWfFohmtojxmAQS9fR1usyH0T
 SbBu8dcHEk2kwqon75bieumq90H8wNo6pxmX75Q=
X-Google-Smtp-Source: AMsMyM4j0AHjMH43ifwRsdy9j4qAdmVM0JrmFuJDaBMZGtPzqPz2+7ro/z6rPtqK5jcIVvi3mUPLyCyA58zmXmgpJrg=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr11926717lfb.167.1664278041312; Tue, 27
 Sep 2022 04:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <9b7c4c56-2992-b74d-bae4-c8af412ea2af@zapateado.de>
In-Reply-To: <9b7c4c56-2992-b74d-bae4-c8af412ea2af@zapateado.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:27:09 +0400
Message-ID: <CAJ+F1CKOJnz-7MNGjkdr6d7GHpThfLyjBuotu0+ERt0zhcavOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] audio: improve out.voices test
To: Helge Konetzka <hk@zapateado.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000075c09305e9a6ed2f"
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

--00000000000075c09305e9a6ed2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Sep 25, 2022 at 1:05 PM Helge Konetzka <hk@zapateado.de> wrote:

>
> Improve readability of audio out.voices test:
> If 1 is logged and set after positive test, 1 should be tested.
>
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
>

That's not helping much, but why not. I'll let Gerd decide.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>   audio/audio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 8a0ade4052..912b456058 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1750,7 +1750,7 @@ static AudioState *audio_init(Audiodev *dev, const
> char *name)
>       s->nb_hw_voices_out =3D audio_get_pdo_out(dev)->voices;
>       s->nb_hw_voices_in =3D audio_get_pdo_in(dev)->voices;
>
> -    if (s->nb_hw_voices_out <=3D 0) {
> +    if (s->nb_hw_voices_out < 1) {
>           dolog ("Bogus number of playback voices %d, setting to 1\n",
>                  s->nb_hw_voices_out);
>           s->nb_hw_voices_out =3D 1;
> --
> 2.37.3
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000075c09305e9a6ed2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 1:05 PM Hel=
ge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de">hk@zapateado.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Improve readability of audio out.voices test:<br>
If 1 is logged and set after positive test, 1 should be tested.<br>
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br></blockquote><div><br></div><div>Tha=
t&#39;s not helping much, but why not. I&#39;ll let Gerd decide.</div><div>=
<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0 audio/audio.c | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 8a0ade4052..912b456058 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1750,7 +1750,7 @@ static AudioState *audio_init(Audiodev *dev, const <b=
r>
char *name)<br>
=C2=A0 =C2=A0 =C2=A0 s-&gt;nb_hw_voices_out =3D audio_get_pdo_out(dev)-&gt;=
voices;<br>
=C2=A0 =C2=A0 =C2=A0 s-&gt;nb_hw_voices_in =3D audio_get_pdo_in(dev)-&gt;vo=
ices;<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;nb_hw_voices_out &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 if (s-&gt;nb_hw_voices_out &lt; 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog (&quot;Bogus number of playback vo=
ices %d, setting to 1\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;nb_hw_v=
oices_out);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;nb_hw_voices_out =3D 1;<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000075c09305e9a6ed2f--

