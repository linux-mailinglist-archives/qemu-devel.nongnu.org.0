Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94043425E54
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:57:40 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaSR-0007ep-7N
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDq-00066p-F8
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDo-0006PC-MD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id e12so22869103wra.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fiwBtJIUpYRfkM3frG/REtzgYYtFqPLKzrfgn7vKZc=;
 b=WRwlwBjkURcSsPG/vV7bKsqo7R9W4urg8W7TUqz+p8npTyKlxAvTqSHsv7zWJ+2jIr
 ulSJuPNksgcD5U0Ur5UuQodMZCRbEev5XABzs/8u9p5CnvSMRfbfYHrlTbF5eH8K7bGI
 IV0WaXHzTPfZnnA5UciEeZX/xbbkqQmANNBpLxt0YFWAgX2JVVNrhUg9mb0OjNEAfkPU
 Xnov2+fzpEbAP393XS9n02ZcdBcjAu1fW9SPuEotWewu8PO7J7sCOzmNt8sRlX2fkTZj
 C9u88JM9q7px9jWVc9mJP7qFbO2huCzrpQKF/Ka8V+GsqGwJKfNlNFGqukCpgbbVyfsl
 hYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fiwBtJIUpYRfkM3frG/REtzgYYtFqPLKzrfgn7vKZc=;
 b=gf+DlvdwIIPPYE2oLGw4CUhTroTwKe3/P5OF7htu7TGRaHtYM8h9a+jjpthOZn9PEb
 GjFPsHfqvgFnxukUGpKOhc2rhnude8oRPEGFKMVHG4Drk9NpQ8W1pwVRQG8GAEx1G273
 MTWDbHKkTv+k71cu9UF6qbaa6x2qi14yvM5JgDNPoZ8n7uKfHe+AS1qn9D/mvmKwrF7t
 iE8D7sex6Ic23Q+QBqbR9mbGulIq2Pfm6cm27JFdQ5gPez/yTzCuqrmPCXvfev1OdShR
 5HEYxkfXs2lUexdZ+Y+QVFb4zCR5x/i2vkDLWDNLICAiqxTrSYrvzGgMpHl0KiFu08Y4
 QEAg==
X-Gm-Message-State: AOAM53036uOpNZFyYjtlSGfYzk6rBfo5tPcv7wOov9Iz504kMaHNb0BG
 PAFu0HZKqv+3o1RBxaAayJvd50Pj7NsMv9xj8CU=
X-Google-Smtp-Source: ABdhPJwCC9S4xQL6hZhQ+5P2SrIDvmw1fmX2GtO6Xo+iKPn8l8Off7f6Mrq2IR1DTmJSchDETWmuVteWNW5TtKXYaT8=
X-Received: by 2002:adf:a209:: with SMTP id p9mr8103309wra.70.1633639351530;
 Thu, 07 Oct 2021 13:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130630.632028-3-pbonzini@redhat.com>
In-Reply-To: <20211007130630.632028-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:42:19 +0400
Message-ID: <CAJ+F1CKfSpPvgdiQEOpV+OeA02jm+5NrKhmqjmYgXZ_UgW9hYA@mail.gmail.com>
Subject: Re: [PATCH 02/24] audio: remove CONFIG_AUDIO_WIN_INT
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003d3c7c05cdc94d34"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 QEMU <qemu-devel@nongnu.org>, Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003d3c7c05cdc94d34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:09 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Ever since winwaveaudio was removed in 2015, CONFIG_AUDIO_WIN_INT
> is only set if dsound is in use, so use CONFIG_AUDIO_DSOUND directly.
>
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  audio/meson.build | 4 ++--
>  configure         | 5 -----
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/audio/meson.build b/audio/meson.build
> index 7d53b0f920..9a95c58f18 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -8,8 +8,8 @@ softmmu_ss.add(files(
>  ))
>
>  softmmu_ss.add(when: [coreaudio, 'CONFIG_AUDIO_COREAUDIO'], if_true:
> files('coreaudio.c'))
> -softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'], if_true:
> files('dsoundaudio.c'))
> -softmmu_ss.add(when: ['CONFIG_AUDIO_WIN_INT'], if_true:
> files('audio_win_int.c'))
> +softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'],
> +               if_true: files('dsoundaudio.c', 'audio_win_int.c'))
>
>  audio_modules =3D {}
>  foreach m : [
> diff --git a/configure b/configure
> index ab6bc0c994..6a6273ce7b 100755
> --- a/configure
> +++ b/configure
> @@ -245,7 +245,6 @@ block_drv_rw_whitelist=3D""
>  block_drv_ro_whitelist=3D""
>  block_drv_whitelist_tools=3D"no"
>  host_cc=3D"cc"
> -audio_win_int=3D""
>  libs_qga=3D""
>  debug_info=3D"yes"
>  lto=3D"false"
> @@ -3075,7 +3074,6 @@ for drv in $audio_drv_list; do
>
>      dsound)
>        dsound_libs=3D"-lole32 -ldxguid"
> -      audio_win_int=3D"yes"
>      ;;
>
>      oss)
> @@ -4560,9 +4558,6 @@ if test "$libjack" =3D "yes" ; then
>      echo "CONFIG_LIBJACK=3Dy" >> $config_host_mak
>  fi
>  echo "JACK_LIBS=3D$jack_libs" >> $config_host_mak
> -if test "$audio_win_int" =3D "yes" ; then
> -  echo "CONFIG_AUDIO_WIN_INT=3Dy" >> $config_host_mak
> -fi
>  echo "CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist" >>
> $config_host_mak
>  echo "CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist" >>
> $config_host_mak
>  if test "$block_drv_whitelist_tools" =3D "yes" ; then
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003d3c7c05cdc94d34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:09 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Ever since winwaveaudio was removed in 2015, CONFIG_AUDIO_WIN_=
INT<br>
is only set if dsound is in use, so use CONFIG_AUDIO_DSOUND directly.<br>
<br>
Cc: Gerd Hoffman &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank"=
>kraxel@redhat.com</a>&gt;<br>
Cc: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=
=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0audio/meson.build | 4 ++--<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -----<br>
=C2=A02 files changed, 2 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/audio/meson.build b/audio/meson.build<br>
index 7d53b0f920..9a95c58f18 100644<br>
--- a/audio/meson.build<br>
+++ b/audio/meson.build<br>
@@ -8,8 +8,8 @@ softmmu_ss.add(files(<br>
=C2=A0))<br>
<br>
=C2=A0softmmu_ss.add(when: [coreaudio, &#39;CONFIG_AUDIO_COREAUDIO&#39;], i=
f_true: files(&#39;coreaudio.c&#39;))<br>
-softmmu_ss.add(when: [dsound, &#39;CONFIG_AUDIO_DSOUND&#39;], if_true: fil=
es(&#39;dsoundaudio.c&#39;))<br>
-softmmu_ss.add(when: [&#39;CONFIG_AUDIO_WIN_INT&#39;], if_true: files(&#39=
;audio_win_int.c&#39;))<br>
+softmmu_ss.add(when: [dsound, &#39;CONFIG_AUDIO_DSOUND&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: files(&#39=
;dsoundaudio.c&#39;, &#39;audio_win_int.c&#39;))<br>
<br>
=C2=A0audio_modules =3D {}<br>
=C2=A0foreach m : [<br>
diff --git a/configure b/configure<br>
index ab6bc0c994..6a6273ce7b 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -245,7 +245,6 @@ block_drv_rw_whitelist=3D&quot;&quot;<br>
=C2=A0block_drv_ro_whitelist=3D&quot;&quot;<br>
=C2=A0block_drv_whitelist_tools=3D&quot;no&quot;<br>
=C2=A0host_cc=3D&quot;cc&quot;<br>
-audio_win_int=3D&quot;&quot;<br>
=C2=A0libs_qga=3D&quot;&quot;<br>
=C2=A0debug_info=3D&quot;yes&quot;<br>
=C2=A0lto=3D&quot;false&quot;<br>
@@ -3075,7 +3074,6 @@ for drv in $audio_drv_list; do<br>
<br>
=C2=A0 =C2=A0 =C2=A0dsound)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dsound_libs=3D&quot;-lole32 -ldxguid&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 audio_win_int=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0oss)<br>
@@ -4560,9 +4558,6 @@ if test &quot;$libjack&quot; =3D &quot;yes&quot; ; th=
en<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_LIBJACK=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0fi<br>
=C2=A0echo &quot;JACK_LIBS=3D$jack_libs&quot; &gt;&gt; $config_host_mak<br>
-if test &quot;$audio_win_int&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_AUDIO_WIN_INT=3Dy&quot; &gt;&gt; $config_host_mak=
<br>
-fi<br>
=C2=A0echo &quot;CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist&quot; &=
gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist&quot; &=
gt;&gt; $config_host_mak<br>
=C2=A0if test &quot;$block_drv_whitelist_tools&quot; =3D &quot;yes&quot; ; =
then<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000003d3c7c05cdc94d34--

