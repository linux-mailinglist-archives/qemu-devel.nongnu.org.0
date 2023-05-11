Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F46FF005
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:39:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3gw-0004O8-4y; Thu, 11 May 2023 06:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1px3gs-0004Ne-W2
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:38:31 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1px3gr-0008C1-BA
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:38:30 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M42fG-1px3gk46ng-0007oi; Thu, 11 May 2023 12:38:23 +0200
Message-ID: <f1c3df75-dcc2-7c93-5c41-0cedbea72d25@vivier.eu>
Date: Thu, 11 May 2023 12:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user: Drop uint and ulong
Content-Language: fr
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20230511085056.13809-1-quintela@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230511085056.13809-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UOdy7DbJVm5sgg6ZtwwGlPHqsfY8+GfthUD8dwvRB0yEMG88m72
 SYKaRe8IamlWiNOBlcjD5CmJNGHCDDL7hR/NBoEz2eoYXLBgSua9wRpyaSX0nTKQ3nLcJOV
 sXPJA/MvkJGwpd8SRTXEnQZ4yzo1xoycyFr3M1dQeD8v/kkSEqETQuzuHywyl0bBDxnL1zO
 2TVlQGikAZeu/Sl5rm0XQ==
UI-OutboundReport: notjunk:1;M01:P0:wR0YDMeYlps=;yfkYsN9W/O1DedSXt1kZrgVA/KW
 HTf34LtjqZUO0uOg9Dyd9iLuzyJcSk9W95j8iYxta1e5C5/YB2ue80rWtU11fxkN6su2/e+pA
 0wLcv7TADuoaH9QdwMVjRQSH6g4/LU0gbYMMPU1y6/Sh/7IJ8AvD5uugfgtMcCA37KYHzF/Ot
 1X2bcxz02udQ2j8q4wPDhYwSSLngBQtA9g8b4YCBJp0wNDmxacQ5Z3vXpdXeenkuLI0xBw7pU
 ydCvPzi+u5/3mAT8sfFiCXWVnTiBYg96FmCgyzPClpJGdUgb8wh14dy4hnCKawvwLnR8fO2w9
 IyWQG7V18gNDSeMeKqMpVCY4hnhRvpQyoD1uRoba7wScvnp5nlxX0vxzxNZa2ffEpfi8wlMer
 HDNBif27/AohDkpOhdnR9cfsm0ftq8nI19jIIUP1t3aqX2mwxF0n6OriMlduiRIBgk9fE7HL6
 vPDwjZ7rZn/lt87l9ClkeuhaF4Figj0AttRI6Q+k8dl0ZBsLfKtBjz30/QK9vG2rSrqAY7GTp
 1HbiId14wU2FlyQI0YvEuGxkqRGtXcYZozi1oJBgEIuznyQTo1BmC3HA35hvWMnaNphJ9+em4
 eeV/MRZdbnQbbz9E9b+4l6AyjtTx1go5lXefyLfo2fHI1M7/E0gnyyNXteb+znoVa0KbnMDaz
 uwVMx5dRh+Z8IODI/DrP5U7cq1a1cRno/95ZaIpMUA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 11/05/2023 à 10:50, Juan Quintela a écrit :
> These are types not used anymore anywhere else.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/mmap.c    | 2 +-
>   linux-user/syscall.c | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 0aa8ae7356..55dd143a10 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -859,7 +859,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>   
>   static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
>   {
> -    ulong addr;
> +    abi_ulong addr;
>   
>       if ((start | end) & ~qemu_host_page_mask) {
>           return false;
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98..dd0349712b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -309,16 +309,16 @@ _syscall0(int, sys_gettid)
>   #endif
>   
>   #if defined(TARGET_NR_getdents) && defined(EMULATE_GETDENTS_WITH_GETDENTS)
> -_syscall3(int, sys_getdents, uint, fd, struct linux_dirent *, dirp, uint, count);
> +_syscall3(int, sys_getdents, unsigned int, fd, struct linux_dirent *, dirp, unsigned int, count);
>   #endif
>   #if (defined(TARGET_NR_getdents) && \
>         !defined(EMULATE_GETDENTS_WITH_GETDENTS)) || \
>       (defined(TARGET_NR_getdents64) && defined(__NR_getdents64))
> -_syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, dirp, uint, count);
> +_syscall3(int, sys_getdents64, unsigned int, fd, struct linux_dirent64 *, dirp, unsigned int, count);
>   #endif
>   #if defined(TARGET_NR__llseek) && defined(__NR_llseek)
> -_syscall5(int, _llseek,  uint,  fd, ulong, hi, ulong, lo,
> -          loff_t *, res, uint, wh);
> +_syscall5(int, _llseek,  unsigned int,  fd, unsigned long, hi, unsigned long, lo,
> +          loff_t *, res, unsigned int, wh);
>   #endif
>   _syscall3(int, sys_rt_sigqueueinfo, pid_t, pid, int, sig, siginfo_t *, uinfo)
>   _syscall4(int, sys_rt_tgsigqueueinfo, pid_t, pid, pid_t, tid, int, sig,

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

