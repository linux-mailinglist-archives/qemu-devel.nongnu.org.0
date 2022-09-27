Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463FC5EC585
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:08:39 +0200 (CEST)
Received: from localhost ([::1]:60474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBGI-00052u-Ba
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Aa-0002dY-Jz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:37 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AY-0006Zf-ON
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:36 -0400
Received: by mail-lj1-x233.google.com with SMTP id t16so6617999ljh.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=XyQYxIl9/B5cuhEW+fHo2VLncYhWiB5Bw5XJtVju++E=;
 b=XsHpjrAbMxd69z3bjfkir+3xLibb2qirEfXm2rgq9+B5zMHZn6JZMMY6z79CJsdQoc
 0X7k/1gm2rzu9UGxCu0iqA1PTHJkeP5FmqymEkyN2Ru+PGPqTT1WLYbBR5HLQEPEvvym
 hvK8boI+hRcQ+oBK5fJyMsSKnpvPfhZQlMcwDi3OaGt9diL8XMt3IBjgUJhNA/+Fn8bm
 RYKiEKwee8Hyj6aGJkcn1+DmGu8AS3vqmmB5KVDJr2q7k2V7Ii9xsfSI8Usvoe/FhPyP
 9BYjstXCB6lgW+aAJHoES67GWiHYme3NphOKLHgzjngp+sp6LpPduS1MFZAZYASIVLT6
 hxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XyQYxIl9/B5cuhEW+fHo2VLncYhWiB5Bw5XJtVju++E=;
 b=luFLbCgWes0gANNhYWw1H9hgIv9XqHLx8GA3d30yJkQ/6DumX1hXnCwKQ2qOEDcgmP
 wMecLCjaH2jbL80jxncDgtY45x5o2F2P2T8D8+mEt27TkoEkZ+wwfVa5mhIMdh4kRdP8
 z0Ehe74AB8/rq75XCuGX0DrI4xZgnDEvnQPdhbJiMS60l55TkKapsU8G84pQsjBezdGB
 ktYnFGztUEcVBiCHLKYctsjOEG72TZlYHmtJfiiF/KLG7+EOhAwSTAwRRVVwe3CM7FeT
 Zu5B1PCnyplOvCfUyPXnxQDrkB3B2JC5brAmVZGMuY5nhIe2Nnqy+pYh0SwVoVWgsq7e
 v4CA==
X-Gm-Message-State: ACrzQf0f/fo9MdLTd2WaYD6ChLSoYhiyOozek2sLJdcmD4pNfH+Sk+gh
 oTm/kjiTjVvKaC42BIt8PXk6Joa75Ew3UmehzwM=
X-Google-Smtp-Source: AMsMyM5Vq/MvG2RsoC+dP/OetiwzlL15ORTnU/civY/0OKc7p++iJfMRS6w39iK5NgRhmqus2uaGzevBT1VJbGFJ5FI=
X-Received: by 2002:a2e:95cd:0:b0:26c:3bb0:289f with SMTP id
 y13-20020a2e95cd000000b0026c3bb0289fmr9322980ljh.449.1664279673100; Tue, 27
 Sep 2022 04:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-6-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-6-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:20 +0400
Message-ID: <CAJ+F1C+VQ5AZDfcVXv6A0RZBEUbS+iSWspSyooRm+iWGgE6wGg@mail.gmail.com>
Subject: Re: [PATCH 06/12] spiceaudio: add a pcm_ops buffer_get_free function
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Geoffrey McRae <geoff@hostfission.com>
Content-Type: multipart/alternative; boundary="000000000000b8e10f05e9a74eb3"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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

--000000000000b8e10f05e9a74eb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:58 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> It seems there is a demand [1] for low latency playback over
> SPICE. Add a pcm_ops buffer_get_free function to reduce the
> playback latency. The mixing engine buffer becomes a temporary
> buffer.
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg01644.htm=
l
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/spiceaudio.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index a8d370fe6f..22892a7b9d 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -120,6 +120,13 @@ static void line_out_fini (HWVoiceOut *hw)
>      spice_server_remove_interface (&out->sin.base);
>  }
>
> +static size_t line_out_get_free(HWVoiceOut *hw)
> +{
> +    SpiceVoiceOut *out =3D container_of(hw, SpiceVoiceOut, hw);
> +
> +    return audio_rate_peek_bytes(&out->rate, &hw->info);
> +}
> +
>  static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
>  {
>      SpiceVoiceOut *out =3D container_of(hw, SpiceVoiceOut, hw);
> @@ -133,8 +140,6 @@ static void *line_out_get_buffer(HWVoiceOut *hw,
> size_t *size)
>          *size =3D MIN((out->fsize - out->fpos) << 2, *size);
>      }
>
> -    *size =3D audio_rate_get_bytes(&hw->info, &out->rate, *size);
> -
>      return out->frame + out->fpos;
>  }
>
> @@ -142,6 +147,8 @@ static size_t line_out_put_buffer(HWVoiceOut *hw, voi=
d
> *buf, size_t size)
>  {
>      SpiceVoiceOut *out =3D container_of(hw, SpiceVoiceOut, hw);
>
> +    audio_rate_add_bytes(&out->rate, size);
> +
>      if (buf) {
>          assert(buf =3D=3D out->frame + out->fpos && out->fpos <=3D out->=
fsize);
>          out->fpos +=3D size >> 2;
> @@ -282,6 +289,7 @@ static struct audio_pcm_ops audio_callbacks =3D {
>      .init_out =3D line_out_init,
>      .fini_out =3D line_out_fini,
>      .write    =3D audio_generic_write,
> +    .buffer_get_free =3D line_out_get_free,
>      .get_buffer_out =3D line_out_get_buffer,
>      .put_buffer_out =3D line_out_put_buffer,
>      .enable_out =3D line_out_enable,
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b8e10f05e9a74eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:58 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">It seems there is a demand [1] for low latency playbac=
k over<br>
SPICE. Add a pcm_ops buffer_get_free function to reduce the<br>
playback latency. The mixing engine buffer becomes a temporary<br>
buffer.<br>
<br>
[1] <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg=
01644.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/a=
rchive/html/qemu-devel/2022-01/msg01644.html</a><br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/spiceaudio.c | 12 ++++++++++--<br>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c<br>
index a8d370fe6f..22892a7b9d 100644<br>
--- a/audio/spiceaudio.c<br>
+++ b/audio/spiceaudio.c<br>
@@ -120,6 +120,13 @@ static void line_out_fini (HWVoiceOut *hw)<br>
=C2=A0 =C2=A0 =C2=A0spice_server_remove_interface (&amp;out-&gt;sin.base);<=
br>
=C2=A0}<br>
<br>
+static size_t line_out_get_free(HWVoiceOut *hw)<br>
+{<br>
+=C2=A0 =C2=A0 SpiceVoiceOut *out =3D container_of(hw, SpiceVoiceOut, hw);<=
br>
+<br>
+=C2=A0 =C2=A0 return audio_rate_peek_bytes(&amp;out-&gt;rate, &amp;hw-&gt;=
info);<br>
+}<br>
+<br>
=C2=A0static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SpiceVoiceOut *out =3D container_of(hw, SpiceVoiceOut, =
hw);<br>
@@ -133,8 +140,6 @@ static void *line_out_get_buffer(HWVoiceOut *hw, size_t=
 *size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*size =3D MIN((out-&gt;fsize - out-&gt;fp=
os) &lt;&lt; 2, *size);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 *size =3D audio_rate_get_bytes(&amp;hw-&gt;info, &amp;out-&g=
t;rate, *size);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0return out-&gt;frame + out-&gt;fpos;<br>
=C2=A0}<br>
<br>
@@ -142,6 +147,8 @@ static size_t line_out_put_buffer(HWVoiceOut *hw, void =
*buf, size_t size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SpiceVoiceOut *out =3D container_of(hw, SpiceVoiceOut, =
hw);<br>
<br>
+=C2=A0 =C2=A0 audio_rate_add_bytes(&amp;out-&gt;rate, size);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (buf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(buf =3D=3D out-&gt;frame + out-&gt=
;fpos &amp;&amp; out-&gt;fpos &lt;=3D out-&gt;fsize);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out-&gt;fpos +=3D size &gt;&gt; 2;<br>
@@ -282,6 +289,7 @@ static struct audio_pcm_ops audio_callbacks =3D {<br>
=C2=A0 =C2=A0 =C2=A0.init_out =3D line_out_init,<br>
=C2=A0 =C2=A0 =C2=A0.fini_out =3D line_out_fini,<br>
=C2=A0 =C2=A0 =C2=A0.write=C2=A0 =C2=A0 =3D audio_generic_write,<br>
+=C2=A0 =C2=A0 .buffer_get_free =3D line_out_get_free,<br>
=C2=A0 =C2=A0 =C2=A0.get_buffer_out =3D line_out_get_buffer,<br>
=C2=A0 =C2=A0 =C2=A0.put_buffer_out =3D line_out_put_buffer,<br>
=C2=A0 =C2=A0 =C2=A0.enable_out =3D line_out_enable,<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000b8e10f05e9a74eb3--

