Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715F5E7576
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:11:51 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdmn-0001mB-68
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdbI-00061y-5g
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:59:56 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obdb9-000144-0F
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:59:55 -0400
Received: by mail-lf1-x136.google.com with SMTP id u18so18519541lfo.8
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=v22PyHNKr8OEZpq+jKJZRj2mPx9aajsGA+HtS9o/zbQ=;
 b=a87DrGXwpOxCLs857V/jaoKCDuuHTAfFTRYUOEtHCW6c59W6hUC0k3HOIwOv8SVZ3i
 TlfSGZH8gPEstU70XuK9blrsOWOsqZ6Eo6kYBzVTVaw0cUclarnD49mGreUIHA6FsGfN
 OAA22kuM+slD3ZLPF7VxO6BeubTX/Brasezob/kQxeaMLMO85o2oTzFYAQQO6J/CbbKM
 6i6DtgNqno03Gwfd95PeYIATsYly6jwtGRn+yxW6bIvo6gQGqk+S5Zj4+o0XxgwRdlMV
 tIaXpg1E+Eqbbm2Mqf6b/s0htHdHgIXdH8kE2BDFacKmkCEJgZx+BOmwNUjBz0T+iZAt
 +Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=v22PyHNKr8OEZpq+jKJZRj2mPx9aajsGA+HtS9o/zbQ=;
 b=sT0RqgAkCojLvdCUTP/ZuFOC8Zjpfv0ELJnOjvyXluVxIpOGjj0z2UbBp7z5zO559W
 mL5wmF+xMA3j9HGpS+BJCHGpH+XREQtPunDcakil+2Xj1Ia9H/jVeGREXKM4PZS6rSwX
 tO5SzWF30k7X23TFwUAGVEv3UHoqLHDHl5qL9YS7Bje5tqPN0vZV1cWQLvv8lvmWqQl/
 eFJvzstB53ZGy4Yg31dZjcnUN60PVkv5+1KhKVrZNjIuXOGlXgSaDUZsgCy9XkKCKsgf
 cl6VduW/b/0afLw1GesCuMUpIyrhEVTB0GNcO8Vux83KAM8kj9UQqotp0Bkj6GeuyGbv
 eQPA==
X-Gm-Message-State: ACrzQf2SKqV52LWm36ofPt/58qt+TPp9hTLfbeOykEg4NE8a11RbsXvp
 ukUF5pBpBjBuLxWiSrbC5stMpNjAhjT/X2EJhm0=
X-Google-Smtp-Source: AMsMyM7chBlw9s7UQyWSCBUTo0cIYbVDLyMJge9muzDJyG8TfYupwZoO0qCYIQB4N43g7o4nJ000zG/vZeMAs21+eiQ=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr3038132lfb.167.1663919983943; Fri, 23
 Sep 2022 00:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-2-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220922132001.940334-2-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 09:59:26 +0200
Message-ID: <CAJ+F1CKNjr30P=q81uYxF0kZWc4AAFAoXuyiwULp=mYAv5FFTA@mail.gmail.com>
Subject: Re: [PATCH 1/5] qga: Move Linux-specific commands code to separate
 file
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="00000000000093e49b05e9538fe8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--00000000000093e49b05e9538fe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 22, 2022 at 4:33 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> In the next patches we are going to add FreeBSD support for QEMU Guest
> Agent. In the result, code in commands-posix.c will be too cumbersome.
> Move Linux-specific code to a separate file keeping common POSIX code in
> commands-posix.c.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>

lgtm, but moving 2000 lines in one patch is a bit hard to review.. Maybe
you can split this patch for the various moved commands? Although if enough
maintainers ack this patch, it's fine for me.

---
>  qga/commands-common.h |   34 +
>  qga/commands-linux.c  | 2242 ++++++++++++++++++++++++++++++++++++
>  qga/commands-posix.c  | 2558 +++--------------------------------------
>  qga/meson.build       |    3 +
>  4 files changed, 2447 insertions(+), 2390 deletions(-)
>  create mode 100644 qga/commands-linux.c
>
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index d0e4a9696f..aa0472ea4c 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -29,4 +29,38 @@ GuestFileRead *guest_file_read_unsafe(GuestFileHandle
> *gfh,
>   */
>  char *qga_get_host_name(Error **errp);
>
> +void ga_wait_child(pid_t pid, int *status, Error **errp);
> +
> +#if defined(__linux__)
> +#include <linux/fs.h>
> +#ifdef FIFREEZE
> +#define CONFIG_FSFREEZE
>  #endif
> +#ifdef FITRIM
> +#define CONFIG_FSTRIM
> +#endif
> +#endif /* __linux__*/
> +
> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> +typedef struct FsMount {
> +    char *dirname;
> +    char *devtype;
> +    unsigned int devmajor, devminor;
> +    QTAILQ_ENTRY(FsMount) next;
> +} FsMount;
> +
> +typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
> +
> +bool build_fs_mount_list(FsMountList *mounts, Error **errp);
> +void free_fs_mount_list(FsMountList *mounts);
> +#endif
> +
> +#if defined(CONFIG_FSFREEZE)
> +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
> +                                          strList *mountpoints,
> +                                          FsMountList mounts,
> +                                          Error **errp);
> +int qmp_guest_fsfreeze_do_thaw(Error **errp);
> +#endif
> +
> +#endif /* QGA_COMMANDS_COMMON_H */
> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
> new file mode 100644
> index 0000000000..615e9a0027
> --- /dev/null
> +++ b/qga/commands-linux.c
> @@ -0,0 +1,2242 @@
> +/*
> + * QEMU Guest Agent Linux-specific command implementations
> + *
> + * Copyright IBM Corp. 2011
> + *
> + * Authors:
> + *  Michael Roth      <mdroth@linux.vnet.ibm.com>
> + *  Michal Privoznik  <mprivozn@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <sys/ioctl.h>
> +#include "guest-agent-core.h"
> +#include "qga-qapi-commands.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/error.h"
> +#include "qemu/queue.h"
> +#include "qemu/base64.h"
> +#include "commands-common.h"
> +#include "block/nvme.h"
> +#include "cutils.h"
> +
> +#include <mntent.h>
> +#include <sys/statvfs.h>
> +#include <linux/nvme_ioctl.h>
> +
> +#ifdef CONFIG_LIBUDEV
> +#include <libudev.h>
> +#endif
> +
> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> +static int dev_major_minor(const char *devpath,
> +                           unsigned int *devmajor, unsigned int *devmino=
r)
> +{
> +    struct stat st;
> +
> +    *devmajor =3D 0;
> +    *devminor =3D 0;
> +
> +    if (stat(devpath, &st) < 0) {
> +        slog("failed to stat device file '%s': %s", devpath,
> strerror(errno));
> +        return -1;
> +    }
> +    if (S_ISDIR(st.st_mode)) {
> +        /* It is bind mount */
> +        return -2;
> +    }
> +    if (S_ISBLK(st.st_mode)) {
> +        *devmajor =3D major(st.st_rdev);
> +        *devminor =3D minor(st.st_rdev);
> +        return 0;
> +    }
> +    return -1;
> +}
> +
> +/*
> + * Walk the mount table and build a list of local file systems
> + */
> +static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error
> **errp)
> +{
> +    struct mntent *ment;
> +    FsMount *mount;
> +    char const *mtab =3D "/proc/self/mounts";
> +    FILE *fp;
> +    unsigned int devmajor, devminor;
> +
> +    fp =3D setmntent(mtab, "r");
> +    if (!fp) {
> +        error_setg(errp, "failed to open mtab file: '%s'", mtab);
> +        return false;
> +    }
> +
> +    while ((ment =3D getmntent(fp))) {
> +        /*
> +         * An entry which device name doesn't start with a '/' is
> +         * either a dummy file system or a network file system.
> +         * Add special handling for smbfs and cifs as is done by
> +         * coreutils as well.
> +         */
> +        if ((ment->mnt_fsname[0] !=3D '/') ||
> +            (strcmp(ment->mnt_type, "smbfs") =3D=3D 0) ||
> +            (strcmp(ment->mnt_type, "cifs") =3D=3D 0)) {
> +            continue;
> +        }
> +        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) =3D=
=3D
> -2) {
> +            /* Skip bind mounts */
> +            continue;
> +        }
> +
> +        mount =3D g_new0(FsMount, 1);
> +        mount->dirname =3D g_strdup(ment->mnt_dir);
> +        mount->devtype =3D g_strdup(ment->mnt_type);
> +        mount->devmajor =3D devmajor;
> +        mount->devminor =3D devminor;
> +
> +        QTAILQ_INSERT_TAIL(mounts, mount, next);
> +    }
> +
> +    endmntent(fp);
> +    return true;
> +}
> +
> +static void decode_mntname(char *name, int len)
> +{
> +    int i, j =3D 0;
> +    for (i =3D 0; i <=3D len; i++) {
> +        if (name[i] !=3D '\\') {
> +            name[j++] =3D name[i];
> +        } else if (name[i + 1] =3D=3D '\\') {
> +            name[j++] =3D '\\';
> +            i++;
> +        } else if (name[i + 1] >=3D '0' && name[i + 1] <=3D '3' &&
> +                   name[i + 2] >=3D '0' && name[i + 2] <=3D '7' &&
> +                   name[i + 3] >=3D '0' && name[i + 3] <=3D '7') {
> +            name[j++] =3D (name[i + 1] - '0') * 64 +
> +                        (name[i + 2] - '0') * 8 +
> +                        (name[i + 3] - '0');
> +            i +=3D 3;
> +        } else {
> +            name[j++] =3D name[i];
> +        }
> +    }
> +}
> +
> +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
> +{
> +    FsMount *mount;
> +    char const *mountinfo =3D "/proc/self/mountinfo";
> +    FILE *fp;
> +    char *line =3D NULL, *dash;
> +    size_t n;
> +    char check;
> +    unsigned int devmajor, devminor;
> +    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
> +
> +    fp =3D fopen(mountinfo, "r");
> +    if (!fp) {
> +        return build_fs_mount_list_from_mtab(mounts, errp);
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        ret =3D sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
> +                     &devmajor, &devminor, &dir_s, &dir_e, &check);
> +        if (ret < 3) {
> +            continue;
> +        }
> +        dash =3D strstr(line + dir_e, " - ");
> +        if (!dash) {
> +            continue;
> +        }
> +        ret =3D sscanf(dash, " - %n%*s%n %n%*s%n%c",
> +                     &type_s, &type_e, &dev_s, &dev_e, &check);
> +        if (ret < 1) {
> +            continue;
> +        }
> +        line[dir_e] =3D 0;
> +        dash[type_e] =3D 0;
> +        dash[dev_e] =3D 0;
> +        decode_mntname(line + dir_s, dir_e - dir_s);
> +        decode_mntname(dash + dev_s, dev_e - dev_s);
> +        if (devmajor =3D=3D 0) {
> +            /* btrfs reports major number =3D 0 */
> +            if (strcmp("btrfs", dash + type_s) !=3D 0 ||
> +                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0)=
 {
> +                continue;
> +            }
> +        }
> +
> +        mount =3D g_new0(FsMount, 1);
> +        mount->dirname =3D g_strdup(line + dir_s);
> +        mount->devtype =3D g_strdup(dash + type_s);
> +        mount->devmajor =3D devmajor;
> +        mount->devminor =3D devminor;
> +
> +        QTAILQ_INSERT_TAIL(mounts, mount, next);
> +    }
> +    free(line);
> +
> +    fclose(fp);
> +    return true;
> +}
> +#endif
> +
> +#if defined(CONFIG_FSFREEZE)
> +
> +static char *get_pci_driver(char const *syspath, int pathlen, Error
> **errp)
> +{
> +    char *path;
> +    char *dpath;
> +    char *driver =3D NULL;
> +    char buf[PATH_MAX];
> +    ssize_t len;
> +
> +    path =3D g_strndup(syspath, pathlen);
> +    dpath =3D g_strdup_printf("%s/driver", path);
> +    len =3D readlink(dpath, buf, sizeof(buf) - 1);
> +    if (len !=3D -1) {
> +        buf[len] =3D 0;
> +        driver =3D g_path_get_basename(buf);
> +    }
> +    g_free(dpath);
> +    g_free(path);
> +    return driver;
> +}
> +
> +static int compare_uint(const void *_a, const void *_b)
> +{
> +    unsigned int a =3D *(unsigned int *)_a;
> +    unsigned int b =3D *(unsigned int *)_b;
> +
> +    return a < b ? -1 : a > b ? 1 : 0;
> +}
> +
> +/* Walk the specified sysfs and build a sorted list of host or ata
> numbers */
> +static int build_hosts(char const *syspath, char const *host, bool ata,
> +                       unsigned int *hosts, int hosts_max, Error **errp)
> +{
> +    char *path;
> +    DIR *dir;
> +    struct dirent *entry;
> +    int i =3D 0;
> +
> +    path =3D g_strndup(syspath, host - syspath);
> +    dir =3D opendir(path);
> +    if (!dir) {
> +        error_setg_errno(errp, errno, "opendir(\"%s\")", path);
> +        g_free(path);
> +        return -1;
> +    }
> +
> +    while (i < hosts_max) {
> +        entry =3D readdir(dir);
> +        if (!entry) {
> +            break;
> +        }
> +        if (ata && sscanf(entry->d_name, "ata%d", hosts + i) =3D=3D 1) {
> +            ++i;
> +        } else if (!ata && sscanf(entry->d_name, "host%d", hosts + i) =
=3D=3D
> 1) {
> +            ++i;
> +        }
> +    }
> +
> +    qsort(hosts, i, sizeof(hosts[0]), compare_uint);
> +
> +    g_free(path);
> +    closedir(dir);
> +    return i;
> +}
> +
> +/*
> + * Store disk device info for devices on the PCI bus.
> + * Returns true if information has been stored, or false for failure.
> + */
> +static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
> +                                           GuestDiskAddress *disk,
> +                                           Error **errp)
> +{
> +    unsigned int pci[4], host, hosts[8], tgt[3];
> +    int i, nhosts =3D 0, pcilen;
> +    GuestPCIAddress *pciaddr =3D disk->pci_controller;
> +    bool has_ata =3D false, has_host =3D false, has_tgt =3D false;
> +    char *p, *q, *driver =3D NULL;
> +    bool ret =3D false;
> +
> +    p =3D strstr(syspath, "/devices/pci");
> +    if (!p || sscanf(p + 12, "%*x:%*x/%x:%x:%x.%x%n",
> +                     pci, pci + 1, pci + 2, pci + 3, &pcilen) < 4) {
> +        g_debug("only pci device is supported: sysfs path '%s'", syspath=
);
> +        return false;
> +    }
> +
> +    p +=3D 12 + pcilen;
> +    while (true) {
> +        driver =3D get_pci_driver(syspath, p - syspath, errp);
> +        if (driver && (g_str_equal(driver, "ata_piix") ||
> +                       g_str_equal(driver, "sym53c8xx") ||
> +                       g_str_equal(driver, "virtio-pci") ||
> +                       g_str_equal(driver, "ahci") ||
> +                       g_str_equal(driver, "nvme"))) {
> +            break;
> +        }
> +
> +        g_free(driver);
> +        if (sscanf(p, "/%x:%x:%x.%x%n",
> +                          pci, pci + 1, pci + 2, pci + 3, &pcilen) =3D=
=3D 4) {
> +            p +=3D pcilen;
> +            continue;
> +        }
> +
> +        g_debug("unsupported driver or sysfs path '%s'", syspath);
> +        return false;
> +    }
> +
> +    p =3D strstr(syspath, "/target");
> +    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
> +                    tgt, tgt + 1, tgt + 2) =3D=3D 3) {
> +        has_tgt =3D true;
> +    }
> +
> +    p =3D strstr(syspath, "/ata");
> +    if (p) {
> +        q =3D p + 4;
> +        has_ata =3D true;
> +    } else {
> +        p =3D strstr(syspath, "/host");
> +        q =3D p + 5;
> +    }
> +    if (p && sscanf(q, "%u", &host) =3D=3D 1) {
> +        has_host =3D true;
> +        nhosts =3D build_hosts(syspath, p, has_ata, hosts,
> +                             ARRAY_SIZE(hosts), errp);
> +        if (nhosts < 0) {
> +            goto cleanup;
> +        }
> +    }
> +
> +    pciaddr->domain =3D pci[0];
> +    pciaddr->bus =3D pci[1];
> +    pciaddr->slot =3D pci[2];
> +    pciaddr->function =3D pci[3];
> +
> +    if (strcmp(driver, "ata_piix") =3D=3D 0) {
> +        /* a host per ide bus, target*:0:<unit>:0 */
> +        if (!has_host || !has_tgt) {
> +            g_debug("invalid sysfs path '%s' (driver '%s')", syspath,
> driver);
> +            goto cleanup;
> +        }
> +        for (i =3D 0; i < nhosts; i++) {
> +            if (host =3D=3D hosts[i]) {
> +                disk->bus_type =3D GUEST_DISK_BUS_TYPE_IDE;
> +                disk->bus =3D i;
> +                disk->unit =3D tgt[1];
> +                break;
> +            }
> +        }
> +        if (i >=3D nhosts) {
> +            g_debug("no host for '%s' (driver '%s')", syspath, driver);
> +            goto cleanup;
> +        }
> +    } else if (strcmp(driver, "sym53c8xx") =3D=3D 0) {
> +        /* scsi(LSI Logic): target*:0:<unit>:0 */
> +        if (!has_tgt) {
> +            g_debug("invalid sysfs path '%s' (driver '%s')", syspath,
> driver);
> +            goto cleanup;
> +        }
> +        disk->bus_type =3D GUEST_DISK_BUS_TYPE_SCSI;
> +        disk->unit =3D tgt[1];
> +    } else if (strcmp(driver, "virtio-pci") =3D=3D 0) {
> +        if (has_tgt) {
> +            /* virtio-scsi: target*:0:0:<unit> */
> +            disk->bus_type =3D GUEST_DISK_BUS_TYPE_SCSI;
> +            disk->unit =3D tgt[2];
> +        } else {
> +            /* virtio-blk: 1 disk per 1 device */
> +            disk->bus_type =3D GUEST_DISK_BUS_TYPE_VIRTIO;
> +        }
> +    } else if (strcmp(driver, "ahci") =3D=3D 0) {
> +        /* ahci: 1 host per 1 unit */
> +        if (!has_host || !has_tgt) {
> +            g_debug("invalid sysfs path '%s' (driver '%s')", syspath,
> driver);
> +            goto cleanup;
> +        }
> +        for (i =3D 0; i < nhosts; i++) {
> +            if (host =3D=3D hosts[i]) {
> +                disk->unit =3D i;
> +                disk->bus_type =3D GUEST_DISK_BUS_TYPE_SATA;
> +                break;
> +            }
> +        }
> +        if (i >=3D nhosts) {
> +            g_debug("no host for '%s' (driver '%s')", syspath, driver);
> +            goto cleanup;
> +        }
> +    } else if (strcmp(driver, "nvme") =3D=3D 0) {
> +        disk->bus_type =3D GUEST_DISK_BUS_TYPE_NVME;
> +    } else {
> +        g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath=
);
> +        goto cleanup;
> +    }
> +
> +    ret =3D true;
> +
> +cleanup:
> +    g_free(driver);
> +    return ret;
> +}
> +
> +/*
> + * Store disk device info for non-PCI virtio devices (for example s390x
> + * channel I/O devices). Returns true if information has been stored, or
> + * false for failure.
> + */
> +static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,
> +                                                 GuestDiskAddress *disk,
> +                                                 Error **errp)
> +{
> +    unsigned int tgt[3];
> +    char *p;
> +
> +    if (!strstr(syspath, "/virtio") || !strstr(syspath, "/block")) {
> +        g_debug("Unsupported virtio device '%s'", syspath);
> +        return false;
> +    }
> +
> +    p =3D strstr(syspath, "/target");
> +    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
> +                    &tgt[0], &tgt[1], &tgt[2]) =3D=3D 3) {
> +        /* virtio-scsi: target*:0:<target>:<unit> */
> +        disk->bus_type =3D GUEST_DISK_BUS_TYPE_SCSI;
> +        disk->bus =3D tgt[0];
> +        disk->target =3D tgt[1];
> +        disk->unit =3D tgt[2];
> +    } else {
> +        /* virtio-blk: 1 disk per 1 device */
> +        disk->bus_type =3D GUEST_DISK_BUS_TYPE_VIRTIO;
> +    }
> +
> +    return true;
> +}
> +
> +/*
> + * Store disk device info for CCW devices (s390x channel I/O devices).
> + * Returns true if information has been stored, or false for failure.
> + */
> +static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
> +                                           GuestDiskAddress *disk,
> +                                           Error **errp)
> +{
> +    unsigned int cssid, ssid, subchno, devno;
> +    char *p;
> +
> +    p =3D strstr(syspath, "/devices/css");
> +    if (!p || sscanf(p + 12, "%*x/%x.%x.%x/%*x.%*x.%x/",
> +                     &cssid, &ssid, &subchno, &devno) < 4) {
> +        g_debug("could not parse ccw device sysfs path: %s", syspath);
> +        return false;
> +    }
> +
> +    disk->has_ccw_address =3D true;
> +    disk->ccw_address =3D g_new0(GuestCCWAddress, 1);
> +    disk->ccw_address->cssid =3D cssid;
> +    disk->ccw_address->ssid =3D ssid;
> +    disk->ccw_address->subchno =3D subchno;
> +    disk->ccw_address->devno =3D devno;
> +
> +    if (strstr(p, "/virtio")) {
> +        build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
> +    }
> +
> +    return true;
> +}
> +
> +/* Store disk device info specified by @sysfs into @fs */
> +static void build_guest_fsinfo_for_real_device(char const *syspath,
> +                                               GuestFilesystemInfo *fs,
> +                                               Error **errp)
> +{
> +    GuestDiskAddress *disk;
> +    GuestPCIAddress *pciaddr;
> +    bool has_hwinf;
> +#ifdef CONFIG_LIBUDEV
> +    struct udev *udev =3D NULL;
> +    struct udev_device *udevice =3D NULL;
> +#endif
> +
> +    pciaddr =3D g_new0(GuestPCIAddress, 1);
> +    pciaddr->domain =3D -1;                       /* -1 means field is
> invalid */
> +    pciaddr->bus =3D -1;
> +    pciaddr->slot =3D -1;
> +    pciaddr->function =3D -1;
> +
> +    disk =3D g_new0(GuestDiskAddress, 1);
> +    disk->pci_controller =3D pciaddr;
> +    disk->bus_type =3D GUEST_DISK_BUS_TYPE_UNKNOWN;
> +
> +#ifdef CONFIG_LIBUDEV
> +    udev =3D udev_new();
> +    udevice =3D udev_device_new_from_syspath(udev, syspath);
> +    if (udev =3D=3D NULL || udevice =3D=3D NULL) {
> +        g_debug("failed to query udev");
> +    } else {
> +        const char *devnode, *serial;
> +        devnode =3D udev_device_get_devnode(udevice);
> +        if (devnode !=3D NULL) {
> +            disk->dev =3D g_strdup(devnode);
> +            disk->has_dev =3D true;
> +        }
> +        serial =3D udev_device_get_property_value(udevice, "ID_SERIAL");
> +        if (serial !=3D NULL && *serial !=3D 0) {
> +            disk->serial =3D g_strdup(serial);
> +            disk->has_serial =3D true;
> +        }
> +    }
> +
> +    udev_unref(udev);
> +    udev_device_unref(udevice);
> +#endif
> +
> +    if (strstr(syspath, "/devices/pci")) {
> +        has_hwinf =3D build_guest_fsinfo_for_pci_dev(syspath, disk, errp=
);
> +    } else if (strstr(syspath, "/devices/css")) {
> +        has_hwinf =3D build_guest_fsinfo_for_ccw_dev(syspath, disk, errp=
);
> +    } else if (strstr(syspath, "/virtio")) {
> +        has_hwinf =3D build_guest_fsinfo_for_nonpci_virtio(syspath, disk=
,
> errp);
> +    } else {
> +        g_debug("Unsupported device type for '%s'", syspath);
> +        has_hwinf =3D false;
> +    }
> +
> +    if (has_hwinf || disk->has_dev || disk->has_serial) {
> +        QAPI_LIST_PREPEND(fs->disk, disk);
> +    } else {
> +        qapi_free_GuestDiskAddress(disk);
> +    }
> +}
> +
> +static void build_guest_fsinfo_for_device(char const *devpath,
> +                                          GuestFilesystemInfo *fs,
> +                                          Error **errp);
> +
> +/* Store a list of slave devices of virtual volume specified by @syspath
> into
> + * @fs */
> +static void build_guest_fsinfo_for_virtual_device(char const *syspath,
> +                                                  GuestFilesystemInfo *f=
s,
> +                                                  Error **errp)
> +{
> +    Error *err =3D NULL;
> +    DIR *dir;
> +    char *dirpath;
> +    struct dirent *entry;
> +
> +    dirpath =3D g_strdup_printf("%s/slaves", syspath);
> +    dir =3D opendir(dirpath);
> +    if (!dir) {
> +        if (errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "opendir(\"%s\")", dirpath);
> +        }
> +        g_free(dirpath);
> +        return;
> +    }
> +
> +    for (;;) {
> +        errno =3D 0;
> +        entry =3D readdir(dir);
> +        if (entry =3D=3D NULL) {
> +            if (errno) {
> +                error_setg_errno(errp, errno, "readdir(\"%s\")", dirpath=
);
> +            }
> +            break;
> +        }
> +
> +        if (entry->d_type =3D=3D DT_LNK) {
> +            char *path;
> +
> +            g_debug(" slave device '%s'", entry->d_name);
> +            path =3D g_strdup_printf("%s/slaves/%s", syspath,
> entry->d_name);
> +            build_guest_fsinfo_for_device(path, fs, &err);
> +            g_free(path);
> +
> +            if (err) {
> +                error_propagate(errp, err);
> +                break;
> +            }
> +        }
> +    }
> +
> +    g_free(dirpath);
> +    closedir(dir);
> +}
> +
> +static bool is_disk_virtual(const char *devpath, Error **errp)
> +{
> +    g_autofree char *syspath =3D realpath(devpath, NULL);
> +
> +    if (!syspath) {
> +        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +        return false;
> +    }
> +    return strstr(syspath, "/devices/virtual/block/") !=3D NULL;
> +}
> +
> +/* Dispatch to functions for virtual/real device */
> +static void build_guest_fsinfo_for_device(char const *devpath,
> +                                          GuestFilesystemInfo *fs,
> +                                          Error **errp)
> +{
> +    ERRP_GUARD();
> +    g_autofree char *syspath =3D NULL;
> +    bool is_virtual =3D false;
> +
> +    syspath =3D realpath(devpath, NULL);
> +    if (!syspath) {
> +        if (errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> +            return;
> +        }
> +
> +        /* ENOENT: This devpath may not exist because of container confi=
g
> */
> +        if (!fs->name) {
> +            fs->name =3D g_path_get_basename(devpath);
> +        }
> +        return;
> +    }
> +
> +    if (!fs->name) {
> +        fs->name =3D g_path_get_basename(syspath);
> +    }
> +
> +    g_debug("  parse sysfs path '%s'", syspath);
> +    is_virtual =3D is_disk_virtual(syspath, errp);
> +    if (*errp !=3D NULL) {
> +        return;
> +    }
> +    if (is_virtual) {
> +        build_guest_fsinfo_for_virtual_device(syspath, fs, errp);
> +    } else {
> +        build_guest_fsinfo_for_real_device(syspath, fs, errp);
> +    }
> +}
> +
> +#ifdef CONFIG_LIBUDEV
> +
> +/*
> + * Wrapper around build_guest_fsinfo_for_device() for getting just
> + * the disk address.
> + */
> +static GuestDiskAddress *get_disk_address(const char *syspath, Error
> **errp)
> +{
> +    g_autoptr(GuestFilesystemInfo) fs =3D NULL;
> +
> +    fs =3D g_new0(GuestFilesystemInfo, 1);
> +    build_guest_fsinfo_for_device(syspath, fs, errp);
> +    if (fs->disk !=3D NULL) {
> +        return g_steal_pointer(&fs->disk->value);
> +    }
> +    return NULL;
> +}
> +
> +static char *get_alias_for_syspath(const char *syspath)
> +{
> +    struct udev *udev =3D NULL;
> +    struct udev_device *udevice =3D NULL;
> +    char *ret =3D NULL;
> +
> +    udev =3D udev_new();
> +    if (udev =3D=3D NULL) {
> +        g_debug("failed to query udev");
> +        goto out;
> +    }
> +    udevice =3D udev_device_new_from_syspath(udev, syspath);
> +    if (udevice =3D=3D NULL) {
> +        g_debug("failed to query udev for path: %s", syspath);
> +        goto out;
> +    } else {
> +        const char *alias =3D udev_device_get_property_value(
> +            udevice, "DM_NAME");
> +        /*
> +         * NULL means there was an error and empty string means there is
> no
> +         * alias. In case of no alias we return NULL instead of empty
> string.
> +         */
> +        if (alias =3D=3D NULL) {
> +            g_debug("failed to query udev for device alias for: %s",
> +                syspath);
> +        } else if (*alias !=3D 0) {
> +            ret =3D g_strdup(alias);
> +        }
> +    }
> +
> +out:
> +    udev_unref(udev);
> +    udev_device_unref(udevice);
> +    return ret;
> +}
> +
> +static char *get_device_for_syspath(const char *syspath)
> +{
> +    struct udev *udev =3D NULL;
> +    struct udev_device *udevice =3D NULL;
> +    char *ret =3D NULL;
> +
> +    udev =3D udev_new();
> +    if (udev =3D=3D NULL) {
> +        g_debug("failed to query udev");
> +        goto out;
> +    }
> +    udevice =3D udev_device_new_from_syspath(udev, syspath);
> +    if (udevice =3D=3D NULL) {
> +        g_debug("failed to query udev for path: %s", syspath);
> +        goto out;
> +    } else {
> +        ret =3D g_strdup(udev_device_get_devnode(udevice));
> +    }
> +
> +out:
> +    udev_unref(udev);
> +    udev_device_unref(udevice);
> +    return ret;
> +}
> +
> +static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
> +{
> +    g_autofree char *deps_dir =3D NULL;
> +    const gchar *dep;
> +    GDir *dp_deps =3D NULL;
> +
> +    /* List dependent disks */
> +    deps_dir =3D g_strdup_printf("%s/slaves", disk_dir);
> +    g_debug("  listing entries in: %s", deps_dir);
> +    dp_deps =3D g_dir_open(deps_dir, 0, NULL);
> +    if (dp_deps =3D=3D NULL) {
> +        g_debug("failed to list entries in %s", deps_dir);
> +        return;
> +    }
> +    disk->has_dependencies =3D true;
> +    while ((dep =3D g_dir_read_name(dp_deps)) !=3D NULL) {
> +        g_autofree char *dep_dir =3D NULL;
> +        char *dev_name;
> +
> +        /* Add dependent disks */
> +        dep_dir =3D g_strdup_printf("%s/%s", deps_dir, dep);
> +        dev_name =3D get_device_for_syspath(dep_dir);
> +        if (dev_name !=3D NULL) {
> +            g_debug("  adding dependent device: %s", dev_name);
> +            QAPI_LIST_PREPEND(disk->dependencies, dev_name);
> +        }
> +    }
> +    g_dir_close(dp_deps);
> +}
> +
> +/*
> + * Detect partitions subdirectory, name is "<disk_name><number>" or
> + * "<disk_name>p<number>"
> + *
> + * @disk_name -- last component of /sys path (e.g. sda)
> + * @disk_dir -- sys path of the disk (e.g. /sys/block/sda)
> + * @disk_dev -- device node of the disk (e.g. /dev/sda)
> + */
> +static GuestDiskInfoList *get_disk_partitions(
> +    GuestDiskInfoList *list,
> +    const char *disk_name, const char *disk_dir,
> +    const char *disk_dev)
> +{
> +    GuestDiskInfoList *ret =3D list;
> +    struct dirent *de_disk;
> +    DIR *dp_disk =3D NULL;
> +    size_t len =3D strlen(disk_name);
> +
> +    dp_disk =3D opendir(disk_dir);
> +    while ((de_disk =3D readdir(dp_disk)) !=3D NULL) {
> +        g_autofree char *partition_dir =3D NULL;
> +        char *dev_name;
> +        GuestDiskInfo *partition;
> +
> +        if (!(de_disk->d_type & DT_DIR)) {
> +            continue;
> +        }
> +
> +        if (!(strncmp(disk_name, de_disk->d_name, len) =3D=3D 0 &&
> +            ((*(de_disk->d_name + len) =3D=3D 'p' &&
> +            isdigit(*(de_disk->d_name + len + 1))) ||
> +                isdigit(*(de_disk->d_name + len))))) {
> +            continue;
> +        }
> +
> +        partition_dir =3D g_strdup_printf("%s/%s",
> +            disk_dir, de_disk->d_name);
> +        dev_name =3D get_device_for_syspath(partition_dir);
> +        if (dev_name =3D=3D NULL) {
> +            g_debug("Failed to get device name for syspath: %s",
> +                disk_dir);
> +            continue;
> +        }
> +        partition =3D g_new0(GuestDiskInfo, 1);
> +        partition->name =3D dev_name;
> +        partition->partition =3D true;
> +        partition->has_dependencies =3D true;
> +        /* Add parent disk as dependent for easier tracking of hierarchy
> */
> +        QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev));
> +
> +        QAPI_LIST_PREPEND(ret, partition);
> +    }
> +    closedir(dp_disk);
> +
> +    return ret;
> +}
> +
> +static void get_nvme_smart(GuestDiskInfo *disk)
> +{
> +    int fd;
> +    GuestNVMeSmart *smart;
> +    NvmeSmartLog log =3D {0};
> +    struct nvme_admin_cmd cmd =3D {
> +        .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,
> +        .nsid =3D NVME_NSID_BROADCAST,
> +        .addr =3D (uintptr_t)&log,
> +        .data_len =3D sizeof(log),
> +        .cdw10 =3D NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
> +                 | (((sizeof(log) >> 2) - 1) << 16)
> +    };
> +
> +    fd =3D qga_open_cloexec(disk->name, O_RDONLY, 0);
> +    if (fd =3D=3D -1) {
> +        g_debug("Failed to open device: %s: %s", disk->name,
> g_strerror(errno));
> +        return;
> +    }
> +
> +    if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
> +        g_debug("Failed to get smart: %s: %s", disk->name,
> g_strerror(errno));
> +        close(fd);
> +        return;
> +    }
> +
> +    disk->has_smart =3D true;
> +    disk->smart =3D g_new0(GuestDiskSmart, 1);
> +    disk->smart->type =3D GUEST_DISK_BUS_TYPE_NVME;
> +
> +    smart =3D &disk->smart->u.nvme;
> +    smart->critical_warning =3D log.critical_warning;
> +    smart->temperature =3D lduw_le_p(&log.temperature); /* unaligned fie=
ld
> */
> +    smart->available_spare =3D log.available_spare;
> +    smart->available_spare_threshold =3D log.available_spare_threshold;
> +    smart->percentage_used =3D log.percentage_used;
> +    smart->data_units_read_lo =3D le64_to_cpu(log.data_units_read[0]);
> +    smart->data_units_read_hi =3D le64_to_cpu(log.data_units_read[1]);
> +    smart->data_units_written_lo =3D le64_to_cpu(log.data_units_written[=
0]);
> +    smart->data_units_written_hi =3D le64_to_cpu(log.data_units_written[=
1]);
> +    smart->host_read_commands_lo =3D le64_to_cpu(log.host_read_commands[=
0]);
> +    smart->host_read_commands_hi =3D le64_to_cpu(log.host_read_commands[=
1]);
> +    smart->host_write_commands_lo =3D
> le64_to_cpu(log.host_write_commands[0]);
> +    smart->host_write_commands_hi =3D
> le64_to_cpu(log.host_write_commands[1]);
> +    smart->controller_busy_time_lo =3D
> le64_to_cpu(log.controller_busy_time[0]);
> +    smart->controller_busy_time_hi =3D
> le64_to_cpu(log.controller_busy_time[1]);
> +    smart->power_cycles_lo =3D le64_to_cpu(log.power_cycles[0]);
> +    smart->power_cycles_hi =3D le64_to_cpu(log.power_cycles[1]);
> +    smart->power_on_hours_lo =3D le64_to_cpu(log.power_on_hours[0]);
> +    smart->power_on_hours_hi =3D le64_to_cpu(log.power_on_hours[1]);
> +    smart->unsafe_shutdowns_lo =3D le64_to_cpu(log.unsafe_shutdowns[0]);
> +    smart->unsafe_shutdowns_hi =3D le64_to_cpu(log.unsafe_shutdowns[1]);
> +    smart->media_errors_lo =3D le64_to_cpu(log.media_errors[0]);
> +    smart->media_errors_hi =3D le64_to_cpu(log.media_errors[1]);
> +    smart->number_of_error_log_entries_lo =3D
> +        le64_to_cpu(log.number_of_error_log_entries[0]);
> +    smart->number_of_error_log_entries_hi =3D
> +        le64_to_cpu(log.number_of_error_log_entries[1]);
> +
> +    close(fd);
> +}
> +
> +static void get_disk_smart(GuestDiskInfo *disk)
> +{
> +    if (disk->has_address
> +        && (disk->address->bus_type =3D=3D GUEST_DISK_BUS_TYPE_NVME)) {
> +        get_nvme_smart(disk);
> +    }
> +}
> +
> +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> +{
> +    GuestDiskInfoList *ret =3D NULL;
> +    GuestDiskInfo *disk;
> +    DIR *dp =3D NULL;
> +    struct dirent *de =3D NULL;
> +
> +    g_debug("listing /sys/block directory");
> +    dp =3D opendir("/sys/block");
> +    if (dp =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "Can't open directory
> \"/sys/block\"");
> +        return NULL;
> +    }
> +    while ((de =3D readdir(dp)) !=3D NULL) {
> +        g_autofree char *disk_dir =3D NULL, *line =3D NULL,
> +            *size_path =3D NULL;
> +        char *dev_name;
> +        Error *local_err =3D NULL;
> +        if (de->d_type !=3D DT_LNK) {
> +            g_debug("  skipping entry: %s", de->d_name);
> +            continue;
> +        }
> +
> +        /* Check size and skip zero-sized disks */
> +        g_debug("  checking disk size");
> +        size_path =3D g_strdup_printf("/sys/block/%s/size", de->d_name);
> +        if (!g_file_get_contents(size_path, &line, NULL, NULL)) {
> +            g_debug("  failed to read disk size");
> +            continue;
> +        }
> +        if (g_strcmp0(line, "0\n") =3D=3D 0) {
> +            g_debug("  skipping zero-sized disk");
> +            continue;
> +        }
> +
> +        g_debug("  adding %s", de->d_name);
> +        disk_dir =3D g_strdup_printf("/sys/block/%s", de->d_name);
> +        dev_name =3D get_device_for_syspath(disk_dir);
> +        if (dev_name =3D=3D NULL) {
> +            g_debug("Failed to get device name for syspath: %s",
> +                disk_dir);
> +            continue;
> +        }
> +        disk =3D g_new0(GuestDiskInfo, 1);
> +        disk->name =3D dev_name;
> +        disk->partition =3D false;
> +        disk->alias =3D get_alias_for_syspath(disk_dir);
> +        disk->has_alias =3D (disk->alias !=3D NULL);
> +        QAPI_LIST_PREPEND(ret, disk);
> +
> +        /* Get address for non-virtual devices */
> +        bool is_virtual =3D is_disk_virtual(disk_dir, &local_err);
> +        if (local_err !=3D NULL) {
> +            g_debug("  failed to check disk path, ignoring error: %s",
> +                error_get_pretty(local_err));
> +            error_free(local_err);
> +            local_err =3D NULL;
> +            /* Don't try to get the address */
> +            is_virtual =3D true;
> +        }
> +        if (!is_virtual) {
> +            disk->address =3D get_disk_address(disk_dir, &local_err);
> +            if (local_err !=3D NULL) {
> +                g_debug("  failed to get device info, ignoring error: %s=
",
> +                    error_get_pretty(local_err));
> +                error_free(local_err);
> +                local_err =3D NULL;
> +            } else if (disk->address !=3D NULL) {
> +                disk->has_address =3D true;
> +            }
> +        }
> +
> +        get_disk_deps(disk_dir, disk);
> +        get_disk_smart(disk);
> +        ret =3D get_disk_partitions(ret, de->d_name, disk_dir, dev_name)=
;
> +    }
> +
> +    closedir(dp);
> +
> +    return ret;
> +}
> +
> +#else
> +
> +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +#endif
> +
> +/* Return a list of the disk device(s)' info which @mount lies on */
> +static GuestFilesystemInfo *build_guest_fsinfo(struct FsMount *mount,
> +                                               Error **errp)
> +{
> +    GuestFilesystemInfo *fs =3D g_malloc0(sizeof(*fs));
> +    struct statvfs buf;
> +    unsigned long used, nonroot_total, fr_size;
> +    char *devpath =3D g_strdup_printf("/sys/dev/block/%u:%u",
> +                                    mount->devmajor, mount->devminor);
> +
> +    fs->mountpoint =3D g_strdup(mount->dirname);
> +    fs->type =3D g_strdup(mount->devtype);
> +    build_guest_fsinfo_for_device(devpath, fs, errp);
> +
> +    if (statvfs(fs->mountpoint, &buf) =3D=3D 0) {
> +        fr_size =3D buf.f_frsize;
> +        used =3D buf.f_blocks - buf.f_bfree;
> +        nonroot_total =3D used + buf.f_bavail;
> +        fs->used_bytes =3D used * fr_size;
> +        fs->total_bytes =3D nonroot_total * fr_size;
> +
> +        fs->has_total_bytes =3D true;
> +        fs->has_used_bytes =3D true;
> +    }
> +
> +    g_free(devpath);
> +
> +    return fs;
> +}
> +
> +GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
> +{
> +    FsMountList mounts;
> +    struct FsMount *mount;
> +    GuestFilesystemInfoList *ret =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    QTAILQ_INIT(&mounts);
> +    if (!build_fs_mount_list(&mounts, &local_err)) {
> +        error_propagate(errp, local_err);
> +        return NULL;
> +    }
> +
> +    QTAILQ_FOREACH(mount, &mounts, next) {
> +        g_debug("Building guest fsinfo for '%s'", mount->dirname);
> +
> +        QAPI_LIST_PREPEND(ret, build_guest_fsinfo(mount, &local_err));
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            qapi_free_GuestFilesystemInfoList(ret);
> +            ret =3D NULL;
> +            break;
> +        }
> +    }
> +
> +    free_fs_mount_list(&mounts);
> +    return ret;
> +}
> +
> +/*
> + * Walk list of mounted file systems in the guest, and freeze the ones
> which
> + * are real local file systems.
> + */
> +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
> +                                          strList *mountpoints,
> +                                          FsMountList mounts,
> +                                          Error **errp)
> +{
> +    struct FsMount *mount;
> +    strList *list;
> +    int fd, ret, i =3D 0;
> +
> +    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
> +        /* To issue fsfreeze in the reverse order of mounts, check if th=
e
> +         * mount is listed in the list here */
> +        if (has_mountpoints) {
> +            for (list =3D mountpoints; list; list =3D list->next) {
> +                if (strcmp(list->value, mount->dirname) =3D=3D 0) {
> +                    break;
> +                }
> +            }
> +            if (!list) {
> +                continue;
> +            }
> +        }
> +
> +        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> +        if (fd =3D=3D -1) {
> +            error_setg_errno(errp, errno, "failed to open %s",
> mount->dirname);
> +            return -1;
> +        }
> +
> +        /* we try to cull filesystems we know won't work in advance, but
> other
> +         * filesystems may not implement fsfreeze for less obvious
> reasons.
> +         * these will report EOPNOTSUPP. we simply ignore these when
> tallying
> +         * the number of frozen filesystems.
> +         * if a filesystem is mounted more than once (aka bind mount) a
> +         * consecutive attempt to freeze an already frozen filesystem wi=
ll
> +         * return EBUSY.
> +         *
> +         * any other error means a failure to freeze a filesystem we
> +         * expect to be freezable, so return an error in those cases
> +         * and return system to thawed state.
> +         */
> +        ret =3D ioctl(fd, FIFREEZE);
> +        if (ret =3D=3D -1) {
> +            if (errno !=3D EOPNOTSUPP && errno !=3D EBUSY) {
> +                error_setg_errno(errp, errno, "failed to freeze %s",
> +                                 mount->dirname);
> +                close(fd);
> +                return -1;
> +            }
> +        } else {
> +            i++;
> +        }
> +        close(fd);
> +    }
> +    return i;
> +}
> +
> +int qmp_guest_fsfreeze_do_thaw(Error **errp)
> +{
> +    int ret;
> +    FsMountList mounts;
> +    FsMount *mount;
> +    int fd, i =3D 0, logged;
> +    Error *local_err =3D NULL;
> +
> +    QTAILQ_INIT(&mounts);
> +    if (!build_fs_mount_list(&mounts, &local_err)) {
> +        error_propagate(errp, local_err);
> +        return -1;
> +    }
> +
> +    QTAILQ_FOREACH(mount, &mounts, next) {
> +        logged =3D false;
> +        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> +        if (fd =3D=3D -1) {
> +            continue;
> +        }
> +        /* we have no way of knowing whether a filesystem was actually
> unfrozen
> +         * as a result of a successful call to FITHAW, only that if an
> error
> +         * was returned the filesystem was *not* unfrozen by that
> particular
> +         * call.
> +         *
> +         * since multiple preceding FIFREEZEs require multiple calls to
> FITHAW
> +         * to unfreeze, continuing issuing FITHAW until an error is
> returned,
> +         * in which case either the filesystem is in an unfreezable
> state, or,
> +         * more likely, it was thawed previously (and remains so
> afterward).
> +         *
> +         * also, since the most recent successful call is the one that d=
id
> +         * the actual unfreeze, we can use this to provide an accurate
> count
> +         * of the number of filesystems unfrozen by guest-fsfreeze-thaw,
> which
> +         * may * be useful for determining whether a filesystem was
> unfrozen
> +         * during the freeze/thaw phase by a process other than qemu-ga.
> +         */
> +        do {
> +            ret =3D ioctl(fd, FITHAW);
> +            if (ret =3D=3D 0 && !logged) {
> +                i++;
> +                logged =3D true;
> +            }
> +        } while (ret =3D=3D 0);
> +        close(fd);
> +    }
> +
> +    free_fs_mount_list(&mounts);
> +
> +    return i;
> +}
> +#endif /* CONFIG_FSFREEZE */
> +
> +#if defined(CONFIG_FSTRIM)
> +/*
> + * Walk list of mounted file systems in the guest, and trim them.
> + */
> +GuestFilesystemTrimResponse *
> +qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
> +{
> +    GuestFilesystemTrimResponse *response;
> +    GuestFilesystemTrimResult *result;
> +    int ret =3D 0;
> +    FsMountList mounts;
> +    struct FsMount *mount;
> +    int fd;
> +    struct fstrim_range r;
> +
> +    slog("guest-fstrim called");
> +
> +    QTAILQ_INIT(&mounts);
> +    if (!build_fs_mount_list(&mounts, errp)) {
> +        return NULL;
> +    }
> +
> +    response =3D g_malloc0(sizeof(*response));
> +
> +    QTAILQ_FOREACH(mount, &mounts, next) {
> +        result =3D g_malloc0(sizeof(*result));
> +        result->path =3D g_strdup(mount->dirname);
> +
> +        QAPI_LIST_PREPEND(response->paths, result);
> +
> +        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> +        if (fd =3D=3D -1) {
> +            result->error =3D g_strdup_printf("failed to open: %s",
> +                                            strerror(errno));
> +            result->has_error =3D true;
> +            continue;
> +        }
> +
> +        /* We try to cull filesystems we know won't work in advance, but
> other
> +         * filesystems may not implement fstrim for less obvious reasons=
.
> +         * These will report EOPNOTSUPP; while in some other cases ENOTT=
Y
> +         * will be reported (e.g. CD-ROMs).
> +         * Any other error means an unexpected error.
> +         */
> +        r.start =3D 0;
> +        r.len =3D -1;
> +        r.minlen =3D has_minimum ? minimum : 0;
> +        ret =3D ioctl(fd, FITRIM, &r);
> +        if (ret =3D=3D -1) {
> +            result->has_error =3D true;
> +            if (errno =3D=3D ENOTTY || errno =3D=3D EOPNOTSUPP) {
> +                result->error =3D g_strdup("trim not supported");
> +            } else {
> +                result->error =3D g_strdup_printf("failed to trim: %s",
> +                                                strerror(errno));
> +            }
> +            close(fd);
> +            continue;
> +        }
> +
> +        result->has_minimum =3D true;
> +        result->minimum =3D r.minlen;
> +        result->has_trimmed =3D true;
> +        result->trimmed =3D r.len;
> +        close(fd);
> +    }
> +
> +    free_fs_mount_list(&mounts);
> +    return response;
> +}
> +#endif /* CONFIG_FSTRIM */
> +
> +
> +#define LINUX_SYS_STATE_FILE "/sys/power/state"
> +#define SUSPEND_SUPPORTED 0
> +#define SUSPEND_NOT_SUPPORTED 1
> +
> +typedef enum {
> +    SUSPEND_MODE_DISK =3D 0,
> +    SUSPEND_MODE_RAM =3D 1,
> +    SUSPEND_MODE_HYBRID =3D 2,
> +} SuspendMode;
> +
> +/*
> + * Executes a command in a child process using g_spawn_sync,
> + * returning an int >=3D 0 representing the exit status of the
> + * process.
> + *
> + * If the program wasn't found in path, returns -1.
> + *
> + * If a problem happened when creating the child process,
> + * returns -1 and errp is set.
> + */
> +static int run_process_child(const char *command[], Error **errp)
> +{
> +    int exit_status, spawn_flag;
> +    GError *g_err =3D NULL;
> +    bool success;
> +
> +    spawn_flag =3D G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_NULL |
> +                 G_SPAWN_STDERR_TO_DEV_NULL;
> +
> +    success =3D  g_spawn_sync(NULL, (char **)command, NULL, spawn_flag,
> +                            NULL, NULL, NULL, NULL,
> +                            &exit_status, &g_err);
> +
> +    if (success) {
> +        return WEXITSTATUS(exit_status);
> +    }
> +
> +    if (g_err && (g_err->code !=3D G_SPAWN_ERROR_NOENT)) {
> +        error_setg(errp, "failed to create child process, error '%s'",
> +                   g_err->message);
> +    }
> +
> +    g_error_free(g_err);
> +    return -1;
> +}
> +
> +static bool systemd_supports_mode(SuspendMode mode, Error **errp)
> +{
> +    const char *systemctl_args[3] =3D {"systemd-hibernate",
> "systemd-suspend",
> +                                     "systemd-hybrid-sleep"};
> +    const char *cmd[4] =3D {"systemctl", "status", systemctl_args[mode],
> NULL};
> +    int status;
> +
> +    status =3D run_process_child(cmd, errp);
> +
> +    /*
> +     * systemctl status uses LSB return codes so we can expect
> +     * status > 0 and be ok. To assert if the guest has support
> +     * for the selected suspend mode, status should be < 4. 4 is
> +     * the code for unknown service status, the return value when
> +     * the service does not exist. A common value is status =3D 3
> +     * (program is not running).
> +     */
> +    if (status > 0 && status < 4) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +static void systemd_suspend(SuspendMode mode, Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    const char *systemctl_args[3] =3D {"hibernate", "suspend",
> "hybrid-sleep"};
> +    const char *cmd[3] =3D {"systemctl", systemctl_args[mode], NULL};
> +    int status;
> +
> +    status =3D run_process_child(cmd, &local_err);
> +
> +    if (status =3D=3D 0) {
> +        return;
> +    }
> +
> +    if ((status =3D=3D -1) && !local_err) {
> +        error_setg(errp, "the helper program 'systemctl %s' was not
> found",
> +                   systemctl_args[mode]);
> +        return;
> +    }
> +
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +    } else {
> +        error_setg(errp, "the helper program 'systemctl %s' returned an =
"
> +                   "unexpected exit status code (%d)",
> +                   systemctl_args[mode], status);
> +    }
> +}
> +
> +static bool pmutils_supports_mode(SuspendMode mode, Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    const char *pmutils_args[3] =3D {"--hibernate", "--suspend",
> +                                   "--suspend-hybrid"};
> +    const char *cmd[3] =3D {"pm-is-supported", pmutils_args[mode], NULL}=
;
> +    int status;
> +
> +    status =3D run_process_child(cmd, &local_err);
> +
> +    if (status =3D=3D SUSPEND_SUPPORTED) {
> +        return true;
> +    }
> +
> +    if ((status =3D=3D -1) && !local_err) {
> +        return false;
> +    }
> +
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +    } else {
> +        error_setg(errp,
> +                   "the helper program '%s' returned an unexpected exit"
> +                   " status code (%d)", "pm-is-supported", status);
> +    }
> +
> +    return false;
> +}
> +
> +static void pmutils_suspend(SuspendMode mode, Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    const char *pmutils_binaries[3] =3D {"pm-hibernate", "pm-suspend",
> +                                       "pm-suspend-hybrid"};
> +    const char *cmd[2] =3D {pmutils_binaries[mode], NULL};
> +    int status;
> +
> +    status =3D run_process_child(cmd, &local_err);
> +
> +    if (status =3D=3D 0) {
> +        return;
> +    }
> +
> +    if ((status =3D=3D -1) && !local_err) {
> +        error_setg(errp, "the helper program '%s' was not found",
> +                   pmutils_binaries[mode]);
> +        return;
> +    }
> +
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +    } else {
> +        error_setg(errp,
> +                   "the helper program '%s' returned an unexpected exit"
> +                   " status code (%d)", pmutils_binaries[mode], status);
> +    }
> +}
> +
> +static bool linux_sys_state_supports_mode(SuspendMode mode, Error **errp=
)
> +{
> +    const char *sysfile_strs[3] =3D {"disk", "mem", NULL};
> +    const char *sysfile_str =3D sysfile_strs[mode];
> +    char buf[32]; /* hopefully big enough */
> +    int fd;
> +    ssize_t ret;
> +
> +    if (!sysfile_str) {
> +        error_setg(errp, "unknown guest suspend mode");
> +        return false;
> +    }
> +
> +    fd =3D open(LINUX_SYS_STATE_FILE, O_RDONLY);
> +    if (fd < 0) {
> +        return false;
> +    }
> +
> +    ret =3D read(fd, buf, sizeof(buf) - 1);
> +    close(fd);
> +    if (ret <=3D 0) {
> +        return false;
> +    }
> +    buf[ret] =3D '\0';
> +
> +    if (strstr(buf, sysfile_str)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
> +static void linux_sys_state_suspend(SuspendMode mode, Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    const char *sysfile_strs[3] =3D {"disk", "mem", NULL};
> +    const char *sysfile_str =3D sysfile_strs[mode];
> +    pid_t pid;
> +    int status;
> +
> +    if (!sysfile_str) {
> +        error_setg(errp, "unknown guest suspend mode");
> +        return;
> +    }
> +
> +    pid =3D fork();
> +    if (!pid) {
> +        /* child */
> +        int fd;
> +
> +        setsid();
> +        reopen_fd_to_null(0);
> +        reopen_fd_to_null(1);
> +        reopen_fd_to_null(2);
> +
> +        fd =3D open(LINUX_SYS_STATE_FILE, O_WRONLY);
> +        if (fd < 0) {
> +            _exit(EXIT_FAILURE);
> +        }
> +
> +        if (write(fd, sysfile_str, strlen(sysfile_str)) < 0) {
> +            _exit(EXIT_FAILURE);
> +        }
> +
> +        _exit(EXIT_SUCCESS);
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
> +    if (WEXITSTATUS(status)) {
> +        error_setg(errp, "child process has failed to suspend");
> +    }
> +
> +}
> +
> +static void guest_suspend(SuspendMode mode, Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    bool mode_supported =3D false;
> +
> +    if (systemd_supports_mode(mode, &local_err)) {
> +        mode_supported =3D true;
> +        systemd_suspend(mode, &local_err);
> +    }
> +
> +    if (!local_err) {
> +        return;
> +    }
> +
> +    error_free(local_err);
> +    local_err =3D NULL;
> +
> +    if (pmutils_supports_mode(mode, &local_err)) {
> +        mode_supported =3D true;
> +        pmutils_suspend(mode, &local_err);
> +    }
> +
> +    if (!local_err) {
> +        return;
> +    }
> +
> +    error_free(local_err);
> +    local_err =3D NULL;
> +
> +    if (linux_sys_state_supports_mode(mode, &local_err)) {
> +        mode_supported =3D true;
> +        linux_sys_state_suspend(mode, &local_err);
> +    }
> +
> +    if (!mode_supported) {
> +        error_free(local_err);
> +        error_setg(errp,
> +                   "the requested suspend mode is not supported by the
> guest");
> +    } else {
> +        error_propagate(errp, local_err);
> +    }
> +}
> +
> +void qmp_guest_suspend_disk(Error **errp)
> +{
> +    guest_suspend(SUSPEND_MODE_DISK, errp);
> +}
> +
> +void qmp_guest_suspend_ram(Error **errp)
> +{
> +    guest_suspend(SUSPEND_MODE_RAM, errp);
> +}
> +
> +void qmp_guest_suspend_hybrid(Error **errp)
> +{
> +    guest_suspend(SUSPEND_MODE_HYBRID, errp);
> +}
> +
> +/* Transfer online/offline status between @vcpu and the guest system.
> + *
> + * On input either @errp or *@errp must be NULL.
> + *
> + * In system-to-@vcpu direction, the following @vcpu fields are accessed=
:
> + * - R: vcpu->logical_id
> + * - W: vcpu->online
> + * - W: vcpu->can_offline
> + *
> + * In @vcpu-to-system direction, the following @vcpu fields are accessed=
:
> + * - R: vcpu->logical_id
> + * - R: vcpu->online
> + *
> + * Written members remain unmodified on error.
> + */
> +static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
> +                          char *dirpath, Error **errp)
> +{
> +    int fd;
> +    int res;
> +    int dirfd;
> +    static const char fn[] =3D "online";
> +
> +    dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
> +    if (dirfd =3D=3D -1) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +        return;
> +    }
> +
> +    fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
> +    if (fd =3D=3D -1) {
> +        if (errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn=
);
> +        } else if (sys2vcpu) {
> +            vcpu->online =3D true;
> +            vcpu->can_offline =3D false;
> +        } else if (!vcpu->online) {
> +            error_setg(errp, "logical processor #%" PRId64 " can't be "
> +                       "offlined", vcpu->logical_id);
> +        } /* otherwise pretend successful re-onlining */
> +    } else {
> +        unsigned char status;
> +
> +        res =3D pread(fd, &status, 1, 0);
> +        if (res =3D=3D -1) {
> +            error_setg_errno(errp, errno, "pread(\"%s/%s\")", dirpath,
> fn);
> +        } else if (res =3D=3D 0) {
> +            error_setg(errp, "pread(\"%s/%s\"): unexpected EOF", dirpath=
,
> +                       fn);
> +        } else if (sys2vcpu) {
> +            vcpu->online =3D (status !=3D '0');
> +            vcpu->can_offline =3D true;
> +        } else if (vcpu->online !=3D (status !=3D '0')) {
> +            status =3D '0' + vcpu->online;
> +            if (pwrite(fd, &status, 1, 0) =3D=3D -1) {
> +                error_setg_errno(errp, errno, "pwrite(\"%s/%s\")",
> dirpath,
> +                                 fn);
> +            }
> +        } /* otherwise pretend successful re-(on|off)-lining */
> +
> +        res =3D close(fd);
> +        g_assert(res =3D=3D 0);
> +    }
> +
> +    res =3D close(dirfd);
> +    g_assert(res =3D=3D 0);
> +}
> +
> +GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
> +{
> +    GuestLogicalProcessorList *head, **tail;
> +    const char *cpu_dir =3D "/sys/devices/system/cpu";
> +    const gchar *line;
> +    g_autoptr(GDir) cpu_gdir =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    head =3D NULL;
> +    tail =3D &head;
> +    cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);
> +
> +    if (cpu_gdir =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "failed to list entries: %s",
> cpu_dir);
> +        return NULL;
> +    }
> +
> +    while (local_err =3D=3D NULL && (line =3D g_dir_read_name(cpu_gdir))=
 !=3D
> NULL) {
> +        GuestLogicalProcessor *vcpu;
> +        int64_t id;
> +        if (sscanf(line, "cpu%" PRId64, &id)) {
> +            g_autofree char *path =3D
> g_strdup_printf("/sys/devices/system/cpu/"
> +                                                    "cpu%" PRId64 "/",
> id);
> +            vcpu =3D g_malloc0(sizeof *vcpu);
> +            vcpu->logical_id =3D id;
> +            vcpu->has_can_offline =3D true; /* lolspeak ftw */
> +            transfer_vcpu(vcpu, true, path, &local_err);
> +            QAPI_LIST_APPEND(tail, vcpu);
> +        }
> +    }
> +
> +    if (local_err =3D=3D NULL) {
> +        /* there's no guest with zero VCPUs */
> +        g_assert(head !=3D NULL);
> +        return head;
> +    }
> +
> +    qapi_free_GuestLogicalProcessorList(head);
> +    error_propagate(errp, local_err);
> +    return NULL;
> +}
> +
> +int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error
> **errp)
> +{
> +    int64_t processed;
> +    Error *local_err =3D NULL;
> +
> +    processed =3D 0;
> +    while (vcpus !=3D NULL) {
> +        char *path =3D g_strdup_printf("/sys/devices/system/cpu/cpu%"
> PRId64 "/",
> +                                     vcpus->value->logical_id);
> +
> +        transfer_vcpu(vcpus->value, false, path, &local_err);
> +        g_free(path);
> +        if (local_err !=3D NULL) {
> +            break;
> +        }
> +        ++processed;
> +        vcpus =3D vcpus->next;
> +    }
> +
> +    if (local_err !=3D NULL) {
> +        if (processed =3D=3D 0) {
> +            error_propagate(errp, local_err);
> +        } else {
> +            error_free(local_err);
> +        }
> +    }
> +
> +    return processed;
> +}
> +
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
> +    chpasswddata =3D g_strdup_printf("%s:%s\n", username, rawpasswddata)=
;
> +    chpasswdlen =3D strlen(chpasswddata);
> +
> +    passwd_path =3D g_find_program_in_path("chpasswd");
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
> +        if (crypted) {
> +            execl(passwd_path, "chpasswd", "-e", NULL);
> +        } else {
> +            execl(passwd_path, "chpasswd", NULL);
> +        }
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
> +
> +static void ga_read_sysfs_file(int dirfd, const char *pathname, char *bu=
f,
> +                               int size, Error **errp)
> +{
> +    int fd;
> +    int res;
> +
> +    errno =3D 0;
> +    fd =3D openat(dirfd, pathname, O_RDONLY);
> +    if (fd =3D=3D -1) {
> +        error_setg_errno(errp, errno, "open sysfs file \"%s\"", pathname=
);
> +        return;
> +    }
> +
> +    res =3D pread(fd, buf, size, 0);
> +    if (res =3D=3D -1) {
> +        error_setg_errno(errp, errno, "pread sysfs file \"%s\"",
> pathname);
> +    } else if (res =3D=3D 0) {
> +        error_setg(errp, "pread sysfs file \"%s\": unexpected EOF",
> pathname);
> +    }
> +    close(fd);
> +}
> +
> +static void ga_write_sysfs_file(int dirfd, const char *pathname,
> +                                const char *buf, int size, Error **errp)
> +{
> +    int fd;
> +
> +    errno =3D 0;
> +    fd =3D openat(dirfd, pathname, O_WRONLY);
> +    if (fd =3D=3D -1) {
> +        error_setg_errno(errp, errno, "open sysfs file \"%s\"", pathname=
);
> +        return;
> +    }
> +
> +    if (pwrite(fd, buf, size, 0) =3D=3D -1) {
> +        error_setg_errno(errp, errno, "pwrite sysfs file \"%s\"",
> pathname);
> +    }
> +
> +    close(fd);
> +}
> +
> +/* Transfer online/offline status between @mem_blk and the guest system.
> + *
> + * On input either @errp or *@errp must be NULL.
> + *
> + * In system-to-@mem_blk direction, the following @mem_blk fields are
> accessed:
> + * - R: mem_blk->phys_index
> + * - W: mem_blk->online
> + * - W: mem_blk->can_offline
> + *
> + * In @mem_blk-to-system direction, the following @mem_blk fields are
> accessed:
> + * - R: mem_blk->phys_index
> + * - R: mem_blk->online
> + *-  R: mem_blk->can_offline
> + * Written members remain unmodified on error.
> + */
> +static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool
> sys2memblk,
> +                                  GuestMemoryBlockResponse *result,
> +                                  Error **errp)
> +{
> +    char *dirpath;
> +    int dirfd;
> +    char *status;
> +    Error *local_err =3D NULL;
> +
> +    if (!sys2memblk) {
> +        DIR *dp;
> +
> +        if (!result) {
> +            error_setg(errp, "Internal error, 'result' should not be
> NULL");
> +            return;
> +        }
> +        errno =3D 0;
> +        dp =3D opendir("/sys/devices/system/memory/");
> +        /* if there is no 'memory' directory in sysfs,
> +         * we think this VM does not support online/offline memory block=
,
> +         * any other solution?
> +         */
> +        if (!dp) {
> +            if (errno =3D=3D ENOENT) {
> +                result->response =3D
> +
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
> +            }
> +            goto out1;
> +        }
> +        closedir(dp);
> +    }
> +
> +    dirpath =3D g_strdup_printf("/sys/devices/system/memory/memory%" PRI=
d64
> "/",
> +                              mem_blk->phys_index);
> +    dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
> +    if (dirfd =3D=3D -1) {
> +        if (sys2memblk) {
> +            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +        } else {
> +            if (errno =3D=3D ENOENT) {
> +                result->response =3D
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
> +            } else {
> +                result->response =3D
> +                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
> +            }
> +        }
> +        g_free(dirpath);
> +        goto out1;
> +    }
> +    g_free(dirpath);
> +
> +    status =3D g_malloc0(10);
> +    ga_read_sysfs_file(dirfd, "state", status, 10, &local_err);
> +    if (local_err) {
> +        /* treat with sysfs file that not exist in old kernel */
> +        if (errno =3D=3D ENOENT) {
> +            error_free(local_err);
> +            if (sys2memblk) {
> +                mem_blk->online =3D true;
> +                mem_blk->can_offline =3D false;
> +            } else if (!mem_blk->online) {
> +                result->response =3D
> +
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
> +            }
> +        } else {
> +            if (sys2memblk) {
> +                error_propagate(errp, local_err);
> +            } else {
> +                error_free(local_err);
> +                result->response =3D
> +                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
> +            }
> +        }
> +        goto out2;
> +    }
> +
> +    if (sys2memblk) {
> +        char removable =3D '0';
> +
> +        mem_blk->online =3D (strncmp(status, "online", 6) =3D=3D 0);
> +
> +        ga_read_sysfs_file(dirfd, "removable", &removable, 1, &local_err=
);
> +        if (local_err) {
> +            /* if no 'removable' file, it doesn't support offline mem bl=
k
> */
> +            if (errno =3D=3D ENOENT) {
> +                error_free(local_err);
> +                mem_blk->can_offline =3D false;
> +            } else {
> +                error_propagate(errp, local_err);
> +            }
> +        } else {
> +            mem_blk->can_offline =3D (removable !=3D '0');
> +        }
> +    } else {
> +        if (mem_blk->online !=3D (strncmp(status, "online", 6) =3D=3D 0)=
) {
> +            const char *new_state =3D mem_blk->online ? "online" :
> "offline";
> +
> +            ga_write_sysfs_file(dirfd, "state", new_state,
> strlen(new_state),
> +                                &local_err);
> +            if (local_err) {
> +                error_free(local_err);
> +                result->response =3D
> +                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
> +                goto out2;
> +            }
> +
> +            result->response =3D GUEST_MEMORY_BLOCK_RESPONSE_TYPE_SUCCES=
S;
> +            result->has_error_code =3D false;
> +        } /* otherwise pretend successful re-(on|off)-lining */
> +    }
> +    g_free(status);
> +    close(dirfd);
> +    return;
> +
> +out2:
> +    g_free(status);
> +    close(dirfd);
> +out1:
> +    if (!sys2memblk) {
> +        result->has_error_code =3D true;
> +        result->error_code =3D errno;
> +    }
> +}
> +
> +GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
> +{
> +    GuestMemoryBlockList *head, **tail;
> +    Error *local_err =3D NULL;
> +    struct dirent *de;
> +    DIR *dp;
> +
> +    head =3D NULL;
> +    tail =3D &head;
> +
> +    dp =3D opendir("/sys/devices/system/memory/");
> +    if (!dp) {
> +        /* it's ok if this happens to be a system that doesn't expose
> +         * memory blocks via sysfs, but otherwise we should report
> +         * an error
> +         */
> +        if (errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "Can't open directory"
> +                             "\"/sys/devices/system/memory/\"");
> +        }
> +        return NULL;
> +    }
> +
> +    /* Note: the phys_index of memory block may be discontinuous,
> +     * this is because a memblk is the unit of the Sparse Memory design,
> which
> +     * allows discontinuous memory ranges (ex. NUMA), so here we should
> +     * traverse the memory block directory.
> +     */
> +    while ((de =3D readdir(dp)) !=3D NULL) {
> +        GuestMemoryBlock *mem_blk;
> +
> +        if ((strncmp(de->d_name, "memory", 6) !=3D 0) ||
> +            !(de->d_type & DT_DIR)) {
> +            continue;
> +        }
> +
> +        mem_blk =3D g_malloc0(sizeof *mem_blk);
> +        /* The d_name is "memoryXXX",  phys_index is block id, same as
> XXX */
> +        mem_blk->phys_index =3D strtoul(&de->d_name[6], NULL, 10);
> +        mem_blk->has_can_offline =3D true; /* lolspeak ftw */
> +        transfer_memory_block(mem_blk, true, NULL, &local_err);
> +        if (local_err) {
> +            break;
> +        }
> +
> +        QAPI_LIST_APPEND(tail, mem_blk);
> +    }
> +
> +    closedir(dp);
> +    if (local_err =3D=3D NULL) {
> +        /* there's no guest with zero memory blocks */
> +        if (head =3D=3D NULL) {
> +            error_setg(errp, "guest reported zero memory blocks!");
> +        }
> +        return head;
> +    }
> +
> +    qapi_free_GuestMemoryBlockList(head);
> +    error_propagate(errp, local_err);
> +    return NULL;
> +}
> +
> +GuestMemoryBlockResponseList *
> +qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp=
)
> +{
> +    GuestMemoryBlockResponseList *head, **tail;
> +    Error *local_err =3D NULL;
> +
> +    head =3D NULL;
> +    tail =3D &head;
> +
> +    while (mem_blks !=3D NULL) {
> +        GuestMemoryBlockResponse *result;
> +        GuestMemoryBlock *current_mem_blk =3D mem_blks->value;
> +
> +        result =3D g_malloc0(sizeof(*result));
> +        result->phys_index =3D current_mem_blk->phys_index;
> +        transfer_memory_block(current_mem_blk, false, result, &local_err=
);
> +        if (local_err) { /* should never happen */
> +            goto err;
> +        }
> +
> +        QAPI_LIST_APPEND(tail, result);
> +        mem_blks =3D mem_blks->next;
> +    }
> +
> +    return head;
> +err:
> +    qapi_free_GuestMemoryBlockResponseList(head);
> +    error_propagate(errp, local_err);
> +    return NULL;
> +}
> +
> +GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
> +{
> +    Error *local_err =3D NULL;
> +    char *dirpath;
> +    int dirfd;
> +    char *buf;
> +    GuestMemoryBlockInfo *info;
> +
> +    dirpath =3D g_strdup_printf("/sys/devices/system/memory/");
> +    dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
> +    if (dirfd =3D=3D -1) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +        g_free(dirpath);
> +        return NULL;
> +    }
> +    g_free(dirpath);
> +
> +    buf =3D g_malloc0(20);
> +    ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
> +    close(dirfd);
> +    if (local_err) {
> +        g_free(buf);
> +        error_propagate(errp, local_err);
> +        return NULL;
> +    }
> +
> +    info =3D g_new0(GuestMemoryBlockInfo, 1);
> +    info->size =3D strtol(buf, NULL, 16); /* the unit is bytes */
> +
> +    g_free(buf);
> +
> +    return info;
> +}
> +
> +#define MAX_NAME_LEN 128
> +static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
> +{
> +#ifdef CONFIG_LINUX
> +    GuestDiskStatsInfoList *head =3D NULL, **tail =3D &head;
> +    const char *diskstats =3D "/proc/diskstats";
> +    FILE *fp;
> +    size_t n;
> +    char *line =3D NULL;
> +
> +    fp =3D fopen(diskstats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        return NULL;
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        g_autofree GuestDiskStatsInfo *diskstatinfo =3D NULL;
> +        g_autofree GuestDiskStats *diskstat =3D NULL;
> +        char dev_name[MAX_NAME_LEN];
> +        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks,
> fl_ticks;
> +        unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec,
> wr_ios;
> +        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> +        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> +        unsigned int major, minor;
> +        int i;
> +
> +        i =3D sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                   &major, &minor, dev_name,
> +                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                   &fl_ios, &fl_ticks);
> +
> +        if (i < 7) {
> +            continue;
> +        }
> +
> +        diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1);
> +        diskstatinfo->name =3D g_strdup(dev_name);
> +        diskstatinfo->major =3D major;
> +        diskstatinfo->minor =3D minor;
> +
> +        diskstat =3D g_new0(GuestDiskStats, 1);
> +        if (i =3D=3D 7) {
> +            diskstat->has_read_ios =3D true;
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->has_read_sectors =3D true;
> +            diskstat->read_sectors =3D rd_merges_or_rd_sec;
> +            diskstat->has_write_ios =3D true;
> +            diskstat->write_ios =3D rd_sec_or_wr_ios;
> +            diskstat->has_write_sectors =3D true;
> +            diskstat->write_sectors =3D rd_ticks_or_wr_sec;
> +        }
> +        if (i >=3D 14) {
> +            diskstat->has_read_ios =3D true;
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->has_read_sectors =3D true;
> +            diskstat->read_sectors =3D rd_sec_or_wr_ios;
> +            diskstat->has_read_merges =3D true;
> +            diskstat->read_merges =3D rd_merges_or_rd_sec;
> +            diskstat->has_read_ticks =3D true;
> +            diskstat->read_ticks =3D rd_ticks_or_wr_sec;
> +            diskstat->has_write_ios =3D true;
> +            diskstat->write_ios =3D wr_ios;
> +            diskstat->has_write_sectors =3D true;
> +            diskstat->write_sectors =3D wr_sec;
> +            diskstat->has_write_merges =3D true;
> +            diskstat->write_merges =3D wr_merges;
> +            diskstat->has_write_ticks =3D true;
> +            diskstat->write_ticks =3D wr_ticks;
> +            diskstat->has_ios_pgr =3D true;
> +            diskstat->ios_pgr =3D ios_pgr;
> +            diskstat->has_total_ticks =3D true;
> +            diskstat->total_ticks =3D tot_ticks;
> +            diskstat->has_weight_ticks =3D true;
> +            diskstat->weight_ticks =3D rq_ticks;
> +        }
> +        if (i >=3D 18) {
> +            diskstat->has_discard_ios =3D true;
> +            diskstat->discard_ios =3D dc_ios;
> +            diskstat->has_discard_merges =3D true;
> +            diskstat->discard_merges =3D dc_merges;
> +            diskstat->has_discard_sectors =3D true;
> +            diskstat->discard_sectors =3D dc_sec;
> +            diskstat->has_discard_ticks =3D true;
> +            diskstat->discard_ticks =3D dc_ticks;
> +        }
> +        if (i >=3D 20) {
> +            diskstat->has_flush_ios =3D true;
> +            diskstat->flush_ios =3D fl_ios;
> +            diskstat->has_flush_ticks =3D true;
> +            diskstat->flush_ticks =3D fl_ticks;
> +        }
> +
> +        diskstatinfo->stats =3D g_steal_pointer(&diskstat);
> +        QAPI_LIST_APPEND(tail, diskstatinfo);
> +        diskstatinfo =3D NULL;
> +    }
> +    free(line);
> +    fclose(fp);
> +    return head;
> +#else
> +    g_debug("disk stats reporting available only for Linux");
> +    return NULL;
> +#endif
> +}
> +
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    return guest_get_diskstats(errp);
> +}
> +
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    GuestCpuStatsList *head =3D NULL, **tail =3D &head;
> +    const char *cpustats =3D "/proc/stat";
> +    int clk_tck =3D sysconf(_SC_CLK_TCK);
> +    FILE *fp;
> +    size_t n;
> +    char *line =3D NULL;
> +
> +    fp =3D fopen(cpustats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> +        return NULL;
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        GuestCpuStats *cpustat =3D NULL;
> +        GuestLinuxCpuStats *linuxcpustat;
> +        int i;
> +        unsigned long user, system, idle, iowait, irq, softirq, steal,
> guest;
> +        unsigned long nice, guest_nice;
> +        char name[64];
> +
> +        i =3D sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",
> +                   name, &user, &nice, &system, &idle, &iowait, &irq,
> &softirq,
> +                   &steal, &guest, &guest_nice);
> +
> +        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
> +        if ((i =3D=3D EOF) || strncmp(name, "cpu", 3) || (name[3] =3D=3D=
 '\0')) {
> +            continue;
> +        }
> +
> +        if (i < 5) {
> +            slog("Parsing cpu stat from %s failed, see \"man proc\"",
> cpustats);
> +            break;
> +        }
> +
> +        cpustat =3D g_new0(GuestCpuStats, 1);
> +        cpustat->type =3D GUEST_CPU_STATS_TYPE_LINUX;
> +
> +        linuxcpustat =3D &cpustat->u.q_linux;
> +        linuxcpustat->cpu =3D atoi(&name[3]);
> +        linuxcpustat->user =3D user * 1000 / clk_tck;
> +        linuxcpustat->nice =3D nice * 1000 / clk_tck;
> +        linuxcpustat->system =3D system * 1000 / clk_tck;
> +        linuxcpustat->idle =3D idle * 1000 / clk_tck;
> +
> +        if (i > 5) {
> +            linuxcpustat->has_iowait =3D true;
> +            linuxcpustat->iowait =3D iowait * 1000 / clk_tck;
> +        }
> +
> +        if (i > 6) {
> +            linuxcpustat->has_irq =3D true;
> +            linuxcpustat->irq =3D irq * 1000 / clk_tck;
> +            linuxcpustat->has_softirq =3D true;
> +            linuxcpustat->softirq =3D softirq * 1000 / clk_tck;
> +        }
> +
> +        if (i > 8) {
> +            linuxcpustat->has_steal =3D true;
> +            linuxcpustat->steal =3D steal * 1000 / clk_tck;
> +        }
> +
> +        if (i > 9) {
> +            linuxcpustat->has_guest =3D true;
> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> +        }
> +
> +        if (i > 10) {
> +            linuxcpustat->has_guest =3D true;
> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> +            linuxcpustat->has_guestnice =3D true;
> +            linuxcpustat->guestnice =3D guest_nice * 1000 / clk_tck;
> +        }
> +
> +        QAPI_LIST_APPEND(tail, cpustat);
> +    }
> +
> +    free(line);
> +    fclose(fp);
> +    return head;
> +}
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 954efed01b..0bb8b9e2f3 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -15,7 +15,6 @@
>  #include <sys/ioctl.h>
>  #include <sys/utsname.h>
>  #include <sys/wait.h>
> -#include <dirent.h>
>  #include "guest-agent-core.h"
>  #include "qga-qapi-commands.h"
>  #include "qapi/error.h"
> @@ -26,31 +25,12 @@
>  #include "qemu/base64.h"
>  #include "qemu/cutils.h"
>  #include "commands-common.h"
> -#include "block/nvme.h"
>  #include "cutils.h"
>
>  #ifdef HAVE_UTMPX
>  #include <utmpx.h>
>  #endif
>
> -#if defined(__linux__)
> -#include <mntent.h>
> -#include <linux/fs.h>
> -#include <sys/statvfs.h>
> -#include <linux/nvme_ioctl.h>
> -
> -#ifdef CONFIG_LIBUDEV
> -#include <libudev.h>
> -#endif
> -
> -#ifdef FIFREEZE
> -#define CONFIG_FSFREEZE
> -#endif
> -#ifdef FITRIM
> -#define CONFIG_FSTRIM
> -#endif
> -#endif
> -
>  #ifdef HAVE_GETIFADDRS
>  #include <arpa/inet.h>
>  #include <sys/socket.h>
> @@ -62,7 +42,173 @@
>  #endif
>  #endif
>
> -static void ga_wait_child(pid_t pid, int *status, Error **errp)
> +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> +void free_fs_mount_list(FsMountList *mounts)
> +{
> +     FsMount *mount, *temp;
> +
> +     if (!mounts) {
> +         return;
> +     }
> +
> +     QTAILQ_FOREACH_SAFE(mount, mounts, next, temp) {
> +         QTAILQ_REMOVE(mounts, mount, next);
> +         g_free(mount->dirname);
> +         g_free(mount->devtype);
> +         g_free(mount);
> +     }
> +}
> +#endif
> +
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
> +#endif /* CONFIG_FSFREEZE */
> +
> +void ga_wait_child(pid_t pid, int *status, Error **errp)
>  {
>      pid_t rpid;
>
> @@ -617,2375 +763,7 @@ void qmp_guest_file_flush(int64_t handle, Error
> **errp)
>      }
>  }
>
> -/* linux-specific implementations. avoid this if at all possible. */
> -#if defined(__linux__)
> -
> -#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> -typedef struct FsMount {
> -    char *dirname;
> -    char *devtype;
> -    unsigned int devmajor, devminor;
> -    QTAILQ_ENTRY(FsMount) next;
> -} FsMount;
> -
> -typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
> -
> -static void free_fs_mount_list(FsMountList *mounts)
> -{
> -     FsMount *mount, *temp;
> -
> -     if (!mounts) {
> -         return;
> -     }
> -
> -     QTAILQ_FOREACH_SAFE(mount, mounts, next, temp) {
> -         QTAILQ_REMOVE(mounts, mount, next);
> -         g_free(mount->dirname);
> -         g_free(mount->devtype);
> -         g_free(mount);
> -     }
> -}
> -
> -static int dev_major_minor(const char *devpath,
> -                           unsigned int *devmajor, unsigned int *devmino=
r)
> -{
> -    struct stat st;
> -
> -    *devmajor =3D 0;
> -    *devminor =3D 0;
> -
> -    if (stat(devpath, &st) < 0) {
> -        slog("failed to stat device file '%s': %s", devpath,
> strerror(errno));
> -        return -1;
> -    }
> -    if (S_ISDIR(st.st_mode)) {
> -        /* It is bind mount */
> -        return -2;
> -    }
> -    if (S_ISBLK(st.st_mode)) {
> -        *devmajor =3D major(st.st_rdev);
> -        *devminor =3D minor(st.st_rdev);
> -        return 0;
> -    }
> -    return -1;
> -}
> -
> -/*
> - * Walk the mount table and build a list of local file systems
> - */
> -static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error
> **errp)
> -{
> -    struct mntent *ment;
> -    FsMount *mount;
> -    char const *mtab =3D "/proc/self/mounts";
> -    FILE *fp;
> -    unsigned int devmajor, devminor;
> -
> -    fp =3D setmntent(mtab, "r");
> -    if (!fp) {
> -        error_setg(errp, "failed to open mtab file: '%s'", mtab);
> -        return false;
> -    }
> -
> -    while ((ment =3D getmntent(fp))) {
> -        /*
> -         * An entry which device name doesn't start with a '/' is
> -         * either a dummy file system or a network file system.
> -         * Add special handling for smbfs and cifs as is done by
> -         * coreutils as well.
> -         */
> -        if ((ment->mnt_fsname[0] !=3D '/') ||
> -            (strcmp(ment->mnt_type, "smbfs") =3D=3D 0) ||
> -            (strcmp(ment->mnt_type, "cifs") =3D=3D 0)) {
> -            continue;
> -        }
> -        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) =3D=
=3D
> -2) {
> -            /* Skip bind mounts */
> -            continue;
> -        }
> -
> -        mount =3D g_new0(FsMount, 1);
> -        mount->dirname =3D g_strdup(ment->mnt_dir);
> -        mount->devtype =3D g_strdup(ment->mnt_type);
> -        mount->devmajor =3D devmajor;
> -        mount->devminor =3D devminor;
> -
> -        QTAILQ_INSERT_TAIL(mounts, mount, next);
> -    }
> -
> -    endmntent(fp);
> -    return true;
> -}
> -
> -static void decode_mntname(char *name, int len)
> -{
> -    int i, j =3D 0;
> -    for (i =3D 0; i <=3D len; i++) {
> -        if (name[i] !=3D '\\') {
> -            name[j++] =3D name[i];
> -        } else if (name[i + 1] =3D=3D '\\') {
> -            name[j++] =3D '\\';
> -            i++;
> -        } else if (name[i + 1] >=3D '0' && name[i + 1] <=3D '3' &&
> -                   name[i + 2] >=3D '0' && name[i + 2] <=3D '7' &&
> -                   name[i + 3] >=3D '0' && name[i + 3] <=3D '7') {
> -            name[j++] =3D (name[i + 1] - '0') * 64 +
> -                        (name[i + 2] - '0') * 8 +
> -                        (name[i + 3] - '0');
> -            i +=3D 3;
> -        } else {
> -            name[j++] =3D name[i];
> -        }
> -    }
> -}
> -
> -static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
> -{
> -    FsMount *mount;
> -    char const *mountinfo =3D "/proc/self/mountinfo";
> -    FILE *fp;
> -    char *line =3D NULL, *dash;
> -    size_t n;
> -    char check;
> -    unsigned int devmajor, devminor;
> -    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
> -
> -    fp =3D fopen(mountinfo, "r");
> -    if (!fp) {
> -        return build_fs_mount_list_from_mtab(mounts, errp);
> -    }
> -
> -    while (getline(&line, &n, fp) !=3D -1) {
> -        ret =3D sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
> -                     &devmajor, &devminor, &dir_s, &dir_e, &check);
> -        if (ret < 3) {
> -            continue;
> -        }
> -        dash =3D strstr(line + dir_e, " - ");
> -        if (!dash) {
> -            continue;
> -        }
> -        ret =3D sscanf(dash, " - %n%*s%n %n%*s%n%c",
> -                     &type_s, &type_e, &dev_s, &dev_e, &check);
> -        if (ret < 1) {
> -            continue;
> -        }
> -        line[dir_e] =3D 0;
> -        dash[type_e] =3D 0;
> -        dash[dev_e] =3D 0;
> -        decode_mntname(line + dir_s, dir_e - dir_s);
> -        decode_mntname(dash + dev_s, dev_e - dev_s);
> -        if (devmajor =3D=3D 0) {
> -            /* btrfs reports major number =3D 0 */
> -            if (strcmp("btrfs", dash + type_s) !=3D 0 ||
> -                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0)=
 {
> -                continue;
> -            }
> -        }
> -
> -        mount =3D g_new0(FsMount, 1);
> -        mount->dirname =3D g_strdup(line + dir_s);
> -        mount->devtype =3D g_strdup(dash + type_s);
> -        mount->devmajor =3D devmajor;
> -        mount->devminor =3D devminor;
> -
> -        QTAILQ_INSERT_TAIL(mounts, mount, next);
> -    }
> -    free(line);
> -
> -    fclose(fp);
> -    return true;
> -}
> -#endif
> -
> -#if defined(CONFIG_FSFREEZE)
> -
> -static char *get_pci_driver(char const *syspath, int pathlen, Error
> **errp)
> -{
> -    char *path;
> -    char *dpath;
> -    char *driver =3D NULL;
> -    char buf[PATH_MAX];
> -    ssize_t len;
> -
> -    path =3D g_strndup(syspath, pathlen);
> -    dpath =3D g_strdup_printf("%s/driver", path);
> -    len =3D readlink(dpath, buf, sizeof(buf) - 1);
> -    if (len !=3D -1) {
> -        buf[len] =3D 0;
> -        driver =3D g_path_get_basename(buf);
> -    }
> -    g_free(dpath);
> -    g_free(path);
> -    return driver;
> -}
> -
> -static int compare_uint(const void *_a, const void *_b)
> -{
> -    unsigned int a =3D *(unsigned int *)_a;
> -    unsigned int b =3D *(unsigned int *)_b;
> -
> -    return a < b ? -1 : a > b ? 1 : 0;
> -}
> -
> -/* Walk the specified sysfs and build a sorted list of host or ata
> numbers */
> -static int build_hosts(char const *syspath, char const *host, bool ata,
> -                       unsigned int *hosts, int hosts_max, Error **errp)
> -{
> -    char *path;
> -    DIR *dir;
> -    struct dirent *entry;
> -    int i =3D 0;
> -
> -    path =3D g_strndup(syspath, host - syspath);
> -    dir =3D opendir(path);
> -    if (!dir) {
> -        error_setg_errno(errp, errno, "opendir(\"%s\")", path);
> -        g_free(path);
> -        return -1;
> -    }
> -
> -    while (i < hosts_max) {
> -        entry =3D readdir(dir);
> -        if (!entry) {
> -            break;
> -        }
> -        if (ata && sscanf(entry->d_name, "ata%d", hosts + i) =3D=3D 1) {
> -            ++i;
> -        } else if (!ata && sscanf(entry->d_name, "host%d", hosts + i) =
=3D=3D
> 1) {
> -            ++i;
> -        }
> -    }
> -
> -    qsort(hosts, i, sizeof(hosts[0]), compare_uint);
> -
> -    g_free(path);
> -    closedir(dir);
> -    return i;
> -}
> -
> -/*
> - * Store disk device info for devices on the PCI bus.
> - * Returns true if information has been stored, or false for failure.
> - */
> -static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
> -                                           GuestDiskAddress *disk,
> -                                           Error **errp)
> -{
> -    unsigned int pci[4], host, hosts[8], tgt[3];
> -    int i, nhosts =3D 0, pcilen;
> -    GuestPCIAddress *pciaddr =3D disk->pci_controller;
> -    bool has_ata =3D false, has_host =3D false, has_tgt =3D false;
> -    char *p, *q, *driver =3D NULL;
> -    bool ret =3D false;
> -
> -    p =3D strstr(syspath, "/devices/pci");
> -    if (!p || sscanf(p + 12, "%*x:%*x/%x:%x:%x.%x%n",
> -                     pci, pci + 1, pci + 2, pci + 3, &pcilen) < 4) {
> -        g_debug("only pci device is supported: sysfs path '%s'", syspath=
);
> -        return false;
> -    }
> -
> -    p +=3D 12 + pcilen;
> -    while (true) {
> -        driver =3D get_pci_driver(syspath, p - syspath, errp);
> -        if (driver && (g_str_equal(driver, "ata_piix") ||
> -                       g_str_equal(driver, "sym53c8xx") ||
> -                       g_str_equal(driver, "virtio-pci") ||
> -                       g_str_equal(driver, "ahci") ||
> -                       g_str_equal(driver, "nvme"))) {
> -            break;
> -        }
> -
> -        g_free(driver);
> -        if (sscanf(p, "/%x:%x:%x.%x%n",
> -                          pci, pci + 1, pci + 2, pci + 3, &pcilen) =3D=
=3D 4) {
> -            p +=3D pcilen;
> -            continue;
> -        }
> -
> -        g_debug("unsupported driver or sysfs path '%s'", syspath);
> -        return false;
> -    }
> -
> -    p =3D strstr(syspath, "/target");
> -    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
> -                    tgt, tgt + 1, tgt + 2) =3D=3D 3) {
> -        has_tgt =3D true;
> -    }
> -
> -    p =3D strstr(syspath, "/ata");
> -    if (p) {
> -        q =3D p + 4;
> -        has_ata =3D true;
> -    } else {
> -        p =3D strstr(syspath, "/host");
> -        q =3D p + 5;
> -    }
> -    if (p && sscanf(q, "%u", &host) =3D=3D 1) {
> -        has_host =3D true;
> -        nhosts =3D build_hosts(syspath, p, has_ata, hosts,
> -                             ARRAY_SIZE(hosts), errp);
> -        if (nhosts < 0) {
> -            goto cleanup;
> -        }
> -    }
> -
> -    pciaddr->domain =3D pci[0];
> -    pciaddr->bus =3D pci[1];
> -    pciaddr->slot =3D pci[2];
> -    pciaddr->function =3D pci[3];
> -
> -    if (strcmp(driver, "ata_piix") =3D=3D 0) {
> -        /* a host per ide bus, target*:0:<unit>:0 */
> -        if (!has_host || !has_tgt) {
> -            g_debug("invalid sysfs path '%s' (driver '%s')", syspath,
> driver);
> -            goto cleanup;
> -        }
> -        for (i =3D 0; i < nhosts; i++) {
> -            if (host =3D=3D hosts[i]) {
> -                disk->bus_type =3D GUEST_DISK_BUS_TYPE_IDE;
> -                disk->bus =3D i;
> -                disk->unit =3D tgt[1];
> -                break;
> -            }
> -        }
> -        if (i >=3D nhosts) {
> -            g_debug("no host for '%s' (driver '%s')", syspath, driver);
> -            goto cleanup;
> -        }
> -    } else if (strcmp(driver, "sym53c8xx") =3D=3D 0) {
> -        /* scsi(LSI Logic): target*:0:<unit>:0 */
> -        if (!has_tgt) {
> -            g_debug("invalid sysfs path '%s' (driver '%s')", syspath,
> driver);
> -            goto cleanup;
> -        }
> -        disk->bus_type =3D GUEST_DISK_BUS_TYPE_SCSI;
> -        disk->unit =3D tgt[1];
> -    } else if (strcmp(driver, "virtio-pci") =3D=3D 0) {
> -        if (has_tgt) {
> -            /* virtio-scsi: target*:0:0:<unit> */
> -            disk->bus_type =3D GUEST_DISK_BUS_TYPE_SCSI;
> -            disk->unit =3D tgt[2];
> -        } else {
> -            /* virtio-blk: 1 disk per 1 device */
> -            disk->bus_type =3D GUEST_DISK_BUS_TYPE_VIRTIO;
> -        }
> -    } else if (strcmp(driver, "ahci") =3D=3D 0) {
> -        /* ahci: 1 host per 1 unit */
> -        if (!has_host || !has_tgt) {
> -            g_debug("invalid sysfs path '%s' (driver '%s')", syspath,
> driver);
> -            goto cleanup;
> -        }
> -        for (i =3D 0; i < nhosts; i++) {
> -            if (host =3D=3D hosts[i]) {
> -                disk->unit =3D i;
> -                disk->bus_type =3D GUEST_DISK_BUS_TYPE_SATA;
> -                break;
> -            }
> -        }
> -        if (i >=3D nhosts) {
> -            g_debug("no host for '%s' (driver '%s')", syspath, driver);
> -            goto cleanup;
> -        }
> -    } else if (strcmp(driver, "nvme") =3D=3D 0) {
> -        disk->bus_type =3D GUEST_DISK_BUS_TYPE_NVME;
> -    } else {
> -        g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath=
);
> -        goto cleanup;
> -    }
> -
> -    ret =3D true;
> -
> -cleanup:
> -    g_free(driver);
> -    return ret;
> -}
> -
> -/*
> - * Store disk device info for non-PCI virtio devices (for example s390x
> - * channel I/O devices). Returns true if information has been stored, or
> - * false for failure.
> - */
> -static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,
> -                                                 GuestDiskAddress *disk,
> -                                                 Error **errp)
> -{
> -    unsigned int tgt[3];
> -    char *p;
> -
> -    if (!strstr(syspath, "/virtio") || !strstr(syspath, "/block")) {
> -        g_debug("Unsupported virtio device '%s'", syspath);
> -        return false;
> -    }
> -
> -    p =3D strstr(syspath, "/target");
> -    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
> -                    &tgt[0], &tgt[1], &tgt[2]) =3D=3D 3) {
> -        /* virtio-scsi: target*:0:<target>:<unit> */
> -        disk->bus_type =3D GUEST_DISK_BUS_TYPE_SCSI;
> -        disk->bus =3D tgt[0];
> -        disk->target =3D tgt[1];
> -        disk->unit =3D tgt[2];
> -    } else {
> -        /* virtio-blk: 1 disk per 1 device */
> -        disk->bus_type =3D GUEST_DISK_BUS_TYPE_VIRTIO;
> -    }
> -
> -    return true;
> -}
> -
> -/*
> - * Store disk device info for CCW devices (s390x channel I/O devices).
> - * Returns true if information has been stored, or false for failure.
> - */
> -static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
> -                                           GuestDiskAddress *disk,
> -                                           Error **errp)
> -{
> -    unsigned int cssid, ssid, subchno, devno;
> -    char *p;
> -
> -    p =3D strstr(syspath, "/devices/css");
> -    if (!p || sscanf(p + 12, "%*x/%x.%x.%x/%*x.%*x.%x/",
> -                     &cssid, &ssid, &subchno, &devno) < 4) {
> -        g_debug("could not parse ccw device sysfs path: %s", syspath);
> -        return false;
> -    }
> -
> -    disk->has_ccw_address =3D true;
> -    disk->ccw_address =3D g_new0(GuestCCWAddress, 1);
> -    disk->ccw_address->cssid =3D cssid;
> -    disk->ccw_address->ssid =3D ssid;
> -    disk->ccw_address->subchno =3D subchno;
> -    disk->ccw_address->devno =3D devno;
> -
> -    if (strstr(p, "/virtio")) {
> -        build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
> -    }
> -
> -    return true;
> -}
> -
> -/* Store disk device info specified by @sysfs into @fs */
> -static void build_guest_fsinfo_for_real_device(char const *syspath,
> -                                               GuestFilesystemInfo *fs,
> -                                               Error **errp)
> -{
> -    GuestDiskAddress *disk;
> -    GuestPCIAddress *pciaddr;
> -    bool has_hwinf;
> -#ifdef CONFIG_LIBUDEV
> -    struct udev *udev =3D NULL;
> -    struct udev_device *udevice =3D NULL;
> -#endif
> -
> -    pciaddr =3D g_new0(GuestPCIAddress, 1);
> -    pciaddr->domain =3D -1;                       /* -1 means field is
> invalid */
> -    pciaddr->bus =3D -1;
> -    pciaddr->slot =3D -1;
> -    pciaddr->function =3D -1;
> -
> -    disk =3D g_new0(GuestDiskAddress, 1);
> -    disk->pci_controller =3D pciaddr;
> -    disk->bus_type =3D GUEST_DISK_BUS_TYPE_UNKNOWN;
> -
> -#ifdef CONFIG_LIBUDEV
> -    udev =3D udev_new();
> -    udevice =3D udev_device_new_from_syspath(udev, syspath);
> -    if (udev =3D=3D NULL || udevice =3D=3D NULL) {
> -        g_debug("failed to query udev");
> -    } else {
> -        const char *devnode, *serial;
> -        devnode =3D udev_device_get_devnode(udevice);
> -        if (devnode !=3D NULL) {
> -            disk->dev =3D g_strdup(devnode);
> -            disk->has_dev =3D true;
> -        }
> -        serial =3D udev_device_get_property_value(udevice, "ID_SERIAL");
> -        if (serial !=3D NULL && *serial !=3D 0) {
> -            disk->serial =3D g_strdup(serial);
> -            disk->has_serial =3D true;
> -        }
> -    }
> -
> -    udev_unref(udev);
> -    udev_device_unref(udevice);
> -#endif
> -
> -    if (strstr(syspath, "/devices/pci")) {
> -        has_hwinf =3D build_guest_fsinfo_for_pci_dev(syspath, disk, errp=
);
> -    } else if (strstr(syspath, "/devices/css")) {
> -        has_hwinf =3D build_guest_fsinfo_for_ccw_dev(syspath, disk, errp=
);
> -    } else if (strstr(syspath, "/virtio")) {
> -        has_hwinf =3D build_guest_fsinfo_for_nonpci_virtio(syspath, disk=
,
> errp);
> -    } else {
> -        g_debug("Unsupported device type for '%s'", syspath);
> -        has_hwinf =3D false;
> -    }
> -
> -    if (has_hwinf || disk->has_dev || disk->has_serial) {
> -        QAPI_LIST_PREPEND(fs->disk, disk);
> -    } else {
> -        qapi_free_GuestDiskAddress(disk);
> -    }
> -}
> -
> -static void build_guest_fsinfo_for_device(char const *devpath,
> -                                          GuestFilesystemInfo *fs,
> -                                          Error **errp);
> -
> -/* Store a list of slave devices of virtual volume specified by @syspath
> into
> - * @fs */
> -static void build_guest_fsinfo_for_virtual_device(char const *syspath,
> -                                                  GuestFilesystemInfo *f=
s,
> -                                                  Error **errp)
> -{
> -    Error *err =3D NULL;
> -    DIR *dir;
> -    char *dirpath;
> -    struct dirent *entry;
> -
> -    dirpath =3D g_strdup_printf("%s/slaves", syspath);
> -    dir =3D opendir(dirpath);
> -    if (!dir) {
> -        if (errno !=3D ENOENT) {
> -            error_setg_errno(errp, errno, "opendir(\"%s\")", dirpath);
> -        }
> -        g_free(dirpath);
> -        return;
> -    }
> -
> -    for (;;) {
> -        errno =3D 0;
> -        entry =3D readdir(dir);
> -        if (entry =3D=3D NULL) {
> -            if (errno) {
> -                error_setg_errno(errp, errno, "readdir(\"%s\")", dirpath=
);
> -            }
> -            break;
> -        }
> -
> -        if (entry->d_type =3D=3D DT_LNK) {
> -            char *path;
> -
> -            g_debug(" slave device '%s'", entry->d_name);
> -            path =3D g_strdup_printf("%s/slaves/%s", syspath,
> entry->d_name);
> -            build_guest_fsinfo_for_device(path, fs, &err);
> -            g_free(path);
> -
> -            if (err) {
> -                error_propagate(errp, err);
> -                break;
> -            }
> -        }
> -    }
> -
> -    g_free(dirpath);
> -    closedir(dir);
> -}
> -
> -static bool is_disk_virtual(const char *devpath, Error **errp)
> -{
> -    g_autofree char *syspath =3D realpath(devpath, NULL);
> -
> -    if (!syspath) {
> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> -        return false;
> -    }
> -    return strstr(syspath, "/devices/virtual/block/") !=3D NULL;
> -}
> -
> -/* Dispatch to functions for virtual/real device */
> -static void build_guest_fsinfo_for_device(char const *devpath,
> -                                          GuestFilesystemInfo *fs,
> -                                          Error **errp)
> -{
> -    ERRP_GUARD();
> -    g_autofree char *syspath =3D NULL;
> -    bool is_virtual =3D false;
> -
> -    syspath =3D realpath(devpath, NULL);
> -    if (!syspath) {
> -        if (errno !=3D ENOENT) {
> -            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> -            return;
> -        }
> -
> -        /* ENOENT: This devpath may not exist because of container confi=
g
> */
> -        if (!fs->name) {
> -            fs->name =3D g_path_get_basename(devpath);
> -        }
> -        return;
> -    }
> -
> -    if (!fs->name) {
> -        fs->name =3D g_path_get_basename(syspath);
> -    }
> -
> -    g_debug("  parse sysfs path '%s'", syspath);
> -    is_virtual =3D is_disk_virtual(syspath, errp);
> -    if (*errp !=3D NULL) {
> -        return;
> -    }
> -    if (is_virtual) {
> -        build_guest_fsinfo_for_virtual_device(syspath, fs, errp);
> -    } else {
> -        build_guest_fsinfo_for_real_device(syspath, fs, errp);
> -    }
> -}
> -
> -#ifdef CONFIG_LIBUDEV
> -
> -/*
> - * Wrapper around build_guest_fsinfo_for_device() for getting just
> - * the disk address.
> - */
> -static GuestDiskAddress *get_disk_address(const char *syspath, Error
> **errp)
> -{
> -    g_autoptr(GuestFilesystemInfo) fs =3D NULL;
> -
> -    fs =3D g_new0(GuestFilesystemInfo, 1);
> -    build_guest_fsinfo_for_device(syspath, fs, errp);
> -    if (fs->disk !=3D NULL) {
> -        return g_steal_pointer(&fs->disk->value);
> -    }
> -    return NULL;
> -}
> -
> -static char *get_alias_for_syspath(const char *syspath)
> -{
> -    struct udev *udev =3D NULL;
> -    struct udev_device *udevice =3D NULL;
> -    char *ret =3D NULL;
> -
> -    udev =3D udev_new();
> -    if (udev =3D=3D NULL) {
> -        g_debug("failed to query udev");
> -        goto out;
> -    }
> -    udevice =3D udev_device_new_from_syspath(udev, syspath);
> -    if (udevice =3D=3D NULL) {
> -        g_debug("failed to query udev for path: %s", syspath);
> -        goto out;
> -    } else {
> -        const char *alias =3D udev_device_get_property_value(
> -            udevice, "DM_NAME");
> -        /*
> -         * NULL means there was an error and empty string means there is
> no
> -         * alias. In case of no alias we return NULL instead of empty
> string.
> -         */
> -        if (alias =3D=3D NULL) {
> -            g_debug("failed to query udev for device alias for: %s",
> -                syspath);
> -        } else if (*alias !=3D 0) {
> -            ret =3D g_strdup(alias);
> -        }
> -    }
> -
> -out:
> -    udev_unref(udev);
> -    udev_device_unref(udevice);
> -    return ret;
> -}
> -
> -static char *get_device_for_syspath(const char *syspath)
> -{
> -    struct udev *udev =3D NULL;
> -    struct udev_device *udevice =3D NULL;
> -    char *ret =3D NULL;
> -
> -    udev =3D udev_new();
> -    if (udev =3D=3D NULL) {
> -        g_debug("failed to query udev");
> -        goto out;
> -    }
> -    udevice =3D udev_device_new_from_syspath(udev, syspath);
> -    if (udevice =3D=3D NULL) {
> -        g_debug("failed to query udev for path: %s", syspath);
> -        goto out;
> -    } else {
> -        ret =3D g_strdup(udev_device_get_devnode(udevice));
> -    }
> -
> -out:
> -    udev_unref(udev);
> -    udev_device_unref(udevice);
> -    return ret;
> -}
> -
> -static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
> -{
> -    g_autofree char *deps_dir =3D NULL;
> -    const gchar *dep;
> -    GDir *dp_deps =3D NULL;
> -
> -    /* List dependent disks */
> -    deps_dir =3D g_strdup_printf("%s/slaves", disk_dir);
> -    g_debug("  listing entries in: %s", deps_dir);
> -    dp_deps =3D g_dir_open(deps_dir, 0, NULL);
> -    if (dp_deps =3D=3D NULL) {
> -        g_debug("failed to list entries in %s", deps_dir);
> -        return;
> -    }
> -    disk->has_dependencies =3D true;
> -    while ((dep =3D g_dir_read_name(dp_deps)) !=3D NULL) {
> -        g_autofree char *dep_dir =3D NULL;
> -        char *dev_name;
> -
> -        /* Add dependent disks */
> -        dep_dir =3D g_strdup_printf("%s/%s", deps_dir, dep);
> -        dev_name =3D get_device_for_syspath(dep_dir);
> -        if (dev_name !=3D NULL) {
> -            g_debug("  adding dependent device: %s", dev_name);
> -            QAPI_LIST_PREPEND(disk->dependencies, dev_name);
> -        }
> -    }
> -    g_dir_close(dp_deps);
> -}
> -
> -/*
> - * Detect partitions subdirectory, name is "<disk_name><number>" or
> - * "<disk_name>p<number>"
> - *
> - * @disk_name -- last component of /sys path (e.g. sda)
> - * @disk_dir -- sys path of the disk (e.g. /sys/block/sda)
> - * @disk_dev -- device node of the disk (e.g. /dev/sda)
> - */
> -static GuestDiskInfoList *get_disk_partitions(
> -    GuestDiskInfoList *list,
> -    const char *disk_name, const char *disk_dir,
> -    const char *disk_dev)
> -{
> -    GuestDiskInfoList *ret =3D list;
> -    struct dirent *de_disk;
> -    DIR *dp_disk =3D NULL;
> -    size_t len =3D strlen(disk_name);
> -
> -    dp_disk =3D opendir(disk_dir);
> -    while ((de_disk =3D readdir(dp_disk)) !=3D NULL) {
> -        g_autofree char *partition_dir =3D NULL;
> -        char *dev_name;
> -        GuestDiskInfo *partition;
> -
> -        if (!(de_disk->d_type & DT_DIR)) {
> -            continue;
> -        }
> -
> -        if (!(strncmp(disk_name, de_disk->d_name, len) =3D=3D 0 &&
> -            ((*(de_disk->d_name + len) =3D=3D 'p' &&
> -            isdigit(*(de_disk->d_name + len + 1))) ||
> -                isdigit(*(de_disk->d_name + len))))) {
> -            continue;
> -        }
> -
> -        partition_dir =3D g_strdup_printf("%s/%s",
> -            disk_dir, de_disk->d_name);
> -        dev_name =3D get_device_for_syspath(partition_dir);
> -        if (dev_name =3D=3D NULL) {
> -            g_debug("Failed to get device name for syspath: %s",
> -                disk_dir);
> -            continue;
> -        }
> -        partition =3D g_new0(GuestDiskInfo, 1);
> -        partition->name =3D dev_name;
> -        partition->partition =3D true;
> -        partition->has_dependencies =3D true;
> -        /* Add parent disk as dependent for easier tracking of hierarchy
> */
> -        QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev));
> -
> -        QAPI_LIST_PREPEND(ret, partition);
> -    }
> -    closedir(dp_disk);
> -
> -    return ret;
> -}
> -
> -static void get_nvme_smart(GuestDiskInfo *disk)
> -{
> -    int fd;
> -    GuestNVMeSmart *smart;
> -    NvmeSmartLog log =3D {0};
> -    struct nvme_admin_cmd cmd =3D {
> -        .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,
> -        .nsid =3D NVME_NSID_BROADCAST,
> -        .addr =3D (uintptr_t)&log,
> -        .data_len =3D sizeof(log),
> -        .cdw10 =3D NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
> -                 | (((sizeof(log) >> 2) - 1) << 16)
> -    };
> -
> -    fd =3D qga_open_cloexec(disk->name, O_RDONLY, 0);
> -    if (fd =3D=3D -1) {
> -        g_debug("Failed to open device: %s: %s", disk->name,
> g_strerror(errno));
> -        return;
> -    }
> -
> -    if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
> -        g_debug("Failed to get smart: %s: %s", disk->name,
> g_strerror(errno));
> -        close(fd);
> -        return;
> -    }
> -
> -    disk->has_smart =3D true;
> -    disk->smart =3D g_new0(GuestDiskSmart, 1);
> -    disk->smart->type =3D GUEST_DISK_BUS_TYPE_NVME;
> -
> -    smart =3D &disk->smart->u.nvme;
> -    smart->critical_warning =3D log.critical_warning;
> -    smart->temperature =3D lduw_le_p(&log.temperature); /* unaligned fie=
ld
> */
> -    smart->available_spare =3D log.available_spare;
> -    smart->available_spare_threshold =3D log.available_spare_threshold;
> -    smart->percentage_used =3D log.percentage_used;
> -    smart->data_units_read_lo =3D le64_to_cpu(log.data_units_read[0]);
> -    smart->data_units_read_hi =3D le64_to_cpu(log.data_units_read[1]);
> -    smart->data_units_written_lo =3D le64_to_cpu(log.data_units_written[=
0]);
> -    smart->data_units_written_hi =3D le64_to_cpu(log.data_units_written[=
1]);
> -    smart->host_read_commands_lo =3D le64_to_cpu(log.host_read_commands[=
0]);
> -    smart->host_read_commands_hi =3D le64_to_cpu(log.host_read_commands[=
1]);
> -    smart->host_write_commands_lo =3D
> le64_to_cpu(log.host_write_commands[0]);
> -    smart->host_write_commands_hi =3D
> le64_to_cpu(log.host_write_commands[1]);
> -    smart->controller_busy_time_lo =3D
> le64_to_cpu(log.controller_busy_time[0]);
> -    smart->controller_busy_time_hi =3D
> le64_to_cpu(log.controller_busy_time[1]);
> -    smart->power_cycles_lo =3D le64_to_cpu(log.power_cycles[0]);
> -    smart->power_cycles_hi =3D le64_to_cpu(log.power_cycles[1]);
> -    smart->power_on_hours_lo =3D le64_to_cpu(log.power_on_hours[0]);
> -    smart->power_on_hours_hi =3D le64_to_cpu(log.power_on_hours[1]);
> -    smart->unsafe_shutdowns_lo =3D le64_to_cpu(log.unsafe_shutdowns[0]);
> -    smart->unsafe_shutdowns_hi =3D le64_to_cpu(log.unsafe_shutdowns[1]);
> -    smart->media_errors_lo =3D le64_to_cpu(log.media_errors[0]);
> -    smart->media_errors_hi =3D le64_to_cpu(log.media_errors[1]);
> -    smart->number_of_error_log_entries_lo =3D
> -        le64_to_cpu(log.number_of_error_log_entries[0]);
> -    smart->number_of_error_log_entries_hi =3D
> -        le64_to_cpu(log.number_of_error_log_entries[1]);
> -
> -    close(fd);
> -}
> -
> -static void get_disk_smart(GuestDiskInfo *disk)
> -{
> -    if (disk->has_address
> -        && (disk->address->bus_type =3D=3D GUEST_DISK_BUS_TYPE_NVME)) {
> -        get_nvme_smart(disk);
> -    }
> -}
> -
> -GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> -{
> -    GuestDiskInfoList *ret =3D NULL;
> -    GuestDiskInfo *disk;
> -    DIR *dp =3D NULL;
> -    struct dirent *de =3D NULL;
> -
> -    g_debug("listing /sys/block directory");
> -    dp =3D opendir("/sys/block");
> -    if (dp =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "Can't open directory
> \"/sys/block\"");
> -        return NULL;
> -    }
> -    while ((de =3D readdir(dp)) !=3D NULL) {
> -        g_autofree char *disk_dir =3D NULL, *line =3D NULL,
> -            *size_path =3D NULL;
> -        char *dev_name;
> -        Error *local_err =3D NULL;
> -        if (de->d_type !=3D DT_LNK) {
> -            g_debug("  skipping entry: %s", de->d_name);
> -            continue;
> -        }
> -
> -        /* Check size and skip zero-sized disks */
> -        g_debug("  checking disk size");
> -        size_path =3D g_strdup_printf("/sys/block/%s/size", de->d_name);
> -        if (!g_file_get_contents(size_path, &line, NULL, NULL)) {
> -            g_debug("  failed to read disk size");
> -            continue;
> -        }
> -        if (g_strcmp0(line, "0\n") =3D=3D 0) {
> -            g_debug("  skipping zero-sized disk");
> -            continue;
> -        }
> -
> -        g_debug("  adding %s", de->d_name);
> -        disk_dir =3D g_strdup_printf("/sys/block/%s", de->d_name);
> -        dev_name =3D get_device_for_syspath(disk_dir);
> -        if (dev_name =3D=3D NULL) {
> -            g_debug("Failed to get device name for syspath: %s",
> -                disk_dir);
> -            continue;
> -        }
> -        disk =3D g_new0(GuestDiskInfo, 1);
> -        disk->name =3D dev_name;
> -        disk->partition =3D false;
> -        disk->alias =3D get_alias_for_syspath(disk_dir);
> -        disk->has_alias =3D (disk->alias !=3D NULL);
> -        QAPI_LIST_PREPEND(ret, disk);
> -
> -        /* Get address for non-virtual devices */
> -        bool is_virtual =3D is_disk_virtual(disk_dir, &local_err);
> -        if (local_err !=3D NULL) {
> -            g_debug("  failed to check disk path, ignoring error: %s",
> -                error_get_pretty(local_err));
> -            error_free(local_err);
> -            local_err =3D NULL;
> -            /* Don't try to get the address */
> -            is_virtual =3D true;
> -        }
> -        if (!is_virtual) {
> -            disk->address =3D get_disk_address(disk_dir, &local_err);
> -            if (local_err !=3D NULL) {
> -                g_debug("  failed to get device info, ignoring error: %s=
",
> -                    error_get_pretty(local_err));
> -                error_free(local_err);
> -                local_err =3D NULL;
> -            } else if (disk->address !=3D NULL) {
> -                disk->has_address =3D true;
> -            }
> -        }
> -
> -        get_disk_deps(disk_dir, disk);
> -        get_disk_smart(disk);
> -        ret =3D get_disk_partitions(ret, de->d_name, disk_dir, dev_name)=
;
> -    }
> -
> -    closedir(dp);
> -
> -    return ret;
> -}
> -
> -#else
> -
> -GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
> -{
> -    error_setg(errp, QERR_UNSUPPORTED);
> -    return NULL;
> -}
> -
> -#endif
> -
> -/* Return a list of the disk device(s)' info which @mount lies on */
> -static GuestFilesystemInfo *build_guest_fsinfo(struct FsMount *mount,
> -                                               Error **errp)
> -{
> -    GuestFilesystemInfo *fs =3D g_malloc0(sizeof(*fs));
> -    struct statvfs buf;
> -    unsigned long used, nonroot_total, fr_size;
> -    char *devpath =3D g_strdup_printf("/sys/dev/block/%u:%u",
> -                                    mount->devmajor, mount->devminor);
> -
> -    fs->mountpoint =3D g_strdup(mount->dirname);
> -    fs->type =3D g_strdup(mount->devtype);
> -    build_guest_fsinfo_for_device(devpath, fs, errp);
> -
> -    if (statvfs(fs->mountpoint, &buf) =3D=3D 0) {
> -        fr_size =3D buf.f_frsize;
> -        used =3D buf.f_blocks - buf.f_bfree;
> -        nonroot_total =3D used + buf.f_bavail;
> -        fs->used_bytes =3D used * fr_size;
> -        fs->total_bytes =3D nonroot_total * fr_size;
> -
> -        fs->has_total_bytes =3D true;
> -        fs->has_used_bytes =3D true;
> -    }
> -
> -    g_free(devpath);
> -
> -    return fs;
> -}
> -
> -GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
> -{
> -    FsMountList mounts;
> -    struct FsMount *mount;
> -    GuestFilesystemInfoList *ret =3D NULL;
> -    Error *local_err =3D NULL;
> -
> -    QTAILQ_INIT(&mounts);
> -    if (!build_fs_mount_list(&mounts, &local_err)) {
> -        error_propagate(errp, local_err);
> -        return NULL;
> -    }
> -
> -    QTAILQ_FOREACH(mount, &mounts, next) {
> -        g_debug("Building guest fsinfo for '%s'", mount->dirname);
> -
> -        QAPI_LIST_PREPEND(ret, build_guest_fsinfo(mount, &local_err));
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -            qapi_free_GuestFilesystemInfoList(ret);
> -            ret =3D NULL;
> -            break;
> -        }
> -    }
> -
> -    free_fs_mount_list(&mounts);
> -    return ret;
> -}
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
> -/*
> - * Walk list of mounted file systems in the guest, and freeze the ones
> which
> - * are real local file systems.
> - */
> -int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
> -                                       strList *mountpoints,
> -                                       Error **errp)
> -{
> -    int ret =3D 0, i =3D 0;
> -    strList *list;
> -    FsMountList mounts;
> -    struct FsMount *mount;
> -    Error *local_err =3D NULL;
> -    int fd;
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
> -    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
> -        /* To issue fsfreeze in the reverse order of mounts, check if th=
e
> -         * mount is listed in the list here */
> -        if (has_mountpoints) {
> -            for (list =3D mountpoints; list; list =3D list->next) {
> -                if (strcmp(list->value, mount->dirname) =3D=3D 0) {
> -                    break;
> -                }
> -            }
> -            if (!list) {
> -                continue;
> -            }
> -        }
> -
> -        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> -        if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "failed to open %s",
> mount->dirname);
> -            goto error;
> -        }
> -
> -        /* we try to cull filesystems we know won't work in advance, but
> other
> -         * filesystems may not implement fsfreeze for less obvious
> reasons.
> -         * these will report EOPNOTSUPP. we simply ignore these when
> tallying
> -         * the number of frozen filesystems.
> -         * if a filesystem is mounted more than once (aka bind mount) a
> -         * consecutive attempt to freeze an already frozen filesystem wi=
ll
> -         * return EBUSY.
> -         *
> -         * any other error means a failure to freeze a filesystem we
> -         * expect to be freezable, so return an error in those cases
> -         * and return system to thawed state.
> -         */
> -        ret =3D ioctl(fd, FIFREEZE);
> -        if (ret =3D=3D -1) {
> -            if (errno !=3D EOPNOTSUPP && errno !=3D EBUSY) {
> -                error_setg_errno(errp, errno, "failed to freeze %s",
> -                                 mount->dirname);
> -                close(fd);
> -                goto error;
> -            }
> -        } else {
> -            i++;
> -        }
> -        close(fd);
> -    }
> -
> -    free_fs_mount_list(&mounts);
> -    /* We may not issue any FIFREEZE here.
> -     * Just unset ga_state here and ready for the next call.
> -     */
> -    if (i =3D=3D 0) {
> -        ga_unset_frozen(ga_state);
> -    }
> -    return i;
> -
> -error:
> -    free_fs_mount_list(&mounts);
> -    qmp_guest_fsfreeze_thaw(NULL);
> -    return 0;
> -}
> -
> -/*
> - * Walk list of frozen file systems in the guest, and thaw them.
> - */
> -int64_t qmp_guest_fsfreeze_thaw(Error **errp)
> -{
> -    int ret;
> -    FsMountList mounts;
> -    FsMount *mount;
> -    int fd, i =3D 0, logged;
> -    Error *local_err =3D NULL;
> -
> -    QTAILQ_INIT(&mounts);
> -    if (!build_fs_mount_list(&mounts, &local_err)) {
> -        error_propagate(errp, local_err);
> -        return 0;
> -    }
> -
> -    QTAILQ_FOREACH(mount, &mounts, next) {
> -        logged =3D false;
> -        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> -        if (fd =3D=3D -1) {
> -            continue;
> -        }
> -        /* we have no way of knowing whether a filesystem was actually
> unfrozen
> -         * as a result of a successful call to FITHAW, only that if an
> error
> -         * was returned the filesystem was *not* unfrozen by that
> particular
> -         * call.
> -         *
> -         * since multiple preceding FIFREEZEs require multiple calls to
> FITHAW
> -         * to unfreeze, continuing issuing FITHAW until an error is
> returned,
> -         * in which case either the filesystem is in an unfreezable
> state, or,
> -         * more likely, it was thawed previously (and remains so
> afterward).
> -         *
> -         * also, since the most recent successful call is the one that d=
id
> -         * the actual unfreeze, we can use this to provide an accurate
> count
> -         * of the number of filesystems unfrozen by guest-fsfreeze-thaw,
> which
> -         * may * be useful for determining whether a filesystem was
> unfrozen
> -         * during the freeze/thaw phase by a process other than qemu-ga.
> -         */
> -        do {
> -            ret =3D ioctl(fd, FITHAW);
> -            if (ret =3D=3D 0 && !logged) {
> -                i++;
> -                logged =3D true;
> -            }
> -        } while (ret =3D=3D 0);
> -        close(fd);
> -    }
> -
> -    ga_unset_frozen(ga_state);
> -    free_fs_mount_list(&mounts);
> -
> -    execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
> -
> -    return i;
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
> -#endif /* CONFIG_FSFREEZE */
> -
> -#if defined(CONFIG_FSTRIM)
> -/*
> - * Walk list of mounted file systems in the guest, and trim them.
> - */
> -GuestFilesystemTrimResponse *
> -qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
> -{
> -    GuestFilesystemTrimResponse *response;
> -    GuestFilesystemTrimResult *result;
> -    int ret =3D 0;
> -    FsMountList mounts;
> -    struct FsMount *mount;
> -    int fd;
> -    struct fstrim_range r;
> -
> -    slog("guest-fstrim called");
> -
> -    QTAILQ_INIT(&mounts);
> -    if (!build_fs_mount_list(&mounts, errp)) {
> -        return NULL;
> -    }
> -
> -    response =3D g_malloc0(sizeof(*response));
> -
> -    QTAILQ_FOREACH(mount, &mounts, next) {
> -        result =3D g_malloc0(sizeof(*result));
> -        result->path =3D g_strdup(mount->dirname);
> -
> -        QAPI_LIST_PREPEND(response->paths, result);
> -
> -        fd =3D qga_open_cloexec(mount->dirname, O_RDONLY, 0);
> -        if (fd =3D=3D -1) {
> -            result->error =3D g_strdup_printf("failed to open: %s",
> -                                            strerror(errno));
> -            result->has_error =3D true;
> -            continue;
> -        }
> -
> -        /* We try to cull filesystems we know won't work in advance, but
> other
> -         * filesystems may not implement fstrim for less obvious reasons=
.
> -         * These will report EOPNOTSUPP; while in some other cases ENOTT=
Y
> -         * will be reported (e.g. CD-ROMs).
> -         * Any other error means an unexpected error.
> -         */
> -        r.start =3D 0;
> -        r.len =3D -1;
> -        r.minlen =3D has_minimum ? minimum : 0;
> -        ret =3D ioctl(fd, FITRIM, &r);
> -        if (ret =3D=3D -1) {
> -            result->has_error =3D true;
> -            if (errno =3D=3D ENOTTY || errno =3D=3D EOPNOTSUPP) {
> -                result->error =3D g_strdup("trim not supported");
> -            } else {
> -                result->error =3D g_strdup_printf("failed to trim: %s",
> -                                                strerror(errno));
> -            }
> -            close(fd);
> -            continue;
> -        }
> -
> -        result->has_minimum =3D true;
> -        result->minimum =3D r.minlen;
> -        result->has_trimmed =3D true;
> -        result->trimmed =3D r.len;
> -        close(fd);
> -    }
> -
> -    free_fs_mount_list(&mounts);
> -    return response;
> -}
> -#endif /* CONFIG_FSTRIM */
> -
> -
> -#define LINUX_SYS_STATE_FILE "/sys/power/state"
> -#define SUSPEND_SUPPORTED 0
> -#define SUSPEND_NOT_SUPPORTED 1
> -
> -typedef enum {
> -    SUSPEND_MODE_DISK =3D 0,
> -    SUSPEND_MODE_RAM =3D 1,
> -    SUSPEND_MODE_HYBRID =3D 2,
> -} SuspendMode;
> -
> -/*
> - * Executes a command in a child process using g_spawn_sync,
> - * returning an int >=3D 0 representing the exit status of the
> - * process.
> - *
> - * If the program wasn't found in path, returns -1.
> - *
> - * If a problem happened when creating the child process,
> - * returns -1 and errp is set.
> - */
> -static int run_process_child(const char *command[], Error **errp)
> -{
> -    int exit_status, spawn_flag;
> -    GError *g_err =3D NULL;
> -    bool success;
> -
> -    spawn_flag =3D G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_NULL |
> -                 G_SPAWN_STDERR_TO_DEV_NULL;
> -
> -    success =3D  g_spawn_sync(NULL, (char **)command, NULL, spawn_flag,
> -                            NULL, NULL, NULL, NULL,
> -                            &exit_status, &g_err);
> -
> -    if (success) {
> -        return WEXITSTATUS(exit_status);
> -    }
> -
> -    if (g_err && (g_err->code !=3D G_SPAWN_ERROR_NOENT)) {
> -        error_setg(errp, "failed to create child process, error '%s'",
> -                   g_err->message);
> -    }
> -
> -    g_error_free(g_err);
> -    return -1;
> -}
> -
> -static bool systemd_supports_mode(SuspendMode mode, Error **errp)
> -{
> -    const char *systemctl_args[3] =3D {"systemd-hibernate",
> "systemd-suspend",
> -                                     "systemd-hybrid-sleep"};
> -    const char *cmd[4] =3D {"systemctl", "status", systemctl_args[mode],
> NULL};
> -    int status;
> -
> -    status =3D run_process_child(cmd, errp);
> -
> -    /*
> -     * systemctl status uses LSB return codes so we can expect
> -     * status > 0 and be ok. To assert if the guest has support
> -     * for the selected suspend mode, status should be < 4. 4 is
> -     * the code for unknown service status, the return value when
> -     * the service does not exist. A common value is status =3D 3
> -     * (program is not running).
> -     */
> -    if (status > 0 && status < 4) {
> -        return true;
> -    }
> -
> -    return false;
> -}
> -
> -static void systemd_suspend(SuspendMode mode, Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    const char *systemctl_args[3] =3D {"hibernate", "suspend",
> "hybrid-sleep"};
> -    const char *cmd[3] =3D {"systemctl", systemctl_args[mode], NULL};
> -    int status;
> -
> -    status =3D run_process_child(cmd, &local_err);
> -
> -    if (status =3D=3D 0) {
> -        return;
> -    }
> -
> -    if ((status =3D=3D -1) && !local_err) {
> -        error_setg(errp, "the helper program 'systemctl %s' was not
> found",
> -                   systemctl_args[mode]);
> -        return;
> -    }
> -
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -    } else {
> -        error_setg(errp, "the helper program 'systemctl %s' returned an =
"
> -                   "unexpected exit status code (%d)",
> -                   systemctl_args[mode], status);
> -    }
> -}
> -
> -static bool pmutils_supports_mode(SuspendMode mode, Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    const char *pmutils_args[3] =3D {"--hibernate", "--suspend",
> -                                   "--suspend-hybrid"};
> -    const char *cmd[3] =3D {"pm-is-supported", pmutils_args[mode], NULL}=
;
> -    int status;
> -
> -    status =3D run_process_child(cmd, &local_err);
> -
> -    if (status =3D=3D SUSPEND_SUPPORTED) {
> -        return true;
> -    }
> -
> -    if ((status =3D=3D -1) && !local_err) {
> -        return false;
> -    }
> -
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -    } else {
> -        error_setg(errp,
> -                   "the helper program '%s' returned an unexpected exit"
> -                   " status code (%d)", "pm-is-supported", status);
> -    }
> -
> -    return false;
> -}
> -
> -static void pmutils_suspend(SuspendMode mode, Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    const char *pmutils_binaries[3] =3D {"pm-hibernate", "pm-suspend",
> -                                       "pm-suspend-hybrid"};
> -    const char *cmd[2] =3D {pmutils_binaries[mode], NULL};
> -    int status;
> -
> -    status =3D run_process_child(cmd, &local_err);
> -
> -    if (status =3D=3D 0) {
> -        return;
> -    }
> -
> -    if ((status =3D=3D -1) && !local_err) {
> -        error_setg(errp, "the helper program '%s' was not found",
> -                   pmutils_binaries[mode]);
> -        return;
> -    }
> -
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -    } else {
> -        error_setg(errp,
> -                   "the helper program '%s' returned an unexpected exit"
> -                   " status code (%d)", pmutils_binaries[mode], status);
> -    }
> -}
> -
> -static bool linux_sys_state_supports_mode(SuspendMode mode, Error **errp=
)
> -{
> -    const char *sysfile_strs[3] =3D {"disk", "mem", NULL};
> -    const char *sysfile_str =3D sysfile_strs[mode];
> -    char buf[32]; /* hopefully big enough */
> -    int fd;
> -    ssize_t ret;
> -
> -    if (!sysfile_str) {
> -        error_setg(errp, "unknown guest suspend mode");
> -        return false;
> -    }
> -
> -    fd =3D open(LINUX_SYS_STATE_FILE, O_RDONLY);
> -    if (fd < 0) {
> -        return false;
> -    }
> -
> -    ret =3D read(fd, buf, sizeof(buf) - 1);
> -    close(fd);
> -    if (ret <=3D 0) {
> -        return false;
> -    }
> -    buf[ret] =3D '\0';
> -
> -    if (strstr(buf, sysfile_str)) {
> -        return true;
> -    }
> -    return false;
> -}
> -
> -static void linux_sys_state_suspend(SuspendMode mode, Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    const char *sysfile_strs[3] =3D {"disk", "mem", NULL};
> -    const char *sysfile_str =3D sysfile_strs[mode];
> -    pid_t pid;
> -    int status;
> -
> -    if (!sysfile_str) {
> -        error_setg(errp, "unknown guest suspend mode");
> -        return;
> -    }
> -
> -    pid =3D fork();
> -    if (!pid) {
> -        /* child */
> -        int fd;
> -
> -        setsid();
> -        reopen_fd_to_null(0);
> -        reopen_fd_to_null(1);
> -        reopen_fd_to_null(2);
> -
> -        fd =3D open(LINUX_SYS_STATE_FILE, O_WRONLY);
> -        if (fd < 0) {
> -            _exit(EXIT_FAILURE);
> -        }
> -
> -        if (write(fd, sysfile_str, strlen(sysfile_str)) < 0) {
> -            _exit(EXIT_FAILURE);
> -        }
> -
> -        _exit(EXIT_SUCCESS);
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
> -    if (WEXITSTATUS(status)) {
> -        error_setg(errp, "child process has failed to suspend");
> -    }
> -
> -}
> -
> -static void guest_suspend(SuspendMode mode, Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    bool mode_supported =3D false;
> -
> -    if (systemd_supports_mode(mode, &local_err)) {
> -        mode_supported =3D true;
> -        systemd_suspend(mode, &local_err);
> -    }
> -
> -    if (!local_err) {
> -        return;
> -    }
> -
> -    error_free(local_err);
> -    local_err =3D NULL;
> -
> -    if (pmutils_supports_mode(mode, &local_err)) {
> -        mode_supported =3D true;
> -        pmutils_suspend(mode, &local_err);
> -    }
> -
> -    if (!local_err) {
> -        return;
> -    }
> -
> -    error_free(local_err);
> -    local_err =3D NULL;
> -
> -    if (linux_sys_state_supports_mode(mode, &local_err)) {
> -        mode_supported =3D true;
> -        linux_sys_state_suspend(mode, &local_err);
> -    }
> -
> -    if (!mode_supported) {
> -        error_free(local_err);
> -        error_setg(errp,
> -                   "the requested suspend mode is not supported by the
> guest");
> -    } else {
> -        error_propagate(errp, local_err);
> -    }
> -}
> -
> -void qmp_guest_suspend_disk(Error **errp)
> -{
> -    guest_suspend(SUSPEND_MODE_DISK, errp);
> -}
> -
> -void qmp_guest_suspend_ram(Error **errp)
> -{
> -    guest_suspend(SUSPEND_MODE_RAM, errp);
> -}
> -
> -void qmp_guest_suspend_hybrid(Error **errp)
> -{
> -    guest_suspend(SUSPEND_MODE_HYBRID, errp);
> -}
> -
> -/* Transfer online/offline status between @vcpu and the guest system.
> - *
> - * On input either @errp or *@errp must be NULL.
> - *
> - * In system-to-@vcpu direction, the following @vcpu fields are accessed=
:
> - * - R: vcpu->logical_id
> - * - W: vcpu->online
> - * - W: vcpu->can_offline
> - *
> - * In @vcpu-to-system direction, the following @vcpu fields are accessed=
:
> - * - R: vcpu->logical_id
> - * - R: vcpu->online
> - *
> - * Written members remain unmodified on error.
> - */
> -static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
> -                          char *dirpath, Error **errp)
> -{
> -    int fd;
> -    int res;
> -    int dirfd;
> -    static const char fn[] =3D "online";
> -
> -    dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
> -    if (dirfd =3D=3D -1) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> -        return;
> -    }
> -
> -    fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
> -    if (fd =3D=3D -1) {
> -        if (errno !=3D ENOENT) {
> -            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn=
);
> -        } else if (sys2vcpu) {
> -            vcpu->online =3D true;
> -            vcpu->can_offline =3D false;
> -        } else if (!vcpu->online) {
> -            error_setg(errp, "logical processor #%" PRId64 " can't be "
> -                       "offlined", vcpu->logical_id);
> -        } /* otherwise pretend successful re-onlining */
> -    } else {
> -        unsigned char status;
> -
> -        res =3D pread(fd, &status, 1, 0);
> -        if (res =3D=3D -1) {
> -            error_setg_errno(errp, errno, "pread(\"%s/%s\")", dirpath,
> fn);
> -        } else if (res =3D=3D 0) {
> -            error_setg(errp, "pread(\"%s/%s\"): unexpected EOF", dirpath=
,
> -                       fn);
> -        } else if (sys2vcpu) {
> -            vcpu->online =3D (status !=3D '0');
> -            vcpu->can_offline =3D true;
> -        } else if (vcpu->online !=3D (status !=3D '0')) {
> -            status =3D '0' + vcpu->online;
> -            if (pwrite(fd, &status, 1, 0) =3D=3D -1) {
> -                error_setg_errno(errp, errno, "pwrite(\"%s/%s\")",
> dirpath,
> -                                 fn);
> -            }
> -        } /* otherwise pretend successful re-(on|off)-lining */
> -
> -        res =3D close(fd);
> -        g_assert(res =3D=3D 0);
> -    }
> -
> -    res =3D close(dirfd);
> -    g_assert(res =3D=3D 0);
> -}
> -
> -GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
> -{
> -    GuestLogicalProcessorList *head, **tail;
> -    const char *cpu_dir =3D "/sys/devices/system/cpu";
> -    const gchar *line;
> -    g_autoptr(GDir) cpu_gdir =3D NULL;
> -    Error *local_err =3D NULL;
> -
> -    head =3D NULL;
> -    tail =3D &head;
> -    cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);
> -
> -    if (cpu_gdir =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "failed to list entries: %s",
> cpu_dir);
> -        return NULL;
> -    }
> -
> -    while (local_err =3D=3D NULL && (line =3D g_dir_read_name(cpu_gdir))=
 !=3D
> NULL) {
> -        GuestLogicalProcessor *vcpu;
> -        int64_t id;
> -        if (sscanf(line, "cpu%" PRId64, &id)) {
> -            g_autofree char *path =3D
> g_strdup_printf("/sys/devices/system/cpu/"
> -                                                    "cpu%" PRId64 "/",
> id);
> -            vcpu =3D g_malloc0(sizeof *vcpu);
> -            vcpu->logical_id =3D id;
> -            vcpu->has_can_offline =3D true; /* lolspeak ftw */
> -            transfer_vcpu(vcpu, true, path, &local_err);
> -            QAPI_LIST_APPEND(tail, vcpu);
> -        }
> -    }
> -
> -    if (local_err =3D=3D NULL) {
> -        /* there's no guest with zero VCPUs */
> -        g_assert(head !=3D NULL);
> -        return head;
> -    }
> -
> -    qapi_free_GuestLogicalProcessorList(head);
> -    error_propagate(errp, local_err);
> -    return NULL;
> -}
> -
> -int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error
> **errp)
> -{
> -    int64_t processed;
> -    Error *local_err =3D NULL;
> -
> -    processed =3D 0;
> -    while (vcpus !=3D NULL) {
> -        char *path =3D g_strdup_printf("/sys/devices/system/cpu/cpu%"
> PRId64 "/",
> -                                     vcpus->value->logical_id);
> -
> -        transfer_vcpu(vcpus->value, false, path, &local_err);
> -        g_free(path);
> -        if (local_err !=3D NULL) {
> -            break;
> -        }
> -        ++processed;
> -        vcpus =3D vcpus->next;
> -    }
> -
> -    if (local_err !=3D NULL) {
> -        if (processed =3D=3D 0) {
> -            error_propagate(errp, local_err);
> -        } else {
> -            error_free(local_err);
> -        }
> -    }
> -
> -    return processed;
> -}
> -
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
> -static void ga_read_sysfs_file(int dirfd, const char *pathname, char *bu=
f,
> -                               int size, Error **errp)
> -{
> -    int fd;
> -    int res;
> -
> -    errno =3D 0;
> -    fd =3D openat(dirfd, pathname, O_RDONLY);
> -    if (fd =3D=3D -1) {
> -        error_setg_errno(errp, errno, "open sysfs file \"%s\"", pathname=
);
> -        return;
> -    }
> -
> -    res =3D pread(fd, buf, size, 0);
> -    if (res =3D=3D -1) {
> -        error_setg_errno(errp, errno, "pread sysfs file \"%s\"",
> pathname);
> -    } else if (res =3D=3D 0) {
> -        error_setg(errp, "pread sysfs file \"%s\": unexpected EOF",
> pathname);
> -    }
> -    close(fd);
> -}
> -
> -static void ga_write_sysfs_file(int dirfd, const char *pathname,
> -                                const char *buf, int size, Error **errp)
> -{
> -    int fd;
> -
> -    errno =3D 0;
> -    fd =3D openat(dirfd, pathname, O_WRONLY);
> -    if (fd =3D=3D -1) {
> -        error_setg_errno(errp, errno, "open sysfs file \"%s\"", pathname=
);
> -        return;
> -    }
> -
> -    if (pwrite(fd, buf, size, 0) =3D=3D -1) {
> -        error_setg_errno(errp, errno, "pwrite sysfs file \"%s\"",
> pathname);
> -    }
> -
> -    close(fd);
> -}
> -
> -/* Transfer online/offline status between @mem_blk and the guest system.
> - *
> - * On input either @errp or *@errp must be NULL.
> - *
> - * In system-to-@mem_blk direction, the following @mem_blk fields are
> accessed:
> - * - R: mem_blk->phys_index
> - * - W: mem_blk->online
> - * - W: mem_blk->can_offline
> - *
> - * In @mem_blk-to-system direction, the following @mem_blk fields are
> accessed:
> - * - R: mem_blk->phys_index
> - * - R: mem_blk->online
> - *-  R: mem_blk->can_offline
> - * Written members remain unmodified on error.
> - */
> -static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool
> sys2memblk,
> -                                  GuestMemoryBlockResponse *result,
> -                                  Error **errp)
> -{
> -    char *dirpath;
> -    int dirfd;
> -    char *status;
> -    Error *local_err =3D NULL;
> -
> -    if (!sys2memblk) {
> -        DIR *dp;
> -
> -        if (!result) {
> -            error_setg(errp, "Internal error, 'result' should not be
> NULL");
> -            return;
> -        }
> -        errno =3D 0;
> -        dp =3D opendir("/sys/devices/system/memory/");
> -         /* if there is no 'memory' directory in sysfs,
> -         * we think this VM does not support online/offline memory block=
,
> -         * any other solution?
> -         */
> -        if (!dp) {
> -            if (errno =3D=3D ENOENT) {
> -                result->response =3D
> -
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
> -            }
> -            goto out1;
> -        }
> -        closedir(dp);
> -    }
> -
> -    dirpath =3D g_strdup_printf("/sys/devices/system/memory/memory%" PRI=
d64
> "/",
> -                              mem_blk->phys_index);
> -    dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
> -    if (dirfd =3D=3D -1) {
> -        if (sys2memblk) {
> -            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> -        } else {
> -            if (errno =3D=3D ENOENT) {
> -                result->response =3D
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
> -            } else {
> -                result->response =3D
> -                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
> -            }
> -        }
> -        g_free(dirpath);
> -        goto out1;
> -    }
> -    g_free(dirpath);
> -
> -    status =3D g_malloc0(10);
> -    ga_read_sysfs_file(dirfd, "state", status, 10, &local_err);
> -    if (local_err) {
> -        /* treat with sysfs file that not exist in old kernel */
> -        if (errno =3D=3D ENOENT) {
> -            error_free(local_err);
> -            if (sys2memblk) {
> -                mem_blk->online =3D true;
> -                mem_blk->can_offline =3D false;
> -            } else if (!mem_blk->online) {
> -                result->response =3D
> -
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
> -            }
> -        } else {
> -            if (sys2memblk) {
> -                error_propagate(errp, local_err);
> -            } else {
> -                error_free(local_err);
> -                result->response =3D
> -                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
> -            }
> -        }
> -        goto out2;
> -    }
> -
> -    if (sys2memblk) {
> -        char removable =3D '0';
> -
> -        mem_blk->online =3D (strncmp(status, "online", 6) =3D=3D 0);
> -
> -        ga_read_sysfs_file(dirfd, "removable", &removable, 1, &local_err=
);
> -        if (local_err) {
> -            /* if no 'removable' file, it doesn't support offline mem bl=
k
> */
> -            if (errno =3D=3D ENOENT) {
> -                error_free(local_err);
> -                mem_blk->can_offline =3D false;
> -            } else {
> -                error_propagate(errp, local_err);
> -            }
> -        } else {
> -            mem_blk->can_offline =3D (removable !=3D '0');
> -        }
> -    } else {
> -        if (mem_blk->online !=3D (strncmp(status, "online", 6) =3D=3D 0)=
) {
> -            const char *new_state =3D mem_blk->online ? "online" :
> "offline";
> -
> -            ga_write_sysfs_file(dirfd, "state", new_state,
> strlen(new_state),
> -                                &local_err);
> -            if (local_err) {
> -                error_free(local_err);
> -                result->response =3D
> -                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
> -                goto out2;
> -            }
> -
> -            result->response =3D GUEST_MEMORY_BLOCK_RESPONSE_TYPE_SUCCES=
S;
> -            result->has_error_code =3D false;
> -        } /* otherwise pretend successful re-(on|off)-lining */
> -    }
> -    g_free(status);
> -    close(dirfd);
> -    return;
> -
> -out2:
> -    g_free(status);
> -    close(dirfd);
> -out1:
> -    if (!sys2memblk) {
> -        result->has_error_code =3D true;
> -        result->error_code =3D errno;
> -    }
> -}
> -
> -GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
> -{
> -    GuestMemoryBlockList *head, **tail;
> -    Error *local_err =3D NULL;
> -    struct dirent *de;
> -    DIR *dp;
> -
> -    head =3D NULL;
> -    tail =3D &head;
> -
> -    dp =3D opendir("/sys/devices/system/memory/");
> -    if (!dp) {
> -        /* it's ok if this happens to be a system that doesn't expose
> -         * memory blocks via sysfs, but otherwise we should report
> -         * an error
> -         */
> -        if (errno !=3D ENOENT) {
> -            error_setg_errno(errp, errno, "Can't open directory"
> -                             "\"/sys/devices/system/memory/\"");
> -        }
> -        return NULL;
> -    }
> -
> -    /* Note: the phys_index of memory block may be discontinuous,
> -     * this is because a memblk is the unit of the Sparse Memory design,
> which
> -     * allows discontinuous memory ranges (ex. NUMA), so here we should
> -     * traverse the memory block directory.
> -     */
> -    while ((de =3D readdir(dp)) !=3D NULL) {
> -        GuestMemoryBlock *mem_blk;
> -
> -        if ((strncmp(de->d_name, "memory", 6) !=3D 0) ||
> -            !(de->d_type & DT_DIR)) {
> -            continue;
> -        }
> -
> -        mem_blk =3D g_malloc0(sizeof *mem_blk);
> -        /* The d_name is "memoryXXX",  phys_index is block id, same as
> XXX */
> -        mem_blk->phys_index =3D strtoul(&de->d_name[6], NULL, 10);
> -        mem_blk->has_can_offline =3D true; /* lolspeak ftw */
> -        transfer_memory_block(mem_blk, true, NULL, &local_err);
> -        if (local_err) {
> -            break;
> -        }
> -
> -        QAPI_LIST_APPEND(tail, mem_blk);
> -    }
> -
> -    closedir(dp);
> -    if (local_err =3D=3D NULL) {
> -        /* there's no guest with zero memory blocks */
> -        if (head =3D=3D NULL) {
> -            error_setg(errp, "guest reported zero memory blocks!");
> -        }
> -        return head;
> -    }
> -
> -    qapi_free_GuestMemoryBlockList(head);
> -    error_propagate(errp, local_err);
> -    return NULL;
> -}
> -
> -GuestMemoryBlockResponseList *
> -qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp=
)
> -{
> -    GuestMemoryBlockResponseList *head, **tail;
> -    Error *local_err =3D NULL;
> -
> -    head =3D NULL;
> -    tail =3D &head;
> -
> -    while (mem_blks !=3D NULL) {
> -        GuestMemoryBlockResponse *result;
> -        GuestMemoryBlock *current_mem_blk =3D mem_blks->value;
> -
> -        result =3D g_malloc0(sizeof(*result));
> -        result->phys_index =3D current_mem_blk->phys_index;
> -        transfer_memory_block(current_mem_blk, false, result, &local_err=
);
> -        if (local_err) { /* should never happen */
> -            goto err;
> -        }
> -
> -        QAPI_LIST_APPEND(tail, result);
> -        mem_blks =3D mem_blks->next;
> -    }
> -
> -    return head;
> -err:
> -    qapi_free_GuestMemoryBlockResponseList(head);
> -    error_propagate(errp, local_err);
> -    return NULL;
> -}
> -
> -GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
> -{
> -    Error *local_err =3D NULL;
> -    char *dirpath;
> -    int dirfd;
> -    char *buf;
> -    GuestMemoryBlockInfo *info;
> -
> -    dirpath =3D g_strdup_printf("/sys/devices/system/memory/");
> -    dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
> -    if (dirfd =3D=3D -1) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> -        g_free(dirpath);
> -        return NULL;
> -    }
> -    g_free(dirpath);
> -
> -    buf =3D g_malloc0(20);
> -    ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20, &local_err);
> -    close(dirfd);
> -    if (local_err) {
> -        g_free(buf);
> -        error_propagate(errp, local_err);
> -        return NULL;
> -    }
> -
> -    info =3D g_new0(GuestMemoryBlockInfo, 1);
> -    info->size =3D strtol(buf, NULL, 16); /* the unit is bytes */
> -
> -    g_free(buf);
> -
> -    return info;
> -}
> -
> -#define MAX_NAME_LEN 128
> -static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
> -{
> -#ifdef CONFIG_LINUX
> -    GuestDiskStatsInfoList *head =3D NULL, **tail =3D &head;
> -    const char *diskstats =3D "/proc/diskstats";
> -    FILE *fp;
> -    size_t n;
> -    char *line =3D NULL;
> -
> -    fp =3D fopen(diskstats, "r");
> -    if (fp  =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> -        return NULL;
> -    }
> -
> -    while (getline(&line, &n, fp) !=3D -1) {
> -        g_autofree GuestDiskStatsInfo *diskstatinfo =3D NULL;
> -        g_autofree GuestDiskStats *diskstat =3D NULL;
> -        char dev_name[MAX_NAME_LEN];
> -        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks,
> fl_ticks;
> -        unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec,
> wr_ios;
> -        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> -        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> -        unsigned int major, minor;
> -        int i;
> -
> -        i =3D sscanf(line, "%u %u %s %lu %lu %lu"
> -                   "%lu %lu %lu %lu %u %u %u %u"
> -                   "%lu %lu %lu %u %lu %u",
> -                   &major, &minor, dev_name,
> -                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> -                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> -                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> -                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> -                   &fl_ios, &fl_ticks);
> -
> -        if (i < 7) {
> -            continue;
> -        }
> -
> -        diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1);
> -        diskstatinfo->name =3D g_strdup(dev_name);
> -        diskstatinfo->major =3D major;
> -        diskstatinfo->minor =3D minor;
> -
> -        diskstat =3D g_new0(GuestDiskStats, 1);
> -        if (i =3D=3D 7) {
> -            diskstat->has_read_ios =3D true;
> -            diskstat->read_ios =3D rd_ios;
> -            diskstat->has_read_sectors =3D true;
> -            diskstat->read_sectors =3D rd_merges_or_rd_sec;
> -            diskstat->has_write_ios =3D true;
> -            diskstat->write_ios =3D rd_sec_or_wr_ios;
> -            diskstat->has_write_sectors =3D true;
> -            diskstat->write_sectors =3D rd_ticks_or_wr_sec;
> -        }
> -        if (i >=3D 14) {
> -            diskstat->has_read_ios =3D true;
> -            diskstat->read_ios =3D rd_ios;
> -            diskstat->has_read_sectors =3D true;
> -            diskstat->read_sectors =3D rd_sec_or_wr_ios;
> -            diskstat->has_read_merges =3D true;
> -            diskstat->read_merges =3D rd_merges_or_rd_sec;
> -            diskstat->has_read_ticks =3D true;
> -            diskstat->read_ticks =3D rd_ticks_or_wr_sec;
> -            diskstat->has_write_ios =3D true;
> -            diskstat->write_ios =3D wr_ios;
> -            diskstat->has_write_sectors =3D true;
> -            diskstat->write_sectors =3D wr_sec;
> -            diskstat->has_write_merges =3D true;
> -            diskstat->write_merges =3D wr_merges;
> -            diskstat->has_write_ticks =3D true;
> -            diskstat->write_ticks =3D wr_ticks;
> -            diskstat->has_ios_pgr =3D true;
> -            diskstat->ios_pgr =3D ios_pgr;
> -            diskstat->has_total_ticks =3D true;
> -            diskstat->total_ticks =3D tot_ticks;
> -            diskstat->has_weight_ticks =3D true;
> -            diskstat->weight_ticks =3D rq_ticks;
> -        }
> -        if (i >=3D 18) {
> -            diskstat->has_discard_ios =3D true;
> -            diskstat->discard_ios =3D dc_ios;
> -            diskstat->has_discard_merges =3D true;
> -            diskstat->discard_merges =3D dc_merges;
> -            diskstat->has_discard_sectors =3D true;
> -            diskstat->discard_sectors =3D dc_sec;
> -            diskstat->has_discard_ticks =3D true;
> -            diskstat->discard_ticks =3D dc_ticks;
> -        }
> -        if (i >=3D 20) {
> -            diskstat->has_flush_ios =3D true;
> -            diskstat->flush_ios =3D fl_ios;
> -            diskstat->has_flush_ticks =3D true;
> -            diskstat->flush_ticks =3D fl_ticks;
> -        }
> -
> -        diskstatinfo->stats =3D g_steal_pointer(&diskstat);
> -        QAPI_LIST_APPEND(tail, diskstatinfo);
> -        diskstatinfo =3D NULL;
> -    }
> -    free(line);
> -    fclose(fp);
> -    return head;
> -#else
> -    g_debug("disk stats reporting available only for Linux");
> -    return NULL;
> -#endif
> -}
> -
> -GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> -{
> -    return guest_get_diskstats(errp);
> -}
> -
> -GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> -{
> -    GuestCpuStatsList *head =3D NULL, **tail =3D &head;
> -    const char *cpustats =3D "/proc/stat";
> -    int clk_tck =3D sysconf(_SC_CLK_TCK);
> -    FILE *fp;
> -    size_t n;
> -    char *line =3D NULL;
> -
> -    fp =3D fopen(cpustats, "r");
> -    if (fp  =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> -        return NULL;
> -    }
> -
> -    while (getline(&line, &n, fp) !=3D -1) {
> -        GuestCpuStats *cpustat =3D NULL;
> -        GuestLinuxCpuStats *linuxcpustat;
> -        int i;
> -        unsigned long user, system, idle, iowait, irq, softirq, steal,
> guest;
> -        unsigned long nice, guest_nice;
> -        char name[64];
> -
> -        i =3D sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",
> -                   name, &user, &nice, &system, &idle, &iowait, &irq,
> &softirq,
> -                   &steal, &guest, &guest_nice);
> -
> -        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
> -        if ((i =3D=3D EOF) || strncmp(name, "cpu", 3) || (name[3] =3D=3D=
 '\0')) {
> -            continue;
> -        }
> -
> -        if (i < 5) {
> -            slog("Parsing cpu stat from %s failed, see \"man proc\"",
> cpustats);
> -            break;
> -        }
> -
> -        cpustat =3D g_new0(GuestCpuStats, 1);
> -        cpustat->type =3D GUEST_CPU_STATS_TYPE_LINUX;
> -
> -        linuxcpustat =3D &cpustat->u.q_linux;
> -        linuxcpustat->cpu =3D atoi(&name[3]);
> -        linuxcpustat->user =3D user * 1000 / clk_tck;
> -        linuxcpustat->nice =3D nice * 1000 / clk_tck;
> -        linuxcpustat->system =3D system * 1000 / clk_tck;
> -        linuxcpustat->idle =3D idle * 1000 / clk_tck;
> -
> -        if (i > 5) {
> -            linuxcpustat->has_iowait =3D true;
> -            linuxcpustat->iowait =3D iowait * 1000 / clk_tck;
> -        }
> -
> -        if (i > 6) {
> -            linuxcpustat->has_irq =3D true;
> -            linuxcpustat->irq =3D irq * 1000 / clk_tck;
> -            linuxcpustat->has_softirq =3D true;
> -            linuxcpustat->softirq =3D softirq * 1000 / clk_tck;
> -        }
> -
> -        if (i > 8) {
> -            linuxcpustat->has_steal =3D true;
> -            linuxcpustat->steal =3D steal * 1000 / clk_tck;
> -        }
> -
> -        if (i > 9) {
> -            linuxcpustat->has_guest =3D true;
> -            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> -        }
> -
> -        if (i > 10) {
> -            linuxcpustat->has_guest =3D true;
> -            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> -            linuxcpustat->has_guestnice =3D true;
> -            linuxcpustat->guestnice =3D guest_nice * 1000 / clk_tck;
> -        }
> -
> -        QAPI_LIST_APPEND(tail, cpustat);
> -    }
> -
> -    free(line);
> -    fclose(fp);
> -    return head;
> -}
> -
> -#else /* defined(__linux__) */
> +#if !defined(__linux__)
>
>  void qmp_guest_suspend_disk(Error **errp)
>  {
> diff --git a/qga/meson.build b/qga/meson.build
> index 65c1e93846..409f49a000 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
>    'commands-posix.c',
>    'commands-posix-ssh.c',
>  ))
> +qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
> +  'commands-linux.c',
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

--00000000000093e49b05e9538fe8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 4:33 PM Ale=
xander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexand=
er.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">In the next patches we are going to add FreeBSD supp=
ort for QEMU Guest<br>
Agent. In the result, code in commands-posix.c will be too cumbersome.<br>
Move Linux-specific code to a separate file keeping common POSIX code in<br=
>
commands-posix.c.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>lgtm, but moving 2000 lines in one patch is a =
bit hard to review.. Maybe you can split this patch for the various moved c=
ommands? Although if enough maintainers ack this patch, it&#39;s fine for m=
e.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
---<br>
=C2=A0qga/commands-common.h |=C2=A0 =C2=A034 +<br>
=C2=A0qga/commands-linux.c=C2=A0 | 2242 +++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/commands-posix.c=C2=A0 | 2558 +++--------------------------------=
------<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
=C2=A04 files changed, 2447 insertions(+), 2390 deletions(-)<br>
=C2=A0create mode 100644 qga/commands-linux.c<br>
<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index d0e4a9696f..aa0472ea4c 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -29,4 +29,38 @@ GuestFileRead *guest_file_read_unsafe(GuestFileHandle *g=
fh,<br>
=C2=A0 */<br>
=C2=A0char *qga_get_host_name(Error **errp);<br>
<br>
+void ga_wait_child(pid_t pid, int *status, Error **errp);<br>
+<br>
+#if defined(__linux__)<br>
+#include &lt;linux/fs.h&gt;<br>
+#ifdef FIFREEZE<br>
+#define CONFIG_FSFREEZE<br>
=C2=A0#endif<br>
+#ifdef FITRIM<br>
+#define CONFIG_FSTRIM<br>
+#endif<br>
+#endif /* __linux__*/<br>
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
+bool build_fs_mount_list(FsMountList *mounts, Error **errp);<br>
+void free_fs_mount_list(FsMountList *mounts);<br>
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
rror **errp);<br>
+int qmp_guest_fsfreeze_do_thaw(Error **errp);<br>
+#endif<br>
+<br>
+#endif /* QGA_COMMANDS_COMMON_H */<br>
diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
new file mode 100644<br>
index 0000000000..615e9a0027<br>
--- /dev/null<br>
+++ b/qga/commands-linux.c<br>
@@ -0,0 +1,2242 @@<br>
+/*<br>
+ * QEMU Guest Agent Linux-specific command implementations<br>
+ *<br>
+ * Copyright IBM Corp. 2011<br>
+ *<br>
+ * Authors:<br>
+ *=C2=A0 Michael Roth=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:mdroth@lin=
ux.vnet.ibm.com" target=3D"_blank">mdroth@linux.vnet.ibm.com</a>&gt;<br>
+ *=C2=A0 Michal Privoznik=C2=A0 &lt;<a href=3D"mailto:mprivozn@redhat.com"=
 target=3D"_blank">mprivozn@redhat.com</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;sys/ioctl.h&gt;<br>
+#include &quot;guest-agent-core.h&quot;<br>
+#include &quot;qga-qapi-commands.h&quot;<br>
+#include &quot;qapi/qmp/qerror.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/queue.h&quot;<br>
+#include &quot;qemu/base64.h&quot;<br>
+#include &quot;commands-common.h&quot;<br>
+#include &quot;block/nvme.h&quot;<br>
+#include &quot;cutils.h&quot;<br>
+<br>
+#include &lt;mntent.h&gt;<br>
+#include &lt;sys/statvfs.h&gt;<br>
+#include &lt;linux/nvme_ioctl.h&gt;<br>
+<br>
+#ifdef CONFIG_LIBUDEV<br>
+#include &lt;libudev.h&gt;<br>
+#endif<br>
+<br>
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
+static int dev_major_minor(const char *devpath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *devmajor, unsigned int *devminor)<br>
+{<br>
+=C2=A0 =C2=A0 struct stat st;<br>
+<br>
+=C2=A0 =C2=A0 *devmajor =3D 0;<br>
+=C2=A0 =C2=A0 *devminor =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (stat(devpath, &amp;st) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;failed to stat device file &#39;%s&=
#39;: %s&quot;, devpath, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (S_ISDIR(st.st_mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* It is bind mount */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -2;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (S_ISBLK(st.st_mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devmajor =3D major(st.st_rdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devminor =3D minor(st.st_rdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+/*<br>
+ * Walk the mount table and build a list of local file systems<br>
+ */<br>
+static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **err=
p)<br>
+{<br>
+=C2=A0 =C2=A0 struct mntent *ment;<br>
+=C2=A0 =C2=A0 FsMount *mount;<br>
+=C2=A0 =C2=A0 char const *mtab =3D &quot;/proc/self/mounts&quot;;<br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D setmntent(mtab, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (!fp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to open mtab fil=
e: &#39;%s&#39;&quot;, mtab);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while ((ment =3D getmntent(fp))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* An entry which device name doesn&#39;t=
 start with a &#39;/&#39; is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* either a dummy file system or a networ=
k file system.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add special handling for smbfs and cif=
s as is done by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* coreutils as well.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ment-&gt;mnt_fsname[0] !=3D &#39;/&#39;) =
||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt_type, &quot=
;smbfs&quot;) =3D=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt_type, &quot=
;cifs&quot;) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_major_minor(ment-&gt;mnt_fsname, &amp;=
devmajor, &amp;devminor) =3D=3D -2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip bind mounts */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(ment-&gt;mnt_di=
r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(ment-&gt;mnt_ty=
pe);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name[i] !=3D &#39;\\&#39;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] =3D=3D &#39;\\&#39;) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D &#39;\\&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] &gt;=3D &#39;0&#39; &am=
p;&amp; name[i + 1] &lt;=3D &#39;3&#39; &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name[=
i + 2] &gt;=3D &#39;0&#39; &amp;&amp; name[i + 2] &lt;=3D &#39;7&#39; &amp;=
&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name[=
i + 3] &gt;=3D &#39;0&#39; &amp;&amp; name[i + 3] &lt;=3D &#39;7&#39;) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D (name[i + 1] - &#3=
9;0&#39;) * 64 +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (name[i + 2] - &#39;0&#39;) * 8 +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (name[i + 3] - &#39;0&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 FsMount *mount;<br>
+=C2=A0 =C2=A0 char const *mountinfo =3D &quot;/proc/self/mountinfo&quot;;<=
br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 char *line =3D NULL, *dash;<br>
+=C2=A0 =C2=A0 size_t n;<br>
+=C2=A0 =C2=A0 char check;<br>
+=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
+=C2=A0 =C2=A0 int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D fopen(mountinfo, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (!fp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return build_fs_mount_list_from_mtab(mounts, e=
rrp);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(line, &quot;%*u %*u %u:%u %*s %=
n%*s%n%c&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;devmajor, &amp;devminor, &amp;dir_s, &amp;dir_e, &amp;check);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash =3D strstr(line + dir_e, &quot; - &quot;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dash) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(dash, &quot; - %n%*s%n %n%*s%n%=
c&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;type_s, &amp;type_e, &amp;dev_s, &amp;dev_e, &amp;check);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 line[dir_e] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[type_e] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[dev_e] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(line + dir_s, dir_e - dir_s);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(dash + dev_s, dev_e - dev_s);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devmajor =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* btrfs reports major number =
=3D 0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(&quot;btrfs&quot;, da=
sh + type_s) !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_major_minor(da=
sh + dev_s, &amp;devmajor, &amp;devminor) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(line + dir_s);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(dash + type_s);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 free(line);<br>
+<br>
+=C2=A0 =C2=A0 fclose(fp);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+#endif<br>
+<br>
+#if defined(CONFIG_FSFREEZE)<br>
+<br>
+static char *get_pci_driver(char const *syspath, int pathlen, Error **errp=
)<br>
+{<br>
+=C2=A0 =C2=A0 char *path;<br>
+=C2=A0 =C2=A0 char *dpath;<br>
+=C2=A0 =C2=A0 char *driver =3D NULL;<br>
+=C2=A0 =C2=A0 char buf[PATH_MAX];<br>
+=C2=A0 =C2=A0 ssize_t len;<br>
+<br>
+=C2=A0 =C2=A0 path =3D g_strndup(syspath, pathlen);<br>
+=C2=A0 =C2=A0 dpath =3D g_strdup_printf(&quot;%s/driver&quot;, path);<br>
+=C2=A0 =C2=A0 len =3D readlink(dpath, buf, sizeof(buf) - 1);<br>
+=C2=A0 =C2=A0 if (len !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[len] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver =3D g_path_get_basename(buf);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(dpath);<br>
+=C2=A0 =C2=A0 g_free(path);<br>
+=C2=A0 =C2=A0 return driver;<br>
+}<br>
+<br>
+static int compare_uint(const void *_a, const void *_b)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int a =3D *(unsigned int *)_a;<br>
+=C2=A0 =C2=A0 unsigned int b =3D *(unsigned int *)_b;<br>
+<br>
+=C2=A0 =C2=A0 return a &lt; b ? -1 : a &gt; b ? 1 : 0;<br>
+}<br>
+<br>
+/* Walk the specified sysfs and build a sorted list of host or ata numbers=
 */<br>
+static int build_hosts(char const *syspath, char const *host, bool ata,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned int *hosts, int hosts_max, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 char *path;<br>
+=C2=A0 =C2=A0 DIR *dir;<br>
+=C2=A0 =C2=A0 struct dirent *entry;<br>
+=C2=A0 =C2=A0 int i =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 path =3D g_strndup(syspath, host - syspath);<br>
+=C2=A0 =C2=A0 dir =3D opendir(path);<br>
+=C2=A0 =C2=A0 if (!dir) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;opendir(\&=
quot;%s\&quot;)&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (i &lt; hosts_max) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D readdir(dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ata &amp;&amp; sscanf(entry-&gt;d_name, &q=
uot;ata%d&quot;, hosts + i) =3D=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!ata &amp;&amp; sscanf(entry-&gt;d_=
name, &quot;host%d&quot;, hosts + i) =3D=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qsort(hosts, i, sizeof(hosts[0]), compare_uint);<br>
+<br>
+=C2=A0 =C2=A0 g_free(path);<br>
+=C2=A0 =C2=A0 closedir(dir);<br>
+=C2=A0 =C2=A0 return i;<br>
+}<br>
+<br>
+/*<br>
+ * Store disk device info for devices on the PCI bus.<br>
+ * Returns true if information has been stored, or false for failure.<br>
+ */<br>
+static bool build_guest_fsinfo_for_pci_dev(char const *syspath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GuestDiskAddress *disk,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int pci[4], host, hosts[8], tgt[3];<br>
+=C2=A0 =C2=A0 int i, nhosts =3D 0, pcilen;<br>
+=C2=A0 =C2=A0 GuestPCIAddress *pciaddr =3D disk-&gt;pci_controller;<br>
+=C2=A0 =C2=A0 bool has_ata =3D false, has_host =3D false, has_tgt =3D fals=
e;<br>
+=C2=A0 =C2=A0 char *p, *q, *driver =3D NULL;<br>
+=C2=A0 =C2=A0 bool ret =3D false;<br>
+<br>
+=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/devices/pci&quot;);<br>
+=C2=A0 =C2=A0 if (!p || sscanf(p + 12, &quot;%*x:%*x/%x:%x:%x.%x%n&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci, pci + 1, pci + 2, pci + 3, &amp;pcilen) &lt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;only pci device is supported: sy=
sfs path &#39;%s&#39;&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 p +=3D 12 + pcilen;<br>
+=C2=A0 =C2=A0 while (true) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver =3D get_pci_driver(syspath, p - syspath=
, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (driver &amp;&amp; (g_str_equal(driver, &qu=
ot;ata_piix&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;sym53c8xx&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;virtio-pci&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;ahci&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;nvme&quot;))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(p, &quot;/%x:%x:%x.%x%n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pci, pci + 1, pci + 2, pci + 3, &amp;pcilen) =3D=3D 4) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p +=3D pcilen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;unsupported driver or sysfs path=
 &#39;%s&#39;&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/target&quot;);<br>
+=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(p + 7, &quot;%*u:%*u:%*u/%*u:%u:%u:%=
u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt,=
 tgt + 1, tgt + 2) =3D=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_tgt =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/ata&quot;);<br>
+=C2=A0 =C2=A0 if (p) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_ata =3D true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/host&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 5;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(q, &quot;%u&quot;, &amp;host) =3D=3D=
 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_host =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nhosts =3D build_hosts(syspath, p, has_ata, ho=
sts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(hosts), errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nhosts &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pciaddr-&gt;domain =3D pci[0];<br>
+=C2=A0 =C2=A0 pciaddr-&gt;bus =3D pci[1];<br>
+=C2=A0 =C2=A0 pciaddr-&gt;slot =3D pci[2];<br>
+=C2=A0 =C2=A0 pciaddr-&gt;function =3D pci[3];<br>
+<br>
+=C2=A0 =C2=A0 if (strcmp(driver, &quot;ata_piix&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a host per ide bus, target*:0:&lt;unit&gt;:=
0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_host || !has_tgt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;invalid sysfs path=
 &#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nhosts; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host =3D=3D hosts[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =
=3D GUEST_DISK_BUS_TYPE_IDE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus =3D i=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D =
tgt[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D nhosts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;no host for &#39;%=
s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;sym53c8xx&quot;) =3D=3D 0) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* scsi(LSI Logic): target*:0:&lt;unit&gt;:0 *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_tgt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;invalid sysfs path=
 &#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_SCSI=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D tgt[1];<br>
+=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;virtio-pci&quot;) =3D=3D 0) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_tgt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-scsi: target*:0:0:&lt;=
unit&gt; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK=
_BUS_TYPE_SCSI;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D tgt[2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-blk: 1 disk per 1 devi=
ce */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK=
_BUS_TYPE_VIRTIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;ahci&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ahci: 1 host per 1 unit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_host || !has_tgt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;invalid sysfs path=
 &#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nhosts; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host =3D=3D hosts[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D =
i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =
=3D GUEST_DISK_BUS_TYPE_SATA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D nhosts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;no host for &#39;%=
s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;nvme&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_NVME=
;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;unknown driver &#39;%s&#39; (sys=
fs path &#39;%s&#39;)&quot;, driver, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D true;<br>
+<br>
+cleanup:<br>
+=C2=A0 =C2=A0 g_free(driver);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+/*<br>
+ * Store disk device info for non-PCI virtio devices (for example s390x<br=
>
+ * channel I/O devices). Returns true if information has been stored, or<b=
r>
+ * false for failure.<br>
+ */<br>
+static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GuestDiskAddress *disk,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int tgt[3];<br>
+=C2=A0 =C2=A0 char *p;<br>
+<br>
+=C2=A0 =C2=A0 if (!strstr(syspath, &quot;/virtio&quot;) || !strstr(syspath=
, &quot;/block&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Unsupported virtio device &#39;%=
s&#39;&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/target&quot;);<br>
+=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(p + 7, &quot;%*u:%*u:%*u/%*u:%u:%u:%=
u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;tgt[0], &amp;tgt[1], &amp;tgt[2]) =3D=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-scsi: target*:0:&lt;target&gt;:&lt;u=
nit&gt; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_SCSI=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus =3D tgt[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;target =3D tgt[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D tgt[2];<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-blk: 1 disk per 1 device */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_VIRT=
IO;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+/*<br>
+ * Store disk device info for CCW devices (s390x channel I/O devices).<br>
+ * Returns true if information has been stored, or false for failure.<br>
+ */<br>
+static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GuestDiskAddress *disk,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int cssid, ssid, subchno, devno;<br>
+=C2=A0 =C2=A0 char *p;<br>
+<br>
+=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/devices/css&quot;);<br>
+=C2=A0 =C2=A0 if (!p || sscanf(p + 12, &quot;%*x/%x.%x.%x/%*x.%*x.%x/&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;cssid, &amp;ssid, &amp;subchno, &amp;devno) &lt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;could not parse ccw device sysfs=
 path: %s&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 disk-&gt;has_ccw_address =3D true;<br>
+=C2=A0 =C2=A0 disk-&gt;ccw_address =3D g_new0(GuestCCWAddress, 1);<br>
+=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;cssid =3D cssid;<br>
+=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;ssid =3D ssid;<br>
+=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;subchno =3D subchno;<br>
+=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;devno =3D devno;<br>
+<br>
+=C2=A0 =C2=A0 if (strstr(p, &quot;/virtio&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_nonpci_virtio(syspath, =
disk, errp);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+/* Store disk device info specified by @sysfs into @fs */<br>
+static void build_guest_fsinfo_for_real_device(char const *syspath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GuestFilesystemInfo *fs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestDiskAddress *disk;<br>
+=C2=A0 =C2=A0 GuestPCIAddress *pciaddr;<br>
+=C2=A0 =C2=A0 bool has_hwinf;<br>
+#ifdef CONFIG_LIBUDEV<br>
+=C2=A0 =C2=A0 struct udev *udev =3D NULL;<br>
+=C2=A0 =C2=A0 struct udev_device *udevice =3D NULL;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 pciaddr =3D g_new0(GuestPCIAddress, 1);<br>
+=C2=A0 =C2=A0 pciaddr-&gt;domain =3D -1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* -1 means field is inval=
id */<br>
+=C2=A0 =C2=A0 pciaddr-&gt;bus =3D -1;<br>
+=C2=A0 =C2=A0 pciaddr-&gt;slot =3D -1;<br>
+=C2=A0 =C2=A0 pciaddr-&gt;function =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 disk =3D g_new0(GuestDiskAddress, 1);<br>
+=C2=A0 =C2=A0 disk-&gt;pci_controller =3D pciaddr;<br>
+=C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_UNKNOWN;<br>
+<br>
+#ifdef CONFIG_LIBUDEV<br>
+=C2=A0 =C2=A0 udev =3D udev_new();<br>
+=C2=A0 =C2=A0 udevice =3D udev_device_new_from_syspath(udev, syspath);<br>
+=C2=A0 =C2=A0 if (udev =3D=3D NULL || udevice =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev&quot;);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devnode, *serial;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 devnode =3D udev_device_get_devnode(udevice);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devnode !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;dev =3D g_strdup(devnod=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_dev =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 serial =3D udev_device_get_property_value(udev=
ice, &quot;ID_SERIAL&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (serial !=3D NULL &amp;&amp; *serial !=3D 0=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;serial =3D g_strdup(ser=
ial);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_serial =3D true;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 udev_unref(udev);<br>
+=C2=A0 =C2=A0 udev_device_unref(udevice);<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 if (strstr(syspath, &quot;/devices/pci&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D build_guest_fsinfo_for_pci_dev(s=
yspath, disk, errp);<br>
+=C2=A0 =C2=A0 } else if (strstr(syspath, &quot;/devices/css&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D build_guest_fsinfo_for_ccw_dev(s=
yspath, disk, errp);<br>
+=C2=A0 =C2=A0 } else if (strstr(syspath, &quot;/virtio&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D build_guest_fsinfo_for_nonpci_vi=
rtio(syspath, disk, errp);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Unsupported device type for &#39=
;%s&#39;&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (has_hwinf || disk-&gt;has_dev || disk-&gt;has_serial) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(fs-&gt;disk, disk);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_GuestDiskAddress(disk);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void build_guest_fsinfo_for_device(char const *devpath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
uestFilesystemInfo *fs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
rror **errp);<br>
+<br>
+/* Store a list of slave devices of virtual volume specified by @syspath i=
nto<br>
+ * @fs */<br>
+static void build_guest_fsinfo_for_virtual_device(char const *syspath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestFilesystemInfo *fs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
+=C2=A0 =C2=A0 DIR *dir;<br>
+=C2=A0 =C2=A0 char *dirpath;<br>
+=C2=A0 =C2=A0 struct dirent *entry;<br>
+<br>
+=C2=A0 =C2=A0 dirpath =3D g_strdup_printf(&quot;%s/slaves&quot;, syspath);=
<br>
+=C2=A0 =C2=A0 dir =3D opendir(dirpath);<br>
+=C2=A0 =C2=A0 if (!dir) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;opendir(\&quot;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (;;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D readdir(dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (entry =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;readdir(\&quot;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (entry-&gt;d_type =3D=3D DT_LNK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot; slave device &#39=
;%s&#39;&quot;, entry-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D g_strdup_printf(&quot;%=
s/slaves/%s&quot;, syspath, entry-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_device(pa=
th, fs, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(dirpath);<br>
+=C2=A0 =C2=A0 closedir(dir);<br>
+}<br>
+<br>
+static bool is_disk_virtual(const char *devpath, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree char *syspath =3D realpath(devpath, NULL);<br>
+<br>
+=C2=A0 =C2=A0 if (!syspath) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;realpath(\=
&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return strstr(syspath, &quot;/devices/virtual/block/&quot;) =
!=3D NULL;<br>
+}<br>
+<br>
+/* Dispatch to functions for virtual/real device */<br>
+static void build_guest_fsinfo_for_device(char const *devpath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
uestFilesystemInfo *fs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
rror **errp)<br>
+{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
+=C2=A0 =C2=A0 g_autofree char *syspath =3D NULL;<br>
+=C2=A0 =C2=A0 bool is_virtual =3D false;<br>
+<br>
+=C2=A0 =C2=A0 syspath =3D realpath(devpath, NULL);<br>
+=C2=A0 =C2=A0 if (!syspath) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;realpath(\&quot;%s\&quot;)&quot;, devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ENOENT: This devpath may not exist because =
of container config */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fs-&gt;name) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_path_get_basen=
ame(devpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!fs-&gt;name) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_path_get_basename(syspath);<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_debug(&quot;=C2=A0 parse sysfs path &#39;%s&#39;&quot;, sy=
spath);<br>
+=C2=A0 =C2=A0 is_virtual =3D is_disk_virtual(syspath, errp);<br>
+=C2=A0 =C2=A0 if (*errp !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (is_virtual) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_virtual_device(syspath,=
 fs, errp);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_real_device(syspath, fs=
, errp);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+#ifdef CONFIG_LIBUDEV<br>
+<br>
+/*<br>
+ * Wrapper around build_guest_fsinfo_for_device() for getting just<br>
+ * the disk address.<br>
+ */<br>
+static GuestDiskAddress *get_disk_address(const char *syspath, Error **err=
p)<br>
+{<br>
+=C2=A0 =C2=A0 g_autoptr(GuestFilesystemInfo) fs =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 fs =3D g_new0(GuestFilesystemInfo, 1);<br>
+=C2=A0 =C2=A0 build_guest_fsinfo_for_device(syspath, fs, errp);<br>
+=C2=A0 =C2=A0 if (fs-&gt;disk !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_steal_pointer(&amp;fs-&gt;disk-&gt;va=
lue);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+static char *get_alias_for_syspath(const char *syspath)<br>
+{<br>
+=C2=A0 =C2=A0 struct udev *udev =3D NULL;<br>
+=C2=A0 =C2=A0 struct udev_device *udevice =3D NULL;<br>
+=C2=A0 =C2=A0 char *ret =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 udev =3D udev_new();<br>
+=C2=A0 =C2=A0 if (udev =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 udevice =3D udev_device_new_from_syspath(udev, syspath);<br>
+=C2=A0 =C2=A0 if (udevice =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev for path: %=
s&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *alias =3D udev_device_get_property=
_value(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udevice, &quot;DM_NAME&quot;);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* NULL means there was an error and empt=
y string means there is no<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* alias. In case of no alias we return N=
ULL instead of empty string.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (alias =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query ud=
ev for device alias for: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (*alias !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D g_strdup(alias);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+out:<br>
+=C2=A0 =C2=A0 udev_unref(udev);<br>
+=C2=A0 =C2=A0 udev_device_unref(udevice);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static char *get_device_for_syspath(const char *syspath)<br>
+{<br>
+=C2=A0 =C2=A0 struct udev *udev =3D NULL;<br>
+=C2=A0 =C2=A0 struct udev_device *udevice =3D NULL;<br>
+=C2=A0 =C2=A0 char *ret =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 udev =3D udev_new();<br>
+=C2=A0 =C2=A0 if (udev =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 udevice =3D udev_device_new_from_syspath(udev, syspath);<br>
+=C2=A0 =C2=A0 if (udevice =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev for path: %=
s&quot;, syspath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D g_strdup(udev_device_get_devnode(udevi=
ce));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+out:<br>
+=C2=A0 =C2=A0 udev_unref(udev);<br>
+=C2=A0 =C2=A0 udev_device_unref(udevice);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree char *deps_dir =3D NULL;<br>
+=C2=A0 =C2=A0 const gchar *dep;<br>
+=C2=A0 =C2=A0 GDir *dp_deps =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 /* List dependent disks */<br>
+=C2=A0 =C2=A0 deps_dir =3D g_strdup_printf(&quot;%s/slaves&quot;, disk_dir=
);<br>
+=C2=A0 =C2=A0 g_debug(&quot;=C2=A0 listing entries in: %s&quot;, deps_dir)=
;<br>
+=C2=A0 =C2=A0 dp_deps =3D g_dir_open(deps_dir, 0, NULL);<br>
+=C2=A0 =C2=A0 if (dp_deps =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to list entries in %s&quo=
t;, deps_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 disk-&gt;has_dependencies =3D true;<br>
+=C2=A0 =C2=A0 while ((dep =3D g_dir_read_name(dp_deps)) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *dep_dir =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_name;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add dependent disks */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_dir =3D g_strdup_printf(&quot;%s/%s&quot;,=
 deps_dir, dep);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name =3D get_device_for_syspath(dep_dir);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_name !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 adding depe=
ndent device: %s&quot;, dev_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(disk-&gt;depen=
dencies, dev_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_dir_close(dp_deps);<br>
+}<br>
+<br>
+/*<br>
+ * Detect partitions subdirectory, name is &quot;&lt;disk_name&gt;&lt;numb=
er&gt;&quot; or<br>
+ * &quot;&lt;disk_name&gt;p&lt;number&gt;&quot;<br>
+ *<br>
+ * @disk_name -- last component of /sys path (e.g. sda)<br>
+ * @disk_dir -- sys path of the disk (e.g. /sys/block/sda)<br>
+ * @disk_dev -- device node of the disk (e.g. /dev/sda)<br>
+ */<br>
+static GuestDiskInfoList *get_disk_partitions(<br>
+=C2=A0 =C2=A0 GuestDiskInfoList *list,<br>
+=C2=A0 =C2=A0 const char *disk_name, const char *disk_dir,<br>
+=C2=A0 =C2=A0 const char *disk_dev)<br>
+{<br>
+=C2=A0 =C2=A0 GuestDiskInfoList *ret =3D list;<br>
+=C2=A0 =C2=A0 struct dirent *de_disk;<br>
+=C2=A0 =C2=A0 DIR *dp_disk =3D NULL;<br>
+=C2=A0 =C2=A0 size_t len =3D strlen(disk_name);<br>
+<br>
+=C2=A0 =C2=A0 dp_disk =3D opendir(disk_dir);<br>
+=C2=A0 =C2=A0 while ((de_disk =3D readdir(dp_disk)) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *partition_dir =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDiskInfo *partition;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(de_disk-&gt;d_type &amp; DT_DIR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(strncmp(disk_name, de_disk-&gt;d_name, l=
en) =3D=3D 0 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((*(de_disk-&gt;d_name + len) =
=3D=3D &#39;p&#39; &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isdigit(*(de_disk-&gt;d_name + l=
en + 1))) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isdigit(*(de_disk-=
&gt;d_name + len))))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition_dir =3D g_strdup_printf(&quot;%s/%s&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir, de_disk-&gt;d_name);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name =3D get_device_for_syspath(partition_=
dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_name =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get devi=
ce name for syspath: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition =3D g_new0(GuestDiskInfo, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;name =3D dev_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;partition =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;has_dependencies =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add parent disk as dependent for easier tra=
cking of hierarchy */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(partition-&gt;dependencies, =
g_strdup(disk_dev));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, partition);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 closedir(dp_disk);<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void get_nvme_smart(GuestDiskInfo *disk)<br>
+{<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 GuestNVMeSmart *smart;<br>
+=C2=A0 =C2=A0 NvmeSmartLog log =3D {0};<br>
+=C2=A0 =C2=A0 struct nvme_admin_cmd cmd =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .nsid =3D NVME_NSID_BROADCAST,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D (uintptr_t)&amp;log,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .data_len =3D sizeof(log),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cdw10 =3D NVME_LOG_SMART_INFO | (1 &lt;&lt; 1=
5) /* RAE bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| (((sizeof(=
log) &gt;&gt; 2) - 1) &lt;&lt; 16)<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 fd =3D qga_open_cloexec(disk-&gt;name, O_RDONLY, 0);<br>
+=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: %s&qu=
ot;, disk-&gt;name, g_strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &amp;cmd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get smart: %s: %s&quot=
;, disk-&gt;name, g_strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 disk-&gt;has_smart =3D true;<br>
+=C2=A0 =C2=A0 disk-&gt;smart =3D g_new0(GuestDiskSmart, 1);<br>
+=C2=A0 =C2=A0 disk-&gt;smart-&gt;type =3D GUEST_DISK_BUS_TYPE_NVME;<br>
+<br>
+=C2=A0 =C2=A0 smart =3D &amp;disk-&gt;smart-&gt;u.nvme;<br>
+=C2=A0 =C2=A0 smart-&gt;critical_warning =3D log.critical_warning;<br>
+=C2=A0 =C2=A0 smart-&gt;temperature =3D lduw_le_p(&amp;log.temperature); /=
* unaligned field */<br>
+=C2=A0 =C2=A0 smart-&gt;available_spare =3D log.available_spare;<br>
+=C2=A0 =C2=A0 smart-&gt;available_spare_threshold =3D log.available_spare_=
threshold;<br>
+=C2=A0 =C2=A0 smart-&gt;percentage_used =3D log.percentage_used;<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_read_lo =3D le64_to_cpu(log.data_units_=
read[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_read_hi =3D le64_to_cpu(log.data_units_=
read[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_written_lo =3D le64_to_cpu(log.data_uni=
ts_written[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_written_hi =3D le64_to_cpu(log.data_uni=
ts_written[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_read_commands_lo =3D le64_to_cpu(log.host_rea=
d_commands[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_read_commands_hi =3D le64_to_cpu(log.host_rea=
d_commands[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_write_commands_lo =3D le64_to_cpu(log.host_wr=
ite_commands[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_write_commands_hi =3D le64_to_cpu(log.host_wr=
ite_commands[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;controller_busy_time_lo =3D le64_to_cpu(log.contro=
ller_busy_time[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;controller_busy_time_hi =3D le64_to_cpu(log.contro=
ller_busy_time[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_cycles_lo =3D le64_to_cpu(log.power_cycles[0=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_cycles_hi =3D le64_to_cpu(log.power_cycles[1=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_on_hours_lo =3D le64_to_cpu(log.power_on_hou=
rs[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_on_hours_hi =3D le64_to_cpu(log.power_on_hou=
rs[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;unsafe_shutdowns_lo =3D le64_to_cpu(log.unsafe_shu=
tdowns[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;unsafe_shutdowns_hi =3D le64_to_cpu(log.unsafe_shu=
tdowns[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;media_errors_lo =3D le64_to_cpu(log.media_errors[0=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;media_errors_hi =3D le64_to_cpu(log.media_errors[1=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;number_of_error_log_entries_lo =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_log_entries[0]=
);<br>
+=C2=A0 =C2=A0 smart-&gt;number_of_error_log_entries_hi =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_log_entries[1]=
);<br>
+<br>
+=C2=A0 =C2=A0 close(fd);<br>
+}<br>
+<br>
+static void get_disk_smart(GuestDiskInfo *disk)<br>
+{<br>
+=C2=A0 =C2=A0 if (disk-&gt;has_address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (disk-&gt;address-&gt;bus_type =3D=
=3D GUEST_DISK_BUS_TYPE_NVME)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_nvme_smart(disk);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestDiskInfoList *ret =3D NULL;<br>
+=C2=A0 =C2=A0 GuestDiskInfo *disk;<br>
+=C2=A0 =C2=A0 DIR *dp =3D NULL;<br>
+=C2=A0 =C2=A0 struct dirent *de =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 g_debug(&quot;listing /sys/block directory&quot;);<br>
+=C2=A0 =C2=A0 dp =3D opendir(&quot;/sys/block&quot;);<br>
+=C2=A0 =C2=A0 if (dp =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;Can&#39;t =
open directory \&quot;/sys/block\&quot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 while ((de =3D readdir(dp)) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *disk_dir =3D NULL, *line =3D =
NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *size_path =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (de-&gt;d_type !=3D DT_LNK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 skipping en=
try: %s&quot;, de-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check size and skip zero-sized disks */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 checking disk size&quot;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_path =3D g_strdup_printf(&quot;/sys/block=
/%s/size&quot;, de-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_file_get_contents(size_path, &amp;line,=
 NULL, NULL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 failed to r=
ead disk size&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(line, &quot;0\n&quot;) =3D=3D 0)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 skipping ze=
ro-sized disk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 adding %s&quot;, de-&gt;d=
_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir =3D g_strdup_printf(&quot;/sys/block/=
%s&quot;, de-&gt;d_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name =3D get_device_for_syspath(disk_dir);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_name =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get devi=
ce name for syspath: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D g_new0(GuestDiskInfo, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;name =3D dev_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;partition =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;alias =3D get_alias_for_syspath(disk_=
dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_alias =3D (disk-&gt;alias !=3D NU=
LL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, disk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get address for non-virtual devices */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_virtual =3D is_disk_virtual(disk_dir, =
&amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 failed to c=
heck disk path, ignoring error: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_get_pretty(l=
ocal_err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_err =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t try to get the addr=
ess */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_virtual =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_virtual) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;address =3D get_disk_ad=
dress(disk_dir, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=
=A0 failed to get device info, ignoring error: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_get_pretty(local_err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_err =3D NULL=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (disk-&gt;address !=3D=
 NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_addre=
ss =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_disk_deps(disk_dir, disk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_disk_smart(disk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_disk_partitions(ret, de-&gt;d_name=
, disk_dir, dev_name);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 closedir(dp);<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+#else<br>
+<br>
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+#endif<br>
+<br>
+/* Return a list of the disk device(s)&#39; info which @mount lies on */<b=
r>
+static GuestFilesystemInfo *build_guest_fsinfo(struct FsMount *mount,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestFilesystemInfo *fs =3D g_malloc0(sizeof(*fs));<br>
+=C2=A0 =C2=A0 struct statvfs buf;<br>
+=C2=A0 =C2=A0 unsigned long used, nonroot_total, fr_size;<br>
+=C2=A0 =C2=A0 char *devpath =3D g_strdup_printf(&quot;/sys/dev/block/%u:%u=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor, mo=
unt-&gt;devminor);<br>
+<br>
+=C2=A0 =C2=A0 fs-&gt;mountpoint =3D g_strdup(mount-&gt;dirname);<br>
+=C2=A0 =C2=A0 fs-&gt;type =3D g_strdup(mount-&gt;devtype);<br>
+=C2=A0 =C2=A0 build_guest_fsinfo_for_device(devpath, fs, errp);<br>
+<br>
+=C2=A0 =C2=A0 if (statvfs(fs-&gt;mountpoint, &amp;buf) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fr_size =3D buf.f_frsize;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 used =3D buf.f_blocks - buf.f_bfree;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nonroot_total =3D used + buf.f_bavail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;used_bytes =3D used * fr_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;total_bytes =3D nonroot_total * fr_size=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;has_total_bytes =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;has_used_bytes =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(devpath);<br>
+<br>
+=C2=A0 =C2=A0 return fs;<br>
+}<br>
+<br>
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 FsMountList mounts;<br>
+=C2=A0 =C2=A0 struct FsMount *mount;<br>
+=C2=A0 =C2=A0 GuestFilesystemInfoList *ret =3D NULL;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
+=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local_err)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Building guest fsinfo for &#39;%=
s&#39;&quot;, mount-&gt;dirname);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, build_guest_fsinfo(moun=
t, &amp;local_err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_GuestFilesystemInfoLis=
t(ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+/*<br>
+ * Walk list of mounted file systems in the guest, and freeze the ones whi=
ch<br>
+ * are real local file systems.<br>
+ */<br>
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
+=C2=A0 =C2=A0 struct FsMount *mount;<br>
+=C2=A0 =C2=A0 strList *list;<br>
+=C2=A0 =C2=A0 int fd, ret, i =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* To issue fsfreeze in the reverse order of m=
ounts, check if the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mount is listed in the list here */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_mountpoints) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (list =3D mountpoints; list;=
 list =3D list-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(list-&g=
t;value, mount-&gt;dirname) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!list) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;failed to open %s&quot;, mount-&gt;dirname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we try to cull filesystems we know won&#39;=
t work in advance, but other<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implement fsfreeze=
 for less obvious reasons.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these will report EOPNOTSUPP. we simpl=
y ignore these when tallying<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the number of frozen filesystems.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if a filesystem is mounted more than o=
nce (aka bind mount) a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* consecutive attempt to freeze an alrea=
dy frozen filesystem will<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return EBUSY.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any other error means a failure to fre=
eze a filesystem we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* expect to be freezable, so return an e=
rror in those cases<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and return system to thawed state.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FIFREEZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EOPNOTSUPP &amp;&=
amp; errno !=3D EBUSY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;failed to freeze %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount-&gt;dirname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
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
+=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local_err)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we have no way of knowing whether a filesys=
tem was actually unfrozen<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as a result of a successful call to FI=
THAW, only that if an error<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was returned the filesystem was *not* =
unfrozen by that particular<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* call.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since multiple preceding FIFREEZEs req=
uire multiple calls to FITHAW<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to unfreeze, continuing issuing FITHAW=
 until an error is returned,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in which case either the filesystem is=
 in an unfreezable state, or,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* more likely, it was thawed previously =
(and remains so afterward).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* also, since the most recent successful=
 call is the one that did<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the actual unfreeze, we can use this t=
o provide an accurate count<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the number of filesystems unfrozen =
by guest-fsfreeze-thaw, which<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may * be useful for determining whethe=
r a filesystem was unfrozen<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* during the freeze/thaw phase by a proc=
ess other than qemu-ga.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FITHAW);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0 &amp;&amp; !log=
ged) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D true;<b=
r>
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
+<br>
+#if defined(CONFIG_FSTRIM)<br>
+/*<br>
+ * Walk list of mounted file systems in the guest, and trim them.<br>
+ */<br>
+GuestFilesystemTrimResponse *<br>
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResponse *response;<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResult *result;<br>
+=C2=A0 =C2=A0 int ret =3D 0;<br>
+=C2=A0 =C2=A0 FsMountList mounts;<br>
+=C2=A0 =C2=A0 struct FsMount *mount;<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 struct fstrim_range r;<br>
+<br>
+=C2=A0 =C2=A0 slog(&quot;guest-fstrim called&quot;);<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
+=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 response =3D g_malloc0(sizeof(*response));<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;path =3D g_strdup(mount-&gt;dirname=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(response-&gt;paths, result);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup_pr=
intf(&quot;failed to open: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We try to cull filesystems we know won&#39;=
t work in advance, but other<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implement fstrim f=
or less obvious reasons.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* These will report EOPNOTSUPP; while in=
 some other cases ENOTTY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will be reported (e.g. CD-ROMs).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Any other error means an unexpected er=
ror.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.start =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.len =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.minlen =3D has_minimum ? minimum : 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FITRIM, &amp;r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOTTY || errno=
 =3D=3D EOPNOTSUPP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup(&quot;trim not supported&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup_printf(&quot;failed to trim: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_minimum =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;minimum =3D r.minlen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_trimmed =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;trimmed =3D r.len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
+=C2=A0 =C2=A0 return response;<br>
+}<br>
+#endif /* CONFIG_FSTRIM */<br>
+<br>
+<br>
+#define LINUX_SYS_STATE_FILE &quot;/sys/power/state&quot;<br>
+#define SUSPEND_SUPPORTED 0<br>
+#define SUSPEND_NOT_SUPPORTED 1<br>
+<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 SUSPEND_MODE_DISK =3D 0,<br>
+=C2=A0 =C2=A0 SUSPEND_MODE_RAM =3D 1,<br>
+=C2=A0 =C2=A0 SUSPEND_MODE_HYBRID =3D 2,<br>
+} SuspendMode;<br>
+<br>
+/*<br>
+ * Executes a command in a child process using g_spawn_sync,<br>
+ * returning an int &gt;=3D 0 representing the exit status of the<br>
+ * process.<br>
+ *<br>
+ * If the program wasn&#39;t found in path, returns -1.<br>
+ *<br>
+ * If a problem happened when creating the child process,<br>
+ * returns -1 and errp is set.<br>
+ */<br>
+static int run_process_child(const char *command[], Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int exit_status, spawn_flag;<br>
+=C2=A0 =C2=A0 GError *g_err =3D NULL;<br>
+=C2=A0 =C2=A0 bool success;<br>
+<br>
+=C2=A0 =C2=A0 spawn_flag =3D G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_N=
ULL |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_SPAWN_STDE=
RR_TO_DEV_NULL;<br>
+<br>
+=C2=A0 =C2=A0 success =3D=C2=A0 g_spawn_sync(NULL, (char **)command, NULL,=
 spawn_flag,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, NULL, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;exit_status, &amp;g_err);<br>
+<br>
+=C2=A0 =C2=A0 if (success) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return WEXITSTATUS(exit_status);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (g_err &amp;&amp; (g_err-&gt;code !=3D G_SPAWN_ERROR_NOEN=
T)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to create child =
process, error &#39;%s&#39;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_err=
-&gt;message);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_error_free(g_err);<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+static bool systemd_supports_mode(SuspendMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 const char *systemctl_args[3] =3D {&quot;systemd-hibernate&q=
uot;, &quot;systemd-suspend&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;systemd-hy=
brid-sleep&quot;};<br>
+=C2=A0 =C2=A0 const char *cmd[4] =3D {&quot;systemctl&quot;, &quot;status&=
quot;, systemctl_args[mode], NULL};<br>
+=C2=A0 =C2=A0 int status;<br>
+<br>
+=C2=A0 =C2=A0 status =3D run_process_child(cmd, errp);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* systemctl status uses LSB return codes so we can exp=
ect<br>
+=C2=A0 =C2=A0 =C2=A0* status &gt; 0 and be ok. To assert if the guest has =
support<br>
+=C2=A0 =C2=A0 =C2=A0* for the selected suspend mode, status should be &lt;=
 4. 4 is<br>
+=C2=A0 =C2=A0 =C2=A0* the code for unknown service status, the return valu=
e when<br>
+=C2=A0 =C2=A0 =C2=A0* the service does not exist. A common value is status=
 =3D 3<br>
+=C2=A0 =C2=A0 =C2=A0* (program is not running).<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (status &gt; 0 &amp;&amp; status &lt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static void systemd_suspend(SuspendMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 const char *systemctl_args[3] =3D {&quot;hibernate&quot;, &q=
uot;suspend&quot;, &quot;hybrid-sleep&quot;};<br>
+=C2=A0 =C2=A0 const char *cmd[3] =3D {&quot;systemctl&quot;, systemctl_arg=
s[mode], NULL};<br>
+=C2=A0 =C2=A0 int status;<br>
+<br>
+=C2=A0 =C2=A0 status =3D run_process_child(cmd, &amp;local_err);<br>
+<br>
+=C2=A0 =C2=A0 if (status =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((status =3D=3D -1) &amp;&amp; !local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;the helper program &#39=
;systemctl %s&#39; was not found&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syste=
mctl_args[mode]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;the helper program &#39=
;systemctl %s&#39; returned an &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;unexpected exit status code (%d)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syste=
mctl_args[mode], status);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool pmutils_supports_mode(SuspendMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 const char *pmutils_args[3] =3D {&quot;--hibernate&quot;, &q=
uot;--suspend&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--suspend-hybrid&=
quot;};<br>
+=C2=A0 =C2=A0 const char *cmd[3] =3D {&quot;pm-is-supported&quot;, pmutils=
_args[mode], NULL};<br>
+=C2=A0 =C2=A0 int status;<br>
+<br>
+=C2=A0 =C2=A0 status =3D run_process_child(cmd, &amp;local_err);<br>
+<br>
+=C2=A0 =C2=A0 if (status =3D=3D SUSPEND_SUPPORTED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((status =3D=3D -1) &amp;&amp; !local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;the helper program &#39;%s&#39; returned an unexpected exit&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
; status code (%d)&quot;, &quot;pm-is-supported&quot;, status);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static void pmutils_suspend(SuspendMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 const char *pmutils_binaries[3] =3D {&quot;pm-hibernate&quot=
;, &quot;pm-suspend&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pm-=
suspend-hybrid&quot;};<br>
+=C2=A0 =C2=A0 const char *cmd[2] =3D {pmutils_binaries[mode], NULL};<br>
+=C2=A0 =C2=A0 int status;<br>
+<br>
+=C2=A0 =C2=A0 status =3D run_process_child(cmd, &amp;local_err);<br>
+<br>
+=C2=A0 =C2=A0 if (status =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((status =3D=3D -1) &amp;&amp; !local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;the helper program &#39=
;%s&#39; was not found&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmuti=
ls_binaries[mode]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;the helper program &#39;%s&#39; returned an unexpected exit&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
; status code (%d)&quot;, pmutils_binaries[mode], status);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool linux_sys_state_supports_mode(SuspendMode mode, Error **errp)<=
br>
+{<br>
+=C2=A0 =C2=A0 const char *sysfile_strs[3] =3D {&quot;disk&quot;, &quot;mem=
&quot;, NULL};<br>
+=C2=A0 =C2=A0 const char *sysfile_str =3D sysfile_strs[mode];<br>
+=C2=A0 =C2=A0 char buf[32]; /* hopefully big enough */<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 ssize_t ret;<br>
+<br>
+=C2=A0 =C2=A0 if (!sysfile_str) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;unknown guest suspend m=
ode&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 fd =3D open(LINUX_SYS_STATE_FILE, O_RDONLY);<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D read(fd, buf, sizeof(buf) - 1);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 if (ret &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 buf[ret] =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 if (strstr(buf, sysfile_str)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static void linux_sys_state_suspend(SuspendMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 const char *sysfile_strs[3] =3D {&quot;disk&quot;, &quot;mem=
&quot;, NULL};<br>
+=C2=A0 =C2=A0 const char *sysfile_str =3D sysfile_strs[mode];<br>
+=C2=A0 =C2=A0 pid_t pid;<br>
+=C2=A0 =C2=A0 int status;<br>
+<br>
+=C2=A0 =C2=A0 if (!sysfile_str) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;unknown guest suspend m=
ode&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pid =3D fork();<br>
+=C2=A0 =C2=A0 if (!pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* child */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setsid();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open(LINUX_SYS_STATE_FILE, O_WRONLY);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (write(fd, sysfile_str, strlen(sysfile_str)=
) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_SUCCESS);<br>
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
+=C2=A0 =C2=A0 if (WEXITSTATUS(status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;child process has faile=
d to suspend&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+}<br>
+<br>
+static void guest_suspend(SuspendMode mode, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 bool mode_supported =3D false;<br>
+<br>
+=C2=A0 =C2=A0 if (systemd_supports_mode(mode, &amp;local_err)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_supported =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_suspend(mode, &amp;local_err);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 error_free(local_err);<br>
+=C2=A0 =C2=A0 local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if (pmutils_supports_mode(mode, &amp;local_err)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_supported =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmutils_suspend(mode, &amp;local_err);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 error_free(local_err);<br>
+=C2=A0 =C2=A0 local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if (linux_sys_state_supports_mode(mode, &amp;local_err)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_supported =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_sys_state_suspend(mode, &amp;local_err);=
<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!mode_supported) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;the requested suspend mode is not supported by the guest&quot;);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+void qmp_guest_suspend_disk(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 guest_suspend(SUSPEND_MODE_DISK, errp);<br>
+}<br>
+<br>
+void qmp_guest_suspend_ram(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 guest_suspend(SUSPEND_MODE_RAM, errp);<br>
+}<br>
+<br>
+void qmp_guest_suspend_hybrid(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 guest_suspend(SUSPEND_MODE_HYBRID, errp);<br>
+}<br>
+<br>
+/* Transfer online/offline status between @vcpu and the guest system.<br>
+ *<br>
+ * On input either @errp or *@errp must be NULL.<br>
+ *<br>
+ * In system-to-@vcpu direction, the following @vcpu fields are accessed:<=
br>
+ * - R: vcpu-&gt;logical_id<br>
+ * - W: vcpu-&gt;online<br>
+ * - W: vcpu-&gt;can_offline<br>
+ *<br>
+ * In @vcpu-to-system direction, the following @vcpu fields are accessed:<=
br>
+ * - R: vcpu-&gt;logical_id<br>
+ * - R: vcpu-&gt;online<br>
+ *<br>
+ * Written members remain unmodified on error.<br>
+ */<br>
+static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 char *dirpath, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 int res;<br>
+=C2=A0 =C2=A0 int dirfd;<br>
+=C2=A0 =C2=A0 static const char fn[] =3D &quot;online&quot;;<br>
+<br>
+=C2=A0 =C2=A0 dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
+=C2=A0 =C2=A0 if (dirfd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);<br>
+=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s/%s\&quot;)&quot;, dirpath, fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (sys2vcpu) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;online =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;can_offline =3D false;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!vcpu-&gt;online) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;logical p=
rocessor #%&quot; PRId64 &quot; can&#39;t be &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;offlined&quot;, vcpu-&gt;logical_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } /* otherwise pretend successful re-onlining =
*/<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char status;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D pread(fd, &amp;status, 1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;pread(\&quot;%s/%s\&quot;)&quot;, dirpath, fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (res =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;pread(\&q=
uot;%s/%s\&quot;): unexpected EOF&quot;, dirpath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (sys2vcpu) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;online =3D (status !=3D=
 &#39;0&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;can_offline =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (vcpu-&gt;online !=3D (status !=3D &=
#39;0&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &#39;0&#39; + vcpu-&g=
t;online;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pwrite(fd, &amp;status, 1, 0=
) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;pwrite(\&quot;%s/%s\&quot;)&quot;, dirpath,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } /* otherwise pretend successful re-(on|off)-=
lining */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(res =3D=3D 0);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 res =3D close(dirfd);<br>
+=C2=A0 =C2=A0 g_assert(res =3D=3D 0);<br>
+}<br>
+<br>
+GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestLogicalProcessorList *head, **tail;<br>
+=C2=A0 =C2=A0 const char *cpu_dir =3D &quot;/sys/devices/system/cpu&quot;;=
<br>
+=C2=A0 =C2=A0 const gchar *line;<br>
+=C2=A0 =C2=A0 g_autoptr(GDir) cpu_gdir =3D NULL;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 head =3D NULL;<br>
+=C2=A0 =C2=A0 tail =3D &amp;head;<br>
+=C2=A0 =C2=A0 cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);<br>
+<br>
+=C2=A0 =C2=A0 if (cpu_gdir =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
list entries: %s&quot;, cpu_dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; (line =3D g_dir_read=
_name(cpu_gdir)) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLogicalProcessor *vcpu;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(line, &quot;cpu%&quot; PRId64, &amp=
;id)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *path =3D g_strd=
up_printf(&quot;/sys/devices/system/cpu/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cpu%&quot; PRId64 &quot;/&quot;, i=
d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu =3D g_malloc0(sizeof *vcpu)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;logical_id =3D id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;has_can_offline =3D tru=
e; /* lolspeak ftw */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_vcpu(vcpu, true, path, =
&amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, vcpu);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (local_err =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* there&#39;s no guest with zero VCPUs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(head !=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return head;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qapi_free_GuestLogicalProcessorList(head);<br>
+=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp=
)<br>
+{<br>
+=C2=A0 =C2=A0 int64_t processed;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 processed =3D 0;<br>
+=C2=A0 =C2=A0 while (vcpus !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path =3D g_strdup_printf(&quot;/sys/devi=
ces/system/cpu/cpu%&quot; PRId64 &quot;/&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpus-&gt;value-=
&gt;logical_id);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_vcpu(vcpus-&gt;value, false, path, &a=
mp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++processed;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpus =3D vcpus-&gt;next;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (processed =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return processed;<br>
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
+=C2=A0 =C2=A0 chpasswddata =3D g_strdup_printf(&quot;%s:%s\n&quot;, userna=
me, rawpasswddata);<br>
+=C2=A0 =C2=A0 chpasswdlen =3D strlen(chpasswddata);<br>
+<br>
+=C2=A0 =C2=A0 passwd_path =3D g_find_program_in_path(&quot;chpasswd&quot;)=
;<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crypted) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;chpassw=
d&quot;, &quot;-e&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execl(passwd_path, &quot;chpassw=
d&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
+<br>
+static void ga_read_sysfs_file(int dirfd, const char *pathname, char *buf,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int size, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 int res;<br>
+<br>
+=C2=A0 =C2=A0 errno =3D 0;<br>
+=C2=A0 =C2=A0 fd =3D openat(dirfd, pathname, O_RDONLY);<br>
+=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open sysfs=
 file \&quot;%s\&quot;&quot;, pathname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 res =3D pread(fd, buf, size, 0);<br>
+=C2=A0 =C2=A0 if (res =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;pread sysf=
s file \&quot;%s\&quot;&quot;, pathname);<br>
+=C2=A0 =C2=A0 } else if (res =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;pread sysfs file \&quot=
;%s\&quot;: unexpected EOF&quot;, pathname);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 close(fd);<br>
+}<br>
+<br>
+static void ga_write_sysfs_file(int dirfd, const char *pathname,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf, int size, Error **e=
rrp)<br>
+{<br>
+=C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 errno =3D 0;<br>
+=C2=A0 =C2=A0 fd =3D openat(dirfd, pathname, O_WRONLY);<br>
+=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open sysfs=
 file \&quot;%s\&quot;&quot;, pathname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (pwrite(fd, buf, size, 0) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;pwrite sys=
fs file \&quot;%s\&quot;&quot;, pathname);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 close(fd);<br>
+}<br>
+<br>
+/* Transfer online/offline status between @mem_blk and the guest system.<b=
r>
+ *<br>
+ * On input either @errp or *@errp must be NULL.<br>
+ *<br>
+ * In system-to-@mem_blk direction, the following @mem_blk fields are acce=
ssed:<br>
+ * - R: mem_blk-&gt;phys_index<br>
+ * - W: mem_blk-&gt;online<br>
+ * - W: mem_blk-&gt;can_offline<br>
+ *<br>
+ * In @mem_blk-to-system direction, the following @mem_blk fields are acce=
ssed:<br>
+ * - R: mem_blk-&gt;phys_index<br>
+ * - R: mem_blk-&gt;online<br>
+ *-=C2=A0 R: mem_blk-&gt;can_offline<br>
+ * Written members remain unmodified on error.<br>
+ */<br>
+static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memb=
lk,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlockResponse *res=
ult,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 char *dirpath;<br>
+=C2=A0 =C2=A0 int dirfd;<br>
+=C2=A0 =C2=A0 char *status;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if (!sys2memblk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DIR *dp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!result) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Internal =
error, &#39;result&#39; should not be NULL&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dp =3D opendir(&quot;/sys/devices/system/memor=
y/&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if there is no &#39;memory&#39; directory i=
n sysfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we think this VM does not support onli=
ne/offline memory block,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any other solution?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 closedir(dp);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dirpath =3D g_strdup_printf(&quot;/sys/devices/system/memory=
/memory%&quot; PRId64 &quot;/&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;phys_index);<br>
+=C2=A0 =C2=A0 dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
+=C2=A0 =C2=A0 if (dirfd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys2memblk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(dirpath);<br>
+<br>
+=C2=A0 =C2=A0 status =3D g_malloc0(10);<br>
+=C2=A0 =C2=A0 ga_read_sysfs_file(dirfd, &quot;state&quot;, status, 10, &am=
p;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* treat with sysfs file that not exist in old=
 kernel */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys2memblk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;online=
 =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;can_of=
fline =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!mem_blk-&gt;online) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys2memblk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out2;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (sys2memblk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char removable =3D &#39;0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;online =3D (strncmp(status, &quot;=
online&quot;, 6) =3D=3D 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_read_sysfs_file(dirfd, &quot;removable&quot=
;, &amp;removable, 1, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if no &#39;removable&#39; fil=
e, it doesn&#39;t support offline mem blk */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;can_of=
fline =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;can_offline =3D (rem=
ovable !=3D &#39;0&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mem_blk-&gt;online !=3D (strncmp(status, &=
quot;online&quot;, 6) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *new_state =3D mem_bl=
k-&gt;online ? &quot;online&quot; : &quot;offline&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_write_sysfs_file(dirfd, &quot=
;state&quot;, new_state, strlen(new_state),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;response =3D GUEST_ME=
MORY_BLOCK_RESPONSE_TYPE_SUCCESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error_code =3D fa=
lse;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } /* otherwise pretend successful re-(on|off)-=
lining */<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(status);<br>
+=C2=A0 =C2=A0 close(dirfd);<br>
+=C2=A0 =C2=A0 return;<br>
+<br>
+out2:<br>
+=C2=A0 =C2=A0 g_free(status);<br>
+=C2=A0 =C2=A0 close(dirfd);<br>
+out1:<br>
+=C2=A0 =C2=A0 if (!sys2memblk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error_code =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error_code =3D errno;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestMemoryBlockList *head, **tail;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 struct dirent *de;<br>
+=C2=A0 =C2=A0 DIR *dp;<br>
+<br>
+=C2=A0 =C2=A0 head =3D NULL;<br>
+=C2=A0 =C2=A0 tail =3D &amp;head;<br>
+<br>
+=C2=A0 =C2=A0 dp =3D opendir(&quot;/sys/devices/system/memory/&quot;);<br>
+=C2=A0 =C2=A0 if (!dp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* it&#39;s ok if this happens to be a system =
that doesn&#39;t expose<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* memory blocks via sysfs, but otherwise=
 we should report<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* an error<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;Can&#39;t open directory&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\&quot;/sys/devices/system/memory/\&qu=
ot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Note: the phys_index of memory block may be discontinuous=
,<br>
+=C2=A0 =C2=A0 =C2=A0* this is because a memblk is the unit of the Sparse M=
emory design, which<br>
+=C2=A0 =C2=A0 =C2=A0* allows discontinuous memory ranges (ex. NUMA), so he=
re we should<br>
+=C2=A0 =C2=A0 =C2=A0* traverse the memory block directory.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 while ((de =3D readdir(dp)) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlock *mem_blk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((strncmp(de-&gt;d_name, &quot;memory&quot;=
, 6) !=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(de-&gt;d_type &amp; DT_DIR)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk =3D g_malloc0(sizeof *mem_blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The d_name is &quot;memoryXXX&quot;,=C2=A0 =
phys_index is block id, same as XXX */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;phys_index =3D strtoul(&amp;de-&gt=
;d_name[6], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;has_can_offline =3D true; /* lolsp=
eak ftw */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_memory_block(mem_blk, true, NULL, &am=
p;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, mem_blk);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 closedir(dp);<br>
+=C2=A0 =C2=A0 if (local_err =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* there&#39;s no guest with zero memory block=
s */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (head =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;guest rep=
orted zero memory blocks!&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return head;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qapi_free_GuestMemoryBlockList(head);<br>
+=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestMemoryBlockResponseList *<br>
+qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)<=
br>
+{<br>
+=C2=A0 =C2=A0 GuestMemoryBlockResponseList *head, **tail;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 head =3D NULL;<br>
+=C2=A0 =C2=A0 tail =3D &amp;head;<br>
+<br>
+=C2=A0 =C2=A0 while (mem_blks !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlockResponse *result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlock *current_mem_blk =3D mem_blks=
-&gt;value;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;phys_index =3D current_mem_blk-&gt;=
phys_index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_memory_block(current_mem_blk, false, =
result, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) { /* should never happen */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, result);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blks =3D mem_blks-&gt;next;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return head;<br>
+err:<br>
+=C2=A0 =C2=A0 qapi_free_GuestMemoryBlockResponseList(head);<br>
+=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 char *dirpath;<br>
+=C2=A0 =C2=A0 int dirfd;<br>
+=C2=A0 =C2=A0 char *buf;<br>
+=C2=A0 =C2=A0 GuestMemoryBlockInfo *info;<br>
+<br>
+=C2=A0 =C2=A0 dirpath =3D g_strdup_printf(&quot;/sys/devices/system/memory=
/&quot;);<br>
+=C2=A0 =C2=A0 dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
+=C2=A0 =C2=A0 if (dirfd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(dirpath);<br>
+<br>
+=C2=A0 =C2=A0 buf =3D g_malloc0(20);<br>
+=C2=A0 =C2=A0 ga_read_sysfs_file(dirfd, &quot;block_size_bytes&quot;, buf,=
 20, &amp;local_err);<br>
+=C2=A0 =C2=A0 close(dirfd);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 info =3D g_new0(GuestMemoryBlockInfo, 1);<br>
+=C2=A0 =C2=A0 info-&gt;size =3D strtol(buf, NULL, 16); /* the unit is byte=
s */<br>
+<br>
+=C2=A0 =C2=A0 g_free(buf);<br>
+<br>
+=C2=A0 =C2=A0 return info;<br>
+}<br>
+<br>
+#define MAX_NAME_LEN 128<br>
+static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)<br>
+{<br>
+#ifdef CONFIG_LINUX<br>
+=C2=A0 =C2=A0 GuestDiskStatsInfoList *head =3D NULL, **tail =3D &amp;head;=
<br>
+=C2=A0 =C2=A0 const char *diskstats =3D &quot;/proc/diskstats&quot;;<br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 size_t n;<br>
+=C2=A0 =C2=A0 char *line =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D fopen(diskstats, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, diskstats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree GuestDiskStatsInfo *diskstatinfo =
=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree GuestDiskStats *diskstat =3D NULL;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char dev_name[MAX_NAME_LEN];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int ios_pgr, tot_ticks, rq_ticks, wr_=
ticks, dc_ticks, fl_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long rd_ios, rd_merges_or_rd_sec, rd_=
ticks_or_wr_sec, wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long wr_merges, rd_sec_or_wr_ios, wr_=
sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long dc_ios, dc_merges, dc_sec, fl_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int major, minor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%u %u %s %lu %lu %lu&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %lu %u %u %u %u&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %u %lu %u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
major, &amp;minor, dev_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
rd_ios, &amp;rd_merges_or_rd_sec, &amp;rd_sec_or_wr_ios,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
rd_ticks_or_wr_sec, &amp;wr_ios, &amp;wr_merges, &amp;wr_sec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
wr_ticks, &amp;ios_pgr, &amp;tot_ticks, &amp;rq_ticks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
dc_ios, &amp;dc_merges, &amp;dc_sec, &amp;dc_ticks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
fl_ios, &amp;fl_ticks);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;name =3D g_strdup(dev_name);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;major =3D major;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;minor =3D minor;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat =3D g_new0(GuestDiskStats, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ios =3D tr=
ue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_merges_or_rd_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ios =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D rd_se=
c_or_wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D r=
d_ticks_or_wr_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 14) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ios =3D tr=
ue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_sec_or_wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_merges =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_merges =3D rd_=
merges_or_rd_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ticks =3D =
true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ticks =3D rd_t=
icks_or_wr_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ios =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D wr_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D w=
r_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_merges =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_merges =3D wr=
_merges;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ticks =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ticks =3D wr_=
ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_ios_pgr =3D tru=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;ios_pgr =3D ios_pgr=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_total_ticks =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;total_ticks =3D tot=
_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_weight_ticks =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;weight_ticks =3D rq=
_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 18) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_ios =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ios =3D dc_=
ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_merges =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_merges =3D =
dc_merges;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_sectors=
 =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_sectors =3D=
 dc_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_ticks =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ticks =3D d=
c_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 20) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_flush_ios =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ios =3D fl_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_flush_ticks =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ticks =3D fl_=
ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;stats =3D g_steal_pointer(&am=
p;diskstat);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, diskstatinfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 free(line);<br>
+=C2=A0 =C2=A0 fclose(fp);<br>
+=C2=A0 =C2=A0 return head;<br>
+#else<br>
+=C2=A0 =C2=A0 g_debug(&quot;disk stats reporting available only for Linux&=
quot;);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+#endif<br>
+}<br>
+<br>
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 return guest_get_diskstats(errp);<br>
+}<br>
+<br>
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestCpuStatsList *head =3D NULL, **tail =3D &amp;head;<br>
+=C2=A0 =C2=A0 const char *cpustats =3D &quot;/proc/stat&quot;;<br>
+=C2=A0 =C2=A0 int clk_tck =3D sysconf(_SC_CLK_TCK);<br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 size_t n;<br>
+=C2=A0 =C2=A0 char *line =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D fopen(cpustats, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, cpustats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestCpuStats *cpustat =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLinuxCpuStats *linuxcpustat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long user, system, idle, iowait, irq,=
 softirq, steal, guest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long nice, guest_nice;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char name[64];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%s %lu %lu %lu %lu %l=
u %lu %lu %lu %lu %lu&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name,=
 &amp;user, &amp;nice, &amp;system, &amp;idle, &amp;iowait, &amp;irq, &amp;=
softirq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
steal, &amp;guest, &amp;guest_nice);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* drop &quot;cpu 1 2 3 ...&quot;, get &quot;c=
puX 1 2 3 ...&quot; only */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((i =3D=3D EOF) || strncmp(name, &quot;cpu&=
quot;, 3) || (name[3] =3D=3D &#39;\0&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 5) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;Parsing cpu stat from=
 %s failed, see \&quot;man proc\&quot;&quot;, cpustats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat =3D g_new0(GuestCpuStats, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;type =3D GUEST_CPU_STATS_TYPE_LINU=
X;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat =3D &amp;cpustat-&gt;u.q_linux;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;cpu =3D atoi(&amp;name[3]);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;user =3D user * 1000 / clk_tc=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;nice =3D nice * 1000 / clk_tc=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;system =3D system * 1000 / cl=
k_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;idle =3D idle * 1000 / clk_tc=
k;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 5) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_iowait =3D =
true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;iowait =3D iowa=
it * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 6) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_irq =3D tru=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;irq =3D irq * 1=
000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_softirq =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;softirq =3D sof=
tirq * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_steal =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;steal =3D steal=
 * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 9) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guest =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guest =3D guest=
 * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guest =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guest =3D guest=
 * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guestnice =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guestnice =3D g=
uest_nice * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, cpustat);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free(line);<br>
+=C2=A0 =C2=A0 fclose(fp);<br>
+=C2=A0 =C2=A0 return head;<br>
+}<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 954efed01b..0bb8b9e2f3 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
=C2=A0#include &lt;sys/utsname.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
-#include &lt;dirent.h&gt;<br>
=C2=A0#include &quot;guest-agent-core.h&quot;<br>
=C2=A0#include &quot;qga-qapi-commands.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -26,31 +25,12 @@<br>
=C2=A0#include &quot;qemu/base64.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;commands-common.h&quot;<br>
-#include &quot;block/nvme.h&quot;<br>
=C2=A0#include &quot;cutils.h&quot;<br>
<br>
=C2=A0#ifdef HAVE_UTMPX<br>
=C2=A0#include &lt;utmpx.h&gt;<br>
=C2=A0#endif<br>
<br>
-#if defined(__linux__)<br>
-#include &lt;mntent.h&gt;<br>
-#include &lt;linux/fs.h&gt;<br>
-#include &lt;sys/statvfs.h&gt;<br>
-#include &lt;linux/nvme_ioctl.h&gt;<br>
-<br>
-#ifdef CONFIG_LIBUDEV<br>
-#include &lt;libudev.h&gt;<br>
-#endif<br>
-<br>
-#ifdef FIFREEZE<br>
-#define CONFIG_FSFREEZE<br>
-#endif<br>
-#ifdef FITRIM<br>
-#define CONFIG_FSTRIM<br>
-#endif<br>
-#endif<br>
-<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
@@ -62,7 +42,173 @@<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
<br>
-static void ga_wait_child(pid_t pid, int *status, Error **errp)<br>
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
+void free_fs_mount_list(FsMountList *mounts)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0FsMount *mount, *temp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0if (!mounts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH_SAFE(mount, mounts, next, temp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_REMOVE(mounts, mount, next);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(mount-&gt;dirname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(mount-&gt;devtype);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(mount);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+#endif<br>
+<br>
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
+#endif /* CONFIG_FSFREEZE */<br>
+<br>
+void ga_wait_child(pid_t pid, int *status, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0pid_t rpid;<br>
<br>
@@ -617,2375 +763,7 @@ void qmp_guest_file_flush(int64_t handle, Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-/* linux-specific implementations. avoid this if at all possible. */<br>
-#if defined(__linux__)<br>
-<br>
-#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
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
-{<br>
-=C2=A0 =C2=A0 =C2=A0FsMount *mount, *temp;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0if (!mounts) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH_SAFE(mount, mounts, next, temp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_REMOVE(mounts, mount, next);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(mount-&gt;dirname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(mount-&gt;devtype);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(mount);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-static int dev_major_minor(const char *devpath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *devmajor, unsigned int *devminor)<br>
-{<br>
-=C2=A0 =C2=A0 struct stat st;<br>
-<br>
-=C2=A0 =C2=A0 *devmajor =3D 0;<br>
-=C2=A0 =C2=A0 *devminor =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 if (stat(devpath, &amp;st) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;failed to stat device file &#39;%s&=
#39;: %s&quot;, devpath, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (S_ISDIR(st.st_mode)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* It is bind mount */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -2;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (S_ISBLK(st.st_mode)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devmajor =3D major(st.st_rdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *devminor =3D minor(st.st_rdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-<br>
-/*<br>
- * Walk the mount table and build a list of local file systems<br>
- */<br>
-static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **err=
p)<br>
-{<br>
-=C2=A0 =C2=A0 struct mntent *ment;<br>
-=C2=A0 =C2=A0 FsMount *mount;<br>
-=C2=A0 =C2=A0 char const *mtab =3D &quot;/proc/self/mounts&quot;;<br>
-=C2=A0 =C2=A0 FILE *fp;<br>
-=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
-<br>
-=C2=A0 =C2=A0 fp =3D setmntent(mtab, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 if (!fp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to open mtab fil=
e: &#39;%s&#39;&quot;, mtab);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 while ((ment =3D getmntent(fp))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* An entry which device name doesn&#39;t=
 start with a &#39;/&#39; is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* either a dummy file system or a networ=
k file system.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add special handling for smbfs and cif=
s as is done by<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* coreutils as well.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ment-&gt;mnt_fsname[0] !=3D &#39;/&#39;) =
||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt_type, &quot=
;smbfs&quot;) =3D=3D 0) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (strcmp(ment-&gt;mnt_type, &quot=
;cifs&quot;) =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_major_minor(ment-&gt;mnt_fsname, &amp;=
devmajor, &amp;devminor) =3D=3D -2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip bind mounts */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(ment-&gt;mnt_di=
r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(ment-&gt;mnt_ty=
pe);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
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
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name[i] !=3D &#39;\\&#39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] =3D=3D &#39;\\&#39;) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D &#39;\\&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (name[i + 1] &gt;=3D &#39;0&#39; &am=
p;&amp; name[i + 1] &lt;=3D &#39;3&#39; &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name[=
i + 2] &gt;=3D &#39;0&#39; &amp;&amp; name[i + 2] &lt;=3D &#39;7&#39; &amp;=
&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name[=
i + 3] &gt;=3D &#39;0&#39; &amp;&amp; name[i + 3] &lt;=3D &#39;7&#39;) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D (name[i + 1] - &#3=
9;0&#39;) * 64 +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (name[i + 2] - &#39;0&#39;) * 8 +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (name[i + 3] - &#39;0&#39;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D 3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[j++] =3D name[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 FsMount *mount;<br>
-=C2=A0 =C2=A0 char const *mountinfo =3D &quot;/proc/self/mountinfo&quot;;<=
br>
-=C2=A0 =C2=A0 FILE *fp;<br>
-=C2=A0 =C2=A0 char *line =3D NULL, *dash;<br>
-=C2=A0 =C2=A0 size_t n;<br>
-=C2=A0 =C2=A0 char check;<br>
-=C2=A0 =C2=A0 unsigned int devmajor, devminor;<br>
-=C2=A0 =C2=A0 int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;<br>
-<br>
-=C2=A0 =C2=A0 fp =3D fopen(mountinfo, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 if (!fp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return build_fs_mount_list_from_mtab(mounts, e=
rrp);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(line, &quot;%*u %*u %u:%u %*s %=
n%*s%n%c&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;devmajor, &amp;devminor, &amp;dir_s, &amp;dir_e, &amp;check);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 3) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash =3D strstr(line + dir_e, &quot; - &quot;)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dash) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sscanf(dash, &quot; - %n%*s%n %n%*s%n%=
c&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;type_s, &amp;type_e, &amp;dev_s, &amp;dev_e, &amp;check);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 line[dir_e] =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[type_e] =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dash[dev_e] =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(line + dir_s, dir_e - dir_s);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_mntname(dash + dev_s, dev_e - dev_s);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devmajor =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* btrfs reports major number =
=3D 0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(&quot;btrfs&quot;, da=
sh + type_s) !=3D 0 ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_major_minor(da=
sh + dev_s, &amp;devmajor, &amp;devminor) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount =3D g_new0(FsMount, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;dirname =3D g_strdup(line + dir_s);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devtype =3D g_strdup(dash + type_s);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor =3D devmajor;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devminor =3D devminor;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 free(line);<br>
-<br>
-=C2=A0 =C2=A0 fclose(fp);<br>
-=C2=A0 =C2=A0 return true;<br>
-}<br>
-#endif<br>
-<br>
-#if defined(CONFIG_FSFREEZE)<br>
-<br>
-static char *get_pci_driver(char const *syspath, int pathlen, Error **errp=
)<br>
-{<br>
-=C2=A0 =C2=A0 char *path;<br>
-=C2=A0 =C2=A0 char *dpath;<br>
-=C2=A0 =C2=A0 char *driver =3D NULL;<br>
-=C2=A0 =C2=A0 char buf[PATH_MAX];<br>
-=C2=A0 =C2=A0 ssize_t len;<br>
-<br>
-=C2=A0 =C2=A0 path =3D g_strndup(syspath, pathlen);<br>
-=C2=A0 =C2=A0 dpath =3D g_strdup_printf(&quot;%s/driver&quot;, path);<br>
-=C2=A0 =C2=A0 len =3D readlink(dpath, buf, sizeof(buf) - 1);<br>
-=C2=A0 =C2=A0 if (len !=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[len] =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver =3D g_path_get_basename(buf);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 g_free(dpath);<br>
-=C2=A0 =C2=A0 g_free(path);<br>
-=C2=A0 =C2=A0 return driver;<br>
-}<br>
-<br>
-static int compare_uint(const void *_a, const void *_b)<br>
-{<br>
-=C2=A0 =C2=A0 unsigned int a =3D *(unsigned int *)_a;<br>
-=C2=A0 =C2=A0 unsigned int b =3D *(unsigned int *)_b;<br>
-<br>
-=C2=A0 =C2=A0 return a &lt; b ? -1 : a &gt; b ? 1 : 0;<br>
-}<br>
-<br>
-/* Walk the specified sysfs and build a sorted list of host or ata numbers=
 */<br>
-static int build_hosts(char const *syspath, char const *host, bool ata,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned int *hosts, int hosts_max, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 char *path;<br>
-=C2=A0 =C2=A0 DIR *dir;<br>
-=C2=A0 =C2=A0 struct dirent *entry;<br>
-=C2=A0 =C2=A0 int i =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 path =3D g_strndup(syspath, host - syspath);<br>
-=C2=A0 =C2=A0 dir =3D opendir(path);<br>
-=C2=A0 =C2=A0 if (!dir) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;opendir(\&=
quot;%s\&quot;)&quot;, path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 while (i &lt; hosts_max) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D readdir(dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ata &amp;&amp; sscanf(entry-&gt;d_name, &q=
uot;ata%d&quot;, hosts + i) =3D=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!ata &amp;&amp; sscanf(entry-&gt;d_=
name, &quot;host%d&quot;, hosts + i) =3D=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 qsort(hosts, i, sizeof(hosts[0]), compare_uint);<br>
-<br>
-=C2=A0 =C2=A0 g_free(path);<br>
-=C2=A0 =C2=A0 closedir(dir);<br>
-=C2=A0 =C2=A0 return i;<br>
-}<br>
-<br>
-/*<br>
- * Store disk device info for devices on the PCI bus.<br>
- * Returns true if information has been stored, or false for failure.<br>
- */<br>
-static bool build_guest_fsinfo_for_pci_dev(char const *syspath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GuestDiskAddress *disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 unsigned int pci[4], host, hosts[8], tgt[3];<br>
-=C2=A0 =C2=A0 int i, nhosts =3D 0, pcilen;<br>
-=C2=A0 =C2=A0 GuestPCIAddress *pciaddr =3D disk-&gt;pci_controller;<br>
-=C2=A0 =C2=A0 bool has_ata =3D false, has_host =3D false, has_tgt =3D fals=
e;<br>
-=C2=A0 =C2=A0 char *p, *q, *driver =3D NULL;<br>
-=C2=A0 =C2=A0 bool ret =3D false;<br>
-<br>
-=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/devices/pci&quot;);<br>
-=C2=A0 =C2=A0 if (!p || sscanf(p + 12, &quot;%*x:%*x/%x:%x:%x.%x%n&quot;,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci, pci + 1, pci + 2, pci + 3, &amp;pcilen) &lt; 4) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;only pci device is supported: sy=
sfs path &#39;%s&#39;&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 p +=3D 12 + pcilen;<br>
-=C2=A0 =C2=A0 while (true) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver =3D get_pci_driver(syspath, p - syspath=
, errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (driver &amp;&amp; (g_str_equal(driver, &qu=
ot;ata_piix&quot;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;sym53c8xx&quot;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;virtio-pci&quot;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;ahci&quot;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;nvme&quot;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(driver);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(p, &quot;/%x:%x:%x.%x%n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pci, pci + 1, pci + 2, pci + 3, &amp;pcilen) =3D=3D 4) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p +=3D pcilen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;unsupported driver or sysfs path=
 &#39;%s&#39;&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/target&quot;);<br>
-=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(p + 7, &quot;%*u:%*u:%*u/%*u:%u:%u:%=
u&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt,=
 tgt + 1, tgt + 2) =3D=3D 3) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_tgt =3D true;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/ata&quot;);<br>
-=C2=A0 =C2=A0 if (p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_ata =3D true;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/host&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 5;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(q, &quot;%u&quot;, &amp;host) =3D=3D=
 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_host =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nhosts =3D build_hosts(syspath, p, has_ata, ho=
sts,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(hosts), errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nhosts &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 pciaddr-&gt;domain =3D pci[0];<br>
-=C2=A0 =C2=A0 pciaddr-&gt;bus =3D pci[1];<br>
-=C2=A0 =C2=A0 pciaddr-&gt;slot =3D pci[2];<br>
-=C2=A0 =C2=A0 pciaddr-&gt;function =3D pci[3];<br>
-<br>
-=C2=A0 =C2=A0 if (strcmp(driver, &quot;ata_piix&quot;) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a host per ide bus, target*:0:&lt;unit&gt;:=
0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_host || !has_tgt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;invalid sysfs path=
 &#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nhosts; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host =3D=3D hosts[i]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =
=3D GUEST_DISK_BUS_TYPE_IDE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus =3D i=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D =
tgt[1];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D nhosts) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;no host for &#39;%=
s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;sym53c8xx&quot;) =3D=3D 0) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* scsi(LSI Logic): target*:0:&lt;unit&gt;:0 *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_tgt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;invalid sysfs path=
 &#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_SCSI=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D tgt[1];<br>
-=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;virtio-pci&quot;) =3D=3D 0) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_tgt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-scsi: target*:0:0:&lt;=
unit&gt; */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK=
_BUS_TYPE_SCSI;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D tgt[2];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-blk: 1 disk per 1 devi=
ce */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK=
_BUS_TYPE_VIRTIO;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;ahci&quot;) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ahci: 1 host per 1 unit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!has_host || !has_tgt) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;invalid sysfs path=
 &#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nhosts; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host =3D=3D hosts[i]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D =
i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =
=3D GUEST_DISK_BUS_TYPE_SATA;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D nhosts) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;no host for &#39;%=
s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;nvme&quot;) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_NVME=
;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;unknown driver &#39;%s&#39; (sys=
fs path &#39;%s&#39;)&quot;, driver, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 ret =3D true;<br>
-<br>
-cleanup:<br>
-=C2=A0 =C2=A0 g_free(driver);<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-/*<br>
- * Store disk device info for non-PCI virtio devices (for example s390x<br=
>
- * channel I/O devices). Returns true if information has been stored, or<b=
r>
- * false for failure.<br>
- */<br>
-static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GuestDiskAddress *disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 unsigned int tgt[3];<br>
-=C2=A0 =C2=A0 char *p;<br>
-<br>
-=C2=A0 =C2=A0 if (!strstr(syspath, &quot;/virtio&quot;) || !strstr(syspath=
, &quot;/block&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Unsupported virtio device &#39;%=
s&#39;&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/target&quot;);<br>
-=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(p + 7, &quot;%*u:%*u:%*u/%*u:%u:%u:%=
u&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;tgt[0], &amp;tgt[1], &amp;tgt[2]) =3D=3D 3) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-scsi: target*:0:&lt;target&gt;:&lt;u=
nit&gt; */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_SCSI=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus =3D tgt[0];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;target =3D tgt[1];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;unit =3D tgt[2];<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* virtio-blk: 1 disk per 1 device */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_VIRT=
IO;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return true;<br>
-}<br>
-<br>
-/*<br>
- * Store disk device info for CCW devices (s390x channel I/O devices).<br>
- * Returns true if information has been stored, or false for failure.<br>
- */<br>
-static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GuestDiskAddress *disk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 unsigned int cssid, ssid, subchno, devno;<br>
-=C2=A0 =C2=A0 char *p;<br>
-<br>
-=C2=A0 =C2=A0 p =3D strstr(syspath, &quot;/devices/css&quot;);<br>
-=C2=A0 =C2=A0 if (!p || sscanf(p + 12, &quot;%*x/%x.%x.%x/%*x.%*x.%x/&quot=
;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;cssid, &amp;ssid, &amp;subchno, &amp;devno) &lt; 4) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;could not parse ccw device sysfs=
 path: %s&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 disk-&gt;has_ccw_address =3D true;<br>
-=C2=A0 =C2=A0 disk-&gt;ccw_address =3D g_new0(GuestCCWAddress, 1);<br>
-=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;cssid =3D cssid;<br>
-=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;ssid =3D ssid;<br>
-=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;subchno =3D subchno;<br>
-=C2=A0 =C2=A0 disk-&gt;ccw_address-&gt;devno =3D devno;<br>
-<br>
-=C2=A0 =C2=A0 if (strstr(p, &quot;/virtio&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_nonpci_virtio(syspath, =
disk, errp);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return true;<br>
-}<br>
-<br>
-/* Store disk device info specified by @sysfs into @fs */<br>
-static void build_guest_fsinfo_for_real_device(char const *syspath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GuestFilesystemInfo *fs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestDiskAddress *disk;<br>
-=C2=A0 =C2=A0 GuestPCIAddress *pciaddr;<br>
-=C2=A0 =C2=A0 bool has_hwinf;<br>
-#ifdef CONFIG_LIBUDEV<br>
-=C2=A0 =C2=A0 struct udev *udev =3D NULL;<br>
-=C2=A0 =C2=A0 struct udev_device *udevice =3D NULL;<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 pciaddr =3D g_new0(GuestPCIAddress, 1);<br>
-=C2=A0 =C2=A0 pciaddr-&gt;domain =3D -1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* -1 means field is inval=
id */<br>
-=C2=A0 =C2=A0 pciaddr-&gt;bus =3D -1;<br>
-=C2=A0 =C2=A0 pciaddr-&gt;slot =3D -1;<br>
-=C2=A0 =C2=A0 pciaddr-&gt;function =3D -1;<br>
-<br>
-=C2=A0 =C2=A0 disk =3D g_new0(GuestDiskAddress, 1);<br>
-=C2=A0 =C2=A0 disk-&gt;pci_controller =3D pciaddr;<br>
-=C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_UNKNOWN;<br>
-<br>
-#ifdef CONFIG_LIBUDEV<br>
-=C2=A0 =C2=A0 udev =3D udev_new();<br>
-=C2=A0 =C2=A0 udevice =3D udev_device_new_from_syspath(udev, syspath);<br>
-=C2=A0 =C2=A0 if (udev =3D=3D NULL || udevice =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev&quot;);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devnode, *serial;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 devnode =3D udev_device_get_devnode(udevice);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (devnode !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;dev =3D g_strdup(devnod=
e);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_dev =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 serial =3D udev_device_get_property_value(udev=
ice, &quot;ID_SERIAL&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (serial !=3D NULL &amp;&amp; *serial !=3D 0=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;serial =3D g_strdup(ser=
ial);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_serial =3D true;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 udev_unref(udev);<br>
-=C2=A0 =C2=A0 udev_device_unref(udevice);<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 if (strstr(syspath, &quot;/devices/pci&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D build_guest_fsinfo_for_pci_dev(s=
yspath, disk, errp);<br>
-=C2=A0 =C2=A0 } else if (strstr(syspath, &quot;/devices/css&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D build_guest_fsinfo_for_ccw_dev(s=
yspath, disk, errp);<br>
-=C2=A0 =C2=A0 } else if (strstr(syspath, &quot;/virtio&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D build_guest_fsinfo_for_nonpci_vi=
rtio(syspath, disk, errp);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Unsupported device type for &#39=
;%s&#39;&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_hwinf =3D false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (has_hwinf || disk-&gt;has_dev || disk-&gt;has_serial) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(fs-&gt;disk, disk);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_GuestDiskAddress(disk);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static void build_guest_fsinfo_for_device(char const *devpath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
uestFilesystemInfo *fs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
rror **errp);<br>
-<br>
-/* Store a list of slave devices of virtual volume specified by @syspath i=
nto<br>
- * @fs */<br>
-static void build_guest_fsinfo_for_virtual_device(char const *syspath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestFilesystemInfo *fs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *err =3D NULL;<br>
-=C2=A0 =C2=A0 DIR *dir;<br>
-=C2=A0 =C2=A0 char *dirpath;<br>
-=C2=A0 =C2=A0 struct dirent *entry;<br>
-<br>
-=C2=A0 =C2=A0 dirpath =3D g_strdup_printf(&quot;%s/slaves&quot;, syspath);=
<br>
-=C2=A0 =C2=A0 dir =3D opendir(dirpath);<br>
-=C2=A0 =C2=A0 if (!dir) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;opendir(\&quot;%s\&quot;)&quot;, dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 for (;;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D readdir(dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (entry =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;readdir(\&quot;%s\&quot;)&quot;, dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (entry-&gt;d_type =3D=3D DT_LNK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot; slave device &#39=
;%s&#39;&quot;, entry-&gt;d_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D g_strdup_printf(&quot;%=
s/slaves/%s&quot;, syspath, entry-&gt;d_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_device(pa=
th, fs, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 g_free(dirpath);<br>
-=C2=A0 =C2=A0 closedir(dir);<br>
-}<br>
-<br>
-static bool is_disk_virtual(const char *devpath, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 g_autofree char *syspath =3D realpath(devpath, NULL);<br>
-<br>
-=C2=A0 =C2=A0 if (!syspath) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;realpath(\=
&quot;%s\&quot;)&quot;, devpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return strstr(syspath, &quot;/devices/virtual/block/&quot;) =
!=3D NULL;<br>
-}<br>
-<br>
-/* Dispatch to functions for virtual/real device */<br>
-static void build_guest_fsinfo_for_device(char const *devpath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
uestFilesystemInfo *fs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
rror **errp)<br>
-{<br>
-=C2=A0 =C2=A0 ERRP_GUARD();<br>
-=C2=A0 =C2=A0 g_autofree char *syspath =3D NULL;<br>
-=C2=A0 =C2=A0 bool is_virtual =3D false;<br>
-<br>
-=C2=A0 =C2=A0 syspath =3D realpath(devpath, NULL);<br>
-=C2=A0 =C2=A0 if (!syspath) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;realpath(\&quot;%s\&quot;)&quot;, devpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ENOENT: This devpath may not exist because =
of container config */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fs-&gt;name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_path_get_basen=
ame(devpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!fs-&gt;name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D g_path_get_basename(syspath);<=
br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 g_debug(&quot;=C2=A0 parse sysfs path &#39;%s&#39;&quot;, sy=
spath);<br>
-=C2=A0 =C2=A0 is_virtual =3D is_disk_virtual(syspath, errp);<br>
-=C2=A0 =C2=A0 if (*errp !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (is_virtual) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_virtual_device(syspath,=
 fs, errp);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 build_guest_fsinfo_for_real_device(syspath, fs=
, errp);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#ifdef CONFIG_LIBUDEV<br>
-<br>
-/*<br>
- * Wrapper around build_guest_fsinfo_for_device() for getting just<br>
- * the disk address.<br>
- */<br>
-static GuestDiskAddress *get_disk_address(const char *syspath, Error **err=
p)<br>
-{<br>
-=C2=A0 =C2=A0 g_autoptr(GuestFilesystemInfo) fs =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 fs =3D g_new0(GuestFilesystemInfo, 1);<br>
-=C2=A0 =C2=A0 build_guest_fsinfo_for_device(syspath, fs, errp);<br>
-=C2=A0 =C2=A0 if (fs-&gt;disk !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_steal_pointer(&amp;fs-&gt;disk-&gt;va=
lue);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-static char *get_alias_for_syspath(const char *syspath)<br>
-{<br>
-=C2=A0 =C2=A0 struct udev *udev =3D NULL;<br>
-=C2=A0 =C2=A0 struct udev_device *udevice =3D NULL;<br>
-=C2=A0 =C2=A0 char *ret =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 udev =3D udev_new();<br>
-=C2=A0 =C2=A0 if (udev =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 udevice =3D udev_device_new_from_syspath(udev, syspath);<br>
-=C2=A0 =C2=A0 if (udevice =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev for path: %=
s&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *alias =3D udev_device_get_property=
_value(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udevice, &quot;DM_NAME&quot;);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* NULL means there was an error and empt=
y string means there is no<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* alias. In case of no alias we return N=
ULL instead of empty string.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (alias =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query ud=
ev for device alias for: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (*alias !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D g_strdup(alias);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-out:<br>
-=C2=A0 =C2=A0 udev_unref(udev);<br>
-=C2=A0 =C2=A0 udev_device_unref(udevice);<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-static char *get_device_for_syspath(const char *syspath)<br>
-{<br>
-=C2=A0 =C2=A0 struct udev *udev =3D NULL;<br>
-=C2=A0 =C2=A0 struct udev_device *udevice =3D NULL;<br>
-=C2=A0 =C2=A0 char *ret =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 udev =3D udev_new();<br>
-=C2=A0 =C2=A0 if (udev =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 udevice =3D udev_device_new_from_syspath(udev, syspath);<br>
-=C2=A0 =C2=A0 if (udevice =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to query udev for path: %=
s&quot;, syspath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D g_strdup(udev_device_get_devnode(udevi=
ce));<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-out:<br>
-=C2=A0 =C2=A0 udev_unref(udev);<br>
-=C2=A0 =C2=A0 udev_device_unref(udevice);<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)<br>
-{<br>
-=C2=A0 =C2=A0 g_autofree char *deps_dir =3D NULL;<br>
-=C2=A0 =C2=A0 const gchar *dep;<br>
-=C2=A0 =C2=A0 GDir *dp_deps =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 /* List dependent disks */<br>
-=C2=A0 =C2=A0 deps_dir =3D g_strdup_printf(&quot;%s/slaves&quot;, disk_dir=
);<br>
-=C2=A0 =C2=A0 g_debug(&quot;=C2=A0 listing entries in: %s&quot;, deps_dir)=
;<br>
-=C2=A0 =C2=A0 dp_deps =3D g_dir_open(deps_dir, 0, NULL);<br>
-=C2=A0 =C2=A0 if (dp_deps =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to list entries in %s&quo=
t;, deps_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 disk-&gt;has_dependencies =3D true;<br>
-=C2=A0 =C2=A0 while ((dep =3D g_dir_read_name(dp_deps)) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *dep_dir =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_name;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add dependent disks */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_dir =3D g_strdup_printf(&quot;%s/%s&quot;,=
 deps_dir, dep);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name =3D get_device_for_syspath(dep_dir);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_name !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 adding depe=
ndent device: %s&quot;, dev_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(disk-&gt;depen=
dencies, dev_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 g_dir_close(dp_deps);<br>
-}<br>
-<br>
-/*<br>
- * Detect partitions subdirectory, name is &quot;&lt;disk_name&gt;&lt;numb=
er&gt;&quot; or<br>
- * &quot;&lt;disk_name&gt;p&lt;number&gt;&quot;<br>
- *<br>
- * @disk_name -- last component of /sys path (e.g. sda)<br>
- * @disk_dir -- sys path of the disk (e.g. /sys/block/sda)<br>
- * @disk_dev -- device node of the disk (e.g. /dev/sda)<br>
- */<br>
-static GuestDiskInfoList *get_disk_partitions(<br>
-=C2=A0 =C2=A0 GuestDiskInfoList *list,<br>
-=C2=A0 =C2=A0 const char *disk_name, const char *disk_dir,<br>
-=C2=A0 =C2=A0 const char *disk_dev)<br>
-{<br>
-=C2=A0 =C2=A0 GuestDiskInfoList *ret =3D list;<br>
-=C2=A0 =C2=A0 struct dirent *de_disk;<br>
-=C2=A0 =C2=A0 DIR *dp_disk =3D NULL;<br>
-=C2=A0 =C2=A0 size_t len =3D strlen(disk_name);<br>
-<br>
-=C2=A0 =C2=A0 dp_disk =3D opendir(disk_dir);<br>
-=C2=A0 =C2=A0 while ((de_disk =3D readdir(dp_disk)) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *partition_dir =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_name;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDiskInfo *partition;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(de_disk-&gt;d_type &amp; DT_DIR)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(strncmp(disk_name, de_disk-&gt;d_name, l=
en) =3D=3D 0 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((*(de_disk-&gt;d_name + len) =
=3D=3D &#39;p&#39; &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isdigit(*(de_disk-&gt;d_name + l=
en + 1))) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isdigit(*(de_disk-=
&gt;d_name + len))))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition_dir =3D g_strdup_printf(&quot;%s/%s&=
quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir, de_disk-&gt;d_name);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name =3D get_device_for_syspath(partition_=
dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_name =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get devi=
ce name for syspath: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition =3D g_new0(GuestDiskInfo, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;name =3D dev_name;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;partition =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-&gt;has_dependencies =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add parent disk as dependent for easier tra=
cking of hierarchy */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(partition-&gt;dependencies, =
g_strdup(disk_dev));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, partition);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 closedir(dp_disk);<br>
-<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-static void get_nvme_smart(GuestDiskInfo *disk)<br>
-{<br>
-=C2=A0 =C2=A0 int fd;<br>
-=C2=A0 =C2=A0 GuestNVMeSmart *smart;<br>
-=C2=A0 =C2=A0 NvmeSmartLog log =3D {0};<br>
-=C2=A0 =C2=A0 struct nvme_admin_cmd cmd =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .nsid =3D NVME_NSID_BROADCAST,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D (uintptr_t)&amp;log,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .data_len =3D sizeof(log),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cdw10 =3D NVME_LOG_SMART_INFO | (1 &lt;&lt; 1=
5) /* RAE bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| (((sizeof(=
log) &gt;&gt; 2) - 1) &lt;&lt; 16)<br>
-=C2=A0 =C2=A0 };<br>
-<br>
-=C2=A0 =C2=A0 fd =3D qga_open_cloexec(disk-&gt;name, O_RDONLY, 0);<br>
-=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: %s&qu=
ot;, disk-&gt;name, g_strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &amp;cmd)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get smart: %s: %s&quot=
;, disk-&gt;name, g_strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 disk-&gt;has_smart =3D true;<br>
-=C2=A0 =C2=A0 disk-&gt;smart =3D g_new0(GuestDiskSmart, 1);<br>
-=C2=A0 =C2=A0 disk-&gt;smart-&gt;type =3D GUEST_DISK_BUS_TYPE_NVME;<br>
-<br>
-=C2=A0 =C2=A0 smart =3D &amp;disk-&gt;smart-&gt;u.nvme;<br>
-=C2=A0 =C2=A0 smart-&gt;critical_warning =3D log.critical_warning;<br>
-=C2=A0 =C2=A0 smart-&gt;temperature =3D lduw_le_p(&amp;log.temperature); /=
* unaligned field */<br>
-=C2=A0 =C2=A0 smart-&gt;available_spare =3D log.available_spare;<br>
-=C2=A0 =C2=A0 smart-&gt;available_spare_threshold =3D log.available_spare_=
threshold;<br>
-=C2=A0 =C2=A0 smart-&gt;percentage_used =3D log.percentage_used;<br>
-=C2=A0 =C2=A0 smart-&gt;data_units_read_lo =3D le64_to_cpu(log.data_units_=
read[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;data_units_read_hi =3D le64_to_cpu(log.data_units_=
read[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;data_units_written_lo =3D le64_to_cpu(log.data_uni=
ts_written[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;data_units_written_hi =3D le64_to_cpu(log.data_uni=
ts_written[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;host_read_commands_lo =3D le64_to_cpu(log.host_rea=
d_commands[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;host_read_commands_hi =3D le64_to_cpu(log.host_rea=
d_commands[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;host_write_commands_lo =3D le64_to_cpu(log.host_wr=
ite_commands[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;host_write_commands_hi =3D le64_to_cpu(log.host_wr=
ite_commands[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;controller_busy_time_lo =3D le64_to_cpu(log.contro=
ller_busy_time[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;controller_busy_time_hi =3D le64_to_cpu(log.contro=
ller_busy_time[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;power_cycles_lo =3D le64_to_cpu(log.power_cycles[0=
]);<br>
-=C2=A0 =C2=A0 smart-&gt;power_cycles_hi =3D le64_to_cpu(log.power_cycles[1=
]);<br>
-=C2=A0 =C2=A0 smart-&gt;power_on_hours_lo =3D le64_to_cpu(log.power_on_hou=
rs[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;power_on_hours_hi =3D le64_to_cpu(log.power_on_hou=
rs[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;unsafe_shutdowns_lo =3D le64_to_cpu(log.unsafe_shu=
tdowns[0]);<br>
-=C2=A0 =C2=A0 smart-&gt;unsafe_shutdowns_hi =3D le64_to_cpu(log.unsafe_shu=
tdowns[1]);<br>
-=C2=A0 =C2=A0 smart-&gt;media_errors_lo =3D le64_to_cpu(log.media_errors[0=
]);<br>
-=C2=A0 =C2=A0 smart-&gt;media_errors_hi =3D le64_to_cpu(log.media_errors[1=
]);<br>
-=C2=A0 =C2=A0 smart-&gt;number_of_error_log_entries_lo =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_log_entries[0]=
);<br>
-=C2=A0 =C2=A0 smart-&gt;number_of_error_log_entries_hi =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_log_entries[1]=
);<br>
-<br>
-=C2=A0 =C2=A0 close(fd);<br>
-}<br>
-<br>
-static void get_disk_smart(GuestDiskInfo *disk)<br>
-{<br>
-=C2=A0 =C2=A0 if (disk-&gt;has_address<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (disk-&gt;address-&gt;bus_type =3D=
=3D GUEST_DISK_BUS_TYPE_NVME)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_nvme_smart(disk);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestDiskInfoList *ret =3D NULL;<br>
-=C2=A0 =C2=A0 GuestDiskInfo *disk;<br>
-=C2=A0 =C2=A0 DIR *dp =3D NULL;<br>
-=C2=A0 =C2=A0 struct dirent *de =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 g_debug(&quot;listing /sys/block directory&quot;);<br>
-=C2=A0 =C2=A0 dp =3D opendir(&quot;/sys/block&quot;);<br>
-=C2=A0 =C2=A0 if (dp =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;Can&#39;t =
open directory \&quot;/sys/block\&quot;&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 while ((de =3D readdir(dp)) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *disk_dir =3D NULL, *line =3D =
NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *size_path =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_name;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (de-&gt;d_type !=3D DT_LNK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 skipping en=
try: %s&quot;, de-&gt;d_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check size and skip zero-sized disks */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 checking disk size&quot;)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_path =3D g_strdup_printf(&quot;/sys/block=
/%s/size&quot;, de-&gt;d_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_file_get_contents(size_path, &amp;line,=
 NULL, NULL)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 failed to r=
ead disk size&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(line, &quot;0\n&quot;) =3D=3D 0)=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 skipping ze=
ro-sized disk&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 adding %s&quot;, de-&gt;d=
_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir =3D g_strdup_printf(&quot;/sys/block/=
%s&quot;, de-&gt;d_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name =3D get_device_for_syspath(disk_dir);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev_name =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get devi=
ce name for syspath: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D g_new0(GuestDiskInfo, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;name =3D dev_name;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;partition =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;alias =3D get_alias_for_syspath(disk_=
dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_alias =3D (disk-&gt;alias !=3D NU=
LL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, disk);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get address for non-virtual devices */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_virtual =3D is_disk_virtual(disk_dir, =
&amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=A0 failed to c=
heck disk path, ignoring error: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_get_pretty(l=
ocal_err));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_err =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t try to get the addr=
ess */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_virtual =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_virtual) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;address =3D get_disk_ad=
dress(disk_dir, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;=C2=
=A0 failed to get device info, ignoring error: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_get_pretty(local_err));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_err =3D NULL=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (disk-&gt;address !=3D=
 NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_addre=
ss =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_disk_deps(disk_dir, disk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_disk_smart(disk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_disk_partitions(ret, de-&gt;d_name=
, disk_dir, dev_name);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 closedir(dp);<br>
-<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
-#else<br>
-<br>
-GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-#endif<br>
-<br>
-/* Return a list of the disk device(s)&#39; info which @mount lies on */<b=
r>
-static GuestFilesystemInfo *build_guest_fsinfo(struct FsMount *mount,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestFilesystemInfo *fs =3D g_malloc0(sizeof(*fs));<br>
-=C2=A0 =C2=A0 struct statvfs buf;<br>
-=C2=A0 =C2=A0 unsigned long used, nonroot_total, fr_size;<br>
-=C2=A0 =C2=A0 char *devpath =3D g_strdup_printf(&quot;/sys/dev/block/%u:%u=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mount-&gt;devmajor, mo=
unt-&gt;devminor);<br>
-<br>
-=C2=A0 =C2=A0 fs-&gt;mountpoint =3D g_strdup(mount-&gt;dirname);<br>
-=C2=A0 =C2=A0 fs-&gt;type =3D g_strdup(mount-&gt;devtype);<br>
-=C2=A0 =C2=A0 build_guest_fsinfo_for_device(devpath, fs, errp);<br>
-<br>
-=C2=A0 =C2=A0 if (statvfs(fs-&gt;mountpoint, &amp;buf) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fr_size =3D buf.f_frsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 used =3D buf.f_blocks - buf.f_bfree;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nonroot_total =3D used + buf.f_bavail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;used_bytes =3D used * fr_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;total_bytes =3D nonroot_total * fr_size=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;has_total_bytes =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;has_used_bytes =3D true;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 g_free(devpath);<br>
-<br>
-=C2=A0 =C2=A0 return fs;<br>
-}<br>
-<br>
-GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 FsMountList mounts;<br>
-=C2=A0 =C2=A0 struct FsMount *mount;<br>
-=C2=A0 =C2=A0 GuestFilesystemInfoList *ret =3D NULL;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
-=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local_err)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Building guest fsinfo for &#39;%=
s&#39;&quot;, mount-&gt;dirname);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(ret, build_guest_fsinfo(moun=
t, &amp;local_err));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_GuestFilesystemInfoLis=
t(ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
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
-/*<br>
- * Walk list of mounted file systems in the guest, and freeze the ones whi=
ch<br>
- * are real local file systems.<br>
- */<br>
-int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strList *=
mountpoints,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **e=
rrp)<br>
-{<br>
-=C2=A0 =C2=A0 int ret =3D 0, i =3D 0;<br>
-=C2=A0 =C2=A0 strList *list;<br>
-=C2=A0 =C2=A0 FsMountList mounts;<br>
-=C2=A0 =C2=A0 struct FsMount *mount;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 int fd;<br>
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
-=C2=A0 =C2=A0 QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* To issue fsfreeze in the reverse order of m=
ounts, check if the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mount is listed in the list here */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (has_mountpoints) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (list =3D mountpoints; list;=
 list =3D list-&gt;next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(list-&g=
t;value, mount-&gt;dirname) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!list) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;failed to open %s&quot;, mount-&gt;dirname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we try to cull filesystems we know won&#39;=
t work in advance, but other<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implement fsfreeze=
 for less obvious reasons.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these will report EOPNOTSUPP. we simpl=
y ignore these when tallying<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the number of frozen filesystems.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if a filesystem is mounted more than o=
nce (aka bind mount) a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* consecutive attempt to freeze an alrea=
dy frozen filesystem will<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return EBUSY.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any other error means a failure to fre=
eze a filesystem we<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* expect to be freezable, so return an e=
rror in those cases<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and return system to thawed state.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FIFREEZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EOPNOTSUPP &amp;&=
amp; errno !=3D EBUSY) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;failed to freeze %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount-&gt;dirname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-=C2=A0 =C2=A0 /* We may not issue any FIFREEZE here.<br>
-=C2=A0 =C2=A0 =C2=A0* Just unset ga_state here and ready for the next call=
.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (i =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return i;<br>
-<br>
-error:<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-=C2=A0 =C2=A0 qmp_guest_fsfreeze_thaw(NULL);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-<br>
-/*<br>
- * Walk list of frozen file systems in the guest, and thaw them.<br>
- */<br>
-int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int ret;<br>
-=C2=A0 =C2=A0 FsMountList mounts;<br>
-=C2=A0 =C2=A0 FsMount *mount;<br>
-=C2=A0 =C2=A0 int fd, i =3D 0, logged;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
-=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, &amp;local_err)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we have no way of knowing whether a filesys=
tem was actually unfrozen<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as a result of a successful call to FI=
THAW, only that if an error<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was returned the filesystem was *not* =
unfrozen by that particular<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* call.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since multiple preceding FIFREEZEs req=
uire multiple calls to FITHAW<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to unfreeze, continuing issuing FITHAW=
 until an error is returned,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in which case either the filesystem is=
 in an unfreezable state, or,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* more likely, it was thawed previously =
(and remains so afterward).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* also, since the most recent successful=
 call is the one that did<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the actual unfreeze, we can use this t=
o provide an accurate count<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the number of filesystems unfrozen =
by guest-fsfreeze-thaw, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may * be useful for determining whethe=
r a filesystem was unfrozen<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* during the freeze/thaw phase by a proc=
ess other than qemu-ga.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FITHAW);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0 &amp;&amp; !log=
ged) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D true;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (ret =3D=3D 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 ga_unset_frozen(ga_state);<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-<br>
-=C2=A0 =C2=A0 execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);<br>
-<br>
-=C2=A0 =C2=A0 return i;<br>
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
-#endif /* CONFIG_FSFREEZE */<br>
-<br>
-#if defined(CONFIG_FSTRIM)<br>
-/*<br>
- * Walk list of mounted file systems in the guest, and trim them.<br>
- */<br>
-GuestFilesystemTrimResponse *<br>
-qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestFilesystemTrimResponse *response;<br>
-=C2=A0 =C2=A0 GuestFilesystemTrimResult *result;<br>
-=C2=A0 =C2=A0 int ret =3D 0;<br>
-=C2=A0 =C2=A0 FsMountList mounts;<br>
-=C2=A0 =C2=A0 struct FsMount *mount;<br>
-=C2=A0 =C2=A0 int fd;<br>
-=C2=A0 =C2=A0 struct fstrim_range r;<br>
-<br>
-=C2=A0 =C2=A0 slog(&quot;guest-fstrim called&quot;);<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
-=C2=A0 =C2=A0 if (!build_fs_mount_list(&amp;mounts, errp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 response =3D g_malloc0(sizeof(*response));<br>
-<br>
-=C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;path =3D g_strdup(mount-&gt;dirname=
);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(response-&gt;paths, result);=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qga_open_cloexec(mount-&gt;dirname, O_R=
DONLY, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup_pr=
intf(&quot;failed to open: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We try to cull filesystems we know won&#39;=
t work in advance, but other<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* filesystems may not implement fstrim f=
or less obvious reasons.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* These will report EOPNOTSUPP; while in=
 some other cases ENOTTY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will be reported (e.g. CD-ROMs).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Any other error means an unexpected er=
ror.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.start =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.len =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r.minlen =3D has_minimum ? minimum : 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FITRIM, &amp;r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOTTY || errno=
 =3D=3D EOPNOTSUPP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup(&quot;trim not supported&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =
=3D g_strdup_printf(&quot;failed to trim: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_minimum =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;minimum =3D r.minlen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_trimmed =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;trimmed =3D r.len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 free_fs_mount_list(&amp;mounts);<br>
-=C2=A0 =C2=A0 return response;<br>
-}<br>
-#endif /* CONFIG_FSTRIM */<br>
-<br>
-<br>
-#define LINUX_SYS_STATE_FILE &quot;/sys/power/state&quot;<br>
-#define SUSPEND_SUPPORTED 0<br>
-#define SUSPEND_NOT_SUPPORTED 1<br>
-<br>
-typedef enum {<br>
-=C2=A0 =C2=A0 SUSPEND_MODE_DISK =3D 0,<br>
-=C2=A0 =C2=A0 SUSPEND_MODE_RAM =3D 1,<br>
-=C2=A0 =C2=A0 SUSPEND_MODE_HYBRID =3D 2,<br>
-} SuspendMode;<br>
-<br>
-/*<br>
- * Executes a command in a child process using g_spawn_sync,<br>
- * returning an int &gt;=3D 0 representing the exit status of the<br>
- * process.<br>
- *<br>
- * If the program wasn&#39;t found in path, returns -1.<br>
- *<br>
- * If a problem happened when creating the child process,<br>
- * returns -1 and errp is set.<br>
- */<br>
-static int run_process_child(const char *command[], Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int exit_status, spawn_flag;<br>
-=C2=A0 =C2=A0 GError *g_err =3D NULL;<br>
-=C2=A0 =C2=A0 bool success;<br>
-<br>
-=C2=A0 =C2=A0 spawn_flag =3D G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_N=
ULL |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_SPAWN_STDE=
RR_TO_DEV_NULL;<br>
-<br>
-=C2=A0 =C2=A0 success =3D=C2=A0 g_spawn_sync(NULL, (char **)command, NULL,=
 spawn_flag,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, NULL, NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;exit_status, &amp;g_err);<br>
-<br>
-=C2=A0 =C2=A0 if (success) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return WEXITSTATUS(exit_status);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (g_err &amp;&amp; (g_err-&gt;code !=3D G_SPAWN_ERROR_NOEN=
T)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to create child =
process, error &#39;%s&#39;&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_err=
-&gt;message);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 g_error_free(g_err);<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-<br>
-static bool systemd_supports_mode(SuspendMode mode, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 const char *systemctl_args[3] =3D {&quot;systemd-hibernate&q=
uot;, &quot;systemd-suspend&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;systemd-hy=
brid-sleep&quot;};<br>
-=C2=A0 =C2=A0 const char *cmd[4] =3D {&quot;systemctl&quot;, &quot;status&=
quot;, systemctl_args[mode], NULL};<br>
-=C2=A0 =C2=A0 int status;<br>
-<br>
-=C2=A0 =C2=A0 status =3D run_process_child(cmd, errp);<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* systemctl status uses LSB return codes so we can exp=
ect<br>
-=C2=A0 =C2=A0 =C2=A0* status &gt; 0 and be ok. To assert if the guest has =
support<br>
-=C2=A0 =C2=A0 =C2=A0* for the selected suspend mode, status should be &lt;=
 4. 4 is<br>
-=C2=A0 =C2=A0 =C2=A0* the code for unknown service status, the return valu=
e when<br>
-=C2=A0 =C2=A0 =C2=A0* the service does not exist. A common value is status=
 =3D 3<br>
-=C2=A0 =C2=A0 =C2=A0* (program is not running).<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (status &gt; 0 &amp;&amp; status &lt; 4) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return false;<br>
-}<br>
-<br>
-static void systemd_suspend(SuspendMode mode, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 const char *systemctl_args[3] =3D {&quot;hibernate&quot;, &q=
uot;suspend&quot;, &quot;hybrid-sleep&quot;};<br>
-=C2=A0 =C2=A0 const char *cmd[3] =3D {&quot;systemctl&quot;, systemctl_arg=
s[mode], NULL};<br>
-=C2=A0 =C2=A0 int status;<br>
-<br>
-=C2=A0 =C2=A0 status =3D run_process_child(cmd, &amp;local_err);<br>
-<br>
-=C2=A0 =C2=A0 if (status =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if ((status =3D=3D -1) &amp;&amp; !local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;the helper program &#39=
;systemctl %s&#39; was not found&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syste=
mctl_args[mode]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;the helper program &#39=
;systemctl %s&#39; returned an &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;unexpected exit status code (%d)&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syste=
mctl_args[mode], status);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static bool pmutils_supports_mode(SuspendMode mode, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 const char *pmutils_args[3] =3D {&quot;--hibernate&quot;, &q=
uot;--suspend&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--suspend-hybrid&=
quot;};<br>
-=C2=A0 =C2=A0 const char *cmd[3] =3D {&quot;pm-is-supported&quot;, pmutils=
_args[mode], NULL};<br>
-=C2=A0 =C2=A0 int status;<br>
-<br>
-=C2=A0 =C2=A0 status =3D run_process_child(cmd, &amp;local_err);<br>
-<br>
-=C2=A0 =C2=A0 if (status =3D=3D SUSPEND_SUPPORTED) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if ((status =3D=3D -1) &amp;&amp; !local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;the helper program &#39;%s&#39; returned an unexpected exit&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
; status code (%d)&quot;, &quot;pm-is-supported&quot;, status);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return false;<br>
-}<br>
-<br>
-static void pmutils_suspend(SuspendMode mode, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 const char *pmutils_binaries[3] =3D {&quot;pm-hibernate&quot=
;, &quot;pm-suspend&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pm-=
suspend-hybrid&quot;};<br>
-=C2=A0 =C2=A0 const char *cmd[2] =3D {pmutils_binaries[mode], NULL};<br>
-=C2=A0 =C2=A0 int status;<br>
-<br>
-=C2=A0 =C2=A0 status =3D run_process_child(cmd, &amp;local_err);<br>
-<br>
-=C2=A0 =C2=A0 if (status =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if ((status =3D=3D -1) &amp;&amp; !local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;the helper program &#39=
;%s&#39; was not found&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmuti=
ls_binaries[mode]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;the helper program &#39;%s&#39; returned an unexpected exit&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
; status code (%d)&quot;, pmutils_binaries[mode], status);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static bool linux_sys_state_supports_mode(SuspendMode mode, Error **errp)<=
br>
-{<br>
-=C2=A0 =C2=A0 const char *sysfile_strs[3] =3D {&quot;disk&quot;, &quot;mem=
&quot;, NULL};<br>
-=C2=A0 =C2=A0 const char *sysfile_str =3D sysfile_strs[mode];<br>
-=C2=A0 =C2=A0 char buf[32]; /* hopefully big enough */<br>
-=C2=A0 =C2=A0 int fd;<br>
-=C2=A0 =C2=A0 ssize_t ret;<br>
-<br>
-=C2=A0 =C2=A0 if (!sysfile_str) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;unknown guest suspend m=
ode&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 fd =3D open(LINUX_SYS_STATE_FILE, O_RDONLY);<br>
-=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 ret =3D read(fd, buf, sizeof(buf) - 1);<br>
-=C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 if (ret &lt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 buf[ret] =3D &#39;\0&#39;;<br>
-<br>
-=C2=A0 =C2=A0 if (strstr(buf, sysfile_str)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return false;<br>
-}<br>
-<br>
-static void linux_sys_state_suspend(SuspendMode mode, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 const char *sysfile_strs[3] =3D {&quot;disk&quot;, &quot;mem=
&quot;, NULL};<br>
-=C2=A0 =C2=A0 const char *sysfile_str =3D sysfile_strs[mode];<br>
-=C2=A0 =C2=A0 pid_t pid;<br>
-=C2=A0 =C2=A0 int status;<br>
-<br>
-=C2=A0 =C2=A0 if (!sysfile_str) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;unknown guest suspend m=
ode&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 pid =3D fork();<br>
-=C2=A0 =C2=A0 if (!pid) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* child */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setsid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 reopen_fd_to_null(2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open(LINUX_SYS_STATE_FILE, O_WRONLY);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (write(fd, sysfile_str, strlen(sysfile_str)=
) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_FAILURE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(EXIT_SUCCESS);<br>
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
-=C2=A0 =C2=A0 if (WEXITSTATUS(status)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;child process has faile=
d to suspend&quot;);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-}<br>
-<br>
-static void guest_suspend(SuspendMode mode, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 bool mode_supported =3D false;<br>
-<br>
-=C2=A0 =C2=A0 if (systemd_supports_mode(mode, &amp;local_err)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_supported =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_suspend(mode, &amp;local_err);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 error_free(local_err);<br>
-=C2=A0 =C2=A0 local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 if (pmutils_supports_mode(mode, &amp;local_err)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_supported =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmutils_suspend(mode, &amp;local_err);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 error_free(local_err);<br>
-=C2=A0 =C2=A0 local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 if (linux_sys_state_supports_mode(mode, &amp;local_err)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_supported =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_sys_state_suspend(mode, &amp;local_err);=
<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!mode_supported) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;the requested suspend mode is not supported by the guest&quot;);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-void qmp_guest_suspend_disk(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 guest_suspend(SUSPEND_MODE_DISK, errp);<br>
-}<br>
-<br>
-void qmp_guest_suspend_ram(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 guest_suspend(SUSPEND_MODE_RAM, errp);<br>
-}<br>
-<br>
-void qmp_guest_suspend_hybrid(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 guest_suspend(SUSPEND_MODE_HYBRID, errp);<br>
-}<br>
-<br>
-/* Transfer online/offline status between @vcpu and the guest system.<br>
- *<br>
- * On input either @errp or *@errp must be NULL.<br>
- *<br>
- * In system-to-@vcpu direction, the following @vcpu fields are accessed:<=
br>
- * - R: vcpu-&gt;logical_id<br>
- * - W: vcpu-&gt;online<br>
- * - W: vcpu-&gt;can_offline<br>
- *<br>
- * In @vcpu-to-system direction, the following @vcpu fields are accessed:<=
br>
- * - R: vcpu-&gt;logical_id<br>
- * - R: vcpu-&gt;online<br>
- *<br>
- * Written members remain unmodified on error.<br>
- */<br>
-static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 char *dirpath, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int fd;<br>
-=C2=A0 =C2=A0 int res;<br>
-=C2=A0 =C2=A0 int dirfd;<br>
-=C2=A0 =C2=A0 static const char fn[] =3D &quot;online&quot;;<br>
-<br>
-=C2=A0 =C2=A0 dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
-=C2=A0 =C2=A0 if (dirfd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);<br>
-=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s/%s\&quot;)&quot;, dirpath, fn);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (sys2vcpu) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;online =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;can_offline =3D false;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!vcpu-&gt;online) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;logical p=
rocessor #%&quot; PRId64 &quot; can&#39;t be &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;offlined&quot;, vcpu-&gt;logical_id);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } /* otherwise pretend successful re-onlining =
*/<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char status;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D pread(fd, &amp;status, 1, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;pread(\&quot;%s/%s\&quot;)&quot;, dirpath, fn);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (res =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;pread(\&q=
uot;%s/%s\&quot;): unexpected EOF&quot;, dirpath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fn);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (sys2vcpu) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;online =3D (status !=3D=
 &#39;0&#39;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;can_offline =3D true;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (vcpu-&gt;online !=3D (status !=3D &=
#39;0&#39;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &#39;0&#39; + vcpu-&g=
t;online;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pwrite(fd, &amp;status, 1, 0=
) =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;pwrite(\&quot;%s/%s\&quot;)&quot;, dirpath,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } /* otherwise pretend successful re-(on|off)-=
lining */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(res =3D=3D 0);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 res =3D close(dirfd);<br>
-=C2=A0 =C2=A0 g_assert(res =3D=3D 0);<br>
-}<br>
-<br>
-GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestLogicalProcessorList *head, **tail;<br>
-=C2=A0 =C2=A0 const char *cpu_dir =3D &quot;/sys/devices/system/cpu&quot;;=
<br>
-=C2=A0 =C2=A0 const gchar *line;<br>
-=C2=A0 =C2=A0 g_autoptr(GDir) cpu_gdir =3D NULL;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 head =3D NULL;<br>
-=C2=A0 =C2=A0 tail =3D &amp;head;<br>
-=C2=A0 =C2=A0 cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);<br>
-<br>
-=C2=A0 =C2=A0 if (cpu_gdir =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
list entries: %s&quot;, cpu_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; (line =3D g_dir_read=
_name(cpu_gdir)) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLogicalProcessor *vcpu;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t id;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(line, &quot;cpu%&quot; PRId64, &amp=
;id)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *path =3D g_strd=
up_printf(&quot;/sys/devices/system/cpu/&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cpu%&quot; PRId64 &quot;/&quot;, i=
d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu =3D g_malloc0(sizeof *vcpu)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;logical_id =3D id;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu-&gt;has_can_offline =3D tru=
e; /* lolspeak ftw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_vcpu(vcpu, true, path, =
&amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, vcpu);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (local_err =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* there&#39;s no guest with zero VCPUs */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(head !=3D NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return head;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 qapi_free_GuestLogicalProcessorList(head);<br>
-=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp=
)<br>
-{<br>
-=C2=A0 =C2=A0 int64_t processed;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 processed =3D 0;<br>
-=C2=A0 =C2=A0 while (vcpus !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path =3D g_strdup_printf(&quot;/sys/devi=
ces/system/cpu/cpu%&quot; PRId64 &quot;/&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpus-&gt;value-=
&gt;logical_id);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_vcpu(vcpus-&gt;value, false, path, &a=
mp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++processed;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpus =3D vcpus-&gt;next;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (processed =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return processed;<br>
-}<br>
-<br>
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
-static void ga_read_sysfs_file(int dirfd, const char *pathname, char *buf,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int size, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int fd;<br>
-=C2=A0 =C2=A0 int res;<br>
-<br>
-=C2=A0 =C2=A0 errno =3D 0;<br>
-=C2=A0 =C2=A0 fd =3D openat(dirfd, pathname, O_RDONLY);<br>
-=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open sysfs=
 file \&quot;%s\&quot;&quot;, pathname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 res =3D pread(fd, buf, size, 0);<br>
-=C2=A0 =C2=A0 if (res =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;pread sysf=
s file \&quot;%s\&quot;&quot;, pathname);<br>
-=C2=A0 =C2=A0 } else if (res =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;pread sysfs file \&quot=
;%s\&quot;: unexpected EOF&quot;, pathname);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 close(fd);<br>
-}<br>
-<br>
-static void ga_write_sysfs_file(int dirfd, const char *pathname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf, int size, Error **e=
rrp)<br>
-{<br>
-=C2=A0 =C2=A0 int fd;<br>
-<br>
-=C2=A0 =C2=A0 errno =3D 0;<br>
-=C2=A0 =C2=A0 fd =3D openat(dirfd, pathname, O_WRONLY);<br>
-=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open sysfs=
 file \&quot;%s\&quot;&quot;, pathname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (pwrite(fd, buf, size, 0) =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;pwrite sys=
fs file \&quot;%s\&quot;&quot;, pathname);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 close(fd);<br>
-}<br>
-<br>
-/* Transfer online/offline status between @mem_blk and the guest system.<b=
r>
- *<br>
- * On input either @errp or *@errp must be NULL.<br>
- *<br>
- * In system-to-@mem_blk direction, the following @mem_blk fields are acce=
ssed:<br>
- * - R: mem_blk-&gt;phys_index<br>
- * - W: mem_blk-&gt;online<br>
- * - W: mem_blk-&gt;can_offline<br>
- *<br>
- * In @mem_blk-to-system direction, the following @mem_blk fields are acce=
ssed:<br>
- * - R: mem_blk-&gt;phys_index<br>
- * - R: mem_blk-&gt;online<br>
- *-=C2=A0 R: mem_blk-&gt;can_offline<br>
- * Written members remain unmodified on error.<br>
- */<br>
-static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memb=
lk,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlockResponse *res=
ult,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 char *dirpath;<br>
-=C2=A0 =C2=A0 int dirfd;<br>
-=C2=A0 =C2=A0 char *status;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 if (!sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 DIR *dp;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!result) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Internal =
error, &#39;result&#39; should not be NULL&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dp =3D opendir(&quot;/sys/devices/system/memor=
y/&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if there is no &#39;memory&#39; direc=
tory in sysfs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we think this VM does not support onli=
ne/offline memory block,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any other solution?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 closedir(dp);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 dirpath =3D g_strdup_printf(&quot;/sys/devices/system/memory=
/memory%&quot; PRId64 &quot;/&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;phys_index);<br>
-=C2=A0 =C2=A0 dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
-=C2=A0 =C2=A0 if (dirfd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s\&quot;)&quot;, dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out1;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 g_free(dirpath);<br>
-<br>
-=C2=A0 =C2=A0 status =3D g_malloc0(10);<br>
-=C2=A0 =C2=A0 ga_read_sysfs_file(dirfd, &quot;state&quot;, status, 10, &am=
p;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* treat with sysfs file that not exist in old=
 kernel */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;online=
 =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;can_of=
fline =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!mem_blk-&gt;online) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out2;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char removable =3D &#39;0&#39;;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;online =3D (strncmp(status, &quot;=
online&quot;, 6) =3D=3D 0);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_read_sysfs_file(dirfd, &quot;removable&quot=
;, &amp;removable, 1, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if no &#39;removable&#39; fil=
e, it doesn&#39;t support offline mem blk */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;can_of=
fline =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;can_offline =3D (rem=
ovable !=3D &#39;0&#39;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mem_blk-&gt;online !=3D (strncmp(status, &=
quot;online&quot;, 6) =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *new_state =3D mem_bl=
k-&gt;online ? &quot;online&quot; : &quot;offline&quot;;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_write_sysfs_file(dirfd, &quot=
;state&quot;, new_state, strlen(new_state),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(local_e=
rr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;respons=
e =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUES=
T_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;response =3D GUEST_ME=
MORY_BLOCK_RESPONSE_TYPE_SUCCESS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error_code =3D fa=
lse;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } /* otherwise pretend successful re-(on|off)-=
lining */<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 g_free(status);<br>
-=C2=A0 =C2=A0 close(dirfd);<br>
-=C2=A0 =C2=A0 return;<br>
-<br>
-out2:<br>
-=C2=A0 =C2=A0 g_free(status);<br>
-=C2=A0 =C2=A0 close(dirfd);<br>
-out1:<br>
-=C2=A0 =C2=A0 if (!sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error_code =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error_code =3D errno;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestMemoryBlockList *head, **tail;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 struct dirent *de;<br>
-=C2=A0 =C2=A0 DIR *dp;<br>
-<br>
-=C2=A0 =C2=A0 head =3D NULL;<br>
-=C2=A0 =C2=A0 tail =3D &amp;head;<br>
-<br>
-=C2=A0 =C2=A0 dp =3D opendir(&quot;/sys/devices/system/memory/&quot;);<br>
-=C2=A0 =C2=A0 if (!dp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* it&#39;s ok if this happens to be a system =
that doesn&#39;t expose<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* memory blocks via sysfs, but otherwise=
 we should report<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* an error<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;Can&#39;t open directory&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\&quot;/sys/devices/system/memory/\&qu=
ot;&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Note: the phys_index of memory block may be discontinuous=
,<br>
-=C2=A0 =C2=A0 =C2=A0* this is because a memblk is the unit of the Sparse M=
emory design, which<br>
-=C2=A0 =C2=A0 =C2=A0* allows discontinuous memory ranges (ex. NUMA), so he=
re we should<br>
-=C2=A0 =C2=A0 =C2=A0* traverse the memory block directory.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 while ((de =3D readdir(dp)) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlock *mem_blk;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((strncmp(de-&gt;d_name, &quot;memory&quot;=
, 6) !=3D 0) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(de-&gt;d_type &amp; DT_DIR)) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk =3D g_malloc0(sizeof *mem_blk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The d_name is &quot;memoryXXX&quot;,=C2=A0 =
phys_index is block id, same as XXX */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;phys_index =3D strtoul(&amp;de-&gt=
;d_name[6], NULL, 10);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blk-&gt;has_can_offline =3D true; /* lolsp=
eak ftw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_memory_block(mem_blk, true, NULL, &am=
p;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, mem_blk);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 closedir(dp);<br>
-=C2=A0 =C2=A0 if (local_err =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* there&#39;s no guest with zero memory block=
s */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (head =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;guest rep=
orted zero memory blocks!&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return head;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 qapi_free_GuestMemoryBlockList(head);<br>
-=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-GuestMemoryBlockResponseList *<br>
-qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)<=
br>
-{<br>
-=C2=A0 =C2=A0 GuestMemoryBlockResponseList *head, **tail;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 head =3D NULL;<br>
-=C2=A0 =C2=A0 tail =3D &amp;head;<br>
-<br>
-=C2=A0 =C2=A0 while (mem_blks !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlockResponse *result;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestMemoryBlock *current_mem_blk =3D mem_blks=
-&gt;value;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;phys_index =3D current_mem_blk-&gt;=
phys_index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 transfer_memory_block(current_mem_blk, false, =
result, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) { /* should never happen */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, result);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_blks =3D mem_blks-&gt;next;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return head;<br>
-err:<br>
-=C2=A0 =C2=A0 qapi_free_GuestMemoryBlockResponseList(head);<br>
-=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 return NULL;<br>
-}<br>
-<br>
-GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
-=C2=A0 =C2=A0 char *dirpath;<br>
-=C2=A0 =C2=A0 int dirfd;<br>
-=C2=A0 =C2=A0 char *buf;<br>
-=C2=A0 =C2=A0 GuestMemoryBlockInfo *info;<br>
-<br>
-=C2=A0 =C2=A0 dirpath =3D g_strdup_printf(&quot;/sys/devices/system/memory=
/&quot;);<br>
-=C2=A0 =C2=A0 dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
-=C2=A0 =C2=A0 if (dirfd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(dirpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 g_free(dirpath);<br>
-<br>
-=C2=A0 =C2=A0 buf =3D g_malloc0(20);<br>
-=C2=A0 =C2=A0 ga_read_sysfs_file(dirfd, &quot;block_size_bytes&quot;, buf,=
 20, &amp;local_err);<br>
-=C2=A0 =C2=A0 close(dirfd);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 info =3D g_new0(GuestMemoryBlockInfo, 1);<br>
-=C2=A0 =C2=A0 info-&gt;size =3D strtol(buf, NULL, 16); /* the unit is byte=
s */<br>
-<br>
-=C2=A0 =C2=A0 g_free(buf);<br>
-<br>
-=C2=A0 =C2=A0 return info;<br>
-}<br>
-<br>
-#define MAX_NAME_LEN 128<br>
-static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)<br>
-{<br>
-#ifdef CONFIG_LINUX<br>
-=C2=A0 =C2=A0 GuestDiskStatsInfoList *head =3D NULL, **tail =3D &amp;head;=
<br>
-=C2=A0 =C2=A0 const char *diskstats =3D &quot;/proc/diskstats&quot;;<br>
-=C2=A0 =C2=A0 FILE *fp;<br>
-=C2=A0 =C2=A0 size_t n;<br>
-=C2=A0 =C2=A0 char *line =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 fp =3D fopen(diskstats, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, diskstats);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree GuestDiskStatsInfo *diskstatinfo =
=3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree GuestDiskStats *diskstat =3D NULL;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char dev_name[MAX_NAME_LEN];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int ios_pgr, tot_ticks, rq_ticks, wr_=
ticks, dc_ticks, fl_ticks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long rd_ios, rd_merges_or_rd_sec, rd_=
ticks_or_wr_sec, wr_ios;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long wr_merges, rd_sec_or_wr_ios, wr_=
sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long dc_ios, dc_merges, dc_sec, fl_io=
s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int major, minor;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%u %u %s %lu %lu %lu&=
quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %lu %u %u %u %u&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %u %lu %u&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
major, &amp;minor, dev_name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
rd_ios, &amp;rd_merges_or_rd_sec, &amp;rd_sec_or_wr_ios,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
rd_ticks_or_wr_sec, &amp;wr_ios, &amp;wr_merges, &amp;wr_sec,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
wr_ticks, &amp;ios_pgr, &amp;tot_ticks, &amp;rq_ticks,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
dc_ios, &amp;dc_merges, &amp;dc_sec, &amp;dc_ticks,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
fl_ios, &amp;fl_ticks);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 7) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;name =3D g_strdup(dev_name);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;major =3D major;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;minor =3D minor;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat =3D g_new0(GuestDiskStats, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 7) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ios =3D tr=
ue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_sectors =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_merges_or_rd_sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ios =3D t=
rue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D rd_se=
c_or_wr_ios;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_sectors =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D r=
d_ticks_or_wr_sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 14) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ios =3D tr=
ue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_sectors =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_sec_or_wr_ios;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_merges =3D=
 true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_merges =3D rd_=
merges_or_rd_sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ticks =3D =
true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ticks =3D rd_t=
icks_or_wr_sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ios =3D t=
rue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D wr_io=
s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_sectors =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D w=
r_sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_merges =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_merges =3D wr=
_merges;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ticks =3D=
 true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ticks =3D wr_=
ticks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_ios_pgr =3D tru=
e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;ios_pgr =3D ios_pgr=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_total_ticks =3D=
 true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;total_ticks =3D tot=
_ticks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_weight_ticks =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;weight_ticks =3D rq=
_ticks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 18) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_ios =3D=
 true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ios =3D dc_=
ios;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_merges =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_merges =3D =
dc_merges;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_sectors=
 =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_sectors =3D=
 dc_sec;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_ticks =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ticks =3D d=
c_ticks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 20) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_flush_ios =3D t=
rue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ios =3D fl_io=
s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_flush_ticks =3D=
 true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ticks =3D fl_=
ticks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;stats =3D g_steal_pointer(&am=
p;diskstat);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, diskstatinfo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D NULL;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 free(line);<br>
-=C2=A0 =C2=A0 fclose(fp);<br>
-=C2=A0 =C2=A0 return head;<br>
-#else<br>
-=C2=A0 =C2=A0 g_debug(&quot;disk stats reporting available only for Linux&=
quot;);<br>
-=C2=A0 =C2=A0 return NULL;<br>
-#endif<br>
-}<br>
-<br>
-GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 return guest_get_diskstats(errp);<br>
-}<br>
-<br>
-GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 GuestCpuStatsList *head =3D NULL, **tail =3D &amp;head;<br>
-=C2=A0 =C2=A0 const char *cpustats =3D &quot;/proc/stat&quot;;<br>
-=C2=A0 =C2=A0 int clk_tck =3D sysconf(_SC_CLK_TCK);<br>
-=C2=A0 =C2=A0 FILE *fp;<br>
-=C2=A0 =C2=A0 size_t n;<br>
-=C2=A0 =C2=A0 char *line =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 fp =3D fopen(cpustats, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, cpustats);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestCpuStats *cpustat =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLinuxCpuStats *linuxcpustat;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long user, system, idle, iowait, irq,=
 softirq, steal, guest;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long nice, guest_nice;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char name[64];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%s %lu %lu %lu %lu %l=
u %lu %lu %lu %lu %lu&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name,=
 &amp;user, &amp;nice, &amp;system, &amp;idle, &amp;iowait, &amp;irq, &amp;=
softirq,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
steal, &amp;guest, &amp;guest_nice);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* drop &quot;cpu 1 2 3 ...&quot;, get &quot;c=
puX 1 2 3 ...&quot; only */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((i =3D=3D EOF) || strncmp(name, &quot;cpu&=
quot;, 3) || (name[3] =3D=3D &#39;\0&#39;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 5) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;Parsing cpu stat from=
 %s failed, see \&quot;man proc\&quot;&quot;, cpustats);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat =3D g_new0(GuestCpuStats, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;type =3D GUEST_CPU_STATS_TYPE_LINU=
X;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat =3D &amp;cpustat-&gt;u.q_linux;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;cpu =3D atoi(&amp;name[3]);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;user =3D user * 1000 / clk_tc=
k;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;nice =3D nice * 1000 / clk_tc=
k;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;system =3D system * 1000 / cl=
k_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;idle =3D idle * 1000 / clk_tc=
k;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 5) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_iowait =3D =
true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;iowait =3D iowa=
it * 1000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 6) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_irq =3D tru=
e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;irq =3D irq * 1=
000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_softirq =3D=
 true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;softirq =3D sof=
tirq * 1000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 8) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_steal =3D t=
rue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;steal =3D steal=
 * 1000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 9) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guest =3D t=
rue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guest =3D guest=
 * 1000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 10) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guest =3D t=
rue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guest =3D guest=
 * 1000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guestnice =
=3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guestnice =3D g=
uest_nice * 1000 / clk_tck;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, cpustat);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 free(line);<br>
-=C2=A0 =C2=A0 fclose(fp);<br>
-=C2=A0 =C2=A0 return head;<br>
-}<br>
-<br>
-#else /* defined(__linux__) */<br>
+#if !defined(__linux__)<br>
<br>
=C2=A0void qmp_guest_suspend_disk(Error **errp)<br>
=C2=A0{<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 65c1e93846..409f49a000 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -72,6 +72,9 @@ qga_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(<=
br>
=C2=A0 =C2=A0&#39;commands-posix.c&#39;,<br>
=C2=A0 =C2=A0&#39;commands-posix-ssh.c&#39;,<br>
=C2=A0))<br>
+qga_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(<br>
+=C2=A0 &#39;commands-linux.c&#39;,<br>
+))<br>
=C2=A0qga_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;channel-win32.c&#39;,<br>
=C2=A0 =C2=A0&#39;commands-win32.c&#39;,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000093e49b05e9538fe8--

