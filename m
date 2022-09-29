Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62825EF572
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:28:06 +0200 (CEST)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odse5-000775-TS
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrj9-0006QT-Ae
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:16 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrj5-0007Kr-KD
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:29:14 -0400
Received: by mail-lj1-x231.google.com with SMTP id j24so1199076lja.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=q2ijR8kcT9weGYbN5DRDdl2utPdGEjNqyj+Pq6g5BmI=;
 b=Uhy38tVESlCssPyps1Ts/i4BX8kBKLOhveTXlO9pUO9fx3wrMVcVpfrlsWeyNnB9uv
 5DNUlziicsVYM7aZ3eE2jGyJqGWN06qcuT4X6/ncithASeYuB2qnrlMVnVKCnVeBZbOs
 YDEMs22aW9B1G/C0AbcUgkvLtsYsbryUlC8O9TpqnXv2OHmPrfIIEWxfncUs3+bKrfyl
 tlAeHN/b3iGRF3l4P08PWxpwV2a3TNBqztvXTUjG8WdJJTsMl/uDts3pVYpt2xaLaVyY
 +xSpigni93V9JObH3qcaBXVsIwh1YioCOcEuOYy4xG97/31U40bcuj/TTW3NfL/vsKO5
 jSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=q2ijR8kcT9weGYbN5DRDdl2utPdGEjNqyj+Pq6g5BmI=;
 b=0qNtAW2Msy2i2hIDZMZCfQzFqeR6Bp5ib5yM2LzOyNQlumgZydNci9WvxR02pna4xL
 bZxdTXvok06R+dB1tR1Wxqrd8OCDMwTwbQ6UnIfgfwwWwBpsX7ohIR6T6CfYGmFwO7oy
 iF3q38CcEfY3phKXsYTIiN2prLzzuz1jU01u+Nw2sLKYjKJgM+w0BwzHh7kGxmm+pp7l
 DRLkf9WtDTNdh+GvO99lsVw3p3LOf3s+Jf47gsI3JGqGrw+nCgIsXfHfnFTToKmgCCqa
 OktBrbrdxzW3pSV1P/Mv3holD8ntz1JPd8wYT4s3QuOHG6SNgnYyVzC4EA1ezq3mXQpK
 cyag==
X-Gm-Message-State: ACrzQf0COuelpaHB2SJO4+lz3rO0nq8pc81f89xg/oAwwjsP7++/bEO9
 clus+M8eilAAI6amc5PCJjdNee6PTTV4x4Uw1cY=
X-Google-Smtp-Source: AMsMyM4dqD+utQjBQvBEHSIhr3ZqgcSirWVZBddb2aHEpoEL999AizE9XD4FQIvH+4zRq+2iOpObURRUiTLY7118wNU=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr963884ljn.94.1664450949628; Thu, 29 Sep
 2022 04:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-4-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220929075239.1675374-4-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 15:28:55 +0400
Message-ID: <CAJ+F1CKLxzfJ=GwCcUD12CJALomjVkoxF-iLKqyWoi+QEUoD9g@mail.gmail.com>
Subject: Re: [PATCH 3/7] qga: Add UFS freeze/thaw support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="00000000000099459605e9cf2ffd"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
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

--00000000000099459605e9cf2ffd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 12:04 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
> Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.
>
> Use getmntinfo to get a list of mounted FS.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>

lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-bsd.c    | 169 +++++++++++++++++++++++
>  qga/commands-common.h |  11 ++
>  qga/commands-posix.c  | 308 ++++++++++++++++++++----------------------
>  qga/main.c            |   7 +-
>  qga/meson.build       |   3 +
>  5 files changed, 334 insertions(+), 164 deletions(-)
>  create mode 100644 qga/commands-bsd.c
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> new file mode 100644
> index 0000000000..ca06692179
> --- /dev/null
> +++ b/qga/commands-bsd.c
> @@ -0,0 +1,169 @@
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
> +#include <sys/ioctl.h>
> +#include <sys/param.h>
> +#include <sys/ucred.h>
> +#include <sys/mount.h>
> +#include <paths.h>
> +
> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
> +{
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
> +            error_setg_errno(errp, errno, "stat failed on %s",
> +                             mntp->f_mntonname);
> +            return false;
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
> +}
> +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
> +
> +#if defined(CONFIG_FSFREEZE)
> +static int ufssuspend_fd =3D -1;
> +static int ufssuspend_cnt;
> +
> +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
> +                                          strList *mountpoints,
> +                                          FsMountList mounts,
> +                                          Error **errp)
> +{
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
> +                if (g_str_equal(list->value, mount->dirname)) {
> +                    break;
> +                }
> +            }
> +            if (!list) {
> +                continue;
> +            }
> +        }
> +
> +        /* Only UFS supports suspend */
> +        if (!g_str_equal(mount->devtype, "ufs")) {
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
> +}
> +
> +/*
> + * We don't need to call UFSRESUME ioctl because all the frozen FS
> + * are thawed on /dev/ufssuspend closing.
> + */
> +int qmp_guest_fsfreeze_do_thaw(Error **errp)
> +{
> +    int ret =3D ufssuspend_cnt;
> +    ufssuspend_cnt =3D 0;
> +    if (ufssuspend_fd !=3D -1) {
> +        close(ufssuspend_fd);
> +        ufssuspend_fd =3D -1;
> +    }
> +    return ret;
> +}
> +
> +GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
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
> +#endif /* CONFIG_FSFREEZE */
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index 181fc330aa..2d9878a634 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -23,11 +23,22 @@
>  #endif
>  #endif /* __linux__ */
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
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 9574b83c92..49f9996a9c 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -33,20 +33,12 @@
>
>  #if defined(__linux__)
>  #include <mntent.h>
> -#include <linux/fs.h>
>  #include <sys/statvfs.h>
>  #include <linux/nvme_ioctl.h>
>
>  #ifdef CONFIG_LIBUDEV
>  #include <libudev.h>
>  #endif
> -
> -#ifdef FIFREEZE
> -#define CONFIG_FSFREEZE
> -#endif
> -#ifdef FITRIM
> -#define CONFIG_FSTRIM
> -#endif
>  #endif
>
>  #ifdef __FreeBSD__
> @@ -623,9 +615,6 @@ void qmp_guest_file_flush(int64_t handle, Error **err=
p)
>      }
>  }
>
> -/* linux-specific implementations. avoid this if at all possible. */
> -#if defined(__linux__)
> -
>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>  void free_fs_mount_list(FsMountList *mounts)
>  {
> @@ -644,6 +633,156 @@ void free_fs_mount_list(FsMountList *mounts)
>  }
>  #endif
>
> +#if defined(CONFIG_FSFREEZE)
> +typedef enum {
> +    FSFREEZE_HOOK_THAW =3D 0,
> +    FSFREEZE_HOOK_FREEZE,
> +} FsfreezeHookArg;
> +
> +static const char *fsfreeze_hook_arg_string[] =3D {
> +    "thaw",
> +    "freeze",
> +};
> +
> +static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
> +{
> +    int status;
> +    pid_t pid;
> +    const char *hook;
> +    const char *arg_str =3D fsfreeze_hook_arg_string[arg];
> +    Error *local_err =3D NULL;
> +
> +    hook =3D ga_fsfreeze_hook(ga_state);
> +    if (!hook) {
> +        return;
> +    }
> +    if (access(hook, X_OK) !=3D 0) {
> +        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'",
> hook);
> +        return;
> +    }
> +
> +    slog("executing fsfreeze hook with arg '%s'", arg_str);
> +    pid =3D fork();
> +    if (pid =3D=3D 0) {
> +        setsid();
> +        reopen_fd_to_null(0);
> +        reopen_fd_to_null(1);
> +        reopen_fd_to_null(2);
> +
> +        execl(hook, hook, arg_str, NULL);
> +        _exit(EXIT_FAILURE);
> +    } else if (pid < 0) {
> +        error_setg_errno(errp, errno, "failed to create child process");
> +        return;
> +    }
> +
> +    ga_wait_child(pid, &status, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    if (!WIFEXITED(status)) {
> +        error_setg(errp, "fsfreeze hook has terminated abnormally");
> +        return;
> +    }
> +
> +    status =3D WEXITSTATUS(status);
> +    if (status) {
> +        error_setg(errp, "fsfreeze hook has failed with status %d",
> status);
> +        return;
> +    }
> +}
> +
> +/*
> + * Return status of freeze/thaw
> + */
> +GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
> +{
> +    if (ga_is_frozen(ga_state)) {
> +        return GUEST_FSFREEZE_STATUS_FROZEN;
> +    }
> +
> +    return GUEST_FSFREEZE_STATUS_THAWED;
> +}
> +
> +int64_t qmp_guest_fsfreeze_freeze(Error **errp)
> +{
> +    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
> +}
> +
> +int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
> +                                       strList *mountpoints,
> +                                       Error **errp)
> +{
> +    int ret;
> +    FsMountList mounts;
> +    Error *local_err =3D NULL;
> +
> +    slog("guest-fsfreeze called");
> +
> +    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return -1;
> +    }
> +
> +    QTAILQ_INIT(&mounts);
> +    if (!build_fs_mount_list(&mounts, &local_err)) {
> +        error_propagate(errp, local_err);
> +        return -1;
> +    }
> +
> +    /* cannot risk guest agent blocking itself on a write in this state =
*/
> +    ga_set_frozen(ga_state);
> +
> +    ret =3D qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoin=
ts,
> +                                            mounts, errp);
> +
> +    free_fs_mount_list(&mounts);
> +    /* We may not issue any FIFREEZE here.
> +     * Just unset ga_state here and ready for the next call.
> +     */
> +    if (ret =3D=3D 0) {
> +        ga_unset_frozen(ga_state);
> +    } else if (ret < 0) {
> +        qmp_guest_fsfreeze_thaw(NULL);
> +    }
> +    return ret;
> +}
> +
> +int64_t qmp_guest_fsfreeze_thaw(Error **errp)
> +{
> +    int ret;
> +
> +    ret =3D qmp_guest_fsfreeze_do_thaw(errp);
> +    if (ret >=3D 0) {
> +        ga_unset_frozen(ga_state);
> +        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
> +    } else {
> +        ret =3D 0;
> +    }
> +
> +    return ret;
> +}
> +
> +static void guest_fsfreeze_cleanup(void)
> +{
> +    Error *err =3D NULL;
> +
> +    if (ga_is_frozen(ga_state) =3D=3D GUEST_FSFREEZE_STATUS_FROZEN) {
> +        qmp_guest_fsfreeze_thaw(&err);
> +        if (err) {
> +            slog("failed to clean up frozen filesystems: %s",
> +                 error_get_pretty(err));
> +            error_free(err);
> +        }
> +    }
> +}
> +#endif
> +
> +/* linux-specific implementations. avoid this if at all possible. */
> +#if defined(__linux__)
>  #if defined(CONFIG_FSFREEZE)
>
>  static char *get_pci_driver(char const *syspath, int pathlen, Error
> **errp)
> @@ -1467,153 +1606,6 @@ GuestFilesystemInfoList
> *qmp_guest_get_fsinfo(Error **errp)
>      free_fs_mount_list(&mounts);
>      return ret;
>  }
> -
> -
> -typedef enum {
> -    FSFREEZE_HOOK_THAW =3D 0,
> -    FSFREEZE_HOOK_FREEZE,
> -} FsfreezeHookArg;
> -
> -static const char *fsfreeze_hook_arg_string[] =3D {
> -    "thaw",
> -    "freeze",
> -};
> -
> -static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
> -{
> -    int status;
> -    pid_t pid;
> -    const char *hook;
> -    const char *arg_str =3D fsfreeze_hook_arg_string[arg];
> -    Error *local_err =3D NULL;
> -
> -    hook =3D ga_fsfreeze_hook(ga_state);
> -    if (!hook) {
> -        return;
> -    }
> -    if (access(hook, X_OK) !=3D 0) {
> -        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'",
> hook);
> -        return;
> -    }
> -
> -    slog("executing fsfreeze hook with arg '%s'", arg_str);
> -    pid =3D fork();
> -    if (pid =3D=3D 0) {
> -        setsid();
> -        reopen_fd_to_null(0);
> -        reopen_fd_to_null(1);
> -        reopen_fd_to_null(2);
> -
> -        execl(hook, hook, arg_str, NULL);
> -        _exit(EXIT_FAILURE);
> -    } else if (pid < 0) {
> -        error_setg_errno(errp, errno, "failed to create child process");
> -        return;
> -    }
> -
> -    ga_wait_child(pid, &status, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    if (!WIFEXITED(status)) {
> -        error_setg(errp, "fsfreeze hook has terminated abnormally");
> -        return;
> -    }
> -
> -    status =3D WEXITSTATUS(status);
> -    if (status) {
> -        error_setg(errp, "fsfreeze hook has failed with status %d",
> status);
> -        return;
> -    }
> -}
> -
> -/*
> - * Return status of freeze/thaw
> - */
> -GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
> -{
> -    if (ga_is_frozen(ga_state)) {
> -        return GUEST_FSFREEZE_STATUS_FROZEN;
> -    }
> -
> -    return GUEST_FSFREEZE_STATUS_THAWED;
> -}
> -
> -int64_t qmp_guest_fsfreeze_freeze(Error **errp)
> -{
> -    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
> -}
> -
> -int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
> -                                       strList *mountpoints,
> -                                       Error **errp)
> -{
> -    int ret;
> -    FsMountList mounts;
> -    Error *local_err =3D NULL;
> -
> -    slog("guest-fsfreeze called");
> -
> -    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return -1;
> -    }
> -
> -    QTAILQ_INIT(&mounts);
> -    if (!build_fs_mount_list(&mounts, &local_err)) {
> -        error_propagate(errp, local_err);
> -        return -1;
> -    }
> -
> -    /* cannot risk guest agent blocking itself on a write in this state =
*/
> -    ga_set_frozen(ga_state);
> -
> -    ret =3D qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoin=
ts,
> -                                            mounts, errp);
> -
> -    free_fs_mount_list(&mounts);
> -    /* We may not issue any FIFREEZE here.
> -     * Just unset ga_state here and ready for the next call.
> -     */
> -    if (ret =3D=3D 0) {
> -        ga_unset_frozen(ga_state);
> -    } else if (ret < 0) {
> -        qmp_guest_fsfreeze_thaw(NULL);
> -    }
> -    return ret;
> -}
> -
> -int64_t qmp_guest_fsfreeze_thaw(Error **errp)
> -{
> -    int ret;
> -
> -    ret =3D qmp_guest_fsfreeze_do_thaw(errp);
> -    if (ret >=3D 0) {
> -        ga_unset_frozen(ga_state);
> -        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
> -    } else {
> -        ret =3D 0;
> -    }
> -
> -    return ret;
> -}
> -
> -static void guest_fsfreeze_cleanup(void)
> -{
> -    Error *err =3D NULL;
> -
> -    if (ga_is_frozen(ga_state) =3D=3D GUEST_FSFREEZE_STATUS_FROZEN) {
> -        qmp_guest_fsfreeze_thaw(&err);
> -        if (err) {
> -            slog("failed to clean up frozen filesystems: %s",
> -                 error_get_pretty(err));
> -            error_free(err);
> -        }
> -    }
> -}
>  #endif /* CONFIG_FSFREEZE */
>
>  #if defined(CONFIG_FSTRIM)
> diff --git a/qga/main.c b/qga/main.c
> index 0d27c97d38..b3580508fa 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -37,12 +37,7 @@
>  #include "qga/service-win32.h"
>  #include "qga/vss-win32.h"
>  #endif
> -#ifdef __linux__
> -#include <linux/fs.h>
> -#ifdef FIFREEZE
> -#define CONFIG_FSFREEZE
> -#endif
> -#endif
> +#include "commands-common.h"
>
>  #ifndef _WIN32
>  #ifdef __FreeBSD__
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

--=20
Marc-Andr=C3=A9 Lureau

--00000000000099459605e9cf2ffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 12:04 PM Alex=
ander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com" target=
=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">UFS supports FS freezing through =
ioctl UFSSUSPEND on /dev/ufssuspend.<br>
Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.<br>
<br>
Use getmntinfo to get a list of mounted FS.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div><div>lgtm,</div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 | 169 +++++++++++++++++++++++<br>
=C2=A0qga/commands-common.h |=C2=A0 11 ++<br>
=C2=A0qga/commands-posix.c=C2=A0 | 308 ++++++++++++++++++++----------------=
------<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +=
-<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A05 files changed, 334 insertions(+), 164 deletions(-)<br>
=C2=A0create mode 100644 qga/commands-bsd.c<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
new file mode 100644<br>
index 0000000000..ca06692179<br>
--- /dev/null<br>
+++ b/qga/commands-bsd.c<br>
@@ -0,0 +1,169 @@<br>
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
+#include &lt;sys/ioctl.h&gt;<br>
+#include &lt;sys/param.h&gt;<br>
+#include &lt;sys/ucred.h&gt;<br>
+#include &lt;sys/mount.h&gt;<br>
+#include &lt;paths.h&gt;<br>
+<br>
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br>
+{<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;stat failed on %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mntp-&gt;f_mntonname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
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
+}<br>
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */<br>
+<br>
+#if defined(CONFIG_FSFREEZE)<br>
+static int ufssuspend_fd =3D -1;<br>
+static int ufssuspend_cnt;<br>
+<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_equal(li=
st-&gt;value, mount-&gt;dirname)) {<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_str_equal(mount-&gt;devtype, &quot;ufs&=
quot;)) {<br>
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
+}<br>
+<br>
+/*<br>
+ * We don&#39;t need to call UFSRESUME ioctl because all the frozen FS<br>
+ * are thawed on /dev/ufssuspend closing.<br>
+ */<br>
+int qmp_guest_fsfreeze_do_thaw(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret =3D ufssuspend_cnt;<br>
+=C2=A0 =C2=A0 ufssuspend_cnt =3D 0;<br>
+=C2=A0 =C2=A0 if (ufssuspend_fd !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ufssuspend_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ufssuspend_fd =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
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
+#endif /* CONFIG_FSFREEZE */<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index 181fc330aa..2d9878a634 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -23,11 +23,22 @@<br>
=C2=A0#endif<br>
=C2=A0#endif /* __linux__ */<br>
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
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 9574b83c92..49f9996a9c 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -33,20 +33,12 @@<br>
<br>
=C2=A0#if defined(__linux__)<br>
=C2=A0#include &lt;mntent.h&gt;<br>
-#include &lt;linux/fs.h&gt;<br>
=C2=A0#include &lt;sys/statvfs.h&gt;<br>
=C2=A0#include &lt;linux/nvme_ioctl.h&gt;<br>
<br>
=C2=A0#ifdef CONFIG_LIBUDEV<br>
=C2=A0#include &lt;libudev.h&gt;<br>
=C2=A0#endif<br>
-<br>
-#ifdef FIFREEZE<br>
-#define CONFIG_FSFREEZE<br>
-#endif<br>
-#ifdef FITRIM<br>
-#define CONFIG_FSTRIM<br>
-#endif<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef __FreeBSD__<br>
@@ -623,9 +615,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-/* linux-specific implementations. avoid this if at all possible. */<br>
-#if defined(__linux__)<br>
-<br>
=C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
=C2=A0void free_fs_mount_list(FsMountList *mounts)<br>
=C2=A0{<br>
@@ -644,6 +633,156 @@ void free_fs_mount_list(FsMountList *mounts)<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
+#if defined(CONFIG_FSFREEZE)<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 FSFREEZE_HOOK_THAW =3D 0,<br>
+=C2=A0 =C2=A0 FSFREEZE_HOOK_FREEZE,<br>
+} FsfreezeHookArg;<br>
+<br>
+static const char *fsfreeze_hook_arg_string[] =3D {<br>
+=C2=A0 =C2=A0 &quot;thaw&quot;,<br>
+=C2=A0 =C2=A0 &quot;freeze&quot;,<br>
+};<br>
+<br>
+static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int status;<br>
+=C2=A0 =C2=A0 pid_t pid;<br>
+=C2=A0 =C2=A0 const char *hook;<br>
+=C2=A0 =C2=A0 const char *arg_str =3D fsfreeze_hook_arg_string[arg];<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 hook =3D ga_fsfreeze_hook(ga_state);<br>
+=C2=A0 =C2=A0 if (!hook) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (access(hook, X_OK) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;can&#39;t =
access fsfreeze hook &#39;%s&#39;&quot;, hook);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 slog(&quot;executing fsfreeze hook with arg &#39;%s&#39;&quo=
t;, arg_str);<br>
+=C2=A0 =C2=A0 pid =3D fork();<br>
+=C2=A0 =C2=A0 if (pid =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setsid();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(hook, hook, arg_str, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 } else if (pid &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
create child process&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ga_wait_child(pid, &amp;status, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!WIFEXITED(status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;fsfreeze hook has termi=
nated abnormally&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 status =3D WEXITSTATUS(status);<br>
+=C2=A0 =C2=A0 if (status) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;fsfreeze hook has faile=
d with status %d&quot;, status);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/*<br>
+ * Return status of freeze/thaw<br>
+ */<br>
+GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 if (ga_is_frozen(ga_state)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return GUEST_FSFREEZE_STATUS_FROZEN;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return GUEST_FSFREEZE_STATUS_THAWED;<br>
+}<br>
+<br>
+int64_t qmp_guest_fsfreeze_freeze(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);<br=
>
+}<br>
+<br>
+int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strList *=
mountpoints,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **e=
rrp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 FsMountList mounts;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 slog(&quot;guest-fsfreeze called&quot;);<br>
+<br>
+=C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &amp;local_err);=
<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
+=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local_err)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* cannot risk guest agent blocking itself on a write in thi=
s state */<br>
+=C2=A0 =C2=A0 ga_set_frozen(ga_state);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, m=
ountpoints,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mounts, errp);<br>
+<br>
+=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
+=C2=A0 =C2=A0 /* We may not issue any FIFREEZE here.<br>
+=C2=A0 =C2=A0 =C2=A0* Just unset ga_state here and ready for the next call=
.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
+=C2=A0 =C2=A0 } else if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(NULL);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D qmp_guest_fsfreeze_do_thaw(errp);<br>
+=C2=A0 =C2=A0 if (ret &gt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp=
);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void guest_fsfreeze_cleanup(void)<br>
+{<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if (ga_is_frozen(ga_state) =3D=3D GUEST_FSFREEZE_STATUS_FROZ=
EN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(&amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;failed to clean up fr=
ozen filesystems: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_get_pr=
etty(err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+#endif<br>
+<br>
+/* linux-specific implementations. avoid this if at all possible. */<br>
+#if defined(__linux__)<br>
=C2=A0#if defined(CONFIG_FSFREEZE)<br>
<br>
=C2=A0static char *get_pci_driver(char const *syspath, int pathlen, Error *=
*errp)<br>
@@ -1467,153 +1606,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0free_fs_mount_list(&amp;mounts);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
-<br>
-<br>
-typedef enum {<br>
-=C2=A0 =C2=A0 FSFREEZE_HOOK_THAW =3D 0,<br>
-=C2=A0 =C2=A0 FSFREEZE_HOOK_FREEZE,<br>
-} FsfreezeHookArg;<br>
-<br>
-static const char *fsfreeze_hook_arg_string[] =3D {<br>
-=C2=A0 =C2=A0 &quot;thaw&quot;,<br>
-=C2=A0 =C2=A0 &quot;freeze&quot;,<br>
-};<br>
-<br>
-static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int status;<br>
-=C2=A0 =C2=A0 pid_t pid;<br>
-=C2=A0 =C2=A0 const char *hook;<br>
-=C2=A0 =C2=A0 const char *arg_str =3D fsfreeze_hook_arg_string[arg];<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 hook =3D ga_fsfreeze_hook(ga_state);<br>
-=C2=A0 =C2=A0 if (!hook) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (access(hook, X_OK) !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;can&#39;t =
access fsfreeze hook &#39;%s&#39;&quot;, hook);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 slog(&quot;executing fsfreeze hook with arg &#39;%s&#39;&quo=
t;, arg_str);<br>
-=C2=A0 =C2=A0 pid =3D fork();<br>
-=C2=A0 =C2=A0 if (pid =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setsid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(hook, hook, arg_str, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
-=C2=A0 =C2=A0 } else if (pid &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
create child process&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 ga_wait_child(pid, &amp;status, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!WIFEXITED(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;fsfreeze hook has termi=
nated abnormally&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 status =3D WEXITSTATUS(status);<br>
-=C2=A0 =C2=A0 if (status) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;fsfreeze hook has faile=
d with status %d&quot;, status);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-/*<br>
- * Return status of freeze/thaw<br>
- */<br>
-GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 if (ga_is_frozen(ga_state)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return GUEST_FSFREEZE_STATUS_FROZEN;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return GUEST_FSFREEZE_STATUS_THAWED;<br>
-}<br>
-<br>
-int64_t qmp_guest_fsfreeze_freeze(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);<br=
>
-}<br>
-<br>
-int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strList *=
mountpoints,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **e=
rrp)<br>
-{<br>
-=C2=A0 =C2=A0 int ret;<br>
-=C2=A0 =C2=A0 FsMountList mounts;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 slog(&quot;guest-fsfreeze called&quot;);<br>
-<br>
-=C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &amp;local_err);=
<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
-=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local_err)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* cannot risk guest agent blocking itself on a write in thi=
s state */<br>
-=C2=A0 =C2=A0 ga_set_frozen(ga_state);<br>
-<br>
-=C2=A0 =C2=A0 ret =3D qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, m=
ountpoints,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mounts, errp);<br>
-<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-=C2=A0 =C2=A0 /* We may not issue any FIFREEZE here.<br>
-=C2=A0 =C2=A0 =C2=A0* Just unset ga_state here and ready for the next call=
.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
-=C2=A0 =C2=A0 } else if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(NULL);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int ret;<br>
-<br>
-=C2=A0 =C2=A0 ret =3D qmp_guest_fsfreeze_do_thaw(errp);<br>
-=C2=A0 =C2=A0 if (ret &gt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp=
);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-static void guest_fsfreeze_cleanup(void)<br>
-{<br>
-=C2=A0 =C2=A0 Error *err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 if (ga_is_frozen(ga_state) =3D=3D GUEST_FSFREEZE_STATUS_FROZ=
EN) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(&amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;failed to clean up fr=
ozen filesystems: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_get_pr=
etty(err));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
=C2=A0#if defined(CONFIG_FSTRIM)<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 0d27c97d38..b3580508fa 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -37,12 +37,7 @@<br>
=C2=A0#include &quot;qga/service-win32.h&quot;<br>
=C2=A0#include &quot;qga/vss-win32.h&quot;<br>
=C2=A0#endif<br>
-#ifdef __linux__<br>
-#include &lt;linux/fs.h&gt;<br>
-#ifdef FIFREEZE<br>
-#define CONFIG_FSFREEZE<br>
-#endif<br>
-#endif<br>
+#include &quot;commands-common.h&quot;<br>
<br>
=C2=A0#ifndef _WIN32<br>
=C2=A0#ifdef __FreeBSD__<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000099459605e9cf2ffd--

