Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A642C425E29
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:51:12 +0200 (CEST)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaMB-0001e1-Iw
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDb-0005pV-Ou
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDa-0006DV-28
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t2so22845983wrb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6AKrDx/4YDQ3i/RzgziedsnZ+WEExioi/z9PT2UAWU=;
 b=DMee0NmsRG+RYYcOnHvRORq87YhQE1+zwpyQPBYbT9PAxPpx8Wo3Q1zVLaq4R0DABF
 MUbig8ArpYAFImAM35T02WkOfW8JxWh88SRm4SNjeqEaKHMaRcJKqGG2bWOwfbC6NdTA
 iEbYWrQNUGxdXF9ppqtHkn7OvZ+z8ApaBDBzJypYNJVuXDWgFn/l3RN0YrK01RufNE5X
 aFH3HOd/+uf5K7yeweBA9c7DmstKQtZ/+qiA22S2YZh6f6cDKuA6qPTkhp3Rb4zUCqDe
 afLMZW3SjZzauv2LvQ6+kOlu9fHloahq33jpiJfrd9ZmoCJkOH0DRK5kiUjSzeLPrOZl
 SFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6AKrDx/4YDQ3i/RzgziedsnZ+WEExioi/z9PT2UAWU=;
 b=3AgBenWygBkCK/bmruF65N5LRIS5Ex1Ih2g0tueQp1JtjfbsWEaT8JgbEeNCTOknyX
 LHC7jn5nzbX1k9JjUL9qSDFw6hdgqosZmKqPRmRZTcWL+5fnyK5A6SR6XRJRuvG5zUmv
 wCVuyI3lEm/2DL2otD1HYXplJSXC68JCqYcvmtqciBVlKt2M0/XhSBe483mxhsKWs2wC
 VXsCdLyfDarh1Mtl+8+cc0BcfWDIr/HQRCruU1a8iBNO79/M7sPzYBwcY+4Kc+6p8WEI
 1fBm0nQbOJeL7gDFAlU7TI/F4wOWcXYUShScnbyVlmbZ3ArDzsKz+sCdNx1elooAnZCO
 tbsQ==
X-Gm-Message-State: AOAM532jCzagIHo6nYNKZ7KqRPga4iFwzos7aAeTTCMdISA68F5IS7kz
 1zk0dkd3sDw0i3UzbkdQb3Qf/BYXHflZrSd0PWs=
X-Google-Smtp-Source: ABdhPJxM57WmLWtkT9XAfyNpVnwuwFfC0fmLEvuinduhva7Fb8ro8nERE8vyBEpQjj4bL8mPFDbAvCy/TrYax2kn1jY=
X-Received: by 2002:adf:a78a:: with SMTP id j10mr8254948wrc.231.1633639336800; 
 Thu, 07 Oct 2021 13:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-3-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:42:03 +0400
Message-ID: <CAJ+F1C+McQJ5wSzRjMimj_iyQjogDHQ1GUsG4gQy3a8Zn2hOzA@mail.gmail.com>
Subject: Re: [PATCH 08/24] trace: simple: pass trace_file unmodified to
 config-host.h
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005c76bc05cdc94c54"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005c76bc05cdc94c54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:09 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Add the suffix directly in trace/simple.c, so that quoting is done
> properly by Meson.
>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure      | 2 --
>  meson.build    | 2 +-
>  trace/simple.c | 2 +-
>  3 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/configure b/configure
> index f5dfcf1a08..98723db0cd 100755
> --- a/configure
> +++ b/configure
> @@ -4578,8 +4578,6 @@ if have_backend "nop"; then
>  fi
>  if have_backend "simple"; then
>    echo "CONFIG_TRACE_SIMPLE=3Dy" >> $config_host_mak
> -  # Set the appropriate trace file.
> -  trace_file=3D"\"$trace_file-\" FMT_pid"
>  fi
>  if have_backend "log"; then
>    echo "CONFIG_TRACE_LOG=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 745b8c3c46..8752b757cc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1574,7 +1574,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not
> cc.compiles('''
>
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> -strings =3D ['HOST_DSOSUF', 'CONFIG_IASL']
> +strings =3D ['HOST_DSOSUF', 'CONFIG_IASL', 'CONFIG_TRACE_FILE']
>  foreach k, v: config_host
>    if ignored.contains(k)
>      # do nothing
> diff --git a/trace/simple.c b/trace/simple.c
> index ac499edee0..18af590cf7 100644
> --- a/trace/simple.c
> +++ b/trace/simple.c
> @@ -364,7 +364,7 @@ void st_set_trace_file(const char *file)
>
>      if (!file) {
>          /* Type cast needed for Windows where getpid() returns an int. *=
/
> -        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE,
> (pid_t)getpid());
> +        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE "-" FMT_pi=
d,
> (pid_t)getpid());
>      } else {
>          trace_file_name =3D g_strdup_printf("%s", file);
>      }
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005c76bc05cdc94c54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:09 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Add the suffix directly in trace/simple.c, so that quoting is =
done<br>
properly by Meson.<br>
<br>
Cc: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=3D"_b=
lank">stefanha@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meson.build=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0trace/simple.c | 2 +-<br>
=C2=A03 files changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index f5dfcf1a08..98723db0cd 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -4578,8 +4578,6 @@ if have_backend &quot;nop&quot;; then<br>
=C2=A0fi<br>
=C2=A0if have_backend &quot;simple&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_TRACE_SIMPLE=3Dy&quot; &gt;&gt; $config_host=
_mak<br>
-=C2=A0 # Set the appropriate trace file.<br>
-=C2=A0 trace_file=3D&quot;\&quot;$trace_file-\&quot; FMT_pid&quot;<br>
=C2=A0fi<br>
=C2=A0if have_backend &quot;log&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_TRACE_LOG=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
diff --git a/meson.build b/meson.build<br>
index 745b8c3c46..8752b757cc 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1574,7 +1574,7 @@ config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;, =
not cc.compiles(&#39;&#39;&#39;<br>
<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually per-targ=
et<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
-strings =3D [&#39;HOST_DSOSUF&#39;, &#39;CONFIG_IASL&#39;]<br>
+strings =3D [&#39;HOST_DSOSUF&#39;, &#39;CONFIG_IASL&#39;, &#39;CONFIG_TRA=
CE_FILE&#39;]<br>
=C2=A0foreach k, v: config_host<br>
=C2=A0 =C2=A0if ignored.contains(k)<br>
=C2=A0 =C2=A0 =C2=A0# do nothing<br>
diff --git a/trace/simple.c b/trace/simple.c<br>
index ac499edee0..18af590cf7 100644<br>
--- a/trace/simple.c<br>
+++ b/trace/simple.c<br>
@@ -364,7 +364,7 @@ void st_set_trace_file(const char *file)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!file) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Type cast needed for Windows where get=
pid() returns an int. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_file_name =3D g_strdup_printf(CONFIG_TRA=
CE_FILE, (pid_t)getpid());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_file_name =3D g_strdup_printf(CONFIG_TRA=
CE_FILE &quot;-&quot; FMT_pid, (pid_t)getpid());<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_file_name =3D g_strdup_printf(&quot=
;%s&quot;, file);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000005c76bc05cdc94c54--

