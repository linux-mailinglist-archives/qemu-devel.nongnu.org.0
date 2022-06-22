Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7666455550D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:49:28 +0200 (CEST)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o46Lv-0003uE-9B
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o46Kg-00036d-KJ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:48:10 -0400
Received: from smtpout140.security-mail.net ([85.31.212.145]:58652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o46Ke-0004Hf-DH
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:48:10 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 9CC8E323678
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 21:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655927286;
 bh=/m2cJfmtyIjk+sQjGNce86sogj1/y+ptb5O8zY1ppHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=zTr4JtmrT0ozOTWXHgtrBbpLwN+RaE9Hm6YqE0tFdtIqCIDT9KdMoQoQPJTYT9yrB
 hA5pyoX8kiA5atCoQQfFeJfGzI/wI+YdHG/2ML9/6X1XfzINq8oFbjk9bwrkX+TsNw
 ozFE/6H3dHbw2WobCZelrK6v21ZxQd4yJxjX+L0U=
Received: from fx405 (localhost [127.0.0.1]) by fx405.security-mail.net
 (Postfix) with ESMTP id CD5003235FC; Wed, 22 Jun 2022 21:48:05 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id E85F43235B4; Wed, 22 Jun
 2022 21:48:04 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id C4F7027E04CD; Wed, 22 Jun 2022
 21:48:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id AE40227E04EF; Wed, 22 Jun 2022 21:48:04 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 6sorP-eR63-4; Wed, 22 Jun 2022 21:48:04 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 9481327E04CD; Wed, 22 Jun 2022 21:48:04 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <16c78.62b371f4.e45a1.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AE40227E04EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655927284;
 bh=ZRdXGijgGPcAG1FsAFVidC1kk5vwz4/8i7dx4WmXDEE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Iyi7cmbvs9nlDGXvH1WiewuKy/AUM3GyZ1RcJ8Nuu6WFMy65IkMolI5yAJVN4TlUO
 BkAc1HiPQx9cs8DA1l6xWGUJlsirumBUHl2rBTUlha+AW3KVayJTn/TVWyjULkUj7b
 Au9hXOgNVWIjpnjBM3BH1RRmaQqoPYRrCNUtR6tA=
Date: Wed, 22 Jun 2022 21:48:04 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 33/53] semihosting: Split out semihost_sys_isatty
Message-ID: <20220622194804.GL28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-34-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-34-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.145; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
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
> Split out the non-ARM specific portions of SYS_ISTTY to a
> reusable function.  This handles all GuestFD.
> 
> Add a common_semi_istty_cb helper to translate the Posix
> error return, 0+ENOTTY, to the Arm semihosting not-a-file
> success result.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  3 +++
>  semihosting/arm-compat-semi.c  | 40 ++++++++++++----------------------
>  semihosting/syscalls.c         | 36 ++++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+), 26 deletions(-)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index 841a93d25b..c60ebafb85 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -42,4 +42,7 @@ void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
>  void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>                          int fd, int64_t off, int gdb_whence);
>  
> +void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         int fd);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 8c6c39daf5..4529c9df06 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -247,6 +247,19 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
>      common_semi_set_ret(cs, arg2 - ret);
>  }
>  
> +/*
> + * Convert from Posix ret+errno to Arm SYS_ISTTY return values.
> + * With gdbstub, err is only ever set for protocol errors to EIO.
> + */
> +static void common_semi_istty_cb(CPUState *cs, target_ulong ret,
> +                                 target_ulong err)
> +{
> +    if (err) {
> +        ret = (err == ENOTTY ? 0 : -1);
> +    }
> +    common_semi_cb(cs, ret, err);
> +}
> +
>  /*
>   * SYS_SEEK returns 0 on success, not the resulting offset.
>   */
> @@ -291,14 +304,8 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
>   * do the work and return the required return value to the guest
>   * via common_semi_cb.
>   */
> -typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
>  typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
>  
> -static void host_isattyfn(CPUState *cs, GuestFD *gf)
> -{
> -    common_semi_cb(cs, isatty(gf->hostfd), 0);
> -}
> -
>  static void host_flenfn(CPUState *cs, GuestFD *gf)
>  {
>      struct stat buf;
> @@ -310,11 +317,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
>      }
>  }
>  
> -static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
> -{
> -    gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
> -}
> -
>  static void gdb_flenfn(CPUState *cs, GuestFD *gf)
>  {
>      gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
> @@ -338,32 +340,23 @@ static const uint8_t featurefile_data[] = {
>      SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
>  };
>  
> -static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
> -{
> -    common_semi_cb(cs, 0, 0);
> -}
> -
>  static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
>  {
>      common_semi_cb(cs, gf->staticfile.len, 0);
>  }
>  
>  typedef struct GuestFDFunctions {
> -    sys_isattyfn *isattyfn;
>      sys_flenfn *flenfn;
>  } GuestFDFunctions;
>  
>  static const GuestFDFunctions guestfd_fns[] = {
>      [GuestFDHost] = {
> -        .isattyfn = host_isattyfn,
>          .flenfn = host_flenfn,
>      },
>      [GuestFDGDB] = {
> -        .isattyfn = gdb_isattyfn,
>          .flenfn = gdb_flenfn,
>      },
>      [GuestFDStatic] = {
> -        .isattyfn = staticfile_isattyfn,
>          .flenfn = staticfile_flenfn,
>      },
>  };
> @@ -488,12 +481,7 @@ void do_common_semihosting(CPUState *cs)
>  
>      case TARGET_SYS_ISTTY:
>          GET_ARG(0);
> -
> -        gf = get_guestfd(arg0);
> -        if (!gf) {
> -            goto do_badf;
> -        }
> -        guestfd_fns[gf->type].isattyfn(cs, gf);
> +        semihost_sys_isatty(cs, common_semi_istty_cb, arg0);
>          break;
>  
>      case TARGET_SYS_SEEK:
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 9e3eb464b5..1f1baf7e2d 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -121,6 +121,12 @@ static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>                     (target_ulong)gf->hostfd, off, (target_ulong)gdb_whence);
>  }
>  
> +static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       GuestFD *gf)
> +{
> +    gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -246,6 +252,13 @@ static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>      complete(cs, ret, err);
>  }
>  
> +static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        GuestFD *gf)
> +{
> +    int ret = isatty(gf->hostfd);
> +    complete(cs, ret, ret ? 0 : errno);
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -437,3 +450,26 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>          g_assert_not_reached();
>      }
>  }
> +
> +void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
> +{
> +    GuestFD *gf = get_guestfd(fd);
> +
> +    if (!gf) {
> +        complete(cs, 0, EBADF);
> +        return;
> +    }
> +    switch (gf->type) {
> +    case GuestFDGDB:
> +        gdb_isatty(cs, complete, gf);
> +        break;
> +    case GuestFDHost:
> +        host_isatty(cs, complete, gf);
> +        break;
> +    case GuestFDStatic:
> +        complete(cs, 0, ENOTTY);
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
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=17050.629fd2da.690c4.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+33%2F53%5D+semihosting%3A+Split+out+semihost_sys_isatty&verdict=C&c=17f76f518a03cfc065e040f542bf220e627d8032
> 

-- 





