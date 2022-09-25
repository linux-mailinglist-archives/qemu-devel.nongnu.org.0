Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCC5E9405
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:40:47 +0200 (CEST)
Received: from localhost ([::1]:35648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTkM-0002TR-In
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTi7-0008ES-Uk
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:38:28 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTi4-0008P1-TX
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:38:27 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtObA-1pXCOO0pKg-00utSN; Sun, 25 Sep 2022 17:38:22 +0200
Message-ID: <e126f737-21e5-7170-385f-5777db602024@vivier.eu>
Date: Sun, 25 Sep 2022 17:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 10/12] linux-user: Show timespec on strace for futex()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-11-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-11-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ittUp9I4WtRAor9IkHiSfY/zvJEEPBSjFrx/ncjl/sX2/Se3qjZ
 Eq8oxQKh+/K/ujMizmv4bn2sRBxJV9qkG849N5vez/xXkwCwkc1jHYxZeuPeDkyUk9KvPwL
 /rJ3zId2XISwllJCHTPb/C7IUUaypAdRSGcVr15YkkBuJsUBAbhy8xJg48MzvIQ3Us9KBT9
 Mu5cuczgj1jMWiKhdA/hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O7zRs9ZFWdE=:yVLHWth9tRUwQ/+P6PXfUv
 BgFV7SuKeRTXUeexqXEldRYXDldyHGfjtkFxtrTN1zUxPUWb2QPztDK1dFQfOloNlrhWT4EvP
 EryfLqmMw3m/Acu4hBgAWajYLNkAqa2emhpKXIrD8WYxR0gPMRnMIbFX6nq7M4PH8MlhspJR+
 8zxaBrHT22uC9MoA9CUh6WON1gpywBKz8RNFHKpaMqo6D/t5I0Ik2a+m2jIwfO+HedckeTjoh
 Z+xmsrKpzzhVZvrXxQNE0X58UOTTcBChoLYKm54GnWKup1oy5/dAXKUy+4cF+TQ1q3lcOXXv1
 3BIwLfhXHM7fPoSQrA3XpBuHkPBrPK1SOm374IDX7t9umQm2u4vJMT+0UhUgMKjPdPq6aY5P9
 OtBCIYEqWpAIg5FvGDD03MAgi+48LIc5t0iuzzdm2DZKumawIwkQC/KQlVPG673oXftlvH6d5
 BsxMyCtJ6fgmkfe0v5UYIXuxaKSsVLU+uBIt4oJAeP1xNQjrwqRgLThT/af+QrQzfEN0eXnr/
 N5wl9nEMoZFicJB2i5Rn5fIuuf7P5SBDF4DYK1BoDBuEI4tzczniZJylbKaoqjEz0y43unn+0
 ROlqXj2LeSi6XyIhJSTHdHeYXLx0unLq1k19e/GT0r7xWpklf9o/cvZlsDXTcKWkaRp9y8/7D
 bNrGRJw5zNyl5DJWZd5/xxBUmtKiPvRaVWyfZE8ifQqFIuoGFq9mEDftVTN6F/439bthcKDbS
 driZoQhMbetLrOaIVZ3hGWL+TaOwnjlgyrvXGVC9FcBJKxnK3vTsDxIl+NdKIAoIKDRGd1iVx
 WDNl8ow
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 6f818212d5..b6b9abaea4 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3714,11 +3714,20 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
>               abi_long arg0, abi_long arg1, abi_long arg2,
>               abi_long arg3, abi_long arg4, abi_long arg5)
>   {
> +    abi_long op = arg1 & FUTEX_CMD_MASK;
>       print_syscall_prologue(name);
>       print_pointer(arg0, 0);
>       print_futex_op(arg1, 0);
>       print_raw_param(",%d", arg2, 0);
> -    print_pointer(arg3, 0); /* struct timespec */
> +    switch (op) {
> +        case FUTEX_WAIT:
> +        case FUTEX_WAIT_BITSET:
> +            print_timespec(arg3, 0);
> +            break;
> +        default:
> +            print_pointer(arg3, 0);
> +            break;
> +    }
>       print_pointer(arg4, 0);
>       print_raw_param("%d", arg4, 1);
>       print_syscall_epilogue(name);
> --
> 2.37.3
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> 


