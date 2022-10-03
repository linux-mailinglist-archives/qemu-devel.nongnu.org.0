Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9752D5F2E91
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:00:11 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIF8-0006Kq-6B
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ofI9r-0001gy-Hn
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:54:45 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ofI9p-0004TR-J0
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:54:43 -0400
Received: by mail-lj1-x230.google.com with SMTP id l14so1076019lja.8
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Vfp0FKFfazVATEhyQMilrtoTtm6xCrO07rqWw3qTxj0=;
 b=aXf41nXYBU+e50ar2frn3Xmco8jirXtpzeJWQlThpXEV09E14kEogKbvGIXi1hogtm
 AHbwjcwWAPxVNoe27cGbmFG9weXseb3HGT5Gpf6iAWaUOtck6xnj7UPIMyi8TPLm0paE
 pgelk4qtU14wum37ALA8mEC7MwjuLTd/5fODV3avNKVgbjBuyWuaQCt65/DhJh/hOxNl
 t7ZgCMVMz4hmp4/y7inYzqI4jTE5BFpJyuW2lAWRiV+kDDit1ZymIShx4nn9i+oYjhLg
 S6Z8WU/YAnWio1MTHAr25ZNKWhOuqdQoTSHidh3T5murSuUzOOopEs61KBXbdIO2WUKD
 lPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Vfp0FKFfazVATEhyQMilrtoTtm6xCrO07rqWw3qTxj0=;
 b=Z5HUCLQhoydS1pC7b0aEpiKlk/V17TPTBmEh074Od9Dpe0vl19t/WcjPR+ohTfzuJx
 1MTXVL3Kl5CIHKll5UW46zPB2g58pZ2lu9HiBu4bGso6INPw5DUdRDjtVP8oZQRF3Jju
 2DFS2m7u1YqVTlJeYJI6wl8CtnSzCQ8mk4EoIyKu5chRqVIQ+UMXn76J21qaeXnlJI2a
 tsFaSxo9gOjrBDC3b41ZXMwdQzVqI1rnPeNhcLR2QImHu7wWP1wc49fQbS9ojjHtNAMg
 Mh9Jj8dYc4Bt462XYuwCcuj7WVJJKG5pyjCZliU/g+0SlBOk7EaavmuYwc9r4JaqCvL6
 1wrA==
X-Gm-Message-State: ACrzQf2cEYgQPGkdRpZqZY/KxH/wc+axVC2oynhE7IUdvi/QMdrxhhj+
 sZqNWwezvjOV4tccC4pDFu2/N+Enz9he6cIj/tw=
X-Google-Smtp-Source: AMsMyM6emAFsdhTsdBqaBu/eH56NybCXeVl34cbbsmTJedSzd6/xuJYARJCfPvRyb8w1givH/MOv3kMKzzXCDHjWbYg=
X-Received: by 2002:a2e:a58a:0:b0:26c:6dce:ce4e with SMTP id
 m10-20020a2ea58a000000b0026c6dcece4emr6452088ljp.452.1664790879640; Mon, 03
 Oct 2022 02:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
 <20221003093911.1844031-6-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221003093911.1844031-6-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 3 Oct 2022 13:54:27 +0400
Message-ID: <CAJ+F1CJuZB04HhCXWZ_Mzb5NXyGnQpzZ+zOrRnNuruPSa3B_7A@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] qga: Add support for user password setting in
 FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="00000000000001a18e05ea1e5577"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

--00000000000001a18e05ea1e5577
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2022 at 1:39 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Move qmp_guest_set_user_password() from __linux__ condition to
> (__linux__ || __FreeBSD__) condition. Add command and arguments
> for password setting in FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-posix.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 88e0d0fe24..f5b9e5c530 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2122,7 +2122,9 @@ int64_t
> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>
>      return processed;
>  }
> +#endif /* __linux__ */
>
> +#if defined(__linux__) || defined(__FreeBSD__)
>  void qmp_guest_set_user_password(const char *username,
>                                   const char *password,
>                                   bool crypted,
> @@ -2156,10 +2158,15 @@ void qmp_guest_set_user_password(const char
> *username,
>          goto out;
>      }
>
> +#ifdef __FreeBSD__
> +    chpasswddata =3D g_strdup(rawpasswddata);
> +    passwd_path =3D g_find_program_in_path("pw");
> +#else
>      chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata)=
;
> -    chpasswdlen =3D strlen(chpasswddata);
> -
>      passwd_path =3D g_find_program_in_path("chpasswd");
> +#endif
> +
> +    chpasswdlen =3D strlen(chpasswddata);
>
>      if (!passwd_path) {
>          error_setg(errp, "cannot find 'passwd' program in PATH");
> @@ -2180,11 +2187,17 @@ void qmp_guest_set_user_password(const char
> *username,
>          reopen_fd_to_null(1);
>          reopen_fd_to_null(2);
>
> +#ifdef __FreeBSD__
> +        const char *h_arg;
> +        h_arg =3D (crypted) ? "-H" : "-h";
> +        execl(passwd_path, "pw", "usermod", "-n", username, h_arg, "0",
> NULL);
> +#else
>          if (crypted) {
>              execl(passwd_path, "chpasswd", "-e", NULL);
>          } else {
>              execl(passwd_path, "chpasswd", NULL);
>          }
> +#endif
>          _exit(EXIT_FAILURE);
>      } else if (pid < 0) {
>          error_setg_errno(errp, errno, "failed to create child process");
> @@ -2227,7 +2240,17 @@ out:
>          close(datafd[1]);
>      }
>  }
> +#else /* __linux__ || __FreeBSD__ */
> +void qmp_guest_set_user_password(const char *username,
> +                                 const char *password,
> +                                 bool crypted,
> +                                 Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +}
> +#endif /* __linux__ || __FreeBSD__ */
>
> +#ifdef __linux__
>  static void ga_read_sysfs_file(int dirfd, const char *pathname, char *bu=
f,
>                                 int size, Error **errp)
>  {
> @@ -2764,14 +2787,6 @@ int64_t
> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>      return -1;
>  }
>
> -void qmp_guest_set_user_password(const char *username,
> -                                 const char *password,
> -                                 bool crypted,
> -                                 Error **errp)
> -{
> -    error_setg(errp, QERR_UNSUPPORTED);
> -}
> -
>  GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>  {
>      error_setg(errp, QERR_UNSUPPORTED);
> --
> 2.34.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000001a18e05ea1e5577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3, 2022 at 1:39 PM Alexan=
der Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexander.=
ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Move qmp_guest_set_user_password() from __linux__ condi=
tion to<br>
(__linux__ || __FreeBSD__) condition. Add command and arguments<br>
for password setting in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt=
;<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 35 +++++++++++++++++++++++++----------<br>
=C2=A01 file changed, 25 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 88e0d0fe24..f5b9e5c530 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2122,7 +2122,9 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList=
 *vcpus, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return processed;<br>
=C2=A0}<br>
+#endif /* __linux__ */<br>
<br>
+#if defined(__linux__) || defined(__FreeBSD__)<br>
=C2=A0void qmp_guest_set_user_password(const char *username,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *password,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool crypted,<br>
@@ -2156,10 +2158,15 @@ void qmp_guest_set_user_password(const char *userna=
me,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 chpasswddata =3D g_strdup(rawpasswddata);<br>
+=C2=A0 =C2=A0 passwd_path =3D g_find_program_in_path(&quot;pw&quot;);<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0chpasswddata =3D g_strdup_printf(&quot;%s:%s\n&quot;, u=
sername, rawpasswddata);<br>
-=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0passwd_path =3D g_find_program_in_path(&quot;chpasswd&q=
uot;);<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!passwd_path) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;cannot find &#39;p=
asswd&#39; program in PATH&quot;);<br>
@@ -2180,11 +2187,17 @@ void qmp_guest_set_user_password(const char *userna=
me,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reopen_fd_to_null(2);<br>
<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *h_arg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h_arg =3D (crypted) ? &quot;-H&quot; : &quot;-=
h&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;pw&quot;, &quot;userm=
od&quot;, &quot;-n&quot;, username, h_arg, &quot;0&quot;, NULL);<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crypted) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(passwd_path, &quot;ch=
passwd&quot;, &quot;-e&quot;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl(passwd_path, &quot;ch=
passwd&quot;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(EXIT_FAILURE);<br>
=C2=A0 =C2=A0 =C2=A0} else if (pid &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;faile=
d to create child process&quot;);<br>
@@ -2227,7 +2240,17 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(datafd[1]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
+#else /* __linux__ || __FreeBSD__ */<br>
+void qmp_guest_set_user_password(const char *username,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+}<br>
+#endif /* __linux__ || __FreeBSD__ */<br>
<br>
+#ifdef __linux__<br>
=C2=A0static void ga_read_sysfs_file(int dirfd, const char *pathname, char =
*buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int size, Error **errp)<br>
=C2=A0{<br>
@@ -2764,14 +2787,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorLis=
t *vcpus, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-void qmp_guest_set_user_password(const char *username,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-}<br>
-<br>
=C2=A0GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_UNSUPPORTED);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000001a18e05ea1e5577--

