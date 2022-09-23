Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F585E7551
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:01:41 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdcy-0006nR-Uw
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdY9-0004fw-L9
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:56:46 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdY6-0000jh-Lg
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:56:41 -0400
Received: by mail-lf1-x134.google.com with SMTP id a2so18530714lfb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8Cw6ur75FqaL1SR7V/tODuwdtVfrq0NUaP2fjI8ckv0=;
 b=p4kkLl+WXAoakIwLO+LHQF8G9bq6lVH3tHSYJLkV3G977ssDfxpbppQFKKguIM3XY5
 KNoPRFC2nj9Io7KjoySmmjXCsv4WvAMzudxEneD17yVuJ/Ha/T4gO8fegO57Jmtz7+gF
 WHDv5xPU4zusnS6mHYxiTUK/gZqHeyFOSjycMfadl/NOz5WfWrxVq0BXyDWv2iwXsK6A
 P4Kv89kjZpfJpD2khR89dBYpnBUn4Z+n2wlTcD4+lN2HZ0NOzhFtM6VG5QQGmZ4AT66h
 cf+Ub1T7dAhcR3XbxzqCjvF1a1S7g8ZLp4ZCrl99efclpBGhluAwz07y1/+gzCvfCokp
 N+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8Cw6ur75FqaL1SR7V/tODuwdtVfrq0NUaP2fjI8ckv0=;
 b=RP78HHqd7I+pGqtzv/Vq942xl5sFXMBP6UfRp4GlNxX2qYTOG87bzJ0MNuX0SwFF+Y
 4Ug+xGcUi0j0eAx1DBsmgrzyU9vyKq2+nK/Um3JzhkDlkyuSv2H0DXSVHXWINOl+92h4
 CFBt+IYxTtQ97wcyK5MtKEnahWO36MJtLYgfW0RReK9KnN+4oLsPqHgyyUXwrdUZLbEz
 DQbhUO71O18wocNzGtbV/jUE49C0UD9DT0cXJ5TZqjbFv3PWMAXeXsrDw6ghYwxOUSkt
 XnSfS1LYPq83Y8FUUMDWCtbc91e90fCYY17hhwhKhlAJxpse9lwx0D+Xd6m+HvPkqkkT
 mq/A==
X-Gm-Message-State: ACrzQf1B82mwgKDsgUW0vtXIY6QzbV26c7FQ6P9ExkCgN/3cGJWBZVNp
 pf2oOnUgd9ZyiaVfsnhCz13Lf9carBeeDt0pIB8=
X-Google-Smtp-Source: AMsMyM4H0vaKJMCv/+O0hliBqG/LMvBaKcBHxHVjdyPyoL860PT0bbmO42IypEBZDhboMBfuTGKSa67ZIuZF2PeEFoI=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr2831304lff.329.1663919795994; Fri, 23
 Sep 2022 00:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-3-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220922132001.940334-3-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 09:56:24 +0200
Message-ID: <CAJ+F1C+Hf2TUjFVf1tJdH7r+mepgFqD9pVQPQXebnK7YQ4DpRw@mail.gmail.com>
Subject: Re: [PATCH 2/5] qga: Add initial FreeBSD support
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="00000000000060053e05e95384f7"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

--00000000000060053e05e95384f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 22, 2022 at 4:28 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Add commands-bsd.c file with dumb functions, fix device path and make
> the code buildable in FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  meson.build          |   2 +-
>  qga/commands-bsd.c   | 121 +++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-posix.c |   6 ++-
>  qga/main.c           |  11 +++-
>  qga/meson.build      |   3 ++
>  5 files changed, 140 insertions(+), 3 deletions(-)
>  create mode 100644 qga/commands-bsd.c
>
> diff --git a/meson.build b/meson.build
> index c2adb7caf4..574cc1e91e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -75,7 +75,7 @@ have_tools =3D get_option('tools') \
>    .allowed()
>  have_ga =3D get_option('guest_agent') \
>    .disable_auto_if(not have_system and not have_tools) \
> -  .require(targetos in ['sunos', 'linux', 'windows'],
> +  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
>             error_message: 'unsupported OS for QEMU guest agent') \
>    .allowed()
>  have_block =3D have_system or have_tools
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> new file mode 100644
> index 0000000000..c1e3ed13e9
> --- /dev/null
> +++ b/qga/commands-bsd.c
> @@ -0,0 +1,121 @@
> +/*
> + * QEMU Guest Agent BSD-specific command implementations
> + *
> + * Copyright (c) Virtuozzo International GmbH.
> + *
> + * Authors:
> + *  Alexander Ivanov  <alexander.ivanov@virtuozzo.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qga-qapi-commands.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/error.h"
> +#include "qemu/queue.h"
> +#include "commands-common.h"
> +
> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return false;
> +}
> +#endif
> +
> +#if defined(CONFIG_FSFREEZE)
> +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
> +                                          strList *mountpoints,
> +                                          FsMountList mounts,
> +                                          Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return 0;
> +}
> +
> +int qmp_guest_fsfreeze_do_thaw(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return 0;
> +}
> +#endif
> +
> +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +void qmp_guest_suspend_disk(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +}
> +
> +void qmp_guest_suspend_ram(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +}
> +
> +void qmp_guest_suspend_hybrid(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +}
> +
> +GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error
> **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return -1;
> +}
> +
> +void qmp_guest_set_user_password(const char *username,
> +                                 const char *password,
> +                                 bool crypted,
> +                                 Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +}
> +
> +GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +GuestMemoryBlockResponseList *
> +qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp=
)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0bb8b9e2f3..3a1055d5c3 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -31,6 +31,10 @@
>  #include <utmpx.h>
>  #endif
>
> +#ifdef __FreeBSD__
> +#undef HAVE_GETIFADDRS
> +#endif
>

Why? leave a comment in code please (or in commit message if it's solved
later in the series)


> +
>  #ifdef HAVE_GETIFADDRS
>  #include <arpa/inet.h>
>  #include <sys/socket.h>
> @@ -763,7 +767,7 @@ void qmp_guest_file_flush(int64_t handle, Error **err=
p)
>      }
>  }
>
> -#if !defined(__linux__)
> +#if !(defined(__linux__) || defined(__FreeBSD__))
>
>  void qmp_guest_suspend_disk(Error **errp)
>  {
> diff --git a/qga/main.c b/qga/main.c
> index 5f1efa2333..22b3c0df11 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -45,9 +45,14 @@
>  #endif
>
>  #ifndef _WIN32
> +#ifdef __FreeBSD__
> +#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
> +#define QGA_SERIAL_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
>

The same path for serial and virtio?


> +#else /* __FreeBSD__ */
>  #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.=
0"
> -#define QGA_STATE_RELATIVE_DIR  "run"
>  #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
> +#endif /* __FreeBSD__ */
> +#define QGA_STATE_RELATIVE_DIR  "run"
>  #else
>  #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
>  #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
> @@ -1475,7 +1480,11 @@ int main(int argc, char **argv)
>      }
>
>      if (config->method =3D=3D NULL) {
> +#ifdef CONFIG_BSD
> +        config->method =3D g_strdup("isa-serial");
>

Why is isa serial the default ?


> +#else
>          config->method =3D g_strdup("virtio-serial");
> +#endif
>      }
>
>      socket_activation =3D check_socket_activation();
> diff --git a/qga/meson.build b/qga/meson.build
> index 409f49a000..456ba4c29f 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -75,6 +75,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
>  qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
>    'commands-linux.c',
>  ))
> +qga_ss.add(when: 'CONFIG_BSD', if_true: files(
> +  'commands-bsd.c',
> +))
>  qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
>    'channel-win32.c',
>    'commands-win32.c',
> --
> 2.34.1
>
>
>
otherwise, lgtm

--=20
Marc-Andr=C3=A9 Lureau

--00000000000060053e05e95384f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 4:28 PM Ale=
xander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexand=
er.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Add commands-bsd.c file with dumb functions, fix dev=
ice path and make<br>
the code buildable in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0| 121 ++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qga/commands-posix.c |=C2=A0 =C2=A06 ++-<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +++-<br=
>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 ++<br>
=C2=A05 files changed, 140 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 qga/commands-bsd.c<br>
<br>
diff --git a/meson.build b/meson.build<br>
index c2adb7caf4..574cc1e91e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -75,7 +75,7 @@ have_tools =3D get_option(&#39;tools&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0have_ga =3D get_option(&#39;guest_agent&#39;) \<br>
=C2=A0 =C2=A0.disable_auto_if(not have_system and not have_tools) \<br>
-=C2=A0 .require(targetos in [&#39;sunos&#39;, &#39;linux&#39;, &#39;window=
s&#39;],<br>
+=C2=A0 .require(targetos in [&#39;sunos&#39;, &#39;linux&#39;, &#39;window=
s&#39;, &#39;freebsd&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;unsupported O=
S for QEMU guest agent&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0have_block =3D have_system or have_tools<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
new file mode 100644<br>
index 0000000000..c1e3ed13e9<br>
--- /dev/null<br>
+++ b/qga/commands-bsd.c<br>
@@ -0,0 +1,121 @@<br>
+/*<br>
+ * QEMU Guest Agent BSD-specific command implementations<br>
+ *<br>
+ * Copyright (c) Virtuozzo International GmbH.<br>
+ *<br>
+ * Authors:<br>
+ *=C2=A0 Alexander Ivanov=C2=A0 &lt;<a href=3D"mailto:alexander.ivanov@vir=
tuozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qga-qapi-commands.h&quot;<br>
+#include &quot;qapi/qmp/qerror.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/queue.h&quot;<br>
+#include &quot;commands-common.h&quot;<br>
+<br>
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+#endif<br>
+<br>
+#if defined(CONFIG_FSFREEZE)<br>
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
trList *mountpoints,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F=
sMountList mounts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
rror **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+int qmp_guest_fsfreeze_do_thaw(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+#endif<br>
+<br>
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+void qmp_guest_suspend_disk(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+}<br>
+<br>
+void qmp_guest_suspend_ram(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+}<br>
+<br>
+void qmp_guest_suspend_hybrid(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+}<br>
+<br>
+GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp=
)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
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
+<br>
+GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestMemoryBlockResponseList *<br>
+qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)<=
br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 0bb8b9e2f3..3a1055d5c3 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -31,6 +31,10 @@<br>
=C2=A0#include &lt;utmpx.h&gt;<br>
=C2=A0#endif<br>
<br>
+#ifdef __FreeBSD__<br>
+#undef HAVE_GETIFADDRS<br>
+#endif<br></blockquote><div><br></div><div>Why? leave a comment in code pl=
ease (or in commit message if it&#39;s solved later in the series)<br></div=
><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
@@ -763,7 +767,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-#if !defined(__linux__)<br>
+#if !(defined(__linux__) || defined(__FreeBSD__))<br>
<br>
=C2=A0void qmp_guest_suspend_disk(Error **errp)<br>
=C2=A0{<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 5f1efa2333..22b3c0df11 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -45,9 +45,14 @@<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifndef _WIN32<br>
+#ifdef __FreeBSD__<br>
+#define QGA_VIRTIO_PATH_DEFAULT &quot;/dev/vtcon/org.qemu.guest_agent.0&qu=
ot;<br>
+#define QGA_SERIAL_PATH_DEFAULT &quot;/dev/vtcon/org.qemu.guest_agent.0&qu=
ot;<br></blockquote><div><br></div><div>The same path for serial and virtio=
?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+#else /* __FreeBSD__ */<br>
=C2=A0#define QGA_VIRTIO_PATH_DEFAULT &quot;/dev/virtio-ports/org.qemu.gues=
t_agent.0&quot;<br>
-#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;run&quot;<br>
=C2=A0#define QGA_SERIAL_PATH_DEFAULT &quot;/dev/ttyS0&quot;<br>
+#endif /* __FreeBSD__ */<br>
+#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;run&quot;<br>
=C2=A0#else<br>
=C2=A0#define QGA_VIRTIO_PATH_DEFAULT &quot;\\\\.\\Global\\org.qemu.guest_a=
gent.0&quot;<br>
=C2=A0#define QGA_STATE_RELATIVE_DIR=C2=A0 &quot;qemu-ga&quot;<br>
@@ -1475,7 +1480,11 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (config-&gt;method =3D=3D NULL) {<br>
+#ifdef CONFIG_BSD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;method =3D g_strdup(&quot;isa-seria=
l&quot;);<br></blockquote><div><br></div><div>Why is isa serial the default=
 ?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config-&gt;method =3D g_strdup(&quot;virt=
io-serial&quot;);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0socket_activation =3D check_socket_activation();<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 409f49a000..456ba4c29f 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -75,6 +75,9 @@ qga_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(<=
br>
=C2=A0qga_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;commands-linux.c&#39;,<br>
=C2=A0))<br>
+qga_ss.add(when: &#39;CONFIG_BSD&#39;, if_true: files(<br>
+=C2=A0 &#39;commands-bsd.c&#39;,<br>
+))<br>
=C2=A0qga_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;channel-win32.c&#39;,<br>
=C2=A0 =C2=A0&#39;commands-win32.c&#39;,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>otherwise, lgtm<br></div><br>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div>=
</div>

--00000000000060053e05e95384f7--

