Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB255944F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:43:24 +0200 (CEST)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dyN-0007Uh-1i
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4dsH-0004M7-Vg
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:37:07 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:48399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4drt-00041f-IA
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:37:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 2965F323C32
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656056197;
 bh=q7j1EN+FoWNCq//xAmYSMVAzLIIp5Z6dKVwnJHU8sGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=RTmVKp80FLpBvbr6miSvxtPDxw1JFh1t9thhAKXuxd+N9VkGqywx/C1iA+Ui4Xj+z
 hz4nSAmTsUEO+2YZY7aQ6JOLupqU6S6U+66l5V1bpeOTA3cY17mDJhydV78uXiPgEw
 JAx4zukieNZnvWlh2DRj/oC5iShol3fOPMF4vMzY=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id C9212323C20; Fri, 24 Jun 2022 09:36:36 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 008AF3239D9; Fri, 24 Jun
 2022 09:35:49 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id DABC527E04FB; Fri, 24 Jun 2022
 09:35:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id C43D327E04FD; Fri, 24 Jun 2022 09:35:49 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 PS6aa-QZR3-9; Fri, 24 Jun 2022 09:35:49 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id AA82B27E04FB; Fri, 24 Jun 2022 09:35:49 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <ff16.62b56955.f35c5.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu C43D327E04FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656056149;
 bh=Q2jNr8q16H/XWZXK8E2B2Ty0X9oWsEf+pxoJXPY3Xgs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ZrSchCSnpuVkPY4E+8LRqDdWOc0c10O/zcY3f3z/zfchwZXh7dexvdPicOivvzeoo
 bbN6VWdUgbJunX7EG3yNzMQ/JiciiUu3vFPpN1+asGgbZkPXj/MUS1Mqr+FKPUvJjy
 WrD37cJVBSu5Bgf1DlvrOLOslQ5nZwMPka86mobQ=
Date: Fri, 24 Jun 2022 09:35:49 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 35/53] semihosting: Split out semihost_sys_remove
Message-ID: <20220624073549.GB25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-36-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-36-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.149; envelope-from=lmichel@kalray.eu;
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
> Split out the non-ARM specific portions of SYS_REMOVE to a
> reusable function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  3 +++
>  semihosting/arm-compat-semi.c  | 13 +----------
>  semihosting/syscalls.c         | 40 ++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 12 deletions(-)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index 1ae5ba6716..748a4b5e47 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -49,4 +49,7 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
>                         gdb_syscall_complete_cb flen_cb,
>                         int fd, target_ulong fstat_addr);
>  
> +void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         target_ulong fname, target_ulong fname_len);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 81dd22e1c5..6c9d50176a 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -483,18 +483,7 @@ void do_common_semihosting(CPUState *cs)
>      case TARGET_SYS_REMOVE:
>          GET_ARG(0);
>          GET_ARG(1);
> -        if (use_gdb_syscalls()) {
> -            gdb_do_syscall(common_semi_cb, "unlink,%s",
> -                           arg0, (int)arg1 + 1);
> -            break;
> -        }
> -        s = lock_user_string(arg0);
> -        if (!s) {
> -            goto do_fault;
> -        }
> -        ret = remove(s);
> -        unlock_user(s, arg0, 0);
> -        common_semi_cb(cs, ret, ret ? errno : 0);
> +        semihost_sys_remove(cs, common_semi_cb, arg0, arg1 + 1);
>          break;
>  
>      case TARGET_SYS_RENAME:
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index fff9550c89..5ec4e8f827 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -133,6 +133,18 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
>      gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
>  }
>  
> +static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       target_ulong fname, target_ulong fname_len)
> +{
> +    int len = validate_strlen(cs, fname, fname_len);
> +    if (len < 0) {
> +        complete(cs, -1, -len);
> +        return;
> +    }
> +
> +    gdb_do_syscall(complete, "unlink,%s", fname, len);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -277,6 +289,24 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
>      }
>  }
>  
> +static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        target_ulong fname, target_ulong fname_len)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    char *p;
> +    int ret;
> +
> +    ret = validate_lock_user_string(&p, cs, fname, fname_len);
> +    if (ret < 0) {
> +        complete(cs, -1, -ret);
> +        return;
> +    }
> +
> +    ret = remove(p);
> +    complete(cs, ret, ret ? errno : 0);
> +    unlock_user(p, fname, 0);
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -522,3 +552,13 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
>          g_assert_not_reached();
>      }
>  }
> +
> +void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         target_ulong fname, target_ulong fname_len)
> +{
> +    if (use_gdb_syscalls()) {
> +        gdb_remove(cs, complete, fname, fname_len);
> +    } else {
> +        host_remove(cs, complete, fname, fname_len);
> +    }
> +}
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=56f7.629fcfdf.1710e.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+35%2F53%5D+semihosting%3A+Split+out+semihost_sys_remove&verdict=C&c=39cfc6ff2d269a1766ae8f34c5c705eca3f8a07e
> 

-- 





