Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A455B8AC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:43:17 +0200 (CEST)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kKy-0006xr-3R
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kEY-0002lG-TI
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:36:38 -0400
Received: from smtpout140.security-mail.net ([85.31.212.145]:16242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kEW-0002Gt-IF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:36:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id D3923323790
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656318993;
 bh=Mu2IeX+rJmM+B+l8IV9JBwXX7B3Yn+4c1S2DxasYRuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=DiDvZPbIskYsrkbi8Zy6y3DvrvBEYpBagdLCQkdMDVfQXSm8plvye595YcVfH4CTX
 D7y59uLikOkfn85G23HygvNEbx/d1jD0NyEWDQsK2tcv5iL7sq7TCWPDFiBAADu7ZP
 VD4VvU0kv9iZiTwtgbq9CUcEd6pDRjXI9XYjWejM=
Received: from fx405 (localhost [127.0.0.1]) by fx405.security-mail.net
 (Postfix) with ESMTP id 5ADE03236F6; Mon, 27 Jun 2022 10:36:33 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id A4ED13236B9; Mon, 27 Jun
 2022 10:36:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 875FF27E04D6; Mon, 27 Jun 2022
 10:36:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 7109227E04F8; Mon, 27 Jun 2022 10:36:32 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 wKUS0yTXx8KV; Mon, 27 Jun 2022 10:36:32 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 581DE27E04D6; Mon, 27 Jun 2022 10:36:32 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <141ad.62b96c10.a3d51.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7109227E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656318992;
 bh=aW9M2sOULqId0iRoYNBv2yyo1QIPODXEbICoN/Wg3wE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=p6hlbeqNqWvqVUhJ9IK0C3kVl4SeBnw0OaXXoipK5crUi3p4OhDXaGxqhIJi8IXJ4
 vjaylZ6GcLkHo9EGrp4xpR7r/0hTsM8zPIoOx/e9cMNSWW1saLa2SirGI8XVN2lraY
 9NiXmH8P6TlX8X3zvtxNnreY7XxavFzbNkQyWVEI=
Date: Mon, 27 Jun 2022 10:36:31 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 47/53] semihosting: Create qemu_semihosting_guestfd_init
Message-ID: <20220627083631.GC1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-48-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-48-richard.henderson@linaro.org>
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
> For arm-compat, initialize console_{in,out}_gf;
> otherwise, initialize stdio file descriptors.
> 
> This will go some way to cleaning up arm-compat, and
> will allow other semihosting to use normal stdio.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/guestfd.h  |  7 +++++
>  include/semihosting/semihost.h |  1 +
>  linux-user/main.c              |  9 ++++++
>  semihosting/console.c          |  2 ++
>  semihosting/guestfd.c          | 52 +++++++++++++++++++++++++++-------
>  5 files changed, 61 insertions(+), 10 deletions(-)
> 
> diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
> index a7ea1041ea..3d426fedab 100644
> --- a/include/semihosting/guestfd.h
> +++ b/include/semihosting/guestfd.h
> @@ -35,6 +35,13 @@ typedef struct GuestFD {
>      };
>  } GuestFD;
>  
> +/*
> + * For ARM semihosting, we have a separate structure for routing
> + * data for the console which is outside the guest fd address space.
> + */
> +extern GuestFD console_in_gf;
> +extern GuestFD console_out_gf;
> +
>  /**
>   * alloc_guestfd:
>   *
> diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
> index 5b36a76f08..93a3c21b44 100644
> --- a/include/semihosting/semihost.h
> +++ b/include/semihosting/semihost.h
> @@ -64,5 +64,6 @@ int qemu_semihosting_config_options(const char *opt);
>  void qemu_semihosting_chardev_init(void);
>  void qemu_semihosting_console_init(Chardev *);
>  #endif /* CONFIG_USER_ONLY */
> +void qemu_semihosting_guestfd_init(void);
>  
>  #endif /* SEMIHOST_H */
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 651e32f5f2..e44bdb17b8 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -54,6 +54,10 @@
>  #include "loader.h"
>  #include "user-mmap.h"
>  
> +#ifdef CONFIG_SEMIHOSTING
> +#include "semihosting/semihost.h"
> +#endif
> +
>  #ifndef AT_FLAGS_PRESERVE_ARGV0
>  #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
>  #define AT_FLAGS_PRESERVE_ARGV0 (1 << AT_FLAGS_PRESERVE_ARGV0_BIT)
> @@ -906,6 +910,11 @@ int main(int argc, char **argv, char **envp)
>          }
>          gdb_handlesig(cpu, 0);
>      }
> +
> +#ifdef CONFIG_SEMIHOSTING
> +    qemu_semihosting_guestfd_init();
> +#endif
> +
>      cpu_loop(env);
>      /* never exits */
>      return 0;
> diff --git a/semihosting/console.c b/semihosting/console.c
> index b6a342744d..677ec2b176 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -190,4 +190,6 @@ void qemu_semihosting_console_init(Chardev *chr)
>                                   NULL, NULL, &console,
>                                   NULL, true);
>      }
> +
> +    qemu_semihosting_guestfd_init();
>  }
> diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
> index e3122ebba9..b05c52f26f 100644
> --- a/semihosting/guestfd.c
> +++ b/semihosting/guestfd.c
> @@ -10,15 +10,56 @@
>  
>  #include "qemu/osdep.h"
>  #include "exec/gdbstub.h"
> +#include "semihosting/semihost.h"
>  #include "semihosting/guestfd.h"
>  #ifdef CONFIG_USER_ONLY
>  #include "qemu.h"
>  #else
>  #include "semihosting/softmmu-uaccess.h"
> +#include CONFIG_DEVICES
>  #endif
>  
>  static GArray *guestfd_array;
>  
> +#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
> +GuestFD console_in_gf;
> +GuestFD console_out_gf;
> +#endif
> +
> +void qemu_semihosting_guestfd_init(void)
> +{
> +    /* New entries zero-initialized, i.e. type GuestFDUnused */
> +    guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
> +
> +#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
> +    /* For ARM-compat, the console is in a separate namespace. */
> +    if (use_gdb_syscalls()) {
> +        console_in_gf.type = GuestFDGDB;
> +        console_in_gf.hostfd = 0;
> +        console_out_gf.type = GuestFDGDB;
> +        console_out_gf.hostfd = 2;
> +    } else {
> +        console_in_gf.type = GuestFDConsole;
> +        console_out_gf.type = GuestFDConsole;
> +    }
> +#else
> +    /* Otherwise, the stdio file descriptors apply. */
> +    guestfd_array = g_array_set_size(guestfd_array, 3);
> +#ifndef CONFIG_USER_ONLY
> +    if (!use_gdb_syscalls()) {
> +        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, 0);
> +        gf[0].type = GuestFDConsole;
> +        gf[1].type = GuestFDConsole;
> +        gf[2].type = GuestFDConsole;
> +        return;
> +    }
> +#endif
> +    associate_guestfd(0, 0);
> +    associate_guestfd(1, 1);
> +    associate_guestfd(2, 2);
> +#endif
> +}
> +
>  /*
>   * Allocate a new guest file descriptor and return it; if we
>   * couldn't allocate a new fd then return -1.
> @@ -30,11 +71,6 @@ int alloc_guestfd(void)
>  {
>      guint i;
>  
> -    if (!guestfd_array) {
> -        /* New entries zero-initialized, i.e. type GuestFDUnused */
> -        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
> -    }
> -
>      /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
>      for (i = 1; i < guestfd_array->len; i++) {
>          GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
> @@ -61,11 +97,7 @@ static void do_dealloc_guestfd(GuestFD *gf)
>   */
>  static GuestFD *do_get_guestfd(int guestfd)
>  {
> -    if (!guestfd_array) {
> -        return NULL;
> -    }
> -
> -    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
> +    if (guestfd < 0 || guestfd >= guestfd_array->len) {
>          return NULL;
>      }
>  
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=1370f.629fd794.51215.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+47%2F53%5D+semihosting%3A+Create+qemu_semihosting_guestfd_init&verdict=C&c=8a62784599ce0d3c84c0909196f346103514fbcc
> 

-- 





