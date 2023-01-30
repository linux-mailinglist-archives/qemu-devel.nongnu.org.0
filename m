Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510556807B3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:44:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPlw-0001TE-ON; Mon, 30 Jan 2023 03:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPls-0001T1-Q1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:44:12 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPlr-0007HH-76
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:44:12 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0WsG-1oQ4U842ey-00wUSB; Mon, 30 Jan 2023 09:44:09 +0100
Message-ID: <b49b0d9e-665f-1a1c-e64b-d5036f68911b@vivier.eu>
Date: Mon, 30 Jan 2023 09:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
 <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
 <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
 <16e8f5c4-45c7-de0f-f53d-2fe4549fff7e@vivier.eu> <Y9QxskymWJjrKQmT@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9QxskymWJjrKQmT@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c4VcP0MCYMuBeQ+IKnyzQBqB/SPnwpHZFGXe14Amp69kJ7rNYlj
 GhFQWRDSqCoHyNdIrJb/k5z5Ug53Ei5gaVqu7BueaSMGdPIZbMlIFDxt+PgtvJz9Iu9zQnq
 JwXGKOuhkUMxpJz5hw5VrwjwSd8GmxOGX8oGtyi7PP59I3V+mpUoeHrXtwkoM206l2TckG1
 7rteTQHFuEIiOboS0RUHg==
UI-OutboundReport: notjunk:1;M01:P0:dTGxGmC7o/o=;IPjy+IpfC7KEproM0tIHyY3/td2
 DFhaWMEvjOhpUzLIioVcztwo9yNIQLAlMxDhP0KD52LzV5Dl6YD+rAxDEbLC7OwgOHwCZdqOe
 jPSXC8gnMPVKCGBtnG/uM+lqt2gYmnYQWbsQ9o2BUfHmmu0YsD2bZGxO16SeMDqQgxJz9lB6H
 fugpAbDbUGJweTz6q8E+vG2AbiQy1E5ArYDTz6XYhNS50TelJB6Sz7jznYtMyNLnnPzWv8F3o
 M1unbcDruUrMoWOrIiIMMBnjEmh07TcSXZpoFZ7BJYXwF/BZ3WANiaSo/Gpl8w0IB9C7AMLP3
 zgswwwE23r2bO4JOg4A3QTZA3s3z05STiX+cvU4Rg4gsLl7m9dlzxZT41g6qngXD1fUZjoqk5
 QfT1lM2+39NhotQd46iET7eCn2DafvM59zGioDSwjfVbrcG59I4A4KwZIC+wEc5ZsLjgmpPPw
 6se2ScL3Q/OjL5dE4rZzF33sIc4O2bmmFbDgVFEiSlZ3u5r1oqaa9Ofe3jPlFxi98sx4z7rBa
 tG6wpSiT8xOha6Wl+qY8/2BYFN8PMt/RMHkKQAQznsOd7raWbpjtLSa1Zoi3dyZ4vrVaxcP6z
 TirqmbeFQJspuwIQfH3qHtbPoBKKTxBFbKtdEBc6/ps+CIsC46+I1IOSp9ZY1o0RCSjY22Z79
 rqgLjejNCcyuN7POqEW+Eovyni/SECjwITITNg4Qig==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

Le 27/01/2023 à 21:18, Helge Deller a écrit :
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> --
> v2: use TARGET_ABI_FMT_lx instead of %p in personality output
>      as suggested by Philippe Mathieu-Daudé and Laurent Vivier
> 
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index f9254725a1..703c0f1608 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1043,7 +1043,8 @@
>   { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_personality
> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
> +{ TARGET_NR_personality, "personality" , "%s(0x"TARGET_ABI_FMT_lx")", NULL,
> +  print_syscall_ret_addr },
>   #endif
>   #ifdef TARGET_NR_pipe
>   { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
> @@ -1502,7 +1503,7 @@
>   { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sysinfo
> -{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
> +{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sys_kexec_load
>   { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL },
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


