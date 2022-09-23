Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D55E759F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:23:40 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdyE-000874-IO
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdkb-00019l-Cw
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:09:35 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:39549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdkZ-0004At-1C
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:09:33 -0400
Received: by mail-lf1-x12c.google.com with SMTP id a2so18575361lfb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yDqWD2az4EB+cgT85ODv5JPoQ5/ChlIAgJiw47e6/Os=;
 b=GjZ/hcqXcTHtS1EdvOGl+pc7+gMS1PY7AdRR3gBEUO/nBNt2as8BQmuYrFXkLVdxYK
 dqpwkEV9uuI7wUFcoK+eDwk/hOZckm7mPu6WiDjCPjVcD++CV8BPWqhDC5oxR57ssiEW
 v5k0zs0Tw1VEibdiQwTTMa8nIBiTkix5NHCZZ+UsrcOfqyvE4YDYAkxeClTctPSTUHII
 kdRX57vhGQncAjYLW35oszCOPxDf6Uw32KymCuvvJ/IbdxPXJ+zLZ3vcDyrc77mEX84j
 3hufnjW0SCJRzTU6mOMGuGjVrgbBaIb/XTrCVY/Y03zAnzRakuE6XDWzjNUd/FAcjzku
 dCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yDqWD2az4EB+cgT85ODv5JPoQ5/ChlIAgJiw47e6/Os=;
 b=Vs3zkAHgLzHTPKDh+uk24SWAwRazblZJ1VbXiET5HH1q2L8RxcGsEPNNMbmV8JubyN
 oA3/9dnWudaf3AlZrs8jdg1y1nUudc8txb3esKujXk9Pt83h3Okf9j3oeGFP7sNXH7Ry
 ltZygvtMt0uAiaeDMOFNnwW2vbiavY6nXq+N9VKaK+p1f23Ic4ewjiXAuQTSEp/K56rh
 ApYqjCom1eZQtcpSj8I+6CM5xSZ3qOOIt5c/hLWSvu6TZnMZUvg3XoyaFGF3k1N4OEWN
 ucLG4p1c3gV2tFu34I9tHcvdDcYUtr60a8zyamytK23jXYBxlP06q8gKdXV/QgpOb+1p
 l9mw==
X-Gm-Message-State: ACrzQf05fa1oGBrNu535YZt7Vo0FVO+hgLYG3uMFPzKOjx/8BXujGeAs
 EThWO4O/pxLi9ucsDBuxErXqC4nsFV2/72drvGU=
X-Google-Smtp-Source: AMsMyM58/hTfRfFUW43QTl08T7cwCLHricNMv0Fi1u+/Q3fTheshbFahXYvZHg9hSD9W1h4o8vUpRdMVnIvsBQ0k9YI=
X-Received: by 2002:a05:6512:3ca0:b0:49f:f620:b826 with SMTP id
 h32-20020a0565123ca000b0049ff620b826mr3081212lfv.375.1663920569208; Fri, 23
 Sep 2022 01:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-4-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220922132001.940334-4-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 10:09:17 +0200
Message-ID: <CAJ+F1C+LsQj9MXfMmDihg16wyzzyW_UgTCZa5Y0ig-9zZ99XpA@mail.gmail.com>
Subject: Re: [PATCH 3/5] qga: Add UFS freeze/thaw support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="0000000000007654c105e953b256"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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

--0000000000007654c105e953b256
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 22, 2022 at 4:15 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
> Freezed FS can be thawed by closing /dev/ufssuspend file descriptior.
>
> Use getmntinfo to get a list of mounted FS.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-bsd.c    | 109 +++++++++++++++++++++++++++++++++++++++---
>  qga/commands-common.h |  11 +++++
>  qga/main.c            |   6 +++
>  3 files changed, 120 insertions(+), 6 deletions(-)
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> index c1e3ed13e9..5d3f46804a 100644
> --- a/qga/commands-bsd.c
> +++ b/qga/commands-bsd.c
> @@ -17,28 +17,125 @@
>  #include "qemu/queue.h"
>  #include "commands-common.h"
>
> +#include <sys/ioctl.h>
> +#include <sys/param.h>
> +#include <sys/ucred.h>
> +#include <sys/mount.h>
> +#include <paths.h>
> +
>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>  bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>  {
> -    error_setg(errp, QERR_UNSUPPORTED);
> -    return false;
> +    FsMount *mount;
> +    struct statfs *mntbuf, *mntp;
> +    struct stat statbuf;
> +    int i, count, ret;
> +
> +    count =3D getmntinfo(&mntbuf, MNT_NOWAIT);
> +    if (count =3D=3D 0) {
> +        error_setg_errno(errp, errno, "getmntinfo failed");
> +        return false;
> +    }
> +
> +    for (i =3D 0; i < count; i++) {
> +        mntp =3D &mntbuf[i];
> +        ret =3D stat(mntp->f_mntonname, &statbuf);
> +        if (ret !=3D 0) {
>

I am not sure we can simply ignore an error here. At least, there should be
a warning logged, no?


> +            continue;
> +        }
> +
> +        mount =3D g_new0(FsMount, 1);
> +
> +        mount->dirname =3D g_strdup(mntp->f_mntonname);
> +        mount->devtype =3D g_strdup(mntp->f_fstypename);
> +        mount->devmajor =3D major(mount->dev);
> +        mount->devminor =3D minor(mount->dev);
> +        mount->fsid =3D mntp->f_fsid;
> +        mount->dev =3D statbuf.st_dev;
> +
> +        QTAILQ_INSERT_TAIL(mounts, mount, next);
> +    }
> +    return true;
>  }
>  #endif
>
>  #if defined(CONFIG_FSFREEZE)
> +static int ufssuspend_fd =3D -1;
> +static int ufssuspend_cnt;
> +
>  int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>                                            strList *mountpoints,
>                                            FsMountList mounts,
>                                            Error **errp)
>  {
> -    error_setg(errp, QERR_UNSUPPORTED);
> -    return 0;
> +    int ret;
> +    strList *list;
> +    struct FsMount *mount;
> +
> +    if (ufssuspend_fd !=3D -1) {
> +        error_setg(errp, "filesystems have already frozen");
> +        return -1;
> +    }
> +
> +    ufssuspend_cnt =3D 0;
> +    ufssuspend_fd =3D qemu_open(_PATH_UFSSUSPEND, O_RDWR, errp);
> +    if (ufssuspend_fd =3D=3D -1) {
> +        return -1;
> +    }
> +
> +    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
> +        /*
> +         * To issue fsfreeze in the reverse order of mounts, check if th=
e
> +         * mount is listed in the list here
> +         */
> +        if (has_mountpoints) {
> +            for (list =3D mountpoints; list; list =3D list->next) {
> +                if (strcmp(list->value, mount->dirname) =3D=3D 0) {
>

nit: I prefer g_str_equal()


> +                    break;
> +                }
> +            }
> +            if (!list) {
> +                continue;
> +            }
> +        }
> +
> +        /* Only UFS supports suspend */
> +        if (strcmp(mount->devtype, "ufs") !=3D 0) {
>

!g_str_equal()


> +            continue;
> +        }
> +
> +        ret =3D ioctl(ufssuspend_fd, UFSSUSPEND, &mount->fsid);
> +        if (ret =3D=3D -1) {
> +            /*
> +             * ioctl returns EBUSY for all the FS except the first one
> +             * that was suspended
> +             */
> +            if (errno =3D=3D EBUSY) {
> +                continue;
> +            }
> +            error_setg_errno(errp, errno, "failed to freeze %s",
> +                             mount->dirname);
> +            goto error;
> +        }
> +        ufssuspend_cnt++;
> +    }
> +    return ufssuspend_cnt;
> +error:
> +    close(ufssuspend_fd);
> +    ufssuspend_fd =3D -1;
> +    return -1;
> +
>  }
>
>  int qmp_guest_fsfreeze_do_thaw(Error **errp)
>  {
> -    error_setg(errp, QERR_UNSUPPORTED);
> -    return 0;
> +    int ret =3D ufssuspend_cnt;
> +    ufssuspend_cnt =3D 0;
> +    if (ufssuspend_fd !=3D -1) {
> +        close(ufssuspend_fd);
> +        ufssuspend_fd =3D -1;
> +    }
>

Maybe leave a comment that UFSRESUME isn't necessary?


> +    return ret;
>  }
>  #endif
>
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index aa0472ea4c..c3be6db3a9 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -41,11 +41,22 @@ void ga_wait_child(pid_t pid, int *status, Error
> **errp);
>  #endif
>  #endif /* __linux__*/
>
> +#ifdef __FreeBSD__
> +#include <ufs/ffs/fs.h>
> +#ifdef UFSSUSPEND
> +#define CONFIG_FSFREEZE
> +#endif
> +#endif /* __FreeBSD__ */
> +
>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>  typedef struct FsMount {
>      char *dirname;
>      char *devtype;
>      unsigned int devmajor, devminor;
> +#if defined(__FreeBSD__)
> +    dev_t dev;
> +    fsid_t fsid;
> +#endif
>      QTAILQ_ENTRY(FsMount) next;
>  } FsMount;
>
> diff --git a/qga/main.c b/qga/main.c
> index 22b3c0df11..ab420051fb 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -43,6 +43,12 @@
>  #define CONFIG_FSFREEZE
>  #endif
>  #endif
> +#ifdef __FreeBSD__
> +#include <ufs/ffs/fs.h>
> +#ifdef UFSSUSPEND
> +#define CONFIG_FSFREEZE
> +#endif
> +#endif
>
>  #ifndef _WIN32
>  #ifdef __FreeBSD__
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007654c105e953b256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 4:15 PM Ale=
xander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexand=
er.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">UFS supports FS freezing through ioctl UFSSUSPEND on=
 /dev/ufssuspend.<br>
Freezed FS can be thawed by closing /dev/ufssuspend file descriptior.<br>
<br>
Use getmntinfo to get a list of mounted FS.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 | 109 +++++++++++++++++++++++++++++++=
++++++++---<br>
=C2=A0qga/commands-common.h |=C2=A0 11 +++++<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +=
++<br>
=C2=A03 files changed, 120 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index c1e3ed13e9..5d3f46804a 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -17,28 +17,125 @@<br>
=C2=A0#include &quot;qemu/queue.h&quot;<br>
=C2=A0#include &quot;commands-common.h&quot;<br>
<br>
+#include &lt;sys/ioctl.h&gt;<br>
+#include &lt;sys/param.h&gt;<br>
+#include &lt;sys/ucred.h&gt;<br>
+#include &lt;sys/mount.h&gt;<br>
+#include &lt;paths.h&gt;<br>
+<br>
=C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
=C2=A0bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-=C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 FsMount *mount;<br>
+=C2=A0 =C2=A0 struct statfs *mntbuf, *mntp;<br>
+=C2=A0 =C2=A0 struct stat statbuf;<br>
+=C2=A0 =C2=A0 int i, count, ret;<br>
+<br>
+=C2=A0 =C2=A0 count =3D getmntinfo(&amp;mntbuf, MNT_NOWAIT);<br>
+=C2=A0 =C2=A0 if (count =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;getmntinfo=
 failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; count; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mntp =3D &amp;mntbuf[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D stat(mntp-&gt;f_mntonname, &amp;statbu=
f);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br></blockquote><div><br></d=
iv><div>I am not sure we can simply ignore an error here. At least, there s=
hould be a warning logged, no?<br></div><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(mntp-&gt;f_mnto=
nname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(mntp-&gt;f_fsty=
pename);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D major(mount-&gt;dev);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D minor(mount-&gt;dev);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;fsid =3D mntp-&gt;f_fsid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dev =3D statbuf.st_dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return true;<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
=C2=A0#if defined(CONFIG_FSFREEZE)<br>
+static int ufssuspend_fd =3D -1;<br>
+static int ufssuspend_cnt;<br>
+<br>
=C2=A0int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0strList *mountpoints,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0FsMountList mounts,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 strList *list;<br>
+=C2=A0 =C2=A0 struct FsMount *mount;<br>
+<br>
+=C2=A0 =C2=A0 if (ufssuspend_fd !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;filesystems have alread=
y frozen&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ufssuspend_cnt =3D 0;<br>
+=C2=A0 =C2=A0 ufssuspend_fd =3D qemu_open(_PATH_UFSSUSPEND, O_RDWR, errp);=
<br>
+=C2=A0 =C2=A0 if (ufssuspend_fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* To issue fsfreeze in the reverse order=
 of mounts, check if the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mount is listed in the list here<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_mountpoints) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (list =3D mountpoints; list;=
 list =3D list-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(list-&g=
t;value, mount-&gt;dirname) =3D=3D 0) {<br></blockquote><div><br></div><div=
>nit: I prefer g_str_equal()</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!list) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only UFS supports suspend */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(mount-&gt;devtype, &quot;ufs&quot;)=
 !=3D 0) {<br></blockquote><div><br></div><div>!g_str_equal()</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(ufssuspend_fd, UFSSUSPEND, &amp;=
mount-&gt;fsid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ioctl returns EBUSY for =
all the FS except the first one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* that was suspended<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D EBUSY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;failed to freeze %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount-&gt;dirname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ufssuspend_cnt++;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ufssuspend_cnt;<br>
+error:<br>
+=C2=A0 =C2=A0 close(ufssuspend_fd);<br>
+=C2=A0 =C2=A0 ufssuspend_fd =3D -1;<br>
+=C2=A0 =C2=A0 return -1;<br>
+<br>
=C2=A0}<br>
<br>
=C2=A0int qmp_guest_fsfreeze_do_thaw(Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 int ret =3D ufssuspend_cnt;<br>
+=C2=A0 =C2=A0 ufssuspend_cnt =3D 0;<br>
+=C2=A0 =C2=A0 if (ufssuspend_fd !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ufssuspend_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ufssuspend_fd =3D -1;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Maybe leave a comment =
that UFSRESUME isn&#39;t necessary?</div><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index aa0472ea4c..c3be6db3a9 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -41,11 +41,22 @@ void ga_wait_child(pid_t pid, int *status, Error **errp=
);<br>
=C2=A0#endif<br>
=C2=A0#endif /* __linux__*/<br>
<br>
+#ifdef __FreeBSD__<br>
+#include &lt;ufs/ffs/fs.h&gt;<br>
+#ifdef UFSSUSPEND<br>
+#define CONFIG_FSFREEZE<br>
+#endif<br>
+#endif /* __FreeBSD__ */<br>
+<br>
=C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
=C2=A0typedef struct FsMount {<br>
=C2=A0 =C2=A0 =C2=A0char *dirname;<br>
=C2=A0 =C2=A0 =C2=A0char *devtype;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int devmajor, devminor;<br>
+#if defined(__FreeBSD__)<br>
+=C2=A0 =C2=A0 dev_t dev;<br>
+=C2=A0 =C2=A0 fsid_t fsid;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(FsMount) next;<br>
=C2=A0} FsMount;<br>
<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 22b3c0df11..ab420051fb 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -43,6 +43,12 @@<br>
=C2=A0#define CONFIG_FSFREEZE<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
+#ifdef __FreeBSD__<br>
+#include &lt;ufs/ffs/fs.h&gt;<br>
+#ifdef UFSSUSPEND<br>
+#define CONFIG_FSFREEZE<br>
+#endif<br>
+#endif<br>
<br>
=C2=A0#ifndef _WIN32<br>
=C2=A0#ifdef __FreeBSD__<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007654c105e953b256--

