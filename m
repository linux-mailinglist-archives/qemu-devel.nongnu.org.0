Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D46161D4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:36:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC17-0001pW-6H; Wed, 02 Nov 2022 07:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oqC0w-0001mR-9x
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:34:34 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oqC0q-0001T3-Jo
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=q/sx5bTYxqf9AtNPcbv5fUE0Ewx8x41FcLS0dZINM98=; b=LmPyGjgzW4EzaEmjNuSh+Qeu70
 OoHg9S6yioY9TJ4+2rEthvArIHPFjq/hrrzvwqPg4tp+MjN0b40iT7B/QTTK4spIOxtxGR5BUuPPZ
 LbVnULsDbeq+JI+sP9ZWi2aIYVMuu4zW41Heb87VojPf3Gi/9EKSU5p26St/7Z0brhAeEGF33KzK3
 05J2KmEWpolgTgBsS2T3FIXJN4VkTAJ35sgaEx1BECIISiSQaZjwQSFsu8/6HkGql7b/dhDao+i0v
 tA7mo4Ic32y29xdo083dJNfWQqGuNgvCUdzpBx6d6l29/rp7PqGDjT2fy9SnfotACPnOpsa7x7Pj/
 iEJ/Ykir62JLhIbR/u/sjsboHNchoHSlg2m5PErRGq2bNfy/ID2rHA5eBCEXPS5nNtXeu4zE49Uv4
 oxBZslGBbnBnGOp4ThRIdZs/YEfkh6e0WVb4PY2f7ykQDDkA/Cb/jX+0fWozupb9XbzduhsZUWXRf
 SsF1r6M5N6Qw8Lbfpt3+bj7XLFsus2IV9+v/pAPupNMh3pTg55zKMc4BPi0l8E5kDKlQZGWiTUvUv
 LekytbTejeavurRtjt2ID24ZDaQ9z001OS1ejBAliJnAvpO88gjqEjIqVVtlORgiBRuHj2eDqLJ8v
 n6+2gWBGyp6KTQmjFTu03k8u87cRgJZ1O/E3xL2Z0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Date: Wed, 02 Nov 2022 12:34:24 +0100
Message-ID: <5228417.8yWHOg2it3@silver>
In-Reply-To: <MN2PR11MB4173529A71C30E89E4DAF743EF399@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <2052313.fat1d0ETzH@silver>
 <MN2PR11MB4173529A71C30E89E4DAF743EF399@MN2PR11MB4173.namprd11.prod.outlook.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wednesday, November 2, 2022 4:44:14 AM CET Shi, Guohuai wrote:
> 
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Wednesday, November 2, 2022 02:59
> > To: qemu-devel@nongnu.org
> > Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> > Guohuai <Guohuai.Shi@windriver.com>
> > Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features
> > for Windows
> > 
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > 
> > On Tuesday, November 1, 2022 4:34:54 PM CET Shi, Guohuai wrote:
> > >
> > > > -----Original Message-----
> > > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Sent: Tuesday, November 1, 2022 23:04
> > > > To: qemu-devel@nongnu.org
> > > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz
> > > > <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>
> > > > Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and
> > > > features for Windows
> > > >
> > > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > > >
> > > > On Monday, October 24, 2022 6:57:52 AM CET Bin Meng wrote:
> > > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > > >
> > > > > Some flags and features are not supported on Windows, like mknod,
> > > > > readlink, file mode, etc. Update the codes for Windows.
> > > > >
> > > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > ---
> > > > >
> > > > >  hw/9pfs/9p-util.h |  6 +++-
> > > > >  hw/9pfs/9p.c      | 90 ++++++++++++++++++++++++++++++++++++++++++-----
> > > > >  2 files changed, 86 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > > 82b2d0c3e4..3d154e9103 100644
> > > > > --- a/hw/9pfs/9p-util.h
> > > > > +++ b/hw/9pfs/9p-util.h
> > > > > @@ -53,8 +53,10 @@ static inline uint64_t makedev_dotl(uint32_t
> > > > > dev_major,
> > > > uint32_t dev_minor)
> > > > >   */
> > > > >  static inline uint64_t host_dev_to_dotl_dev(dev_t dev)  { -#ifdef
> > > > > CONFIG_LINUX
> > > > > +#if defined(CONFIG_LINUX)
> > > > >      return dev;
> > > > > +#elif defined(CONFIG_WIN32)
> > > > > +    return 0;
> > > >
> > > > Really?
> > >
> > > Check MS this document:
> > > https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/fsta
> > > t-fstat32-fstat64-fstati64-fstat32i64-fstat64i32?view=msvc-170
> > > st_rdev: If a device, fd; otherwise 0.
> > > st_dev: If a device, fd; otherwise 0.
> > >
> > > So for any file open, it should be 0.
> > 
> > Yeah, but that function translates a corresponding device ID for *Linux*
> > guest side. And the intention is to avoid e.g. file ID collisions on guest
> > side.
> > Because for a Linux guest, the two-tuple (device number, inode number) makes
> > a system-wide unique file ID.
> > 
> > If you just return zero here, that might be OK if only one 9p directory is
> > exported to guest, but say you have "C:\foo\" exported and "D:\bar\" exported
> > and mounted via 9p to guest, then guest would assume every file with the same
> > inode number on those two to be the same files. But they are not. They are on
> > two different drives actually.
> > 
> 
> Got it.
> Windows does not provide any numerical type ID for device, 
> I think the solution could be using driver letter ASC code "C:", "D:", etc.
> 
> > >
> > > >
> > > > >  #else
> > > > >      return makedev_dotl(major(dev), minor(dev));  #endif @@
> > > > > -260,7
> > > > > +262,9 @@ static inline struct dirent *qemu_dirent_dup(struct
> > > > > +dirent
> > > > > *dent)  #if defined CONFIG_DARWIN && defined
> > > > > CONFIG_PTHREAD_FCHDIR_NP int pthread_fchdir_np(int fd)
> > > > > __attribute__((weak_import));  #endif
> > > > > +#ifndef CONFIG_WIN32
> > > > >  int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode,
> > > > >                   dev_t dev);
> > > > > +#endif
> > > > >
> > > > >  #endif
> > > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index
> > > > > 6c4af86240..771aab34ac
> > > > > 100644
> > > > > --- a/hw/9pfs/9p.c
> > > > > +++ b/hw/9pfs/9p.c
> > > > > @@ -39,6 +39,11 @@
> > > > >  #include "qemu/xxhash.h"
> > > > >  #include <math.h>
> > > > >
> > > > > +#ifdef CONFIG_WIN32
> > > > > +#define UTIME_NOW   ((1l << 30) - 1l)
> > > > > +#define UTIME_OMIT  ((1l << 30) - 2l) #endif
> > > > > +
> > > > >  int open_fd_hw;
> > > > >  int total_open_fd;
> > > > >  static int open_fd_rc;
> > > > > @@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
> > > > >      DotlOpenflagMap dotl_oflag_map[] = {
> > > > >          { P9_DOTL_CREATE, O_CREAT },
> > > > >          { P9_DOTL_EXCL, O_EXCL },
> > > > > +#ifndef CONFIG_WIN32
> > > > >          { P9_DOTL_NOCTTY , O_NOCTTY },
> > > > > +#endif
> > > > >          { P9_DOTL_TRUNC, O_TRUNC },
> > > > >          { P9_DOTL_APPEND, O_APPEND },
> > > > > +#ifndef CONFIG_WIN32
> > > > >          { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
> > > > >          { P9_DOTL_DSYNC, O_DSYNC },
> > > > >          { P9_DOTL_FASYNC, FASYNC }, -#ifndef CONFIG_DARWIN
> > > > > +#endif
> > > > > +#ifdef CONFIG_LINUX
> > > >
> > > > Better
> > > >
> > > >    #if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
> > > >
> > >
> > > It is OK.
> > 
> > You got my point, hopefully:
> > 
> > > > Otherwise it might automatically opt-out other future platforms
> > > > unintentionally.
> > > >
> > > > >          { P9_DOTL_NOATIME, O_NOATIME },
> > > > >          /*
> > > > >           *  On Darwin, we could map to F_NOCACHE, which is @@
> > > > > -151,8
> > > > > +160,10 @@ static int dotl_to_open_flags(int flags)  #endif
> > > > >          { P9_DOTL_LARGEFILE, O_LARGEFILE },
> > > > >          { P9_DOTL_DIRECTORY, O_DIRECTORY },
> > > > > +#ifndef CONFIG_WIN32
> > > > >          { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
> > > > >          { P9_DOTL_SYNC, O_SYNC },
> > > > > +#endif
> > > > >      };
> > > > >
> > > > >      for (i = 0; i < ARRAY_SIZE(dotl_oflag_map); i++) { @@ -179,8
> > > > > +190,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
> > > > >       * Filter the client open flags
> > > > >       */
> > > > >      flags = dotl_to_open_flags(oflags);
> > > > > -    flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
> > > > > -#ifndef CONFIG_DARWIN
> > > > > +    flags &= ~(O_CREAT);
> > > > > +#ifndef CONFIG_WIN32
> > > > > +    flags &= ~(O_NOCTTY | O_ASYNC); #endif #ifdef CONFIG_LINUX
> > > >
> > > > Same as above: better explicitly opt-out than the other way around.
> > > >
> > >
> > > It is OK.
> > >
> > > > >      /*
> > > > >       * Ignore direct disk access hint until the server supports it.
> > > > >       */
> > > > > @@ -986,9 +1000,11 @@ static int stat_to_qid(V9fsPDU *pdu, const
> > > > > struct
> > > > stat *stbuf, V9fsQID *qidp)
> > > > >      if (S_ISDIR(stbuf->st_mode)) {
> > > > >          qidp->type |= P9_QID_TYPE_DIR;
> > > > >      }
> > > > > +#ifndef CONFIG_WIN32
> > > > >      if (S_ISLNK(stbuf->st_mode)) {
> > > > >          qidp->type |= P9_QID_TYPE_SYMLINK;
> > > > >      }
> > > > > +#endif
> > > > >
> > > > >      return 0;
> > > > >  }
> > > > > @@ -1097,6 +1113,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > > V9fsString *extension)
> > > > >          ret |= S_IFDIR;
> > > > >      }
> > > > >
> > > > > +#ifndef CONFIG_WIN32
> > > > >      if (mode & P9_STAT_MODE_SYMLINK) {
> > > > >          ret |= S_IFLNK;
> > > > >      }
> > > > > @@ -1106,6 +1123,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > > V9fsString *extension)
> > > > >      if (mode & P9_STAT_MODE_NAMED_PIPE) {
> > > > >          ret |= S_IFIFO;
> > > > >      }
> > > > > +#endif
> > > > >      if (mode & P9_STAT_MODE_DEVICE) {
> > > > >          if (extension->size && extension->data[0] == 'c') {
> > > > >              ret |= S_IFCHR;
> > > > > @@ -1118,6 +1136,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > > V9fsString *extension)
> > > > >          ret |= S_IFREG;
> > > > >      }
> > > > >
> > > > > +#ifndef CONFIG_WIN32
> > > > >      if (mode & P9_STAT_MODE_SETUID) {
> > > > >          ret |= S_ISUID;
> > > > >      }
> > > > > @@ -1127,6 +1146,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > > V9fsString *extension)
> > > > >      if (mode & P9_STAT_MODE_SETVTX) {
> > > > >          ret |= S_ISVTX;
> > > > >      }
> > > > > +#endif
> > > > >
> > > > >      return ret;
> > > > >  }
> > > > > @@ -1182,6 +1202,7 @@ static uint32_t stat_to_v9mode(const struct
> > > > > stat
> > > > *stbuf)
> > > > >          mode |= P9_STAT_MODE_DIR;
> > > > >      }
> > > > >
> > > > > +#ifndef CONFIG_WIN32
> > > > >      if (S_ISLNK(stbuf->st_mode)) {
> > > > >          mode |= P9_STAT_MODE_SYMLINK;
> > > > >      }
> > > > > @@ -1193,11 +1214,13 @@ static uint32_t stat_to_v9mode(const
> > > > > struct stat
> > > > *stbuf)
> > > > >      if (S_ISFIFO(stbuf->st_mode)) {
> > > > >          mode |= P9_STAT_MODE_NAMED_PIPE;
> > > > >      }
> > > > > +#endif
> > > > >
> > > > >      if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
> > > > >          mode |= P9_STAT_MODE_DEVICE;
> > > > >      }
> > > > >
> > > > > +#ifndef CONFIG_WIN32
> > > > >      if (stbuf->st_mode & S_ISUID) {
> > > > >          mode |= P9_STAT_MODE_SETUID;
> > > > >      }
> > > > > @@ -1209,6 +1232,7 @@ static uint32_t stat_to_v9mode(const struct
> > > > > stat
> > > > *stbuf)
> > > > >      if (stbuf->st_mode & S_ISVTX) {
> > > > >          mode |= P9_STAT_MODE_SETVTX;
> > > > >      }
> > > > > +#endif
> > > > >
> > > > >      return mode;
> > > > >  }
> > > > > @@ -1247,9 +1271,17 @@ static int coroutine_fn
> > > > > stat_to_v9stat(V9fsPDU *pdu,
> > > > V9fsPath *path,
> > > > >              return err;
> > > > >          }
> > > > >      } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
> > > > > +        unsigned maj, min;
> > > > > +
> > > > > +#ifndef CONFIG_WIN32
> > > > > +        maj = major(stbuf->st_rdev);
> > > > > +        min = minor(stbuf->st_rdev); #else
> > > > > +        maj = min = 0;
> > > > > +#endif
> > > >
> > > > Really?
> > >
> > > See above link.
> > >
> > > >
> > > > >          v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> > > > >                  S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > > > > -                major(stbuf->st_rdev), minor(stbuf->st_rdev));
> > > > > +                maj, min);
> > > > >      } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
> > > > >          v9fs_string_sprintf(&v9stat->extension, "%s %lu",
> > > > >                  "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
> > > > > @@
> > > > > -1317,7 +1349,14 @@ static int32_t blksize_to_iounit(const V9fsPDU
> > > > > *pdu, int32_t blksize)
> > > > >
> > > > >  static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct
> > > > > stat
> > > > > *stbuf)  {
> > > > > -    return blksize_to_iounit(pdu, stbuf->st_blksize);
> > > > > +    int32_t blksize;
> > > > > +
> > > > > +#ifndef CONFIG_WIN32
> > > > > +    blksize = stbuf->st_blksize); #else
> > > > > +    blksize = 0;
> > > > > +#endif
> > > >
> > > > Really?
> > >
> > > Windows struct stat does not have such field. See above link.
> > 
> > Yeah, but you cannot simply return zero here, because that information is
> > interpreted on guest side as the optimum chunk size for I/O. So some apps
> > might misbehave e.g. by trying allocate buffers with zero size, throwing
> > division by zero exceptions, or trying to read() / write() with zero chunk
> > size.
> > 
> > I'm pretty sure there is some kind of API to get the block size of the
> > underlying drive on Windows. And if not, then something like 4k or 8k is
> > still better than zero.
> > 
> 
> The possible solution could be put a hard-code (e.g. 4096, 512) here.
> This function does not have any context parameter for input.
> To get block size, need a file handle or path. But this function does not have it.

Another major difference on Windows compared to other systems is that you
don't have to worry about potential submounts in the exported directory tree.
Because Windows does not have that concept. So on Windows you can assume that
all files of the exported file tree are on the same storage device, right?

So another solution would be to query the block size with a regular Windows
API only on startup, simply by using the export root, and then storing that
block size e.g. as a new member variable to struct V9fsState.

In the end you could actually also use some meaningful hard coded value for
now, as it is not such of a big deal whether that's 512, 4k or 8k. But zero is
clearly a no go, for the reasons previously described.

> > > >
> > > > > +    return blksize_to_iounit(pdu, blksize);
> > > > >  }
> > > > >
> > > > >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat
> > > > > *stbuf, @@ -1332,7 +1371,11 @@ static int
> > > > > stat_to_v9stat_dotl(V9fsPDU *pdu,
> > > > const struct stat *stbuf,
> > > > >      v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
> > > > >      v9lstat->st_size = stbuf->st_size;
> > > > >      v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
> > > > > +#ifndef CONFIG_WIN32
> > > > >      v9lstat->st_blocks = stbuf->st_blocks;
> > > > > +#else
> > > > > +    v9lstat->st_blocks = 0;
> > > > > +#endif
> > > >
> > > > Really?
> > >
> > > Windows struct stat does not have such field. See above link.
> > 
> > Then it probably has to be calculated by file size / block size.
> 
> Got it.
> 
> > 
> > > >
> > > > >      v9lstat->st_atime_sec = stbuf->st_atime;
> > > > >      v9lstat->st_mtime_sec = stbuf->st_mtime;
> > > > >      v9lstat->st_ctime_sec = stbuf->st_ctime; @@ -1340,7 +1383,8
> > > > > @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat
> > *stbuf,
> > > > >      v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
> > > > >      v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
> > > > >      v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec; -#else
> > > > > +#endif
> > > > > +#ifdef CONFIG_LINUX
> > > > >      v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> > > > >      v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
> > > > >      v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec; @@ -2471,6
> > > > > +2515,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> > > > V9fsFidState *fidp,
> > > > >      struct dirent *dent;
> > > > >      struct stat *st;
> > > > >      struct V9fsDirEnt *entries = NULL;
> > > > > +    unsigned char d_type = 0;
> > > > >
> > > > >      /*
> > > > >       * inode remapping requires the device id, which in turn
> > > > > might be @@ -2540,10 +2585,13 @@ static int coroutine_fn
> > > > > v9fs_do_readdir(V9fsPDU
> > > > *pdu, V9fsFidState *fidp,
> > > > >          v9fs_string_init(&name);
> > > > >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> > > > >
> > > > > +#ifndef CONFIG_WIN32
> > > > > +        d_type = dent->d_type;
> > > > > +#endif
> > > > >          /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count)
> > */
> > > > >          len = pdu_marshal(pdu, 11 + count, "Qqbs",
> > > > >                            &qid, off,
> > > > > -                          dent->d_type, &name);
> > > > > +                          d_type, &name);
> > > >
> > > > Are you saying that d_type is not initialized with zero already?
> > >
> > > struct dirent is defined by MinGW, it does not have d_type member:
> > >
> > > https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-headers/crt
> > > /dirent.h
> > 
> > My bad, I misread your code. That's fine.
> > 
> > >
> > > >
> > > > >          v9fs_string_free(&name);
> > > > >
> > > > > @@ -2873,8 +2921,12 @@ static void coroutine_fn v9fs_create(void
> > *opaque)
> > > > >          }
> > > > >
> > > > >          nmode |= perm & 0777;
> > > > > +#ifndef CONFIG_WIN32
> > > > >          err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > > > >                              makedev(major, minor), nmode,
> > > > > &stbuf);
> > > > > +#else
> > > > > +        err = -ENOTSUP;
> > > > > +#endif
> > > > >          if (err < 0) {
> > > > >              goto out;
> > > > >          }
> > > > > @@ -2899,8 +2951,12 @@ static void coroutine_fn v9fs_create(void
> > *opaque)
> > > > >          v9fs_path_copy(&fidp->path, &path);
> > > > >          v9fs_path_unlock(s);
> > > > >      } else if (perm & P9_STAT_MODE_SOCKET) {
> > > > > +#ifndef CONFIG_WIN32
> > > > >          err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > > > >                              0, S_IFSOCK | (perm & 0777), &stbuf);
> > > > > +#else
> > > > > +        err = -ENOTSUP;
> > > > > +#endif
> > > >
> > > > As with previous patches, I would consider making the user aware to
> > > > use
> > > > mapped(-xattr) with something like error_report_once().
> > >
> > > OK, got it.
> > >
> > > >
> > > > >          if (err < 0) {
> > > > >              goto out;
> > > > >          }
> > > > > @@ -3634,7 +3690,7 @@ out_nofid:
> > > > >
> > > > >  static void coroutine_fn v9fs_mknod(void *opaque)  {
> > > > > -
> > > > > +#ifndef CONFIG_WIN32
> > > > >      int mode;
> > > > >      gid_t gid;
> > > > >      int32_t fid;
> > > > > @@ -3691,6 +3747,10 @@ out:
> > > > >  out_nofid:
> > > > >      pdu_complete(pdu, err);
> > > > >      v9fs_string_free(&name);
> > > > > +#else
> > > > > +    V9fsPDU *pdu = opaque;
> > > > > +    pdu_complete(pdu, -1);
> > > > > +#endif
> > > > >  }
> > > > >
> > > > >  /*
> > > > > @@ -3963,7 +4023,7 @@ out_nofid:
> > > > >  #if defined(CONFIG_LINUX)
> > > > >  /* Currently, only Linux has XATTR_SIZE_MAX */  #define
> > > > > P9_XATTR_SIZE_MAX XATTR_SIZE_MAX -#elif defined(CONFIG_DARWIN)
> > > > > +#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
> > > > >  /*
> > > > >   * Darwin doesn't seem to define a maximum xattr size in its user
> > > > >   * space header, so manually configure it across platforms as 64k.
> > > > > @@ -3980,6 +4040,7 @@ out_nofid:
> > > > >
> > > > >  static void coroutine_fn v9fs_xattrcreate(void *opaque)  {
> > > > > +#ifndef CONFIG_WIN32
> > > > >      int flags, rflags = 0;
> > > > >      int32_t fid;
> > > > >      uint64_t size;
> > > > > @@ -4041,10 +4102,15 @@ out_put_fid:
> > > > >  out_nofid:
> > > > >      pdu_complete(pdu, err);
> > > > >      v9fs_string_free(&name);
> > > > > +#else
> > > > > +    V9fsPDU *pdu = opaque;
> > > > > +    pdu_complete(pdu, -1);
> > > > > +#endif
> > > > >  }
> > > > >
> > > > >  static void coroutine_fn v9fs_readlink(void *opaque)  {
> > > > > +#ifndef CONFIG_WIN32
> > > > >      V9fsPDU *pdu = opaque;
> > > > >      size_t offset = 7;
> > > > >      V9fsString target;
> > > > > @@ -4080,6 +4146,10 @@ out:
> > > > >      put_fid(pdu, fidp);
> > > > >  out_nofid:
> > > > >      pdu_complete(pdu, err);
> > > > > +#else
> > > > > +    V9fsPDU *pdu = opaque;
> > > > > +    pdu_complete(pdu, -1);
> > > > > +#endif
> > > >
> > > > Unnecessary double declaration of pdu.
> > > >
> > >
> > > OK, got it.
> > >
> > > > >  }
> > > > >
> > > > >  static CoroutineEntry *pdu_co_handlers[] = { @@ -4341,6 +4411,7
> > > > > @@ void v9fs_reset(V9fsState *s)
> > > > >
> > > > >  static void __attribute__((__constructor__))
> > > > > v9fs_set_fd_limit(void) {
> > > > > +#ifndef CONFIG_WIN32
> > > > >      struct rlimit rlim;
> > > > >      if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
> > > > >          error_report("Failed to get the resource limit"); @@
> > > > > -4348,4
> > > > > +4419,5 @@ static void __attribute__((__constructor__))
> > > > v9fs_set_fd_limit(void)
> > > > >      }
> > > > >      open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
> > > > >      open_fd_rc = rlim.rlim_cur / 2;
> > > > > +#endif
> > > >
> > > > Really?
> > >
> > > Windows does not provide getrlimit()
> > 
> > But it has _getmaxstdio() and _setmaxstdio().
> > 
> > And even if Windows had no replacement functions, you need to initialize
> > these two global variables with some meaningful value. Otherwise they would
> > be zero, and that would mean 9p server would assume max. 0 files could be
> > open at the same time, so it would constantly close and re-open every single
> > file descriptor on every minor micro-transaction for no reason.
> 
> I could implement this function by _getmaxstdio() and _setmaxstdio().
> But these two functions are used for struct FILE, but not file descriptor (FD).
> I wrote a basic test for this function:
>   _getmaxstdio() returns 512, but I can use "open" to open at least 600 files without error.
> 
> Windows does not provide any document about the limititaion.
> 
> I think we can put a hard code here: 512, 1024, 2048, etc.

Yeah, that's pretty badly documented, I agree. The fact that it's prefixed
with an underscore suggests that they were probably not too convinced about
their API either. But it is as it is.

The fact that you can open a bit more files than what this function advertises
is not a huge surprise or speaking against using it though. Because it is not
untypical for systems to allow overallocation of system resources to a certain
extent.

At least from what I can see right now, this function is commonly used on
Windows to get exactly that metric. So I would rather use that than using hard
coded values, because from what I can see on the web, the numbers people got
experimentally are varying quite a bit.

Best regards,
Christian Schoenebeck



