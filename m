Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A24B638
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 12:33:24 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdXu6-0004vK-Tv
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 06:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56069)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hdXs4-0003C7-O9
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 06:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hdXoI-0006eM-6r
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 06:27:24 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:51815)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hdXoH-0006cE-Ta
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 06:27:22 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkprN-1iKKGe3EZL-00mOQi; Wed, 19 Jun 2019 12:27:03 +0200
To: Jim Wilson <jimw@sifive.com>, qemu-devel@nongnu.org
References: <20190618235313.13223-1-jimw@sifive.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4917074c-26d4-6ba0-0506-24824ebe97fb@vivier.eu>
Date: Wed, 19 Jun 2019 12:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618235313.13223-1-jimw@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xNA1/gd5DJ8QFnXJkgQ9toovVhVXi2XEf+YliI39aiJH6rOxuIB
 QM9CksU4fYqjg6izB9xq8d27wKk9E//eUcC7pRb3kb8xaCNj0Qf7fJLei3mHheP9KG6SsCa
 z5M+m/MR1JVQq7iWGOZoZY/l7TAEZxr3lpKCKZ9b6l6k4Ox6pXTIsikb3eoRVsYJ4Y8sc94
 d5QHw7hS30NGkJ+XJMXJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FHdQbWW3s4k=:UkwlomsCUoqsY+rpI9crRF
 hkOwN9Ojyg21WpoAnTDFiHVTRS1K8WhjeP0aZpqr+e+0mvgNWbRaYityP6zhEm07UPH3uZgSs
 mqqJ5LU48vMYvSsN0PXVUudJ5Dt821AVh2ZmalnPG3/6Oqwpcn5lC0S6K2enknKTzRm43DNAs
 yYmtslvie/TpBu5Ldi9G0+8G9nACbTJUjSe8F2K+brM7VDXlRUHLxcZWt/xbgwFENeEoJDSXC
 jJ8Fna+MJJvkdJBzli7wQrFMbN872N0bcA8FXZFJaV/sH8l4a/IGMv1jmWUW4H57KRgII/HrM
 /epE6YRITBfVjxM07WaYcN6i+l5kgBaSUloreOaEU9aFFkAYgIPFOhF0KRjnSqMohmIJwe5L9
 VRZfKE7jACu1qSsjNI/YASBx1AdBQ039cF1KKE1TC1BQitEYnQd+MqX6zfaRZWEmqCtfiSTgT
 fBxSvBLYeuOP3xpJaYlayI01m76mwi8/wFEIj0n/W4zPHhrOpaLsePgH6Q1jQ2Tb2ytbdo8oE
 vhSGdTG76evRjbtnqGsZ3/jij2bmRQpgSEn8d1QNSymjCyMCiydm4PUD/kHuSVZ6tQZwloZze
 /bfhKveu0m5tAR3nmJvpZ/pQdDHPKvJEZ9e3Mn5XVBiEmzhaArcIzbCHuNkub9Zhk9mHUQyA2
 FIcysAewAcfmbrYEbDdgNaiRZiFA6pv4xQfH/BHFktCsPbgTXtY0EBFsw5WHJ11xzFGlvaD6z
 T2FHILcQmRYw0Plo63JgjNljwTZ8QPA4GrpPIO1HrB1rp7WZIuWG/ZDGsRc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-devel] [PATCH] linux-user: Add strace support for statx.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/06/2019 à 01:53, Jim Wilson a écrit :
> All of the flags need to be conditional as old systems don't have statx
> support.  Otherwise it works the same as other stat family syscalls.
> This requires the pending patch to add statx support.
> 
> Tested on Ubuntu 16.04 (no host statx) and Ubuntu 19.04 (with host statx)
> using a riscv32-linux toolchain.
> 
> Signed-off-by: Jim Wilson <jimw@sifive.com>
> ---
>  linux-user/strace.c    | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  linux-user/strace.list |  3 ++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 6f72a74..c80e93b 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -976,6 +976,76 @@ UNUSED static struct flags msg_flags[] = {
>      FLAG_END,
>  };
>  
> +UNUSED static struct flags statx_flags[] = {
> +#ifdef AT_EMPTY_PATH
> +    FLAG_GENERIC(AT_EMPTY_PATH),
> +#endif
> +#ifdef AT_NO_AUTOMOUNT
> +    FLAG_GENERIC(AT_NO_AUTOMOUNT),
> +#endif
> +#ifdef AT_SYMLINK_NOFOLLOW
> +    FLAG_GENERIC(AT_SYMLINK_NOFOLLOW),
> +#endif
> +#ifdef AT_STATX_SYNC_AS_STAT
> +    FLAG_GENERIC(AT_STATX_SYNC_AS_STAT),
> +#endif
> +#ifdef AT_STATX_FORCE_SYNC
> +    FLAG_GENERIC(AT_STATX_FORCE_SYNC),
> +#endif
> +#ifdef AT_STATX_DONT_SYNC
> +    FLAG_GENERIC(AT_STATX_DONT_SYNC),
> +#endif
> +    FLAG_END,
> +};
> +
> +UNUSED static struct flags statx_mask[] = {
> +/* This must come first, because it includes everything.  */
> +#ifdef STATX_ALL
> +    FLAG_GENERIC(STATX_ALL),
> +#endif
> +/* This must come second; it includes everything except STATX_BTIME.  */
> +#ifdef STATX_BASIC_STATS
> +    FLAG_GENERIC(STATX_BASIC_STATS),
> +#endif
> +#ifdef STATX_TYPE
> +    FLAG_GENERIC(STATX_TYPE),
> +#endif
> +#ifdef STATX_MODE
> +    FLAG_GENERIC(STATX_MODE),
> +#endif
> +#ifdef STATX_NLINK
> +    FLAG_GENERIC(STATX_NLINK),
> +#endif
> +#ifdef STATX_UID
> +    FLAG_GENERIC(STATX_UID),
> +#endif
> +#ifdef STATX_GID
> +    FLAG_GENERIC(STATX_GID),
> +#endif
> +#ifdef STATX_ATIME
> +    FLAG_GENERIC(STATX_ATIME),
> +#endif
> +#ifdef STATX_MTIME
> +    FLAG_GENERIC(STATX_MTIME),
> +#endif
> +#ifdef STATX_CTIME
> +    FLAG_GENERIC(STATX_CTIME),
> +#endif
> +#ifdef STATX_INO
> +    FLAG_GENERIC(STATX_INO),
> +#endif
> +#ifdef STATX_SIZE
> +    FLAG_GENERIC(STATX_SIZE),
> +#endif
> +#ifdef STATX_BLOCKS
> +    FLAG_GENERIC(STATX_BLOCKS),
> +#endif
> +#ifdef STATX_BTIME
> +    FLAG_GENERIC(STATX_BTIME),
> +#endif
> +    FLAG_END,
> +};
> +
>  /*
>   * print_xxx utility functions.  These are used to print syscall
>   * parameters in certain format.  All of these have parameter
> @@ -2611,6 +2681,22 @@ print_tgkill(const struct syscallname *name,
>  }
>  #endif
>  
> +#ifdef TARGET_NR_statx
> +static void
> +print_statx(const struct syscallname *name,
> +            abi_long arg0, abi_long arg1, abi_long arg2,
> +            abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    print_syscall_prologue(name);
> +    print_at_dirfd(arg0, 0);
> +    print_string(arg1, 0);
> +    print_flags(statx_flags, arg2, 0);
> +    print_flags(statx_mask, arg3, 0);
> +    print_pointer(arg4, 1);
> +    print_syscall_epilogue(name);
> +}
> +#endif
> +
>  /*
>   * An array of all of the syscalls we know about
>   */
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index db21ce4..63a9466 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1650,3 +1650,6 @@
>  #ifdef TARGET_NR_atomic_barrier
>  { TARGET_NR_atomic_barrier, "atomic_barrier", NULL, NULL, NULL },
>  #endif
> +#ifdef TARGET_NR_statx
> +{ TARGET_NR_statx, "statx", NULL, print_statx, NULL },
> +#endif
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

