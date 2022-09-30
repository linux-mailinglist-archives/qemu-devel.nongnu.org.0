Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C335F065D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:24:47 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeBKA-00060F-B1
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeBFh-0001jQ-OB
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:20:12 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeBFd-00046P-Ok
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:20:09 -0400
Received: by mail-lf1-x131.google.com with SMTP id a8so5712172lff.13
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xQbrkOfuUIY7C9Iq1h5BoWRvI386E2HgoOJeE0FkvrY=;
 b=OUlVBBm/XCunpQrTr2nsuoMyxWW67K9SwZqOqBfiB9bpMfhl16asxovKOLMJBwhr24
 /e4FGySlOL5P4WA1iWwvx6L/RYfFtFBh6ciN5cWeWGHEq6WlHmWLqMi/eW6ZdIMBSo4V
 TnwkXel/dNg3ETjYcUPFqAJkCrEIsmMZwo350M5asLC62bsPs45JegVAd4jskN0zsECh
 yMKlIJIuYdv5N3bgXDNR4OgRntQy3gLSd+hVj2xGMB0sT6ikUl0w9p8OmtIe2I/aYE6q
 4/THEC1M9W4EqccHw9kBIDCNxnfl2kLdLYjMJ2iYBKpx158yqNGMmroCL9RaVzxqS3+w
 h2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xQbrkOfuUIY7C9Iq1h5BoWRvI386E2HgoOJeE0FkvrY=;
 b=ad3zKdoCvNX5c/U3ckF1H3l1CZjvXA+61/ekSWFBQYTd4qIVYCjV96bnk+yIWYk0Pg
 2Zw5EICsSgZEzSen2qju30c+FeVquGBhWIPEehSkotHsA9emn9GtUmV0b7yI9ypR390d
 esNPJkojJXrbwst1xjqY5VgXC1haKcBksGipJlRtlSq25FYei7Gv/UmeYf8w9tBqAOcM
 yrBFX/aV5fu0RYCD/XfP4KU00A/4a1+UUc09i9Sk0AbIJg/umJ4jX1VBDgdyy7DtD5Ua
 i07FQOap7eS+QKw1GQpVhBDH1A6HuEYX4aD0yNjhhmYUT2HSygvudRED2aWvAoEoEDQy
 YybA==
X-Gm-Message-State: ACrzQf1dUHO0I0AhRHnfAY/d3rmKZdJH+lpuR/yN5V4ICcB0eT2s4zK7
 dHFCJ7s5N7DA7TELEUbHuZ/bWxncf/uQu5jlRAY=
X-Google-Smtp-Source: AMsMyM46EqaR2nbh9Vus7N7GN+LoK7nasqMYe8IManac6vd99KUIHjRFa+fn6LcaxPUtwvovE/CjNA4CfDtGtIbbRO8=
X-Received: by 2002:a05:6512:6c2:b0:4a2:e7c:6164 with SMTP id
 u2-20020a05651206c200b004a20e7c6164mr1751679lff.329.1664526002572; Fri, 30
 Sep 2022 01:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-6-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CLY+ppqzddPJVPGqpST1Jk4zQMpQeC_Davmq2qiOnPoKA@mail.gmail.com>
 <6a7882a1-88ef-064a-ea71-aba0c7ee1981@virtuozzo.com>
In-Reply-To: <6a7882a1-88ef-064a-ea71-aba0c7ee1981@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Sep 2022 12:19:50 +0400
Message-ID: <CAJ+F1C+No1Sq8a-qtm1YdJVHrcx5puiFpz9TUO2Cg7nS8zq42A@mail.gmail.com>
Subject: Re: [PATCH 5/7] qga: Add support for user password setting in FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="0000000000001a549c05e9e0a956"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--0000000000001a549c05e9e0a956
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 29, 2022 at 6:29 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

>
> On 29.09.2022 13:22, Marc-Andr=C3=A9 Lureau wrote:
> >
> >
> > Caution: This is an external email and has a suspicious subject or
> > content. Please take care when clicking links or opening attachments.
> > When in doubt, contact your IT Department
> >
> >
> > Hi Alexander
> >
> > On Thu, Sep 29, 2022 at 12:52 PM Alexander Ivanov
> > <alexander.ivanov@virtuozzo.com> wrote:
> >
> >     Move qmp_guest_set_user_password() from __linux__ condition to
> >     (__linux__ || __FreeBSD__) condition. Add command and arguments
> >     for password setting in FreeBSD.
> >
> >     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> >
> >
> > Could you explain why you need to move the code?
> >
> > You could instead have a top declaration?
> Now qmp_guest_set_user_password()is under #ifdef __linux__. I want to
> use this function for FreeBSD too, so I moved it under (__linux__ ||
> __FreeBSD__) condition. I could create another function for FreeBSD but
>

Why not make the following change?

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 88e0d0fe24..78a345c9f3 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2122,7 +2122,9 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList
*vcpus, Error **errp)

     return processed;
 }
+#endif /* linux */

+#if defined(__linux__) || defined(__FreeBSD__)
 void qmp_guest_set_user_password(const char *username,
                                  const char *password,
                                  bool crypted,
@@ -2227,7 +2229,9 @@ out:
         close(datafd[1]);
     }
 }
+#endif /* linux || freebsd */

+#if defined(__linux__)
 static void ga_read_sysfs_file(int dirfd, const char *pathname, char *buf,
                                int size, Error **errp)
 {


> it would lead to code duplication. Unfortunately I don't see another way
> to do it except to add (__linux__ || __FreeBSD__) condition, cut the
> function and paste in this condition. If you could suggest another way I
> would happy.
> > If it's really required, please split the patch in move + additions.
> Just moving the function without other changes leads to unbuildable code
> in FreeBSD. I thought it's worse than moving and changing at the same
> time. I split the patch if you prefer.
>
>
> >     ---
> >      qga/commands-posix.c | 223
> >     +++++++++++++++++++++++--------------------
> >      1 file changed, 118 insertions(+), 105 deletions(-)
> >
> >     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> >     index 88e0d0fe24..6ce894ca6e 100644
> >     --- a/qga/commands-posix.c
> >     +++ b/qga/commands-posix.c
> >     @@ -2123,111 +2123,6 @@ int64_t
> >     qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
> >          return processed;
> >      }
> >
> >     -void qmp_guest_set_user_password(const char *username,
> >     -                                 const char *password,
> >     -                                 bool crypted,
> >     -                                 Error **errp)
> >     -{
> >     -    Error *local_err =3D NULL;
> >     -    char *passwd_path =3D NULL;
> >     -    pid_t pid;
> >     -    int status;
> >     -    int datafd[2] =3D { -1, -1 };
> >     -    char *rawpasswddata =3D NULL;
> >     -    size_t rawpasswdlen;
> >     -    char *chpasswddata =3D NULL;
> >     -    size_t chpasswdlen;
> >     -
> >     -    rawpasswddata =3D (char *)qbase64_decode(password, -1,
> >     &rawpasswdlen, errp);
> >     -    if (!rawpasswddata) {
> >     -        return;
> >     -    }
> >     -    rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen + =
1);
> >     -    rawpasswddata[rawpasswdlen] =3D '\0';
> >     -
> >     -    if (strchr(rawpasswddata, '\n')) {
> >     -        error_setg(errp, "forbidden characters in raw password");
> >     -        goto out;
> >     -    }
> >     -
> >     -    if (strchr(username, '\n') ||
> >     -        strchr(username, ':')) {
> >     -        error_setg(errp, "forbidden characters in username");
> >     -        goto out;
> >     -    }
> >     -
> >     -    chpasswddata =3D g_strdup_printf("%s:%s\n", username,
> >     rawpasswddata);
> >     -    chpasswdlen =3D strlen(chpasswddata);
> >     -
> >     -    passwd_path =3D g_find_program_in_path("chpasswd");
> >     -
> >     -    if (!passwd_path) {
> >     -        error_setg(errp, "cannot find 'passwd' program in PATH");
> >     -        goto out;
> >     -    }
> >     -
> >     -    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
> >     -        error_setg(errp, "cannot create pipe FDs");
> >     -        goto out;
> >     -    }
> >     -
> >     -    pid =3D fork();
> >     -    if (pid =3D=3D 0) {
> >     -        close(datafd[1]);
> >     -        /* child */
> >     -        setsid();
> >     -        dup2(datafd[0], 0);
> >     -        reopen_fd_to_null(1);
> >     -        reopen_fd_to_null(2);
> >     -
> >     -        if (crypted) {
> >     -            execl(passwd_path, "chpasswd", "-e", NULL);
> >     -        } else {
> >     -            execl(passwd_path, "chpasswd", NULL);
> >     -        }
> >     -        _exit(EXIT_FAILURE);
> >     -    } else if (pid < 0) {
> >     -        error_setg_errno(errp, errno, "failed to create child
> >     process");
> >     -        goto out;
> >     -    }
> >     -    close(datafd[0]);
> >     -    datafd[0] =3D -1;
> >     -
> >     -    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=3D
> >     chpasswdlen) {
> >     -        error_setg_errno(errp, errno, "cannot write new account
> >     password");
> >     -        goto out;
> >     -    }
> >     -    close(datafd[1]);
> >     -    datafd[1] =3D -1;
> >     -
> >     -    ga_wait_child(pid, &status, &local_err);
> >     -    if (local_err) {
> >     -        error_propagate(errp, local_err);
> >     -        goto out;
> >     -    }
> >     -
> >     -    if (!WIFEXITED(status)) {
> >     -        error_setg(errp, "child process has terminated abnormally"=
);
> >     -        goto out;
> >     -    }
> >     -
> >     -    if (WEXITSTATUS(status)) {
> >     -        error_setg(errp, "child process has failed to set user
> >     password");
> >     -        goto out;
> >     -    }
> >     -
> >     -out:
> >     -    g_free(chpasswddata);
> >     -    g_free(rawpasswddata);
> >     -    g_free(passwd_path);
> >     -    if (datafd[0] !=3D -1) {
> >     -        close(datafd[0]);
> >     -    }
> >     -    if (datafd[1] !=3D -1) {
> >     -        close(datafd[1]);
> >     -    }
> >     -}
> >     -
> >      static void ga_read_sysfs_file(int dirfd, const char *pathname,
> >     char *buf,
> >                                     int size, Error **errp)
> >      {
> >     @@ -2793,6 +2688,124 @@ GuestMemoryBlockInfo
> >     *qmp_guest_get_memory_block_info(Error **errp)
> >
> >      #endif
> >
> >     +#if defined(__linux__) || defined(__FreeBSD__)
> >     +void qmp_guest_set_user_password(const char *username,
> >     +                                 const char *password,
> >     +                                 bool crypted,
> >     +                                 Error **errp)
> >     +{
> >     +    Error *local_err =3D NULL;
> >     +    char *passwd_path =3D NULL;
> >     +    pid_t pid;
> >     +    int status;
> >     +    int datafd[2] =3D { -1, -1 };
> >     +    char *rawpasswddata =3D NULL;
> >     +    size_t rawpasswdlen;
> >     +    char *chpasswddata =3D NULL;
> >     +    size_t chpasswdlen;
> >     +
> >     +    rawpasswddata =3D (char *)qbase64_decode(password, -1,
> >     &rawpasswdlen, errp);
> >     +    if (!rawpasswddata) {
> >     +        return;
> >     +    }
> >     +    rawpasswddata =3D g_renew(char, rawpasswddata, rawpasswdlen + =
1);
> >     +    rawpasswddata[rawpasswdlen] =3D '\0';
> >     +
> >     +    if (strchr(rawpasswddata, '\n')) {
> >     +        error_setg(errp, "forbidden characters in raw password");
> >     +        goto out;
> >     +    }
> >     +
> >     +    if (strchr(username, '\n') ||
> >     +        strchr(username, ':')) {
> >     +        error_setg(errp, "forbidden characters in username");
> >     +        goto out;
> >     +    }
> >     +
> >     +#ifdef __FreeBSD__
> >     +    chpasswddata =3D g_strdup(rawpasswddata);
> >     +    passwd_path =3D g_find_program_in_path("pw");
> >     +#else
> >     +    chpasswddata =3D g_strdup_printf("%s:%s\n", username,
> >     rawpasswddata);
> >     +    passwd_path =3D g_find_program_in_path("chpasswd");
> >     +#endif
> >     +
> >     +    chpasswdlen =3D strlen(chpasswddata);
> >     +
> >     +    if (!passwd_path) {
> >     +        error_setg(errp, "cannot find 'passwd' program in PATH");
> >     +        goto out;
> >     +    }
> >     +
> >     +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
> >     +        error_setg(errp, "cannot create pipe FDs");
> >     +        goto out;
> >     +    }
> >     +
> >     +    pid =3D fork();
> >     +    if (pid =3D=3D 0) {
> >     +        close(datafd[1]);
> >     +        /* child */
> >     +        setsid();
> >     +        dup2(datafd[0], 0);
> >     +        reopen_fd_to_null(1);
> >     +        reopen_fd_to_null(2);
> >     +
> >     +#ifdef __FreeBSD__
> >     +        const char *h_arg;
> >     +        h_arg =3D (crypted) ? "-H" : "-h";
> >     +        execl(passwd_path, "pw", "usermod", "-n", username,
> >     h_arg, "0", NULL);
> >     +#else
> >     +        if (crypted) {
> >     +            execl(passwd_path, "chpasswd", "-e", NULL);
> >     +        } else {
> >     +            execl(passwd_path, "chpasswd", NULL);
> >     +        }
> >     +#endif
> >     +        _exit(EXIT_FAILURE);
> >     +    } else if (pid < 0) {
> >     +        error_setg_errno(errp, errno, "failed to create child
> >     process");
> >     +        goto out;
> >     +    }
> >     +    close(datafd[0]);
> >     +    datafd[0] =3D -1;
> >     +
> >     +    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=3D
> >     chpasswdlen) {
> >     +        error_setg_errno(errp, errno, "cannot write new account
> >     password");
> >     +        goto out;
> >     +    }
> >     +    close(datafd[1]);
> >     +    datafd[1] =3D -1;
> >     +
> >     +    ga_wait_child(pid, &status, &local_err);
> >     +    if (local_err) {
> >     +        error_propagate(errp, local_err);
> >     +        goto out;
> >     +    }
> >     +
> >     +    if (!WIFEXITED(status)) {
> >     +        error_setg(errp, "child process has terminated abnormally"=
);
> >     +        goto out;
> >     +    }
> >     +
> >     +    if (WEXITSTATUS(status)) {
> >     +        error_setg(errp, "child process has failed to set user
> >     password");
> >     +        goto out;
> >     +    }
> >     +
> >     +out:
> >     +    g_free(chpasswddata);
> >     +    g_free(rawpasswddata);
> >     +    g_free(passwd_path);
> >     +    if (datafd[0] !=3D -1) {
> >     +        close(datafd[0]);
> >     +    }
> >     +    if (datafd[1] !=3D -1) {
> >     +        close(datafd[1]);
> >     +    }
> >     +}
> >     +#endif
> >     +
> >      #ifdef HAVE_GETIFADDRS
> >      static GuestNetworkInterface *
> >      guest_find_interface(GuestNetworkInterfaceList *head,
> >     --
> >     2.34.1
> >
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000001a549c05e9e0a956
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGk8YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBT
ZXAgMjksIDIwMjIgYXQgNjoyOSBQTSBBbGV4YW5kZXIgSXZhbm92ICZsdDs8YSBocmVmPSJtYWls
dG86YWxleGFuZGVyLml2YW5vdkB2aXJ0dW96em8uY29tIj5hbGV4YW5kZXIuaXZhbm92QHZpcnR1
b3p6by5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxicj4NCk9uIDI5LjA5LjIw
MjIgMTM6MjIsIE1hcmMtQW5kcsOpIEx1cmVhdSB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgPGJyPg0KJmd0OyBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsIGFu
ZCBoYXMgYSBzdXNwaWNpb3VzIHN1YmplY3Qgb3IgPGJyPg0KJmd0OyBjb250ZW50LiBQbGVhc2Ug
dGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZyBhdHRhY2htZW50cy4gPGJy
Pg0KJmd0OyBXaGVuIGluIGRvdWJ0LCBjb250YWN0IHlvdXIgSVQgRGVwYXJ0bWVudDxicj4NCiZn
dDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBIaSBBbGV4YW5kZXI8YnI+DQomZ3Q7PGJyPg0KJmd0OyBP
biBUaHUsIFNlcCAyOSwgMjAyMiBhdCAxMjo1MiBQTSBBbGV4YW5kZXIgSXZhbm92IDxicj4NCiZn
dDsgJmx0OzxhIGhyZWY9Im1haWx0bzphbGV4YW5kZXIuaXZhbm92QHZpcnR1b3p6by5jb20iIHRh
cmdldD0iX2JsYW5rIj5hbGV4YW5kZXIuaXZhbm92QHZpcnR1b3p6by5jb208L2E+Jmd0OyB3cm90
ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgTW92ZSBxbXBfZ3Vlc3Rfc2V0X3VzZXJfcGFz
c3dvcmQoKSBmcm9tIF9fbGludXhfXyBjb25kaXRpb24gdG88YnI+DQomZ3Q7wqAgwqAgwqAoX19s
aW51eF9fIHx8IF9fRnJlZUJTRF9fKSBjb25kaXRpb24uIEFkZCBjb21tYW5kIGFuZCBhcmd1bWVu
dHM8YnI+DQomZ3Q7wqAgwqAgwqBmb3IgcGFzc3dvcmQgc2V0dGluZyBpbiBGcmVlQlNELjxicj4N
CiZndDs8YnI+DQomZ3Q7wqAgwqAgwqBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgSXZhbm92ICZs
dDs8YSBocmVmPSJtYWlsdG86YWxleGFuZGVyLml2YW5vdkB2aXJ0dW96em8uY29tIiB0YXJnZXQ9
Il9ibGFuayI+YWxleGFuZGVyLml2YW5vdkB2aXJ0dW96em8uY29tPC9hPiZndDs8YnI+DQomZ3Q7
PGJyPg0KJmd0Ozxicj4NCiZndDsgQ291bGQgeW91IGV4cGxhaW4gd2h5IHlvdSBuZWVkIHRvIG1v
dmUgdGhlIGNvZGU/PGJyPg0KJmd0Ozxicj4NCiZndDsgWW91IGNvdWxkIGluc3RlYWQgaGF2ZSBh
IHRvcCBkZWNsYXJhdGlvbj88YnI+DQpOb3cgcW1wX2d1ZXN0X3NldF91c2VyX3Bhc3N3b3JkKClp
cyB1bmRlciAjaWZkZWYgX19saW51eF9fLiBJIHdhbnQgdG8gPGJyPg0KdXNlIHRoaXMgZnVuY3Rp
b24gZm9yIEZyZWVCU0QgdG9vLCBzbyBJIG1vdmVkIGl0IHVuZGVyIChfX2xpbnV4X18gfHwgPGJy
Pg0KX19GcmVlQlNEX18pIGNvbmRpdGlvbi4gSSBjb3VsZCBjcmVhdGUgYW5vdGhlciBmdW5jdGlv
biBmb3IgRnJlZUJTRCBidXQgPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pldo
eSBub3QgbWFrZSB0aGUgZm9sbG93aW5nIGNoYW5nZT88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PmRpZmYgLS1naXQgYS9xZ2EvY29tbWFuZHMtcG9zaXguYyBiL3FnYS9jb21tYW5kcy1wb3NpeC5j
PGJyPmluZGV4IDg4ZTBkMGZlMjQuLjc4YTM0NWM5ZjMgMTAwNjQ0PGJyPi0tLSBhL3FnYS9jb21t
YW5kcy1wb3NpeC5jPGJyPisrKyBiL3FnYS9jb21tYW5kcy1wb3NpeC5jPGJyPkBAIC0yMTIyLDcg
KzIxMjIsOSBAQCBpbnQ2NF90IHFtcF9ndWVzdF9zZXRfdmNwdXMoR3Vlc3RMb2dpY2FsUHJvY2Vz
c29yTGlzdCAqdmNwdXMsIEVycm9yICoqZXJycCk8YnI+wqA8YnI+wqAgwqAgwqByZXR1cm4gcHJv
Y2Vzc2VkOzxicj7CoH08YnI+KyNlbmRpZiAvKiBsaW51eCAqLzxicj7CoDxicj4rI2lmIGRlZmlu
ZWQoX19saW51eF9fKSB8fCBkZWZpbmVkKF9fRnJlZUJTRF9fKTxicj7CoHZvaWQgcW1wX2d1ZXN0
X3NldF91c2VyX3Bhc3N3b3JkKGNvbnN0IGNoYXIgKnVzZXJuYW1lLDxicj7CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb25zdCBjaGFyICpwYXNzd29y
ZCw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Ym9vbCBjcnlwdGVkLDxicj5AQCAtMjIyNyw3ICsyMjI5LDkgQEAgb3V0Ojxicj7CoCDCoCDCoCDC
oCDCoGNsb3NlKGRhdGFmZFsxXSk7PGJyPsKgIMKgIMKgfTxicj7CoH08YnI+KyNlbmRpZiAvKiBs
aW51eCB8fCBmcmVlYnNkICovPGJyPsKgPGJyPisjaWYgZGVmaW5lZChfX2xpbnV4X18pPGJyPsKg
c3RhdGljIHZvaWQgZ2FfcmVhZF9zeXNmc19maWxlKGludCBkaXJmZCwgY29uc3QgY2hhciAqcGF0
aG5hbWUsIGNoYXIgKmJ1Ziw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaW50IHNpemUsIEVycm9yICoqZXJycCk8YnI+wqB7PGJyPjwvZGl2PjxkaXY+
wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4
IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFk
ZGluZy1sZWZ0OjFleCI+DQppdCB3b3VsZCBsZWFkIHRvIGNvZGUgZHVwbGljYXRpb24uIFVuZm9y
dHVuYXRlbHkgSSBkb24mIzM5O3Qgc2VlIGFub3RoZXIgd2F5IDxicj4NCnRvIGRvIGl0IGV4Y2Vw
dCB0byBhZGQgKF9fbGludXhfXyB8fCBfX0ZyZWVCU0RfXykgY29uZGl0aW9uLCBjdXQgdGhlIDxi
cj4NCmZ1bmN0aW9uIGFuZCBwYXN0ZSBpbiB0aGlzIGNvbmRpdGlvbi4gSWYgeW91IGNvdWxkIHN1
Z2dlc3QgYW5vdGhlciB3YXkgSSA8YnI+DQp3b3VsZCBoYXBweS48YnI+DQomZ3Q7IElmIGl0JiMz
OTtzIHJlYWxseSByZXF1aXJlZCwgcGxlYXNlIHNwbGl0IHRoZSBwYXRjaCBpbiBtb3ZlICsgYWRk
aXRpb25zLjxicj4NCkp1c3QgbW92aW5nIHRoZSBmdW5jdGlvbiB3aXRob3V0IG90aGVyIGNoYW5n
ZXMgbGVhZHMgdG8gdW5idWlsZGFibGUgY29kZSA8YnI+DQppbiBGcmVlQlNELiBJIHRob3VnaHQg
aXQmIzM5O3Mgd29yc2UgdGhhbiBtb3ZpbmcgYW5kIGNoYW5naW5nIGF0IHRoZSBzYW1lIDxicj4N
CnRpbWUuIEkgc3BsaXQgdGhlIHBhdGNoIGlmIHlvdSBwcmVmZXIuIDxicj48L2Jsb2NrcXVvdGU+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoC0tLTxicj4NCiZndDvCoCDCoCDCoMKgcWdh
L2NvbW1hbmRzLXBvc2l4LmMgfCAyMjM8YnI+DQomZ3Q7wqAgwqAgwqArKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPg0KJmd0O8KgIMKgIMKgwqAxIGZpbGUgY2hh
bmdlZCwgMTE4IGluc2VydGlvbnMoKyksIDEwNSBkZWxldGlvbnMoLSk8YnI+DQomZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgZGlmZiAtLWdpdCBhL3FnYS9jb21tYW5kcy1wb3NpeC5jIGIvcWdhL2NvbW1h
bmRzLXBvc2l4LmM8YnI+DQomZ3Q7wqAgwqAgwqBpbmRleCA4OGUwZDBmZTI0Li42Y2U4OTRjYTZl
IDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoC0tLSBhL3FnYS9jb21tYW5kcy1wb3NpeC5jPGJyPg0K
Jmd0O8KgIMKgIMKgKysrIGIvcWdhL2NvbW1hbmRzLXBvc2l4LmM8YnI+DQomZ3Q7wqAgwqAgwqBA
QCAtMjEyMywxMTEgKzIxMjMsNiBAQCBpbnQ2NF90PGJyPg0KJmd0O8KgIMKgIMKgcW1wX2d1ZXN0
X3NldF92Y3B1cyhHdWVzdExvZ2ljYWxQcm9jZXNzb3JMaXN0ICp2Y3B1cywgRXJyb3IgKiplcnJw
KTxicj4NCiZndDvCoCDCoCDCoMKgIMKgIMKgcmV0dXJuIHByb2Nlc3NlZDs8YnI+DQomZ3Q7wqAg
wqAgwqDCoH08YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgLXZvaWQgcW1wX2d1ZXN0X3NldF91
c2VyX3Bhc3N3b3JkKGNvbnN0IGNoYXIgKnVzZXJuYW1lLDxicj4NCiZndDvCoCDCoCDCoC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnN0IGNoYXIg
KnBhc3N3b3JkLDxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb2wgY3J5cHRlZCw8YnI+DQomZ3Q7wqAgwqAgwqAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBFcnJvciAqKmVy
cnApPGJyPg0KJmd0O8KgIMKgIMKgLXs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgRXJyb3IgKmxv
Y2FsX2VyciA9IE5VTEw7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGNoYXIgKnBhc3N3ZF9wYXRo
ID0gTlVMTDs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgcGlkX3QgcGlkOzxicj4NCiZndDvCoCDC
oCDCoC3CoCDCoCBpbnQgc3RhdHVzOzxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBpbnQgZGF0YWZk
WzJdID0geyAtMSwgLTEgfTs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgY2hhciAqcmF3cGFzc3dk
ZGF0YSA9IE5VTEw7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIHNpemVfdCByYXdwYXNzd2RsZW47
PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGNoYXIgKmNocGFzc3dkZGF0YSA9IE5VTEw7PGJyPg0K
Jmd0O8KgIMKgIMKgLcKgIMKgIHNpemVfdCBjaHBhc3N3ZGxlbjs8YnI+DQomZ3Q7wqAgwqAgwqAt
PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIHJhd3Bhc3N3ZGRhdGEgPSAoY2hhciAqKXFiYXNlNjRf
ZGVjb2RlKHBhc3N3b3JkLCAtMSw8YnI+DQomZ3Q7wqAgwqAgwqAmYW1wO3Jhd3Bhc3N3ZGxlbiwg
ZXJycCk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGlmICghcmF3cGFzc3dkZGF0YSkgezxicj4N
CiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCByZXR1cm47PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKg
IH08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgcmF3cGFzc3dkZGF0YSA9IGdfcmVuZXcoY2hhciwg
cmF3cGFzc3dkZGF0YSwgcmF3cGFzc3dkbGVuICsgMSk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKg
IHJhd3Bhc3N3ZGRhdGFbcmF3cGFzc3dkbGVuXSA9ICYjMzk7XDAmIzM5Ozs8YnI+DQomZ3Q7wqAg
wqAgwqAtPGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGlmIChzdHJjaHIocmF3cGFzc3dkZGF0YSwg
JiMzOTtcbiYjMzk7KSkgezxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCBlcnJvcl9zZXRn
KGVycnAsICZxdW90O2ZvcmJpZGRlbiBjaGFyYWN0ZXJzIGluIHJhdyBwYXNzd29yZCZxdW90Oyk7
PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIGdvdG8gb3V0Ozxicj4NCiZndDvCoCDCoCDC
oC3CoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgLTxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBpZiAo
c3RyY2hyKHVzZXJuYW1lLCAmIzM5O1xuJiMzOTspIHx8PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKg
IMKgIMKgIHN0cmNocih1c2VybmFtZSwgJiMzOTs6JiMzOTspKSB7PGJyPg0KJmd0O8KgIMKgIMKg
LcKgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7Zm9yYmlkZGVuIGNoYXJhY3RlcnMg
aW4gdXNlcm5hbWUmcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCBnb3RvIG91
dDs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoC08YnI+DQomZ3Q7
wqAgwqAgwqAtwqAgwqAgY2hwYXNzd2RkYXRhID0gZ19zdHJkdXBfcHJpbnRmKCZxdW90OyVzOiVz
XG4mcXVvdDssIHVzZXJuYW1lLDxicj4NCiZndDvCoCDCoCDCoHJhd3Bhc3N3ZGRhdGEpOzxicj4N
CiZndDvCoCDCoCDCoC3CoCDCoCBjaHBhc3N3ZGxlbiA9IHN0cmxlbihjaHBhc3N3ZGRhdGEpOzxi
cj4NCiZndDvCoCDCoCDCoC08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgcGFzc3dkX3BhdGggPSBn
X2ZpbmRfcHJvZ3JhbV9pbl9wYXRoKCZxdW90O2NocGFzc3dkJnF1b3Q7KTs8YnI+DQomZ3Q7wqAg
wqAgwqAtPGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGlmICghcGFzc3dkX3BhdGgpIHs8YnI+DQom
Z3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgZXJyb3Jfc2V0ZyhlcnJwLCAmcXVvdDtjYW5ub3QgZmlu
ZCAmIzM5O3Bhc3N3ZCYjMzk7IHByb2dyYW0gaW4gUEFUSCZxdW90Oyk7PGJyPg0KJmd0O8KgIMKg
IMKgLcKgIMKgIMKgIMKgIGdvdG8gb3V0Ozxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCB9PGJyPg0K
Jmd0O8KgIMKgIMKgLTxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBpZiAoIWdfdW5peF9vcGVuX3Bp
cGUoZGF0YWZkLCBGRF9DTE9FWEVDLCBOVUxMKSkgezxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDC
oCDCoCBlcnJvcl9zZXRnKGVycnAsICZxdW90O2Nhbm5vdCBjcmVhdGUgcGlwZSBGRHMmcXVvdDsp
Ozxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCBnb3RvIG91dDs8YnI+DQomZ3Q7wqAgwqAg
wqAtwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoC08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgcGlk
ID0gZm9yaygpOzxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBpZiAocGlkID09IDApIHs8YnI+DQom
Z3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgY2xvc2UoZGF0YWZkWzFdKTs8YnI+DQomZ3Q7wqAgwqAg
wqAtwqAgwqAgwqAgwqAgLyogY2hpbGQgKi88YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAg
c2V0c2lkKCk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIGR1cDIoZGF0YWZkWzBdLCAw
KTs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgcmVvcGVuX2ZkX3RvX251bGwoMSk7PGJy
Pg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIHJlb3Blbl9mZF90b19udWxsKDIpOzxicj4NCiZn
dDvCoCDCoCDCoC08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgaWYgKGNyeXB0ZWQpIHs8
YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgwqAgwqAgZXhlY2wocGFzc3dkX3BhdGgsICZx
dW90O2NocGFzc3dkJnF1b3Q7LCAmcXVvdDstZSZxdW90OywgTlVMTCk7PGJyPg0KJmd0O8KgIMKg
IMKgLcKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIMKg
IMKgIGV4ZWNsKHBhc3N3ZF9wYXRoLCAmcXVvdDtjaHBhc3N3ZCZxdW90OywgTlVMTCk7PGJyPg0K
Jmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAg
X2V4aXQoRVhJVF9GQUlMVVJFKTs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgfSBlbHNlIGlmIChw
aWQgJmx0OyAwKSB7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIGVycm9yX3NldGdfZXJy
bm8oZXJycCwgZXJybm8sICZxdW90O2ZhaWxlZCB0byBjcmVhdGUgY2hpbGQ8YnI+DQomZ3Q7wqAg
wqAgwqBwcm9jZXNzJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAgZ290byBv
dXQ7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgY2xv
c2UoZGF0YWZkWzBdKTs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgZGF0YWZkWzBdID0gLTE7PGJy
Pg0KJmd0O8KgIMKgIMKgLTxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBpZiAocWVtdV93cml0ZV9m
dWxsKGRhdGFmZFsxXSwgY2hwYXNzd2RkYXRhLCBjaHBhc3N3ZGxlbikgIT08YnI+DQomZ3Q7wqAg
wqAgwqBjaHBhc3N3ZGxlbikgezxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCBlcnJvcl9z
ZXRnX2Vycm5vKGVycnAsIGVycm5vLCAmcXVvdDtjYW5ub3Qgd3JpdGUgbmV3IGFjY291bnQ8YnI+
DQomZ3Q7wqAgwqAgwqBwYXNzd29yZCZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKg
IMKgIGdvdG8gb3V0Ozxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKg
LcKgIMKgIGNsb3NlKGRhdGFmZFsxXSk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGRhdGFmZFsx
XSA9IC0xOzxicj4NCiZndDvCoCDCoCDCoC08YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgZ2Ffd2Fp
dF9jaGlsZChwaWQsICZhbXA7c3RhdHVzLCAmYW1wO2xvY2FsX2Vycik7PGJyPg0KJmd0O8KgIMKg
IMKgLcKgIMKgIGlmIChsb2NhbF9lcnIpIHs8YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgwqAgwqAg
ZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKg
IMKgIMKgIGdvdG8gb3V0Ozxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCB9PGJyPg0KJmd0O8KgIMKg
IMKgLTxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBpZiAoIVdJRkVYSVRFRChzdGF0dXMpKSB7PGJy
Pg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7Y2hpbGQg
cHJvY2VzcyBoYXMgdGVybWluYXRlZCBhYm5vcm1hbGx5JnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAg
wqAtwqAgwqAgwqAgwqAgZ290byBvdXQ7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIH08YnI+DQom
Z3Q7wqAgwqAgwqAtPGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIGlmIChXRVhJVFNUQVRVUyhzdGF0
dXMpKSB7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCwgJnF1
b3Q7Y2hpbGQgcHJvY2VzcyBoYXMgZmFpbGVkIHRvIHNldCB1c2VyPGJyPg0KJmd0O8KgIMKgIMKg
cGFzc3dvcmQmcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDCoCDCoCBnb3RvIG91dDs8
YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoC08YnI+DQomZ3Q7wqAg
wqAgwqAtb3V0Ojxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCBnX2ZyZWUoY2hwYXNzd2RkYXRhKTs8
YnI+DQomZ3Q7wqAgwqAgwqAtwqAgwqAgZ19mcmVlKHJhd3Bhc3N3ZGRhdGEpOzxicj4NCiZndDvC
oCDCoCDCoC3CoCDCoCBnX2ZyZWUocGFzc3dkX3BhdGgpOzxicj4NCiZndDvCoCDCoCDCoC3CoCDC
oCBpZiAoZGF0YWZkWzBdICE9IC0xKSB7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIMKgIMKgIGNs
b3NlKGRhdGFmZFswXSk7PGJyPg0KJmd0O8KgIMKgIMKgLcKgIMKgIH08YnI+DQomZ3Q7wqAgwqAg
wqAtwqAgwqAgaWYgKGRhdGFmZFsxXSAhPSAtMSkgezxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCDC
oCDCoCBjbG9zZShkYXRhZmRbMV0pOzxicj4NCiZndDvCoCDCoCDCoC3CoCDCoCB9PGJyPg0KJmd0
O8KgIMKgIMKgLX08YnI+DQomZ3Q7wqAgwqAgwqAtPGJyPg0KJmd0O8KgIMKgIMKgwqBzdGF0aWMg
dm9pZCBnYV9yZWFkX3N5c2ZzX2ZpbGUoaW50IGRpcmZkLCBjb25zdCBjaGFyICpwYXRobmFtZSw8
YnI+DQomZ3Q7wqAgwqAgwqBjaGFyICpidWYsPGJyPg0KJmd0O8KgIMKgIMKgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50IHNpemUsIEVycm9yICoqZXJy
cCk8YnI+DQomZ3Q7wqAgwqAgwqDCoHs8YnI+DQomZ3Q7wqAgwqAgwqBAQCAtMjc5Myw2ICsyNjg4
LDEyNCBAQCBHdWVzdE1lbW9yeUJsb2NrSW5mbzxicj4NCiZndDvCoCDCoCDCoCpxbXBfZ3Vlc3Rf
Z2V0X21lbW9yeV9ibG9ja19pbmZvKEVycm9yICoqZXJycCk8YnI+DQomZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgwqAjZW5kaWY8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgKyNpZiBkZWZpbmVkKF9f
bGludXhfXykgfHwgZGVmaW5lZChfX0ZyZWVCU0RfXyk8YnI+DQomZ3Q7wqAgwqAgwqArdm9pZCBx
bXBfZ3Vlc3Rfc2V0X3VzZXJfcGFzc3dvcmQoY29uc3QgY2hhciAqdXNlcm5hbWUsPGJyPg0KJmd0
O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29uc3QgY2hhciAqcGFzc3dvcmQsPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vbCBjcnlwdGVkLDxicj4NCiZn
dDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoEVycm9yICoqZXJycCk8YnI+DQomZ3Q7wqAgwqAgwqArezxicj4NCiZndDvCoCDCoCDCoCvC
oCDCoCBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgY2hh
ciAqcGFzc3dkX3BhdGggPSBOVUxMOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBwaWRfdCBwaWQ7
PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIGludCBzdGF0dXM7PGJyPg0KJmd0O8KgIMKgIMKgK8Kg
IMKgIGludCBkYXRhZmRbMl0gPSB7IC0xLCAtMSB9Ozxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBj
aGFyICpyYXdwYXNzd2RkYXRhID0gTlVMTDs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgc2l6ZV90
IHJhd3Bhc3N3ZGxlbjs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgY2hhciAqY2hwYXNzd2RkYXRh
ID0gTlVMTDs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgc2l6ZV90IGNocGFzc3dkbGVuOzxicj4N
CiZndDvCoCDCoCDCoCs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgcmF3cGFzc3dkZGF0YSA9IChj
aGFyICopcWJhc2U2NF9kZWNvZGUocGFzc3dvcmQsIC0xLDxicj4NCiZndDvCoCDCoCDCoCZhbXA7
cmF3cGFzc3dkbGVuLCBlcnJwKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgaWYgKCFyYXdwYXNz
d2RkYXRhKSB7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIHJldHVybjs8YnI+DQomZ3Q7
wqAgwqAgwqArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCByYXdwYXNzd2RkYXRhID0g
Z19yZW5ldyhjaGFyLCByYXdwYXNzd2RkYXRhLCByYXdwYXNzd2RsZW4gKyAxKTs8YnI+DQomZ3Q7
wqAgwqAgwqArwqAgwqAgcmF3cGFzc3dkZGF0YVtyYXdwYXNzd2RsZW5dID0gJiMzOTtcMCYjMzk7
Ozxicj4NCiZndDvCoCDCoCDCoCs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgaWYgKHN0cmNocihy
YXdwYXNzd2RkYXRhLCAmIzM5O1xuJiMzOTspKSB7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKg
IMKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7Zm9yYmlkZGVuIGNoYXJhY3RlcnMgaW4gcmF3IHBh
c3N3b3JkJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZ290byBvdXQ7PGJy
Pg0KJmd0O8KgIMKgIMKgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqArPGJyPg0KJmd0O8KgIMKg
IMKgK8KgIMKgIGlmIChzdHJjaHIodXNlcm5hbWUsICYjMzk7XG4mIzM5OykgfHw8YnI+DQomZ3Q7
wqAgwqAgwqArwqAgwqAgwqAgwqAgc3RyY2hyKHVzZXJuYW1lLCAmIzM5OzomIzM5OykpIHs8YnI+
DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZXJyb3Jfc2V0ZyhlcnJwLCAmcXVvdDtmb3JiaWRk
ZW4gY2hhcmFjdGVycyBpbiB1c2VybmFtZSZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKg
IMKgIMKgIGdvdG8gb3V0Ozxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCB9PGJyPg0KJmd0O8KgIMKg
IMKgKzxicj4NCiZndDvCoCDCoCDCoCsjaWZkZWYgX19GcmVlQlNEX188YnI+DQomZ3Q7wqAgwqAg
wqArwqAgwqAgY2hwYXNzd2RkYXRhID0gZ19zdHJkdXAocmF3cGFzc3dkZGF0YSk7PGJyPg0KJmd0
O8KgIMKgIMKgK8KgIMKgIHBhc3N3ZF9wYXRoID0gZ19maW5kX3Byb2dyYW1faW5fcGF0aCgmcXVv
dDtwdyZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgKyNlbHNlPGJyPg0KJmd0O8KgIMKgIMKgK8Kg
IMKgIGNocGFzc3dkZGF0YSA9IGdfc3RyZHVwX3ByaW50ZigmcXVvdDslczolc1xuJnF1b3Q7LCB1
c2VybmFtZSw8YnI+DQomZ3Q7wqAgwqAgwqByYXdwYXNzd2RkYXRhKTs8YnI+DQomZ3Q7wqAgwqAg
wqArwqAgwqAgcGFzc3dkX3BhdGggPSBnX2ZpbmRfcHJvZ3JhbV9pbl9wYXRoKCZxdW90O2NocGFz
c3dkJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqArI2VuZGlmPGJyPg0KJmd0O8KgIMKgIMKgKzxi
cj4NCiZndDvCoCDCoCDCoCvCoCDCoCBjaHBhc3N3ZGxlbiA9IHN0cmxlbihjaHBhc3N3ZGRhdGEp
Ozxicj4NCiZndDvCoCDCoCDCoCs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgaWYgKCFwYXNzd2Rf
cGF0aCkgezxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCBlcnJvcl9zZXRnKGVycnAsICZx
dW90O2Nhbm5vdCBmaW5kICYjMzk7cGFzc3dkJiMzOTsgcHJvZ3JhbSBpbiBQQVRIJnF1b3Q7KTs8
YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZ290byBvdXQ7PGJyPg0KJmd0O8KgIMKgIMKg
K8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqArPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIGlmICgh
Z191bml4X29wZW5fcGlwZShkYXRhZmQsIEZEX0NMT0VYRUMsIE5VTEwpKSB7PGJyPg0KJmd0O8Kg
IMKgIMKgK8KgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7Y2Fubm90IGNyZWF0ZSBw
aXBlIEZEcyZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGdvdG8gb3V0Ozxi
cj4NCiZndDvCoCDCoCDCoCvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgKzxicj4NCiZndDvCoCDC
oCDCoCvCoCDCoCBwaWQgPSBmb3JrKCk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIGlmIChwaWQg
PT0gMCkgezxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCBjbG9zZShkYXRhZmRbMV0pOzxi
cj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCAvKiBjaGlsZCAqLzxicj4NCiZndDvCoCDCoCDC
oCvCoCDCoCDCoCDCoCBzZXRzaWQoKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZHVw
MihkYXRhZmRbMF0sIDApOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCByZW9wZW5fZmRf
dG9fbnVsbCgxKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgcmVvcGVuX2ZkX3RvX251
bGwoMik7PGJyPg0KJmd0O8KgIMKgIMKgKzxicj4NCiZndDvCoCDCoCDCoCsjaWZkZWYgX19GcmVl
QlNEX188YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgY29uc3QgY2hhciAqaF9hcmc7PGJy
Pg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGhfYXJnID0gKGNyeXB0ZWQpID8gJnF1b3Q7LUgm
cXVvdDsgOiAmcXVvdDstaCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZXhl
Y2wocGFzc3dkX3BhdGgsICZxdW90O3B3JnF1b3Q7LCAmcXVvdDt1c2VybW9kJnF1b3Q7LCAmcXVv
dDstbiZxdW90OywgdXNlcm5hbWUsPGJyPg0KJmd0O8KgIMKgIMKgaF9hcmcsICZxdW90OzAmcXVv
dDssIE5VTEwpOzxicj4NCiZndDvCoCDCoCDCoCsjZWxzZTxicj4NCiZndDvCoCDCoCDCoCvCoCDC
oCDCoCDCoCBpZiAoY3J5cHRlZCkgezxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDC
oCBleGVjbChwYXNzd2RfcGF0aCwgJnF1b3Q7Y2hwYXNzd2QmcXVvdDssICZxdW90Oy1lJnF1b3Q7
LCBOVUxMKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7
wqAgwqAgwqArwqAgwqAgwqAgwqAgwqAgwqAgZXhlY2wocGFzc3dkX3BhdGgsICZxdW90O2NocGFz
c3dkJnF1b3Q7LCBOVUxMKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgfTxicj4NCiZn
dDvCoCDCoCDCoCsjZW5kaWY8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgX2V4aXQoRVhJ
VF9GQUlMVVJFKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgfSBlbHNlIGlmIChwaWQgJmx0OyAw
KSB7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGVycm9yX3NldGdfZXJybm8oZXJycCwg
ZXJybm8sICZxdW90O2ZhaWxlZCB0byBjcmVhdGUgY2hpbGQ8YnI+DQomZ3Q7wqAgwqAgwqBwcm9j
ZXNzJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZ290byBvdXQ7PGJyPg0K
Jmd0O8KgIMKgIMKgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgY2xvc2UoZGF0YWZk
WzBdKTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgZGF0YWZkWzBdID0gLTE7PGJyPg0KJmd0O8Kg
IMKgIMKgKzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBpZiAocWVtdV93cml0ZV9mdWxsKGRhdGFm
ZFsxXSwgY2hwYXNzd2RkYXRhLCBjaHBhc3N3ZGxlbikgIT08YnI+DQomZ3Q7wqAgwqAgwqBjaHBh
c3N3ZGxlbikgezxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCBlcnJvcl9zZXRnX2Vycm5v
KGVycnAsIGVycm5vLCAmcXVvdDtjYW5ub3Qgd3JpdGUgbmV3IGFjY291bnQ8YnI+DQomZ3Q7wqAg
wqAgwqBwYXNzd29yZCZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGdvdG8g
b3V0Ozxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIGNs
b3NlKGRhdGFmZFsxXSk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIGRhdGFmZFsxXSA9IC0xOzxi
cj4NCiZndDvCoCDCoCDCoCs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgZ2Ffd2FpdF9jaGlsZChw
aWQsICZhbXA7c3RhdHVzLCAmYW1wO2xvY2FsX2Vycik7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKg
IGlmIChsb2NhbF9lcnIpIHs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAgwqAgwqAgZXJyb3JfcHJv
cGFnYXRlKGVycnAsIGxvY2FsX2Vycik7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGdv
dG8gb3V0Ozxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgKzxicj4N
CiZndDvCoCDCoCDCoCvCoCDCoCBpZiAoIVdJRkVYSVRFRChzdGF0dXMpKSB7PGJyPg0KJmd0O8Kg
IMKgIMKgK8KgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7Y2hpbGQgcHJvY2VzcyBo
YXMgdGVybWluYXRlZCBhYm5vcm1hbGx5JnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAg
wqAgwqAgZ290byBvdXQ7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAg
wqArPGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIGlmIChXRVhJVFNUQVRVUyhzdGF0dXMpKSB7PGJy
Pg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCwgJnF1b3Q7Y2hpbGQg
cHJvY2VzcyBoYXMgZmFpbGVkIHRvIHNldCB1c2VyPGJyPg0KJmd0O8KgIMKgIMKgcGFzc3dvcmQm
cXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCBnb3RvIG91dDs8YnI+DQomZ3Q7
wqAgwqAgwqArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCs8YnI+DQomZ3Q7wqAgwqAgwqArb3V0
Ojxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBnX2ZyZWUoY2hwYXNzd2RkYXRhKTs8YnI+DQomZ3Q7
wqAgwqAgwqArwqAgwqAgZ19mcmVlKHJhd3Bhc3N3ZGRhdGEpOzxicj4NCiZndDvCoCDCoCDCoCvC
oCDCoCBnX2ZyZWUocGFzc3dkX3BhdGgpOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCBpZiAoZGF0
YWZkWzBdICE9IC0xKSB7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIMKgIMKgIGNsb3NlKGRhdGFm
ZFswXSk7PGJyPg0KJmd0O8KgIMKgIMKgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqArwqAgwqAg
aWYgKGRhdGFmZFsxXSAhPSAtMSkgezxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCDCoCDCoCBjbG9z
ZShkYXRhZmRbMV0pOzxicj4NCiZndDvCoCDCoCDCoCvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKg
K308YnI+DQomZ3Q7wqAgwqAgwqArI2VuZGlmPGJyPg0KJmd0O8KgIMKgIMKgKzxicj4NCiZndDvC
oCDCoCDCoMKgI2lmZGVmIEhBVkVfR0VUSUZBRERSUzxicj4NCiZndDvCoCDCoCDCoMKgc3RhdGlj
IEd1ZXN0TmV0d29ya0ludGVyZmFjZSAqPGJyPg0KJmd0O8KgIMKgIMKgwqBndWVzdF9maW5kX2lu
dGVyZmFjZShHdWVzdE5ldHdvcmtJbnRlcmZhY2VMaXN0ICpoZWFkLDxicj4NCiZndDvCoCDCoCDC
oC0tIDxicj4NCiZndDvCoCDCoCDCoDIuMzQuMTxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0
Ozxicj4NCiZndDs8YnI+DQomZ3Q7IC0tIDxicj4NCiZndDsgTWFyYy1BbmRyw6kgTHVyZWF1PGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPjxkaXYgZGly
PSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPk1hcmMtQW5kcsOpIEx1cmVhdTxicj48L2Rp
dj48L2Rpdj4NCg==
--0000000000001a549c05e9e0a956--

