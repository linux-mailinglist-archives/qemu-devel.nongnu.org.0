Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B323A9BE3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:24:16 +0200 (CEST)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVWh-0007eF-DE
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ltVUk-0005dv-9H; Wed, 16 Jun 2021 09:22:15 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:42131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ltVUe-0001kc-NL; Wed, 16 Jun 2021 09:22:13 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MeD1l-1lLY7F3rJn-00bHmn; Wed, 16 Jun 2021 15:21:59 +0200
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210614144245.17660-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu>
Date: Wed, 16 Jun 2021 15:21:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614144245.17660-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4W2V3Z4CYtL7el7JfnLAI8ohURwVHIW+nMG6iGVMq1Hmqaj0BaL
 F8ChUxUd4aga9r1asgTMEQC55HtBd05eAoXPJ3y2vdMLDIqpCfbYnwU44bAowTWNEG9Hras
 DdByRAcwO+DAcUQYhFyayTgLn+8iKMP963AIpxMU6+Zw4+c0DMA/6AtD0u18JOM2aaGyCD0
 NoyjCeX3Aq2ZkLjICYA7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dmeW5WP9id0=:LKLS36DwaaBa5I3WFRhZR7
 3pPERjvaAkv8FOGzLpidqvNu6spigNgnp0nf2z+jccR9MX3EpzNUwnGxato+M5u2doU5wI2+C
 6/ohdjdPH3rZLdKqrf81KiYbiKudT+yodQFA6xk7QNfMi5FKcupPT2S3saVGtbzSCLRx7CyIQ
 dwTRKzYWh8xTJAlEfuJcFQEUW0gfszb8ndPNMFi2w0rcR713mmtieImGudGAHrYa89cosYe1n
 XOVxCFzwd1nayRHmV/T/ME+AzfyLcG8yjRvOGFk4y5OhYa+Mmv7NHNb/CVaJ0HCAKr+Dfy9Pn
 R5rdKIdQ6aPpQixgzmk0utePr4ujKEE/WnXZU5s4hkk7bA4Z2RAlEQcSlgfagiHUEY436CFUk
 jizxmd2xQBCyWtfrX9/p7UmojtN2+oU0nMu4nx683rSEApGyTLgVS6YH+K+eM12QwXsBw6UM9
 5NZfc1BOUbJH9b6xRnvb6uSZAbsHPnFHn/HQwzD7EtTT/yE/hu7Myqf9ujx29s4L55CGvnv7k
 qi3+1dxBcO4iLmODUl2YR0=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.17,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/06/2021 à 16:42, Alex Bennée a écrit :
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fix typo in summary :-O
> ---
>  linux-user/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/trace-events b/linux-user/trace-events
> index 1ec0d11ee3..e7d2f54e94 100644
> --- a/linux-user/trace-events
> +++ b/linux-user/trace-events
> @@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx
>  user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
>  user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
>  user_handle_signal(void *env, int target_sig) "env=%p signal %d"
> -user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
> +user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
>  user_queue_signal(void *env, int target_sig) "env=%p signal %d"
>  user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx64
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

