Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FB555471
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:33:26 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o466O-0007iA-Lt
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4621-000657-RE
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:28:53 -0400
Received: from smtpout30.security-mail.net ([85.31.212.36]:58678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o461t-00015T-Nn
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:28:53 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id 29B2124BD042
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 21:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655926123;
 bh=D4cJdDGo92iZJ06fqm7tm+9HKTymHyt+KTdKv0849Vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=3YwgmwXfQ+whtGs/d6NwbokxIE7jpUmn1TbPg/NXyFHyCix2f5MGHY/+WRsSqA2Bn
 L1WGST8pDGD7ZWYDMt4799ECCJ0VQqEUNdkwu0NIYJ5XSdaap/hc8J689XfEvdEgly
 oYBh3GQ1t48OFQhbxO/5BgXmv4grnGv/NRflgNIk=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id CCA5A24BD00B; Wed, 22 Jun 2022 21:28:42 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx301.security-mail.net (Postfix) with ESMTPS id 359F124BD024; Wed, 22 Jun
 2022 21:28:41 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 46F6227E04CD; Wed, 22 Jun 2022
 21:28:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 2DCF327E04EF; Wed, 22 Jun 2022 21:28:41 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 ykT-YrFkcY3D; Wed, 22 Jun 2022 21:28:41 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 11E6627E04CD; Wed, 22 Jun 2022 21:28:41 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <820b.62b36d69.61078.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2DCF327E04EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655926121;
 bh=FGqrT6fvUWuLMLsaKGgACVlrwQi91QFHz40q8rJ4SeE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=MFbee1Btls7JvZUvi1AUxZjslPbHTTL/9BH1Awr9MVHcJdmDRAmlXdsv2GpIbuqoA
 kL+njrf9IQbw5XVbytG7KOqLtxQL0Q38wN/gHdDmAdG5uMW1xAMOp1BduchcFotGZ7
 mI81DUYtpJQ5zulrfJawIhj9EtlIDYtdsQBxz1RM=
Date: Wed, 22 Jun 2022 21:28:40 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 30/53] semihosting: Split out semihost_sys_write
Message-ID: <20220622192840.GI28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-31-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-31-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.36; envelope-from=lmichel@kalray.eu;
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
> Split out the non-ARM specific portions of SYS_WRITE to a
> reusable function.  This handles all GuestFD.  This removes
> the last use of common_semi_syscall_len.
> 
> Note that gdb_do_syscall %x reads target_ulong, not int.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  6 ++++
>  semihosting/arm-compat-semi.c  | 52 +-------------------------------
>  semihosting/syscalls.c         | 54 ++++++++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 51 deletions(-)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index 20da8138b0..2464467579 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -33,4 +33,10 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
>  void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
>                            GuestFD *gf, target_ulong buf, target_ulong len);
>  
> +void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        int fd, target_ulong buf, target_ulong len);
> +
> +void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
> +                           GuestFD *gf, target_ulong buf, target_ulong len);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 5e11ec307a..d1d35e6032 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -215,8 +215,6 @@ static inline uint32_t get_swi_errno(CPUState *cs)
>  #endif
>  }
>  
> -static target_ulong common_semi_syscall_len;
> -
>  static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
>      if (err) {
> @@ -230,9 +228,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>          /* Fixup syscalls that use nonstardard return conventions.  */
>          target_ulong reg0 = common_semi_arg(cs, 0);
>          switch (reg0) {
> -        case TARGET_SYS_WRITE:
> -            ret = common_semi_syscall_len - ret;
> -            break;
>          case TARGET_SYS_SEEK:
>              ret = 0;
>              break;
> @@ -294,30 +289,10 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
>   * do the work and return the required return value to the guest
>   * via common_semi_cb.
>   */
> -typedef void sys_writefn(CPUState *cs, GuestFD *gf,
> -                         target_ulong buf, uint32_t len);
>  typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
>  typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
>  typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
>  
> -static void host_writefn(CPUState *cs, GuestFD *gf,
> -                         target_ulong buf, uint32_t len)
> -{
> -    CPUArchState *env = cs->env_ptr;
> -    uint32_t ret = 0;
> -    char *s = lock_user(VERIFY_READ, buf, len, 1);
> -    (void) env; /* Used in arm softmmu lock_user implicitly */
> -    if (s) {
> -        ret = write(gf->hostfd, s, len);
> -        unlock_user(s, buf, 0);
> -        if (ret == (uint32_t)-1) {
> -            ret = 0;
> -        }
> -    }
> -    /* Return bytes not written, on error as well. */
> -    common_semi_cb(cs, len - ret, 0);
> -}
> -
>  static void host_isattyfn(CPUState *cs, GuestFD *gf)
>  {
>      common_semi_cb(cs, isatty(gf->hostfd), 0);
> @@ -340,13 +315,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
>      }
>  }
>  
> -static void gdb_writefn(CPUState *cs, GuestFD *gf,
> -                        target_ulong buf, uint32_t len)
> -{
> -    common_semi_syscall_len = len;
> -    gdb_do_syscall(common_semi_cb, "write,%x,%x,%x", gf->hostfd, buf, len);
> -}
> -
>  static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
>  {
>      gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
> @@ -380,13 +348,6 @@ static const uint8_t featurefile_data[] = {
>      SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
>  };
>  
> -static void staticfile_writefn(CPUState *cs, GuestFD *gf,
> -                               target_ulong buf, uint32_t len)
> -{
> -    /* This fd can never be open for writing */
> -    common_semi_cb(cs, -1, EBADF);
> -}
> -
>  static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
>  {
>      common_semi_cb(cs, 0, 0);
> @@ -404,7 +365,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
>  }
>  
>  typedef struct GuestFDFunctions {
> -    sys_writefn *writefn;
>      sys_isattyfn *isattyfn;
>      sys_seekfn *seekfn;
>      sys_flenfn *flenfn;
> @@ -412,19 +372,16 @@ typedef struct GuestFDFunctions {
>  
>  static const GuestFDFunctions guestfd_fns[] = {
>      [GuestFDHost] = {
> -        .writefn = host_writefn,
>          .isattyfn = host_isattyfn,
>          .seekfn = host_seekfn,
>          .flenfn = host_flenfn,
>      },
>      [GuestFDGDB] = {
> -        .writefn = gdb_writefn,
>          .isattyfn = gdb_isattyfn,
>          .seekfn = gdb_seekfn,
>          .flenfn = gdb_flenfn,
>      },
>      [GuestFDStatic] = {
> -        .writefn = staticfile_writefn,
>          .isattyfn = staticfile_isattyfn,
>          .seekfn = staticfile_seekfn,
>          .flenfn = staticfile_flenfn,
> @@ -449,7 +406,6 @@ void do_common_semihosting(CPUState *cs)
>      char * s;
>      int nr;
>      uint32_t ret;
> -    uint32_t len;
>      GuestFD *gf;
>      int64_t elapsed;
>  
> @@ -530,13 +486,7 @@ void do_common_semihosting(CPUState *cs)
>          GET_ARG(0);
>          GET_ARG(1);
>          GET_ARG(2);
> -        len = arg2;
> -
> -        gf = get_guestfd(arg0);
> -        if (!gf) {
> -            goto do_badf;
> -        }
> -        guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
> +        semihost_sys_write(cs, common_semi_rw_cb, arg0, arg1, arg2);
>          break;
>  
>      case TARGET_SYS_READ:
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index d42a190746..5cb12d6adc 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -107,6 +107,13 @@ static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
>                     (target_ulong)gf->hostfd, buf, len);
>  }
>  
> +static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
> +                      GuestFD *gf, target_ulong buf, target_ulong len)
> +{
> +    gdb_do_syscall(complete, "write,%x,%x,%x",
> +                   (target_ulong)gf->hostfd, buf, len);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -193,6 +200,22 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
>      }
>  }
>  
> +static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       GuestFD *gf, target_ulong buf, target_ulong len)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    void *ptr = lock_user(VERIFY_READ, buf, len, 1);
> +    ssize_t ret;
> +
> +    if (!ptr) {
> +        complete(cs, -1, EFAULT);
> +        return;
> +    }
> +    ret = write(gf->hostfd, ptr, len);
> +    complete(cs, ret, ret == -1 ? errno : 0);
> +    unlock_user(ptr, buf, 0);
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -286,3 +309,34 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
>          complete(cs, -1, EBADF);
>      }
>  }
> +
> +void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
> +                           GuestFD *gf, target_ulong buf, target_ulong len)
> +{
> +    switch (gf->type) {
> +    case GuestFDGDB:
> +        gdb_write(cs, complete, gf, buf, len);
> +        break;
> +    case GuestFDHost:
> +        host_write(cs, complete, gf, buf, len);
> +        break;
> +    case GuestFDStatic:
> +        /* Static files are never open for writing: EBADF. */
> +        complete(cs, -1, EBADF);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        int fd, target_ulong buf, target_ulong len)
> +{
> +    GuestFD *gf = get_guestfd(fd);
> +
> +    if (gf) {
> +        semihost_sys_write_gf(cs, complete, gf, buf, len);
> +    } else {
> +        complete(cs, -1, EBADF);
> +    }
> +}
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=c32f.629fcee1.e7f15.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+30%2F53%5D+semihosting%3A+Split+out+semihost_sys_write&verdict=C&c=3bbac77ccd2af6af6edbaa9dc0a61a8e124e1221
> 

-- 





