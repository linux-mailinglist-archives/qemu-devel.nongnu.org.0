Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B39520233
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 18:22:27 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no69S-00016H-Mm
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 12:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1no67o-0008PA-Ol
 for qemu-devel@nongnu.org; Mon, 09 May 2022 12:20:44 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:26962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1no67k-0006Y9-20
 for qemu-devel@nongnu.org; Mon, 09 May 2022 12:20:44 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-I1HU6w8MPoG8U0BGOA0mLQ-1; Mon, 09 May 2022 12:20:26 -0400
X-MC-Unique: I1HU6w8MPoG8U0BGOA0mLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D305A85A5BE;
 Mon,  9 May 2022 16:20:25 +0000 (UTC)
Received: from bahia (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ADEFC27E83;
 Mon,  9 May 2022 16:20:23 +0000 (UTC)
Date: Mon, 9 May 2022 18:20:22 +0200
From: Greg Kurz <groug@kaod.org>
To: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Meng, Bin" <Bin.Meng@windriver.com>
Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver
 for Windows
Message-ID: <20220509182022.3fedeb7e@bahia>
In-Reply-To: <MN2PR11MB417353F6A9331B67D7F1E664EFC69@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <20220425142705.2099270-6-bmeng.cn@gmail.com>
 <20220509162924.6f70626d@bahia>
 <MN2PR11MB417353F6A9331B67D7F1E664EFC69@MN2PR11MB4173.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, PDS_OTHER_BAD_TLD=1.997,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, 9 May 2022 15:09:46 +0000
"Shi, Guohuai" <Guohuai.Shi@windriver.com> wrote:

>=20
>=20
> > -----Original Message-----
> > From: Greg Kurz <groug@kaod.org>
> > Sent: 2022=E5=B9=B45=E6=9C=889=E6=97=A5 22:29
> > To: Bin Meng <bmeng.cn@gmail.com>
> > Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>; qemu-devel@nongnu.o=
rg; Shi,
> > Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin <Bin.Meng@windriver.com>
> > Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend dri=
ver for
> > Windows
> >=20
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >=20
> > On Mon, 25 Apr 2022 22:27:01 +0800
> > Bin Meng <bmeng.cn@gmail.com> wrote:
> >=20
> > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > >
> > > Add a 9p local file system backend driver to support Windows,
> > > including open, read, write, close, rename, remove, etc.
> > >
> > > All security models are supported. The mapped (mapped-xattr)
> > > security model is implemented using NTFS Alternate Data Stream
> > > (ADS) so the 9p export path shall be on an NTFS partition.
> > >
> > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> >=20
> > Hi !
> >=20
> > I tend to agree with Christian's remarks that this patch is too big
> > and that the choice of introducing right away a new implementation
> > of 9p-local for windows hosts is too bold to start with. We need to
> > clearly understand what's diverging between windows and linux in order
> > to make such a decision. You should first try to introduce the required
> > abstractions to cope with these differences, so that we can review.
> >=20
>=20
> Here is the basic introductions of 9PFS for Windows development:
>=20
> Windows always returns -1 when try to call open() for a directory.=20
> Windows (actually MinGW library) only allows opendir() for a directory.

Does MinGW have dirfd() ?

> Windows does not support APIs like "*at" (openat(), renameat(), etc.)

Ouch...=20

> So 9PFS can not use any openat() for opening a sub file or directory in 9=
P mount directory.
> This commit use merge_fs_path() to build up full filename by string conca=
tenation.
> I know that may have a risk of security, but Windows does fully support P=
OSIX APIs.
>=20

s/does/doesn't ?

I understand from your various answers that symlinks aren't
currently supported by window's POSIX API. Is this forever ?
Google do mentions symlinks in windows 10. What's the story
there ? How do they behave ? How would they be exposed to the
client ? Be aware that, even if the client cannot create symlinks,
an existing symlink could be used to escape with rename().

If the code "may have a risk of security" then it must be
fixed or avoided in some way before being merged upstream.

Other thing that comes to mind is that windows hosts should
maybe use the mapped or mapped-file security modes since
they emulate symlinks with a simple file hidden in the
VIRTFS_META_DIR directory.

Cheers,

--
Greg

> > Some inlined remarks below anyway.
> >=20
> > >  hw/9pfs/9p-linux-errno.h |  151 +++++
> > >  hw/9pfs/9p-local.h       |    4 +
> > >  hw/9pfs/9p-util.h        |   41 ++
> > >  hw/9pfs/9p.h             |   23 +
> > >  hw/9pfs/9p-local-win32.c | 1242 ++++++++++++++++++++++++++++++++++++=
++
> > >  hw/9pfs/9p-util-win32.c  |  303 ++++++++++
> > >  hw/9pfs/9p-xattr.c       |  113 ++++
> > >  hw/9pfs/9p.c             |   91 ++-
> > >  hw/9pfs/codir.c          |   15 +
> > >  9 files changed, 1982 insertions(+), 1 deletion(-)
> > >  create mode 100644 hw/9pfs/9p-linux-errno.h
> > >  create mode 100644 hw/9pfs/9p-local-win32.c
> > >  create mode 100644 hw/9pfs/9p-util-win32.c
> > >
> > > diff --git a/hw/9pfs/9p-linux-errno.h b/hw/9pfs/9p-linux-errno.h
> > > new file mode 100644
> > > index 0000000000..b0d6ac45ac
> > > --- /dev/null
> > > +++ b/hw/9pfs/9p-linux-errno.h
> > > @@ -0,0 +1,151 @@
> > > +/*
> > > + * 9p Linux errno translation definition
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include <errno.h>
> > > +
> > > +#ifndef QEMU_9P_LINUX_ERRNO_H
> > > +#define QEMU_9P_LINUX_ERRNO_H
> > > +
> > > +/*
> > > + * This file contains the Linux errno definitions to translate errno=
s set by
> > > + * the 9P server (running on Windows) to a corresponding errno value.
> > > + *
> > > + * This list should be periodically reviewed and updated; particular=
ly for
> > > + * errnos that might be set as a result of a file system operation.
> > > + */
> > > +
> > > +#define L_EPERM             1   /* Operation not permitted */
> > > +#define L_ENOENT            2   /* No such file or directory */
> > > +#define L_ESRCH             3   /* No such process */
> > > +#define L_EINTR             4   /* Interrupted system call */
> > > +#define L_EIO               5   /* I/O error */
> > > +#define L_ENXIO             6   /* No such device or address */
> > > +#define L_E2BIG             7   /* Argument list too long */
> > > +#define L_ENOEXEC           8   /* Exec format error */
> > > +#define L_EBADF             9   /* Bad file number */
> > > +#define L_ECHILD            10  /* No child processes */
> > > +#define L_EAGAIN            11  /* Try again */
> > > +#define L_ENOMEM            12  /* Out of memory */
> > > +#define L_EACCES            13  /* Permission denied */
> > > +#define L_EFAULT            14  /* Bad address */
> > > +#define L_ENOTBLK           15  /* Block device required */
> > > +#define L_EBUSY             16  /* Device or resource busy */
> > > +#define L_EEXIST            17  /* File exists */
> > > +#define L_EXDEV             18  /* Cross-device link */
> > > +#define L_ENODEV            19  /* No such device */
> > > +#define L_ENOTDIR           20  /* Not a directory */
> > > +#define L_EISDIR            21  /* Is a directory */
> > > +#define L_EINVAL            22  /* Invalid argument */
> > > +#define L_ENFILE            23  /* File table overflow */
> > > +#define L_EMFILE            24  /* Too many open files */
> > > +#define L_ENOTTY            25  /* Not a typewriter */
> > > +#define L_ETXTBSY           26  /* Text file busy */
> > > +#define L_EFBIG             27  /* File too large */
> > > +#define L_ENOSPC            28  /* No space left on device */
> > > +#define L_ESPIPE            29  /* Illegal seek */
> > > +#define L_EROFS             30  /* Read-only file system */
> > > +#define L_EMLINK            31  /* Too many links */
> > > +#define L_EPIPE             32  /* Broken pipe */
> > > +#define L_EDOM              33  /* Math argument out of domain of fu=
nc */
> > > +#define L_ERANGE            34  /* Math result not representable */
> > > +#define L_EDEADLK           35  /* Resource deadlock would occur */
> > > +#define L_ENAMETOOLONG      36  /* File name too long */
> > > +#define L_ENOLCK            37  /* No record locks available */
> > > +#define L_ENOSYS            38  /* Function not implemented */
> > > +#define L_ENOTEMPTY         39  /* Directory not empty */
> > > +#define L_ELOOP             40  /* Too many symbolic links encounter=
ed */
> > > +#define L_ENOMSG            42  /* No message of desired type */
> > > +#define L_EIDRM             43  /* Identifier removed */
> > > +#define L_ECHRNG            44  /* Channel number out of range */
> > > +#define L_EL2NSYNC          45  /* Level 2 not synchronized */
> > > +#define L_EL3HLT            46  /* Level 3 halted */
> > > +#define L_EL3RST            47  /* Level 3 reset */
> > > +#define L_ELNRNG            48  /* Link number out of range */
> > > +#define L_EUNATCH           49  /* Protocol driver not attached */
> > > +#define L_ENOCSI            50  /* No CSI structure available */
> > > +#define L_EL2HLT            51  /* Level 2 halted */
> > > +#define L_EBADE             52  /* Invalid exchange */
> > > +#define L_EBADR             53  /* Invalid request descriptor */
> > > +#define L_EXFULL            54  /* Exchange full */
> > > +#define L_ENOANO            55  /* No anode */
> > > +#define L_EBADRQC           56  /* Invalid request code */
> > > +#define L_EBADSLT           57  /* Invalid slot */
> > > +#define L_EBFONT            58  /* Bad font file format */
> > > +#define L_ENOSTR            59  /* Device not a stream */
> > > +#define L_ENODATA           61  /* No data available */
> > > +#define L_ETIME             62  /* Timer expired */
> > > +#define L_ENOSR             63  /* Out of streams resources */
> > > +#define L_ENONET            64  /* Machine is not on the network */
> > > +#define L_ENOPKG            65  /* Package not installed */
> > > +#define L_EREMOTE           66  /* Object is remote */
> > > +#define L_ENOLINK           67  /* Link has been severed */
> > > +#define L_EADV              68  /* Advertise error */
> > > +#define L_ESRMNT            69  /* Srmount error */
> > > +#define L_ECOMM             70  /* Communication error on send */
> > > +#define L_EPROTO            71  /* Protocol error */
> > > +#define L_EMULTIHOP         72  /* Multihop attempted */
> > > +#define L_EDOTDOT           73  /* RFS specific error */
> > > +#define L_EBADMSG           74  /* Not a data message */
> > > +#define L_EOVERFLOW         75  /* Value too large for defined data =
type */
> > > +#define L_ENOTUNIQ          76  /* Name not unique on network */
> > > +#define L_EBADFD            77  /* File descriptor in bad state */
> > > +#define L_EREMCHG           78  /* Remote address changed */
> > > +#define L_ELIBACC           79  /* Can not access a needed shared li=
brary */
> > > +#define L_ELIBBAD           80  /* Accessing a corrupted shared libr=
ary */
> > > +#define L_ELIBSCN           81  /* .lib section in a.out corrupted */
> > > +#define L_ELIBMAX           82  /* Attempting to link in too many sh=
ared libs
> > */
> > > +#define L_ELIBEXEC          83  /* Cannot exec a shared library dire=
ctly */
> > > +#define L_EILSEQ            84  /* Illegal byte sequence */
> > > +#define L_ERESTART          85  /* Interrupted system call should be=
 restarted
> > */
> > > +#define L_ESTRPIPE          86  /* Streams pipe error */
> > > +#define L_EUSERS            87  /* Too many users */
> > > +#define L_ENOTSOCK          88  /* Socket operation on non-socket */
> > > +#define L_EDESTADDRREQ      89  /* Destination address required */
> > > +#define L_EMSGSIZE          90  /* Message too long */
> > > +#define L_EPROTOTYPE        91  /* Protocol wrong type for socket */
> > > +#define L_ENOPROTOOPT       92  /* Protocol not available */
> > > +#define L_EPROTONOSUPPORT   93  /* Protocol not supported */
> > > +#define L_ESOCKTNOSUPPORT   94  /* Socket type not supported */
> > > +#define L_EOPNOTSUPP        95  /* Operation not supported on transp=
ort endpoint
> > */
> > > +#define L_EPFNOSUPPORT      96  /* Protocol family not supported */
> > > +#define L_EAFNOSUPPORT      97  /* Address family not supported by p=
rotocol */
> > > +#define L_EADDRINUSE        98  /* Address already in use */
> > > +#define L_EADDRNOTAVAIL     99  /* Cannot assign requested address */
> > > +#define L_ENETDOWN          100 /* Network is down */
> > > +#define L_ENETUNREACH       101 /* Network is unreachable */
> > > +#define L_ENETRESET         102 /* Network dropped connection becaus=
e of reset
> > */
> > > +#define L_ECONNABORTED      103 /* Software caused connection abort =
*/
> > > +#define L_ECONNRESET        104 /* Connection reset by peer */
> > > +#define L_ENOBUFS           105 /* No buffer space available */
> > > +#define L_EISCONN           106 /* Transport endpoint is already con=
nected */
> > > +#define L_ENOTCONN          107 /* Transport endpoint is not connect=
ed */
> > > +#define L_ESHUTDOWN         108 /* Cannot send after transport endpo=
int shutdown
> > */
> > > +#define L_ETOOMANYREFS      109 /* Too many references: cannot splic=
e */
> > > +#define L_ETIMEDOUT         110 /* Connection timed out */
> > > +#define L_ECONNREFUSED      111 /* Connection refused */
> > > +#define L_EHOSTDOWN         112 /* Host is down */
> > > +#define L_EHOSTUNREACH      113 /* No route to host */
> > > +#define L_EALREADY          114 /* Operation already in progress */
> > > +#define L_EINPROGRESS       115 /* Operation now in progress */
> > > +#define L_ESTALE            116 /* Stale NFS file handle */
> > > +#define L_EUCLEAN           117 /* Structure needs cleaning */
> > > +#define L_ENOTNAM           118 /* Not a XENIX named type file */
> > > +#define L_ENAVAIL           119 /* No XENIX semaphores available */
> > > +#define L_EISNAM            120 /* Is a named type file */
> > > +#define L_EREMOTEIO         121 /* Remote I/O error */
> > > +#define L_EDQUOT            122 /* Quota exceeded */
> > > +#define L_ENOMEDIUM         123 /* No medium found */
> > > +#define L_EMEDIUMTYPE       124 /* Wrong medium type */
> > > +#define L_ECANCELED         125 /* Operation Canceled */
> > > +#define L_ENOKEY            126 /* Required key not available */
> > > +#define L_EKEYEXPIRED       127 /* Key has expired */
> > > +#define L_EKEYREVOKED       128 /* Key has been revoked */
> > > +#define L_EKEYREJECTED      129 /* Key was rejected by service */
> > > +#define L_EOWNERDEAD        130 /* Owner died */
> > > +#define L_ENOTRECOVERABLE   131 /* State not recoverable */
> > > +
> > > +#endif /* QEMU_9P_LINUX_ERRNO_H */
> > > diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
> > > index 55ea4b7883..4c75876e19 100644
> > > --- a/hw/9pfs/9p-local.h
> > > +++ b/hw/9pfs/9p-local.h
> > > @@ -31,6 +31,10 @@ static inline bool local_is_mapped_file_metadata(F=
sContext
> > *fs_ctx,
> > >
> > >  int local_open_nofollow(FsContext *fs_ctx, const char *path, int fla=
gs,
> > >                          mode_t mode);
> > > +#ifndef CONFIG_WIN32
> > >  int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> > > +#else
> > > +DIR *local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> > > +#endif
> > >
> >=20
> > Hrm... Returning a DIR * instead of a file descriptor looks like this
> > is a completely different function with different users, but you're
> > keeping the same name. What's happening here ?
> >=20
>=20
> As I mentioned above, Windows does not allow open() for a directory (retu=
rn int type file descriptor), only allows opendir() for a directory (return=
 DIR*)
>=20
> > >  #endif
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > index 97e681e167..6eadb38e1d 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -43,6 +43,7 @@ static inline void close_preserve_errno(int fd)
> > >      errno =3D serrno;
> > >  }
> > >
> > > +#ifndef CONFIG_WIN32
> > >  static inline int openat_dir(int dirfd, const char *name)
> > >  {
> > >      return openat(dirfd, name,
> > > @@ -89,7 +90,9 @@ again:
> > >      errno =3D serrno;
> > >      return fd;
> > >  }
> > > +#endif /* !CONFIG_WIN32 */
> > >
> > > +#ifndef CONFIG_WIN32
> > >  ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char=
 *name,
> > >                               void *value, size_t size);
> > >  int fsetxattrat_nofollow(int dirfd, const char *path, const char *na=
me,
> > > @@ -98,7 +101,38 @@ ssize_t flistxattrat_nofollow(int dirfd, const ch=
ar
> > *filename,
> > >                                char *list, size_t size);
> > >  ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > >                                  const char *name);
> > > +#else
> > > +
> > > +ssize_t fgetxattrat_nofollow(const char *dirname, const char *filena=
me,
> > > +                             const char *name, void *value, size_t s=
ize);
> > > +int fsetxattrat_nofollow(const char *dirname, const char *filename,
> > > +                         const char *name, void *value, size_t size,
> > > +                         int flags);
> > > +ssize_t flistxattrat_nofollow(const char *dirname, const char *filen=
ame,
> > > +                              char *list, size_t size);
> > > +ssize_t fremovexattrat_nofollow(const char *dirname, const char *fil=
ename,
> > > +                                const char *name);
> > > +
> > > +int qemu_statfs(const char *fs_root, struct statfs *stbuf);
> > > +
> > > +static inline char *merge_fs_path(const char *path1, const char *pat=
h2)
> > > +{
> > > +    char *full_fs_path;
> > > +    size_t full_fs_path_len;
> > > +
> > > +    full_fs_path_len =3D strlen(path1) + strlen(path2) + 2;
> > > +    full_fs_path =3D g_malloc(full_fs_path_len);
> > >
> > > +    strcpy(full_fs_path, path1);
> > > +    strcat(full_fs_path, "\\");
> > > +    strcat(full_fs_path, path2);
> > > +
> > > +    return full_fs_path;
> > > +}
> > > +
> > > +#endif /* !CONFIG_WIN32 */
> > > +
> > > +#ifndef CONFIG_WIN32
> > >  /*
> > >   * Darwin has d_seekoff, which appears to function similarly to d_of=
f.
> > >   * However, it does not appear to be supported on all file systems,
> > > @@ -113,6 +147,7 @@ static inline off_t qemu_dirent_off(struct dirent=
 *dent)
> > >      return dent->d_off;
> > >  #endif
> > >  }
> > > +#endif /* !CONFIG_WIN32 */
> > >
> > >  /**
> > >   * qemu_dirent_dup() - Duplicate directory entry @dent.
> > > @@ -154,6 +189,12 @@ static inline struct dirent *qemu_dirent_dup(str=
uct dirent
> > *dent)
> > >  #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > >  int pthread_fchdir_np(int fd) __attribute__((weak_import));
> > >  #endif
> > > +
> > > +#ifndef CONFIG_WIN32
> > >  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t=
 dev);
> > > +#else
> > > +int qemu_mknodat(const char *dirname, const char *filename,
> > > +                 mode_t mode, dev_t dev);
> >=20
> > Same remark as local_opendir_nofollow(). Especially, this clearly devia=
tes
> > from the mknodat(2) semantics : dirfd is supposed to be a handle on an
> > existing directory, while dirname cannot provide such a guarantee.
>=20
> Windows does not have APIs like *at: openat(), mknodat(), etc.
>=20
> >=20
> > > +#endif
> > >
> > >  #endif
> > > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > > index 994f952600..87e8eac840 100644
> > > --- a/hw/9pfs/9p.h
> > > +++ b/hw/9pfs/9p.h
> > > @@ -3,13 +3,36 @@
> > >
> > >  #include <dirent.h>
> > >  #include <utime.h>
> > > +#ifndef CONFIG_WIN32
> > >  #include <sys/resource.h>
> > > +#endif
> > >  #include "fsdev/file-op-9p.h"
> > >  #include "fsdev/9p-iov-marshal.h"
> > >  #include "qemu/thread.h"
> > >  #include "qemu/coroutine.h"
> > >  #include "qemu/qht.h"
> > >
> > > +#ifdef CONFIG_WIN32
> > > +
> > > +#define O_NOCTTY            0
> > > +#define O_NDELAY            0
> > > +#define O_NONBLOCK          0
> > > +#define O_DSYNC             0
> > > +#define O_DIRECT            0
> > > +#define O_NOFOLLOW          0
> > > +#define O_NOATIME           0
> > > +#define O_SYNC              0
> > > +#define O_ASYNC             0
> > > +#define O_DIRECTORY         02000000
> > > +
> > > +#define FASYNC              0
> > > +
> > > +#define AT_REMOVEDIR        1
> > > +
> > > +#define NAME_MAX            260
> > > +
> > > +#endif
> > > +
> > >  enum {
> > >      P9_TLERROR =3D 6,
> > >      P9_RLERROR,
> > > diff --git a/hw/9pfs/9p-local-win32.c b/hw/9pfs/9p-local-win32.c
> > > new file mode 100644
> > > index 0000000000..aab7c9f7b5
> > > --- /dev/null
> > > +++ b/hw/9pfs/9p-local-win32.c
> > > @@ -0,0 +1,1242 @@
> > > +/*
> > > + * 9p Windows callback
> > > + *
> > > + * Copyright (c) 2022 Wind River Systems, Inc.
> > > + *
> > > + * Based on hw/9pfs/9p-local.c
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2. =
 See
> > > + * the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +/*
> > > + * Not so fast! You might want to read the 9p developer docs first:
> > > + * https://wiki.qemu.org/Documentation/9p
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include <windows.h>
> > > +#include <dirent.h>
> > > +#include "9p.h"
> > > +#include "9p-local.h"
> > > +#include "9p-xattr.h"
> > > +#include "9p-util.h"
> > > +#include "fsdev/qemu-fsdev.h"   /* local_ops */
> > > +#include "qapi/error.h"
> > > +#include "qemu/cutils.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/option.h"
> > > +#include <libgen.h>
> > > +
> > > +static inline int openfile_with_ctx(FsContext *fs_ctx, const char *n=
ame,
> > > +                                    int flags, mode_t mode)
> > > +{
> > > +    char *full_file_name;
> > > +    int fd;
> > > +
> > > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, name);
> > > +    fd =3D open(full_file_name, flags | _O_BINARY, mode);
> >=20
> > Hmm... in order to fix CVE-2016-9602, we had to ban path based syscalls
> > because a malicious guest could easily escape the file system with a
> > symlink attack. So now we basically split all paths we get from the
> > client so that we only call *at() syscalls with a single path element
> > and a NOFOLLOW flag.
> >=20
> > This function seems to be doing the very opposite, which is clearly
> > a no go.
>=20
> Windows does not have openat(), so the only way is to build up full filen=
ame by merge_fs_path().
> Additionally, Windows does not support symbolic link APIs in POSIX librar=
y, so there may not be any security risks.
>=20
> >=20
> > > +    g_free(full_file_name);
> > > +
> > > +    return fd;
> > > +}
> > > +
> > > +static inline DIR *opendir_with_ctx(FsContext *fs_ctx, const char *n=
ame)
> > > +{
> > > +    char *full_file_name;
> > > +    DIR *dir;
> > > +
> > > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, name);
> > > +    dir =3D opendir(full_file_name);
> >=20
> > Same remark here.
>=20
> Same as above.
>=20
> >=20
> > > +    g_free(full_file_name);
> > > +    return dir;
> > > +}
> > > +
> > > +int local_open_nofollow(FsContext *fs_ctx, const char *path, int fla=
gs,
> > > +                        mode_t mode)
> > > +{
> > > +    int fd;
> > > +
> > > +    if (path[strlen(path) - 1] =3D=3D '/' || (flags & O_DIRECTORY) !=
=3D 0) {
> >=20
> > Why special casing '/' ?
>=20
> Windows does not allow open() for a directory, or any filename format lik=
e a directory.
>=20
> >=20
> > > +        /* Windows does not allow call open() for a directory */
> > > +        fd =3D -1;
> >=20
> > This -1 will ultimately cause a Rlerror message to be returned
> > to the client : an errno should be set here... but anyway, this
> > isn't the way to do it : you should just call open() and let
> > windows set the errno.
> >=20
> > Now, the major problem is that we really need to be able to
> > open directories because of CVE-2016-9602. Isn't it possible
> > to achieve it in some other way, e.g. opendir() and dirfd() ?
>=20
> As I mentioned above, Windows does not support fd (file descriptor) for d=
irectory open().
>=20
> >=20
> > > +    } else {
> > > +        fd =3D openfile_with_ctx(fs_ctx, path, flags, mode);
> >=20
> > Does this honor the NOFOLLOW semantics ? It seems not...which is again
> > a no go. You cannot blindly assume how the underlying file system
> > handles symlinks.
> >=20
>=20
> Windows does not support symbolic link in POSIX APIs,
>=20
> > > +    }
> > > +
> > > +    return fd;
> > > +}
> > > +
> > > +DIR *local_opendir_nofollow(FsContext *fs_ctx, const char *path)

> > > +{
> > > +    return opendir_with_ctx(fs_ctx, path);
> > > +}
> > > +
> > > +static FILE *local_fopenat(const char *dirname, const char *name,
> > > +                           const char *mode)
> > > +{
> > > +    char *full_file_name;
> > > +    char modestr[3] =3D {0};
> > > +    FILE *fp;
> > > +
> > > +    /*
> > > +     * only supports two modes
> > > +     */
> > > +    if (mode[0] =3D=3D 'r') {
> > > +        modestr[0] =3D 'r';
> > > +    } else if (mode[0] =3D=3D 'w') {
> > > +        modestr[0] =3D 'w';
> > > +    } else {
> > > +        return NULL;
> > > +    }
> > > +    /* Windows host needs 'b' flag */
> > > +    modestr[1] =3D 'b';
> > > +
> > > +    full_file_name =3D merge_fs_path(dirname, name);
> > > +    fp =3D fopen(full_file_name, modestr);

> > > +    g_free(full_file_name);
> > > +
> > > +    return fp;
> > > +}
> > > +
> > > +static void local_mapped_file_attr(const char *dirpath, const char *=
name,
> > > +                                   struct stat *stbuf)
> > > +{
> > > +    FILE *fp;
> > > +    char buf[ATTR_MAX];
> > > +    char *full_file_name;
> > > +
> > > +    if (strcmp(name, ".") !=3D 0) {
> > > +        full_file_name =3D merge_fs_path(dirpath, VIRTFS_META_DIR);
> > > +        fp =3D local_fopenat(full_file_name, name, "r");
> > > +        g_free(full_file_name);
> > > +    } else {
> > > +        fp =3D local_fopenat(dirpath, VIRTFS_META_ROOT_FILE, "r");
> > > +    }
> > > +    if (!fp) {
> > > +        return;
> > > +    }
> > > +
> > > +    memset(buf, 0, ATTR_MAX);
> > > +    while (fgets(buf, ATTR_MAX, fp)) {
> > > +        if (!strncmp(buf, "virtfs.uid", 10)) {
> > > +            stbuf->st_uid =3D atoi(buf + 11);
> > > +        } else if (!strncmp(buf, "virtfs.gid", 10)) {
> > > +            stbuf->st_gid =3D atoi(buf + 11);
> > > +        } else if (!strncmp(buf, "virtfs.mode", 11)) {
> > > +            stbuf->st_mode =3D (stbuf->st_mode & ~0777);
> > > +            stbuf->st_mode |=3D (atoi(buf + 12) & 0777);

> > > +        } else if (!strncmp(buf, "virtfs.rdev", 11)) {
> > > +            stbuf->st_rdev =3D atoi(buf + 12);
> > > +        }
> > > +        memset(buf, 0, ATTR_MAX);
> > > +    }
> > > +    fclose(fp);
> > > +}
> > > +
> > > +static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct =
stat
> > *stbuf)
> > > +{
> > > +    int err =3D -1;
> > > +    char *full_dir_name, *full_file_name;
> > > +    char *dirpath =3D g_path_get_dirname(fs_path->data);
> > > +    char *name =3D g_path_get_basename(fs_path->data);
> > > +
> > > +    full_dir_name =3D merge_fs_path(fs_ctx->fs_root, dirpath);
> > > +    full_file_name =3D merge_fs_path(full_dir_name, name);
> > > +    err =3D stat(full_file_name, stbuf);
> > > +
> > > +    if (err =3D=3D 0 && strcmp(fs_path->data, ".") =3D=3D 0) {
> > > +        /*
> > > +         * Hard code for root directory on Windows host.
> > > +         * This will root directory have a special inode number,
> > > +         * then guest OS can detect it is a special directory.
> > > +         */
> > > +        stbuf->st_ino =3D 2;
> > > +    }
> > > +
> > > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > > +        /* Actual credentials are part of extended attrs */

> > > +        uid_t tmp_uid;
> > > +        gid_t tmp_gid;
> > > +        mode_t tmp_mode;
> > > +        dev_t tmp_dev;
> > > +
> > > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.u=
id",
> > > +                                 &tmp_uid, sizeof(uid_t)) > 0) {
> > > +            stbuf->st_uid =3D le32_to_cpu(tmp_uid);
> > > +        }
> > > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.g=
id",
> > > +                                 &tmp_gid, sizeof(gid_t)) > 0) {
> > > +            stbuf->st_gid =3D le32_to_cpu(tmp_gid);
> > > +        }
> > > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.m=
ode",
> > > +                                 &tmp_mode, sizeof(mode_t)) > 0) {
> > > +            stbuf->st_mode =3D (stbuf->st_mode & ~0777);
> > > +            stbuf->st_mode |=3D le32_to_cpu(tmp_mode);
> > > +        }
> > > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.r=
dev",
> > > +                                 &tmp_dev, sizeof(dev_t)) > 0) {
> > > +            stbuf->st_rdev =3D le64_to_cpu(tmp_dev);
> > > +        }
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        local_mapped_file_attr(full_dir_name, name, stbuf);
> > > +    }
> > > +
> > > +    g_free(full_file_name);
> > > +    g_free(full_dir_name);

> > > +
> > > +    if (err) {
> > > +        goto err_out;
> > > +    }
> > > +
> > > +err_out:
> > > +    g_free(name);
> > > +    g_free(dirpath);
> > > +    return err;
> > > +}
> > > +
> > > +static int local_set_mapped_file_attrat(const char *dirname, const c=
har *name,
> > > +                                        FsCred *credp)
> > > +{
> > > +    FILE *fp;
> > > +    int ret;
> > > +    char buf[ATTR_MAX];
> > > +    int uid =3D -1, gid =3D -1, mode =3D -1, rdev =3D -1;
> > > +    bool is_root =3D !strcmp(name, ".");
> > > +    char *full_dir_name;
> > > +

> > > +    if (is_root) {
> > > +        fp =3D local_fopenat(dirname, VIRTFS_META_ROOT_FILE, "r");
> > > +        if (!fp) {
> > > +            if (errno =3D=3D ENOENT) {
> > > +                goto update_map_file;
> > > +            } else {
> > > +                return -1;
> > > +            }
> > > +        }
> > > +    } else {
> > > +        /*
> > > +         * mapped-file:
> > > +         *   <sub_file> attribute stored to:
> > > +         *   <directory> + VIRTFS_META_DIR + <sub_file_name>
> > > +         */
> > > +        full_dir_name =3D merge_fs_path(dirname, VIRTFS_META_DIR);
> > > +        ret =3D mkdir(full_dir_name);
> > > +
> > > +        if (ret < 0 && errno !=3D EEXIST) {
> > > +            g_free(full_dir_name);
> > > +            return -1;
> > > +        }
> > > +
> > > +        fp =3D local_fopenat(full_dir_name, name, "r");
> > > +        if (!fp) {
> > > +            if (errno =3D=3D ENOENT) {
> > > +                goto update_map_file;
> > > +            } else {
> > > +                g_free(full_dir_name);
> > > +                return -1;
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    memset(buf, 0, ATTR_MAX);
> > > +    while (fgets(buf, ATTR_MAX, fp)) {
> > > +        if (!strncmp(buf, "virtfs.uid", 10)) {
> > > +            uid =3D atoi(buf + 11);
> > > +        } else if (!strncmp(buf, "virtfs.gid", 10)) {
> > > +            gid =3D atoi(buf + 11);
> > > +        } else if (!strncmp(buf, "virtfs.mode", 11)) {
> > > +            mode =3D atoi(buf + 12);
> > > +        } else if (!strncmp(buf, "virtfs.rdev", 11)) {
> > > +            rdev =3D atoi(buf + 12);
> > > +        }
> > > +        memset(buf, 0, ATTR_MAX);
> > > +    }
> > > +    fclose(fp);
> > > +
> > > +update_map_file:
> > > +    if (is_root) {
> > > +        fp =3D local_fopenat(dirname, VIRTFS_META_ROOT_FILE, "w");
> > > +    } else {
> > > +        fp =3D local_fopenat(full_dir_name, name, "w");
> > > +        g_free(full_dir_name);
> > > +    }
> > > +    if (!fp) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (credp->fc_uid !=3D -1) {
> > > +        uid =3D credp->fc_uid;
> > > +    }
> > > +    if (credp->fc_gid !=3D -1) {
> > > +        gid =3D credp->fc_gid;
> > > +    }
> > > +    if (credp->fc_mode !=3D (mode_t)-1) {
> > > +        mode =3D credp->fc_mode;
> > > +    }
> > > +    if (credp->fc_rdev !=3D -1) {
> > > +        rdev =3D credp->fc_rdev;
> > > +    }
> > > +
> > > +    if (uid !=3D -1) {
> > > +        fprintf(fp, "virtfs.uid=3D%d\n", uid);
> > > +    }
> > > +    if (gid !=3D -1) {
> > > +        fprintf(fp, "virtfs.gid=3D%d\n", gid);
> > > +    }
> > > +    if (mode !=3D -1) {
> > > +        fprintf(fp, "virtfs.mode=3D%d\n", mode);
> > > +    }
> > > +    if (rdev !=3D -1) {
> > > +        fprintf(fp, "virtfs.rdev=3D%d\n", rdev);
> > > +    }
> > > +    fclose(fp);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int local_set_xattrat(const char *dirname, const char *path,
> > > +                             FsCred *credp)
> > > +{
> > > +    int err;
> > > +
> > > +    if (credp->fc_uid !=3D -1) {
> > > +        uint32_t tmp_uid =3D cpu_to_le32(credp->fc_uid);
> > > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.uid=
",
> > > +                                   &tmp_uid, sizeof(uid_t), 0);
> > > +        if (err) {
> > > +            return err;
> > > +        }
> > > +    }
> > > +    if (credp->fc_gid !=3D -1) {
> > > +        uint32_t tmp_gid =3D cpu_to_le32(credp->fc_gid);
> > > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.gid=
",
> > > +                                   &tmp_gid, sizeof(gid_t), 0);
> > > +        if (err) {
> > > +            return err;
> > > +        }
> > > +    }
> > > +    if (credp->fc_mode !=3D (mode_t)-1) {
> > > +        uint32_t tmp_mode =3D cpu_to_le32(credp->fc_mode);
> > > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.mod=
e",
> > > +                                   &tmp_mode, sizeof(mode_t), 0);
> > > +        if (err) {
> > > +            return err;
> > > +        }
> > > +    }
> > > +    if (credp->fc_rdev !=3D -1) {
> > > +        uint64_t tmp_rdev =3D cpu_to_le64(credp->fc_rdev);
> > > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.rde=
v",
> > > +                                   &tmp_rdev, sizeof(dev_t), 0);
> > > +        if (err) {
> > > +            return err;
> > > +        }
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > > +static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
> > > +                              char *buf, size_t bufsz)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static int local_close(FsContext *ctx, V9fsFidOpenState *fs)
> > > +{
> > > +    return close(fs->fd);
> > > +}
> > > +
> > > +static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
> > > +{
> > > +    return closedir(fs->dir.stream);
> > > +}
> > > +
> > > +static int local_open(FsContext *ctx, V9fsPath *fs_path,
> > > +                      int flags, V9fsFidOpenState *fs)
> > > +{
> > > +    int fd;
> > > +
> > > +    fd =3D local_open_nofollow(ctx, fs_path->data, flags, 0);
> > > +    if (fd =3D=3D -1) {
> > > +        return -1;
> > > +    }
> > > +    fs->fd =3D fd;
> > > +    return fs->fd;
> > > +}
> > > +
> > > +static int local_opendir(FsContext *ctx,
> > > +                         V9fsPath *fs_path, V9fsFidOpenState *fs)
> > > +{
> > > +    DIR *stream;
> > > +    char *full_file_name;
> > > +
> > > +    full_file_name =3D merge_fs_path(ctx->fs_root, fs_path->data);
> > > +    stream =3D opendir(full_file_name);
> > > +    g_free(full_file_name);
> > > +
> > > +    if (!stream) {
> > > +        return -1;local_opendir_nofollowlocal_opendir_nofollow
> > > +    }
> > > +
> > > +    fs->dir.stream =3D stream;
> > > +    return 0;
> > > +}
> > > +
> > > +static void local_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
> > > +{
> > > +    rewinddir(fs->dir.stream);
> > > +}
> > > +
> > > +static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
> > > +{
> > > +    return telldir(fs->dir.stream);
> > > +}
> > > +
> > > +static struct dirent *local_readdir(FsContext *ctx, V9fsFidOpenState=
 *fs)
> > > +{local_opendir_nofollow
> > > +    struct dirent *entry;
> > > +
> > > +again:
> > > +    entry =3D readdir(fs->dir.stream);
> > > +    if (!entry) {
> > > +        return NULL;
> > > +    }
> > > +
> > > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        if (local_is_mapped_file_metadata(ctx, entry->d_name)) {
> > > +            /* skip the meta data */
> > > +            goto again;
> > > +        }
> > > +    }
> > > +
> > > +    return entry;
> > > +}
> > > +
> > > +static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_=
t off)
> > > +{
> > > +    off_t count;
> > > +    struct dirent *findentry;
> > > +    struct dirent *entry;
> > > +    size_t namelen[3] =3D {0};
> > > +    off_t direntoff[3] =3D {-1, -1, -1};
> > > +    char *d_name[3];
> > > +    int i;
> > > +
> > > +    /*
> > > +     * MinGW's seekdir() requires directory is not modified. If gues=
t OS is
> > > +     * modifying the directory when calling seekdir(), e.g.: "rm -rf=
 *",
> > > +     * then MinGW's seekdir() will seek to a wrong offset.
> > > +     *
> > > +     * This function saves some old offset directory entry name,
> > > +     * and lookup current entry again, and compare the offset.
> > > +     *
> > > +     * If new offset is less than old offset, that means someone is =
deleting
> > > +     * files in the directory, thus we need to seek offset backward.
> > > +     *
> > > +     * If new offset is larger than old offset, that means someone i=
s creating
> > > +     * files in the directory, thus we need to seek offset forward.
> > > +     */
> > > +
> > > +    direntoff[0] =3D telldir(fs->dir.stream);
> > > +
> > > +    /* do nothing if current offset is 0 or EOF */
> > > +    if (direntoff[0] =3D=3D 0 || direntoff[0] < 0) {
> > > +        seekdir(fs->dir.stream, off);
> > > +        return ;
> > > +    }
> > > +
> > > +    d_name[0] =3D g_malloc0(sizeof(entry->d_name) * 3);
> > > +    d_name[1] =3D d_name[0] + sizeof(entry->d_name);
> > > +    d_name[2] =3D d_name[1] + sizeof(entry->d_name);
> > > +
> > > +    /* save 3 nearest entries and offsets */
> > > +    for (i =3D 0; i < 3; i++) {
> > > +        entry =3D &fs->dir.stream->dd_dir;
> > > +
> > > +        memcpy(d_name[i], entry->d_name, entry->d_namlen);
> > > +        namelen[i] =3D strlen(d_name[i]) + 1;
> > > +
> > > +        direntoff[i] =3D telldir(fs->dir.stream);
> > > +
> > > +        entry =3D readdir(fs->dir.stream);
> > > +        if (entry =3D=3D NULL) {
> > > +            break;
> > > +        }
> > > +    }
> > > +
> > > +    /* lookup saved entries again */
> > > +    for (i =3D 0; i < 3 && direntoff[i] !=3D -1; i++) {
> > > +        rewinddir(fs->dir.stream);
> > > +        count =3D 0;
> > > +        while ((findentry =3D readdir(fs->dir.stream)) !=3D NULL) {
> > > +            count++;
> > > +
> > > +            if (memcmp(findentry->d_name, d_name[i], namelen[i]) =3D=
=3D 0) {
> > > +                if (count + i =3D=3D direntoff[i]) {
> > > +                    seekdir(fs->dir.stream, off);
> > > +                    goto out;
> > > +                } else if (count + i < direntoff[i]) {
> > > +                    off =3D off - (direntoff[i] - count) - i;
> > > +                    if (off <=3D 0) {
> > > +                        off =3D 0;
> > > +                    }
> > > +                    seekdir(fs->dir.stream, off);
> > > +                    goto out;
> > > +                } else {
> > > +                    off =3D off + (count - direntoff[i]) - i;
> > > +                    seekdir(fs->dir.stream, off);
> > > +                    goto out;
> > > +                }
> > > +            }local_opendir_nofollow
> > > +        }
> > > +    }
> > > +    /* can not get anything, seek backward */
> > > +    off =3D off - 1;
> > > +
> > > +    seekdir(fs->dir.stream, off);
> > > +out:
> > > +    g_free(d_name[0]);
> > > +    return ;
> > > +}
> > > +
> > > +static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> > > +                            const struct iovec *iov,
> > > +                            int iovcnt, off_t offset)
> > > +{
> > > +#ifdef CONFIG_PREADV
> > > +    return preadv(fs->fd, iov, iovcnt, offset);
> > > +#else
> > > +    int err =3D lseek(fs->fd, offset, SEEK_SET);
> > > +    if (err =3D=3D -1) {
> > > +        return err;
> > > +    } else {
> > > +        return readv(fs->fd, iov, iovcnt);
> > > +    }
> > > +#endif
> > > +}
> > > +
> > > +static ssize_t local_pwritev(FsContext *ctx, V9fsFidOpenState *fs,
> > > +                             const struct iovec *iov,
> > > +                             int iovcnt, off_t offset)
> > > +{
> > > +    ssize_t ret;
> > > +#ifdef CONFIG_PREADV
> > > +    ret =3D pwritev(fs->fd, iov, iovcnt, offset);
> > > +#else
> > > +    int err =3D lseek(fs->fd, offset, SEEK_SET);
> > > +    if (err =3D=3D -1) {
> > > +        return err;
> > > +    } else {
> > > +        ret =3D writev(fs->fd, iov, iovcnt);
> > > +    }
> > > +#endif
> > > +#ifdef CONFIG_SYNC_FILE_RANGE
> > > +    if (ret > 0 && ctx->export_flags & V9FS_IMMEDIATE_WRITEOUT) {
> > > +        /*
> > > +         * Initiate a writeback. This is not a data integrity sync.
> > > +         * We want to ensure that we don't leave dirty pages in the =
cache
> > > +         * after write when writeout=3Dimmediate is sepcified.
> > > +         */
> > > +        sync_file_range(fs->fd, offset, ret,
> > > +                        SYNC_FILE_RANGE_WAIT_BEFORE | SYNC_FILE_RANG=
E_WRITE);
> > > +    }
> > > +#endif
> > > +    return ret;
> > > +}
> > > +
> > > +static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred =
*credp)
> > > +{
> > > +    char *dirpath =3D g_path_get_dirname(fs_path->data);
> > > +    char *name =3D g_path_get_basename(fs_path->data);
> > > +    int ret =3D -1;
> > > +    char *full_file_name =3D NULL;
> > > +    DIR *dir;
> > > +    dir =3D local_opendir_nofollow(fs_ctx, dirpath);
> > > +    if (dir =3D=3D NULL) {
> > > +        goto out;
> > > +    }
> > > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, dirpath);
> > > +
> > > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > > +        ret =3D local_set_xattrat(full_file_name, name, credp);
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        ret =3D local_set_mapped_file_attrat(full_file_name, name, c=
redp);
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > > +               fs_ctx->export_flags & V9FS_SM_NONE) {
> > > +        ret =3D -1;
> > > +        errno =3D ENOTSUP;
> > > +    }
> > > +    closedir(dir);
> > > +
> > > +out:
> > > +    if (full_file_name !=3D NULL) {
> > > +        g_free(full_file_name);
> > > +    }
> > > +
> > > +    g_free(dirpath);
> > > +    g_free(name);
> > > +    return ret;
> > > +}
> > > +
> > > +static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
> > > +                       const char *name, FsCred *credp)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
> > > +                       const char *name, FsCred *credp)
> > > +{
> > > +    int err =3D -1;
> > > +    char *full_file_name;
> > > +    char *full_dir_name;
> > > +    DIR *dir;
> > > +
> > > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > > +        local_is_mapped_file_metadata(fs_ctx, name)) {
> > > +        errno =3D EINVAL;
> > > +        return -1;
> > > +    }
> > > +
> > > +    dir =3D local_opendir_nofollow(fs_ctx, dir_path->data);
> > > +    if (dir =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +    closedir(dir);
> > > +
> > > +    full_dir_name =3D merge_fs_path(fs_ctx->fs_root, dir_path->data);
> > > +    full_file_name =3D merge_fs_path(full_dir_name, name);
> > > +
> > > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > > +        fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        err =3D mkdir(full_file_name);
> > > +        if (err =3D=3D -1) {
> > > +            goto out;
> > > +        }
> > > +        credp->fc_mode =3D credp->fc_mode;
> > > +
> > > +        if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > > +            err =3D local_set_xattrat(full_dir_name, name, credp);
> > > +        } else {
> > > +            err =3D local_set_mapped_file_attrat(full_dir_name, name=
, credp);
> > > +        }
> > > +        if (err =3D=3D -1) {
> > > +            rmdir(full_file_name);
> > > +        }
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > > +               fs_ctx->export_flags & V9FS_SM_NONE) {
> > > +        err =3D mkdir(full_file_name);
> > > +        if (err =3D=3D -1) {
> > > +            goto out;
> > > +        }
> > > +        /* Windows does not support chmod, do nothing here */
> > > +    }
> > > +
> > > +    goto out;
> > > +
> > > +out:
> > > +    g_free(full_dir_name);
> > > +    g_free(full_file_name);
> > > +    return err;
> > > +}
> > > +
> > > +static int local_fstat(FsContext *fs_ctx, int fid_type,
> > > +                       V9fsFidOpenState *fs, struct stat *stbuf)
> > > +{
> > > +
> > > +    int err, fd;
> > > +    char filename[NAME_MAX];
> > > +    char *dirpath;
> > > +    char *name;
> > > +    HANDLE hFile;
> > > +    DWORD dwRet;
> > > +
> > > +    if (fid_type =3D=3D P9_FID_DIR) {
> > > +        /* Windows does not support open directory */
> > > +        return -1;
> > > +    } else {
> > > +        fd =3D fs->fd;
> > > +    }
> > > +
> > > +    err =3D fstat(fd, stbuf);
> > > +    if (err) {
> > > +        return err;
> > > +    }
> > > +
> > > +    /* get real file name by fd */
> > > +    hFile =3D (HANDLE)_get_osfhandle(fd);
> > > +    dwRet =3D GetFinalPathNameByHandle(hFile, filename, sizeof(filen=
ame), 0);
> > > +
> > > +    if (dwRet >=3D NAME_MAX) {
> > > +        return -1;
> > > +    }
> > > +    /* skip string "\\\\?\\" return from GetFinalPathNameByHandle() =
*/
> > > +    memmove(filename, filename + 4, NAME_MAX - 4);
> > > +
> > > +    dirpath =3D g_path_get_dirname(filename);
> > > +    name =3D g_path_get_basename(filename);
> > > +
> > > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > > +        /* Actual credentials are part of extended attrs */
> > > +        uid_t tmp_uid;
> > > +        gid_t tmp_gid;
> > > +        mode_t tmp_mode;
> > > +        dev_t tmp_dev;
> > > +
> > > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.uid",
> > > +                                 &tmp_uid, sizeof(uid_t)) > 0) {
> > > +            stbuf->st_uid =3D le32_to_cpu(tmp_uid);
> > > +        }
> > > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.gid",
> > > +                                 &tmp_gid, sizeof(gid_t)) > 0) {
> > > +            stbuf->st_gid =3D le32_to_cpu(tmp_gid);
> > > +        }
> > > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.mode",
> > > +                                 &tmp_mode, sizeof(mode_t)) > 0) {
> > > +            stbuf->st_mode =3D (stbuf->st_mode & ~0777);
> > > +            stbuf->st_mode |=3D le32_to_cpu(tmp_mode);
> > > +        }
> > > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.rdev",
> > > +                                 &tmp_dev, sizeof(dev_t)) > 0) {
> > > +            stbuf->st_rdev =3D le64_to_cpu(tmp_dev);
> > > +        }
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        errno =3D EOPNOTSUPP;
> > > +        g_free(dirpath);
> > > +        g_free(name);
> > > +        return -1;
> > > +    }
> > > +
> > > +    g_free(dirpath);
> > > +    g_free(name);
> > > +
> > > +    return err;
> > > +}
> > > +
> > > +static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const =
char *name,
> > > +                       int flags, FsCred *credp, V9fsFidOpenState *f=
s)
> > > +{
> > > +    int fd =3D -1;
> > > +    int err =3D -1;
> > > +    char *full_file_name;
> > > +
> > > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > > +        local_is_mapped_file_metadata(fs_ctx, name)) {
> > > +        errno =3D EINVAL;
> > > +        return -1;
> > > +    }
> > > +
> > > +    full_file_name =3D merge_fs_path(dir_path->data, name);
> > > +    fd =3D openfile_with_ctx(fs_ctx, full_file_name, flags, credp->f=
c_mode);
> > > +    g_free(full_file_name);
> > > +
> > > +    err =3D fd;
> > > +    fs->fd =3D fd;
> > > +    goto out;
> > > +
> > > +    close_preserve_errno(fd);
> > > +out:
> > > +    return err;
> > > +}
> > > +
> > > +
> > > +static int local_symlink(FsContext *fs_ctx, const char *oldpath,
> > > +                         V9fsPath *dir_path, const char *name, FsCre=
d *credp)
> > > +{
> > > +    return -1;
> >=20
> > Why ? This would require a detailed comment and also to set errno.
>=20
> An error number set is missing here, should be ENOTSUP.
>=20
> >=20
> > > +}
> > > +
> > > +static int local_link(FsContext *ctx, V9fsPath *oldpath,
> > > +                      V9fsPath *dirpath, const char *name)
> > > +{
> > > +    return -1;
> >=20
> > Same remark.
> >=20
> > Before re-posting, you really need to come up with a detailed plan
> > around symlinks.
> >=20
> > Cheers,
> >=20
> > --
> > Greg
>=20
> An error number set is missing here, should be ENOTSUP.
> Windows does not support symbolic link in its POSIX API library.
> It also require Administrator privileges and NTFS (need to turn on symbol=
ic link support).
>=20
> Currently, I think it is very hard to support symbolic link on Windows ho=
st.
>=20
> >=20
> > > +}
> > > +
> > > +static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t s=
ize)
> > > +{
> > > +    int fd, ret;
> > > +
> > > +    fd =3D local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
> > > +    if (fd =3D=3D -1) {
> > > +        return -1;
> > > +    }
> > > +    ret =3D ftruncate(fd, size);
> > > +    close_preserve_errno(fd);
> > > +    return ret;
> > > +}
> > > +
> > > +static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred =
*credp)
> > > +{
> > > +    char *full_file_name;
> > > +    char *dirpath =3D g_path_get_dirname(fs_path->data);
> > > +    char *name =3D g_path_get_basename(fs_path->data);
> > > +    int ret =3D -1;
> > > +    DIR *dir;
> > > +
> > > +    dir =3D local_opendir_nofollow(fs_ctx, dirpath);
> > > +    if (dir =3D=3D NULL) {
> > > +        goto out;
> > > +    }
> > > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, dirpath);
> > > +
> > > +    if ((credp->fc_uid =3D=3D -1 && credp->fc_gid =3D=3D -1) ||
> > > +        (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> > > +        (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > > +        /* Windows does not support chown() */
> > > +        ret =3D -1;
> > > +        errno =3D ENOTSUP;
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > > +        ret =3D local_set_xattrat(full_file_name, name, credp);
> > > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        ret =3D local_set_mapped_file_attrat(full_file_name, name, c=
redp);
> > > +    }
> > > +    g_free(full_file_name);
> > > +    closedir(dir);
> > > +out:
> > > +    g_free(name);
> > > +    g_free(dirpath);
> > > +    return ret;
> > > +}
> > > +
> > > +static int local_utimensat(FsContext *s, V9fsPath *fs_path,
> > > +                           const struct timespec *buf)
> > > +{
> > > +    struct utimbuf tm;
> > > +    char *full_file_name;
> > > +    int err;
> > > +
> > > +    tm.actime =3D buf[0].tv_sec;
> > > +    tm.modtime =3D buf[1].tv_sec;
> > > +
> > > +    full_file_name =3D merge_fs_path(s->fs_root, fs_path->data);
> > > +    err =3D utime(full_file_name, &tm);
> > > +    g_free(full_file_name);
> > > +
> > > +    return err;
> > > +}
> > > +
> > > +static int local_unlinkat_common(FsContext *ctx, const char *dirname,
> > > +                                 const char *name, int flags)
> > > +{
> > > +    int ret;
> > > +    char *full_file_name;
> > > +    char *full_dir_name;
> > > +
> > > +    full_dir_name =3D merge_fs_path(ctx->fs_root, dirname);
> > > +    full_file_name =3D merge_fs_path(full_dir_name, name);
> > > +
> > > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        char *full_meta_dir_name;
> > > +        char *full_meta_file_name;
> > > +
> > > +        /*
> > > +         * We need to remove the metadata as well:
> > > +         * - the metadata directory if we're removing a directory
> > > +         * - the metadata file in the parent's metadata directory
> > > +         *
> > > +         * If any of these are missing (ie, ENOENT) then we're proba=
bly
> > > +         * trying to remove something that wasn't created in mapped-=
file
> > > +         * mode. We just ignore the error.
> > > +         */
> > > +
> > > +        if ((flags & AT_REMOVEDIR) !=3D 0) {
> > > +            full_meta_dir_name =3D merge_fs_path(full_file_name,
> > VIRTFS_META_DIR);
> > > +            ret =3D rmdir(full_meta_dir_name);
> > > +            g_free(full_meta_dir_name);
> > > +
> > > +            if (ret < 0 && errno !=3D ENOENT) {
> > > +                g_free(full_file_name);
> > > +                g_free(full_dir_name);
> > > +                return -1;
> > > +            }
> > > +        }
> > > +
> > > +        full_meta_dir_name =3D merge_fs_path(full_dir_name, VIRTFS_M=
ETA_DIR);
> > > +        full_meta_file_name =3D merge_fs_path(full_meta_dir_name, na=
me);
> > > +        ret =3D remove(full_meta_file_name);
> > > +        g_free(full_meta_dir_name);
> > > +        g_free(full_meta_file_name);
> > > +
> > > +        if (ret < 0 && errno !=3D ENOENT) {
> > > +            g_free(full_dir_name);
> > > +            g_free(full_file_name);
> > > +
> > > +            return -1;
> > > +        }
> > > +    }
> > > +
> > > +    if ((flags & AT_REMOVEDIR) !=3D 0) {
> > > +        ret =3D rmdir(full_file_name);
> > > +    } else {
> > > +        ret =3D remove(full_file_name);
> > > +    }
> > > +
> > > +    g_free(full_dir_name);
> > > +    g_free(full_file_name);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static int local_remove(FsContext *ctx, const char *path)
> > > +{
> > > +    int err;
> > > +    DIR *stream;
> > > +    char *full_file_name;
> > > +    char *dirpath =3D g_path_get_dirname(path);
> > > +    char *name =3D g_path_get_basename(path);
> > > +    int flags =3D 0;
> > > +
> > > +    full_file_name =3D merge_fs_path(ctx->fs_root, path);
> > > +    stream =3D opendir(full_file_name);
> > > +    if (stream !=3D NULL) {
> > > +        closedir(stream);
> > > +        flags |=3D AT_REMOVEDIR;
> > > +    }
> > > +    err =3D local_unlinkat_common(ctx, dirpath, name, flags);
> > > +
> > > +    g_free(name);
> > > +    g_free(dirpath);
> > > +    g_free(full_file_name);
> > > +    return err;
> > > +}
> > > +
> > > +static int local_fsync(FsContext *ctx, int fid_type,
> > > +                       V9fsFidOpenState *fs, int datasync)
> > > +{
> > > +    if (fid_type !=3D P9_FID_DIR) {
> > > +        return _commit(fs->fd);
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > > +static int local_statfs(FsContext *s, V9fsPath *fs_path, struct stat=
fs *stbuf)
> > > +{
> > > +    int ret;
> > > +    ret =3D qemu_statfs(s->fs_root, stbuf);
> > > +    if (ret =3D=3D 0) {
> > > +        /* use context address as fsid */
> > > +        memcpy(&stbuf->f_fsid, s, sizeof(long));
> > > +    }
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static ssize_t local_lgetxattr(FsContext *ctx, V9fsPath *fs_path,
> > > +                               const char *name, void *value, size_t=
 size)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static ssize_t local_llistxattr(FsContext *ctx, V9fsPath *fs_path,
> > > +                                void *value, size_t size)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static int local_lsetxattr(FsContext *ctx, V9fsPath *fs_path, const =
char *name,
> > > +                           void *value, size_t size, int flags)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static int local_lremovexattr(FsContext *ctx, V9fsPath *fs_path,
> > > +                              const char *name)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static int local_name_to_path(FsContext *ctx, V9fsPath *dir_path,
> > > +                              const char *name, V9fsPath *target)
> > > +{
> > > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > > +        local_is_mapped_file_metadata(ctx, name)) {
> > > +        errno =3D EINVAL;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (dir_path) {
> > > +        if (!strcmp(name, ".")) {
> > > +            /* "." relative to "foo/bar" is "foo/bar" */
> > > +            v9fs_path_copy(target, dir_path);
> > > +        } else if (!strcmp(name, "..")) {
> > > +            if (!strcmp(dir_path->data, ".")) {
> > > +                /* ".." relative to the root is "." */
> > > +                v9fs_path_sprintf(target, ".");
> > > +            } else {
> > > +                char *tmp =3D g_path_get_dirname(dir_path->data);
> > > +                /*
> > > +                 * Symbolic links are resolved by the client. We can=
 assume
> > > +                 * that ".." relative to "foo/bar" is equivalent to =
"foo"
> > > +                 */
> > > +                v9fs_path_sprintf(target, "%s", tmp);
> > > +                g_free(tmp);
> > > +            }
> > > +        } else {
> > > +            assert(!strchr(name, '/'));
> > > +            v9fs_path_sprintf(target, "%s/%s", dir_path->data, name);
> > > +        }
> > > +    } else if (!strcmp(name, "/") || !strcmp(name, ".") ||
> > > +               !strcmp(name, "..")) {
> > > +            /* This is the root fid */
> > > +        v9fs_path_sprintf(target, ".");
> > > +    } else {
> > > +        assert(!strchr(name, '/'));
> > > +        v9fs_path_sprintf(target, "./%s", name);
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > > +static int local_renameat(FsContext *ctx, V9fsPath *olddir,
> > > +                          const char *old_name, V9fsPath *newdir,
> > > +                          const char *new_name)
> > > +{
> > > +    return -1;
> > > +}
> > > +
> > > +static int local_rename(FsContext *ctx, const char *oldpath,
> > > +                        const char *newpath)
> > > +{
> > > +    int err;
> > > +
> > > +    char *full_old_name;
> > > +    char *full_new_name;
> > > +
> > > +    full_old_name =3D merge_fs_path(ctx->fs_root, oldpath);
> > > +    full_new_name =3D merge_fs_path(ctx->fs_root, newpath);
> > > +
> > > +    err =3D rename(full_old_name, full_new_name);
> > > +
> > > +    g_free(full_old_name);
> > > +    g_free(full_new_name);
> > > +
> > > +    return err;
> > > +}
> > > +
> > > +static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
> > > +                          const char *name, int flags)
> > > +{
> > > +    int ret;
> > > +
> > > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > > +        local_is_mapped_file_metadata(ctx, name)) {
> > > +        errno =3D EINVAL;
> > > +        return -1;
> > > +    }
> > > +
> > > +    ret =3D local_unlinkat_common(ctx, dir->data, name, flags);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static int check_filesystem_type(char *fs_root, int export_flags)
> > > +{
> > > +    HANDLE hFile;
> > > +    wchar_t FsName[MAX_PATH + 1] =3D {0};
> > > +    wchar_t NtfsName[5] =3D {'N', 'T', 'F', 'S'};
> > > +
> > > +    if ((export_flags & V9FS_SM_MAPPED) =3D=3D 0) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    hFile =3D CreateFile(fs_root, GENERIC_READ, FILE_SHARE_READ, NUL=
L,
> > > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NU=
LL);
> > > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* Get file system type name */
> > > +    if (GetVolumeInformationByHandleW(hFile, NULL, 0, NULL, NULL, NU=
LL,
> > > +                                      FsName, MAX_PATH + 1) =3D=3D 0=
) {
> > > +        CloseHandle(hFile);
> > > +        return -1;
> > > +    }
> > > +    CloseHandle(hFile);
> > > +
> > > +    if (wcscmp(FsName, NtfsName) !=3D 0) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int local_init(FsContext *ctx, Error **errp)
> > > +{
> > > +    LocalData *data =3D g_malloc(sizeof(*data));
> > > +
> > > +    struct stat StatBuf;
> > > +
> > > +    if (stat(ctx->fs_root, &StatBuf) !=3D 0) {
> > > +        error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs=
_root);
> > > +        goto err;
> > > +    }
> > > +
> > > +    /*
> > > +     * security_model=3Dmapped(-xattr) requires a fileystem on Windo=
ws that
> > > +     * supports Alternate Data Stream (ADS). NTFS is one of them, an=
d is
> > > +     * probably most popular on Windows. It is fair enough to assume
> > > +     * Windows users to use NTFS for the mapped security model.
> > > +     */
> > > +    if (check_filesystem_type(ctx->fs_root, ctx->export_flags) !=3D =
0) {
> > > +        error_setg_errno(errp, EINVAL, "require NTFS file system whe=
n "
> > > +                         "security_model is mapped or mapped-xattr");
> > > +        goto err;
> > > +    }
> > > +
> > > +    if (ctx->export_flags & V9FS_SM_PASSTHROUGH) {
> > > +        ctx->xops =3D passthrough_xattr_ops;
> > > +    } else if (ctx->export_flags & V9FS_SM_MAPPED) {
> > > +        ctx->xops =3D mapped_xattr_ops;
> > > +    } else if (ctx->export_flags & V9FS_SM_NONE) {
> > > +        ctx->xops =3D none_xattr_ops;
> > > +    } else if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        /*
> > > +         * xattr operation for mapped-file and passthrough
> > > +         * remain same.
> > > +         */
> > > +        ctx->xops =3D passthrough_xattr_ops;
> > > +    }
> > > +    ctx->export_flags |=3D V9FS_PATHNAME_FSCONTEXT;
> > > +
> > > +    ctx->private =3D data;
> > > +    return 0;
> > > +
> > > +err:
> > > +    g_free(data);
> > > +    return -1;
> > > +}
> > > +
> > > +static void local_cleanup(FsContext *ctx)
> > > +{
> > > +    LocalData *data =3D ctx->private;
> > > +
> > > +    if (!data) {
> > > +        return;
> > > +    }
> > > +
> > > +    close(data->mountfd);
> > > +    g_free(data);
> > > +}
> > > +
> > > +static void error_append_security_model_hint(Error *const *errp)
> > > +{
> > > +    error_append_hint(errp, "Valid options are: security_model=3D"
> > > +                      "[passthrough|mapped-xattr|mapped-file|none]\n=
");
> > > +}
> > > +
> > > +static int local_parse_opts(QemuOpts *opts, FsDriverEntry *fse, Erro=
r **errp)
> > > +{
> > > +    ERRP_GUARD();
> > > +    const char *sec_model =3D qemu_opt_get(opts, "security_model");
> > > +    const char *path =3D qemu_opt_get(opts, "path");
> > > +    const char *multidevs =3D qemu_opt_get(opts, "multidevs");
> > > +
> > > +    if (!sec_model) {
> > > +        error_setg(errp, "security_model property not set");
> > > +        error_append_security_model_hint(errp);
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (!strcmp(sec_model, "passthrough")) {
> > > +        fse->export_flags |=3D V9FS_SM_PASSTHROUGH;
> > > +    } else if (!strcmp(sec_model, "mapped") ||
> > > +               !strcmp(sec_model, "mapped-xattr")) {
> > > +        fse->export_flags |=3D V9FS_SM_MAPPED;
> > > +    } else if (!strcmp(sec_model, "none")) {
> > > +        fse->export_flags |=3D V9FS_SM_NONE;
> > > +    } else if (!strcmp(sec_model, "mapped-file")) {
> > > +        fse->export_flags |=3D V9FS_SM_MAPPED_FILE;
> > > +    } else {
> > > +        error_setg(errp, "invalid security_model property '%s'", sec=
_model);
> > > +        error_append_security_model_hint(errp);
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (multidevs) {
> > > +        if (!strcmp(multidevs, "remap")) {
> > > +            fse->export_flags &=3D ~V9FS_FORBID_MULTIDEVS;
> > > +            fse->export_flags |=3D V9FS_REMAP_INODES;
> > > +        } else if (!strcmp(multidevs, "forbid")) {
> > > +            fse->export_flags &=3D ~V9FS_REMAP_INODES;
> > > +            fse->export_flags |=3D V9FS_FORBID_MULTIDEVS;
> > > +        } else if (!strcmp(multidevs, "warn")) {
> > > +            fse->export_flags &=3D ~V9FS_FORBID_MULTIDEVS;
> > > +            fse->export_flags &=3D ~V9FS_REMAP_INODES;
> > > +        } else {
> > > +            error_setg(errp, "invalid multidevs property '%s'",
> > > +                       multidevs);
> > > +            error_append_hint(errp, "Valid options are: multidevs=3D"
> > > +                              "[remap|forbid|warn]\n");
> > > +            return -1;
> > > +        }
> > > +    }
> > > +
> > > +    if (!path) {
> > > +        error_setg(errp, "path property not set");
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (fsdev_throttle_parse_opts(opts, &fse->fst, errp)) {
> > > +        error_prepend(errp, "invalid throttle configuration: ");
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (fse->export_flags & V9FS_SM_MAPPED ||
> > > +        fse->export_flags & V9FS_SM_MAPPED_FILE) {
> > > +        fse->fmode =3D
> > > +            qemu_opt_get_number(opts, "fmode", SM_LOCAL_MODE_BITS) &=
 0777;
> > > +        fse->dmode =3D
> > > +            qemu_opt_get_number(opts, "dmode", SM_LOCAL_DIR_MODE_BIT=
S) & 0777;
> > > +    } else {
> > > +        if (qemu_opt_find(opts, "fmode")) {
> > > +            error_setg(errp, "fmode is only valid for mapped securit=
y modes");
> > > +            return -1;
> > > +        }
> > > +        if (qemu_opt_find(opts, "dmode")) {
> > > +            error_setg(errp, "dmode is only valid for mapped securit=
y modes");
> > > +            return -1;
> > > +        }
> > > +    }
> > > +
> > > +    fse->path =3D g_strdup(path);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +FileOperations local_ops =3D {
> > > +    .parse_opts =3D local_parse_opts,
> > > +    .init  =3D local_init,
> > > +    .cleanup =3D local_cleanup,
> > > +    .lstat =3D local_lstat,
> > > +    .readlink =3D local_readlink,
> > > +    .close =3D local_close,
> > > +    .closedir =3D local_closedir,
> > > +    .open =3D local_open,
> > > +    .opendir =3D local_opendir,
> > > +    .rewinddir =3D local_rewinddir,
> > > +    .telldir =3D local_telldir,
> > > +    .readdir =3D local_readdir,
> > > +    .seekdir =3D local_seekdir,
> > > +    .preadv =3D local_preadv,
> > > +    .pwritev =3D local_pwritev,
> > > +    .chmod =3D local_chmod,
> > > +    .mknod =3D local_mknod,
> > > +    .mkdir =3D local_mkdir,
> > > +    .fstat =3D local_fstat,
> > > +    .open2 =3D local_open2,
> > > +    .symlink =3D local_symlink,
> > > +    .link =3D local_link,
> > > +    .truncate =3D local_truncate,
> > > +    .rename =3D local_rename,
> > > +    .chown =3D local_chown,
> > > +    .utimensat =3D local_utimensat,
> > > +    .remove =3D local_remove,
> > > +    .fsync =3D local_fsync,
> > > +    .statfs =3D local_statfs,
> > > +    .lgetxattr =3D local_lgetxattr,
> > > +    .llistxattr =3D local_llistxattr,
> > > +    .lsetxattr =3D local_lsetxattr,
> > > +    .lremovexattr =3D local_lremovexattr,
> > > +    .name_to_path =3D local_name_to_path,
> > > +    .renameat  =3D local_renameat,
> > > +    .unlinkat =3D local_unlinkat,
> > > +};
> > > diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
> > > new file mode 100644
> > > index 0000000000..d9b35e7425
> > > --- /dev/null
> > > +++ b/hw/9pfs/9p-util-win32.c
> > > @@ -0,0 +1,303 @@
> > > +/*
> > > + * 9p utilities (Windows Implementation)
> > > + *
> > > + * Copyright (c) 2022 Wind River Systems, Inc.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > > +#include "9p.h"
> > > +#include "9p-util.h"
> > > +#include "9p-linux-errno.h"
> > > +#include <windows.h>
> > > +#include <dirent.h>
> > > +
> > > +#ifndef V9FS_MAGIC
> > > +#define V9FS_MAGIC 0x53465039 /* string "9PFS" */
> > > +#endif
> > > +
> > > +static int build_ads_name(char *namebuf, size_t namebuflen,
> > > +                          const char *dirname, const char *filename,
> > > +                          const char *ads_name)
> > > +{
> > > +    size_t totalsize;
> > > +
> > > +    totalsize =3D strlen(dirname) + strlen(filename) + strlen(ads_na=
me) + 3;
> > > +    if (totalsize  > namebuflen) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    /*
> > > +     * NTFS ADS (Alternate Data Streams) name format:
> > > +     *  filename:ads_name
> > > +     * e.g.
> > > +     *  d:\1.txt:my_ads_name
> > > +     */
> > > +    strcpy(namebuf, dirname);
> > > +    strcat(namebuf, "\\");
> > > +    strcat(namebuf, filename);
> > > +    strcat(namebuf, ":");
> > > +    strcat(namebuf, ads_name);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static ssize_t copy_ads_name(char *namebuf, size_t namebuflen,
> > > +                             char *fulladsname)
> > > +{
> > > +    char *p1, *p2;
> > > +
> > > +    /*
> > > +     * NTFS ADS (Alternate Data Streams) name from emurate data form=
at:
> > > +     *  :ads_name:$DATA
> > > +     * e.g.
> > > +     *  :my_ads_name:$DATA
> > > +     *
> > > +     * ADS name from FindNextStreamW() always have ":$DATA" string a=
t the end
> > > +     *
> > > +     * This function copy ADS name to namebuf.
> > > +     */
> > > +
> > > +    p1 =3D strchr(fulladsname, ':');
> > > +    if (p1 =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    p2 =3D strchr(p1 + 1, ':');
> > > +    if (p2 =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* skip empty ads name */
> > > +    if (p2 - p1 =3D=3D 1) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (p2 - p1 + 1 > namebuflen) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    memcpy(namebuf, p1 + 1, p2 - p1 - 1);
> > > +    namebuf[p2 - p1 - 1] =3D '\0';
> > > +
> > > +    return p2 - p1;
> > > +}
> > > +
> > > +ssize_t fgetxattrat_nofollow(const char *dirname, const char *filena=
me,
> > > +                             const char *name, void *value, size_t s=
ize)
> > > +{
> > > +    HANDLE hStream;
> > > +    char ADSFileName[NAME_MAX + 1] =3D {0};
> > > +    DWORD dwBytesRead;
> > > +
> > > +    if (build_ads_name(ADSFileName, NAME_MAX, dirname, filename, nam=
e) < 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hStream =3D CreateFile(ADSFileName, GENERIC_READ, FILE_SHARE_REA=
D, NULL,
> > > +                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
> > > +    if (hStream =3D=3D INVALID_HANDLE_VALUE &&
> > > +        GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > > +        errno =3D ENODATA;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) =3D=3D FA=
LSE) {
> > > +        errno =3D EIO;
> > > +        CloseHandle(hStream);
> > > +        return -1;
> > > +    }
> > > +
> > > +    CloseHandle(hStream);
> > > +
> > > +    return dwBytesRead;
> > > +}
> > > +
> > > +ssize_t flistxattrat_nofollow(const char *dirname, const char *filen=
ame,
> > > +                              char *list, size_t size)
> > > +{
> > > +    WCHAR WideCharStr[NAME_MAX + 1] =3D { 0 };
> > > +    char fulladsname[NAME_MAX + 1];
> > > +    char *full_fs_name =3D merge_fs_path(dirname, filename);
> > > +    int ret;
> > > +    HANDLE hFind;
> > > +    WIN32_FIND_STREAM_DATA fsd;
> > > +    BOOL bFindNext;
> > > +    char *listptr =3D list;
> > > +    size_t listleftsize =3D size;
> > > +
> > > +    /*
> > > +     * ADS emurate function only have WCHAR version, need to  covert=
 filename
> > > +     * to WCHAR string.
> > > +     */
> > > +
> > > +    ret =3D MultiByteToWideChar(CP_UTF8, 0, full_fs_name,
> > > +                              strlen(full_fs_name), WideCharStr, NAM=
E_MAX);
> > > +    g_free(full_fs_name);
> > > +    if (ret =3D=3D 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hFind =3D FindFirstStreamW(WideCharStr, FindStreamInfoStandard, =
&fsd, 0);
> > > +    if (hFind =3D=3D INVALID_HANDLE_VALUE) {
> > > +        errno =3D ENODATA;
> > > +        return -1;
> > > +    }
> > > +
> > > +    do {
> > > +        memset(fulladsname, 0, sizeof(fulladsname));
> > > +
> > > +        /*
> > > +         * ADS emurate function only have WCHAR version, need to cov=
ert
> > > +         * cStreamName to utf-8 string.
> > > +         */
> > > +
> > > +        ret =3D WideCharToMultiByte(CP_UTF8, 0,
> > > +                                  fsd.cStreamName, wcslen(fsd.cStrea=
mName) + 1,
> > > +                                  fulladsname, sizeof(fulladsname) -=
 1,
> > > +                                  NULL, NULL);
> > > +
> > > +        if (ret =3D=3D 0) {
> > > +            if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
> > > +                errno =3D ERANGE;
> > > +            }
> > > +            CloseHandle(hFind);
> > > +            return -1;
> > > +        }
> > > +
> > > +        ret =3D copy_ads_name(listptr, listleftsize, fulladsname);
> > > +        if (ret < 0) {
> > > +            errno =3D ERANGE;
> > > +            CloseHandle(hFind);
> > > +            return -1;
> > > +        }
> > > +
> > > +        listptr =3D listptr + ret;
> > > +        listleftsize =3D listleftsize - ret;
> > > +
> > > +        bFindNext =3D FindNextStreamW(hFind, &fsd);
> > > +    } while (bFindNext);
> > > +
> > > +    CloseHandle(hFind);
> > > +
> > > +    return size - listleftsize;
> > > +}
> > > +
> > > +ssize_t fremovexattrat_nofollow(const char *dirname, const char *fil=
ename,
> > > +                                const char *name)
> > > +{
> > > +    char ADSFileName[NAME_MAX + 1] =3D {0};
> > > +
> > > +    if (build_ads_name(ADSFileName, NAME_MAX, dirname, filename, nam=
e) < 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (DeleteFile(ADSFileName) !=3D 0) {
> > > +        if (GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > > +            errno =3D ENODATA;
> > > +            return -1;
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +int fsetxattrat_nofollow(const char *dirname, const char *filename,
> > > +                         const char *name, void *value, size_t size,=
 int flags)
> > > +{
> > > +    HANDLE hStream;
> > > +    char ADSFileName[NAME_MAX + 1] =3D {0};
> > > +    DWORD dwBytesWrite;
> > > +
> > > +    if (build_ads_name(ADSFileName, NAME_MAX, dirname, filename, nam=
e) < 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    hStream =3D CreateFile(ADSFileName, GENERIC_WRITE, FILE_SHARE_RE=
AD, NULL,
> > > +                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
> > > +    if (hStream =3D=3D INVALID_HANDLE_VALUE) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (WriteFile(hStream, value, size, &dwBytesWrite, NULL) =3D=3D =
FALSE) {
> > > +        errno =3D EIO;
> > > +        CloseHandle(hStream);
> > > +        return -1;
> > > +    }
> > > +
> > > +    CloseHandle(hStream);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +int qemu_mknodat(const char *dirname, const char *filename,
> > > +                 mode_t mode, dev_t dev)
> > > +{
> > > +    errno =3D ENOTSUP;
> > > +    return -1;
> > > +}
> > > +
> > > +int qemu_statfs(const char *fs_root, struct statfs *stbuf)
> > > +{
> > > +    HANDLE hFile;
> > > +    char RealPath[NAME_MAX + 1];
> > > +    unsigned long SectorsPerCluster;
> > > +    unsigned long BytesPerSector;
> > > +    unsigned long NumberOfFreeClusters;
> > > +    unsigned long TotalNumberOfClusters;
> > > +
> > > +    hFile =3D CreateFile(fs_root, GENERIC_READ, FILE_SHARE_READ, NUL=
L,
> > > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NU=
LL);
> > > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* get real path of root */
> > > +    if (GetFinalPathNameByHandle(hFile, RealPath, sizeof(RealPath),
> > > +                                 FILE_NAME_NORMALIZED) =3D=3D 0) {
> > > +        errno =3D EIO;
> > > +        CloseHandle(hFile);
> > > +        return -1;
> > > +    }
> > > +
> > > +    CloseHandle(hFile);
> > > +
> > > +    /*
> > > +     * GetFinalPathNameByHandle will return real path start with "\\=
\\?\\".
> > > +     * "C:\\123" will be "\\\\?\\C:\\123"
> > > +     * Skip first 4 bytes and truncate the string at offset 7, it wi=
ll get
> > > +     * the real root directory like "C:\\", this is parameter GetDis=
kFreeSpace
> > > +     * needed.
> > > +     */
> > > +
> > > +    RealPath[7] =3D '\0';
> > > +
> > > +    if (GetDiskFreeSpace(RealPath + 4, &SectorsPerCluster, &BytesPer=
Sector,
> > > +                         &NumberOfFreeClusters, &TotalNumberOfCluste=
rs) =3D=3D 0) {
> > > +        errno =3D EIO;
> > > +        return -1;
> > > +    }
> > > +
> > > +    stbuf->f_type =3D V9FS_MAGIC;
> > > +    stbuf->f_bsize =3D (__fsword_t)(SectorsPerCluster * BytesPerSect=
or);
> > > +    stbuf->f_blocks =3D (fsblkcnt_t)TotalNumberOfClusters;
> > > +    stbuf->f_bfree =3D (fsblkcnt_t)NumberOfFreeClusters;
> > > +    stbuf->f_bavail =3D (fsblkcnt_t)NumberOfFreeClusters;
> > > +    stbuf->f_files =3D -1;
> > > +    stbuf->f_ffree =3D -1;
> > > +    stbuf->f_namelen =3D NAME_MAX;
> > > +    stbuf->f_frsize =3D 0;
> > > +    stbuf->f_flags =3D 0;
> > > +
> > > +    return 0;
> > > +}
> > > diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
> > > index 9ae69dd8db..5623f0e2ef 100644
> > > --- a/hw/9pfs/9p-xattr.c
> > > +++ b/hw/9pfs/9p-xattr.c
> > > @@ -78,10 +78,45 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const cha=
r *path,
> > >      char *orig_value, *orig_value_start;
> > >      ssize_t xattr_len, parsed_len =3D 0, attr_len;
> > >      char *dirpath, *name;
> > > +#ifdef CONFIG_WIN32
> > > +    char *full_dir_path;
> > > +    DIR *dir;
> > > +#else
> > >      int dirfd;
> > > +#endif
> > >
> > >      /* Get the actual len */
> > >      dirpath =3D g_path_get_dirname(path);
> > > +
> > > +#ifdef CONFIG_WIN32
> > > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > > +    if (dir =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +    closedir(dir);
> > > +
> > > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > > +    g_free(dirpath);
> > > +
> > > +    name =3D g_path_get_basename(path);
> > > +    xattr_len =3D flistxattrat_nofollow(full_dir_path, name, value, =
0);
> > > +    if (xattr_len <=3D 0) {
> > > +        g_free(name);
> > > +        g_free(full_dir_path);
> > > +        return xattr_len;
> > > +    }
> > > +
> > > +    /* Now fetch the xattr and find the actual size */
> > > +    orig_value =3D g_malloc(xattr_len);
> > > +    xattr_len =3D flistxattrat_nofollow(full_dir_path, name, orig_va=
lue,
> > > +                                      xattr_len);
> > > +    g_free(name);
> > > +    g_free(full_dir_path);
> > > +    if (xattr_len < 0) {
> > > +        g_free(orig_value);
> > > +        return -1;
> > > +    }
> > > +#else
> > >      dirfd =3D local_opendir_nofollow(ctx, dirpath);
> > >      g_free(dirpath);
> > >      if (dirfd =3D=3D -1) {
> > > @@ -105,6 +140,7 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const cha=
r *path,
> > >          g_free(orig_value);
> > >          return -1;
> > >      }
> > > +#endif
> > >
> > >      /* store the orig pointer */
> > >      orig_value_start =3D orig_value;
> > > @@ -166,6 +202,31 @@ int v9fs_remove_xattr(FsContext *ctx,
> > >  ssize_t local_getxattr_nofollow(FsContext *ctx, const char *path,
> > >                                  const char *name, void *value, size_=
t size)
> > >  {
> > > +#ifdef CONFIG_WIN32
> > > +    char *dirpath =3D g_path_get_dirname(path);
> > > +    char *filename =3D g_path_get_basename(path);
> > > +    char *full_dir_path;
> > > +    DIR *dir;
> > > +    ssize_t ret =3D -1;
> > > +
> > > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > > +
> > > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > > +    if (dir =3D=3D NULL) {
> > > +        goto out;
> > > +    }
> > > +    closedir(dir);
> > > +
> > > +    ret =3D fgetxattrat_nofollow(full_dir_path, filename,
> > > +                               name, value, size);
> > > +
> > > +out:
> > > +    g_free(full_dir_path);
> > > +    g_free(dirpath);
> > > +    g_free(filename);
> > > +
> > > +    return ret;
> > > +#else
> > >      char *dirpath =3D g_path_get_dirname(path);
> > >      char *filename =3D g_path_get_basename(path);
> > >      int dirfd;
> > > @@ -177,11 +238,13 @@ ssize_t local_getxattr_nofollow(FsContext *ctx,=
 const char
> > *path,
> > >      }
> > >
> > >      ret =3D fgetxattrat_nofollow(dirfd, filename, name, value, size);
> > > +
> > >      close_preserve_errno(dirfd);
> > >  out:
> > >      g_free(dirpath);
> > >      g_free(filename);
> > >      return ret;
> > > +#endif
> > >  }
> > >
> > >  ssize_t pt_getxattr(FsContext *ctx, const char *path, const char *na=
me,
> > > @@ -194,6 +257,30 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, =
const char
> > *path,
> > >                                  const char *name, void *value, size_=
t size,
> > >                                  int flags)
> > >  {
> > > +#ifdef CONFIG_WIN32
> > > +    char *dirpath =3D g_path_get_dirname(path);
> > > +    char *filename =3D g_path_get_basename(path);
> > > +    char *full_dir_path;
> > > +    DIR *dir;
> > > +    ssize_t ret =3D -1;
> > > +
> > > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > > +
> > > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > > +    if (dir =3D=3D NULL) {
> > > +        goto out;
> > > +    }
> > > +    closedir(dir);
> > > +
> > > +    ret =3D fsetxattrat_nofollow(full_dir_path, filename, name,
> > > +                               value, size, flags);
> > > +out:
> > > +    g_free(full_dir_path);
> > > +    g_free(dirpath);
> > > +    g_free(filename);
> > > +    return ret;
> > > +
> > > +#else
> > >      char *dirpath =3D g_path_get_dirname(path);
> > >      char *filename =3D g_path_get_basename(path);
> > >      int dirfd;
> > > @@ -210,6 +297,7 @@ out:
> > >      g_free(dirpath);
> > >      g_free(filename);
> > >      return ret;
> > > +#endif
> > >  }
> > >
> > >  int pt_setxattr(FsContext *ctx, const char *path, const char *name, =
void *value,
> > > @@ -221,6 +309,30 @@ int pt_setxattr(FsContext *ctx, const char *path=
, const
> > char *name, void *value,
> > >  ssize_t local_removexattr_nofollow(FsContext *ctx, const char *path,
> > >                                     const char *name)
> > >  {
> > > +#ifdef CONFIG_WIN32
> > > +    char *dirpath =3D g_path_get_dirname(path);
> > > +    char *filename =3D g_path_get_basename(path);
> > > +    char *full_dir_path;
> > > +    DIR *dir;
> > > +    ssize_t ret =3D -1;
> > > +
> > > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > > +
> > > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > > +    if (dir =3D=3D NULL) {
> > > +        goto out;
> > > +    }
> > > +    closedir(dir);
> > > +
> > > +    ret =3D fremovexattrat_nofollow(full_dir_path, filename, name);
> > > +
> > > +out:
> > > +    g_free(full_dir_path);
> > > +    g_free(dirpath);
> > > +    g_free(filename);
> > > +    return ret;
> > > +
> > > +#else
> > >      char *dirpath =3D g_path_get_dirname(path);
> > >      char *filename =3D g_path_get_basename(path);
> > >      int dirfd;
> > > @@ -237,6 +349,7 @@ out:
> > >      g_free(dirpath);
> > >      g_free(filename);
> > >      return ret;
> > > +#endif
> > >  }
> > >
> > >  int pt_removexattr(FsContext *ctx, const char *path, const char *nam=
e)
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 225f31fc31..a04889c1d6 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -38,6 +38,10 @@
> > >  #include "migration/blocker.h"
> > >  #include "qemu/xxhash.h"
> > >  #include <math.h>
> > > +#ifdef CONFIG_WIN32
> > > +#define UTIME_NOW   ((1l << 30) - 1l)
> > > +#define UTIME_OMIT  ((1l << 30) - 2l)
> > > +#endif
> > >
> > >  int open_fd_hw;
> > >  int total_open_fd;
> > > @@ -986,9 +990,11 @@ static int stat_to_qid(V9fsPDU *pdu, const struc=
t stat *stbuf,
> > V9fsQID *qidp)
> > >      if (S_ISDIR(stbuf->st_mode)) {
> > >          qidp->type |=3D P9_QID_TYPE_DIR;
> > >      }
> > > +#ifndef CONFIG_WIN32
> > >      if (S_ISLNK(stbuf->st_mode)) {
> > >          qidp->type |=3D P9_QID_TYPE_SYMLINK;
> > >      }
> > > +#endif
> > >
> > >      return 0;
> > >  }
> > > @@ -1095,6 +1101,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9f=
sString
> > *extension)
> > >          ret |=3D S_IFDIR;
> > >      }
> > >
> > > +#ifndef CONFIG_WIN32
> > >      if (mode & P9_STAT_MODE_SYMLINK) {
> > >          ret |=3D S_IFLNK;
> > >      }
> > > @@ -1104,6 +1111,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9f=
sString
> > *extension)
> > >      if (mode & P9_STAT_MODE_NAMED_PIPE) {
> > >          ret |=3D S_IFIFO;
> > >      }
> > > +#endif
> > >      if (mode & P9_STAT_MODE_DEVICE) {
> > >          if (extension->size && extension->data[0] =3D=3D 'c') {
> > >              ret |=3D S_IFCHR;
> > > @@ -1116,6 +1124,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9f=
sString
> > *extension)
> > >          ret |=3D S_IFREG;
> > >      }
> > >
> > > +#ifndef CONFIG_WIN32
> > >      if (mode & P9_STAT_MODE_SETUID) {
> > >          ret |=3D S_ISUID;
> > >      }
> > > @@ -1125,6 +1134,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9f=
sString
> > *extension)
> > >      if (mode & P9_STAT_MODE_SETVTX) {
> > >          ret |=3D S_ISVTX;
> > >      }
> > > +#endif
> > >
> > >      return ret;
> > >  }
> > > @@ -1180,6 +1190,7 @@ static uint32_t stat_to_v9mode(const struct sta=
t *stbuf)
> > >          mode |=3D P9_STAT_MODE_DIR;
> > >      }
> > >
> > > +#ifndef CONFIG_WIN32
> > >      if (S_ISLNK(stbuf->st_mode)) {
> > >          mode |=3D P9_STAT_MODE_SYMLINK;
> > >      }
> > > @@ -1191,11 +1202,13 @@ static uint32_t stat_to_v9mode(const struct s=
tat *stbuf)
> > >      if (S_ISFIFO(stbuf->st_mode)) {
> > >          mode |=3D P9_STAT_MODE_NAMED_PIPE;
> > >      }
> > > +#endif
> > >
> > >      if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
> > >          mode |=3D P9_STAT_MODE_DEVICE;
> > >      }
> > >
> > > +#ifndef CONFIG_WIN32
> > >      if (stbuf->st_mode & S_ISUID) {
> > >          mode |=3D P9_STAT_MODE_SETUID;
> > >      }
> > > @@ -1207,6 +1220,7 @@ static uint32_t stat_to_v9mode(const struct sta=
t *stbuf)
> > >      if (stbuf->st_mode & S_ISVTX) {
> > >          mode |=3D P9_STAT_MODE_SETVTX;
> > >      }
> > > +#endif
> > >
> > >      return mode;
> > >  }
> > > @@ -1245,9 +1259,16 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU=
 *pdu,
> > V9fsPath *path,
> > >              return err;
> > >          }
> > >      } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
> > > +#ifndef CONFIG_WIN32
> > >          v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> > >                  S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > >                  major(stbuf->st_rdev), minor(stbuf->st_rdev));
> > > +#else
> > > +        v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> > > +                S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > > +                0, 0);
> > > +#endif
> > > +
> > >      } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
> > >          v9fs_string_sprintf(&v9stat->extension, "%s %lu",
> > >                  "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
> > > @@ -1315,7 +1336,11 @@ static int32_t blksize_to_iounit(const V9fsPDU=
 *pdu,
> > int32_t blksize)
> > >
> > >  static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat =
*stbuf)
> > >  {
> > > +#ifndef CONFIG_WIN32
> > >      return blksize_to_iounit(pdu, stbuf->st_blksize);
> > > +#else
> > > +    return blksize_to_iounit(pdu, 0);
> > > +#endif
> > >  }
> > >
> > >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbu=
f,
> > > @@ -1329,6 +1354,14 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, c=
onst struct
> > stat *stbuf,
> > >      v9lstat->st_gid =3D stbuf->st_gid;
> > >      v9lstat->st_rdev =3D stbuf->st_rdev;
> > >      v9lstat->st_size =3D stbuf->st_size;
> > > +
> > > +#ifdef CONFIG_WIN32
> > > +    v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > > +    v9lstat->st_blocks =3D 0;
> > > +    v9lstat->st_atime_sec =3D stbuf->st_atime;
> > > +    v9lstat->st_mtime_sec =3D stbuf->st_mtime;
> > > +    v9lstat->st_ctime_sec =3D stbuf->st_ctime;
> > > +#else /* !CONFIG_WIN32 */
> > >      v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > >      v9lstat->st_blocks =3D stbuf->st_blocks;
> > >      v9lstat->st_atime_sec =3D stbuf->st_atime;
> > > @@ -1343,6 +1376,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, co=
nst struct
> > stat *stbuf,
> > >      v9lstat->st_mtime_nsec =3D stbuf->st_mtim.tv_nsec;
> > >      v9lstat->st_ctime_nsec =3D stbuf->st_ctim.tv_nsec;
> > >  #endif
> > > +#endif /* CONFIG_WIN32 */
> > > +
> > >      /* Currently we only support BASIC fields in stat */
> > >      v9lstat->st_result_mask =3D P9_STATS_BASIC;
> > >
> > > @@ -1759,7 +1794,11 @@ static bool name_is_illegal(const char *name)
> > >
> > >  static bool same_stat_id(const struct stat *a, const struct stat *b)
> > >  {
> > > +#ifdef CONFIG_WIN32
> > > +    return 0;
> > > +#else
> > >      return a->st_dev =3D=3D b->st_dev && a->st_ino =3D=3D b->st_ino;
> > > +#endif  /* CONFIG_WIN32 */
> > >  }
> > >
> > >  static void coroutine_fn v9fs_walk(void *opaque)
> > > @@ -2300,7 +2339,11 @@ static int coroutine_fn v9fs_do_readdir_with_s=
tat(V9fsPDU
> > *pdu,
> > >          count +=3D len;
> > >          v9fs_stat_free(&v9stat);
> > >          v9fs_path_free(&path);
> > > +#ifndef CONFIG_WIN32
> > >          saved_dir_pos =3D qemu_dirent_off(dent);
> > > +#else
> > > +        saved_dir_pos =3D v9fs_co_telldir(pdu, fidp);
> > > +#endif
> > >      }
> > >
> > >      v9fs_readdir_unlock(&fidp->fs.dir);
> > > @@ -2501,14 +2544,32 @@ static int coroutine_fn v9fs_do_readdir(V9fsP=
DU *pdu,
> > V9fsFidState *fidp,
> > >              qid.version =3D 0;
> > >          }
> > >
> > > +#ifdef CONFIG_WIN32
> > > +        /*
> > > +         * Windows does not have dent->d_off, get offset by calling =
telldir()
> > > +         * manually.
> > > +         */
> > > +        off =3D v9fs_co_telldir(pdu, fidp);
> > > +#else
> > >          off =3D qemu_dirent_off(dent);
> > > +#endif
> > >          v9fs_string_init(&name);
> > >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> > >
> > > +#ifdef CONFIG_WIN32
> > > +        /*
> > > +         * Windows does not have dent->d_type
> > > +         */
> > > +
> > > +        len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> > > +                          &qid, off,
> > > +                          0, &name);
> > > +#else
> > >          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing=
 count) */
> > >          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> > >                            &qid, off,
> > >                            dent->d_type, &name);
> > > +#endif
> > >
> > >          v9fs_string_free(&name);
> > >
> > > @@ -2838,8 +2899,14 @@ static void coroutine_fn v9fs_create(void *opa=
que)
> > >          }
> > >
> > >          nmode |=3D perm & 0777;
> > > +
> > > +#ifndef CONFIG_WIN32
> > >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > >                              makedev(major, minor), nmode, &stbuf);
> > > +#else
> > > +        err =3D -ENOTSUP;
> > > +#endif
> > > +
> > >          if (err < 0) {
> > >              goto out;
> > >          }
> > > @@ -2864,8 +2931,12 @@ static void coroutine_fn v9fs_create(void *opa=
que)
> > >          v9fs_path_copy(&fidp->path, &path);
> > >          v9fs_path_unlock(s);
> > >      } else if (perm & P9_STAT_MODE_SOCKET) {
> > > +#ifndef CONFIG_WIN32
> > >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > >                              0, S_IFSOCK | (perm & 0777), &stbuf);
> > > +#else
> > > +        err =3D -ENOTSUP;
> > > +#endif
> > >          if (err < 0) {
> > >              goto out;
> > >          }
> > > @@ -3600,6 +3671,7 @@ out_nofid:
> > >  static void coroutine_fn v9fs_mknod(void *opaque)
> > >  {
> > >
> > > +#ifndef CONFIG_WIN32
> > >      int mode;
> > >      gid_t gid;
> > >      int32_t fid;
> > > @@ -3656,6 +3728,11 @@ out:
> > >  out_nofid:
> > >      pdu_complete(pdu, err);
> > >      v9fs_string_free(&name);
> > > +#else
> > > +    V9fsPDU *pdu =3D opaque;
> > > +
> > > +    pdu_complete(pdu, -1);
> > > +#endif
> > >  }
> > >
> > >  /*
> > > @@ -3928,7 +4005,7 @@ out_nofid:
> > >  #if defined(CONFIG_LINUX)
> > >  /* Currently, only Linux has XATTR_SIZE_MAX */
> > >  #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> > > -#elif defined(CONFIG_DARWIN)
> > > +#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
> > >  /*
> > >   * Darwin doesn't seem to define a maximum xattr size in its user
> > >   * space header, so manually configure it across platforms as 64k.
> > > @@ -3945,6 +4022,7 @@ out_nofid:
> > >
> > >  static void coroutine_fn v9fs_xattrcreate(void *opaque)
> > >  {
> > > +#ifndef CONFIG_WIN32
> > >      int flags, rflags =3D 0;
> > >      int32_t fid;
> > >      uint64_t size;
> > > @@ -4006,10 +4084,15 @@ out_put_fid:
> > >  out_nofid:
> > >      pdu_complete(pdu, err);
> > >      v9fs_string_free(&name);
> > > +#else
> > > +    V9fsPDU *pdu =3D opaque;
> > > +    pdu_complete(pdu, -1);
> > > +#endif
> > >  }
> > >
> > >  static void coroutine_fn v9fs_readlink(void *opaque)
> > >  {
> > > +#ifndef CONFIG_WIN32
> > >      V9fsPDU *pdu =3D opaque;
> > >      size_t offset =3D 7;
> > >      V9fsString target;
> > > @@ -4045,6 +4128,10 @@ out:
> > >      put_fid(pdu, fidp);
> > >  out_nofid:
> > >      pdu_complete(pdu, err);
> > > +#else
> > > +    V9fsPDU *pdu =3D opaque;
> > > +    pdu_complete(pdu, -1);
> > > +#endif
> > >  }
> > >
> > >  static CoroutineEntry *pdu_co_handlers[] =3D {
> > > @@ -4306,6 +4393,7 @@ void v9fs_reset(V9fsState *s)
> > >
> > >  static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
> > >  {
> > > +#ifndef CONFIG_WIN32
> > >      struct rlimit rlim;
> > >      if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
> > >          error_report("Failed to get the resource limit");
> > > @@ -4313,4 +4401,5 @@ static void __attribute__((__constructor__))
> > v9fs_set_fd_limit(void)
> > >      }
> > >      open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
> > >      open_fd_rc =3D rlim.rlim_cur / 2;
> > > +#endif
> > >  }
> > > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > > index 93ba44fb75..2fbe7b831b 100644
> > > --- a/hw/9pfs/codir.c
> > > +++ b/hw/9pfs/codir.c
> > > @@ -78,6 +78,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidSta=
te *fidp,
> > >      int len, err =3D 0;
> > >      int32_t size =3D 0;
> > >      off_t saved_dir_pos;
> > > +#ifdef CONFIG_WIN32
> > > +    off_t next_dir_pos;
> > > +#endif
> > >      struct dirent *dent;
> > >      struct V9fsDirEnt *e =3D NULL;
> > >      V9fsPath path;
> > > @@ -124,6 +127,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFid=
State *fidp,
> > >              break;
> > >          }
> > >
> > > +#ifdef CONFIG_WIN32
> > > +        next_dir_pos =3D s->ops->telldir(&s->ctx, &fidp->fs);
> > > +        if (next_dir_pos < 0) {
> > > +            err =3D next_dir_pos;
> > > +            goto out;
> > > +        }
> > > +#endif
> > > +
> > >          /*
> > >           * stop this loop as soon as it would exceed the allowed max=
imum
> > >           * response message size for the directory entries collected=
 so far,
> > > @@ -168,7 +179,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFid=
State *fidp,
> > >          }
> > >
> > >          size +=3D len;
> > > +#ifndef CONFIG_WIN32
> > >          saved_dir_pos =3D qemu_dirent_off(dent);
> > > +#else
> > > +        saved_dir_pos =3D next_dir_pos;
> > > +#endif
> > >      }
> > >
> > >      /* restore (last) saved position */
>=20


