Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BBB502696
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 10:18:30 +0200 (CEST)
Received: from localhost ([::1]:36276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfH9x-0001SD-7u
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 04:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nfH5Z-0002gJ-5B
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 04:13:57 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nfH5W-0007Nw-RR
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 04:13:56 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q129so7823174oif.4
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMAC6tQ837akfqgFU2BLIubxC2HwTgU+Sk0IFVWng08=;
 b=JN19uqciBJhjyyrKGZcCnKaMwN2oBbbvNQzjyNRHMQ8qULG3GoLWTUlg9KM6JziiGt
 QyFDs0MCM9CceCRyKrVeeI5GX1J3lY229AfLi5I4WDh5mUtFb1CphjPkB8Ww89dQMZ6c
 jbcDFjW9aJVMMTcwLRFusiQ+B2J6SL6I7+zMcy5JPyP2jTocxXyEieD/G61ikbFr4at9
 65J+ztY5UMRVUW83RTcKsSSTr/eaFjJyIDg6zJy0/dfYWFu48bnp4YeqWvwLVCIQmSPs
 HLWOs5KrgdBFDMSSGUQ8ELt1lOB7I9w2VIdRDfUXOC/sXpJDdSKUE/fYLhNX+OCBru6g
 uDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMAC6tQ837akfqgFU2BLIubxC2HwTgU+Sk0IFVWng08=;
 b=htSnQdg7B9iKF9QWBluaJ/Ne1VwwXfADJeXDWVFAPIcohDOvG9AQIz93ucCGW6YjDq
 d++g674gMXbXs9XgckwflIXbs/C43ck63nPN99y3Dosakpz4UeRYQlfVos2YPzR124sF
 uc4D29anisI2jEnSxWeHAdb8vT5h/viiZvm5QbjLIuGpJAdUSUFSkmUINOBC47OwsGu4
 elPaQmiYLbLWLZslIjUCRaLTvi5MjaFKueb6usjBTWeQd8ynphFcwUQ3LwH59QP4gDjt
 rZBuzZ+uXp2PVoNdq1p0e/KOX17Bk4FSFz34rQYYJ4YywNvX69rpFsKctFeOwv9Dkx07
 IfNg==
X-Gm-Message-State: AOAM533S7hFJAnz/MyDrTvULQE8q9yrrTINTCOm0tjxuZKUfIft2nfbQ
 B31V5vrJLqWlfx6cO3FRVL8+JLMH2W59Xg8dcyg=
X-Google-Smtp-Source: ABdhPJympcUAFWqorOPTtVCWuUVYPN/V8eR3FlrXSBSe8DLNmI9heNJ6t6D3Jyv6OB8J2OKtiu8SY60ZtWq5/RvyMgw=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr1084765oih.228.1650010432836; Fri, 15
 Apr 2022 01:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220413220007.14467-1-adeason@sinenomine.net>
 <20220413220007.14467-6-adeason@sinenomine.net>
In-Reply-To: <20220413220007.14467-6-adeason@sinenomine.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Apr 2022 12:13:40 +0400
Message-ID: <CAJ+F1CLzvOC0-q=UR3KkeMkffzZ87m_02x0UZ_emvBi8wo1Usw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] qga/commands-posix: 'guest-shutdown' for Solaris
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: multipart/alternative; boundary="000000000000b99a0b05dcacfdbe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-oi1-x22c.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b99a0b05dcacfdbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 2:04 AM Andrew Deason <adeason@sinenomine.net>
wrote:

> On Solaris, instead of the -P, -H, and -r flags, we need to provide
> the target init state to the 'shutdown' command: state 5 is poweroff,
> 0 is halt, and 6 is reboot. We also need to pass -g0 to avoid the
> default 60-second delay, and -y to avoid a confirmation prompt.
>
> Implement this logic under an #ifdef CONFIG_SOLARIS, so the
> 'guest-shutdown' command works properly on Solaris.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> Changes since v1:
> - new in v2
>
>  qga/commands-posix.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 97e001e998..8c30a9e575 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -88,43 +88,58 @@ static void ga_wait_child(pid_t pid, int *status,
> Error **errp)
>      g_assert(rpid =3D=3D pid);
>  }
>
>  void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
>  {
>      const char *shutdown_flag;
>      Error *local_err =3D NULL;
>      pid_t pid;
>      int status;
>
> +#ifdef CONFIG_SOLARIS
> +    const char *powerdown_flag =3D "-i5";
> +    const char *halt_flag =3D "-i0";
> +    const char *reboot_flag =3D "-i6";
> +#else
> +    const char *powerdown_flag =3D "-P";
> +    const char *halt_flag =3D "-H";
> +    const char *reboot_flag =3D "-r";
> +#endif
> +
>      slog("guest-shutdown called, mode: %s", mode);
>      if (!has_mode || strcmp(mode, "powerdown") =3D=3D 0) {
> -        shutdown_flag =3D "-P";
> +        shutdown_flag =3D powerdown_flag;
>      } else if (strcmp(mode, "halt") =3D=3D 0) {
> -        shutdown_flag =3D "-H";
> +        shutdown_flag =3D halt_flag;
>      } else if (strcmp(mode, "reboot") =3D=3D 0) {
> -        shutdown_flag =3D "-r";
> +        shutdown_flag =3D reboot_flag;
>      } else {
>          error_setg(errp,
>                     "mode is invalid (valid values are:
> halt|powerdown|reboot");
>          return;
>      }
>
>      pid =3D fork();
>      if (pid =3D=3D 0) {
>          /* child, start the shutdown */
>          setsid();
>          reopen_fd_to_null(0);
>          reopen_fd_to_null(1);
>          reopen_fd_to_null(2);
>
> +#ifdef CONFIG_SOLARIS
> +        execle("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
> +               "hypervisor initiated shutdown", (char *)NULL, environ);
> +#else
>          execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>                 "hypervisor initiated shutdown", (char *)NULL, environ);
> +#endif
>          _exit(EXIT_FAILURE);
>      } else if (pid < 0) {
>          error_setg_errno(errp, errno, "failed to create child process");
>          return;
>      }
>
>      ga_wait_child(pid, &status, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> --
> 2.11.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b99a0b05dcacfdbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 14, 2022 at 2:04 AM Andre=
w Deason &lt;<a href=3D"mailto:adeason@sinenomine.net">adeason@sinenomine.n=
et</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Solaris, instead of the -P, -H, and -r flags, we need to provide<br>
the target init state to the &#39;shutdown&#39; command: state 5 is powerof=
f,<br>
0 is halt, and 6 is reboot. We also need to pass -g0 to avoid the<br>
default 60-second delay, and -y to avoid a confirmation prompt.<br>
<br>
Implement this logic under an #ifdef CONFIG_SOLARIS, so the<br>
&#39;guest-shutdown&#39; command works properly on Solaris.<br>
<br>
Signed-off-by: Andrew Deason &lt;<a href=3D"mailto:adeason@sinenomine.net" =
target=3D"_blank">adeason@sinenomine.net</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes since v1:<br>
- new in v2<br>
<br>
=C2=A0qga/commands-posix.c | 21 ++++++++++++++++++---<br>
=C2=A01 file changed, 18 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 97e001e998..8c30a9e575 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -88,43 +88,58 @@ static void ga_wait_child(pid_t pid, int *status, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(rpid =3D=3D pid);<br>
=C2=A0}<br>
<br>
=C2=A0void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *shutdown_flag;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0pid_t pid;<br>
=C2=A0 =C2=A0 =C2=A0int status;<br>
<br>
+#ifdef CONFIG_SOLARIS<br>
+=C2=A0 =C2=A0 const char *powerdown_flag =3D &quot;-i5&quot;;<br>
+=C2=A0 =C2=A0 const char *halt_flag =3D &quot;-i0&quot;;<br>
+=C2=A0 =C2=A0 const char *reboot_flag =3D &quot;-i6&quot;;<br>
+#else<br>
+=C2=A0 =C2=A0 const char *powerdown_flag =3D &quot;-P&quot;;<br>
+=C2=A0 =C2=A0 const char *halt_flag =3D &quot;-H&quot;;<br>
+=C2=A0 =C2=A0 const char *reboot_flag =3D &quot;-r&quot;;<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0slog(&quot;guest-shutdown called, mode: %s&quot;, mode)=
;<br>
=C2=A0 =C2=A0 =C2=A0if (!has_mode || strcmp(mode, &quot;powerdown&quot;) =
=3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutdown_flag =3D &quot;-P&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutdown_flag =3D powerdown_flag;<br>
=C2=A0 =C2=A0 =C2=A0} else if (strcmp(mode, &quot;halt&quot;) =3D=3D 0) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutdown_flag =3D &quot;-H&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutdown_flag =3D halt_flag;<br>
=C2=A0 =C2=A0 =C2=A0} else if (strcmp(mode, &quot;reboot&quot;) =3D=3D 0) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutdown_flag =3D &quot;-r&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutdown_flag =3D reboot_flag;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;mode is invalid (valid values are: halt|powerdown|reboot&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0pid =3D fork();<br>
=C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* child, start the shutdown */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setsid();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(2);<br>
<br>
+#ifdef CONFIG_SOLARIS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execle(&quot;/sbin/shutdown&quot;, &quot;shutd=
own&quot;, shutdown_flag, &quot;-g0&quot;, &quot;-y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL, environ);<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execle(&quot;/sbin/shutdown&quot;, &quot;=
shutdown&quot;, &quot;-h&quot;, shutdown_flag, &quot;+0&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hypervisor in=
itiated shutdown&quot;, (char *)NULL, environ);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(EXIT_FAILURE);<br>
=C2=A0 =C2=A0 =C2=A0} else if (pid &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;faile=
d to create child process&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ga_wait_child(pid, &amp;status, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.11.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b99a0b05dcacfdbe--

