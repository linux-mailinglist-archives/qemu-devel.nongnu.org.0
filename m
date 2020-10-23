Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2F296CFA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 12:41:23 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVuVc-0003aK-VP
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 06:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kVuTZ-0002cq-Df; Fri, 23 Oct 2020 06:39:13 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kVuTX-0002tj-Ko; Fri, 23 Oct 2020 06:39:13 -0400
Received: by mail-ej1-x641.google.com with SMTP id t25so1664979ejd.13;
 Fri, 23 Oct 2020 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JXA1OT0YqPvqXFZ/Mtuz428UcJ4N5PLp7VdRKj+Y5xY=;
 b=SJgPavLlCWrB3Hyyix2d4OA0Nv5r5oQZk0JEXnPSNspoNzo7+v5pMsDWCmxmsewyWn
 tSl5mB3bx8mIlBeRgsTStxULBiHduYeYWB/IyEX1nzeX5xLmnB+79W/Loe8wC2k8txQF
 rGwvKEQpX6wUmclJi2PvRIVXncuQNhsnCimMh9cyQKcDEf0m6DDpMw8feiXIc/xmnvgl
 zs+wGEg+/RRGBRZT1QozQEpR+ygUYEtJ3TzmIn4l0NV/7bgLGQ01TWatYU0yYP4gVpfx
 XKP24SiYMPxPyFRNGmcyPXi9fFQ1m8QLm+NGShGOFcJ1XuQRxo8NMPqEwjA+3i/pKRox
 Ca8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JXA1OT0YqPvqXFZ/Mtuz428UcJ4N5PLp7VdRKj+Y5xY=;
 b=o/EywuNyHdcu7WSvsmLSOCjrOA8dITZQohcDSI+040tULkjuMq8hG9Na99dH8peQpi
 RGAozdUb1ZTGB5fYcWdK1V9gdDdUUICVYKRtUEtOk6LGEBe9v8qoji5GPTFPaRBGbL64
 FVpDF+McdPZtIyz+WgYAMDJh1Z1GD5T+A6MD7T2/xb0VeE1lXU/Jf5Thlyen23HD3f8c
 7spKf5czTFarjgNe6N88DTWCtNwLcTn/o87qk1n780tMox7sJR+dAmtk5/8Nc3xo42KW
 Df6WRkIGTGBkMXrNYiiDIrsfaqwDa4cERW4uNJT/eT9HVE3rCwSB/3+2olwrz4wRdGRe
 512Q==
X-Gm-Message-State: AOAM531ZxaQYfoEQlE8yaqZ8O83smPmMd5JO5thfm2OkMicl7/04Dcv5
 uMJhBwSomA8PhEFrdFSL3lkBxTbfUTsX79LQ7aE=
X-Google-Smtp-Source: ABdhPJyAmDS2Z0UDuQ1ExpJ4LDBHo82ktmY0KbE3FyKDPSPhVdw6iKqFBvhCv+02/3ql50Aru563kePerCNtjgn1LhY=
X-Received: by 2002:a17:906:1a11:: with SMTP id
 i17mr1240243ejf.381.1603449549534; 
 Fri, 23 Oct 2020 03:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201023101222.250147-1-kwolf@redhat.com>
 <20201023101222.250147-3-kwolf@redhat.com>
In-Reply-To: <20201023101222.250147-3-kwolf@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Oct 2020 14:38:58 +0400
Message-ID: <CAJ+F1C+s8cYgL20PXe2yRrC2jjpW+ANW215o4Z6jCgrkOewkZw@mail.gmail.com>
Subject: Re: [PATCH 2/6] char: Factor out qemu_chr_print_types()
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d0bc7d05b2543096"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d0bc7d05b2543096
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 2:14 PM Kevin Wolf <kwolf@redhat.com> wrote:

> We'll want to call the same from a non-QemuOpts code path.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/chardev/char.h |  1 +
>  chardev/char.c         | 17 +++++++++++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index db42f0a8c6..3b91645081 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -212,6 +212,7 @@ void qemu_chr_be_update_read_handlers(Chardev *s,
>   */
>  void qemu_chr_be_event(Chardev *s, QEMUChrEvent event);
>
> +void qemu_chr_print_types(void);
>  int qemu_chr_add_client(Chardev *s, int fd);
>  Chardev *qemu_chr_find(const char *name);
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 78553125d3..028612c333 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -633,6 +633,16 @@ ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts,
> Error **errp)
>      return backend;
>  }
>
> +void qemu_chr_print_types(void)
> +{
> +    GString *str =3D g_string_new("");
>

Suggest g_auto here

+
> +    chardev_name_foreach(help_string_append, str);
> +
> +    qemu_printf("Available chardev backend types: %s\n", str->str);
> +    g_string_free(str, true);
> +}
> +
>  Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context,
>                                  Error **errp)
>  {
> @@ -644,12 +654,7 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts,
> GMainContext *context,
>      char *bid =3D NULL;
>
>      if (name && is_help_option(name)) {
> -        GString *str =3D g_string_new("");
> -
> -        chardev_name_foreach(help_string_append, str);
> -
> -        qemu_printf("Available chardev backend types: %s\n", str->str);
> -        g_string_free(str, true);
> +        qemu_chr_print_types();
>          return NULL;
>      }
>
> --
> 2.28.0
>
>
>
anyway
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d0bc7d05b2543096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 23, 2020 at 2:14 PM Kevin=
 Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We&#39;ll wan=
t to call the same from a non-QemuOpts code path.<br>
<br>
Signed-off-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D=
"_blank">kwolf@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/chardev/char.h |=C2=A0 1 +<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++-----=
-<br>
=C2=A02 files changed, 12 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/include/chardev/char.h b/include/chardev/char.h<br>
index db42f0a8c6..3b91645081 100644<br>
--- a/include/chardev/char.h<br>
+++ b/include/chardev/char.h<br>
@@ -212,6 +212,7 @@ void qemu_chr_be_update_read_handlers(Chardev *s,<br>
=C2=A0 */<br>
=C2=A0void qemu_chr_be_event(Chardev *s, QEMUChrEvent event);<br>
<br>
+void qemu_chr_print_types(void);<br>
=C2=A0int qemu_chr_add_client(Chardev *s, int fd);<br>
=C2=A0Chardev *qemu_chr_find(const char *name);<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 78553125d3..028612c333 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -633,6 +633,16 @@ ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0return backend;<br>
=C2=A0}<br>
<br>
+void qemu_chr_print_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 GString *str =3D g_string_new(&quot;&quot;);<br></blockquote=
><div><br></div><div>Suggest g_auto here</div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 chardev_name_foreach(help_string_append, str);<br>
+<br>
+=C2=A0 =C2=A0 qemu_printf(&quot;Available chardev backend types: %s\n&quot=
;, str-&gt;str);<br>
+=C2=A0 =C2=A0 g_string_free(str, true);<br>
+}<br>
+<br>
=C2=A0Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
@@ -644,12 +654,7 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainC=
ontext *context,<br>
=C2=A0 =C2=A0 =C2=A0char *bid =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (name &amp;&amp; is_help_option(name)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GString *str =3D g_string_new(&quot;&quot;);<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chardev_name_foreach(help_string_append, str);=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_printf(&quot;Available chardev backend ty=
pes: %s\n&quot;, str-&gt;str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free(str, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_print_types();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>anyway<br></div><div>Reviewed-by:=
 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">=
marcandre.lureau@redhat.com</a>&gt;</div><div> </div><br>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d0bc7d05b2543096--

