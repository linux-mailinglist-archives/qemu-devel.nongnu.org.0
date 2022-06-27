Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48955B8BC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:49:24 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kQt-0005GT-HR
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kK8-0006ug-Qi
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:24 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:17481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kK6-0003Qj-OV
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:24 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 27E063238C4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656319341;
 bh=ZOGbN+PYBxGqbBULNQ6wrYWB0yizdhd2biTmF1AlkzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=oSJhcAegxaojsTsuGQjzZc1XTlJ/7xFJOyxyZ9ttZVipjKriRwokGjyOXg6Jtfs47
 8mSMVNFHsuPZqHy9l1gSLZhMOBYSFaDH+tJ+KF7cR3tjFu2MkbZMWuCK5McAX1X8NJ
 WA0Tps/5vB+fvYPP0QejPE9/YM+ilx7JgtrPvlE8=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id A815132385F; Mon, 27 Jun 2022 10:42:20 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id BF18F32386F; Mon, 27 Jun
 2022 10:42:19 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id A18AF27E04FB; Mon, 27 Jun 2022
 10:42:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 8BE0B27E04F8; Mon, 27 Jun 2022 10:42:19 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 W1vHTB3XHZ2l; Mon, 27 Jun 2022 10:42:19 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 72D8627E04D6; Mon, 27 Jun 2022 10:42:19 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <150bb.62b96d6b.be00a.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 8BE0B27E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656319339;
 bh=KERYlPaje3O2EXoOM6OjD14gyk9uLpmkJXINGitpaMI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=WqQlQQDlTs/kES1SG2FDEhZx2JDa3sHOmFD5Chcmls6LGXvSS0VBLgouWlQiOWpoE
 13c3skjv/snu7mpJhnHCFscSUELPYfvd2Ywpa/mmJ3NHvNYCi4O2jdqvY4waPzaDte
 cg+qMB8Y3JNemgVv0ZR1/ofj/4GuSteeEKyxQdEk=
Date: Mon, 27 Jun 2022 10:42:19 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 52/53] semihosting: Remove qemu_semihosting_console_outs
Message-ID: <20220627084219.GH1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-53-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-53-richard.henderson@linaro.org>
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
> This function has been replaced by *_write.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h | 13 ----------
>  linux-user/semihost.c         | 17 ------------
>  semihosting/console.c         | 49 -----------------------------------
>  3 files changed, 79 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index d6c1cc58ab..20c31d89d4 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -11,19 +11,6 @@
>  
>  #include "cpu.h"
>  
> -/**
> - * qemu_semihosting_console_outs:
> - * @env: CPUArchState
> - * @s: host address of null terminated guest string
> - *
> - * Send a null terminated guest string to the debug console. This may
> - * be the remote gdb session if a softmmu guest is currently being
> - * debugged.
> - *
> - * Returns: number of bytes written.
> - */
> -int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
> -
>  /**
>   * qemu_semihosting_console_read:
>   * @cs: CPUState
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index f8bc8889f3..cee62a365c 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -16,23 +16,6 @@
>  #include "user-internals.h"
>  #include <termios.h>
>  
> -int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
> -{
> -    int len = target_strlen(addr);
> -    void *s;
> -    if (len < 0){
> -       qemu_log_mask(LOG_GUEST_ERROR,
> -                     "%s: passed inaccessible address " TARGET_FMT_lx,
> -                     __func__, addr);
> -       return 0;
> -    }
> -    s = lock_user(VERIFY_READ, addr, (long)(len + 1), 1);
> -    g_assert(s);  /* target_strlen has already verified this will work */
> -    len = write(STDERR_FILENO, s, len);
> -    unlock_user(s, addr, 0);
> -    return len;
> -}
> -
>  /*
>   * For linux-user we can safely block. However as we want to return as
>   * soon as a character is read we need to tweak the termio to disable
> diff --git a/semihosting/console.c b/semihosting/console.c
> index f6fab5933a..c84ab97ab6 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -47,55 +47,6 @@ int qemu_semihosting_log_out(const char *s, int len)
>      }
>  }
>  
> -/*
> - * A re-implementation of lock_user_string that we can use locally
> - * instead of relying on softmmu-semi. Hopefully we can deprecate that
> - * in time. Copy string until we find a 0 or address error.
> - */
> -static GString *copy_user_string(CPUArchState *env, target_ulong addr)
> -{
> -    CPUState *cpu = env_cpu(env);
> -    GString *s = g_string_sized_new(128);
> -    uint8_t c;
> -
> -    do {
> -        if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
> -            if (c) {
> -                s = g_string_append_c(s, c);
> -            }
> -        } else {
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "%s: passed inaccessible address " TARGET_FMT_lx,
> -                          __func__, addr);
> -            break;
> -        }
> -    } while (c!=0);
> -
> -    return s;
> -}
> -
> -static void semihosting_cb(CPUState *cs, uint64_t ret, int err)
> -{
> -    if (err) {
> -        qemu_log("%s: gdb console output failed (%d)", __func__, err);
> -    }
> -}
> -
> -int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
> -{
> -    GString *s = copy_user_string(env, addr);
> -    int out = s->len;
> -
> -    if (use_gdb_syscalls()) {
> -        gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, s->len);
> -    } else {
> -        out = qemu_semihosting_log_out(s->str, s->len);
> -    }
> -
> -    g_string_free(s, true);
> -    return out;
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
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=29a4.629fd909.2884b.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+52%2F53%5D+semihosting%3A+Remove+qemu_semihosting_console_outs&verdict=C&c=8ee0b8982c8025f3b6af275d795772fa0673b149
> 

-- 





