Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2739E628E3F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:24:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinJ-0007P3-6z; Mon, 14 Nov 2022 18:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ouiep-0001X6-1C
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:30 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oucVm-0005lf-Oj
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=y/4ptXtJc6aafBvWP7KgPOS8GLtgtZ5IEVhRoHNv6yk=; b=wA18nIYebjOCymPT8URr9Z7HLf
 wAWw1/qxqibQkxNXqlcioIsDw089a69jbz8SBib/xaW94oDGQvOmHIrzlqO5lyD5UXSTkgqQKdSkT
 OlAvt5x8OysqCqvfjrXjTZZtY73w8Cu7xQvWwDZfv0XO6vK1/gBQwWWj0zXFOFnPv9tA7Z89cqUl2
 yCYaFJSrJSfDrkGtRZLFTn+u6oM2nT23rvd1MBxPVHJlv/709mm5SVNTYl0nGcdjj6HxWpn8Ad3by
 i6x/tKBHxR7UYTK2F0ehS790yggBTy+1Aalhj8ntOX0riRSJAk45eOiAqFDIc5PGaQs8SZZskFAmT
 s2sOE9fEWytw+L6K0RIVBcTlVIUVUzCF6elqhIFFhDe74+ArmNMh93ocVh1liPLtM72lKW/wJCv1p
 zlKmo4Q9WvJfjC838b48VJw/oT5/C4NrrPi02cpBAfURDxlncx1Z+ZG5RAyaUw9lqK2BQwpwpdvzX
 ODBSp9wndrhWSHoR/S7jU4nT/9fI+lUtnQuL0gq5mldMDeWgQu0v4FB1uc2sAYQ4WY3eKIORR7uMB
 wmiONNqzl6rsYKAYGw+xIBlMiIN0emfGjDDaBV79FxisPcIwTg/1A3/Nulf8XYuMgRmtRuPylm5uW
 6/gJsHIdUWcU0nfuGWqRj36YARRluXRkfgtTEYD/k=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>, Greg Kurz <groug@kaod.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v2 06/19] hw/9pfs: Add missing definitions for Windows
Date: Mon, 14 Nov 2022 17:40:36 +0100
Message-ID: <6443328.Q0H0RdsSbn@silver>
In-Reply-To: <20221111042225.1115931-7-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-7-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, November 11, 2022 5:22:12 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Some definitions currently used by the 9pfs codes are only available
> on POSIX platforms. Let's add our own ones in preparation to adding
> 9pfs support for Windows.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - Add S_IFLNK related macros to support symbolic link
> 
>  fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
>  hw/9pfs/9p.h       | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 4997677460..7d9a736b66 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -27,6 +27,39 @@
>  # include <sys/mount.h>
>  #endif
>  
> +#ifdef CONFIG_WIN32
> +
> +/* POSIX structure not defined in Windows */
> +
> +typedef uint32_t uid_t;
> +typedef uint32_t gid_t;
> +
> +/* from http://man7.org/linux/man-pages/man2/statfs.2.html */
> +typedef uint32_t __fsword_t;
> +typedef uint32_t fsblkcnt_t;
> +typedef uint32_t fsfilcnt_t;
> +
> +/* from linux/include/uapi/asm-generic/posix_types.h */
> +typedef struct {
> +    long __val[2];
> +} fsid_t;
> +
> +struct statfs {
> +    __fsword_t f_type;
> +    __fsword_t f_bsize;
> +    fsblkcnt_t f_blocks;
> +    fsblkcnt_t f_bfree;
> +    fsblkcnt_t f_bavail;
> +    fsfilcnt_t f_files;
> +    fsfilcnt_t f_ffree;
> +    fsid_t f_fsid;
> +    __fsword_t f_namelen;
> +    __fsword_t f_frsize;
> +    __fsword_t f_flags;
> +};
> +

Does it make sense to define all of these, even though not being used?

> +#endif /* CONFIG_WIN32 */
> +
>  #define SM_LOCAL_MODE_BITS    0600
>  #define SM_LOCAL_DIR_MODE_BITS    0700
>  
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 2fce4140d1..957a7e4ccc 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -3,13 +3,46 @@
>  
>  #include <dirent.h>
>  #include <utime.h>
> +#ifndef CONFIG_WIN32
>  #include <sys/resource.h>
> +#endif
>  #include "fsdev/file-op-9p.h"
>  #include "fsdev/9p-iov-marshal.h"
>  #include "qemu/thread.h"
>  #include "qemu/coroutine.h"
>  #include "qemu/qht.h"
>  
> +#ifdef CONFIG_WIN32
> +
> +#define NAME_MAX            MAX_PATH

That's not quite the same. MAX_PATH on Windows corresponds to PATH_MAX on
POSIX, which is the max. length of an entire path (i.e. drive, multiple
directory names, filename, backslashes). AFAICS MAX_PATH is 260 on Windows.

The max. length of a single filename component OTOH is 255 on Windows by
default. I don't know if there is a macro for the latter, if not, maybe
just hard coding it here for now?

> +
> +/* macros required for build, values do not matter */
> +#define AT_SYMLINK_NOFOLLOW 0x100   /* Do not follow symbolic links */
> +#define AT_REMOVEDIR        0x200   /* Remove directory instead of file */
> +#define O_DIRECTORY         02000000
> +
> +#define makedev(major, minor)   \
> +        ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
> +#define major(dev)  ((unsigned int)(((dev) >> 8) & 0xfff))
> +#define minor(dev)  ((unsigned int)(((dev) & 0xff)))
> +
> +#ifndef S_IFLNK
> +/*
> + * Currenlty Windows/MinGW does not provide the following flag macros,
> + * so define them here for 9p codes.
> + *
> + * Once Windows/MinGW provides them, remove the defines to prevent conflicts.
> + */
> +#define S_IFLNK         0xA000
> +#define S_ISUID         0x0800
> +#define S_ISGID         0x0400
> +#define S_ISVTX         0x0200
> +
> +#define S_ISLNK(mode)   ((mode & S_IFMT) == S_IFLNK)
> +#endif /* S_IFLNK */
> +
> +#endif /* CONFIG_WIN32 */
> +
>  enum {
>      P9_TLERROR = 6,
>      P9_RLERROR,
> 



