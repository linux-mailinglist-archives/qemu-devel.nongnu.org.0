Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27830559402
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:18:25 +0200 (CEST)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4daB-00068w-NM
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4dXr-0005PJ-3U
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:15:59 -0400
Received: from smtpout30.security-mail.net ([85.31.212.38]:30942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4dXn-0000Jy-7v
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:15:58 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id 98A386EF9CB
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656054952;
 bh=Vt649ZnEsEc/R/lBkSIlzESkf3apxBdOp5Z5cm9NXzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Bsfbhii+x+8hzM2gq5WjEWEIwMLI3ZzZE9Hkn6f4qjaVbbDPH0UBg3rQe4/UoWr3Z
 WINa/SWyO8e2z55Gs7bxZz2tVAAYHeJ3uWn3+cfBGjczuhpxqQytQIq+V//d+DgCRz
 vb5tYq7Q6NIAPXkVWBbkdtuUUzXsi50dBMltCskg=
Received: from fx308 (localhost [127.0.0.1]) by fx308.security-mail.net
 (Postfix) with ESMTP id 5C89D6EF9C7; Fri, 24 Jun 2022 09:15:52 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx308.security-mail.net (Postfix) with ESMTPS id C8E106EF9C0; Fri, 24 Jun
 2022 09:15:51 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id AFA4C27E04F8; Fri, 24 Jun 2022
 09:15:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 98FAA27E04FB; Fri, 24 Jun 2022 09:15:51 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 KbnNKxCELr5n; Fri, 24 Jun 2022 09:15:51 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 78A7C27E04F8; Fri, 24 Jun 2022 09:15:51 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <9eb4.62b564a7.c878f.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 98FAA27E04FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656054951;
 bh=1V3/ulyIQ8jgJjyYKjADq7aRtPdLXm7YOyp1xSVXCv0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=MhiBASn7BoTTJ0eyEm292MW6nJDEQoItZ6aBDz01UAHP8/g1jlg0IRr/whbwQnorZ
 2ONPerUvI6jzfIHeZ5ElJGLFv7icOhckE8prkGHG18+F4sFwHcYGPnNkaHsiSHxWud
 hUxZz51c7j8ZW8P5Hy6fmT4i7YIZ+S+d553oxfmg=
Date: Fri, 24 Jun 2022 09:15:51 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 34/53] semihosting: Split out semihost_sys_flen
Message-ID: <20220624071551.GA25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-35-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-35-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.38; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> The ARM-specific SYS_FLEN isn't really something that can be
> reused by other semihosting apis, but there are parts that can
> reused for the implementation of semihost_sys_fstat.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  4 ++
>  semihosting/arm-compat-semi.c  | 74 ++++++----------------------------
>  semihosting/syscalls.c         | 49 ++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 61 deletions(-)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index c60ebafb85..1ae5ba6716 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -45,4 +45,8 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>  void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
>                           int fd);
>  
> +void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
> +                       gdb_syscall_complete_cb flen_cb,
> +                       int fd, target_ulong fstat_addr);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 4529c9df06..81dd22e1c5 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -285,44 +285,25 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
>  }
>  
>  static void
> -common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
> +common_semi_flen_fstat_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
>      if (!err) {
>          /* The size is always stored in big-endian order, extract the value. */
>          uint64_t size;
> -        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
> -                            offsetof(struct gdb_stat, gdb_st_size),
> -                            &size, 8, 0);
> -        ret = be64_to_cpu(size);
> +        if (cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
> +                                offsetof(struct gdb_stat, gdb_st_size),
> +                                &size, 8, 0)) {
> +            ret = -1, err = EFAULT;
> +        } else {
> +            size = be64_to_cpu(size);
> +            if (ret != size) {
> +                ret = -1, err = EOVERFLOW;
> +            }
> +        }
>      }
>      common_semi_cb(cs, ret, err);
>  }
>  
> -/*
> - * Types for functions implementing various semihosting calls
> - * for specific types of guest file descriptor. These must all
> - * do the work and return the required return value to the guest
> - * via common_semi_cb.
> - */
> -typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
> -
> -static void host_flenfn(CPUState *cs, GuestFD *gf)
> -{
> -    struct stat buf;
> -
> -    if (fstat(gf->hostfd, &buf)) {
> -        common_semi_cb(cs, -1, errno);
> -    } else {
> -        common_semi_cb(cs, buf.st_size, 0);
> -    }
> -}
> -
> -static void gdb_flenfn(CPUState *cs, GuestFD *gf)
> -{
> -    gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
> -                   gf->hostfd, common_semi_flen_buf(cs));
> -}
> -
>  #define SHFB_MAGIC_0 0x53
>  #define SHFB_MAGIC_1 0x48
>  #define SHFB_MAGIC_2 0x46
> @@ -340,27 +321,6 @@ static const uint8_t featurefile_data[] = {
>      SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
>  };
>  
> -static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
> -{
> -    common_semi_cb(cs, gf->staticfile.len, 0);
> -}
> -
> -typedef struct GuestFDFunctions {
> -    sys_flenfn *flenfn;
> -} GuestFDFunctions;
> -
> -static const GuestFDFunctions guestfd_fns[] = {
> -    [GuestFDHost] = {
> -        .flenfn = host_flenfn,
> -    },
> -    [GuestFDGDB] = {
> -        .flenfn = gdb_flenfn,
> -    },
> -    [GuestFDStatic] = {
> -        .flenfn = staticfile_flenfn,
> -    },
> -};
> -
>  /*
>   * Do a semihosting call.
>   *
> @@ -379,7 +339,6 @@ void do_common_semihosting(CPUState *cs)
>      char * s;
>      int nr;
>      uint32_t ret;
> -    GuestFD *gf;
>      int64_t elapsed;
>  
>      nr = common_semi_arg(cs, 0) & 0xffffffffU;
> @@ -492,12 +451,8 @@ void do_common_semihosting(CPUState *cs)
>  
>      case TARGET_SYS_FLEN:
>          GET_ARG(0);
> -
> -        gf = get_guestfd(arg0);
> -        if (!gf) {
> -            goto do_badf;
> -        }
> -        guestfd_fns[gf->type].flenfn(cs, gf);
> +        semihost_sys_flen(cs, common_semi_flen_fstat_cb, common_semi_cb,
> +                          arg0, common_semi_flen_buf(cs));
>          break;
>  
>      case TARGET_SYS_TMPNAM:
> @@ -819,9 +774,6 @@ void do_common_semihosting(CPUState *cs)
>          cpu_dump_state(cs, stderr, 0);
>          abort();
>  
> -    do_badf:
> -        common_semi_cb(cs, -1, EBADF);
> -        break;
>      do_fault:
>          common_semi_cb(cs, -1, EFAULT);
>          break;
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 1f1baf7e2d..fff9550c89 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -127,6 +127,12 @@ static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
>      gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
>  }
>  
> +static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                      GuestFD *gf, target_ulong addr)
> +{
> +    gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -259,6 +265,18 @@ static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
>      complete(cs, ret, ret ? 0 : errno);
>  }
>  
> +static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
> +                      GuestFD *gf)
> +{
> +    struct stat buf;
> +
> +    if (fstat(gf->hostfd, &buf) < 0) {
> +        complete(cs, -1, errno);
> +    } else {
> +        complete(cs, buf.st_size, 0);
> +    }
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -311,6 +329,12 @@ static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>      }
>  }
>  
> +static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
> +                            GuestFD *gf)
> +{
> +    complete(cs, gf->staticfile.len, 0);
> +}
> +
>  /*
>   * Syscall entry points.
>   */
> @@ -473,3 +497,28 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
>          g_assert_not_reached();
>      }
>  }
> +
> +void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
> +                       gdb_syscall_complete_cb flen_cb, int fd,
> +                       target_ulong fstat_addr)
> +{
> +    GuestFD *gf = get_guestfd(fd);
> +
> +    if (!gf) {
> +        flen_cb(cs, -1, EBADF);
> +        return;
> +    }
> +    switch (gf->type) {
> +    case GuestFDGDB:
> +        gdb_fstat(cs, fstat_cb, gf, fstat_addr);
> +        break;
> +    case GuestFDHost:
> +        host_flen(cs, flen_cb, gf);
> +        break;
> +    case GuestFDStatic:
> +        staticfile_flen(cs, flen_cb, gf);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=aa67.629fd36d.4e8a3.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+34%2F53%5D+semihosting%3A+Split+out+semihost_sys_flen&verdict=C&c=a467e715c0918a0a23cc8411b01a8abf95ca1564
> 

-- 





