Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD525090AD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:50:09 +0200 (CEST)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGL2-0001g2-9v
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhFIp-0004aP-JG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:43:48 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhFIn-0006gk-LI
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:43:47 -0400
Received: by mail-qk1-x729.google.com with SMTP id e128so1908919qkd.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RIcixjswI7IxWwAo/+oO+mIWFg+t7J3WgT1g3JTgjF8=;
 b=gzG8gX+TAjKeoiZ1OvKhl4LePzNWyCRh9qaxo+KXjDSjhswWppMJh97i2SPaZMQMgJ
 KZTVgiuA2ueYeDjm1r5t3qabzPoVe25eHUyT1XT/b6uQfJ+BgsxQZvc3XqKBXhLKUt6h
 iQ8E8HdItvgbrs0TrTPD2yKPTgo0pzbFFsjP0RmoYkP11iZSNm/Pke+N0GVQygCPhHb4
 ka5VLSva7hg8PHAyjgFKGQP/0T4S862XDZ4bKN9hKhQuL7EgJM7doQKtj8NtT9rB7ZGf
 VcfoSQqpU/MSuqk7jvfR4uWjbGtz0/oNuLIMcnvVKzIbZYokxI8IHEOFrc2aeRZ7GQ5V
 Y4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RIcixjswI7IxWwAo/+oO+mIWFg+t7J3WgT1g3JTgjF8=;
 b=U7os6p3GM75Mf/T/3/NZ+z+Oz+DZqq2nQ/S1Sco3qQbyL95/v9JXxTL4JUKg8V2L3i
 UAEB+9ZP5a5ZQiAwDEZA+/TEyDp4mgJuRPeq1RPrXoKhYcy/eu6ihsCqwt6nabMXPgev
 ET4BIV+oIqkoKgD6Y95nmpzDfUwQFOun0R0hlKZH8R51l3VJza8MnkO/G8KOuTivq9rd
 KEfFjVMZOOWq0n7JLqWNtyk1uX6QcMPy0U4r9s1mkAu1f7Dycc3kZMalS59mStRKjshQ
 WJO6ynFtV0pPA0RZvvb5AADhEbPF98FzqiBKtXe6MYghF2XOBMDG2fBSSR6S+2xqZt7t
 SjZw==
X-Gm-Message-State: AOAM532DJMMQx0fI3JNT6iWG7P+CXyDEATtfId9UmwksEm2HSHJVExw5
 xjVDbCKJMwGLFaC5NaWmICF35GWhnMBj1ABK0Rw8uVsAp0WOkA==
X-Google-Smtp-Source: ABdhPJyvMjEAaLUjSNTXy0CoeVQicjaqXpFz5Gb1k0ZSbDKpPJmszmGWf+1YugRH8FPY6GLid8u9iE93Qux5fwEvLUE=
X-Received: by 2002:a37:aa48:0:b0:69e:d351:9683 with SMTP id
 t69-20020a37aa48000000b0069ed3519683mr3125110qke.539.1650480224560; Wed, 20
 Apr 2022 11:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-24-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-24-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:43:33 +0400
Message-ID: <CAJ+F1CJ-cOHtxeTyOpu_52a+sm+8wVd3z7+PYXDns72-VTGX1g@mail.gmail.com>
Subject: Re: [PATCH 23/34] meson: always combine directories with prefix
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007e6ab805dd1a5f4d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x729.google.com
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

--0000000000007e6ab805dd1a5f4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:51 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Meson allows directories such as "bindir" to be relative to the prefix.
> Right
> now configure is forcing an absolute path, but that is not really
> necessary:
> just make sure all uses of the directory variables are prefixed
> appropriately.
> Do the same also for the options that are custom for QEMU, i.e. docdir an=
d
> qemu_firmwarepath.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 869cc10128..2545ac2848 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1618,7 +1618,7 @@ config_host_data.set_quoted('CONFIG_PREFIX',
> get_option('prefix'))
>  config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') =
/
> qemu_confdir)
>  config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') =
/
> qemu_datadir)
>  config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR',
> get_option('prefix') / qemu_desktopdir)
> -config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH',
> get_option('qemu_firmwarepath'))
> +config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH',
> get_option('prefix') / get_option('qemu_firmwarepath'))
>  config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix'=
)
> / get_option('libexecdir'))
>  config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') =
/
> qemu_icondir)
>  config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix'=
)
> / get_option('localedir'))
> @@ -3615,20 +3615,20 @@ endif
>  summary_info =3D {}
>  summary_info +=3D {'Install prefix':    get_option('prefix')}
>  summary_info +=3D {'BIOS directory':    qemu_datadir}
> -summary_info +=3D {'firmware path':     get_option('qemu_firmwarepath')}
> -summary_info +=3D {'binary directory':  get_option('bindir')}
> -summary_info +=3D {'library directory': get_option('libdir')}
> +summary_info +=3D {'firmware path':     get_option('prefix') /
> get_option('qemu_firmwarepath')}
> +summary_info +=3D {'binary directory':  get_option('prefix') /
> get_option('bindir')}
> +summary_info +=3D {'library directory': get_option('prefix') /
> get_option('libdir')}
>  summary_info +=3D {'module directory':  qemu_moddir}
> -summary_info +=3D {'libexec directory': get_option('libexecdir')}
> -summary_info +=3D {'include directory': get_option('includedir')}
> -summary_info +=3D {'config directory':  get_option('sysconfdir')}
> +summary_info +=3D {'libexec directory': get_option('prefix') /
> get_option('libexecdir')}
> +summary_info +=3D {'include directory': get_option('prefix') /
> get_option('includedir')}
> +summary_info +=3D {'config directory':  get_option('prefix') /
> get_option('sysconfdir')}
>  if targetos !=3D 'windows'
> -  summary_info +=3D {'local state directory': get_option('localstatedir'=
)}
> -  summary_info +=3D {'Manual directory':      get_option('mandir')}
> +  summary_info +=3D {'local state directory': get_option('prefix') /
> get_option('localstatedir')}
> +  summary_info +=3D {'Manual directory':      get_option('prefix') /
> get_option('mandir')}
>  else
>    summary_info +=3D {'local state directory': 'queried at runtime'}
>  endif
> -summary_info +=3D {'Doc directory':     get_option('docdir')}
> +summary_info +=3D {'Doc directory':     get_option('prefix') /
> get_option('docdir')}
>  summary_info +=3D {'Build directory':   meson.current_build_dir()}
>  summary_info +=3D {'Source path':       meson.current_source_dir()}
>  summary_info +=3D {'GIT submodules':    config_host['GIT_SUBMODULES']}
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007e6ab805dd1a5f4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:51 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Meso=
n allows directories such as &quot;bindir&quot; to be relative to the prefi=
x.=C2=A0 Right<br>
now configure is forcing an absolute path, but that is not really necessary=
:<br>
just make sure all uses of the directory variables are prefixed appropriate=
ly.<br>
Do the same also for the options that are custom for QEMU, i.e. docdir and<=
br>
qemu_firmwarepath.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 20 ++++++++++----------<br>
=C2=A01 file changed, 10 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 869cc10128..2545ac2848 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1618,7 +1618,7 @@ config_host_data.set_quoted(&#39;CONFIG_PREFIX&#39;, =
get_option(&#39;prefix&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_CONFDIR&#39;, get_option=
(&#39;prefix&#39;) / qemu_confdir)<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_DATADIR&#39;, get_option=
(&#39;prefix&#39;) / qemu_datadir)<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_DESKTOPDIR&#39;, get_opt=
ion(&#39;prefix&#39;) / qemu_desktopdir)<br>
-config_host_data.set_quoted(&#39;CONFIG_QEMU_FIRMWAREPATH&#39;, get_option=
(&#39;qemu_firmwarepath&#39;))<br>
+config_host_data.set_quoted(&#39;CONFIG_QEMU_FIRMWAREPATH&#39;, get_option=
(&#39;prefix&#39;) / get_option(&#39;qemu_firmwarepath&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_HELPERDIR&#39;, get_opti=
on(&#39;prefix&#39;) / get_option(&#39;libexecdir&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_ICONDIR&#39;, get_option=
(&#39;prefix&#39;) / qemu_icondir)<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_LOCALEDIR&#39;, get_opti=
on(&#39;prefix&#39;) / get_option(&#39;localedir&#39;))<br>
@@ -3615,20 +3615,20 @@ endif<br>
=C2=A0summary_info =3D {}<br>
=C2=A0summary_info +=3D {&#39;Install prefix&#39;:=C2=A0 =C2=A0 get_option(=
&#39;prefix&#39;)}<br>
=C2=A0summary_info +=3D {&#39;BIOS directory&#39;:=C2=A0 =C2=A0 qemu_datadi=
r}<br>
-summary_info +=3D {&#39;firmware path&#39;:=C2=A0 =C2=A0 =C2=A0get_option(=
&#39;qemu_firmwarepath&#39;)}<br>
-summary_info +=3D {&#39;binary directory&#39;:=C2=A0 get_option(&#39;bindi=
r&#39;)}<br>
-summary_info +=3D {&#39;library directory&#39;: get_option(&#39;libdir&#39=
;)}<br>
+summary_info +=3D {&#39;firmware path&#39;:=C2=A0 =C2=A0 =C2=A0get_option(=
&#39;prefix&#39;) / get_option(&#39;qemu_firmwarepath&#39;)}<br>
+summary_info +=3D {&#39;binary directory&#39;:=C2=A0 get_option(&#39;prefi=
x&#39;) / get_option(&#39;bindir&#39;)}<br>
+summary_info +=3D {&#39;library directory&#39;: get_option(&#39;prefix&#39=
;) / get_option(&#39;libdir&#39;)}<br>
=C2=A0summary_info +=3D {&#39;module directory&#39;:=C2=A0 qemu_moddir}<br>
-summary_info +=3D {&#39;libexec directory&#39;: get_option(&#39;libexecdir=
&#39;)}<br>
-summary_info +=3D {&#39;include directory&#39;: get_option(&#39;includedir=
&#39;)}<br>
-summary_info +=3D {&#39;config directory&#39;:=C2=A0 get_option(&#39;sysco=
nfdir&#39;)}<br>
+summary_info +=3D {&#39;libexec directory&#39;: get_option(&#39;prefix&#39=
;) / get_option(&#39;libexecdir&#39;)}<br>
+summary_info +=3D {&#39;include directory&#39;: get_option(&#39;prefix&#39=
;) / get_option(&#39;includedir&#39;)}<br>
+summary_info +=3D {&#39;config directory&#39;:=C2=A0 get_option(&#39;prefi=
x&#39;) / get_option(&#39;sysconfdir&#39;)}<br>
=C2=A0if targetos !=3D &#39;windows&#39;<br>
-=C2=A0 summary_info +=3D {&#39;local state directory&#39;: get_option(&#39=
;localstatedir&#39;)}<br>
-=C2=A0 summary_info +=3D {&#39;Manual directory&#39;:=C2=A0 =C2=A0 =C2=A0 =
get_option(&#39;mandir&#39;)}<br>
+=C2=A0 summary_info +=3D {&#39;local state directory&#39;: get_option(&#39=
;prefix&#39;) / get_option(&#39;localstatedir&#39;)}<br>
+=C2=A0 summary_info +=3D {&#39;Manual directory&#39;:=C2=A0 =C2=A0 =C2=A0 =
get_option(&#39;prefix&#39;) / get_option(&#39;mandir&#39;)}<br>
=C2=A0else<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;local state directory&#39;: &#39;queri=
ed at runtime&#39;}<br>
=C2=A0endif<br>
-summary_info +=3D {&#39;Doc directory&#39;:=C2=A0 =C2=A0 =C2=A0get_option(=
&#39;docdir&#39;)}<br>
+summary_info +=3D {&#39;Doc directory&#39;:=C2=A0 =C2=A0 =C2=A0get_option(=
&#39;prefix&#39;) / get_option(&#39;docdir&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Build directory&#39;:=C2=A0 =C2=A0meson.curre=
nt_build_dir()}<br>
=C2=A0summary_info +=3D {&#39;Source path&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0m=
eson.current_source_dir()}<br>
=C2=A0summary_info +=3D {&#39;GIT submodules&#39;:=C2=A0 =C2=A0 config_host=
[&#39;GIT_SUBMODULES&#39;]}<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007e6ab805dd1a5f4d--

