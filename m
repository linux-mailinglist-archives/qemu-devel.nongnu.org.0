Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B5559576
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:30:31 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ehy-0007KD-P8
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4ee8-0004br-Ti
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:26:32 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:52490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4ee4-0005Co-VX
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:26:32 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 02BEC3D3B0D2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656059187;
 bh=uzFQXW8IfbPFyuQQSEx2mK+M9UYpVEqCcbXXGozebyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FNto5OrjlzC2KU+8JKQG1ZCA/k9fq9IHpfOgvHwZjbcrwv++ScIE8CQN7xV2YZMsK
 3+Gu/3ojGzlZMuBBGaAGhUBoegqKrHTLz6mneoUOLg18g1N4XezUjhaMtWFzN0P7Ai
 ZQaleb1yPAF6tf84NIzqXEhjPaSFHTRV8QTxao9w=
Received: from fx302 (localhost [127.0.0.1]) by fx302.security-mail.net
 (Postfix) with ESMTP id A62323D3B0C7; Fri, 24 Jun 2022 10:26:26 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx302.security-mail.net (Postfix) with ESMTPS id 217CF3D3B0B8; Fri, 24 Jun
 2022 10:26:26 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 0633427E04FD; Fri, 24 Jun 2022
 10:26:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id E4BB227E04FB; Fri, 24 Jun 2022 10:26:25 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 iYk5f-JmqtqR; Fri, 24 Jun 2022 10:26:25 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id CC3FB27E04F8; Fri, 24 Jun 2022 10:26:25 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <1ac5.62b57532.210f2.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E4BB227E04FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656059185;
 bh=J5UaBcwvx8XObd4EAfsuLP0NvJwQpwwpSArpC7N/nE4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=eRpat1iPzLtudPLC5BNG5gU0fZwOH/geHasUyPowblhz+yfrNV93v2kKxuYOA27u6
 ZfVlu4Y69cuEY35DJA2zBvuZPO5vcL+lnHRsA/i8biY9sFxJ6Cm8uy9kI0K1Hvf1m7
 Zluixf1FAGBjNXNj0OeEpy2vgH7ygl/4m0d4tna4=
Date: Fri, 24 Jun 2022 10:26:25 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 39/53] semihosting: Create semihost_sys_gettimeofday
Message-ID: <20220624082625.GG25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-40-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-40-richard.henderson@linaro.org>
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
> This syscall will be used by m68k and nios2 semihosting.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  3 +++
>  semihosting/syscalls.c         | 42 ++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index ecc97751a9..347200cb9f 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -66,4 +66,7 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
>  void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
>                           target_ulong cmd, target_ulong cmd_len);
>  
> +void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
> +                               target_ulong tv_addr, target_ulong tz_addr);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index d21064716d..db1e9f6cc9 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -236,6 +236,12 @@ static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
>      gdb_do_syscall(complete, "system,%s", cmd, len);
>  }
>  
> +static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
> +                             target_ulong tv_addr, target_ulong tz_addr)
> +{
> +    gdb_do_syscall(complete, "gettimeofday,%x,%x", tv_addr, tz_addr);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -487,6 +493,32 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
>      unlock_user(p, cmd, 0);
>  }
>  
> +static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
> +                              target_ulong tv_addr, target_ulong tz_addr)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    struct gdb_timeval *p;
> +    int64_t rt;
> +
> +    /* GDB fails on non-null TZ, so be consistent. */
> +    if (tz_addr != 0) {
> +        complete(cs, -1, EINVAL);
> +        return;
> +    }
> +
> +    p = lock_user(VERIFY_WRITE, tv_addr, sizeof(struct gdb_timeval), 0);
> +    if (!p) {
> +        complete(cs, -1, EFAULT);
> +        return;
> +    }
> +
> +    /* TODO: Like stat, gdb always produces big-endian results; match it. */
> +    rt = g_get_real_time();
> +    p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
> +    p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
> +    unlock_user(p, tv_addr, sizeof(struct gdb_timeval));
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -796,3 +828,13 @@ void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
>          host_system(cs, complete, cmd, cmd_len);
>      }
>  }
> +
> +void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
> +                               target_ulong tv_addr, target_ulong tz_addr)
> +{
> +    if (use_gdb_syscalls()) {
> +        gdb_gettimeofday(cs, complete, tv_addr, tz_addr);
> +    } else {
> +        host_gettimeofday(cs, complete, tv_addr, tz_addr);
> +    }
> +}
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=c119.629fd54f.4e3dd.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+39%2F53%5D+semihosting%3A+Create+semihost_sys_gettimeofday&verdict=C&c=72ff7ee6d62e9655defaed81c32535afbc86c0b7
> 

-- 





