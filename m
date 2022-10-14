Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73935FEA91
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:32:04 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojG6t-0002Sc-KK
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ojFka-0000KI-Ff
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:09:00 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ojFkK-0003Cf-AN
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:09:00 -0400
Received: by mail-lj1-x236.google.com with SMTP id j23so5098857lji.8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/6Ae5DH+hSMUuaWpLiOfgZaJwTYu4fgTPLf9ioyzeHw=;
 b=ER37RJBO6+1lCHppeVfRd6r7xXGNLB8l2udRZHBcXtTjrikK01F4RttDzz58ZXGLul
 3iPhX6FjKMo2xPZ71ZKa2jk4ZWUMewck7ABXV/t0cGJLmg6lIc6wFYgitauYR9M0jEMr
 XzKXcVUDY7h8RwZplQM4o8QbTQIHNxtUjVHz0iPbPmd7p2pAQPTrJCd0OMiSzwZ4auqx
 Gb4FHoeR9DEKtvkrmxxDODGPLncLo/guUAGRr0cUFyRbiZT9tBA5aYe8cJoIp3GQSQjO
 AfBzi7usvUj8Kw1Ht7MQ7KIJR6KhJG52EvC5MLuMyExQZFvOroobXfYCTSRZ0hiVIc5L
 6Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6Ae5DH+hSMUuaWpLiOfgZaJwTYu4fgTPLf9ioyzeHw=;
 b=1JLFdsN6lAlojWJiO4/LwxjipKcE+IpmwtpiKZ2igfJ2x2+dmmfY4Y7wA6MjRi5DuZ
 4mmgnqOHJ7Uxc90q6dlq7PN39G2to9eV+ySlYS+OSp8CdqGyM0DPSeKQwcCqW0/6uNYG
 OPI2uc53vUjcj5NG/2vuysFuB7WXSeIePxn2vB4r5VT1YpklCu9xw/1e/MeEqTgOUTcl
 eRGllXz489bxKi+OH+tRuvbNvXrjaaWvH5FamUB8lNXK8/d4NGHzg4BI/LekoOl6rDYf
 UDaoKWpDhCvNCU39iYIY9iJ6vxSNzQJu8UCfySu+0md+FwjUTrk/M+hNhXZnav2McoYZ
 CtEA==
X-Gm-Message-State: ACrzQf0WgkQkjwxF8xLb+1ktMDxnvqycT6zbGrNkeR45XG/EW6txQSPi
 66LXzcti15KhTaiHrLssS0SX221CLoferitDZWA=
X-Google-Smtp-Source: AMsMyM5dYLw24ebefZInbT8GPN9r8Hfx5OeB2r/vKfOPI73ToN0y3wYk5ldZ9uE+8YwHwPNbb2bhEX0Bg7pQADAdzjU=
X-Received: by 2002:a2e:804d:0:b0:26f:c663:2c79 with SMTP id
 p13-20020a2e804d000000b0026fc6632c79mr1333029ljg.289.1665734922207; Fri, 14
 Oct 2022 01:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
 <20221013092326.2194646-3-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CJsb666pem8Jqyj0sk26w9fyGzPhvUMQ3UH77+79eGe7w@mail.gmail.com>
 <9cf110ea-f144-6e1d-fa00-703004768eca@virtuozzo.com>
In-Reply-To: <9cf110ea-f144-6e1d-fa00-703004768eca@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 14 Oct 2022 12:08:30 +0400
Message-ID: <CAJ+F1C+cL6tFVoK0KwDoM+cwTST9-DO6F1h1oM1YbSdsmGdVkQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] qga: Move Linux-specific FS freeze/thaw code to a
 separate file
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000540b1e05eafa22cf"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--000000000000540b1e05eafa22cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 14, 2022 at 11:56 AM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Hi
> On 13.10.2022 14:10, Marc-Andr=C3=A9 Lureau wrote:
>
> Hi
>
> On Thu, Oct 13, 2022 at 1:23 PM Alexander Ivanov <
> alexander.ivanov@virtuozzo.com> wrote:
>
>> In the next patches we are going to add FreeBSD support for QEMU Guest
>> Agent. In the result, code in commands-posix.c will be too cumbersome.
>>
>> Move Linux-specific FS freeze/thaw code to a separate file
>> commands-linux.c
>> keeping common POSIX code in commands-posix.c.
>>
>> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>  qga/commands-common.h |  35 +++++
>>  qga/commands-linux.c  | 286 +++++++++++++++++++++++++++++++++++++++++
>>  qga/commands-posix.c  | 289 +++---------------------------------------
>>  qga/meson.build       |   3 +
>>  4 files changed, 340 insertions(+), 273 deletions(-)
>>  create mode 100644 qga/commands-linux.c
>>
>> diff --git a/qga/commands-common.h b/qga/commands-common.h
>> index d0e4a9696f..181fc330aa 100644
>> --- a/qga/commands-common.h
>> +++ b/qga/commands-common.h
>> @@ -10,6 +10,40 @@
>>  #define QGA_COMMANDS_COMMON_H
>>
>>  #include "qga-qapi-types.h"
>> +#include "guest-agent-core.h"
>> +#include "qemu/queue.h"
>> +
>> +#if defined(__linux__)
>> +#include <linux/fs.h>
>> +#ifdef FIFREEZE
>> +#define CONFIG_FSFREEZE
>> +#endif
>> +#ifdef FITRIM
>> +#define CONFIG_FSTRIM
>> +#endif
>> +#endif /* __linux__ */
>> +
>> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>> +typedef struct FsMount {
>> +    char *dirname;
>> +    char *devtype;
>> +    unsigned int devmajor, devminor;
>> +    QTAILQ_ENTRY(FsMount) next;
>> +} FsMount;
>> +
>> +typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
>> +
>> +bool build_fs_mount_list(FsMountList *mounts, Error **errp);
>> +void free_fs_mount_list(FsMountList *mounts);
>> +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
>> +
>> +#if defined(CONFIG_FSFREEZE)
>> +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>> +                                          strList *mountpoints,
>> +                                          FsMountList mounts,
>> +                                          Error **errp);
>> +int qmp_guest_fsfreeze_do_thaw(Error **errp);
>> +#endif /* CONFIG_FSFREEZE */
>>
>>  typedef struct GuestFileHandle GuestFileHandle;
>>
>> @@ -29,4 +63,5 @@ GuestFileRead *guest_file_read_unsafe(GuestFileHandle
>> *gfh,
>>   */
>>  char *qga_get_host_name(Error **errp);
>>
>> +void ga_wait_child(pid_t pid, int *status, Error **errp);
>>
>
> This doesn't belong here, afaict.
>
> What do you mean, this patch or this place in the header file?
>

I mean that this change doesn't look necessary with this patch.

> I moved this function to the global scope because it was used in
> commands-posix.c
>
> and commands-linux.c in the first version of the patchset. But now we can
> leave
>
> the function static in commands-posix.c. Should I do it?
>

yes, don't change it if not needed, thanks !


>
>
>
>>  #endif
>> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
>> new file mode 100644
>> index 0000000000..214e408fcd
>> --- /dev/null
>> +++ b/qga/commands-linux.c
>> @@ -0,0 +1,286 @@
>> +/*
>> + * QEMU Guest Agent Linux-specific command implementations
>> + *
>> + * Copyright IBM Corp. 2011
>> + *
>> + * Authors:
>> + *  Michael Roth      <mdroth@linux.vnet.ibm.com>
>> + *  Michal Privoznik  <mprivozn@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>> later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "commands-common.h"
>> +#include "cutils.h"
>> +#include <mntent.h>
>> +#include <sys/ioctl.h>
>> +
>> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>> +static int dev_major_minor(const char *devpath,
>> +                           unsigned int *devmajor, unsigned int
>> *devminor)
>> +{
>> +    struct stat st;
>> +
>> +    *devmajor =3D 0;
>> +    *devminor =3D 0;
>> +
>> +    if (stat(devpath, &st) < 0) {
>> +        slog("failed to stat device file '%s': %s", devpath,
>> strerror(errno));
>> +        return -1;
>> +    }
>> +    if (S_ISDIR(st.st_mode)) {
>> +        /* It is bind mount */
>> +        return -2;
>> +    }
>> +    if (S_ISBLK(st.st_mode)) {
>> +        *devmajor =3D major(st.st_rdev);
>> +        *devminor =3D minor(st.st_rdev);
>> +        return 0;
>> +    }
>> +    return -1;
>> +}
>> +
>> +static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error
>> **errp)
>> +{
>> +    struct mntent *ment;
>> +    FsMount *mount;
>> +    char const *mtab =3D "/proc/self/mounts";
>> +    FILE *fp;
>> +    unsigned int devmajor, devminor;
>> +
>> +    fp =3D setmntent(mtab, "r");
>> +    if (!fp) {
>> +        error_setg(errp, "failed to open mtab file: '%s'", mtab);
>> +        return false;
>> +    }
>> +
>> +    while ((ment =3D getmntent(fp))) {
>> +        /*
>> +         * An entry which device name doesn't start with a '/' is
>> +         * either a dummy file system or a network file system.
>> +         * Add special handling for smbfs and cifs as is done by
>> +         * coreutils as well.
>> +         */
>> +        if ((ment->mnt_fsname[0] !=3D '/') ||
>> +            (strcmp(ment->mnt_type, "smbfs") =3D=3D 0) ||
>> +            (strcmp(ment->mnt_type, "cifs") =3D=3D 0)) {
>> +            continue;
>> +        }
>> +        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) =3D=
=3D
>> -2) {
>> +            /* Skip bind mounts */
>> +            continue;
>> +        }
>> +
>> +        mount =3D g_new0(FsMount, 1);
>> +        mount->dirname =3D g_strdup(ment->mnt_dir);
>> +        mount->devtype =3D g_strdup(ment->mnt_type);
>> +        mount->devmajor =3D devmajor;
>> +        mount->devminor =3D devminor;
>> +
>> +        QTAILQ_INSERT_TAIL(mounts, mount, next);
>> +    }
>> +
>> +    endmntent(fp);
>> +    return true;
>> +}
>> +
>> +static void decode_mntname(char *name, int len)
>> +{
>> +    int i, j =3D 0;
>> +    for (i =3D 0; i <=3D len; i++) {
>> +        if (name[i] !=3D '\\') {
>> +            name[j++] =3D name[i];
>> +        } else if (name[i + 1] =3D=3D '\\') {
>> +            name[j++] =3D '\\';
>> +            i++;
>> +        } else if (name[i + 1] >=3D '0' && name[i + 1] <=3D '3' &&
>> +                   name[i + 2] >=3D '0' && name[i + 2] <=3D '7' &&
>> +                   name[i + 3] >=3D '0' && name[i + 3] <=3D '7') {
>> +            name[j++] =3D (name[i + 1] - '0') * 64 +
>> +                        (name[i + 2] - '0') * 8 +
>> +                        (name[i + 3] - '0');
>> +            i +=3D 3;
>> +        } else {
>> +            name[j++] =3D name[i];
>> +        }
>> +    }
>> +}
>> +
>> +/*
>> + * Walk the mount table and build a list of local file systems
>> + */
>> +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>> +{
>> +    FsMount *mount;
>> +    char const *mountinfo =3D "/proc/self/mountinfo";
>> +    FILE *fp;
>> +    char *line =3D NULL, *dash;
>> +    size_t n;
>> +    char check;
>> +    unsigned int devmajor, devminor;
>> +    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
>> +
>> +    fp =3D fopen(mountinfo, "r");
>> +    if (!fp) {
>> +        return build_fs_mount_list_from_mtab(mounts, errp);
>> +    }
>> +
>> +    while (getline(&line, &n, fp) !=3D -1) {
>> +        ret =3D sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
>> +                     &devmajor, &devminor, &dir_s, &dir_e, &check);
>> +        if (ret < 3) {
>> +            continue;
>> +        }
>> +        dash =3D strstr(line + dir_e, " - ");
>> +        if (!dash) {
>> +            continue;
>> +        }
>> +        ret =3D sscanf(dash, " - %n%*s%n %n%*s%n%c",
>> +                     &type_s, &type_e, &dev_s, &dev_e, &check);
>> +        if (ret < 1) {
>> +            continue;
>> +        }
>> +        line[dir_e] =3D 0;
>> +        dash[type_e] =3D 0;
>> +        dash[dev_e] =3D 0;
>> +        decode_mntname(line + dir_s, dir_e - dir_s);
>> +        decode_mntname(dash + dev_s, dev_e - dev_s);
>> +        if (devmajor =3D=3D 0) {
>> +            /* btrfs reports major number =3D 0 */
>> +            if (strcmp("btrfs", dash + type_s) !=3D 0 ||
>> +                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0=
)
>> {
>> +                continue;
>> +            }
>> +        }
>> +
>> +        mount =3D g_new0(FsMount, 1);
>> +        mount->dirname =3D g_strdup(line + dir_s);
>> +        mount->devtype =3D g_strdup(dash + type_s);
>> +        mount->devmajor =3D devmajor;
>> +        mount->devminor =3D devminor;
>> +
>> +        QTAILQ_INSERT_TAIL(mounts, mount, next);
>> +    }
>> +    free(line);
>> +
>> +    fclose(fp);
>> +    return true;
>> +}
>> +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
>> +
>> +#ifdef CONFIG_FSFREEZE
>> +/*
>> + * Walk list of mounted file systems in the guest, and freeze the ones
>> which
>> + * are real local file systems.
>> + */
>> +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>> +                                          strList *mountpoints,
>> +                                          FsMountList mounts,
>> +                                          Error **errp)
>> +{
>> +    struct FsMount *mount;
>> +    strList *list;
>> +    int fd, ret, i =3D 0;
>> +
>> +    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
>> +        /* To issue fsfreeze in the reverse order of mounts, check if t=
he
>> +         * mount is listed in the list here */
>> +        if (has_mountpoints) {
>> +            for (list =3D mountpoints; list; list =3D list->next) {
>> +                if (strcmp(list->value, mount->dirname) =3D=3D 0) {
>> +                    break;
>> +                }
>> +            }
>> +            if (!list) {
>> +                continue;
>> +            }
>> +        }
>> +
>> +        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>> +        if (fd =3D=3D -1) {
>> +            error_setg_errno(errp, errno, "failed to open %s",
>> mount->dirname);
>> +            return -1;
>> +        }
>> +
>> +        /* we try to cull filesystems we know won't work in advance, bu=
t
>> other
>> +         * filesystems may not implement fsfreeze for less obvious
>> reasons.
>> +         * these will report EOPNOTSUPP. we simply ignore these when
>> tallying
>> +         * the number of frozen filesystems.
>> +         * if a filesystem is mounted more than once (aka bind mount) a
>> +         * consecutive attempt to freeze an already frozen filesystem
>> will
>> +         * return EBUSY.
>> +         *
>> +         * any other error means a failure to freeze a filesystem we
>> +         * expect to be freezable, so return an error in those cases
>> +         * and return system to thawed state.
>> +         */
>> +        ret =3D ioctl(fd, FIFREEZE);
>> +        if (ret =3D=3D -1) {
>> +            if (errno !=3D EOPNOTSUPP && errno !=3D EBUSY) {
>> +                error_setg_errno(errp, errno, "failed to freeze %s",
>> +                                 mount->dirname);
>> +                close(fd);
>> +                return -1;
>> +            }
>> +        } else {
>> +            i++;
>> +        }
>> +        close(fd);
>> +    }
>> +    return i;
>> +}
>> +
>> +int qmp_guest_fsfreeze_do_thaw(Error **errp)
>> +{
>> +    int ret;
>> +    FsMountList mounts;
>> +    FsMount *mount;
>> +    int fd, i =3D 0, logged;
>> +    Error *local_err =3D NULL;
>> +
>> +    QTAILQ_INIT(&mounts);
>> +    if (!build_fs_mount_list(&mounts, &local_err)) {
>> +        error_propagate(errp, local_err);
>> +        return -1;
>> +    }
>> +
>> +    QTAILQ_FOREACH(mount, &mounts, next) {
>> +        logged =3D false;
>> +        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>> +        if (fd =3D=3D -1) {
>> +            continue;
>> +        }
>> +        /* we have no way of knowing whether a filesystem was actually
>> unfrozen
>> +         * as a result of a successful call to FITHAW, only that if an
>> error
>> +         * was returned the filesystem was *not* unfrozen by that
>> particular
>> +         * call.
>> +         *
>> +         * since multiple preceding FIFREEZEs require multiple calls to
>> FITHAW
>> +         * to unfreeze, continuing issuing FITHAW until an error is
>> returned,
>> +         * in which case either the filesystem is in an unfreezable
>> state, or,
>> +         * more likely, it was thawed previously (and remains so
>> afterward).
>> +         *
>> +         * also, since the most recent successful call is the one that
>> did
>> +         * the actual unfreeze, we can use this to provide an accurate
>> count
>> +         * of the number of filesystems unfrozen by guest-fsfreeze-thaw=
,
>> which
>> +         * may * be useful for determining whether a filesystem was
>> unfrozen
>> +         * during the freeze/thaw phase by a process other than qemu-ga=
.
>> +         */
>> +        do {
>> +            ret =3D ioctl(fd, FITHAW);
>> +            if (ret =3D=3D 0 && !logged) {
>> +                i++;
>> +                logged =3D true;
>> +            }
>> +        } while (ret =3D=3D 0);
>> +        close(fd);
>> +    }
>> +
>> +    free_fs_mount_list(&mounts);
>> +
>> +    return i;
>> +}
>> +#endif /* CONFIG_FSFREEZE */
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 16d67e9f6d..9574b83c92 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -16,11 +16,9 @@
>>  #include <sys/utsname.h>
>>  #include <sys/wait.h>
>>  #include <dirent.h>
>> -#include "guest-agent-core.h"
>>  #include "qga-qapi-commands.h"
>>  #include "qapi/error.h"
>>  #include "qapi/qmp/qerror.h"
>> -#include "qemu/queue.h"
>>  #include "qemu/host-utils.h"
>>  #include "qemu/sockets.h"
>>  #include "qemu/base64.h"
>> @@ -70,7 +68,7 @@
>>  #endif
>>  #endif
>>
>> -static void ga_wait_child(pid_t pid, int *status, Error **errp)
>> +void ga_wait_child(pid_t pid, int *status, Error **errp)
>>  {
>>      pid_t rpid;
>>
>> @@ -629,16 +627,7 @@ void qmp_guest_file_flush(int64_t handle, Error
>> **errp)
>>  #if defined(__linux__)
>>
>>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>> -typedef struct FsMount {
>> -    char *dirname;
>> -    char *devtype;
>> -    unsigned int devmajor, devminor;
>> -    QTAILQ_ENTRY(FsMount) next;
>> -} FsMount;
>> -
>> -typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
>> -
>> -static void free_fs_mount_list(FsMountList *mounts)
>> +void free_fs_mount_list(FsMountList *mounts)
>>  {
>>       FsMount *mount, *temp;
>>
>> @@ -653,157 +642,6 @@ static void free_fs_mount_list(FsMountList *mounts=
)
>>           g_free(mount);
>>       }
>>  }
>> -
>> -static int dev_major_minor(const char *devpath,
>> -                           unsigned int *devmajor, unsigned int
>> *devminor)
>> -{
>> -    struct stat st;
>> -
>> -    *devmajor =3D 0;
>> -    *devminor =3D 0;
>> -
>> -    if (stat(devpath, &st) < 0) {
>> -        slog("failed to stat device file '%s': %s", devpath,
>> strerror(errno));
>> -        return -1;
>> -    }
>> -    if (S_ISDIR(st.st_mode)) {
>> -        /* It is bind mount */
>> -        return -2;
>> -    }
>> -    if (S_ISBLK(st.st_mode)) {
>> -        *devmajor =3D major(st.st_rdev);
>> -        *devminor =3D minor(st.st_rdev);
>> -        return 0;
>> -    }
>> -    return -1;
>> -}
>> -
>> -/*
>> - * Walk the mount table and build a list of local file systems
>> - */
>> -static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error
>> **errp)
>> -{
>> -    struct mntent *ment;
>> -    FsMount *mount;
>> -    char const *mtab =3D "/proc/self/mounts";
>> -    FILE *fp;
>> -    unsigned int devmajor, devminor;
>> -
>> -    fp =3D setmntent(mtab, "r");
>> -    if (!fp) {
>> -        error_setg(errp, "failed to open mtab file: '%s'", mtab);
>> -        return false;
>> -    }
>> -
>> -    while ((ment =3D getmntent(fp))) {
>> -        /*
>> -         * An entry which device name doesn't start with a '/' is
>> -         * either a dummy file system or a network file system.
>> -         * Add special handling for smbfs and cifs as is done by
>> -         * coreutils as well.
>> -         */
>> -        if ((ment->mnt_fsname[0] !=3D '/') ||
>> -            (strcmp(ment->mnt_type, "smbfs") =3D=3D 0) ||
>> -            (strcmp(ment->mnt_type, "cifs") =3D=3D 0)) {
>> -            continue;
>> -        }
>> -        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) =3D=
=3D
>> -2) {
>> -            /* Skip bind mounts */
>> -            continue;
>> -        }
>> -
>> -        mount =3D g_new0(FsMount, 1);
>> -        mount->dirname =3D g_strdup(ment->mnt_dir);
>> -        mount->devtype =3D g_strdup(ment->mnt_type);
>> -        mount->devmajor =3D devmajor;
>> -        mount->devminor =3D devminor;
>> -
>> -        QTAILQ_INSERT_TAIL(mounts, mount, next);
>> -    }
>> -
>> -    endmntent(fp);
>> -    return true;
>> -}
>> -
>> -static void decode_mntname(char *name, int len)
>> -{
>> -    int i, j =3D 0;
>> -    for (i =3D 0; i <=3D len; i++) {
>> -        if (name[i] !=3D '\\') {
>> -            name[j++] =3D name[i];
>> -        } else if (name[i + 1] =3D=3D '\\') {
>> -            name[j++] =3D '\\';
>> -            i++;
>> -        } else if (name[i + 1] >=3D '0' && name[i + 1] <=3D '3' &&
>> -                   name[i + 2] >=3D '0' && name[i + 2] <=3D '7' &&
>> -                   name[i + 3] >=3D '0' && name[i + 3] <=3D '7') {
>> -            name[j++] =3D (name[i + 1] - '0') * 64 +
>> -                        (name[i + 2] - '0') * 8 +
>> -                        (name[i + 3] - '0');
>> -            i +=3D 3;
>> -        } else {
>> -            name[j++] =3D name[i];
>> -        }
>> -    }
>> -}
>> -
>> -static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>> -{
>> -    FsMount *mount;
>> -    char const *mountinfo =3D "/proc/self/mountinfo";
>> -    FILE *fp;
>> -    char *line =3D NULL, *dash;
>> -    size_t n;
>> -    char check;
>> -    unsigned int devmajor, devminor;
>> -    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
>> -
>> -    fp =3D fopen(mountinfo, "r");
>> -    if (!fp) {
>> -        return build_fs_mount_list_from_mtab(mounts, errp);
>> -    }
>> -
>> -    while (getline(&line, &n, fp) !=3D -1) {
>> -        ret =3D sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
>> -                     &devmajor, &devminor, &dir_s, &dir_e, &check);
>> -        if (ret < 3) {
>> -            continue;
>> -        }
>> -        dash =3D strstr(line + dir_e, " - ");
>> -        if (!dash) {
>> -            continue;
>> -        }
>> -        ret =3D sscanf(dash, " - %n%*s%n %n%*s%n%c",
>> -                     &type_s, &type_e, &dev_s, &dev_e, &check);
>> -        if (ret < 1) {
>> -            continue;
>> -        }
>> -        line[dir_e] =3D 0;
>> -        dash[type_e] =3D 0;
>> -        dash[dev_e] =3D 0;
>> -        decode_mntname(line + dir_s, dir_e - dir_s);
>> -        decode_mntname(dash + dev_s, dev_e - dev_s);
>> -        if (devmajor =3D=3D 0) {
>> -            /* btrfs reports major number =3D 0 */
>> -            if (strcmp("btrfs", dash + type_s) !=3D 0 ||
>> -                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0=
)
>> {
>> -                continue;
>> -            }
>> -        }
>> -
>> -        mount =3D g_new0(FsMount, 1);
>> -        mount->dirname =3D g_strdup(line + dir_s);
>> -        mount->devtype =3D g_strdup(dash + type_s);
>> -        mount->devmajor =3D devmajor;
>> -        mount->devminor =3D devminor;
>> -
>> -        QTAILQ_INSERT_TAIL(mounts, mount, next);
>> -    }
>> -    free(line);
>> -
>> -    fclose(fp);
>> -    return true;
>> -}
>>  #endif
>>
>>  #if defined(CONFIG_FSFREEZE)
>> @@ -1708,20 +1546,13 @@ int64_t qmp_guest_fsfreeze_freeze(Error **errp)
>>      return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
>>  }
>>
>> -/*
>> - * Walk list of mounted file systems in the guest, and freeze the ones
>> which
>> - * are real local file systems.
>> - */
>>  int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
>>                                         strList *mountpoints,
>>                                         Error **errp)
>>  {
>> -    int ret =3D 0, i =3D 0;
>> -    strList *list;
>> +    int ret;
>>      FsMountList mounts;
>> -    struct FsMount *mount;
>>      Error *local_err =3D NULL;
>> -    int fd;
>>
>>      slog("guest-fsfreeze called");
>>
>> @@ -1740,122 +1571,34 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool
>> has_mountpoints,
>>      /* cannot risk guest agent blocking itself on a write in this state
>> */
>>      ga_set_frozen(ga_state);
>>
>> -    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
>> -        /* To issue fsfreeze in the reverse order of mounts, check if t=
he
>> -         * mount is listed in the list here */
>> -        if (has_mountpoints) {
>> -            for (list =3D mountpoints; list; list =3D list->next) {
>> -                if (strcmp(list->value, mount->dirname) =3D=3D 0) {
>> -                    break;
>> -                }
>> -            }
>> -            if (!list) {
>> -                continue;
>> -            }
>> -        }
>> -
>> -        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>> -        if (fd =3D=3D -1) {
>> -            error_setg_errno(errp, errno, "failed to open %s",
>> mount->dirname);
>> -            goto error;
>> -        }
>> -
>> -        /* we try to cull filesystems we know won't work in advance, bu=
t
>> other
>> -         * filesystems may not implement fsfreeze for less obvious
>> reasons.
>> -         * these will report EOPNOTSUPP. we simply ignore these when
>> tallying
>> -         * the number of frozen filesystems.
>> -         * if a filesystem is mounted more than once (aka bind mount) a
>> -         * consecutive attempt to freeze an already frozen filesystem
>> will
>> -         * return EBUSY.
>> -         *
>> -         * any other error means a failure to freeze a filesystem we
>> -         * expect to be freezable, so return an error in those cases
>> -         * and return system to thawed state.
>> -         */
>> -        ret =3D ioctl(fd, FIFREEZE);
>> -        if (ret =3D=3D -1) {
>> -            if (errno !=3D EOPNOTSUPP && errno !=3D EBUSY) {
>> -                error_setg_errno(errp, errno, "failed to freeze %s",
>> -                                 mount->dirname);
>> -                close(fd);
>> -                goto error;
>> -            }
>> -        } else {
>> -            i++;
>> -        }
>> -        close(fd);
>> -    }
>> +    ret =3D qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoi=
nts,
>> +                                            mounts, errp);
>>
>>      free_fs_mount_list(&mounts);
>>      /* We may not issue any FIFREEZE here.
>>       * Just unset ga_state here and ready for the next call.
>>       */
>> -    if (i =3D=3D 0) {
>> +    if (ret =3D=3D 0) {
>>          ga_unset_frozen(ga_state);
>> +    } else if (ret < 0) {
>> +        qmp_guest_fsfreeze_thaw(NULL);
>>      }
>> -    return i;
>> -
>> -error:
>> -    free_fs_mount_list(&mounts);
>> -    qmp_guest_fsfreeze_thaw(NULL);
>> -    return 0;
>> +    return ret;
>>  }
>>
>> -/*
>> - * Walk list of frozen file systems in the guest, and thaw them.
>> - */
>>  int64_t qmp_guest_fsfreeze_thaw(Error **errp)
>>  {
>>      int ret;
>> -    FsMountList mounts;
>> -    FsMount *mount;
>> -    int fd, i =3D 0, logged;
>> -    Error *local_err =3D NULL;
>>
>> -    QTAILQ_INIT(&mounts);
>> -    if (!build_fs_mount_list(&mounts, &local_err)) {
>> -        error_propagate(errp, local_err);
>> -        return 0;
>> +    ret =3D qmp_guest_fsfreeze_do_thaw(errp);
>> +    if (ret >=3D 0) {
>> +        ga_unset_frozen(ga_state);
>> +        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
>> +    } else {
>> +        ret =3D 0;
>>      }
>>
>> -    QTAILQ_FOREACH(mount, &mounts, next) {
>> -        logged =3D false;
>> -        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>> -        if (fd =3D=3D -1) {
>> -            continue;
>> -        }
>> -        /* we have no way of knowing whether a filesystem was actually
>> unfrozen
>> -         * as a result of a successful call to FITHAW, only that if an
>> error
>> -         * was returned the filesystem was *not* unfrozen by that
>> particular
>> -         * call.
>> -         *
>> -         * since multiple preceding FIFREEZEs require multiple calls to
>> FITHAW
>> -         * to unfreeze, continuing issuing FITHAW until an error is
>> returned,
>> -         * in which case either the filesystem is in an unfreezable
>> state, or,
>> -         * more likely, it was thawed previously (and remains so
>> afterward).
>> -         *
>> -         * also, since the most recent successful call is the one that
>> did
>> -         * the actual unfreeze, we can use this to provide an accurate
>> count
>> -         * of the number of filesystems unfrozen by guest-fsfreeze-thaw=
,
>> which
>> -         * may * be useful for determining whether a filesystem was
>> unfrozen
>> -         * during the freeze/thaw phase by a process other than qemu-ga=
.
>> -         */
>> -        do {
>> -            ret =3D ioctl(fd, FITHAW);
>> -            if (ret =3D=3D 0 && !logged) {
>> -                i++;
>> -                logged =3D true;
>> -            }
>> -        } while (ret =3D=3D 0);
>> -        close(fd);
>> -    }
>> -
>> -    ga_unset_frozen(ga_state);
>> -    free_fs_mount_list(&mounts);
>> -
>> -    execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
>> -
>> -    return i;
>> +    return ret;
>>  }
>>
>>  static void guest_fsfreeze_cleanup(void)
>> diff --git a/qga/meson.build b/qga/meson.build
>> index a0ffd6d268..932b4e7ca8 100644
>> --- a/qga/meson.build
>> +++ b/qga/meson.build
>> @@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
>>    'commands-posix.c',
>>    'commands-posix-ssh.c',
>>  ))
>> +qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
>> +  'commands-linux.c',
>> +))
>>  qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
>>    'channel-win32.c',
>>    'commands-win32.c',
>> --
>> 2.34.1
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000540b1e05eafa22cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 14, 2022 at 11:56 AM Al=
exander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexan=
der.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">

 =20
  <div>
    <p>Hi<br>
    </p>
    <div>On 13.10.2022 14:10, Marc-Andr=C3=A9 Lureau
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">Hi<br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 13, 2022 at 1:2=
3
            PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In the next pat=
ches we
            are going to add FreeBSD support for QEMU Guest<br>
            Agent. In the result, code in commands-posix.c will be too
            cumbersome.<br>
            <br>
            Move Linux-specific FS freeze/thaw code to a separate file
            commands-linux.c<br>
            keeping common POSIX code in commands-posix.c.<br>
            <br>
            Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@=
redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
            Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&g=
t;<br>
            Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander=
.ivanov@virtuozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>=
&gt;<br>
            ---<br>
            =C2=A0qga/commands-common.h |=C2=A0 35 +++++<br>
            =C2=A0qga/commands-linux.c=C2=A0 | 286
            +++++++++++++++++++++++++++++++++++++++++<br>
            =C2=A0qga/commands-posix.c=C2=A0 | 289
            +++---------------------------------------<br>
            =C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03=
 +<br>
            =C2=A04 files changed, 340 insertions(+), 273 deletions(-)<br>
            =C2=A0create mode 100644 qga/commands-linux.c<br>
            <br>
            diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
            index d0e4a9696f..181fc330aa 100644<br>
            --- a/qga/commands-common.h<br>
            +++ b/qga/commands-common.h<br>
            @@ -10,6 +10,40 @@<br>
            =C2=A0#define QGA_COMMANDS_COMMON_H<br>
            <br>
            =C2=A0#include &quot;qga-qapi-types.h&quot;<br>
            +#include &quot;guest-agent-core.h&quot;<br>
            +#include &quot;qemu/queue.h&quot;<br>
            +<br>
            +#if defined(__linux__)<br>
            +#include &lt;linux/fs.h&gt;<br>
            +#ifdef FIFREEZE<br>
            +#define CONFIG_FSFREEZE<br>
            +#endif<br>
            +#ifdef FITRIM<br>
            +#define CONFIG_FSTRIM<br>
            +#endif<br>
            +#endif /* __linux__ */<br>
            +<br>
            +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
            +typedef struct FsMount {<br>
            +=C2=A0 =C2=A0 char *dirname;<br>
            +=C2=A0 =C2=A0 char *devtype;<br>
            +=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
            +=C2=A0 =C2=A0 QTAILQ_ENTRY(FsMount) next;<br>
            +} FsMount;<br>
            +<br>
            +typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;<br>
            +<br>
            +bool build_fs_mount_list(FsMountList *mounts, Error
            **errp);<br>
            +void free_fs_mount_list(FsMountList *mounts);<br>
            +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */<br>
            +<br>
            +#if defined(CONFIG_FSFREEZE)<br>
            +int64_t qmp_guest_fsfreeze_do_freeze_list(bool
            has_mountpoints,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strList
            *mountpoints,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 FsMountList
            mounts,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Error **errp);<br>
            +int qmp_guest_fsfreeze_do_thaw(Error **errp);<br>
            +#endif /* CONFIG_FSFREEZE */<br>
            <br>
            =C2=A0typedef struct GuestFileHandle GuestFileHandle;<br>
            <br>
            @@ -29,4 +63,5 @@ GuestFileRead
            *guest_file_read_unsafe(GuestFileHandle *gfh,<br>
            =C2=A0 */<br>
            =C2=A0char *qga_get_host_name(Error **errp);<br>
            <br>
            +void ga_wait_child(pid_t pid, int *status, Error **errp);<br>
          </blockquote>
          <div><br>
          </div>
          <div>This doesn&#39;t belong here, afaict.</div>
        </div>
      </div>
    </blockquote>
    <p>What do you mean, this patch or this place in the header file?</p></=
div></blockquote><div><br></div><div>I mean that this change doesn&#39;t lo=
ok necessary with this patch. <br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div>
    <p>I moved this function to the global scope because it was used in
      commands-posix.c</p>
    <p>and commands-linux.c in the first version of the patchset. But
      now we can leave</p>
    <p>the function static in commands-posix.c. Should I do it?<br></p></di=
v></blockquote><div><br></div><div>yes, don&#39;t change it if not needed, =
thanks !</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><p>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> =C2=A0#endif<b=
r>
            diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
            new file mode 100644<br>
            index 0000000000..214e408fcd<br>
            --- /dev/null<br>
            +++ b/qga/commands-linux.c<br>
            @@ -0,0 +1,286 @@<br>
            +/*<br>
            + * QEMU Guest Agent Linux-specific command implementations<br>
            + *<br>
            + * Copyright IBM Corp. 2011<br>
            + *<br>
            + * Authors:<br>
            + *=C2=A0 Michael Roth=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailt=
o:mdroth@linux.vnet.ibm.com" target=3D"_blank">mdroth@linux.vnet.ibm.com</a=
>&gt;<br>
            + *=C2=A0 Michal Privoznik=C2=A0 &lt;<a href=3D"mailto:mprivozn=
@redhat.com" target=3D"_blank">mprivozn@redhat.com</a>&gt;<br>
            + *<br>
            + * This work is licensed under the terms of the GNU GPL,
            version 2 or later.<br>
            + * See the COPYING file in the top-level directory.<br>
            + */<br>
            +<br>
            +#include &quot;qemu/osdep.h&quot;<br>
            +#include &quot;qapi/error.h&quot;<br>
            +#include &quot;commands-common.h&quot;<br>
            +#include &quot;cutils.h&quot;<br>
            +#include &lt;mntent.h&gt;<br>
            +#include &lt;sys/ioctl.h&gt;<br>
            +<br>
            +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
            +static int dev_major_minor(const char *devpath,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *devmajor, unsigned
            int *devminor)<br>
            +{<br>
            +=C2=A0 =C2=A0 struct stat st;<br>
            +<br>
            +=C2=A0 =C2=A0 *devmajor =3D 0;<br>
            +=C2=A0 =C2=A0 *devminor =3D 0;<br>
            +<br>
            +=C2=A0 =C2=A0 if (stat(devpath, &amp;st) &lt; 0) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;failed to stat device f=
ile &#39;%s&#39;: %s&quot;,
            devpath, strerror(errno));<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
            +=C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 if (S_ISDIR(st.st_mode)) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* It is bind mount */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -2;<br>
            +=C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 if (S_ISBLK(st.st_mode)) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devmajor =3D major(st.st_rdev);<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devminor =3D minor(st.st_rdev);<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
            +=C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 return -1;<br>
            +}<br>
            +<br>
            +static bool build_fs_mount_list_from_mtab(FsMountList
            *mounts, Error **errp)<br>
            +{<br>
            +=C2=A0 =C2=A0 struct mntent *ment;<br>
            +=C2=A0 =C2=A0 FsMount *mount;<br>
            +=C2=A0 =C2=A0 char const *mtab =3D &quot;/proc/self/mounts&quo=
t;;<br>
            +=C2=A0 =C2=A0 FILE *fp;<br>
            +=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
            +<br>
            +=C2=A0 =C2=A0 fp =3D setmntent(mtab, &quot;r&quot;);<br>
            +=C2=A0 =C2=A0 if (!fp) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to o=
pen mtab file: &#39;%s&#39;&quot;,
            mtab);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 while ((ment =3D getmntent(fp))) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* An entry which device name=
 doesn&#39;t start with a
            &#39;/&#39; is<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* either a dummy file system=
 or a network file
            system.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add special handling for s=
mbfs and cifs as is
            done by<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* coreutils as well.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ment-&gt;mnt_fsname[0] !=3D &=
#39;/&#39;) ||<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt=
_type, &quot;smbfs&quot;) =3D=3D 0) ||<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt=
_type, &quot;cifs&quot;) =3D=3D 0)) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_major_minor(ment-&gt;mnt_f=
sname,
            &amp;devmajor, &amp;devminor) =3D=3D -2) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip bind mounts =
*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(men=
t-&gt;mnt_dir);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(men=
t-&gt;mnt_type);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<b=
r>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, =
next);<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 endmntent(fp);<br>
            +=C2=A0 =C2=A0 return true;<br>
            +}<br>
            +<br>
            +static void decode_mntname(char *name, int len)<br>
            +{<br>
            +=C2=A0 =C2=A0 int i, j =3D 0;<br>
            +=C2=A0 =C2=A0 for (i =3D 0; i &lt;=3D len; i++) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name[i] !=3D &#39;\\&#39;) {<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i=
];<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] =3D=3D &#39=
;\\&#39;) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D &#39;\=
\&#39;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] &gt;=3D &#3=
9;0&#39; &amp;&amp; name[i
            + 1] &lt;=3D &#39;3&#39; &amp;&amp;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0name[i + 2] &gt;=3D &#39;0&#39; &amp;&amp; name[i
            + 2] &lt;=3D &#39;7&#39; &amp;&amp;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0name[i + 3] &gt;=3D &#39;0&#39; &amp;&amp; name[i
            + 3] &lt;=3D &#39;7&#39;) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D (name[=
i + 1] - &#39;0&#39;) * 64 +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (name[i + 2] - &#39;0&#39;) * 8 +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (name[i + 3] - &#39;0&#39;);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D 3;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i=
];<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 }<br>
            +}<br>
            +<br>
            +/*<br>
            + * Walk the mount table and build a list of local file
            systems<br>
            + */<br>
            +bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br=
>
            +{<br>
            +=C2=A0 =C2=A0 FsMount *mount;<br>
            +=C2=A0 =C2=A0 char const *mountinfo =3D &quot;/proc/self/mount=
info&quot;;<br>
            +=C2=A0 =C2=A0 FILE *fp;<br>
            +=C2=A0 =C2=A0 char *line =3D NULL, *dash;<br>
            +=C2=A0 =C2=A0 size_t n;<br>
            +=C2=A0 =C2=A0 char check;<br>
            +=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
            +=C2=A0 =C2=A0 int ret, dir_s, dir_e, type_s, type_e, dev_s, de=
v_e;<br>
            +<br>
            +=C2=A0 =C2=A0 fp =3D fopen(mountinfo, &quot;r&quot;);<br>
            +=C2=A0 =C2=A0 if (!fp) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return build_fs_mount_list_from_mt=
ab(mounts, errp);<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {=
<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(line, &quot;%*u %*u=
 %u:%u %*s %n%*s%n%c&quot;,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;devmajor, &amp;devminor,
            &amp;dir_s, &amp;dir_e, &amp;check);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 3) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash =3D strstr(line + dir_e, &quo=
t; - &quot;);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dash) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(dash, &quot; - %n%*=
s%n %n%*s%n%c&quot;,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;type_s, &amp;type_e, &amp;dev_s,
            &amp;dev_e, &amp;check);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 1) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 line[dir_e] =3D 0;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[type_e] =3D 0;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[dev_e] =3D 0;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(line + dir_s, dir_e=
 - dir_s);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(dash + dev_s, dev_e=
 - dev_s);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devmajor =3D=3D 0) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* btrfs reports maj=
or number =3D 0 */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(&quot;btr=
fs&quot;, dash + type_s) !=3D 0 ||<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_ma=
jor_minor(dash + dev_s,
            &amp;devmajor, &amp;devminor) &lt; 0) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contin=
ue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(lin=
e + dir_s);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(das=
h + type_s);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<b=
r>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, =
next);<br>
            +=C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 free(line);<br>
            +<br>
            +=C2=A0 =C2=A0 fclose(fp);<br>
            +=C2=A0 =C2=A0 return true;<br>
            +}<br>
            +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */<br>
            +<br>
            +#ifdef CONFIG_FSFREEZE<br>
            +/*<br>
            + * Walk list of mounted file systems in the guest, and
            freeze the ones which<br>
            + * are real local file systems.<br>
            + */<br>
            +int64_t qmp_guest_fsfreeze_do_freeze_list(bool
            has_mountpoints,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strList
            *mountpoints,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 FsMountList
            mounts,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Error **errp)<br>
            +{<br>
            +=C2=A0 =C2=A0 struct FsMount *mount;<br>
            +=C2=A0 =C2=A0 strList *list;<br>
            +=C2=A0 =C2=A0 int fd, ret, i =3D 0;<br>
            +<br>
            +=C2=A0 =C2=A0 QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next)=
 {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* To issue fsfreeze in the revers=
e order of
            mounts, check if the<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mount is listed in the lis=
t here */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_mountpoints) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (list =3D mountp=
oints; list; list =3D
            list-&gt;next) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (st=
rcmp(list-&gt;value,
            mount-&gt;dirname) =3D=3D 0) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!list) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contin=
ue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;=
dirname, O_RDONLY,
            0);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(err=
p, errno, &quot;failed to open
            %s&quot;, mount-&gt;dirname);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we try to cull filesystems we k=
now won&#39;t work in
            advance, but other<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implem=
ent fsfreeze for less
            obvious reasons.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these will report EOPNOTSU=
PP. we simply ignore
            these when tallying<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the number of frozen files=
ystems.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if a filesystem is mounted=
 more than once (aka
            bind mount) a<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* consecutive attempt to fre=
eze an already frozen
            filesystem will<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return EBUSY.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any other error means a fa=
ilure to freeze a
            filesystem we<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* expect to be freezable, so=
 return an error in
            those cases<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and return system to thawe=
d state.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FIFREEZE);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EOPNO=
TSUPP &amp;&amp; errno !=3D
            EBUSY) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_=
setg_errno(errp, errno, &quot;failed to
            freeze %s&quot;,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount-&gt;dirname);=
<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(=
fd);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 -1;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
            +=C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 return i;<br>
            +}<br>
            +<br>
            +int qmp_guest_fsfreeze_do_thaw(Error **errp)<br>
            +{<br>
            +=C2=A0 =C2=A0 int ret;<br>
            +=C2=A0 =C2=A0 FsMountList mounts;<br>
            +=C2=A0 =C2=A0 FsMount *mount;<br>
            +=C2=A0 =C2=A0 int fd, i =3D 0, logged;<br>
            +=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
            +<br>
            +=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
            +=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local=
_err))
            {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<=
br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D false;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;=
dirname, O_RDONLY,
            0);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we have no way of knowing wheth=
er a filesystem
            was actually unfrozen<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as a result of a successfu=
l call to FITHAW, only
            that if an error<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was returned the filesyste=
m was *not* unfrozen
            by that particular<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* call.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since multiple preceding F=
IFREEZEs require
            multiple calls to FITHAW<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to unfreeze, continuing is=
suing FITHAW until an
            error is returned,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in which case either the f=
ilesystem is in an
            unfreezable state, or,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* more likely, it was thawed=
 previously (and
            remains so afterward).<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* also, since the most recen=
t successful call is
            the one that did<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the actual unfreeze, we ca=
n use this to provide
            an accurate count<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the number of filesyste=
ms unfrozen by
            guest-fsfreeze-thaw, which<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may * be useful for determ=
ining whether a
            filesystem was unfrozen<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* during the freeze/thaw pha=
se by a process other
            than qemu-ga.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FI=
THAW);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0 &am=
p;&amp; !logged) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logged=
 =3D true;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (ret =3D=3D 0);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
            +<br>
            +=C2=A0 =C2=A0 return i;<br>
            +}<br>
            +#endif /* CONFIG_FSFREEZE */<br>
            diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
            index 16d67e9f6d..9574b83c92 100644<br>
            --- a/qga/commands-posix.c<br>
            +++ b/qga/commands-posix.c<br>
            @@ -16,11 +16,9 @@<br>
            =C2=A0#include &lt;sys/utsname.h&gt;<br>
            =C2=A0#include &lt;sys/wait.h&gt;<br>
            =C2=A0#include &lt;dirent.h&gt;<br>
            -#include &quot;guest-agent-core.h&quot;<br>
            =C2=A0#include &quot;qga-qapi-commands.h&quot;<br>
            =C2=A0#include &quot;qapi/error.h&quot;<br>
            =C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br>
            -#include &quot;qemu/queue.h&quot;<br>
            =C2=A0#include &quot;qemu/host-utils.h&quot;<br>
            =C2=A0#include &quot;qemu/sockets.h&quot;<br>
            =C2=A0#include &quot;qemu/base64.h&quot;<br>
            @@ -70,7 +68,7 @@<br>
            =C2=A0#endif<br>
            =C2=A0#endif<br>
            <br>
            -static void ga_wait_child(pid_t pid, int *status, Error
            **errp)<br>
            +void ga_wait_child(pid_t pid, int *status, Error **errp)<br>
            =C2=A0{<br>
            =C2=A0 =C2=A0 =C2=A0pid_t rpid;<br>
            <br>
            @@ -629,16 +627,7 @@ void qmp_guest_file_flush(int64_t
            handle, Error **errp)<br>
            =C2=A0#if defined(__linux__)<br>
            <br>
            =C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br=
>
            -typedef struct FsMount {<br>
            -=C2=A0 =C2=A0 char *dirname;<br>
            -=C2=A0 =C2=A0 char *devtype;<br>
            -=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
            -=C2=A0 =C2=A0 QTAILQ_ENTRY(FsMount) next;<br>
            -} FsMount;<br>
            -<br>
            -typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;<br>
            -<br>
            -static void free_fs_mount_list(FsMountList *mounts)<br>
            +void free_fs_mount_list(FsMountList *mounts)<br>
            =C2=A0{<br>
            =C2=A0 =C2=A0 =C2=A0 FsMount *mount, *temp;<br>
            <br>
            @@ -653,157 +642,6 @@ static void
            free_fs_mount_list(FsMountList *mounts)<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(mount);<br>
            =C2=A0 =C2=A0 =C2=A0 }<br>
            =C2=A0}<br>
            -<br>
            -static int dev_major_minor(const char *devpath,<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *devmajor, unsigned
            int *devminor)<br>
            -{<br>
            -=C2=A0 =C2=A0 struct stat st;<br>
            -<br>
            -=C2=A0 =C2=A0 *devmajor =3D 0;<br>
            -=C2=A0 =C2=A0 *devminor =3D 0;<br>
            -<br>
            -=C2=A0 =C2=A0 if (stat(devpath, &amp;st) &lt; 0) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;failed to stat device f=
ile &#39;%s&#39;: %s&quot;,
            devpath, strerror(errno));<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
            -=C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 if (S_ISDIR(st.st_mode)) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* It is bind mount */<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -2;<br>
            -=C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 if (S_ISBLK(st.st_mode)) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devmajor =3D major(st.st_rdev);<b=
r>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devminor =3D minor(st.st_rdev);<b=
r>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
            -=C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 return -1;<br>
            -}<br>
            -<br>
            -/*<br>
            - * Walk the mount table and build a list of local file
            systems<br>
            - */<br>
            -static bool build_fs_mount_list_from_mtab(FsMountList
            *mounts, Error **errp)<br>
            -{<br>
            -=C2=A0 =C2=A0 struct mntent *ment;<br>
            -=C2=A0 =C2=A0 FsMount *mount;<br>
            -=C2=A0 =C2=A0 char const *mtab =3D &quot;/proc/self/mounts&quo=
t;;<br>
            -=C2=A0 =C2=A0 FILE *fp;<br>
            -=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
            -<br>
            -=C2=A0 =C2=A0 fp =3D setmntent(mtab, &quot;r&quot;);<br>
            -=C2=A0 =C2=A0 if (!fp) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to o=
pen mtab file: &#39;%s&#39;&quot;,
            mtab);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
            -=C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 while ((ment =3D getmntent(fp))) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* An entry which device name=
 doesn&#39;t start with a
            &#39;/&#39; is<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* either a dummy file system=
 or a network file
            system.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add special handling for s=
mbfs and cifs as is
            done by<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* coreutils as well.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ment-&gt;mnt_fsname[0] !=3D &=
#39;/&#39;) ||<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt=
_type, &quot;smbfs&quot;) =3D=3D 0) ||<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt=
_type, &quot;cifs&quot;) =3D=3D 0)) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_major_minor(ment-&gt;mnt_f=
sname,
            &amp;devmajor, &amp;devminor) =3D=3D -2) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip bind mounts =
*/<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(men=
t-&gt;mnt_dir);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(men=
t-&gt;mnt_type);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<b=
r>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<b=
r>
            -<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, =
next);<br>
            -=C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 endmntent(fp);<br>
            -=C2=A0 =C2=A0 return true;<br>
            -}<br>
            -<br>
            -static void decode_mntname(char *name, int len)<br>
            -{<br>
            -=C2=A0 =C2=A0 int i, j =3D 0;<br>
            -=C2=A0 =C2=A0 for (i =3D 0; i &lt;=3D len; i++) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name[i] !=3D &#39;\\&#39;) {<b=
r>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i=
];<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] =3D=3D &#39=
;\\&#39;) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D &#39;\=
\&#39;;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] &gt;=3D &#3=
9;0&#39; &amp;&amp; name[i
            + 1] &lt;=3D &#39;3&#39; &amp;&amp;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0name[i + 2] &gt;=3D &#39;0&#39; &amp;&amp; name[i
            + 2] &lt;=3D &#39;7&#39; &amp;&amp;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0name[i + 3] &gt;=3D &#39;0&#39; &amp;&amp; name[i
            + 3] &lt;=3D &#39;7&#39;) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D (name[=
i + 1] - &#39;0&#39;) * 64 +<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (name[i + 2] - &#39;0&#39;) * 8 +<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (name[i + 3] - &#39;0&#39;);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D 3;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i=
];<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 }<br>
            -}<br>
            -<br>
            -static bool build_fs_mount_list(FsMountList *mounts, Error
            **errp)<br>
            -{<br>
            -=C2=A0 =C2=A0 FsMount *mount;<br>
            -=C2=A0 =C2=A0 char const *mountinfo =3D &quot;/proc/self/mount=
info&quot;;<br>
            -=C2=A0 =C2=A0 FILE *fp;<br>
            -=C2=A0 =C2=A0 char *line =3D NULL, *dash;<br>
            -=C2=A0 =C2=A0 size_t n;<br>
            -=C2=A0 =C2=A0 char check;<br>
            -=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
            -=C2=A0 =C2=A0 int ret, dir_s, dir_e, type_s, type_e, dev_s, de=
v_e;<br>
            -<br>
            -=C2=A0 =C2=A0 fp =3D fopen(mountinfo, &quot;r&quot;);<br>
            -=C2=A0 =C2=A0 if (!fp) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return build_fs_mount_list_from_mt=
ab(mounts, errp);<br>
            -=C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {=
<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(line, &quot;%*u %*u=
 %u:%u %*s %n%*s%n%c&quot;,<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;devmajor, &amp;devminor,
            &amp;dir_s, &amp;dir_e, &amp;check);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 3) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash =3D strstr(line + dir_e, &quo=
t; - &quot;);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dash) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(dash, &quot; - %n%*=
s%n %n%*s%n%c&quot;,<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;type_s, &amp;type_e, &amp;dev_s,
            &amp;dev_e, &amp;check);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 1) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 line[dir_e] =3D 0;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[type_e] =3D 0;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[dev_e] =3D 0;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(line + dir_s, dir_e=
 - dir_s);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(dash + dev_s, dev_e=
 - dev_s);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devmajor =3D=3D 0) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* btrfs reports maj=
or number =3D 0 */<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(&quot;btr=
fs&quot;, dash + type_s) !=3D 0 ||<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_ma=
jor_minor(dash + dev_s,
            &amp;devmajor, &amp;devminor) &lt; 0) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contin=
ue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(lin=
e + dir_s);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(das=
h + type_s);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<b=
r>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<b=
r>
            -<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, =
next);<br>
            -=C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 free(line);<br>
            -<br>
            -=C2=A0 =C2=A0 fclose(fp);<br>
            -=C2=A0 =C2=A0 return true;<br>
            -}<br>
            =C2=A0#endif<br>
            <br>
            =C2=A0#if defined(CONFIG_FSFREEZE)<br>
            @@ -1708,20 +1546,13 @@ int64_t
            qmp_guest_fsfreeze_freeze(Error **errp)<br>
            =C2=A0 =C2=A0 =C2=A0return qmp_guest_fsfreeze_freeze_list(false=
, NULL,
            errp);<br>
            =C2=A0}<br>
            <br>
            -/*<br>
            - * Walk list of mounted file systems in the guest, and
            freeze the ones which<br>
            - * are real local file systems.<br>
            - */<br>
            =C2=A0int64_t qmp_guest_fsfreeze_freeze_list(bool
            has_mountpoints,<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strList
            *mountpoints,<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Error **errp)<br>
            =C2=A0{<br>
            -=C2=A0 =C2=A0 int ret =3D 0, i =3D 0;<br>
            -=C2=A0 =C2=A0 strList *list;<br>
            +=C2=A0 =C2=A0 int ret;<br>
            =C2=A0 =C2=A0 =C2=A0FsMountList mounts;<br>
            -=C2=A0 =C2=A0 struct FsMount *mount;<br>
            =C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
            -=C2=A0 =C2=A0 int fd;<br>
            <br>
            =C2=A0 =C2=A0 =C2=A0slog(&quot;guest-fsfreeze called&quot;);<br=
>
            <br>
            @@ -1740,122 +1571,34 @@ int64_t
            qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,<br>
            =C2=A0 =C2=A0 =C2=A0/* cannot risk guest agent blocking itself =
on a write
            in this state */<br>
            =C2=A0 =C2=A0 =C2=A0ga_set_frozen(ga_state);<br>
            <br>
            -=C2=A0 =C2=A0 QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next)=
 {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* To issue fsfreeze in the revers=
e order of
            mounts, check if the<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mount is listed in the lis=
t here */<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_mountpoints) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (list =3D mountp=
oints; list; list =3D
            list-&gt;next) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (st=
rcmp(list-&gt;value,
            mount-&gt;dirname) =3D=3D 0) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!list) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contin=
ue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;=
dirname, O_RDONLY,
            0);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(err=
p, errno, &quot;failed to open
            %s&quot;, mount-&gt;dirname);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we try to cull filesystems we k=
now won&#39;t work in
            advance, but other<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implem=
ent fsfreeze for less
            obvious reasons.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these will report EOPNOTSU=
PP. we simply ignore
            these when tallying<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the number of frozen files=
ystems.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if a filesystem is mounted=
 more than once (aka
            bind mount) a<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* consecutive attempt to fre=
eze an already frozen
            filesystem will<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return EBUSY.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any other error means a fa=
ilure to freeze a
            filesystem we<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* expect to be freezable, so=
 return an error in
            those cases<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and return system to thawe=
d state.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FIFREEZE);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EOPNO=
TSUPP &amp;&amp; errno !=3D
            EBUSY) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_=
setg_errno(errp, errno, &quot;failed to
            freeze %s&quot;,<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount-&gt;dirname);=
<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(=
fd);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto e=
rror;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
            -=C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 ret =3D
            qmp_guest_fsfreeze_do_freeze_list(has_mountpoints,
            mountpoints,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mounts, errp);<br>
            <br>
            =C2=A0 =C2=A0 =C2=A0free_fs_mount_list(&amp;mounts);<br>
            =C2=A0 =C2=A0 =C2=A0/* We may not issue any FIFREEZE here.<br>
            =C2=A0 =C2=A0 =C2=A0 * Just unset ga_state here and ready for t=
he next
            call.<br>
            =C2=A0 =C2=A0 =C2=A0 */<br>
            -=C2=A0 =C2=A0 if (i =3D=3D 0) {<br>
            +=C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ga_unset_frozen(ga_state);<br=
>
            +=C2=A0 =C2=A0 } else if (ret &lt; 0) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(NULL);<br>
            =C2=A0 =C2=A0 =C2=A0}<br>
            -=C2=A0 =C2=A0 return i;<br>
            -<br>
            -error:<br>
            -=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
            -=C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(NULL);<br>
            -=C2=A0 =C2=A0 return 0;<br>
            +=C2=A0 =C2=A0 return ret;<br>
            =C2=A0}<br>
            <br>
            -/*<br>
            - * Walk list of frozen file systems in the guest, and thaw
            them.<br>
            - */<br>
            =C2=A0int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br>
            =C2=A0{<br>
            =C2=A0 =C2=A0 =C2=A0int ret;<br>
            -=C2=A0 =C2=A0 FsMountList mounts;<br>
            -=C2=A0 =C2=A0 FsMount *mount;<br>
            -=C2=A0 =C2=A0 int fd, i =3D 0, logged;<br>
            -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
            <br>
            -=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
            -=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local=
_err))
            {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<=
br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
            +=C2=A0 =C2=A0 ret =3D qmp_guest_fsfreeze_do_thaw(errp);<br>
            +=C2=A0 =C2=A0 if (ret &gt;=3D 0) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOO=
K_THAW, errp);<br>
            +=C2=A0 =C2=A0 } else {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
            =C2=A0 =C2=A0 =C2=A0}<br>
            <br>
            -=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D false;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;=
dirname, O_RDONLY,
            0);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we have no way of knowing wheth=
er a filesystem
            was actually unfrozen<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as a result of a successfu=
l call to FITHAW, only
            that if an error<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was returned the filesyste=
m was *not* unfrozen
            by that particular<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* call.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since multiple preceding F=
IFREEZEs require
            multiple calls to FITHAW<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to unfreeze, continuing is=
suing FITHAW until an
            error is returned,<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in which case either the f=
ilesystem is in an
            unfreezable state, or,<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* more likely, it was thawed=
 previously (and
            remains so afterward).<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* also, since the most recen=
t successful call is
            the one that did<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the actual unfreeze, we ca=
n use this to provide
            an accurate count<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the number of filesyste=
ms unfrozen by
            guest-fsfreeze-thaw, which<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may * be useful for determ=
ining whether a
            filesystem was unfrozen<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* during the freeze/thaw pha=
se by a process other
            than qemu-ga.<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FI=
THAW);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0 &am=
p;&amp; !logged) {<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<b=
r>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logged=
 =3D true;<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (ret =3D=3D 0);<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
            -=C2=A0 =C2=A0 }<br>
            -<br>
            -=C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
            -=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
            -<br>
            -=C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);=
<br>
            -<br>
            -=C2=A0 =C2=A0 return i;<br>
            +=C2=A0 =C2=A0 return ret;<br>
            =C2=A0}<br>
            <br>
            =C2=A0static void guest_fsfreeze_cleanup(void)<br>
            diff --git a/qga/meson.build b/qga/meson.build<br>
            index a0ffd6d268..932b4e7ca8 100644<br>
            --- a/qga/meson.build<br>
            +++ b/qga/meson.build<br>
            @@ -72,6 +72,9 @@ qga_ss.add(when: &#39;CONFIG_POSIX&#39;, if_t=
rue:
            files(<br>
            =C2=A0 =C2=A0&#39;commands-posix.c&#39;,<br>
            =C2=A0 =C2=A0&#39;commands-posix-ssh.c&#39;,<br>
            =C2=A0))<br>
            +qga_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(<br>
            +=C2=A0 &#39;commands-linux.c&#39;,<br>
            +))<br>
            =C2=A0qga_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(<=
br>
            =C2=A0 =C2=A0&#39;channel-win32.c&#39;,<br>
            =C2=A0 =C2=A0&#39;commands-win32.c&#39;,<br>
            -- <br>
            2.34.1<br>
            <br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <br>
        -- <br>
        <div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000540b1e05eafa22cf--

