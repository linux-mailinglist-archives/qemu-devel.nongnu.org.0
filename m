Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795A6ADA70
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZThi-0006TD-KU; Tue, 07 Mar 2023 04:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZThf-0006Iy-W8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:33:52 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZThe-00040q-5k
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:33:51 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5Q2f-1pY6G53kpB-001NHX; Tue, 07 Mar 2023 10:33:45 +0100
Message-ID: <45385be5-f134-a962-f9ea-242d8d3dea21@vivier.eu>
Date: Tue, 7 Mar 2023 10:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] linux-user: fix timerfd read endianness conversion
Content-Language: fr
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-2-Mathis.Marion@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230220085822.626798-2-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nwjm72srR0LRIS1F0q9Aq1YKWZVBd3h0OHEyVrezkxwTNw00a3d
 iNPzrxspMQs6lPz/WNU6KKh4xgfJTmqWPm4fLGX+YEbcmnd5yLwNx8YA2JvhpQ+jSUrnhER
 lGgsnLO+7c2QNXmxcd4iUBdAFOZXxOn0eZMQIQr9q+aINWek9vYb6hJ1cBukqi6HdLvT0Ut
 AptTWF5gyHY3bnOG1ALZw==
UI-OutboundReport: notjunk:1;M01:P0:vSn8EgmWPvw=;aSZ1uOTRSh5mQMeX8JuFWw081JY
 crekg1IyON/Fw8kUTO/ZF8vAjM6n9rnD4OU0VQu44amREjKROgGqmw3+OdWJjazYK2q37CZke
 cmWwTtfiBb8SoJYwswhblBZrZKfIrnK4+3FFBVsjDkRYpkpXsLWO41QZVcENu6+samuXBq22k
 0K/99jQ1insMRcAlqaErM+A93ezfIGcDI13BBMTUkeFBPLsoDg/gCOhHfWDnXTBiyzOvifwl8
 O5l7oOCTK0zA6BspuLRaRriaIExGNvCoDZi3qhA6+28CZ0ABkKyDBV8L3WrnPyZVsQHdEs836
 IvKFW/yTzDi6R0EGDtTvBHk5M0aMb60wgxrds640/2eGFFFRA1vi4lUdYb2L2dUhS3ZoG05iR
 mo+ECknSki2nNDMG6epsmI0fpy85jXwQhMqLxklzmm/hEqipf5C1Mpwza++NU2cvO/+OX8Zce
 aEtlYE99xu2FSVQ3s6vhpXNeYt3dYfavENGVJLzFhYp3B6B7eOrR4PWZ7P/959X3IiIlrrBBE
 n9FIHdHKJExhU2nxIsbafDNeSqqROxnwg2SIreoRugiDUSezaRMEHa1IFIfEo0ELSqecQu2hY
 oLYdUOn435xhyWT+zyERX1MCEbQsjlse4AX90gsl2fVXHarTNUr1PqxA7f6PoyBrzDW2J7RNz
 3vXxXAOVncfNMfoUWvJdHWxt71ximnLOw+1Zowfo0w==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 20/02/2023 à 09:58, Mathis Marion a écrit :
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> When reading the expiration count from a timerfd, the endianness of the
> 64bit value read is the one of the host, just as for eventfds.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/fd-trans.c | 10 +++++++---
>   linux-user/fd-trans.h |  1 +
>   linux-user/syscall.c  |  8 ++++++--
>   3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 7b25468d02..146aaaafaa 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1622,7 +1622,7 @@ TargetFdTrans target_signalfd_trans = {
>       .host_to_target_data = host_to_target_data_signalfd,
>   };
>   
> -static abi_long swap_data_eventfd(void *buf, size_t len)
> +static abi_long swap_data_u64(void *buf, size_t len)
>   {
>       uint64_t *counter = buf;
>       int i;
> @@ -1640,8 +1640,12 @@ static abi_long swap_data_eventfd(void *buf, size_t len)
>   }
>   
>   TargetFdTrans target_eventfd_trans = {
> -    .host_to_target_data = swap_data_eventfd,
> -    .target_to_host_data = swap_data_eventfd,
> +    .host_to_target_data = swap_data_u64,
> +    .target_to_host_data = swap_data_u64,
> +};
> +
> +TargetFdTrans target_timerfd_trans = {
> +    .host_to_target_data = swap_data_u64,
>   };
>   
>   #if defined(CONFIG_INOTIFY) && (defined(TARGET_NR_inotify_init) || \
> diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
> index 1b9fa2041c..910faaf237 100644
> --- a/linux-user/fd-trans.h
> +++ b/linux-user/fd-trans.h
> @@ -130,6 +130,7 @@ extern TargetFdTrans target_netlink_route_trans;
>   extern TargetFdTrans target_netlink_audit_trans;
>   extern TargetFdTrans target_signalfd_trans;
>   extern TargetFdTrans target_eventfd_trans;
> +extern TargetFdTrans target_timerfd_trans;
>   #if (defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)) || \
>       (defined(CONFIG_INOTIFY1) && defined(TARGET_NR_inotify_init1) && \
>        defined(__NR_inotify_init1))
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1e868e9b0e..58549de125 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -13117,8 +13117,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   
>   #if defined(TARGET_NR_timerfd_create) && defined(CONFIG_TIMERFD)
>       case TARGET_NR_timerfd_create:
> -        return get_errno(timerfd_create(arg1,
> -                          target_to_host_bitmask(arg2, fcntl_flags_tbl)));
> +        ret = get_errno(timerfd_create(arg1,
> +                        target_to_host_bitmask(arg2, fcntl_flags_tbl)));
> +        if (ret >= 0) {
> +            fd_trans_register(ret, &target_timerfd_trans);
> +        }
> +        return ret;
>   #endif
>   
>   #if defined(TARGET_NR_timerfd_gettime) && defined(CONFIG_TIMERFD)

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


