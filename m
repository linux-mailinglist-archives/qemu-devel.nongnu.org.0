Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80B4884E6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:17:28 +0100 (CET)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FLL-0003Q4-Vy
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FJU-0002OU-9w
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:15:35 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FJQ-0003kh-0j
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:15:31 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6EKU-1mzfjp1e6C-006bmi; Sat, 08 Jan 2022 18:15:25 +0100
Message-ID: <5d567ccd-d149-e519-4a9b-e11c3d8e34b8@vivier.eu>
Date: Sat, 8 Jan 2022 18:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/4] linux-user: Implement PR_SET_PDEATHSIG
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220106225738.103012-1-richard.henderson@linaro.org>
 <20220106225738.103012-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220106225738.103012-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ziOaW4nn8X7ZHxdqGAIVMXa4Fvm3v+UGKfKd2XwHLJQ8bl3byfR
 qwKSZShM6/misgEE0uMdaTFsts4ENT8G6zPUBnvoljiMDSQX5Dlqaf9kSu0Y3G7eaLFegtK
 IraJnW6pCOywftNZq/LbThuBE/heQzHtlVYZ8jJgc0sA7wj0SVN2IUeCt8WMn7yHR2BryoB
 sBdrO3p8pe7Iy5KfiwkZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xb4/zkF5CuM=:fZQBnDZ6OHGjZTaf+3aUDA
 2t5kRfUsv1/rMNpLbhmYRwdmir4g4d0eq6kmZVZBqYed9Iwd5wsvu/zXGcL2XBN4nwOLtwVNT
 c2I+VVGxbk1lodGJb6LRir7/Wce7zvuoTsDbHPqmcJvd2xREjSkujowvRjYGkXEJe8IPDdPDo
 t4ZvQAkWAut249o/b9/XmZ8GikRPrxdrGs1YK1rj0o1bT9lm/E5tPv38b7xpMgotgWIWjJqny
 aeOmmpfasfS/LW0VOBPyaevyJGngYL/qM4dHLPgOqhyb0JCfBO14kXw4UzEH+h0q18oL8SlwZ
 9wztSl90srCx8SB/EpboLSzBTo/S8T+vOeCbUgkaaj1vvSFfer7daFA8QW1g/ebem9hI0vQdE
 Th5Gq1dN1IEDy63iEDNXKZTgtPduL0tGdt2yV2ZybUphxKOBlYZCcBhl8LHMaMEQrYu1Y9n3R
 z3thwYioTCcCi39D1acih+lZy8rUKcrLWg8OFrRmXH50bIrB38rcdLGYL1FN62v2K3I1cSa/l
 O4cbo13BjhwtqY2V6i/c4j9f1aJDlFGi9YlmkKF21/a3GQIe7p9NOHPRMuqkqRTDF7aks/H8R
 6nfr8q43eU2XfZs4f5hvEcAvddG3XNxyYk4ggfx4QyKhiYIiCQAgy9cHQq53ytLZfMzTd5rGt
 pT+0f7bhNspBu8tTv/GCuyAYHlics3+TpoAs1W6oo9DX4GfyLscK5x5oWYQu6th+feCg=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/01/2022 à 23:57, Richard Henderson a écrit :
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9eb2fb2bb2..8495f5e08e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6450,6 +6450,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
>               }
>               return ret;
>           }
> +    case PR_SET_PDEATHSIG:
> +        return get_errno(prctl(PR_SET_PDEATHSIG, target_to_host_signal(arg2),
> +                               arg3, arg4, arg5));
>       case PR_GET_NAME:
>           {
>               void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

