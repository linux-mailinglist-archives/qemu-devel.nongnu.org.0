Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28737BBB7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:25:59 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgn02-0003xz-Uy
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lgmqo-0007Tv-Qg
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:16:26 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lgmqm-0002Cy-ML
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:16:26 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvJo7-1lOqQJ18Vd-00rJwN; Wed, 12 May 2021 13:16:14 +0200
Subject: Re: [PATCH] Constify bitmask_transtbl fcntl/mmap flags_tlb[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210511103502.2875844-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b5f1d638-fc78-2645-eed0-400e82938bb0@vivier.eu>
Date: Wed, 12 May 2021 13:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511103502.2875844-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T7o6HDjHibuDULfCs4ZMS3x/FSWC9yQEghANPSfeWPvisXjoTlQ
 WcbTU4b9ClNW6PrNk4BNNng0+T3eamOm8D+9i+4yUkY+562qYGUm1mzPYBGFYjywL5GfBQR
 I8Rd2QlXmiCEOelaUEzj0qy4BdN1inGrWXfuuYjlPNvDRL2ayqNXdYkNF8wMbmmFa2sNoEA
 aqLKKqDFU1Opr7rmX5gHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j/XlrEh7e5Q=:JeezTVikxvg4sEmRrMHkZN
 JUQ4o/86zWQHkK7mfAC0PcuaSKwDSdDcTykH1sZnDvmT73cuPoCNQo6cKGw9fqmWh2RswlVbM
 BIrBYFUYpjkEE8G2lh2Eubc90hSL2c0bADkj67TNa+k3Fu3hMUU69TBGb5BUox24dx0EWX6J7
 O63DKzbc01ZQzrbNy45UJfGADFXnHYNU9EAA1fUIuiE/EB3mHkKynaN/JkvY1zyFif5CuQu3J
 /g0PLsZM6bj+WTYiLDMIbcWd8PmHfud2YpURhGzA0qkAM8AdzItg4B94HVdafdq9/QhZ/KNCU
 krLNv4thMtt/hGeQBr/K22vpJ/rvtCMTjoezSzYqZ/s7zkDQgWcIYR6le3t4PaHYxIMKwWAkI
 oFmBT7mX0M1fgnldynwQGdZRmI5sNxm/KfjLmYsCbxkB3yAit0FwVESX79wGjqAZdm1hcT4Pq
 wKgWwZetTVqsOnOlOd+Pa+p19bLRauGqfA8B2/m2JfMsE8EhWIJ5Rra4E5Ly0eCVNPlO6tLrm
 hKAKRHeZPJdKcqJqB/NJnU=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 11/05/2021 à 12:35, Philippe Mathieu-Daudé a écrit :
> Keep bitmask_transtbl in .rodata by marking the arrays const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc437..64f486743a9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -365,7 +365,7 @@ _syscall5(int, sys_statx, int, dirfd, const char *, pathname, int, flags,
>  _syscall2(int, membarrier, int, cmd, int, flags)
>  #endif
>  
> -static bitmask_transtbl fcntl_flags_tbl[] = {
> +static const bitmask_transtbl fcntl_flags_tbl[] = {
>    { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
>    { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
>    { TARGET_O_CREAT,     TARGET_O_CREAT,     O_CREAT,     O_CREAT,     },
> @@ -6062,7 +6062,7 @@ static const StructEntry struct_termios_def = {
>      .print = print_termios,
>  };
>  
> -static bitmask_transtbl mmap_flags_tbl[] = {
> +static const bitmask_transtbl mmap_flags_tbl[] = {
>      { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
>      { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
>      { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

