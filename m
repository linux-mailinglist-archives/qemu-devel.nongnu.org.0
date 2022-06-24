Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A955965D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:23:38 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fXM-0001lZ-RT
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4fDu-0004Ka-P6
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:03:30 -0400
Received: from smtpout30.security-mail.net ([85.31.212.38]:48716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4fDr-0002Tg-6h
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:03:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id 55855710DE5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 11:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656061404;
 bh=yYC7BZVSW5c0a5T+Upv2pFawdZJt1/t4AdPO9wWzsuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=IADoLN16ruhE2arC5244YCXTuIUwZ7RioGFAU21ZmA73T9AepmO3Vx+eJlpnsUbYy
 ahfii3bfJOMO+Pzh/2eHhcUBp7a1nZYY6VLzCDktYuj69ok9TP+YlY0xK/uzE1JW6Z
 pjKloRX40OFLN09okJ3KlRg5X/wz+fiXyipvf7XA=
Received: from fx308 (localhost [127.0.0.1]) by fx308.security-mail.net
 (Postfix) with ESMTP id 1838D710DDF; Fri, 24 Jun 2022 11:03:24 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx308.security-mail.net (Postfix) with ESMTPS id 9FB31710DC4; Fri, 24 Jun
 2022 11:03:23 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 84EA327E04FB; Fri, 24 Jun 2022
 11:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 6E55D27E04FD; Fri, 24 Jun 2022 11:03:23 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 X_Fb1iPqUFVX; Fri, 24 Jun 2022 11:03:23 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 5488727E04FB; Fri, 24 Jun 2022 11:03:23 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <e429.62b57ddb.9f2e9.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6E55D27E04FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656061403;
 bh=BB32F8G+NqXHco45UpKU2fUYlVD9OP3b9zx3x+q8fkM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=aprLpd3XwXTdKA2GJN9CgK7pxeu23QJoDYzzwW8oZtdha/hYi/HK6gDW3EY+nGymh
 UBKaCZu1d/EdamPxXhJxTDJedLVwhQ2RMqOqo95UmB17mOKwiV35PUGN7Epju15Sol
 XG2AyGr43r9C3A0xLRPpdkZ32ifi1JIGWwnkzId4=
Date: Fri, 24 Jun 2022 11:03:22 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 43/53] semihosting: Expand
 qemu_semihosting_console_inc to read
Message-ID: <20220624090322.GK25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-44-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-44-richard.henderson@linaro.org>
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
> Allow more than one character to be read at one time.
> Will be used by m68k and nios2 semihosting for stdio.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h | 12 +++++++-----
>  linux-user/semihost.c         | 10 ++++++----
>  semihosting/arm-compat-semi.c | 11 +++++++++--
>  semihosting/console.c         | 16 ++++++++++++----
>  4 files changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 27f8e9ae2e..39dbf1b062 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -38,19 +38,21 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
>  void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
>  
>  /**
> - * qemu_semihosting_console_inc:
> + * qemu_semihosting_console_read:
>   * @cs: CPUState
> + * @buf: host buffer
> + * @len: buffer size
>   *
> - * Receive single character from debug console.  As this call may block
> - * if no data is available we suspend the CPU and will re-execute the
> + * Receive at least one character from debug console.  As this call may
> + * block if no data is available we suspend the CPU and will re-execute the
>   * instruction when data is there. Therefore two conditions must be met:
>   *
>   *   - CPUState is synchronized before calling this function
>   *   - pc is only updated once the character is successfully returned
>   *
> - * Returns: character read OR cpu_loop_exit!
> + * Returns: number of characters read, OR cpu_loop_exit!
>   */
> -target_ulong qemu_semihosting_console_inc(CPUState *cs);
> +int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
>  
>  /**
>   * qemu_semihosting_log_out:
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index f14c6ae21d..2029fb674c 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -56,21 +56,23 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
>   * program is expecting more normal behaviour. This is slow but
>   * nothing using semihosting console reading is expecting to be fast.
>   */
> -target_ulong qemu_semihosting_console_inc(CPUState *cs)
> +int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
>  {
> -    uint8_t c;
> +    int ret;
>      struct termios old_tio, new_tio;
>  
>      /* Disable line-buffering and echo */
>      tcgetattr(STDIN_FILENO, &old_tio);
>      new_tio = old_tio;
>      new_tio.c_lflag &= (~ICANON & ~ECHO);
> +    new_tio.c_cc[VMIN] = 1;
> +    new_tio.c_cc[VTIME] = 0;
>      tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);
>  
> -    c = getchar();
> +    ret = fread(buf, 1, len, stdin);
>  
>      /* restore config */
>      tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
>  
> -    return (target_ulong) c;
> +    return ret;
>  }
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index e7de52d042..20e99cdcc0 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -427,8 +427,15 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_READC:
> -        ret = qemu_semihosting_console_inc(cs);
> -        common_semi_set_ret(cs, ret);
> +        {
> +            uint8_t ch;
> +            int ret = qemu_semihosting_console_read(cs, &ch, 1);
> +            if (ret == 1) {
> +                common_semi_cb(cs, ch, 0);
> +            } else {
> +                common_semi_cb(cs, -1, EIO);
> +            }
> +        }
>          break;
>  
>      case TARGET_SYS_ISERROR:
> diff --git a/semihosting/console.c b/semihosting/console.c
> index 7b896fe43b..df618a28a4 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -144,12 +144,14 @@ static void console_read(void *opaque, const uint8_t *buf, int size)
>      c->sleeping_cpus = NULL;
>  }
>  
> -target_ulong qemu_semihosting_console_inc(CPUState *cs)
> +int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
>  {
> -    uint8_t ch;
>      SemihostingConsole *c = &console;
> +    int ret = 0;
>  
>      g_assert(qemu_mutex_iothread_locked());
> +
> +    /* Block if the fifo is completely empty. */
>      if (fifo8_is_empty(&c->fifo)) {
>          c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, cs);
>          cs->halted = 1;
> @@ -157,8 +159,14 @@ target_ulong qemu_semihosting_console_inc(CPUState *cs)
>          cpu_loop_exit(cs);
>          /* never returns */
>      }
> -    ch = fifo8_pop(&c->fifo);
> -    return (target_ulong) ch;
> +
> +    /* Read until buffer full or fifo exhausted. */
> +    do {
> +        *(char *)(buf + ret) = fifo8_pop(&c->fifo);
> +        ret++;
> +    } while (ret < len && !fifo8_is_empty(&c->fifo));
> +
> +    return ret;
>  }
>  
>  void qemu_semihosting_console_init(void)
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=17c01.629fd5ab.99e5d.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+43%2F53%5D+semihosting%3A+Expand+qemu_semihosting_console_inc+to+read&verdict=C&c=e9da6e5078994ded7c137213d7c4d1e10afac866
> 

-- 





