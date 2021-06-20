Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD5E3ADF12
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:41:28 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luydc-0007kB-1i
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyck-0006kh-H2
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:40:34 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:59613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyci-0002Lq-HJ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:40:34 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8nrc-1lFolf2tXi-015pO0; Sun, 20 Jun 2021 16:40:29 +0200
Subject: Re: [PATCH] linux-user: Fix incorrect use of feature-test-macros
To: Michael Forney <mforney@mforney.org>
References: <20210526035531.7871-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fa351694-acb0-c64a-e22b-56ee7371e714@vivier.eu>
Date: Sun, 20 Jun 2021 16:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210526035531.7871-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+cv5MfpnWMauSfUoBJnTz0wZj+fM1kEl9QlOyYazZwjKmGQpBWs
 6bjoSI/jSZLiWClWHy9NirJRSFKTMQFgqa9pOR4E0ntBKMTf8vu0kT4j3ux5AoWC5FRuM8D
 ABpdRdXVA+H1/6BGaEpYfUTIkY3/3k/O6RQn/GGjnvaNs9aHjU0OmgZGuqfcdqFU/sfqFH5
 K0u9aXbF9C4Skphpxs5ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B1I7iAT9DNM=:FB+pJEjPULqRIkpjQwPXyD
 efLTIboWo7jAMlcTV9xTWgQ4CQXQUsCa94o6rytVbO7HQaP5qiXSWwNyNVIYvvPZFBPIU59pM
 d5WZELs3YC+C9AyERCF0LwhoS/VBrd0jX7hBhZj4sgFqSV5knoWW7Zlr+UD4hazAzVTf/EfAt
 735nESx+xjmyxvwpvvXqdX6FNgU11vuuoNs5LDuGEm1cCYV3nnYgCh47N79iQaYznGCbrzndC
 y6bTkbPsCzbwdu/Qt3lra+Jtk80L0spVQccOOj8llC76VGh3w8id4AG5Ew7vn9673I+t4YVoe
 h03JMMlpzlnuDX9BUtl3g3ZT1lyV1EZeRZw9NCNeQSisS/bvb/R/TNktNOIi0XlsqKpso71Ye
 4UU4FKPSw/5dB4I4xuHmyzBIuZoqwTbw9CqsLvPWgklUDKdnLOa9qU1Ho8xL2m1oW+SeNPH0C
 tPn9HyMfevEEP05UOVcD7fNLZZ2ZodEegRM38lhNQ9kWUWvSO9hFNltl4ntqdB4SMxQSa98oO
 2322WRCut6h0/QITvhtjJU=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/05/2021 à 05:55, Michael Forney a écrit :
> The _POSIX_C_SOURCE and _XOPEN_SOURCE macros are used by the
> application to indicate to libc which declarations it should expose.
> Since qemu does not define them anywhere, it does not make sense
> to check their value.
> 
> Instead, since the intent is to determine whether the host struct
> stat supports the st_*tim fields, use the configure test result
> which does exactly that.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
>  linux-user/syscall.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c9f812091c..9a52f235d2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7470,7 +7470,7 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
>          __put_user(host_st->st_atime, &target_st->target_st_atime);
>          __put_user(host_st->st_mtime, &target_st->target_st_mtime);
>          __put_user(host_st->st_ctime, &target_st->target_st_ctime);
> -#if _POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700
> +#ifdef HAVE_STRUCT_STAT_ST_ATIM
>          __put_user(host_st->st_atim.tv_nsec, &target_st->target_st_atime_nsec);
>          __put_user(host_st->st_mtim.tv_nsec, &target_st->target_st_mtime_nsec);
>          __put_user(host_st->st_ctim.tv_nsec, &target_st->target_st_ctime_nsec);
> @@ -7505,7 +7505,7 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
>          __put_user(host_st->st_atime, &target_st->target_st_atime);
>          __put_user(host_st->st_mtime, &target_st->target_st_mtime);
>          __put_user(host_st->st_ctime, &target_st->target_st_ctime);
> -#if _POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700
> +#ifdef HAVE_STRUCT_STAT_ST_ATIM
>          __put_user(host_st->st_atim.tv_nsec, &target_st->target_st_atime_nsec);
>          __put_user(host_st->st_mtim.tv_nsec, &target_st->target_st_mtime_nsec);
>          __put_user(host_st->st_ctim.tv_nsec, &target_st->target_st_ctime_nsec);
> @@ -10056,8 +10056,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                  __put_user(st.st_atime, &target_st->target_st_atime);
>                  __put_user(st.st_mtime, &target_st->target_st_mtime);
>                  __put_user(st.st_ctime, &target_st->target_st_ctime);
> -#if (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700) && \
> -    defined(TARGET_STAT_HAVE_NSEC)
> +#if defined(HAVE_STRUCT_STAT_ST_ATIM) && defined(TARGET_STAT_HAVE_NSEC)
>                  __put_user(st.st_atim.tv_nsec,
>                             &target_st->target_st_atime_nsec);
>                  __put_user(st.st_mtim.tv_nsec,
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


