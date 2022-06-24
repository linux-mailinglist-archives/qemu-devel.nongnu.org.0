Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D04559587
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:36:52 +0200 (CEST)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4eo7-00009D-4w
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4eYs-0006aM-Kt
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:21:06 -0400
Received: from mxout.security-mail.net ([85.31.212.46]:18004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4eYo-0004Rs-C2
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:21:06 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx303.security-mail.net (Postfix) with ESMTP id A0CAF3238C0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656058859;
 bh=OTQGWB09P21y/n/8RONdNOdrwvG0rK6VMBA0eh6fD/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XcpsPwg2ntfVeg2oYp0Y9T/lpkJzsRLQZ9QnRtHNO8lRSmGRwkN9AB2KTIKHCBLVQ
 afN00PUCM6QfjOyYVTTRvXQzX/LucaQjumO4md4cfLAawTDPmnDXnInbIQc4autC3x
 RQIZuMUNOaNR6wFJ7b5S4/k5gtE2pJCoRIWFTW6c=
Received: from fx303 (localhost [127.0.0.1]) by fx303.security-mail.net
 (Postfix) with ESMTP id 361363238BA; Fri, 24 Jun 2022 10:20:59 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id 8644332387D; Fri, 24 Jun
 2022 10:20:58 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 680E327E04F8; Fri, 24 Jun 2022
 10:20:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 517B327E04FB; Fri, 24 Jun 2022 10:20:58 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 yDektAbc3rzq; Fri, 24 Jun 2022 10:20:58 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 37B7927E04F8; Fri, 24 Jun 2022 10:20:58 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <9d9c.62b573ea.839d6.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 517B327E04FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656058858;
 bh=aENvgyfeuMlXgzaPhHkt0yJPpuA7phdIplwB6MZhK+I=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=DwTrRtSm5rbxXnQehJA1sA7I+GPiky9HrOmJNRtbfr84xZSBgG762MpeJidz9cgtS
 z6wQM9YAUZaoGCyDUluxdRG9mG8cJmQ/RuBvP8t9SiyBYkzem/AsnY0Jcu5vsxbswM
 Poiz+PBqhzeiBiVWaL3S0iPMLGCYXkLZJJO/6fKA=
Date: Fri, 24 Jun 2022 10:20:57 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 38/53] semihosting: Create semihost_sys_{stat,fstat}
Message-ID: <20220624082057.GE25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-39-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-39-richard.henderson@linaro.org>
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
> These syscalls will be used by m68k and nios2 semihosting.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |   7 ++
>  semihosting/syscalls.c         | 137 +++++++++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index c9f9e66be1..ecc97751a9 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -49,6 +49,13 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
>                         gdb_syscall_complete_cb flen_cb,
>                         int fd, target_ulong fstat_addr);
>  
> +void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        int fd, target_ulong addr);
> +
> +void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       target_ulong fname, target_ulong fname_len,
> +                       target_ulong addr);
> +
>  void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>                           target_ulong fname, target_ulong fname_len);
>  
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index de846ced32..d21064716d 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -63,6 +63,52 @@ static int validate_lock_user_string(char **pstr, CPUState *cs,
>      return ret;
>  }
>  
> +/*
> + * TODO: Note that gdb always stores the stat structure big-endian.
> + * So far, that's ok, as the only two targets using this are also
> + * big-endian.  Until we do something with gdb, also produce the
> + * same big-endian result from the host.
> + */
> +static int copy_stat_to_user(CPUState *cs, target_ulong addr,
> +                             const struct stat *s)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    struct gdb_stat *p;
> +
> +    if (s->st_dev != (uint32_t)s->st_dev ||
> +        s->st_ino != (uint32_t)s->st_ino) {
> +        return -EOVERFLOW;
> +    }
> +
> +    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
> +    if (!p) {
> +        return -EFAULT;
> +    }
> +
> +    p->gdb_st_dev = cpu_to_be32(s->st_dev);
> +    p->gdb_st_ino = cpu_to_be32(s->st_ino);
> +    p->gdb_st_mode = cpu_to_be32(s->st_mode);
> +    p->gdb_st_nlink = cpu_to_be32(s->st_nlink);
> +    p->gdb_st_uid = cpu_to_be32(s->st_uid);
> +    p->gdb_st_gid = cpu_to_be32(s->st_gid);
> +    p->gdb_st_rdev = cpu_to_be32(s->st_rdev);
> +    p->gdb_st_size = cpu_to_be64(s->st_size);
> +#ifdef _WIN32
> +    /* Windows stat is missing some fields.  */
> +    p->gdb_st_blksize = 0;
> +    p->gdb_st_blocks = 0;
> +#else
> +    p->gdb_st_blksize = cpu_to_be64(s->st_blksize);
> +    p->gdb_st_blocks = cpu_to_be64(s->st_blocks);
> +#endif
> +    p->gdb_st_atime = cpu_to_be32(s->st_atime);
> +    p->gdb_st_mtime = cpu_to_be32(s->st_mtime);
> +    p->gdb_st_ctime = cpu_to_be32(s->st_ctime);
> +
> +    unlock_user(p, addr, sizeof(struct gdb_stat));
> +    return 0;
> +}
> +
>  /*
>   * GDB semihosting syscall implementations.
>   */
> @@ -133,6 +179,19 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
>      gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
>  }
>  
> +static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                     target_ulong fname, target_ulong fname_len,
> +                     target_ulong addr)
> +{
> +    int len = validate_strlen(cs, fname, fname_len);
> +    if (len < 0) {
> +        complete(cs, -1, -len);
> +        return;
> +    }
> +
> +    gdb_do_syscall(complete, "stat,%s,%x", fname, len, addr);
> +}
> +
>  static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>                         target_ulong fname, target_ulong fname_len)
>  {
> @@ -321,6 +380,51 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
>      }
>  }
>  
> +static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       GuestFD *gf, target_ulong addr)
> +{
> +    struct stat buf;
> +    int ret;
> +
> +    ret = fstat(gf->hostfd, &buf);
> +    if (ret) {
> +        complete(cs, -1, errno);
> +        return;
> +    }
> +    ret = copy_stat_to_user(cs, addr, &buf);
> +    complete(cs, ret ? -1 : 0, ret ? -ret : 0);
> +}
> +
> +static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                      target_ulong fname, target_ulong fname_len,
> +                      target_ulong addr)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    struct stat buf;
> +    char *name;
> +    int ret, err;
> +
> +    ret = validate_lock_user_string(&name, cs, fname, fname_len);
> +    if (ret < 0) {
> +        complete(cs, -1, -ret);
> +        return;
> +    }
> +
> +    ret = stat(name, &buf);
> +    if (ret) {
> +        err = errno;
> +    } else {
> +        ret = copy_stat_to_user(cs, addr, &buf);
> +        err = 0;
> +        if (ret < 0) {
> +            err = -ret;
> +            ret = -1;
> +        }
> +    }
> +    complete(cs, ret, err);
> +    unlock_user(name, fname, 0);
> +}
> +
>  static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>                          target_ulong fname, target_ulong fname_len)
>  {
> @@ -629,6 +733,39 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
>      }
>  }
>  
> +void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        int fd, target_ulong addr)
> +{
> +    GuestFD *gf = get_guestfd(fd);
> +
> +    if (!gf) {
> +        complete(cs, -1, EBADF);
> +        return;
> +    }
> +    switch (gf->type) {
> +    case GuestFDGDB:
> +        gdb_fstat(cs, complete, gf, addr);
> +        break;
> +    case GuestFDHost:
> +        host_fstat(cs, complete, gf, addr);
> +        break;
> +    case GuestFDStatic:
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       target_ulong fname, target_ulong fname_len,
> +                       target_ulong addr)
> +{
> +    if (use_gdb_syscalls()) {
> +        gdb_stat(cs, complete, fname, fname_len, addr);
> +    } else {
> +        host_stat(cs, complete, fname, fname_len, addr);
> +    }
> +}
> +
>  void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
>                           target_ulong fname, target_ulong fname_len)
>  {
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=c440.629fd46f.95a21.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+38%2F53%5D+semihosting%3A+Create+semihost_sys_%7Bstat%2Cfstat%7D&verdict=C&c=883b33c80ed77b64c3d11130c7aa79d39004fc91
> 

-- 





