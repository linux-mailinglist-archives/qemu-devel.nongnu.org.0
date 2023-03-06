Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF50A6AD0C1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIbv-0003LT-Fv; Mon, 06 Mar 2023 16:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZIbn-0003HL-JF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:43:07 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZIbl-0003AE-Lk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:43:03 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQNAv-1pvUHg3uy1-00MKzq; Mon, 06 Mar 2023 22:42:50 +0100
Message-ID: <16feda7b-edb7-5f6f-8802-46289d124346@vivier.eu>
Date: Mon, 6 Mar 2023 22:42:48 +0100
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
X-Provags-ID: V03:K1:3DyxpAPrhgXg2P25MXEGJ6MBC9mSWep0eqEVP1pESXiQzsV0a7F
 bUEkuNxqUqjmiOSJAOn6lWXNkWqBO6rcZ+O7IVeMYca9I6kZVbgaFEEFjVszh1CDhi6NKGc
 3GLiZucc0UiPUVGxrhneMao19ZSCNXlpzq1C5sHlmMWDzO7/pOXHjlc3PhqZQ+TZTSDnXcX
 c7DrttF4zDVQJ0qrksC0A==
UI-OutboundReport: notjunk:1;M01:P0:Wf9x3nuAWbw=;juSD+wyMxZGFSgQLf5OdYMhEZtE
 1FmRni6h1i5+0k6W6+yv5yap4k/bHW6LRT5ZUiTLRE9cIGpXo/Ul0JURi4QKzeW5UfQNQ4xey
 d60pm+Tjj0ABeCq4glpiwe44f1XF9/Ar1EhZ5/KeNlvIvB4aa2h7bg/ydVVM+6EN4OMJnxjHa
 nDEeeuIEAJWMzWh5QEQzhXlGPrdrKKvMD/skJh9sFH6U8exTqjglAst+bQIiYGKF5biuv5rjb
 5Wx7X55QJ2jNQwGNyTtCAmOJChEEByVX+wmHqhjZEMZ1VTxkjHC/tP/qWc+7k0B7COgwJWtef
 unorwHKxCpRbUcmcEPLRu4E1yxBETv5mIHlaVBNylu3+e3r26guACiYwH8kvaJRFtVrJ/hTj+
 h0cXb1Bx/heiLY5pH1KdD6JOJyEB/CPaVPAAPz/u5Zq6G9q6FAnyXMISQ7ZP6iD2VemGh9SXM
 UyCpMKtH7/Qry18p2jkJiUVu9PANH8kHo23zKQBmUeEYdMtRQd8HElj+OiBCjCkqNrsBeALQ+
 WU3Dcf4mXpoTqyZPXeON4gw0Wf249DfrqXpGKX+T14IpbL99C98I9usC3hy8zhsqc3cWFjUs1
 VK+ZldTXlmHQp6ic2iMrrjYc+EUmDdRx8vqnF/cO3qa1RmoJHL22PBVEzxsMnj8xqxccgo+nW
 GnAhuL4w5rIvoD3Kkh4KNzjasklK9L6xHfmz40gwoQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

