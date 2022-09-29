Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575285EF503
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:13:49 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsQF-00078q-JR
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrcR-0001UW-V4
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:22:21 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:33321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrcP-0005c1-5f
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:22:19 -0400
Received: by mail-lf1-x130.google.com with SMTP id d42so1806006lfv.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Kc4jhii7hxP7fomxCQnwlfCZCFrKd0a92VaZQovGPeA=;
 b=arTJHmS9AxC8/PtJegYrMCZ3Bl8TAvpEss0ytt3s3ovN8cCO5U71N2N2fICpF9Rx3s
 Rz8c7tDOaMy70mffLywoyPzJw8MlzZfARGyjtCv95xSDSWfUUP9yW2e04AaZzyg21L51
 /e7JDORuQREOcDPi5vVEsFoFthyjFULWI0+jCyqABhzZwsXWejtJvnk+lds3SJQXZ/8m
 sJg1hgTDt+uZWGtmhUv1+uhrJiyrMTE9og/E0722k7fdxtia6lG7F+r+ceLGweDWzdw9
 LBoVtGU0XvUKX3q6zzgmakycKGTjE4PIPaG1wh0Z7BcOe4cpG1AfVEQIaGqs3rzgwKyI
 9ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Kc4jhii7hxP7fomxCQnwlfCZCFrKd0a92VaZQovGPeA=;
 b=x8zh9PuQBe3simZ94bUPAJfikcCkAKA0oWQvbT+ZYmkZaIZ/JghnqqTsbXPk2YMFCU
 zPDtAszyNZf3pbGZ8H7wMgXh7747NyhwEHfmSGt5hhJ4nQw0DbG384G3uewQ3JvxPU1E
 9VKvDR5LiI5mxZS0Tq+yUhiMMmL0kzggmd5uUlpQJLLJJfAm/f7fo4r3IEmA6yICZX45
 IKwUwXkvpvntsI7ryKje1OnUrglcOBbJC31YGOZf8dCsjWckQ5gF0B/wwCp5R31DResA
 D+52tYH22698HKGn7tuUM4QhIqs5Mx/bUvO3ZK+ti7o9RlFeuGCvZY2CI4WgAw/LVsoZ
 hjSw==
X-Gm-Message-State: ACrzQf2yKQME+g+pokUbNS79pw+uDdooaEn+ncJ69T4e01kzlGdzWTCX
 XK57RqQ4UDmhr44O/oJOlwrOZKGoZi82eHVxGoY=
X-Google-Smtp-Source: AMsMyM7zOoUpGC0eXDXSofitnk2Rsawt/zN9sTJOQETOTgiAkd8L55/No6b+RsODI4SGqxCkb3sMluR80IkGgOGvfrY=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr1223740lff.329.1664450535011; Thu, 29
 Sep 2022 04:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-6-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220929075239.1675374-6-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 15:22:02 +0400
Message-ID: <CAJ+F1CLY+ppqzddPJVPGqpST1Jk4zQMpQeC_Davmq2qiOnPoKA@mail.gmail.com>
Subject: Re: [PATCH 5/7] qga: Add support for user password setting in FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000e2bbb905e9cf16dc"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

--000000000000e2bbb905e9cf16dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander

On Thu, Sep 29, 2022 at 12:52 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Move qmp_guest_set_user_password() from __linux__ condition to
> (__linux__ || __FreeBSD__) condition. Add command and arguments
> for password setting in FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>

Could you explain why you need to move the code?

You could instead have a top declaration?

If it's really required, please split the patch in move + additions.


> ---
>  qga/commands-posix.c | 223 +++++++++++++++++++++++--------------------
>  1 file changed, 118 insertions(+), 105 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 88e0d0fe24..6ce894ca6e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2123,111 +2123,6 @@ int64_t
> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>      return processed;
>  }
>
> -void qmp_guest_set_user_password(const char *username,
> -                                 const char *password,
> -                                 bool crypted,
> -                                 Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    char *passwd_path =3D NULL;
> -    pid_t pid;
> -    int status;
> -    int datafd[2] =3D { -1, -1 };
> -    char *rawpasswddata =3D NULL;
> -    size_t rawpasswdlen;
> -    char *chpasswddata =3D NULL;
> -    size_t chpasswdlen;
> -
> -    rawpasswddata =3D (char *)qbase64_decode(password, -1, &rawpasswdlen=
,
> errp);
> -    if (!rawpasswddata) {
> -        return;
> -    }
> -    rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen + 1);
> -    rawpasswddata[rawpasswdlen] =3D '\0';
> -
> -    if (strchr(rawpasswddata, '\n')) {
> -        error_setg(errp, "forbidden characters in raw password");
> -        goto out;
> -    }
> -
> -    if (strchr(username, '\n') ||
> -        strchr(username, ':')) {
> -        error_setg(errp, "forbidden characters in username");
> -        goto out;
> -    }
> -
> -    chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata)=
;
> -    chpasswdlen =3D strlen(chpasswddata);
> -
> -    passwd_path =3D g_find_program_in_path("chpasswd");
> -
> -    if (!passwd_path) {
> -        error_setg(errp, "cannot find 'passwd' program in PATH");
> -        goto out;
> -    }
> -
> -    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
> -        error_setg(errp, "cannot create pipe FDs");
> -        goto out;
> -    }
> -
> -    pid =3D fork();
> -    if (pid =3D=3D 0) {
> -        close(datafd[1]);
> -        /* child */
> -        setsid();
> -        dup2(datafd[0], 0);
> -        reopen_fd_to_null(1);
> -        reopen_fd_to_null(2);
> -
> -        if (crypted) {
> -            execl(passwd_path, "chpasswd", "-e", NULL);
> -        } else {
> -            execl(passwd_path, "chpasswd", NULL);
> -        }
> -        _exit(EXIT_FAILURE);
> -    } else if (pid < 0) {
> -        error_setg_errno(errp, errno, "failed to create child process");
> -        goto out;
> -    }
> -    close(datafd[0]);
> -    datafd[0] =3D -1;
> -
> -    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=3D
> chpasswdlen) {
> -        error_setg_errno(errp, errno, "cannot write new account
> password");
> -        goto out;
> -    }
> -    close(datafd[1]);
> -    datafd[1] =3D -1;
> -
> -    ga_wait_child(pid, &status, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        goto out;
> -    }
> -
> -    if (!WIFEXITED(status)) {
> -        error_setg(errp, "child process has terminated abnormally");
> -        goto out;
> -    }
> -
> -    if (WEXITSTATUS(status)) {
> -        error_setg(errp, "child process has failed to set user password"=
);
> -        goto out;
> -    }
> -
> -out:
> -    g_free(chpasswddata);
> -    g_free(rawpasswddata);
> -    g_free(passwd_path);
> -    if (datafd[0] !=3D -1) {
> -        close(datafd[0]);
> -    }
> -    if (datafd[1] !=3D -1) {
> -        close(datafd[1]);
> -    }
> -}
> -
>  static void ga_read_sysfs_file(int dirfd, const char *pathname, char *bu=
f,
>                                 int size, Error **errp)
>  {
> @@ -2793,6 +2688,124 @@ GuestMemoryBlockInfo
> *qmp_guest_get_memory_block_info(Error **errp)
>
>  #endif
>
> +#if defined(__linux__) || defined(__FreeBSD__)
> +void qmp_guest_set_user_password(const char *username,
> +                                 const char *password,
> +                                 bool crypted,
> +                                 Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    char *passwd_path =3D NULL;
> +    pid_t pid;
> +    int status;
> +    int datafd[2] =3D { -1, -1 };
> +    char *rawpasswddata =3D NULL;
> +    size_t rawpasswdlen;
> +    char *chpasswddata =3D NULL;
> +    size_t chpasswdlen;
> +
> +    rawpasswddata =3D (char *)qbase64_decode(password, -1, &rawpasswdlen=
,
> errp);
> +    if (!rawpasswddata) {
> +        return;
> +    }
> +    rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen + 1);
> +    rawpasswddata[rawpasswdlen] =3D '\0';
> +
> +    if (strchr(rawpasswddata, '\n')) {
> +        error_setg(errp, "forbidden characters in raw password");
> +        goto out;
> +    }
> +
> +    if (strchr(username, '\n') ||
> +        strchr(username, ':')) {
> +        error_setg(errp, "forbidden characters in username");
> +        goto out;
> +    }
> +
> +#ifdef __FreeBSD__
> +    chpasswddata =3D g_strdup(rawpasswddata);
> +    passwd_path =3D g_find_program_in_path("pw");
> +#else
> +    chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata)=
;
> +    passwd_path =3D g_find_program_in_path("chpasswd");
> +#endif
> +
> +    chpasswdlen =3D strlen(chpasswddata);
> +
> +    if (!passwd_path) {
> +        error_setg(errp, "cannot find 'passwd' program in PATH");
> +        goto out;
> +    }
> +
> +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
> +        error_setg(errp, "cannot create pipe FDs");
> +        goto out;
> +    }
> +
> +    pid =3D fork();
> +    if (pid =3D=3D 0) {
> +        close(datafd[1]);
> +        /* child */
> +        setsid();
> +        dup2(datafd[0], 0);
> +        reopen_fd_to_null(1);
> +        reopen_fd_to_null(2);
> +
> +#ifdef __FreeBSD__
> +        const char *h_arg;
> +        h_arg =3D (crypted) ? "-H" : "-h";
> +        execl(passwd_path, "pw", "usermod", "-n", username, h_arg, "0",
> NULL);
> +#else
> +        if (crypted) {
> +            execl(passwd_path, "chpasswd", "-e", NULL);
> +        } else {
> +            execl(passwd_path, "chpasswd", NULL);
> +        }
> +#endif
> +        _exit(EXIT_FAILURE);
> +    } else if (pid < 0) {
> +        error_setg_errno(errp, errno, "failed to create child process");
> +        goto out;
> +    }
> +    close(datafd[0]);
> +    datafd[0] =3D -1;
> +
> +    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=3D
> chpasswdlen) {
> +        error_setg_errno(errp, errno, "cannot write new account
> password");
> +        goto out;
> +    }
> +    close(datafd[1]);
> +    datafd[1] =3D -1;
> +
> +    ga_wait_child(pid, &status, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        goto out;
> +    }
> +
> +    if (!WIFEXITED(status)) {
> +        error_setg(errp, "child process has terminated abnormally");
> +        goto out;
> +    }
> +
> +    if (WEXITSTATUS(status)) {
> +        error_setg(errp, "child process has failed to set user password"=
);
> +        goto out;
> +    }
> +
> +out:
> +    g_free(chpasswddata);
> +    g_free(rawpasswddata);
> +    g_free(passwd_path);
> +    if (datafd[0] !=3D -1) {
> +        close(datafd[0]);
> +    }
> +    if (datafd[1] !=3D -1) {
> +        close(datafd[1]);
> +    }
> +}
> +#endif
> +
>  #ifdef HAVE_GETIFADDRS
>  static GuestNetworkInterface *
>  guest_find_interface(GuestNetworkInterfaceList *head,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e2bbb905e9cf16dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alexander<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 1=
2:52 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.c=
om">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Move qmp_guest_set_user_password() from _=
_linux__ condition to<br>
(__linux__ || __FreeBSD__) condition. Add command and arguments<br>
for password setting in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Could you explain why you need to move the cod=
e?</div><div><br></div><div>You could instead have a top declaration?</div>=
<div><br></div><div>If it&#39;s really required, please split the patch in =
move + additions.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 223 +++++++++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 118 insertions(+), 105 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 88e0d0fe24..6ce894ca6e 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2123,111 +2123,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorLi=
st *vcpus, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return processed;<br>
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
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 char *passwd_path =3D NULL;<br>
-=C2=A0 =C2=A0 pid_t pid;<br>
-=C2=A0 =C2=A0 int status;<br>
-=C2=A0 =C2=A0 int datafd[2] =3D { -1, -1 };<br>
-=C2=A0 =C2=A0 char *rawpasswddata =3D NULL;<br>
-=C2=A0 =C2=A0 size_t rawpasswdlen;<br>
-=C2=A0 =C2=A0 char *chpasswddata =3D NULL;<br>
-=C2=A0 =C2=A0 size_t chpasswdlen;<br>
-<br>
-=C2=A0 =C2=A0 rawpasswddata =3D (char *)qbase64_decode(password, -1, &amp;=
rawpasswdlen, errp);<br>
-=C2=A0 =C2=A0 if (!rawpasswddata) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen =
+ 1);<br>
-=C2=A0 =C2=A0 rawpasswddata[rawpasswdlen] =3D &#39;\0&#39;;<br>
-<br>
-=C2=A0 =C2=A0 if (strchr(rawpasswddata, &#39;\n&#39;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;forbidden characters in=
 raw password&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (strchr(username, &#39;\n&#39;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 strchr(username, &#39;:&#39;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;forbidden characters in=
 username&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 chpasswddata =3D g_strdup_printf(&quot;%s:%s\n&quot;, userna=
me, rawpasswddata);<br>
-=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
-<br>
-=C2=A0 =C2=A0 passwd_path =3D g_find_program_in_path(&quot;chpasswd&quot;)=
;<br>
-<br>
-=C2=A0 =C2=A0 if (!passwd_path) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cannot find &#39;passwd=
&#39; program in PATH&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cannot create pipe FDs&=
quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 pid =3D fork();<br>
-=C2=A0 =C2=A0 if (pid =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[1]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* child */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setsid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup2(datafd[0], 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crypted) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;chpassw=
d&quot;, &quot;-e&quot;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;chpassw=
d&quot;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
-=C2=A0 =C2=A0 } else if (pid &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
create child process&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 close(datafd[0]);<br>
-=C2=A0 =C2=A0 datafd[0] =3D -1;<br>
-<br>
-=C2=A0 =C2=A0 if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=
=3D chpasswdlen) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;cannot wri=
te new account password&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 close(datafd[1]);<br>
-=C2=A0 =C2=A0 datafd[1] =3D -1;<br>
-<br>
-=C2=A0 =C2=A0 ga_wait_child(pid, &amp;status, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!WIFEXITED(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;child process has termi=
nated abnormally&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (WEXITSTATUS(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;child process has faile=
d to set user password&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-out:<br>
-=C2=A0 =C2=A0 g_free(chpasswddata);<br>
-=C2=A0 =C2=A0 g_free(rawpasswddata);<br>
-=C2=A0 =C2=A0 g_free(passwd_path);<br>
-=C2=A0 =C2=A0 if (datafd[0] !=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[0]);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (datafd[1] !=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[1]);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
=C2=A0static void ga_read_sysfs_file(int dirfd, const char *pathname, char =
*buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int size, Error **errp)<br>
=C2=A0{<br>
@@ -2793,6 +2688,124 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_in=
fo(Error **errp)<br>
<br>
=C2=A0#endif<br>
<br>
+#if defined(__linux__) || defined(__FreeBSD__)<br>
+void qmp_guest_set_user_password(const char *username,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 char *passwd_path =3D NULL;<br>
+=C2=A0 =C2=A0 pid_t pid;<br>
+=C2=A0 =C2=A0 int status;<br>
+=C2=A0 =C2=A0 int datafd[2] =3D { -1, -1 };<br>
+=C2=A0 =C2=A0 char *rawpasswddata =3D NULL;<br>
+=C2=A0 =C2=A0 size_t rawpasswdlen;<br>
+=C2=A0 =C2=A0 char *chpasswddata =3D NULL;<br>
+=C2=A0 =C2=A0 size_t chpasswdlen;<br>
+<br>
+=C2=A0 =C2=A0 rawpasswddata =3D (char *)qbase64_decode(password, -1, &amp;=
rawpasswdlen, errp);<br>
+=C2=A0 =C2=A0 if (!rawpasswddata) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen =
+ 1);<br>
+=C2=A0 =C2=A0 rawpasswddata[rawpasswdlen] =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 if (strchr(rawpasswddata, &#39;\n&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;forbidden characters in=
 raw password&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (strchr(username, &#39;\n&#39;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 strchr(username, &#39;:&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;forbidden characters in=
 username&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 chpasswddata =3D g_strdup(rawpasswddata);<br>
+=C2=A0 =C2=A0 passwd_path =3D g_find_program_in_path(&quot;pw&quot;);<br>
+#else<br>
+=C2=A0 =C2=A0 chpasswddata =3D g_strdup_printf(&quot;%s:%s\n&quot;, userna=
me, rawpasswddata);<br>
+=C2=A0 =C2=A0 passwd_path =3D g_find_program_in_path(&quot;chpasswd&quot;)=
;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
+<br>
+=C2=A0 =C2=A0 if (!passwd_path) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cannot find &#39;passwd=
&#39; program in PATH&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cannot create pipe FDs&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pid =3D fork();<br>
+=C2=A0 =C2=A0 if (pid =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* child */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setsid();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dup2(datafd[0], 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(2);<br>
+<br>
+#ifdef __FreeBSD__<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *h_arg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h_arg =3D (crypted) ? &quot;-H&quot; : &quot;-=
h&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;pw&quot;, &quot;userm=
od&quot;, &quot;-n&quot;, username, h_arg, &quot;0&quot;, NULL);<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crypted) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;chpassw=
d&quot;, &quot;-e&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;chpassw=
d&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 } else if (pid &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
create child process&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 close(datafd[0]);<br>
+=C2=A0 =C2=A0 datafd[0] =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=
=3D chpasswdlen) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;cannot wri=
te new account password&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 close(datafd[1]);<br>
+=C2=A0 =C2=A0 datafd[1] =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 ga_wait_child(pid, &amp;status, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!WIFEXITED(status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;child process has termi=
nated abnormally&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (WEXITSTATUS(status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;child process has faile=
d to set user password&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+out:<br>
+=C2=A0 =C2=A0 g_free(chpasswddata);<br>
+=C2=A0 =C2=A0 g_free(rawpasswddata);<br>
+=C2=A0 =C2=A0 g_free(passwd_path);<br>
+=C2=A0 =C2=A0 if (datafd[0] !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[0]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (datafd[1] !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[1]);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+#endif<br>
+<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0static GuestNetworkInterface *<br>
=C2=A0guest_find_interface(GuestNetworkInterfaceList *head,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e2bbb905e9cf16dc--

