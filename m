Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EBB6E2AAC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 21:34:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnPAp-0004sA-Gp; Fri, 14 Apr 2023 15:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pnPAm-0004ry-Ny
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 15:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pnPAk-0003y9-GQ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 15:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681500804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XNuYD+MYn8mMyxuR8xFjpxuoTcohVjwL1mY0uQdpxhY=;
 b=Z6UI0bvjn1hsiX4+b3hXNgmiZsKOxA3l6fP5xOzZbbTeT4TSoAsznuUQ/ACpIBZVdFhS0r
 XwgZOhxgxhz2k9AhlGU30gPvWdWe4mkL51JpoCEzv0dIEHb+bWxSqh2BU848RgDVoute58
 ADH/5kwzQ1Qg95maEkFLmK9NfFsgd9Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-6F5RZGlqP1WJr6uU0DE3WQ-1; Fri, 14 Apr 2023 15:33:22 -0400
X-MC-Unique: 6F5RZGlqP1WJr6uU0DE3WQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94a34d3e5ebso234764866b.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 12:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681500799; x=1684092799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XNuYD+MYn8mMyxuR8xFjpxuoTcohVjwL1mY0uQdpxhY=;
 b=MdmtJJjpgJbNRpX/wJ89zZZSCA2SRW0XkYLUTAW5tsiyW1Od14w6XmhTIna6hYYeCZ
 2TvDlBzxAKi9nS08cek6JKANREQ+uunKcyCljYWKN4Sz9WwuBcOWJiJxeNghlmvww5z5
 HZctajA5KJjeBjHzGEpLb3ZfJeN0UG6VT3QmkGHlMvYEpaFgm5JmvTakbihwqZy7pbUd
 zlsEWcCUauCzAqjYWD33bgyoaXmmSTsjNJKl/Jzz58gQF1mefTl/EoJRFL2kFFN6Asb2
 DXL5Olpl5WUqlT1ZNxDU0h8j+cKibnRpp4B0DgoZHyuJiYygNL9+3Qiu+ex5//oaHLNm
 H8Ig==
X-Gm-Message-State: AAQBX9fDIrsPRtYMfGNB0ADIA6fou+vlIlPbUy+K3HUOmDZfOT8G0nmK
 qoIW6Gegw/1tl0iXRYXh04rd8JG9uzc7LI8bJJqpirzl09vfhwcQ0B8Ih1bk0AY+A1EwoOP4min
 f22tUGqVqdR7pLh33ZLpe6gKQCK7ZHt8=
X-Received: by 2002:a50:d783:0:b0:506:6ca5:3128 with SMTP id
 w3-20020a50d783000000b005066ca53128mr3649246edi.6.1681500799010; 
 Fri, 14 Apr 2023 12:33:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350bP+JqkoK1nxk+F1VLBA0TYSalmyMp6lJonkcveWgwHJnhchHvAY8entpieRp89VmHsVMczTGRMfihQ7/kSMnQ=
X-Received: by 2002:a50:d783:0:b0:506:6ca5:3128 with SMTP id
 w3-20020a50d783000000b005066ca53128mr3649235edi.6.1681500798716; Fri, 14 Apr
 2023 12:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230413150724.404304-1-peter.maydell@linaro.org>
 <20230413150724.404304-3-peter.maydell@linaro.org>
In-Reply-To: <20230413150724.404304-3-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 14 Apr 2023 23:33:07 +0400
Message-ID: <CAMxuvayx5brEjcJEr3FNZ+vcWxLXS9BqR5ywEJdD44wSJuziOg@mail.gmail.com>
Subject: Re: [PATCH 2/2] chardev: Allow setting file chardev input file on the
 command line
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000cc1e9b05f950e958"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000cc1e9b05f950e958
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 7:07=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> Our 'file' chardev backend supports both "output from this chardev
> is written to a file" and "input from this chardev should be read
> from a file" (except on Windows). However, you can only set up
> the input file if you're using the QMP interface -- there is no
> command line syntax to do it.
>
> Add command line syntax to allow specifying an input file
> as well as an output file, using a new 'input-path' suboption.
>
> The specific use case I have is that I'd like to be able to
> feed fuzzer reproducer input into qtest without having to use
> '-qtest stdio' and put the input onto stdin. Being able to
> use a file chardev like this:
>  -chardev file,id=3Drepro,path=3D/dev/null,input-path=3Drepro.txt -qtest
> chardev:repro
> means that stdio is free for use by gdb.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
> The "not on Windows" ifdeffery is because qmp_chardev_open_file()
> does something similar; it seems likely to produce a nicer
> error message to catch it at parse time rather than open time.
>

(I wonder if we could actually reduce the win32-specific code, I'll have a
look eventually)

---
>  chardev/char-file.c |  8 ++++++++
>  chardev/char.c      |  3 +++
>  qemu-options.hx     | 10 ++++++++--
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char-file.c b/chardev/char-file.c
> index 3a7b9caf6f0..263e6da5636 100644
> --- a/chardev/char-file.c
> +++ b/chardev/char-file.c
> @@ -100,6 +100,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts,
> ChardevBackend *backend,
>                                      Error **errp)
>  {
>      const char *path =3D qemu_opt_get(opts, "path");
> +    const char *inpath =3D qemu_opt_get(opts, "input-path");
>      ChardevFile *file;
>
>      backend->type =3D CHARDEV_BACKEND_KIND_FILE;
> @@ -107,9 +108,16 @@ static void qemu_chr_parse_file_out(QemuOpts *opts,
> ChardevBackend *backend,
>          error_setg(errp, "chardev: file: no filename given");
>          return;
>      }
> +#ifdef _WIN32
> +    if (inpath) {
> +        error_setg(errp, "chardev: file: input-path not supported on
> Windows");
> +        return;
> +    }
> +#endif
>      file =3D backend->u.file.data =3D g_new0(ChardevFile, 1);
>      qemu_chr_parse_common(opts, qapi_ChardevFile_base(file));
>      file->out =3D g_strdup(path);
> +    file->in =3D g_strdup(inpath);
>
>      file->has_append =3D true;
>      file->append =3D qemu_opt_get_bool(opts, "append", false);
> diff --git a/chardev/char.c b/chardev/char.c
> index e69390601fc..661ad8176a9 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -805,6 +805,9 @@ QemuOptsList qemu_chardev_opts =3D {
>          },{
>              .name =3D "path",
>              .type =3D QEMU_OPT_STRING,
> +        },{
> +            .name =3D "input-path",
> +            .type =3D QEMU_OPT_STRING,
>          },{
>              .name =3D "host",
>              .type =3D QEMU_OPT_STRING,
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c5..31d08c60264 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3360,7 +3360,7 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>      "-chardev
> vc,id=3Did[[,width=3Dwidth][,height=3Dheight]][[,cols=3Dcols][,rows=3Drow=
s]]\n"
>      "         [,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
>      "-chardev
> ringbuf,id=3Did[,size=3Dsize][,logfile=3DPATH][,logappend=3Don|off]\n"
> -    "-chardev
> file,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|=
off]\n"
> +    "-chardev
> file,id=3Did,path=3Dpath[,input-file=3Dinput-file][,mux=3Don|off][,logfil=
e=3DPATH][,logappend=3Don|off]\n"
>      "-chardev
> pipe,id=3Did,path=3Dpath[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|=
off]\n"
>  #ifdef _WIN32
>      "-chardev
> console,id=3Did[,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n"
> @@ -3563,13 +3563,19 @@ The available backends are:
>      Create a ring buffer with fixed size ``size``. size must be a power
>      of two and defaults to ``64K``.
>
> -``-chardev file,id=3Did,path=3Dpath``
> +``-chardev file,id=3Did,path=3Dpath[,input-path=3Dinput-path]``
>      Log all traffic received from the guest to a file.
>
>      ``path`` specifies the path of the file to be opened. This file will
>      be created if it does not already exist, and overwritten if it does.
>      ``path`` is required.
>
> +    If ``input-path`` is specified, this is the path of a second file
> +    which will be used for input. If ``input-path`` is not specified,
> +    no input will be available from the chardev.
> +
> +    Note that ``input-path`` is not supported on Windows hosts.
> +
>  ``-chardev pipe,id=3Did,path=3Dpath``
>      Create a two-way connection to the guest. The behaviour differs
>      slightly between Windows hosts and other hosts:
> --
> 2.34.1
>
>

--000000000000cc1e9b05f950e958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 13, 2023 at 7:07=E2=80=AF=
PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayd=
ell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Our &#39;file&#39; chardev backend supports both &quot;output=
 from this chardev<br>
is written to a file&quot; and &quot;input from this chardev should be read=
<br>
from a file&quot; (except on Windows). However, you can only set up<br>
the input file if you&#39;re using the QMP interface -- there is no<br>
command line syntax to do it.<br>
<br>
Add command line syntax to allow specifying an input file<br>
as well as an output file, using a new &#39;input-path&#39; suboption.<br>
<br>
The specific use case I have is that I&#39;d like to be able to<br>
feed fuzzer reproducer input into qtest without having to use<br>
&#39;-qtest stdio&#39; and put the input onto stdin. Being able to<br>
use a file chardev like this:<br>
=C2=A0-chardev file,id=3Drepro,path=3D/dev/null,input-path=3Drepro.txt -qte=
st chardev:repro<br>
means that stdio is free for use by gdb.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
The &quot;not on Windows&quot; ifdeffery is because qmp_chardev_open_file()=
<br>
does something similar; it seems likely to produce a nicer<br>
error message to catch it at parse time rather than open time.<br></blockqu=
ote><div><br></div><div>(I wonder if we could actually reduce the win32-spe=
cific code, I&#39;ll have a look eventually)</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-file.c |=C2=A0 8 ++++++++<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0| 10 ++++++++--<br>
=C2=A03 files changed, 19 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/char-file.c b/chardev/char-file.c<br>
index 3a7b9caf6f0..263e6da5636 100644<br>
--- a/chardev/char-file.c<br>
+++ b/chardev/char-file.c<br>
@@ -100,6 +100,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, Cha=
rdevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *path =3D qemu_opt_get(opts, &quot;path&quot=
;);<br>
+=C2=A0 =C2=A0 const char *inpath =3D qemu_opt_get(opts, &quot;input-path&q=
uot;);<br>
=C2=A0 =C2=A0 =C2=A0ChardevFile *file;<br>
<br>
=C2=A0 =C2=A0 =C2=A0backend-&gt;type =3D CHARDEV_BACKEND_KIND_FILE;<br>
@@ -107,9 +108,16 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, Ch=
ardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;chardev: file: no =
filename given&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 if (inpath) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;chardev: file: input-pa=
th not supported on Windows&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0file =3D backend-&gt;u.file.data =3D g_new0(ChardevFile=
, 1);<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_parse_common(opts, qapi_ChardevFile_base(file)=
);<br>
=C2=A0 =C2=A0 =C2=A0file-&gt;out =3D g_strdup(path);<br>
+=C2=A0 =C2=A0 file-&gt;in =3D g_strdup(inpath);<br>
<br>
=C2=A0 =C2=A0 =C2=A0file-&gt;has_append =3D true;<br>
=C2=A0 =C2=A0 =C2=A0file-&gt;append =3D qemu_opt_get_bool(opts, &quot;appen=
d&quot;, false);<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index e69390601fc..661ad8176a9 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -805,6 +805,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;path&quot;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_STRING,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;input-path&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_STRING,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;host&quot;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D QEMU_OPT_STRING,<=
br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 59bdf67a2c5..31d08c60264 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -3360,7 +3360,7 @@ DEF(&quot;chardev&quot;, HAS_ARG, QEMU_OPTION_chardev=
,<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev vc,id=3Did[[,width=3Dwidth][,height=3Dhe=
ight]][[,cols=3Dcols][,rows=3Drows]]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,mux=3Don|off]=
[,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev ringbuf,id=3Did[,size=3Dsize][,logfile=
=3DPATH][,logappend=3Don|off]\n&quot;<br>
-=C2=A0 =C2=A0 &quot;-chardev file,id=3Did,path=3Dpath[,mux=3Don|off][,logf=
ile=3DPATH][,logappend=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;-chardev file,id=3Did,path=3Dpath[,input-file=3Dinput-=
file][,mux=3Don|off][,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev pipe,id=3Did,path=3Dpath[,mux=3Don|off][=
,logfile=3DPATH][,logappend=3Don|off]\n&quot;<br>
=C2=A0#ifdef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0&quot;-chardev console,id=3Did[,mux=3Don|off][,logfile=
=3DPATH][,logappend=3Don|off]\n&quot;<br>
@@ -3563,13 +3563,19 @@ The available backends are:<br>
=C2=A0 =C2=A0 =C2=A0Create a ring buffer with fixed size ``size``. size mus=
t be a power<br>
=C2=A0 =C2=A0 =C2=A0of two and defaults to ``64K``.<br>
<br>
-``-chardev file,id=3Did,path=3Dpath``<br>
+``-chardev file,id=3Did,path=3Dpath[,input-path=3Dinput-path]``<br>
=C2=A0 =C2=A0 =C2=A0Log all traffic received from the guest to a file.<br>
<br>
=C2=A0 =C2=A0 =C2=A0``path`` specifies the path of the file to be opened. T=
his file will<br>
=C2=A0 =C2=A0 =C2=A0be created if it does not already exist, and overwritte=
n if it does.<br>
=C2=A0 =C2=A0 =C2=A0``path`` is required.<br>
<br>
+=C2=A0 =C2=A0 If ``input-path`` is specified, this is the path of a second=
 file<br>
+=C2=A0 =C2=A0 which will be used for input. If ``input-path`` is not speci=
fied,<br>
+=C2=A0 =C2=A0 no input will be available from the chardev.<br>
+<br>
+=C2=A0 =C2=A0 Note that ``input-path`` is not supported on Windows hosts.<=
br>
+<br>
=C2=A0``-chardev pipe,id=3Did,path=3Dpath``<br>
=C2=A0 =C2=A0 =C2=A0Create a two-way connection to the guest. The behaviour=
 differs<br>
=C2=A0 =C2=A0 =C2=A0slightly between Windows hosts and other hosts:<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000cc1e9b05f950e958--


