Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16493C721E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:25:49 +0200 (CEST)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JM4-0005yO-Vo
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3IuV-0006sO-D1
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:57:19 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3IuT-0005UL-KZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:57:19 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MekGB-1lSb313jWf-00aoM1; Tue, 13 Jul 2021 15:57:15 +0200
Subject: Re: [PATCH 08/11] linux-user/syscall: Remove unused variable from
 execve
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-9-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <26e6be99-7cc9-762e-7c66-18a326fee038@vivier.eu>
Date: Tue, 13 Jul 2021 15:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712215535.1471256-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UrZucqGkK110atoT2lsW8AgfVkMg8OTXAgNpyVinYkDh9MVYn6S
 gXG1voA+fzq4wvpCyWVSRr8jjLKop6spHHkPmuMQ2dp/cmvX7/ZBHEp1gg4C4ZMuRatspZl
 r0vh/e8diE9lm/hHlcC/TX65BXkuQp6h+ybs52QXP8KEFcX8za86UHj7SJRoUZOUeHGbsHH
 fzz5A3d09Aks3jVC3ue4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xk5aL4LBSmo=:8Yjvx8yk3TjsaqgoaB7oKe
 Pqz8N/KFf3CJ6LBnfXMpyAgo/6QseekvD02eLtrsQQuK9u9VwdzC1qjgQAZIIe1Cj+mFFbk9Y
 lBbA6fqOeicnEKmdNvetsRzcMUww50NCqF/yohwAHzF6kCUYeNgu/8zNdGDJW0T15RQ9lXRsY
 B7lAscFFjHfjdFeM3VjUeIbp0SSeUYEteZgL5i73fVuDuRBMU65ZKsF9rSQiC6eIc5w3ZUVVa
 9sQ9LYxQqabc9qdhHJZry3J59pYMXeymtFAT+0efccWe6ar3QKSpT52mvx2oRyze9pYYuGBu0
 F/437feH9xyunJti0murIjHMbqPchxZePrCClyfpCRvZyiCnp8wI5Z4x0MSWDNf9Zu8xSIc02
 XrlwgEYQGPm36DyrjEtIK5uUVuf4aV6O36RB0YyF/5e38IpGHO9/wSMcY2dcQee0eOCtvIwM9
 7uHvtqwyD5Y3S867kMnDt/AMCFuAFHFTWIZrS9fMPNrzm757PIYaJ+YMmRtnY5CyrRRxvgwnR
 Etyp1oIS7s61626UYjFxmT3WMC+AR61JPDXXsLdmhHtTBGi9VWMl1ID3c/7OJUpwScclodkGJ
 FJQ0RUV5kc4xTn2tCfE3IB3UBYOg1qQsxuMe2vxh1QsDLUuj075t5ly3XXveVYpnSQRnVopy0
 VkJqQYYp7V7bd/JwtXjk+nbP/bUW2vNg8FmynvTrDLt1iIX8vCRxGaCMVjkP5XSPnL6KpMssf
 CCFxgyjQn/+lsyK37Ez79cJzPczgTpKndDAcF2j/2zq8lne5QXAcjrqxaCedt0whMJeJ6cTZb
 6YsIym0BccA3xvLgYkm3pAi+mJlRqQ7mt4A62WUZbYhZpgXnaP8jxHVbhCza5ITFvk8n9PX
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.368,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/07/2021 à 23:55, Richard Henderson a écrit :
> From clang-13:
> linux-user/syscall.c:8503:17: error: variable 'total_size' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e826206d2..c27debba8c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8500,7 +8500,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              abi_ulong guest_envp;
>              abi_ulong addr;
>              char **q;
> -            int total_size = 0;
>  
>              argc = 0;
>              guest_argp = arg2;
> @@ -8532,7 +8531,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                      break;
>                  if (!(*q = lock_user_string(addr)))
>                      goto execve_efault;
> -                total_size += strlen(*q) + 1;
>              }
>              *q = NULL;
>  
> @@ -8544,7 +8542,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                      break;
>                  if (!(*q = lock_user_string(addr)))
>                      goto execve_efault;
> -                total_size += strlen(*q) + 1;
>              }
>              *q = NULL;
>  
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>

