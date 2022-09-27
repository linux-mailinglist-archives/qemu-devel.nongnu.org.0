Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CC5EC37A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:02:34 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAEL-0006bh-GV
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od8lA-0002Ad-CC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:28:20 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od8l8-0001rT-O8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:28:20 -0400
Received: by mail-lf1-x12a.google.com with SMTP id i26so15202862lfp.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=t9nMeOkf638YB4ewqtv0WIr6b7uniQKDpkPUyO7LlT8=;
 b=pSigC0IOcvM/evt50sJxP1TKJSWnTmxKNNnKfoAzGhyqFZWkFCus3QEgxKpO6cNRVY
 RiAC46904DxT0jdQwCCDlWTNclZWT8N0cAQ6YT+mC9M1xU98wRauryxHHei/ju18eDeE
 cfijZpDs2+oKTpYqK0Uz7cBl10OCwmF1St110yPn5wIB7YVw4sY5C9ufJaKMG3xdOgEf
 pd+47VtV1a5gIP2ZzHmMxcRJgYdQ28jgduop61aNGs4tOpmB68jSY+YyYkQTBPDkbJuE
 M+gYvLSt3pq6+5XtLkMclv3Uc0myaZmyrTjdNJXEG/0J5RNZXszbcbbbxLG6hk9K+f2W
 lDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=t9nMeOkf638YB4ewqtv0WIr6b7uniQKDpkPUyO7LlT8=;
 b=3Z2N/fPfPXUM4bJP3SFlTdTvhRH8kJcw4XAvcYca9/noOshY6szxgvIP8xkWdAmK2Z
 yJaFE34dhabF7Y9ZXRgdiZzw1y7YKHCz1nW/bNQUKg5WNbCRbkdaNlU8DaI1d7lGMBrJ
 quelqYK64ddpD7eJqkZgIykBFwes0OMs13rTZJaZ2JnZQGHr6qqMxX+S+ChSdZk7wztP
 Ht45vUI1fyV0FTD5MTXu7V/GIsTiEjqUEyA2jf07aIuKjHAMhoFz5UOvkMTrKQZMdwhR
 xUlgMASc0awE+G6nUSd/wgA56gI4DMCGSce2u2etAPt+ZgsrAkEn7X71CwUAe7zV0hyE
 PtFA==
X-Gm-Message-State: ACrzQf0DvogM8wGiBg+ZrmASglMdVZ+XKkqlzdvFBst6m6yeNF7sYAby
 BKeSpuvs/R2mi3joRfmVd9PtLMpzOxVYTHn5abLQy/7niXCObg==
X-Google-Smtp-Source: AMsMyM4+ISUwVGvhFPs8ChmXh6MPUHmch3lAPLKnroA2GQkGWZJfZHXnkKSgtdFxmzlFVs0W9XK5bgMuQ9ECvt7a37o=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr11211240lff.329.1664278096807; Tue, 27
 Sep 2022 04:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <40de48d2-6acc-6525-34d4-cb2eec9977e8@zapateado.de>
In-Reply-To: <40de48d2-6acc-6525-34d4-cb2eec9977e8@zapateado.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:28:05 +0400
Message-ID: <CAJ+F1C+uhOBzuSmAMn=sFbG=t2xkmLWbxh5dtpk3HtGyphLJgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] audio: fix in.voices test
To: Helge Konetzka <hk@zapateado.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c494b505e9a6f069"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

--000000000000c494b505e9a6f069
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 12:57 PM Helge Konetzka <hk@zapateado.de> wrote:

>
> Calling qemu with valid -audiodev ...,in.voices=3D0 results in an obsolet=
e
> warning:
>    audio: Bogus number of capture voices 0, setting to 0
> This patch fixes the in.voices test.
>
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
>

weird case, ok :)
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>   audio/audio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index cfa4119c05..8a0ade4052 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1756,7 +1756,7 @@ static AudioState *audio_init(Audiodev *dev, const
> char *name)
>           s->nb_hw_voices_out =3D 1;
>       }
>
> -    if (s->nb_hw_voices_in <=3D 0) {
> +    if (s->nb_hw_voices_in < 0) {
>           dolog ("Bogus number of capture voices %d, setting to 0\n",
>                  s->nb_hw_voices_in);
>           s->nb_hw_voices_in =3D 0;
> --
> 2.37.3
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c494b505e9a6f069
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 12:57 PM Helg=
e Konetzka &lt;<a href=3D"mailto:hk@zapateado.de">hk@zapateado.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Calling qemu with valid -audiodev ...,in.voices=3D0 results in an obsolete<=
br>
warning:<br>
=C2=A0 =C2=A0audio: Bogus number of capture voices 0, setting to 0<br>
This patch fixes the in.voices test.<br>
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br></blockquote><div><br></div><div>wei=
rd case, ok :)<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt=
;<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0 audio/audio.c | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index cfa4119c05..8a0ade4052 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1756,7 +1756,7 @@ static AudioState *audio_init(Audiodev *dev, const <b=
r>
char *name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;nb_hw_voices_out =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;nb_hw_voices_in &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 if (s-&gt;nb_hw_voices_in &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog (&quot;Bogus number of capture voi=
ces %d, setting to 0\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;nb_hw_v=
oices_in);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;nb_hw_voices_in =3D 0;<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c494b505e9a6f069--

