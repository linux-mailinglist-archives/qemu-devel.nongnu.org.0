Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCBA425E38
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:55:09 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaPz-00031O-KL
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDj-0005y8-E7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:27 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDh-0006JI-FN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u18so22915565wrg.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMcMFX1hIfZQSSmmQdfE22gbG+ZLjjCHfKNe0Lfy33Y=;
 b=DH75NjzTJHYPn8SeFU/Ulbrgr/Yp2iOKkP3St303xXS/g+ZDGwSwfchOTYjZ67MizU
 MXfNyWQYiIKIGl8MCVIc4jCHSV7qheK2qkvuRTV3EpK7bGPD0K+GCMr8eveYeaJnmjkB
 74uKXa5BE1D1loe1cKWb8BpbZaLOXymR2dEY3vQY+iI/UfhumMqjD733LSYc/hRWvyV9
 eK49mN7VIeX6zLNDDaJfD+5O2Ck7qCrCMxMRd0Z7wE+5kkOlGd9eclt62y06zmjBwn4D
 u6ip9bYLI01YO3RFpbdyt3Aavzn1LC6O7uBTGxg4thpAekk28JFsjX3MtLvU4jSqMyDb
 LznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMcMFX1hIfZQSSmmQdfE22gbG+ZLjjCHfKNe0Lfy33Y=;
 b=7AaA6cxRa60LWqdYRPNRgpVfMUjzVqfdsI5lr5WX3W0jtYcajeqdqZ8uf5NCyDp6ue
 knnRT9TOmv+GNf4TqUd3puIYKL1is2qV3ptFqEx+cvX6Irx+XvyGfccrYVhORz1RffrO
 kzNVw79FwdERXG8kPPzANmCj4tIV780R4kC1vK8N/G7ec7OHzP2R1WeEUnvcInHrUTCj
 mHRBDjRMXNV39L1ZTV7zQT/lJlmLo9fWWSP8nh3II5Go7Yk1xJJs5EkG/qol2j+t4ioJ
 rNv3DzY6J5+B2niTq1jQrVp64ZZGW05S0SUlJLzotRar/zv09XitS3iz/IFCumvj5YwL
 wFGQ==
X-Gm-Message-State: AOAM530LKhZhxRO9no5Ky+3+z54cItUNDBjXOxh9fnlT+r265yBtOyPu
 e85ibalZSXLAGfuL6+51ZFa4OsuEm9xyp8gv+yjAduIg
X-Google-Smtp-Source: ABdhPJwXfOIGe0ZtJyX/oRqIJcY7DGCvtdQbsTRqbRfC/DIZhq4KAa97W7QqKnvG4fNMKfIa9MJRd3PPK/8TVZv9wMQ=
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr18380240wmo.15.1633639344225; 
 Thu, 07 Oct 2021 13:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130630.632028-6-pbonzini@redhat.com>
In-Reply-To: <20211007130630.632028-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:42:10 +0400
Message-ID: <CAJ+F1C+XHXXgkHXb2y06z2HKzsR1KGZPK7H1-+cYTXtoyT_MFg@mail.gmail.com>
Subject: Re: [PATCH 05/24] configure: add command line options for audio
 drivers
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cdc18d05cdc94c85"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42f.google.com
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

--000000000000cdc18d05cdc94c85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:13 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Handle the choice of audio drivers the same as all other dependencies.
>
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index fcadcf9577..5541671b58 100755
> --- a/configure
> +++ b/configure
> @@ -310,6 +310,12 @@ vnc_sasl=3D"auto"
>  vnc_jpeg=3D"auto"
>  vnc_png=3D"auto"
>  xkbcommon=3D"auto"
> +alsa=3D"auto"
> +coreaudio=3D"auto"
> +dsound=3D"auto"
> +jack=3D"auto"
> +oss=3D"auto"
> +pa=3D"auto"
>  xen=3D${default_feature:+disabled}
>  xen_ctrl_version=3D"$default_feature"
>  xen_pci_passthrough=3D"auto"
> @@ -1051,6 +1057,30 @@ for opt do
>    ;;
>    --enable-xen-pci-passthrough) xen_pci_passthrough=3D"enabled"
>    ;;
> +  --disable-alsa) alsa=3D"disabled"
> +  ;;
> +  --enable-alsa) alsa=3D"enabled"
> +  ;;
> +  --disable-coreaudio) coreaudio=3D"disabled"
> +  ;;
> +  --enable-coreaudio) coreaudio=3D"enabled"
> +  ;;
> +  --disable-dsound) dsound=3D"disabled"
> +  ;;
> +  --enable-dsound) dsound=3D"enabled"
> +  ;;
> +  --disable-jack) jack=3D"disabled"
> +  ;;
> +  --enable-jack) jack=3D"enabled"
> +  ;;
> +  --disable-oss) oss=3D"disabled"
> +  ;;
> +  --enable-oss) oss=3D"enabled"
> +  ;;
> +  --disable-pa) pa=3D"disabled"
> +  ;;
> +  --enable-pa) pa=3D"enabled"
> +  ;;
>    --disable-brlapi) brlapi=3D"disabled"
>    ;;
>    --enable-brlapi) brlapi=3D"enabled"
> @@ -1849,6 +1879,12 @@ disabled with --disable-FEATURE, default is enable=
d
> if available
>    mpath           Multipath persistent reservation passthrough
>    xen             xen backend driver support
>    xen-pci-passthrough    PCI passthrough support for Xen
> +  alsa            ALSA sound support
> +  coreaudio       CoreAudio sound support
> +  dsound          DirectSound sound support
> +  jack            JACK sound support
> +  oss             OSS sound support
> +  pa              PulseAudio sound support
>    brlapi          BrlAPI (Braile)
>    curl            curl connectivity
>    membarrier      membarrier system call (for Linux 4.14+ or Windows)
> @@ -5015,7 +5051,8 @@ if test "$skip_meson" =3D no; then
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server
> -Dmultiprocess=3D$multiprocess \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek
> -Dguest_agent_msi=3D$guest_agent_msi -Dbpf=3D$bpf\
>          $(if test "$default_feature" =3D no; then echo
> "-Dauto_features=3Ddisabled"; fi) \
> -        -Daudio_drv_list=3D$audio_drv_list
> -Dtcg_interpreter=3D$tcg_interpreter \
> +        -Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -Ddsound=3D$dsound -Djac=
k=3D$jack
> -Doss=3D$oss \
> +        -Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_list
> -Dtcg_interpreter=3D$tcg_interpreter \
>          $cross_arg \
>          "$PWD" "$source_path"
>
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cdc18d05cdc94c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:13 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Handle the choice of audio drivers the same as all other depen=
dencies.<br>
<br>
Cc: Gerd Hoffman &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank"=
>kraxel@redhat.com</a>&gt;<br>
Cc: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=
=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 39 ++++++++++++++++++++++++++++++++++++++-<br>
=C2=A01 file changed, 38 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/configure b/configure<br>
index fcadcf9577..5541671b58 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -310,6 +310,12 @@ vnc_sasl=3D&quot;auto&quot;<br>
=C2=A0vnc_jpeg=3D&quot;auto&quot;<br>
=C2=A0vnc_png=3D&quot;auto&quot;<br>
=C2=A0xkbcommon=3D&quot;auto&quot;<br>
+alsa=3D&quot;auto&quot;<br>
+coreaudio=3D&quot;auto&quot;<br>
+dsound=3D&quot;auto&quot;<br>
+jack=3D&quot;auto&quot;<br>
+oss=3D&quot;auto&quot;<br>
+pa=3D&quot;auto&quot;<br>
=C2=A0xen=3D${default_feature:+disabled}<br>
=C2=A0xen_ctrl_version=3D&quot;$default_feature&quot;<br>
=C2=A0xen_pci_passthrough=3D&quot;auto&quot;<br>
@@ -1051,6 +1057,30 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-xen-pci-passthrough) xen_pci_passthrough=3D&quot;enab=
led&quot;<br>
=C2=A0 =C2=A0;;<br>
+=C2=A0 --disable-alsa) alsa=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-alsa) alsa=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-coreaudio) coreaudio=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-coreaudio) coreaudio=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-dsound) dsound=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-dsound) dsound=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-jack) jack=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-jack) jack=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-oss) oss=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-oss) oss=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-pa) pa=3D&quot;disabled&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-pa) pa=3D&quot;enabled&quot;<br>
+=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-brlapi) brlapi=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-brlapi) brlapi=3D&quot;enabled&quot;<br>
@@ -1849,6 +1879,12 @@ disabled with --disable-FEATURE, default is enabled =
if available<br>
=C2=A0 =C2=A0mpath=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Multipath persis=
tent reservation passthrough<br>
=C2=A0 =C2=A0xen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen backend=
 driver support<br>
=C2=A0 =C2=A0xen-pci-passthrough=C2=A0 =C2=A0 PCI passthrough support for X=
en<br>
+=C2=A0 alsa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALSA sound support<br=
>
+=C2=A0 coreaudio=C2=A0 =C2=A0 =C2=A0 =C2=A0CoreAudio sound support<br>
+=C2=A0 dsound=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DirectSound sound support<=
br>
+=C2=A0 jack=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JACK sound support<br=
>
+=C2=A0 oss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound suppor=
t<br>
+=C2=A0 pa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound=
 support<br>
=C2=A0 =C2=A0brlapi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BrlAPI (Braile)<br>
=C2=A0 =C2=A0curl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl connectivit=
y<br>
=C2=A0 =C2=A0membarrier=C2=A0 =C2=A0 =C2=A0 membarrier system call (for Lin=
ux 4.14+ or Windows)<br>
@@ -5015,7 +5051,8 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server -Dmultiprocess=3D$multiprocess \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 -Dguest_agent_msi=3D$guest_agent_msi -Dbpf=3D$bpf\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if test &quot;$default_feature&quot; =
=3D no; then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Daudio_drv_list=3D$audio_drv_list -Dtcg_inter=
preter=3D$tcg_interpreter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -Ddsou=
nd=3D$dsound -Djack=3D$jack -Doss=3D$oss \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_list =
-Dtcg_interpreter=3D$tcg_interpreter \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source_path&quot;=
<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000cdc18d05cdc94c85--

