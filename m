Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7D55B8DA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:05:07 +0200 (CEST)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kg6-00071R-IB
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kd8-00048w-Hi
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:02 -0400
Received: from mxout.security-mail.net ([85.31.212.46]:37306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kcy-0006mX-Q2
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:01 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx303.security-mail.net (Postfix) with ESMTP id 62F023237B0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 11:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656320508;
 bh=LzVwOeT1U60jjd00K5K/DdjWKB0NcPN/B2XF7wKtlig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Rt7Px15eOEE2q4kO+YtdmGbXIy2PZBiUfhphpzohQExPn1aPaedbOA83hEWVPMSPO
 T1i1FZQV0rglObgMP0JHOJuAquCQ/WaA+C2zHtEGNKv3X0jB2equZtc1uGuE0z/u7H
 la5+jxROBIN5rZa/S0rLsVZlFeGw97jBSZ6bXzSI=
Received: from fx303 (localhost [127.0.0.1]) by fx303.security-mail.net
 (Postfix) with ESMTP id E7D1332374C; Mon, 27 Jun 2022 11:01:47 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id 3D7A3323775; Mon, 27 Jun
 2022 11:01:47 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 1E2FC27E04D6; Mon, 27 Jun 2022
 11:01:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 086B627E04F8; Mon, 27 Jun 2022 11:01:47 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 4Qd1q5wHtX2r; Mon, 27 Jun 2022 11:01:46 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id E38CE27E04D6; Mon, 27 Jun 2022 11:01:46 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <18553.62b971fb.3b999.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 086B627E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656320507;
 bh=ew35zbB+JRmro9nQslblZcY96oULMterhAiks/ntZtw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=VRPUrPkaUFBfVKaGO+uvUCnWHwevTt1wPhZ3wqPLnOtMfxhPR7rZQddHCB2cWSssH
 BsqT+RdZsaS+HNh5AERdnBDpxzZyK3ckV+QHvRQB86nz2ZWvIvlC4SgOdUw5zMSBUH
 5qeWaEP7qOCJdhx9laE+4xcXk2YdH1mTLiBYIJPM=
Date: Mon, 27 Jun 2022 11:01:46 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 53/53] semihosting: Create semihost_sys_poll_one
Message-ID: <20220627090146.GI1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-54-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-54-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.46; envelope-from=lmichel@kalray.eu;
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
> This will be used for implementing the xtensa select_one
> system call.  Choose "poll" over "select" so that we can
> reuse Glib's g_poll constants and to avoid struct timeval.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/console.h  | 16 ++++++++
>  include/semihosting/syscalls.h |  3 ++
>  semihosting/console.c          | 19 ++++++++-
>  semihosting/syscalls.c         | 70 ++++++++++++++++++++++++++++++++++
>  4 files changed, 106 insertions(+), 2 deletions(-)
> 
> diff --git a/include/semihosting/console.h b/include/semihosting/console.h
> index 20c31d89d4..61b0cb3a94 100644
> --- a/include/semihosting/console.h
> +++ b/include/semihosting/console.h
> @@ -53,4 +53,20 @@ int qemu_semihosting_console_write(void *buf, int len);
>   */
>  int qemu_semihosting_log_out(const char *s, int len);
>  
> +/*
> + * qemu_semihosting_console_block_until_ready:
> + * @cs: CPUState
> + *
> + * If no data is available we suspend the CPU and will re-execute the
> + * instruction when data is available.
> + */
> +void qemu_semihosting_console_block_until_ready(CPUState *cs);
> +
> +/**
> + * qemu_semihosting_console_ready:
> + *
> + * Return true if characters are available for read; does not block.
> + */
> +bool qemu_semihosting_console_ready(void);
> +
>  #endif /* SEMIHOST_CONSOLE_H */
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index 347200cb9f..3a5ec229eb 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -69,4 +69,7 @@ void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
>  void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
>                                 target_ulong tv_addr, target_ulong tz_addr);
>  
> +void semihost_sys_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
> +                           int fd, GIOCondition cond, int timeout);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/console.c b/semihosting/console.c
> index c84ab97ab6..cda7cf1905 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -77,10 +77,17 @@ static void console_read(void *opaque, const uint8_t *buf, int size)
>      c->sleeping_cpus = NULL;
>  }
>  
> -int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
> +bool qemu_semihosting_console_ready(void)
> +{
> +    SemihostingConsole *c = &console;
> +
> +    g_assert(qemu_mutex_iothread_locked());
> +    return !fifo8_is_empty(&c->fifo);
> +}
> +
> +void qemu_semihosting_console_block_until_ready(CPUState *cs)
>  {
>      SemihostingConsole *c = &console;
> -    int ret = 0;
>  
>      g_assert(qemu_mutex_iothread_locked());
>  
> @@ -92,6 +99,14 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
>          cpu_loop_exit(cs);
>          /* never returns */
>      }
> +}
> +
> +int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
> +{
> +    SemihostingConsole *c = &console;
> +    int ret = 0;
> +
> +    qemu_semihosting_console_block_until_ready(cs);
>  
>      /* Read until buffer full or fifo exhausted. */
>      do {
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 9e499b1751..4847f66c02 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -520,6 +520,21 @@ static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
>      unlock_user(p, tv_addr, sizeof(struct gdb_timeval));
>  }
>  
> +#ifndef CONFIG_USER_ONLY
> +static void host_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
> +                          GuestFD *gf, GIOCondition cond, int timeout)
> +{
> +    /*
> +     * Since this is only used by xtensa in system mode, and stdio is
> +     * handled through GuestFDConsole, and there are no semihosting
> +     * system calls for sockets and the like, that means this descriptor
> +     * must be a normal file.  Normal files never block and are thus
> +     * always ready.
> +     */
> +    complete(cs, cond & (G_IO_IN | G_IO_OUT), 0);
> +}
> +#endif
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -628,6 +643,34 @@ static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
>      complete(cs, ret ? -1 : 0, ret ? -ret : 0);
>  }
>  
> +#ifndef CONFIG_USER_ONLY
> +static void console_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
> +                             GuestFD *gf, GIOCondition cond, int timeout)
> +{
> +    /* The semihosting console does not support urgent data or errors. */
> +    cond &= G_IO_IN | G_IO_OUT;
> +
> +    /*
> +     * Since qemu_semihosting_console_write never blocks, we can
> +     * consider output always ready -- leave G_IO_OUT alone.
> +     * All that remains is to conditionally signal input ready.
> +     * Since output ready causes an immediate return, only block
> +     * for G_IO_IN alone.
> +     *
> +     * TODO: Implement proper timeout.  For now, only support
> +     * indefinite wait or immediate poll.
> +     */
> +    if (cond == G_IO_IN && timeout < 0) {
> +        qemu_semihosting_console_block_until_ready(cs);
> +        /* We returned -- input must be ready. */
> +    } else if ((cond & G_IO_IN) && !qemu_semihosting_console_ready()) {
> +        cond &= ~G_IO_IN;
> +    }
> +
> +    complete(cs, cond, 0);
> +}
> +#endif
> +
>  /*
>   * Syscall entry points.
>   */
> @@ -906,3 +949,30 @@ void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
>          host_gettimeofday(cs, complete, tv_addr, tz_addr);
>      }
>  }
> +
> +#ifndef CONFIG_USER_ONLY
> +void semihost_sys_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
> +                           int fd, GIOCondition cond, int timeout)
> +{
> +    GuestFD *gf = get_guestfd(fd);
> +
> +    if (!gf) {
> +        complete(cs, G_IO_NVAL, 1);
> +        return;
> +    }
> +    switch (gf->type) {
> +    case GuestFDGDB:
> +        complete(cs, G_IO_NVAL, 1);
> +        break;
> +    case GuestFDHost:
> +        host_poll_one(cs, complete, gf, cond, timeout);
> +        break;
> +    case GuestFDConsole:
> +        console_poll_one(cs, complete, gf, cond, timeout);
> +        break;
> +    case GuestFDStatic:
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +#endif
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=10175.629fd339.9c340.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+53%2F53%5D+semihosting%3A+Create+semihost_sys_poll_one&verdict=C&c=0a7b4120e6d77de407da84480eecf3246fb89c81
> 

-- 





