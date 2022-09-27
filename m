Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DD5EC4E4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:49:30 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAxl-0006sy-HB
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AW-0002cH-MM
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:37 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9AU-0006Z5-IA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:32 -0400
Received: by mail-lj1-x235.google.com with SMTP id b6so10602541ljr.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=CKsiR4Cf1XSecu+N0k3m8w2iTgSAqtjnhl0AmnH8kHU=;
 b=FKDKIfyruFRwCFW/IxIxiKTSwsHQW/lxC2ZR+i/WtDiVjwtrdwovXRcQiZczeaQPQE
 mBa1NEsT5I8WYwPqAROKEQhCswVCEUs7xqIbLkDme/Sw6zVBqq/3mRcj7c7n1I6EzYfi
 34Zc8FsykmvNJ91JpXrOpdUKAmm+INs2Js+Uj6lNvF/2xIO9EruIGyGkU9kxPGNkMsHu
 qi/nkDGSkAC2ORSzhzOmDIMlEQb97F/mnMz/TjUzYjKLa44oEQQFg+MjhvPDmujRiCkx
 xNm6uGk+jvN+iv1xfC0gFNZRUffsEXvPO8SyJDzHC6mNjzFApiWFVl3xYbW05Q82BTgg
 w0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=CKsiR4Cf1XSecu+N0k3m8w2iTgSAqtjnhl0AmnH8kHU=;
 b=yeHjJ4YbC3d0fPEvQPa01L0yUUr2Mi+nHQ1ufh1R7c5x2XfuIAyeN0huxgXaFlSYT8
 eTs59vAg02fVxNgu5bdZHfSf/cL0BjXny8AHHELqC+e631Getz319CjT/0f5lugPEDSG
 mPPmH7B8kaNn4W4HcdRfRpqlU0QhTVRNkVee1VWp105fCbI5IIt+knAGDEmHoNCiX48C
 6NjinIotlM1ZTW3Qsef7uL4BRt27Q8UwdRmtbzOakTDxcUR5DKC9g8ShWFpKByp/AE6O
 tsRiBmMG3gCoNTCNJGYtP1FVYj+dx5fsiDV51bJ6rIIpv8pjgkdJd+vyeEpqGooXc5rk
 K/KA==
X-Gm-Message-State: ACrzQf0c7TXFS4z+EU/5zeEShVQ3D1L+5C0YvDUgYKr2bRmwGYT4G1eo
 64BkK6AEf9Ux8Y8raAS92e9OAa0Pwu+laokePxAU8odlhA8=
X-Google-Smtp-Source: AMsMyM5pjMUdheWNOXHygu6fJgsctU//IdGyoNp1Ubp+s9o/K+fcY+P2lqIKN22rre2x6M7GoQ2wrDyP4LOXfn0ANZE=
X-Received: by 2002:a05:651c:1692:b0:26c:37bb:de2 with SMTP id
 bd18-20020a05651c169200b0026c37bb0de2mr8900691ljb.463.1664279668430; Tue, 27
 Sep 2022 04:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-8-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-8-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:16 +0400
Message-ID: <CAJ+F1CJd65Po9xkmdLnzMjpov3pPeEZWdunQFz2aBp7TFbUXUw@mail.gmail.com>
Subject: Re: [PATCH 08/12] audio: swap audio_rate_get_bytes() function
 parameters
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000719ab905e9a74efd"
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

--000000000000719ab905e9a74efd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:58 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Swap the rate and info parameters of the audio_rate_get_bytes()
> function to align the parameter order with the rest of the
> audio_rate_*() functions.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c      | 2 +-
>  audio/audio_int.h  | 2 +-
>  audio/dbusaudio.c  | 4 ++--
>  audio/noaudio.c    | 4 ++--
>  audio/spiceaudio.c | 2 +-
>  audio/wavaudio.c   | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 557538a7b7..233a86c440 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2275,7 +2275,7 @@ void audio_rate_add_bytes(RateCtl *rate, size_t
> bytes_used)
>      rate->bytes_sent +=3D bytes_used;
>  }
>
> -size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
> +size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
>                              size_t bytes_avail)
>  {
>      size_t bytes;
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 97e20e8429..e87ce014a0 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -265,7 +265,7 @@ typedef struct RateCtl {
>  void audio_rate_start(RateCtl *rate);
>  size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info)=
;
>  void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);
> -size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
> +size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
>                              size_t bytes_avail);
>
>  static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
> diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c
> index a3d656d3b0..722df0355e 100644
> --- a/audio/dbusaudio.c
> +++ b/audio/dbusaudio.c
> @@ -82,7 +82,7 @@ static void *dbus_get_buffer_out(HWVoiceOut *hw, size_t
> *size)
>      }
>
>      *size =3D MIN(vo->buf_size - vo->buf_pos, *size);
> -    *size =3D audio_rate_get_bytes(&hw->info, &vo->rate, *size);
> +    *size =3D audio_rate_get_bytes(&vo->rate, &hw->info, *size);
>
>      return vo->buf + vo->buf_pos;
>
> @@ -343,7 +343,7 @@ dbus_read(HWVoiceIn *hw, void *buf, size_t size)
>
>      trace_dbus_audio_read(size);
>
> -    /* size =3D audio_rate_get_bytes(&hw->info, &vo->rate, size); */
> +    /* size =3D audio_rate_get_bytes(&vo->rate, &hw->info, size); */
>
>      g_hash_table_iter_init(&iter, da->in_listeners);
>      while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
> diff --git a/audio/noaudio.c b/audio/noaudio.c
> index 84a6bfbb1c..4fdee5adec 100644
> --- a/audio/noaudio.c
> +++ b/audio/noaudio.c
> @@ -44,7 +44,7 @@ typedef struct NoVoiceIn {
>  static size_t no_write(HWVoiceOut *hw, void *buf, size_t len)
>  {
>      NoVoiceOut *no =3D (NoVoiceOut *) hw;
> -    return audio_rate_get_bytes(&hw->info, &no->rate, len);
> +    return audio_rate_get_bytes(&no->rate, &hw->info, len);
>  }
>
>  static int no_init_out(HWVoiceOut *hw, struct audsettings *as, void
> *drv_opaque)
> @@ -89,7 +89,7 @@ static void no_fini_in (HWVoiceIn *hw)
>  static size_t no_read(HWVoiceIn *hw, void *buf, size_t size)
>  {
>      NoVoiceIn *no =3D (NoVoiceIn *) hw;
> -    int64_t bytes =3D audio_rate_get_bytes(&hw->info, &no->rate, size);
> +    int64_t bytes =3D audio_rate_get_bytes(&no->rate, &hw->info, size);
>
>      audio_pcm_info_clear_buf(&hw->info, buf, bytes /
> hw->info.bytes_per_frame);
>      return bytes;
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index f52f3a8bbb..d17ef1a25e 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -239,7 +239,7 @@ static void line_in_fini (HWVoiceIn *hw)
>  static size_t line_in_read(HWVoiceIn *hw, void *buf, size_t len)
>  {
>      SpiceVoiceIn *in =3D container_of (hw, SpiceVoiceIn, hw);
> -    uint64_t to_read =3D audio_rate_get_bytes(&hw->info, &in->rate, len)=
 >>
> 2;
> +    uint64_t to_read =3D audio_rate_get_bytes(&in->rate, &hw->info, len)=
 >>
> 2;
>      size_t ready =3D spice_server_record_get_samples(&in->sin, buf,
> to_read);
>
>      /*
> diff --git a/audio/wavaudio.c b/audio/wavaudio.c
> index ac666335c7..3e1d84db83 100644
> --- a/audio/wavaudio.c
> +++ b/audio/wavaudio.c
> @@ -42,7 +42,7 @@ typedef struct WAVVoiceOut {
>  static size_t wav_write_out(HWVoiceOut *hw, void *buf, size_t len)
>  {
>      WAVVoiceOut *wav =3D (WAVVoiceOut *) hw;
> -    int64_t bytes =3D audio_rate_get_bytes(&hw->info, &wav->rate, len);
> +    int64_t bytes =3D audio_rate_get_bytes(&wav->rate, &hw->info, len);
>      assert(bytes % hw->info.bytes_per_frame =3D=3D 0);
>
>      if (bytes && fwrite(buf, bytes, 1, wav->f) !=3D 1) {
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000719ab905e9a74efd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:58 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Swap the rate and info parameters of the audio_rate_ge=
t_bytes()<br>
function to align the parameter order with the rest of the<br>
audio_rate_*() functions.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/audio.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0audio/audio_int.h=C2=A0 | 2 +-<br>
=C2=A0audio/dbusaudio.c=C2=A0 | 4 ++--<br>
=C2=A0audio/noaudio.c=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0audio/spiceaudio.c | 2 +-<br>
=C2=A0audio/wavaudio.c=C2=A0 =C2=A0| 2 +-<br>
=C2=A06 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 557538a7b7..233a86c440 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -2275,7 +2275,7 @@ void audio_rate_add_bytes(RateCtl *rate, size_t bytes=
_used)<br>
=C2=A0 =C2=A0 =C2=A0rate-&gt;bytes_sent +=3D bytes_used;<br>
=C2=A0}<br>
<br>
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,<br=
>
+size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t bytes_avail)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0size_t bytes;<br>
diff --git a/audio/audio_int.h b/audio/audio_int.h<br>
index 97e20e8429..e87ce014a0 100644<br>
--- a/audio/audio_int.h<br>
+++ b/audio/audio_int.h<br>
@@ -265,7 +265,7 @@ typedef struct RateCtl {<br>
=C2=A0void audio_rate_start(RateCtl *rate);<br>
=C2=A0size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *in=
fo);<br>
=C2=A0void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);<br>
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,<br=
>
+size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t bytes_avail);<br>
<br>
=C2=A0static inline size_t audio_ring_dist(size_t dst, size_t src, size_t l=
en)<br>
diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c<br>
index a3d656d3b0..722df0355e 100644<br>
--- a/audio/dbusaudio.c<br>
+++ b/audio/dbusaudio.c<br>
@@ -82,7 +82,7 @@ static void *dbus_get_buffer_out(HWVoiceOut *hw, size_t *=
size)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0*size =3D MIN(vo-&gt;buf_size - vo-&gt;buf_pos, *size);=
<br>
-=C2=A0 =C2=A0 *size =3D audio_rate_get_bytes(&amp;hw-&gt;info, &amp;vo-&gt=
;rate, *size);<br>
+=C2=A0 =C2=A0 *size =3D audio_rate_get_bytes(&amp;vo-&gt;rate, &amp;hw-&gt=
;info, *size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return vo-&gt;buf + vo-&gt;buf_pos;<br>
<br>
@@ -343,7 +343,7 @@ dbus_read(HWVoiceIn *hw, void *buf, size_t size)<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_dbus_audio_read(size);<br>
<br>
-=C2=A0 =C2=A0 /* size =3D audio_rate_get_bytes(&amp;hw-&gt;info, &amp;vo-&=
gt;rate, size); */<br>
+=C2=A0 =C2=A0 /* size =3D audio_rate_get_bytes(&amp;vo-&gt;rate, &amp;hw-&=
gt;info, size); */<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_hash_table_iter_init(&amp;iter, da-&gt;in_listeners);=
<br>
=C2=A0 =C2=A0 =C2=A0while (g_hash_table_iter_next(&amp;iter, NULL, (void **=
)&amp;listener)) {<br>
diff --git a/audio/noaudio.c b/audio/noaudio.c<br>
index 84a6bfbb1c..4fdee5adec 100644<br>
--- a/audio/noaudio.c<br>
+++ b/audio/noaudio.c<br>
@@ -44,7 +44,7 @@ typedef struct NoVoiceIn {<br>
=C2=A0static size_t no_write(HWVoiceOut *hw, void *buf, size_t len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NoVoiceOut *no =3D (NoVoiceOut *) hw;<br>
-=C2=A0 =C2=A0 return audio_rate_get_bytes(&amp;hw-&gt;info, &amp;no-&gt;ra=
te, len);<br>
+=C2=A0 =C2=A0 return audio_rate_get_bytes(&amp;no-&gt;rate, &amp;hw-&gt;in=
fo, len);<br>
=C2=A0}<br>
<br>
=C2=A0static int no_init_out(HWVoiceOut *hw, struct audsettings *as, void *=
drv_opaque)<br>
@@ -89,7 +89,7 @@ static void no_fini_in (HWVoiceIn *hw)<br>
=C2=A0static size_t no_read(HWVoiceIn *hw, void *buf, size_t size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NoVoiceIn *no =3D (NoVoiceIn *) hw;<br>
-=C2=A0 =C2=A0 int64_t bytes =3D audio_rate_get_bytes(&amp;hw-&gt;info, &am=
p;no-&gt;rate, size);<br>
+=C2=A0 =C2=A0 int64_t bytes =3D audio_rate_get_bytes(&amp;no-&gt;rate, &am=
p;hw-&gt;info, size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0audio_pcm_info_clear_buf(&amp;hw-&gt;info, buf, bytes /=
 hw-&gt;info.bytes_per_frame);<br>
=C2=A0 =C2=A0 =C2=A0return bytes;<br>
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c<br>
index f52f3a8bbb..d17ef1a25e 100644<br>
--- a/audio/spiceaudio.c<br>
+++ b/audio/spiceaudio.c<br>
@@ -239,7 +239,7 @@ static void line_in_fini (HWVoiceIn *hw)<br>
=C2=A0static size_t line_in_read(HWVoiceIn *hw, void *buf, size_t len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SpiceVoiceIn *in =3D container_of (hw, SpiceVoiceIn, hw=
);<br>
-=C2=A0 =C2=A0 uint64_t to_read =3D audio_rate_get_bytes(&amp;hw-&gt;info, =
&amp;in-&gt;rate, len) &gt;&gt; 2;<br>
+=C2=A0 =C2=A0 uint64_t to_read =3D audio_rate_get_bytes(&amp;in-&gt;rate, =
&amp;hw-&gt;info, len) &gt;&gt; 2;<br>
=C2=A0 =C2=A0 =C2=A0size_t ready =3D spice_server_record_get_samples(&amp;i=
n-&gt;sin, buf, to_read);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/audio/wavaudio.c b/audio/wavaudio.c<br>
index ac666335c7..3e1d84db83 100644<br>
--- a/audio/wavaudio.c<br>
+++ b/audio/wavaudio.c<br>
@@ -42,7 +42,7 @@ typedef struct WAVVoiceOut {<br>
=C2=A0static size_t wav_write_out(HWVoiceOut *hw, void *buf, size_t len)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0WAVVoiceOut *wav =3D (WAVVoiceOut *) hw;<br>
-=C2=A0 =C2=A0 int64_t bytes =3D audio_rate_get_bytes(&amp;hw-&gt;info, &am=
p;wav-&gt;rate, len);<br>
+=C2=A0 =C2=A0 int64_t bytes =3D audio_rate_get_bytes(&amp;wav-&gt;rate, &a=
mp;hw-&gt;info, len);<br>
=C2=A0 =C2=A0 =C2=A0assert(bytes % hw-&gt;info.bytes_per_frame =3D=3D 0);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0if (bytes &amp;&amp; fwrite(buf, bytes, 1, wav-&gt;f) !=
=3D 1) {<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000719ab905e9a74efd--

