Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836015E7C34
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:47:42 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obj1p-0007KR-Dw
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obixj-0002r4-Kw
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:43:27 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obixg-0001Wv-Pk
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:43:27 -0400
Received: by mail-lj1-x236.google.com with SMTP id b6so76133ljr.10
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4K+76fXWu64AC8MAx0GfkRxyTJTP8Yxv1hTUm0IQ7NQ=;
 b=LXRRfMAoJH3jXvnb3OCKsDagrLggFNKMaInAzX4V5IJP+OOEP6AO9pSNy49o29p2uU
 3SOoCSeYoh+kAc+YXovCzbPJ4PMkEcZMNNioQg9KY/rLtSw7+mHBySak/K6z/bKvzV+A
 zbck7nqTFGC0s15q3T+HVkDdgoqB1TipeBvGgiCdWTte6ursb30ilvIZh3J8Dt/S1UrX
 Fe5hXQpfBefd+VqP3U+GAr1jGY37pL9nmTQHYEKIVNPvymgcDZrQO+/HwID7bkYJys5P
 HMxjLPlATHki7Mv2dkrfh2O7vlaOVUwKW08IIq2O467lRJyZ4pSqDX8306wJvPkAQGpD
 lqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4K+76fXWu64AC8MAx0GfkRxyTJTP8Yxv1hTUm0IQ7NQ=;
 b=DMSHOYVvbed3ENj9MzggnAWZ7jDvPZxKeqJQRBa2wViKsXlaCmc8cMNLCC9l6E6sgB
 DNg+K+GNl0eDOJBdhjajAIW1RpYXvlGuviOr2Zw4C1QJA6ZQ9ERcfLDBeJRpebufYlaR
 konlXgi8GelzwCqRWgWmtWLaGNjiA82WPemqY4WAxFb7G/Ik7R6L7mVv8JxngWt2i44g
 Hz3k2X+5ILQbDVUQU1Q1/DLxE3jp6zCz1bhvig3FNjb6m6RIQhPSqRb3EamXcBKim0RA
 mi4cXDKtNhkAjL3zBijyifxj56zymGP0atqbrWvEiswIg/93TeBDDXcSZAX/Yk27mtSQ
 3ZHQ==
X-Gm-Message-State: ACrzQf3DGvbxc67CEp+xcIPowsbcVOPpesXMzMoTNcBmDSzesZGdRaLN
 Ns5XI7ubGKqGUKzyjApYn4yowJGNNFclfMkjIqU=
X-Google-Smtp-Source: AMsMyM7A0nSQ7GUR4whbMQ7EVtGwq016zQnzXXGn0asbeptWNkV7WRbUKntZyGq+7Q5LeRIM/0E6erKetWWwzqKf5Rg=
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id
 u23-20020a2e9b17000000b0026c4ede512cmr2878368lji.529.1663940602769; Fri, 23
 Sep 2022 06:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-6-alexander.ivanov@virtuozzo.com>
 <CAJ+F1C+XmamVevibzAGSFWVGmsc-Wg0br8b1Mj=gDVO5SbyEEQ@mail.gmail.com>
In-Reply-To: <CAJ+F1C+XmamVevibzAGSFWVGmsc-Wg0br8b1Mj=gDVO5SbyEEQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 15:43:11 +0200
Message-ID: <CAJ+F1CK8G7_NRH6bw-cgfQGaDPNtpeDE4uTG-zYOUFWzzw9KUA@mail.gmail.com>
Subject: Re: [PATCH 5/5] qga: Add support for user password settinng in
 FreeeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="0000000000008e41a005e9585ccc"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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

--0000000000008e41a005e9585ccc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 23, 2022 at 10:19 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, Sep 22, 2022 at 4:25 PM Alexander Ivanov <
> alexander.ivanov@virtuozzo.com> wrote:
>
>> Move qmp_guest_set_user_password() to commands-posix.c under (__linux__ =
or
>> __FreeBSD) condition. Add command and arguments for password setting in
>> FreeBSD.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>
>
> If you avoid the code move, the patch is much smaller and easier to revie=
w
> and lgtm.
>

Also, please fix the typos in the commit message ("settinng" & "FreeeBSD")


>
>> ---
>>  qga/commands-bsd.c   |   8 ---
>>  qga/commands-linux.c | 105 --------------------------------------
>>  qga/commands-posix.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
>>  3 files changed, 116 insertions(+), 114 deletions(-)
>>
>> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
>> index 5d3f46804a..fa3933f2f4 100644
>> --- a/qga/commands-bsd.c
>> +++ b/qga/commands-bsd.c
>> @@ -190,14 +190,6 @@ int64_t
>> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>>      return -1;
>>  }
>>
>> -void qmp_guest_set_user_password(const char *username,
>> -                                 const char *password,
>> -                                 bool crypted,
>> -                                 Error **errp)
>> -{
>> -    error_setg(errp, QERR_UNSUPPORTED);
>> -}
>> -
>>  GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>>  {
>>      error_setg(errp, QERR_UNSUPPORTED);
>> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
>> index 615e9a0027..1f25c80482 100644
>> --- a/qga/commands-linux.c
>> +++ b/qga/commands-linux.c
>> @@ -1629,111 +1629,6 @@ int64_t
>> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>>      return processed;
>>  }
>>
>> -void qmp_guest_set_user_password(const char *username,
>> -                                 const char *password,
>> -                                 bool crypted,
>> -                                 Error **errp)
>> -{
>> -    Error *local_err =3D NULL;
>> -    char *passwd_path =3D NULL;
>> -    pid_t pid;
>> -    int status;
>> -    int datafd[2] =3D { -1, -1 };
>> -    char *rawpasswddata =3D NULL;
>> -    size_t rawpasswdlen;
>> -    char *chpasswddata =3D NULL;
>> -    size_t chpasswdlen;
>> -
>> -    rawpasswddata =3D (char *)qbase64_decode(password, -1, &rawpasswdle=
n,
>> errp);
>> -    if (!rawpasswddata) {
>> -        return;
>> -    }
>> -    rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen + 1);
>> -    rawpasswddata[rawpasswdlen] =3D '\0';
>> -
>> -    if (strchr(rawpasswddata, '\n')) {
>> -        error_setg(errp, "forbidden characters in raw password");
>> -        goto out;
>> -    }
>> -
>> -    if (strchr(username, '\n') ||
>> -        strchr(username, ':')) {
>> -        error_setg(errp, "forbidden characters in username");
>> -        goto out;
>> -    }
>> -
>> -    chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata=
);
>> -    chpasswdlen =3D strlen(chpasswddata);
>> -
>> -    passwd_path =3D g_find_program_in_path("chpasswd");
>> -
>> -    if (!passwd_path) {
>> -        error_setg(errp, "cannot find 'passwd' program in PATH");
>> -        goto out;
>> -    }
>> -
>> -    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>> -        error_setg(errp, "cannot create pipe FDs");
>> -        goto out;
>> -    }
>> -
>> -    pid =3D fork();
>> -    if (pid =3D=3D 0) {
>> -        close(datafd[1]);
>> -        /* child */
>> -        setsid();
>> -        dup2(datafd[0], 0);
>> -        reopen_fd_to_null(1);
>> -        reopen_fd_to_null(2);
>> -
>> -        if (crypted) {
>> -            execl(passwd_path, "chpasswd", "-e", NULL);
>> -        } else {
>> -            execl(passwd_path, "chpasswd", NULL);
>> -        }
>> -        _exit(EXIT_FAILURE);
>> -    } else if (pid < 0) {
>> -        error_setg_errno(errp, errno, "failed to create child process")=
;
>> -        goto out;
>> -    }
>> -    close(datafd[0]);
>> -    datafd[0] =3D -1;
>> -
>> -    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=3D
>> chpasswdlen) {
>> -        error_setg_errno(errp, errno, "cannot write new account
>> password");
>> -        goto out;
>> -    }
>> -    close(datafd[1]);
>> -    datafd[1] =3D -1;
>> -
>> -    ga_wait_child(pid, &status, &local_err);
>> -    if (local_err) {
>> -        error_propagate(errp, local_err);
>> -        goto out;
>> -    }
>> -
>> -    if (!WIFEXITED(status)) {
>> -        error_setg(errp, "child process has terminated abnormally");
>> -        goto out;
>> -    }
>> -
>> -    if (WEXITSTATUS(status)) {
>> -        error_setg(errp, "child process has failed to set user
>> password");
>> -        goto out;
>> -    }
>> -
>> -out:
>> -    g_free(chpasswddata);
>> -    g_free(rawpasswddata);
>> -    g_free(passwd_path);
>> -    if (datafd[0] !=3D -1) {
>> -        close(datafd[0]);
>> -    }
>> -    if (datafd[1] !=3D -1) {
>> -        close(datafd[1]);
>> -    }
>> -}
>> -
>>  static void ga_read_sysfs_file(int dirfd, const char *pathname, char
>> *buf,
>>                                 int size, Error **errp)
>>  {
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 60cc673f25..e8fc7bd516 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -774,8 +774,123 @@ void qmp_guest_file_flush(int64_t handle, Error
>> **errp)
>>      }
>>  }
>>
>> -#if !(defined(__linux__) || defined(__FreeBSD__))
>> +#if defined(__linux__) || defined(__FreeBSD__)
>> +void qmp_guest_set_user_password(const char *username,
>> +                                 const char *password,
>> +                                 bool crypted,
>> +                                 Error **errp)
>> +{
>> +    Error *local_err =3D NULL;
>> +    char *passwd_path =3D NULL;
>> +    pid_t pid;
>> +    int status;
>> +    int datafd[2] =3D { -1, -1 };
>> +    char *rawpasswddata =3D NULL;
>> +    size_t rawpasswdlen;
>> +    char *chpasswddata =3D NULL;
>> +    size_t chpasswdlen;
>>
>> +    rawpasswddata =3D (char *)qbase64_decode(password, -1, &rawpasswdle=
n,
>> errp);
>> +    if (!rawpasswddata) {
>> +        return;
>> +    }
>> +    rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen + 1);
>> +    rawpasswddata[rawpasswdlen] =3D '\0';
>> +
>> +    if (strchr(rawpasswddata, '\n')) {
>> +        error_setg(errp, "forbidden characters in raw password");
>> +        goto out;
>> +    }
>> +
>> +    if (strchr(username, '\n') ||
>> +        strchr(username, ':')) {
>> +        error_setg(errp, "forbidden characters in username");
>> +        goto out;
>> +    }
>> +
>> +#ifdef __FreeBSD__
>> +    chpasswddata =3D g_strdup(rawpasswddata);
>> +    passwd_path =3D g_find_program_in_path("pw");
>> +#else
>> +    chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata=
);
>> +    passwd_path =3D g_find_program_in_path("chpasswd");
>> +#endif
>> +
>> +    chpasswdlen =3D strlen(chpasswddata);
>> +
>> +    if (!passwd_path) {
>> +        error_setg(errp, "cannot find 'passwd' program in PATH");
>> +        goto out;
>> +    }
>> +
>> +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>> +        error_setg(errp, "cannot create pipe FDs");
>> +        goto out;
>> +    }
>> +
>> +    pid =3D fork();
>> +    if (pid =3D=3D 0) {
>> +        close(datafd[1]);
>> +        /* child */
>> +        setsid();
>> +        dup2(datafd[0], 0);
>> +        reopen_fd_to_null(1);
>> +        reopen_fd_to_null(2);
>> +
>> +#ifdef __FreeBSD__
>> +        const char *h_arg;
>> +        h_arg =3D (crypted) ? "-H" : "-h";
>> +        execl(passwd_path, "pw", "usermod", "-n", username, h_arg, "0",
>> NULL);
>> +#else
>> +        if (crypted) {
>> +            execl(passwd_path, "chpasswd", "-e", NULL);
>> +        } else {
>> +            execl(passwd_path, "chpasswd", NULL);
>> +        }
>> +#endif
>> +        _exit(EXIT_FAILURE);
>> +    } else if (pid < 0) {
>> +        error_setg_errno(errp, errno, "failed to create child process")=
;
>> +        goto out;
>> +    }
>> +    close(datafd[0]);
>> +    datafd[0] =3D -1;
>> +
>> +    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=3D
>> chpasswdlen) {
>> +        error_setg_errno(errp, errno, "cannot write new account
>> password");
>> +        goto out;
>> +    }
>> +    close(datafd[1]);
>> +    datafd[1] =3D -1;
>> +
>> +    ga_wait_child(pid, &status, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        goto out;
>> +    }
>> +
>> +    if (!WIFEXITED(status)) {
>> +        error_setg(errp, "child process has terminated abnormally");
>> +        goto out;
>> +    }
>> +
>> +    if (WEXITSTATUS(status)) {
>> +        error_setg(errp, "child process has failed to set user
>> password");
>> +        goto out;
>> +    }
>> +
>> +out:
>> +    g_free(chpasswddata);
>> +    g_free(rawpasswddata);
>> +    g_free(passwd_path);
>> +    if (datafd[0] !=3D -1) {
>> +        close(datafd[0]);
>> +    }
>> +    if (datafd[1] !=3D -1) {
>> +        close(datafd[1]);
>> +    }
>> +}
>> +#else
>>  void qmp_guest_suspend_disk(Error **errp)
>>  {
>>      error_setg(errp, QERR_UNSUPPORTED);
>> --
>> 2.34.1
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000008e41a005e9585ccc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:19 AM Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marc=
andre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2=
2, 2022 at 4:25 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@=
virtuozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Move qmp_gue=
st_set_user_password() to commands-posix.c under (__linux__ or<br>
__FreeBSD) condition. Add command and arguments for password setting in<br>
FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>If you avoid the code move, the patch is much =
smaller and easier to review and lgtm.</div></div></div></blockquote><div><=
br></div><div>Also, please fix the typos in the commit message (&quot;setti=
nng&quot; &amp; &quot;FreeeBSD&quot;)</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0|=C2=A0 =C2=A08 ---<br>
=C2=A0qga/commands-linux.c | 105 --------------------------------------<br>
=C2=A0qga/commands-posix.c | 117 ++++++++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A03 files changed, 116 insertions(+), 114 deletions(-)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index 5d3f46804a..fa3933f2f4 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -190,14 +190,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList =
*vcpus, Error **errp)<br>
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
diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
index 615e9a0027..1f25c80482 100644<br>
--- a/qga/commands-linux.c<br>
+++ b/qga/commands-linux.c<br>
@@ -1629,111 +1629,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorLi=
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
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 60cc673f25..e8fc7bd516 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -774,8 +774,123 @@ void qmp_guest_file_flush(int64_t handle, Error **err=
p)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#if !(defined(__linux__) || defined(__FreeBSD__))<br>
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
<br>
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
+#else<br>
=C2=A0void qmp_guest_suspend_disk(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_UNSUPPORTED);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008e41a005e9585ccc--

