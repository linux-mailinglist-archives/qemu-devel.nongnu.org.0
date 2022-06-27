Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CC55B8B7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:47:38 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kPC-0003bc-0D
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kJq-0006BU-Ih
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:06 -0400
Received: from smtpout30.security-mail.net ([85.31.212.34]:34074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kJo-0003O3-FY
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:06 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx304.security-mail.net (Postfix) with ESMTP id 965A16285C
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656319322;
 bh=a+j4Y2rrO/4dXfDfezFfz+V/6eWG4SzYEYgnHfrc+bM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=sJAzH7qrBIgS1oP8nyrRi/5SWrUqr0brQ+s0mYR/QokhpTce1cMn2o3SZQw0z94mz
 n9Npk63Dt0BlZm9MQMUaMTrvbv23yEyE2cN4LU6yaeapveM+Cvnfz5OdMqcpBaFus8
 sfa0b4F+HxhcdjNk8MKvosdF+C37tLwlJtOcwHrc=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id AF4CC62863; Mon, 27 Jun 2022 10:42:01 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id 179CA62848; Mon, 27 Jun
 2022 10:42:01 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id F08C927E0502; Mon, 27 Jun 2022
 10:42:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id DAFC627E04D6; Mon, 27 Jun 2022 10:42:00 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 6dKqqsMjeUYA; Mon, 27 Jun 2022 10:42:00 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id C184427E0501; Mon, 27 Jun 2022 10:42:00 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <dba6.62b96d59.1672c.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DAFC627E04D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656319320;
 bh=WXarRiNSW1u3U/HG/wJ8kJeq9YkgKqRnCR5Yl0rXhTs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Y1uPcZD1GrrI7uLUrEtK6MDpFcCGR77c/tFEg11h3h/N7MQ35dcDzipUYzFHHwZqu
 FAPcQVMNFpDf/pFBPcrHFdEOnmbmXoLscdB1AZ392yshvLtnE58ywoOXBNCLva7oRc
 rKmaWmlWTJvrYrdhfFdP3ZfUFMX7Zk6tEh9DKJn0=
Date: Mon, 27 Jun 2022 10:42:00 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 50/53] semihosting: Remove qemu_semihosting_console_outc
Message-ID: <20220627084200.GF1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-51-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-51-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.34; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> This function has been replaced by *_write.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h | 13 -------------
>  linux-user/semihost.c         | 16 ----------------
>  semihosting/console.c         | 18 ------------------
>  3 files changed, 47 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 6994f23c82..d6c1cc58ab 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -24,19 +24,6 @@
>   */
>  int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
>  
> -/**
> - * qemu_semihosting_console_outc:
> - * @env: CPUArchState
> - * @s: host address of null terminated guest string
> - *
> - * Send single character from guest memory to the debug console. This
> - * may be the remote gdb session if a softmmu guest is currently being
> - * debugged.
> - *
> - * Returns: nothing
> - */
> -void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
> -
>  /**
>   * qemu_semihosting_console_read:
>   * @cs: CPUState
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index 871edf993a..f8bc8889f3 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -33,22 +33,6 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
>      return len;
>  }
>  
> -void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
> -{
> -    char c;
> -
> -    if (get_user_u8(c, addr)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: passed inaccessible address " TARGET_FMT_lx,
> -                      __func__, addr);
> -    } else {
> -        if (write(STDERR_FILENO, &c, 1) != 1) {
> -            qemu_log_mask(LOG_UNIMP, "%s: unexpected write to stdout failure",
> -                          __func__);
> -        }
> -    }
> -}
> -
>  /*
>   * For linux-user we can safely block. However as we want to return as
>   * soon as a character is read we need to tweak the termio to disable
> diff --git a/semihosting/console.c b/semihosting/console.c
> index 677ec2b176..f6fab5933a 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -96,24 +96,6 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
>      return out;
>  }
>  
> -void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
> -{
> -    CPUState *cpu = env_cpu(env);
> -    uint8_t c;
> -
> -    if (cpu_memory_rw_debug(cpu, addr, &c, 1, 0) == 0) {
> -        if (use_gdb_syscalls()) {
> -            gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, 1);
> -        } else {
> -            qemu_semihosting_log_out((const char *) &c, 1);
> -        }
> -    } else {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: passed inaccessible address " TARGET_FMT_lx,
> -                      __func__, addr);
> -    }
> -}
> -
>  #define FIFO_SIZE   1024
>  
>  static int console_can_read(void *opaque)
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=17199.629fd830.873a5.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+50%2F53%5D+semihosting%3A+Remove+qemu_semihosting_console_outc&verdict=C&c=17fd1d8aafc59b73861d5d8e80dfec815f24e02d
> 

-- 





