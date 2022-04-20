Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49650904E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:21:06 +0200 (CEST)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFsv-0006OL-Sh
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEtR-0004iV-QA
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:17:34 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEtP-0002v9-TQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:17:33 -0400
Received: by mail-qt1-x82b.google.com with SMTP id t26so1586128qtn.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Q3ooPdXHJX4xBJnCdX+AjM/mGXLBHexBMClYBDD/bI=;
 b=BRehyItWHOWoNf7f0xzurJlsf3plDQCGtF3JPK8n8kygOqw092kBnIijytvV/nqZ6G
 ZSCANwaKG5oKuOe0XBgwca5F2YPOWCn6VMeUSS+cUJrNzPQTmUSBabIQ7hHddbnYYUTU
 uvwG9vZqEM2FjIS90909NfxsaVjdk8iezbcku8a0HUsqtWneBLGYr9gJfPCC07AjQ4CC
 avJbA7e6WJRpqR8baO5Vy5mqguchP5GFIUZSFWfC1mwQH20stI5Dg1zyGN2DxrVO3By7
 2XtQAUBheFsuGZA4Pw3MECOPMTuC3XSYxct0GxKVPRmM0+W7rS6aPRo1MG9c3sQM+LPl
 hvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Q3ooPdXHJX4xBJnCdX+AjM/mGXLBHexBMClYBDD/bI=;
 b=FKW6tp5UkUFqwP+c49oFXz0vzFANARMgJLuF08KPf1ghG0FbKJBjSmWQ6B02PAAWFZ
 Q7ig8OoXlOJkH3Dau+AxZJWzB6unTxw9mD9NX6o+/LJJ2I+4Kfl70cv2jC0zo8epqBpO
 JtVUf2Pnm7Yjy5+9wei1gpxF5pa0bGKAIwRvuG3+wfz00Ajn2N8ajG3bHcxqlaJHFBIB
 c7iu29z07iuG8TIzuKMmPxem4xdLFR9U52XdjLWDeuoCOr3uOhTmH6VoLmbA9lOfHEaU
 9xLqImlIK60omAwrHbLvGtMOVi07n3UZF81k4VgC+HvSUv8Y/mUXeKSv6qRtzvKl1J26
 pfqw==
X-Gm-Message-State: AOAM532tVakDzIl6//xSfYL2dPMCSs/aTiN9IMI63cHpO5amnNdfJCjS
 5c4VPzZbgIze527krh2KMKcGsJ+p9rO+xiu7UY0=
X-Google-Smtp-Source: ABdhPJzu2dCe400lFUIuHWDOdw86EWPkjVStk+pPeNkkv6wSwdycQGTd21pBV9RdLjj66zYkLl9bVvj+sJFjjSwjKvo=
X-Received: by 2002:a05:622a:cc:b0:2f1:fc74:c7a6 with SMTP id
 p12-20020a05622a00cc00b002f1fc74c7a6mr11145527qtw.387.1650478650891; Wed, 20
 Apr 2022 11:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-17-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-17-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:17:19 +0400
Message-ID: <CAJ+F1CKe4VTc+GB4LcVs8HwuCCGTrYdiLkSnGge+65=LUxHw=w@mail.gmail.com>
Subject: Re: [PATCH 16/34] configure, meson: move iasl detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b21f7905dd1a016b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b21f7905dd1a016b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:52 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure   |  2 +-
>  meson.build | 16 +++++++++-------
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/configure b/configure
> index 11d3cc19ca..772714d386 100755
> --- a/configure
> +++ b/configure
> @@ -2507,7 +2507,7 @@ if test "$skip_meson" =3D no; then
>          -Daudio_drv_list=3D$audio_drv_list \
>          -Ddefault_devices=3D$default_devices \
>          -Ddocdir=3D"$docdir" \
> -        -Diasl=3D"$($iasl -h >/dev/null 2>&1 && printf %s "$iasl")" \
> +        -Diasl=3D"$iasl" \
>          -Dqemu_firmwarepath=3D"$firmwarepath" \
>          -Dqemu_suffix=3D"$qemu_suffix" \
>          -Dsmbd=3D"$smbd" \
> diff --git a/meson.build b/meson.build
> index 7cbb771393..d255facbfd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -167,6 +167,12 @@ if 'dtrace' in get_option('trace_backends')
>    endif
>  endif
>
> +if get_option('iasl') =3D=3D ''
> +  iasl =3D find_program('iasl', required: false)
> +else
> +  iasl =3D find_program(get_option('iasl'), required: true)
> +endif
> +
>  ##################
>  # Compiler flags #
>  ##################
> @@ -1582,8 +1588,8 @@ foreach k : get_option('trace_backends')
>    config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
>  endforeach
>  config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'=
))
> -if get_option('iasl') !=3D ''
> -  config_host_data.set_quoted('CONFIG_IASL', get_option('iasl'))
> +if iasl.found()
> +  config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
>  endif
>  config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') /
> get_option('bindir'))
>  config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
> @@ -3617,11 +3623,7 @@ summary_info +=3D {'sphinx-build':      sphinx_bui=
ld}
>  if config_host.has_key('HAVE_GDB_BIN')
>    summary_info +=3D {'gdb':             config_host['HAVE_GDB_BIN']}
>  endif
> -if get_option('iasl') !=3D ''
> -  summary_info +=3D {'iasl':            get_option('iasl')}
> -else
> -  summary_info +=3D {'iasl':            false}
> -endif
> +summary_info +=3D {'iasl':              iasl}
>  summary_info +=3D {'genisoimage':       config_host['GENISOIMAGE']}
>  if targetos =3D=3D 'windows' and have_ga
>    summary_info +=3D {'wixl':            wixl}
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b21f7905dd1a016b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:52 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meson.build | 16 +++++++++-------<br>
=C2=A02 files changed, 10 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 11d3cc19ca..772714d386 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2507,7 +2507,7 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Daudio_drv_list=3D$audio_drv_list \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddefault_devices=3D$default_devices \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocdir=3D&quot;$docdir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Diasl=3D&quot;$($iasl -h &gt;/dev/null 2&gt;&=
amp;1 &amp;&amp; printf %s &quot;$iasl&quot;)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Diasl=3D&quot;$iasl&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_firmwarepath=3D&quot;$firmwarepath=
&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_suffix=3D&quot;$qemu_suffix&quot; =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dsmbd=3D&quot;$smbd&quot; \<br>
diff --git a/meson.build b/meson.build<br>
index 7cbb771393..d255facbfd 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -167,6 +167,12 @@ if &#39;dtrace&#39; in get_option(&#39;trace_backends&=
#39;)<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
<br>
+if get_option(&#39;iasl&#39;) =3D=3D &#39;&#39;<br>
+=C2=A0 iasl =3D find_program(&#39;iasl&#39;, required: false)<br>
+else<br>
+=C2=A0 iasl =3D find_program(get_option(&#39;iasl&#39;), required: true)<b=
r>
+endif<br>
+<br>
=C2=A0##################<br>
=C2=A0# Compiler flags #<br>
=C2=A0##################<br>
@@ -1582,8 +1588,8 @@ foreach k : get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0config_host_data.set(&#39;CONFIG_TRACE_&#39; + k.to_upper(), t=
rue)<br>
=C2=A0endforeach<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_TRACE_FILE&#39;, get_option(&=
#39;trace_file&#39;))<br>
-if get_option(&#39;iasl&#39;) !=3D &#39;&#39;<br>
-=C2=A0 config_host_data.set_quoted(&#39;CONFIG_IASL&#39;, get_option(&#39;=
iasl&#39;))<br>
+if iasl.found()<br>
+=C2=A0 config_host_data.set_quoted(&#39;CONFIG_IASL&#39;, iasl.full_path()=
)<br>
=C2=A0endif<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_BINDIR&#39;, get_option(&#39;=
prefix&#39;) / get_option(&#39;bindir&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_PREFIX&#39;, get_option(&#39;=
prefix&#39;))<br>
@@ -3617,11 +3623,7 @@ summary_info +=3D {&#39;sphinx-build&#39;:=C2=A0 =C2=
=A0 =C2=A0 sphinx_build}<br>
=C2=A0if config_host.has_key(&#39;HAVE_GDB_BIN&#39;)<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;gdb&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0config_host[&#39;HAVE_GDB_BIN&#39;]}<br>
=C2=A0endif<br>
-if get_option(&#39;iasl&#39;) !=3D &#39;&#39;<br>
-=C2=A0 summary_info +=3D {&#39;iasl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 get_option(&#39;iasl&#39;)}<br>
-else<br>
-=C2=A0 summary_info +=3D {&#39;iasl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 false}<br>
-endif<br>
+summary_info +=3D {&#39;iasl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 iasl}<br>
=C2=A0summary_info +=3D {&#39;genisoimage&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host[&#39;GENISOIMAGE&#39;]}<br>
=C2=A0if targetos =3D=3D &#39;windows&#39; and have_ga<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;wixl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 wixl}<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b21f7905dd1a016b--

