Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1B55B8AB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:41:09 +0200 (CEST)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kIu-0004Xw-0c
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kEG-0002YO-9I
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:36:20 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:33505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kEC-0002FM-HD
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:36:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 3D4CD5C932D
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656318973;
 bh=QGMXGjXCkjUk/EWdvgydr5dAaxc4WDcfZA5O/veT6F0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=JfQYwXzq6dchvynNUny6uiOpcrSFt5/H5cTuU8IulUIs5pEF1itAI0WBs8IFjOuL7
 jJUDsuB9kgf4a33Uua87EAIskSYVjEE1k4F3t3NeytDefD9RzNM53lSm2mpNJpwI1w
 XPrLSG2d9v5c8B1tMbiLXgnks5ksvn27H1YyEhdU=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 7C50B5C9317; Mon, 27 Jun 2022 10:36:12 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 834C65C92FB; Mon, 27 Jun
 2022 10:36:11 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 2EDF027E04D6; Mon, 27 Jun 2022
 10:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 1881327E04F8; Mon, 27 Jun 2022 10:36:11 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 RGSye60g9Up3; Mon, 27 Jun 2022 10:36:11 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id F354927E04D6; Mon, 27 Jun 2022 10:36:10 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <8433.62b96bfb.82973.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1881327E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656318971;
 bh=yG6oOPU7YlWNzW4otCCE9PTiWz1l37k0fHOo4Aij+UE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=MZLqT6uWRPp7mMNe9YLZYKSAfGPlnwuLVczOuDRkUmtZOVjYDzls9BwDYx7Cw/cSw
 qeveZAPqWxhe6mUkvB66Ahbl5WHZM7A32Vt5okVgowngejiHiKxWa0XwV1NrASFi7P
 jqUMB+aFH1x05tTyrGNtHP03e7lOV7w2I0E9lJXw=
Date: Mon, 27 Jun 2022 10:36:10 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 46/53] semihosting: Add GuestFDConsole
Message-ID: <20220627083610.GB1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-47-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-47-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.143; envelope-from=lmichel@kalray.eu;
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
> Add a GuestFDType for connecting to the semihosting console.
> Hook up to read, write, isatty, and fstat syscalls.
> 
> Note that the arm-specific syscall flen cannot be applied
> to the console, because the console is not a descriptor
> exposed to the guest.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/guestfd.h |  7 ++--
>  semihosting/syscalls.c        | 68 +++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 3 deletions(-)
> 
> diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
> index ef268abe85..a7ea1041ea 100644
> --- a/include/semihosting/guestfd.h
> +++ b/include/semihosting/guestfd.h
> @@ -13,9 +13,10 @@
>  
>  typedef enum GuestFDType {
>      GuestFDUnused = 0,
> -    GuestFDHost = 1,
> -    GuestFDGDB = 2,
> -    GuestFDStatic = 3,
> +    GuestFDHost,
> +    GuestFDGDB,
> +    GuestFDStatic,
> +    GuestFDConsole,
>  } GuestFDType;
>  
>  /*
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 13a9bdeda6..9e499b1751 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -10,6 +10,7 @@
>  #include "exec/gdbstub.h"
>  #include "semihosting/guestfd.h"
>  #include "semihosting/syscalls.h"
> +#include "semihosting/console.h"
>  #ifdef CONFIG_USER_ONLY
>  #include "qemu.h"
>  #else
> @@ -577,6 +578,56 @@ static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
>      complete(cs, gf->staticfile.len, 0);
>  }
>  
> +/*
> + * Console semihosting syscall implementations.
> + */
> +
> +static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         GuestFD *gf, target_ulong buf, target_ulong len)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    char *ptr;
> +    int ret;
> +
> +    ptr = lock_user(VERIFY_WRITE, buf, len, 0);
> +    if (!ptr) {
> +        complete(cs, -1, EFAULT);
> +        return;
> +    }
> +    ret = qemu_semihosting_console_read(cs, ptr, len);
> +    complete(cs, ret, 0);
> +    unlock_user(ptr, buf, ret);
> +}
> +
> +static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
> +                          GuestFD *gf, target_ulong buf, target_ulong len)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    char *ptr = lock_user(VERIFY_READ, buf, len, 1);
> +    int ret;
> +
> +    if (!ptr) {
> +        complete(cs, -1, EFAULT);
> +        return;
> +    }
> +    ret = qemu_semihosting_console_write(ptr, len);
> +    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
> +    unlock_user(ptr, buf, ret);
> +}
> +
> +static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                          GuestFD *gf, target_ulong addr)
> +{
> +    static const struct stat tty_buf = {
> +        .st_mode = 020666,  /* S_IFCHR, ugo+rw */
> +        .st_rdev = 5,       /* makedev(5, 0) -- linux /dev/tty */
> +    };
> +    int ret;
> +
> +    ret = copy_stat_to_user(cs, addr, &tty_buf);
> +    complete(cs, ret ? -1 : 0, ret ? -ret : 0);
> +}
> +
>  /*
>   * Syscall entry points.
>   */
> @@ -608,6 +659,7 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
>          host_close(cs, complete, gf);
>          break;
>      case GuestFDStatic:
> +    case GuestFDConsole:
>          complete(cs, 0, 0);
>          break;
>      default:
> @@ -637,6 +689,9 @@ void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
>      case GuestFDStatic:
>          staticfile_read(cs, complete, gf, buf, len);
>          break;
> +    case GuestFDConsole:
> +        console_read(cs, complete, gf, buf, len);
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -672,6 +727,9 @@ void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
>      case GuestFDHost:
>          host_write(cs, complete, gf, buf, len);
>          break;
> +    case GuestFDConsole:
> +        console_write(cs, complete, gf, buf, len);
> +        break;
>      case GuestFDStatic:
>          /* Static files are never open for writing: EBADF. */
>          complete(cs, -1, EBADF);
> @@ -712,6 +770,9 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
>      case GuestFDStatic:
>          staticfile_lseek(cs, complete, gf, off, gdb_whence);
>          break;
> +    case GuestFDConsole:
> +        complete(cs, -1, ESPIPE);
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -735,6 +796,9 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
>      case GuestFDStatic:
>          complete(cs, 0, ENOTTY);
>          break;
> +    case GuestFDConsole:
> +        complete(cs, 1, 0);
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -760,6 +824,7 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
>      case GuestFDStatic:
>          staticfile_flen(cs, flen_cb, gf);
>          break;
> +    case GuestFDConsole:
>      default:
>          g_assert_not_reached();
>      }
> @@ -781,6 +846,9 @@ void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
>      case GuestFDHost:
>          host_fstat(cs, complete, gf, addr);
>          break;
> +    case GuestFDConsole:
> +        console_fstat(cs, complete, gf, addr);
> +        break;
>      case GuestFDStatic:
>      default:
>          g_assert_not_reached();
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=9e96.629fd636.cb46b.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+46%2F53%5D+semihosting%3A+Add+GuestFDConsole&verdict=C&c=3841184167a9542876ea3c22372ea8e4d69b4137
> 

-- 





