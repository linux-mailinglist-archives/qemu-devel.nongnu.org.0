Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D06F32C9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:23:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVMo-0004EI-Gx; Mon, 01 May 2023 11:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVMj-0004D1-Sv
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:23:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVMf-0003yI-Hy
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:23:00 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MrOq7-1qdrY00R1D-00oSfO; Mon, 01 May 2023 17:22:55 +0200
Message-ID: <6c8b307e-cb44-d3d8-5fc8-7bfaf70bf77b@vivier.eu>
Date: Mon, 1 May 2023 17:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] linux-user: Add move_mount() syscall
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230424153429.276788-1-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230424153429.276788-1-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tT4VkWEjE8b/xcAZv/zJeVadReuLUNKomZkVP+PkAz5MurycRhJ
 QNLYbgJ/O0m9uq5IQ1tQTGM8r5mMq/ieoTQQm87ftwhM1okKuea8e5c/+rJnmp+YVbbnUa9
 E4DiE91/3QrhT4gunaQGVLM/02UWf42uyykveoSc9sh8kRLIgbALtqskiajMoCOZ69DnYtB
 5PlawODOe75AjvjEegkNg==
UI-OutboundReport: notjunk:1;M01:P0:o4oao1dMcO0=;P5fEme25WFXbRI2qcRzX1ma9vwS
 1C9ybImjk2ctRKaHfLoeFvNb+OHQXp/qMxdBAqL8mALye9p0/Vyw1qtV/gCluwxbWGW1a7c0C
 3FdezjG/I+ODoNtZNDSm3wlNQzgmouVqoFWf/balZzMmwqUa7+xV65Lw8RZXyjw7V0+Xmqe/T
 0DWvZhdor0wVRLi3SuX55UoOIg5CvwR01VEswIUNry8cvjFvULQYxy3SjeWUKkLn1vE2HkJvb
 4A6vHLKdl9KA6zkDVeJZgjFI363H1pGs3rl7xJ9KpP0AgjpV4MzYaajdzp2Inyf7xvHo+OVEe
 VzV9K4N0NWyZ9Oz9I2w3NH4qeM3JWTvKsnDEBQK38qvEwZEJJK+vpupmTtVh8xecH5WM6ZTDv
 UTN99c51i+49ysWWNeAhNUCG9FPL3alUj8yqkgD2yQvecIeh8HcNGdKotrK609ZEc2qbHwBu0
 aAYqx9jDmTOoqo6qsEi1E2uMtMskAWcXz0YPU0Mfbt7lVyZP1sW+ApW8yIt2FT9Ri8b8jkvAO
 b5Bkq6G6+wH0yqbhJ79Zqp+HTHpRPTVybGd+sDDXG02UDSVCrcYNfoNWtelneVNXqb1z0pTvM
 uuZzgeCEdKASzuIT7wIpkthQHCaa7uI8oMA7LwhwU4tsb79QQ3PC0UhtnHFLlT13MQDWPYyaz
 3bqJz6X99RsqTeNNBlFxY9LybiRiCGR/wDif2cp9og==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
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

Le 24/04/2023 à 17:34, Thomas Weißschuh a écrit :
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/syscall.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98c8..95e370130cee 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9139,6 +9139,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           unlock_user(p, arg1, 0);
>           return ret;
>   #endif
> +#ifdef TARGET_NR_move_mount
> +    case TARGET_NR_move_mount:
> +        {
> +            void *p2, *p4;
> +
> +            if (!arg2 || !arg4) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            p2 = lock_user_string(arg2);
> +            if (!p2) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            p4 = lock_user_string(arg4);
> +            if (!p4) {
> +                unlock_user(p2, arg2, 0);
> +                return -TARGET_EFAULT;
> +            }
> +            ret = get_errno(move_mount(arg1, p2, arg3, p4, arg5));
> +
> +            unlock_user(p2, arg2, 0);
> +            unlock_user(p4, arg4, 0);
> +
> +            return ret;
> +        }
> +#endif
>   #ifdef TARGET_NR_stime /* not on alpha */
>       case TARGET_NR_stime:
>           {
> 
> base-commit: 81072abf1575b11226b3779af76dc71dfa85ee5d

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent


