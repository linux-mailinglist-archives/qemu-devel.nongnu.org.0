Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5A6F32F4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:35:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVY9-0000FY-Jg; Mon, 01 May 2023 11:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVY8-0000FD-1z
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:34:48 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVY6-0006ME-9m
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:34:47 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MX00X-1pmZgY1Qnx-00XJVJ; Mon, 01 May 2023 17:34:43 +0200
Message-ID: <4ae0b68b-6c6a-2ed1-c6c2-a228250858e0@vivier.eu>
Date: Mon, 1 May 2023 17:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] linux-user: Add open_tree() syscall
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230424153429.276788-1-thomas@t-8ch.de>
 <20230424153429.276788-2-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230424153429.276788-2-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GYV6mgCZR2QWeVFgrbCDrSJwPu73UdR3SRMBQOWhArVpUQWrTw5
 fVa9Fq32ssARaKYBqF3PsZniaSB/FcteQbTyODRTW6/+PFtEygP3Dzzhy6dM/xoaBm/4Wkn
 DZ9uNYaRKwN95bOHXQuLtDKK+eOxb1NEwPYBncQJdteRt/Z9QRwsJR9LDqMgtwCStY4wIJd
 nlAz06DzVdpsEWgnq3Gzg==
UI-OutboundReport: notjunk:1;M01:P0:1v7BGZpRzA8=;6riAoOh3ZCK87bUOWzUqEs4xSPn
 pDi8qNHYZ+yh5ocdZioQPUjH3nmE5f9UxG1pqomWnd/4UB9eaqZVPb+0TJmDvNd2gNF20xaJC
 3CZL3HgkCGz/nULc+7O6MEesWWXyzwtfwHm3YX6mwayVxAEOwyAkN3UY8YLWKS8GxBfxrcBQ+
 4mw5ClAh0vy7aM8O97B9YC5ZkaBR2UZgL8zXV8UbmT+OL9F7c7pIRhaIb1Q07fFZTH/+Tm5Lf
 n2hjN6/tdCNtpiaMuHyQZ82H8AsGDhZzk/dBzcWY4XBtiQBLL4vioCJw43iI0aOyct9pkIap+
 FpJXaSga66QEHjGUjcHmd8s5GTpHqtfxDnL6fL6pkmTXj9qSu8E79pm70z5ufAVUtfn8NdeZf
 ay8y+ftUmHImX3VvqQiXbBtbrc4/IP9wNi1sVebt9LOO0QKsrq4kzvecht4XJs20gIUi+UnEi
 tNLgTeGKYwjafjB9Yjg+oyR+gmLiu+tjz1yAFzfK0MYATwQtEEI6WDXx6sXYAIFiC4vpAo37m
 oCFxCgCISm3P1G0WWcQq7Qda/N/WQ29NP5/yeROncM1I1QWm8Hd+c1Bdvme/BopboIW26PaCs
 j3G3S7vLeRN2nrcr4vVKjNp53U/mORaMirLDhRkc4HL46fWQufTJQapHX73JayEo/vMOu1E7c
 Z84lpskTWlDgZuMvZSEcnZSDBzzOVm+dF6kiswVeiA==
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
>   linux-user/syscall.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95e370130cee..140bd2c36e0f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9166,6 +9166,32 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               return ret;
>           }
>   #endif
> +#ifdef TARGET_NR_open_tree
> +    case TARGET_NR_open_tree:
> +        {
> +            void *p2;
> +
> +            if (!arg2) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            p2 = lock_user_string(arg2);
> +            if (!p2) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            int host_flags = arg3 & ~TARGET_O_CLOEXEC;
> +            if (arg3 & TARGET_O_CLOEXEC) {
> +                host_flags |= O_CLOEXEC;
> +            }
> +
> +            ret = get_errno(open_tree(arg1, p2, host_flags));
> +
> +            unlock_user(p2, arg2, 0);
> +
> +            return ret;
> +        }
> +#endif
>   #ifdef TARGET_NR_stime /* not on alpha */
>       case TARGET_NR_stime:
>           {

Applied to my linux-user-for-8.1 branch.
(moved the variable declaration to the beginning of the block)

Thanks,
Laurent


