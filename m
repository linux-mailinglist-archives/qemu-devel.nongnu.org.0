Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E5615003
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opt5T-0002nw-Px; Tue, 01 Nov 2022 11:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opt5S-0002no-0X
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:21:58 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opt5O-0005vh-U7
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=tykxnIw7OfWL4yqgZa+CQxnyEbq3ecmU4UeLi+cmNWU=; b=rvgTM+23I24eLGuJ4gGQgmhEOx
 /GaP/WopavEbvrOMDjor4BTWSB8ZdJlSsAucVg24i+s2chAFUBQAEd2Jp7AZjZy3LwIoBaBPN5rlx
 MyoQahsSyP6ftxtW7iogdM6HRkKiDzHcMe7uqGwoDDjIsSXuC+k+d57M7v/wtK4FTVe1DIUX7Eh05
 D++xiiAzzi5QqDCH2yC8p1gW+YSOCZaeurnAQ7HVC9Gs5C/ySxOWQZBtMs6QnMsdiE8HvDuwCp0ZQ
 s8GFOhxVaf7hKRER64wmMfkeVmkw745hrCvl9U5oHp0kwqP9OxXEToupRsuCBleGr6/8fA6b4bvHs
 CJW7TQr56NG8i67HSpnY9Ou3Ml7FtH1M073GFZBnrgLuO5PCGYImSnAaxbyKPT47JzpdmOivTOOFg
 MCp27LtVJfn46XuwV6064PiCXIT7vTVsrDuwX5K20xgQc22PxYOUGcnTeOQyTAIKqEe8W5/O8CJYz
 mOgjASHhmgiIpYVmXyy0MF4es/WenJRMW1GDWJko3dkPAx3VO4k+lqFFC5eB34QgRa0Jj/T3Mx7E+
 wt3XkHwNyybkEqz/w6EtYib8KdudbOTYhy8cdjm9T7exEfu7gxxon0GeAppXC25sSC1J3PfEfSrTw
 101anKY9fA7yfGScvqEsyOgHu0ac1o9SG914xWZ9g=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>, Greg Kurz <groug@kaod.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 11/16] hw/9pfs: Add Linux error number definition
Date: Tue, 01 Nov 2022 16:21:51 +0100
Message-ID: <3980771.K8829Pglg3@silver>
In-Reply-To: <20221024045759.448014-12-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-12-bin.meng@windriver.com>
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

On Monday, October 24, 2022 6:57:54 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> When using 9p2000.L protocol, the errno should use the Linux errno.
> Currently magic numbers with comments are used. Replace these with
> macros for future expansion.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/9pfs/9p-linux-errno.h | 151 +++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p-util.h        |  38 ++++++----
>  2 files changed, 176 insertions(+), 13 deletions(-)
>  create mode 100644 hw/9pfs/9p-linux-errno.h
> 
> diff --git a/hw/9pfs/9p-linux-errno.h b/hw/9pfs/9p-linux-errno.h
> new file mode 100644
> index 0000000000..56c37fa293
> --- /dev/null
> +++ b/hw/9pfs/9p-linux-errno.h
> @@ -0,0 +1,151 @@
> +/*
> + * 9p Linux errno translation definition
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include <errno.h>
> +
> +#ifndef QEMU_9P_LINUX_ERRNO_H
> +#define QEMU_9P_LINUX_ERRNO_H
> +
> +/*
> + * This file contains the Linux errno definitions to translate errnos set by
> + * the 9P server (running on non-Linux hosts) to a corresponding errno value.
> + *
> + * This list should be periodically reviewed and updated; particularly for
> + * errnos that might be set as a result of a file system operation.
> + */

Yeah, that's my main concern here. I wonder if there is isn't a better
maintainable solution at least for the list of Linux errors, so that we don't
have to manually update the L_ macros below.

> +
> +#define L_EPERM             1   /* Operation not permitted */
> +#define L_ENOENT            2   /* No such file or directory */
> +#define L_ESRCH             3   /* No such process */
> +#define L_EINTR             4   /* Interrupted system call */
> +#define L_EIO               5   /* I/O error */
> +#define L_ENXIO             6   /* No such device or address */
> +#define L_E2BIG             7   /* Argument list too long */
> +#define L_ENOEXEC           8   /* Exec format error */
> +#define L_EBADF             9   /* Bad file number */
> +#define L_ECHILD            10  /* No child processes */
> +#define L_EAGAIN            11  /* Try again */
> +#define L_ENOMEM            12  /* Out of memory */
> +#define L_EACCES            13  /* Permission denied */
> +#define L_EFAULT            14  /* Bad address */
> +#define L_ENOTBLK           15  /* Block device required */
> +#define L_EBUSY             16  /* Device or resource busy */
> +#define L_EEXIST            17  /* File exists */
> +#define L_EXDEV             18  /* Cross-device link */
> +#define L_ENODEV            19  /* No such device */
> +#define L_ENOTDIR           20  /* Not a directory */
> +#define L_EISDIR            21  /* Is a directory */
> +#define L_EINVAL            22  /* Invalid argument */
> +#define L_ENFILE            23  /* File table overflow */
> +#define L_EMFILE            24  /* Too many open files */
> +#define L_ENOTTY            25  /* Not a typewriter */
> +#define L_ETXTBSY           26  /* Text file busy */
> +#define L_EFBIG             27  /* File too large */
> +#define L_ENOSPC            28  /* No space left on device */
> +#define L_ESPIPE            29  /* Illegal seek */
> +#define L_EROFS             30  /* Read-only file system */
> +#define L_EMLINK            31  /* Too many links */
> +#define L_EPIPE             32  /* Broken pipe */
> +#define L_EDOM              33  /* Math argument out of domain of func */
> +#define L_ERANGE            34  /* Math result not representable */
> +#define L_EDEADLK           35  /* Resource deadlock would occur */
> +#define L_ENAMETOOLONG      36  /* File name too long */
> +#define L_ENOLCK            37  /* No record locks available */
> +#define L_ENOSYS            38  /* Function not implemented */
> +#define L_ENOTEMPTY         39  /* Directory not empty */
> +#define L_ELOOP             40  /* Too many symbolic links encountered */
> +#define L_ENOMSG            42  /* No message of desired type */
> +#define L_EIDRM             43  /* Identifier removed */
> +#define L_ECHRNG            44  /* Channel number out of range */
> +#define L_EL2NSYNC          45  /* Level 2 not synchronized */
> +#define L_EL3HLT            46  /* Level 3 halted */
> +#define L_EL3RST            47  /* Level 3 reset */
> +#define L_ELNRNG            48  /* Link number out of range */
> +#define L_EUNATCH           49  /* Protocol driver not attached */
> +#define L_ENOCSI            50  /* No CSI structure available */
> +#define L_EL2HLT            51  /* Level 2 halted */
> +#define L_EBADE             52  /* Invalid exchange */
> +#define L_EBADR             53  /* Invalid request descriptor */
> +#define L_EXFULL            54  /* Exchange full */
> +#define L_ENOANO            55  /* No anode */
> +#define L_EBADRQC           56  /* Invalid request code */
> +#define L_EBADSLT           57  /* Invalid slot */
> +#define L_EBFONT            58  /* Bad font file format */
> +#define L_ENOSTR            59  /* Device not a stream */
> +#define L_ENODATA           61  /* No data available */
> +#define L_ETIME             62  /* Timer expired */
> +#define L_ENOSR             63  /* Out of streams resources */
> +#define L_ENONET            64  /* Machine is not on the network */
> +#define L_ENOPKG            65  /* Package not installed */
> +#define L_EREMOTE           66  /* Object is remote */
> +#define L_ENOLINK           67  /* Link has been severed */
> +#define L_EADV              68  /* Advertise error */
> +#define L_ESRMNT            69  /* Srmount error */
> +#define L_ECOMM             70  /* Communication error on send */
> +#define L_EPROTO            71  /* Protocol error */
> +#define L_EMULTIHOP         72  /* Multihop attempted */
> +#define L_EDOTDOT           73  /* RFS specific error */
> +#define L_EBADMSG           74  /* Not a data message */
> +#define L_EOVERFLOW         75  /* Value too large for defined data type */
> +#define L_ENOTUNIQ          76  /* Name not unique on network */
> +#define L_EBADFD            77  /* File descriptor in bad state */
> +#define L_EREMCHG           78  /* Remote address changed */
> +#define L_ELIBACC           79  /* Can not access a needed shared library */
> +#define L_ELIBBAD           80  /* Accessing a corrupted shared library */
> +#define L_ELIBSCN           81  /* .lib section in a.out corrupted */
> +#define L_ELIBMAX           82  /* Attempting to link in too many shared libs */
> +#define L_ELIBEXEC          83  /* Cannot exec a shared library directly */
> +#define L_EILSEQ            84  /* Illegal byte sequence */
> +#define L_ERESTART          85  /* Interrupted system call should be restarted */
> +#define L_ESTRPIPE          86  /* Streams pipe error */
> +#define L_EUSERS            87  /* Too many users */
> +#define L_ENOTSOCK          88  /* Socket operation on non-socket */
> +#define L_EDESTADDRREQ      89  /* Destination address required */
> +#define L_EMSGSIZE          90  /* Message too long */
> +#define L_EPROTOTYPE        91  /* Protocol wrong type for socket */
> +#define L_ENOPROTOOPT       92  /* Protocol not available */
> +#define L_EPROTONOSUPPORT   93  /* Protocol not supported */
> +#define L_ESOCKTNOSUPPORT   94  /* Socket type not supported */
> +#define L_EOPNOTSUPP        95  /* Operation not supported on transport endpoint */
> +#define L_EPFNOSUPPORT      96  /* Protocol family not supported */
> +#define L_EAFNOSUPPORT      97  /* Address family not supported by protocol */
> +#define L_EADDRINUSE        98  /* Address already in use */
> +#define L_EADDRNOTAVAIL     99  /* Cannot assign requested address */
> +#define L_ENETDOWN          100 /* Network is down */
> +#define L_ENETUNREACH       101 /* Network is unreachable */
> +#define L_ENETRESET         102 /* Network dropped connection because of reset */
> +#define L_ECONNABORTED      103 /* Software caused connection abort */
> +#define L_ECONNRESET        104 /* Connection reset by peer */
> +#define L_ENOBUFS           105 /* No buffer space available */
> +#define L_EISCONN           106 /* Transport endpoint is already connected */
> +#define L_ENOTCONN          107 /* Transport endpoint is not connected */
> +#define L_ESHUTDOWN         108 /* Cannot send after transport endpoint shutdown */
> +#define L_ETOOMANYREFS      109 /* Too many references: cannot splice */
> +#define L_ETIMEDOUT         110 /* Connection timed out */
> +#define L_ECONNREFUSED      111 /* Connection refused */
> +#define L_EHOSTDOWN         112 /* Host is down */
> +#define L_EHOSTUNREACH      113 /* No route to host */
> +#define L_EALREADY          114 /* Operation already in progress */
> +#define L_EINPROGRESS       115 /* Operation now in progress */
> +#define L_ESTALE            116 /* Stale NFS file handle */
> +#define L_EUCLEAN           117 /* Structure needs cleaning */
> +#define L_ENOTNAM           118 /* Not a XENIX named type file */
> +#define L_ENAVAIL           119 /* No XENIX semaphores available */
> +#define L_EISNAM            120 /* Is a named type file */
> +#define L_EREMOTEIO         121 /* Remote I/O error */
> +#define L_EDQUOT            122 /* Quota exceeded */
> +#define L_ENOMEDIUM         123 /* No medium found */
> +#define L_EMEDIUMTYPE       124 /* Wrong medium type */
> +#define L_ECANCELED         125 /* Operation Canceled */
> +#define L_ENOKEY            126 /* Required key not available */
> +#define L_EKEYEXPIRED       127 /* Key has expired */
> +#define L_EKEYREVOKED       128 /* Key has been revoked */
> +#define L_EKEYREJECTED      129 /* Key was rejected by service */
> +#define L_EOWNERDEAD        130 /* Owner died */
> +#define L_ENOTRECOVERABLE   131 /* State not recoverable */
> +
> +#endif /* QEMU_9P_LINUX_ERRNO_H */
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 3d154e9103..281fdcbf8c 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -62,8 +62,11 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
>  #endif
>  }
>  
> +#include "9p-linux-errno.h"
> +
>  /* Translates errno from host -> Linux if needed */
> -static inline int errno_to_dotl(int err) {
> +static inline int errno_to_dotl(int err)
> +{
>  #if defined(CONFIG_LINUX)
>      /* nothing to translate (Linux -> Linux) */
>  #elif defined(CONFIG_DARWIN)
> @@ -73,18 +76,27 @@ static inline int errno_to_dotl(int err) {
>       * FIXME: Only most important errnos translated here yet, this should be
>       * extended to as many errnos being translated as possible in future.
>       */
> -    if (err == ENAMETOOLONG) {
> -        err = 36; /* ==ENAMETOOLONG on Linux */
> -    } else if (err == ENOTEMPTY) {
> -        err = 39; /* ==ENOTEMPTY on Linux */
> -    } else if (err == ELOOP) {
> -        err = 40; /* ==ELOOP on Linux */
> -    } else if (err == ENOATTR) {
> -        err = 61; /* ==ENODATA on Linux */
> -    } else if (err == ENOTSUP) {
> -        err = 95; /* ==EOPNOTSUPP on Linux */
> -    } else if (err == EOPNOTSUPP) {
> -        err = 95; /* ==EOPNOTSUPP on Linux */
> +    switch (err) {
> +    case ENAMETOOLONG:
> +        err = L_ENAMETOOLONG;
> +        break;
> +    case ENOTEMPTY:
> +        err = L_ENOTEMPTY;
> +        break;
> +    case ELOOP:
> +        err = L_ELOOP;
> +        break;
> +    case ENOATTR:
> +        err = L_ENODATA;
> +        break;
> +    case ENOTSUP
> +        err = L_EOPNOTSUPP;
> +        break;
> +    case EOPNOTSUPP:
> +        err = L_EOPNOTSUPP;
> +        break;
> +    default:
> +        break;
>      }

What about a more compact solution like:

    switch (err) {
    case ENAMETOOLONG: return L_ENAMETOOLONG;
    case ENOTEMPTY: return L_ENOTEMPTY;
    ...
    default: return err;
    }

Previously I suggested to use an array-solution with designated initializers
instead, but I guess we don't know how high these error numbers could become
on certain systems.

>  #else
>  #error Missing errno translation to Linux for this host system
> 




