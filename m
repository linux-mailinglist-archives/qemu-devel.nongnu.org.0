Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD63A772F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 08:38:12 +0200 (CEST)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt2iA-0002CK-V5
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 02:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2h2-0001Mj-SX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:37:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2h0-0001Xc-Uc
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:37:00 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M7v18-1ly0Vb0ZV4-0054i2; Tue, 15 Jun 2021 08:36:53 +0200
Subject: Re: [PATCH] linux-user: Fix incorrect use of feature-test-macros
To: Michael Forney <mforney@mforney.org>
References: <20210526035531.7871-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1143d6c6-a393-626f-048d-acd2c1b4de92@vivier.eu>
Date: Tue, 15 Jun 2021 08:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210526035531.7871-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E5IJ+sg8WKm2nFY9J0IRUwu4wNhxxp9zlUlAadY+0VFp/KCFq1M
 A3vOMXCS5XYig1v15xErf/G871kv3tWNvtRAyOI7m7WCK9XCebT3sTQ129tJIPflENQ9CIj
 1Z2PbnrnDcCDUILhchjdL5ej1ny1ofdLjc1345Tt/ofrC4dqDsb6BPaWUOivZemczNVypoB
 rymP96lIcx719XN475bgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QSt7KkudJyI=:0wvqfjSJpVl0mB2h2q/lMC
 9xNzd9nnSqSr4t+O7KDHbtyOMtWvlV+celRXOlyCfvvFd3aoDV+VaQQGSb4Gqg0MLKp82HByh
 K5PyOUpFLr/1DVuNLJEEh+lNz95gVV63uR/2mc2smpreG2oQCZiv8cQMyOLYvBxVb4fzcltgM
 FuH5neWR6dcdXaVZ7/8bvwi5t8E3sVmSSwSu9OelxUneCZbOOLeMH5gMnnSF9ym7BnCfeq3t4
 QUcIQUeDDC52M8MBt8FvxayxnpriLIcWmmAzsSKoe74++bMNA8jcy4RoFfbjIMTKyS2viIElX
 Xnh6IJH3f2eltUYqHtyOpEnhJIQGHFFaTEzhyOxVJVcbTpHh8jZs8MczpM5QxIQ/qXBcCCQY+
 Kw6/uXZjSUIh8Zq+VKNf3pTXsTGuDlXqwtbAFQ9HZYDOIHRTSC08ZinQKn7hQV+1b2Py6y7XS
 w8aVWiB+XH8NZ4jMRqYeg1c/9lXiaHDygOEEdrtZqHSHeX0X0AoD7FohfBIyQhz+wTxffkHW+
 omqQhRytQk2M1MjrD6RQaQ=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

