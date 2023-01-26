Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB067D23A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:56:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5Wu-0002BR-0d; Thu, 26 Jan 2023 11:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL5Wr-0002BH-K0
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:55:13 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL5Wq-0002Gi-3r
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:55:13 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmDZI-1ouWCb0Moi-00i9tN; Thu, 26 Jan 2023 17:55:09 +0100
Message-ID: <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
Date: Thu, 26 Jan 2023 17:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Fix SO_ERROR return code of getsockopt()
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221216101033.8352-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221216101033.8352-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sZeJcLCgEaQhTYftiBXjayj96pIte/V/W9SVu/LBuQP4arpOm8J
 uQ9A5soNGbnBN0XqDhdMt3gg58u+F5SvnljkzxNt+SYLu7hqrKJ4cBKu9HRSOAdzyE3TES5
 yVP/869ldWMkmLGb+ZOT6ha+WBdS4MwfgyvgsKHen6QXKgIxZayZqmGFBduUpGy3SD3lnpC
 rt9luKHMbYJTN0+7/hubw==
UI-OutboundReport: notjunk:1;M01:P0:LW6bHa6KGpU=;WSSYHqJDOYQ0qLU17JFoWVJCcur
 PxXGm9nNL+2vNPjwUqEznuV2CW3YYjv9eXFTvSbjggQ83/5YhWLzT1NR7iY0+ieIAOZdFczWk
 jg9pagQu2nmgDs8kJLS+3isBDRrbcjowXw4YVpYBUwvWSGYw92TcVX8FacnKu0tA6gjyAonQ4
 1ROlfUTRPzDRtSy6dYp2bFdG2FPTQdTq2odP0j3wsWc/gHYQo2ZBg808GGoWg9t0fKrcCv8rD
 7hovJeHTwrFTSriEKvspmvGFtRNhxE2hdDlKBFgLQ8Ls9lxsZt2f8vzh3mfqXc4FpXtASEvPY
 NKhVHFRU3wPfoMHaih4FW1yIZ04WaM6P3YM++30/+kpV2Mq7Gdqz+SejJEm/D+6rPoThUasFa
 CE0RQo4jG1WiQI3vng+TTxHMaAJKUrR4VztWFZnWs/bRQMgsJ36uF3ExFf/KR0oTsfNg+Ir/o
 /kb3etn6mFqmepktYaTh3seaI1C8/F4weaRo8OqrxeAjTOaiIftBTgA+0TsU9XwII3jcj00h7
 Lfslf2jaxVfg4H998YCzauRTsGQyhgwRm/YmzS+f7wd+7kHd/slBPGtJskEGGDYjBfcIMRQTu
 k0tMN8oaXOEKfX9z+JkneLI05kiFlgYbG33bm4MCYJA6izCJJNLrJ5CPjJf9riqhhrrgYmDwC
 CK3TIrbR7j3uNVmk4/O2/t+h1c5GNDw+4W8HTiV0JA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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

Le 16/12/2022 à 11:10, Helge Deller a écrit :
> Add translation for the host error return code of:
>      getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0
> 
> This fixes the testsuite of the cockpit debian package with a
> hppa-linux guest on a x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/syscall.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e541fbe09a..52693b4239 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2809,8 +2809,9 @@ get_timeout:
>           ret = get_errno(getsockopt(sockfd, level, optname, &val, &lv));
>           if (ret < 0)
>               return ret;
> -        if (optname == SO_TYPE) {
> -            val = host_to_target_sock_type(val);
> +        switch (optname) {
> +        case SO_TYPE:   val = host_to_target_sock_type(val);    break;
> +        case SO_ERROR:  val = host_to_target_errno(val);        break;

It looks good but I think compiler will complain if you don't have a default case.

perhaps "if (optname == SO_TYPE) { } else if (optname == SO_ERROR) { }" would be better.

Thanks,
Laurent
>           }
>           if (len > lv)
>               len = lv;
> --
> 2.38.1
> 
> 


