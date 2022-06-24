Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E5559451
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:44:51 +0200 (CEST)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dzm-0000sL-13
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4dw9-0006jT-Vj
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:41:05 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:59958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4dw6-0005ar-9V
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:41:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 320B63D3B0B8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656056459;
 bh=tXM08XT5LDv1z4eJ7f18nrXXRRHS+krPe2ebPZDrjzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OWJBHPgCD1TVXP215aLhqEuJ3Omru5wKy19xDLOebRmLmTP8d6hOpdC75getbvkcX
 DJPC34qtu2zPtqiCPts7N0rh2FAzjt8fzcFiCOZlcwTFiePXImvIWE6wFXh7wk32xC
 lwGeTdLKEn/YQMHxbGdTa5tXaafiuq+0HnQ3G+Ig=
Received: from fx302 (localhost [127.0.0.1]) by fx302.security-mail.net
 (Postfix) with ESMTP id D4ABF3D3B095; Fri, 24 Jun 2022 09:40:58 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx302.security-mail.net (Postfix) with ESMTPS id 57F473D3B073; Fri, 24 Jun
 2022 09:40:58 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 3E73927E04FB; Fri, 24 Jun 2022
 09:40:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 2870C27E04FD; Fri, 24 Jun 2022 09:40:58 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 K0ckIHCDF_MI; Fri, 24 Jun 2022 09:40:58 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 0FA4E27E04FB; Fri, 24 Jun 2022 09:40:58 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <9faa.62b56a8a.578c4.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2870C27E04FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656056458;
 bh=dFpyM/rGKCVP3CeRK3soNB9z+xVQc5zC5N6bDwVEl1I=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=pGi4HSA8IIY+jxMuNTetxrwEKlDCpWc8JkYw1l34Sxr5YrpiAQ0Ib0V1Q9JFbCJ/6
 SF2kskENFoF1KcSt6P5gCdHdN1+zqBX1V1uQar2DuH+XaCx4Eirnd76Gohb3tePEqN
 XAe2IJIROQ79JZrKSC/abm4j70r8zkishKlLnWDQ=
Date: Fri, 24 Jun 2022 09:40:57 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 36/53] semihosting: Split out semihost_sys_rename
Message-ID: <20220624074057.GC25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-37-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-37-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.42; envelope-from=lmichel@kalray.eu;
 helo=mxout.security-mail.net
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
> Split out the non-ARM specific portions of SYS_RENAME to a
> reusable function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  4 +++
>  semihosting/arm-compat-semi.c  | 21 +------------
>  semihosting/syscalls.c         | 57 ++++++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index 748a4b5e47..21430aa0ef 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -52,4 +52,8 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
>  void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>                           target_ulong fname, target_ulong fname_len);
>  
> +void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         target_ulong oname, target_ulong oname_len,
> +                         target_ulong nname, target_ulong nname_len);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 6c9d50176a..da5c80b3d5 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -491,26 +491,7 @@ void do_common_semihosting(CPUState *cs)
>          GET_ARG(1);
>          GET_ARG(2);
>          GET_ARG(3);
> -        if (use_gdb_syscalls()) {
> -            gdb_do_syscall(common_semi_cb, "rename,%s,%s",
> -                           arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
> -        } else {
> -            char *s2;
> -
> -            s = lock_user_string(arg0);
> -            if (!s) {
> -                goto do_fault;
> -            }
> -            s2 = lock_user_string(arg2);
> -            if (!s2) {
> -                unlock_user(s, arg0, 0);
> -                goto do_fault;
> -            }
> -            ret = rename(s, s2);
> -            unlock_user(s2, arg2, 0);
> -            unlock_user(s, arg0, 0);
> -            common_semi_cb(cs, ret, ret ? errno : 0);
> -        }
> +        semihost_sys_rename(cs, common_semi_cb, arg0, arg1 + 1, arg2, arg3 + 1);
>          break;
>  
>      case TARGET_SYS_CLOCK:
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 5ec4e8f827..223916b110 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -145,6 +145,26 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>      gdb_do_syscall(complete, "unlink,%s", fname, len);
>  }
>  
> +static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       target_ulong oname, target_ulong oname_len,
> +                       target_ulong nname, target_ulong nname_len)
> +{
> +    int olen, nlen;
> +
> +    olen = validate_strlen(cs, oname, oname_len);
> +    if (olen < 0) {
> +        complete(cs, -1, -olen);
> +        return;
> +    }
> +    nlen = validate_strlen(cs, nname, nname_len);
> +    if (nlen < 0) {
> +        complete(cs, -1, -nlen);
> +        return;
> +    }
> +
> +    gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -307,6 +327,32 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>      unlock_user(p, fname, 0);
>  }
>  
> +static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        target_ulong oname, target_ulong oname_len,
> +                        target_ulong nname, target_ulong nname_len)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    char *ostr, *nstr;
> +    int ret;
> +
> +    ret = validate_lock_user_string(&ostr, cs, oname, oname_len);
> +    if (ret < 0) {
> +        complete(cs, -1, -ret);
> +        return;
> +    }
> +    ret = validate_lock_user_string(&nstr, cs, nname, nname_len);
> +    if (ret < 0) {
> +        unlock_user(ostr, oname, 0);
> +        complete(cs, -1, -ret);
> +        return;
> +    }
> +
> +    ret = rename(ostr, nstr);
> +    complete(cs, ret, ret ? errno : 0);
> +    unlock_user(ostr, oname, 0);
> +    unlock_user(nstr, nname, 0);
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -562,3 +608,14 @@ void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>          host_remove(cs, complete, fname, fname_len);
>      }
>  }
> +
> +void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         target_ulong oname, target_ulong oname_len,
> +                         target_ulong nname, target_ulong nname_len)
> +{
> +    if (use_gdb_syscalls()) {
> +        gdb_rename(cs, complete, oname, oname_len, nname, nname_len);
> +    } else {
> +        host_rename(cs, complete, oname, oname_len, nname, nname_len);
> +    }
> +}
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=db2a.629fd094.619c9.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+36%2F53%5D+semihosting%3A+Split+out+semihost_sys_rename&verdict=C&c=a6b432f19d21e185c7e45b7892ef238d104b49ae
> 

-- 





