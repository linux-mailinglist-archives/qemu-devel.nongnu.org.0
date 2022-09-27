Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA15EC5A5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:13:51 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBLK-0002kt-2Z
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AY-0002dA-Pl
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:37 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AX-0006ZQ-0U
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:34 -0400
Received: by mail-lf1-x133.google.com with SMTP id u18so15295214lfo.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+xx0nfMnFsTT6WbB0zrgE80WHkR59u71W+f4hhXXI24=;
 b=SZnNJBq76BRvG8ACx9xk0Vz4pLhKQx/2zRHErKJRWN3MXyPG02vP1NhFmeMR8d3EW1
 QzSu3CCgfMp38VzNXIinc6Lx9SWK/nmkSamVfrNHLvPN1OEzUDrhCLMcwd8VqoCnye4B
 /EUnyfbUFWDgLeWrZrWbTIJR8yruJXR+e4/m+7MCAHjmH6Bw/pK2BVmStE4TWy2+ujox
 rDTTWGSUfFmTu54jFceqjIub0lu+HhEvTdh+yTti6+NN750ga5K8khOgn8HrXfFIipsq
 5l2y4W2HEp7wr2+nv1GqZbigmjmmhF2UTjfyqdyOXuZZ+c/uhH80rynsinFbFEFSF2Oz
 lO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+xx0nfMnFsTT6WbB0zrgE80WHkR59u71W+f4hhXXI24=;
 b=7am4urOtuVeKIB9iUrcaYqz9JV1sk/qOlAjMBj9qy1Orve8FBnOY/6fVl3uHLq10TE
 +8XuouPe6WuMjLhzLFkdJnGPilM2E8GUlYcRXrm3utzORtolDe4uoDlXaJIe0Z6QaLRw
 gGtmOJhqPx07uZfrL3ECBon3TDcS25h8RdgrUqDgWiG9/A1PgaCDZ+WZBLXCQGhvDN0x
 Sfq3smYTTjOmu2PIVwn2FS9+aGuJFFmsUcqxFe+tpNrxd7ZCiLQc5FO4oO/cBzKoStw/
 Lj47evoKmyWlES5qJ9DfBKRyCIC+o8rC9CVWz+7UOvIU2hamMo4zIWozzrCFPiZ0AVLJ
 ldzg==
X-Gm-Message-State: ACrzQf3j5R6BTnZaDgb1nFCHm1L6o8AZjluON7vCbtInAfVMq7dnj71I
 XGjWlgDFFdh0pxpoaTm52bv3k2MDF/qtJmxSDL1cj3HiEGM=
X-Google-Smtp-Source: AMsMyM7djZd18e1KvOdarpl+sTWD6MoMVg7LLd/BZG5zyNseIFV7rIK/ytXfU4LUCurAflF+YwRvTzbdOK8bdMJxa4U=
X-Received: by 2002:a05:6512:3e10:b0:498:f317:e57e with SMTP id
 i16-20020a0565123e1000b00498f317e57emr11515155lfv.328.1664279671363; Tue, 27
 Sep 2022 04:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-7-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-7-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:18 +0400
Message-ID: <CAJ+F1CL=eQfaS89kFKKBJ2UKaX2Y4zZD2vynFTkG6XgZvXdfvQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] spiceaudio: update comment
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009e601605e9a74e4f"
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

--0000000000009e601605e9a74e4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:55 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Replace a comment with a question with the answer.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/spiceaudio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index 22892a7b9d..f52f3a8bbb 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -242,7 +242,10 @@ static size_t line_in_read(HWVoiceIn *hw, void *buf,
> size_t len)
>      uint64_t to_read =3D audio_rate_get_bytes(&hw->info, &in->rate, len)=
 >>
> 2;
>      size_t ready =3D spice_server_record_get_samples(&in->sin, buf,
> to_read);
>
> -    /* XXX: do we need this? */
> +    /*
> +     * If the client didn't send new frames, it most likely disconnected=
.
> +     * Generate silence in this case to avoid a stalled audio stream.
> +     */
>      if (ready =3D=3D 0) {
>          memset(buf, 0, to_read << 2);
>          ready =3D to_read;
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009e601605e9a74e4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:55 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Replace a comment with a question with the answer.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/spiceaudio.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c<br>
index 22892a7b9d..f52f3a8bbb 100644<br>
--- a/audio/spiceaudio.c<br>
+++ b/audio/spiceaudio.c<br>
@@ -242,7 +242,10 @@ static size_t line_in_read(HWVoiceIn *hw, void *buf, s=
ize_t len)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t to_read =3D audio_rate_get_bytes(&amp;hw-&gt;i=
nfo, &amp;in-&gt;rate, len) &gt;&gt; 2;<br>
=C2=A0 =C2=A0 =C2=A0size_t ready =3D spice_server_record_get_samples(&amp;i=
n-&gt;sin, buf, to_read);<br>
<br>
-=C2=A0 =C2=A0 /* XXX: do we need this? */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* If the client didn&#39;t send new frames, it most li=
kely disconnected.<br>
+=C2=A0 =C2=A0 =C2=A0* Generate silence in this case to avoid a stalled aud=
io stream.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if (ready =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(buf, 0, to_read &lt;&lt; 2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ready =3D to_read;<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000009e601605e9a74e4f--

