Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE176AE5AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZig-0002s3-5N; Tue, 07 Mar 2023 10:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZie-0002rv-CV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:59:16 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZic-0000wR-PU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:59:16 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkHhB-1qJeyr3xeb-00kexF; Tue, 07 Mar 2023 16:59:09 +0100
Message-ID: <b42db7d5-b8f9-ec6f-e47d-bf67d1db9471@vivier.eu>
Date: Tue, 7 Mar 2023 16:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] linux-user: fix sockaddr_in6 endianness
Content-Language: fr
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230307154256.101528-1-Mathis.Marion@silabs.com>
 <20230307154256.101528-2-Mathis.Marion@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230307154256.101528-2-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PRZKyhQxfxR1fllwTg/HuT7EP3TWuH9IJGoxy371MPbDqL7AJ+d
 j++NriOBo9bClvaa5MPVMHfbETCpeB4OMZ5/brTXkCS+3HUC6rd0PjsMk4p9fUqAv49Teqg
 Cxa9QShfJNSquBZk/1wa6AKNg3cCS/UEB9LiNDHMsIZRBtHgeIB3UYbcGmTyDJUHPdMQ2Gh
 dStMWpn5ZSwqjGBEDaJyQ==
UI-OutboundReport: notjunk:1;M01:P0:d0OvRTaKLVo=;khMxHc/YoUIX3AL9jNh1EZLovAn
 yUJxSTHFUulNU1w06uJBM5tfE0qAhsqAGqXgd7N9F+j28YshNC5AB6JKyhGL0ChOfGN3cnkF7
 ALMIL9qMuBZK3LmRjOJC55yKn5gXTmKwHKO6B9/bJ0mwxhZ6Chi60khkRGgSZxKwUEGvth42w
 4P00lsiGo1dBm23HwHsLZixMECTYrlVc38m0ZeCIo2uBGDYcf6Lrq0OxUuidy1soehcdyAQ8A
 EgZ6oV/9Kia04mI92xRTVhA2btzFfqnkaOwcuNqipWX8qpmsS4BR7CoKBQBH94/0XV3x+NdvY
 gEKHcQ2FSFLHX8tFS3fELseaTLR0b/tqKv8Q/iwRJAmNJFX7A5smBiHV4SPCeXvxavmumRJHK
 me6WQi0OkrDQ2bbZ6NaPcuzmJY3TvLKGaaf/9kyBFWXnrMmv0hEtA8t0aKQVmXS1D6l4Uj6u+
 r6DQTDJjhUi0Kh226VahqdiXyL0oXvD0U202fpoIjLhUSuPhjgUEjQ0YOPWfCn6q0BQm5/za7
 5vSrwiUd8zBkfPhp0Uk6Db18ZnksFieZwN6/YI5q8pqMh+oPyz7Cn6vhJMSU53xlx1/srA5Mx
 JcccMR1LckVX5/8sjqF8aKBPsfjczNiBx3ndTrDNdS0kJAuN6pWBfgApnWa1KZRnTX1MRiFoU
 2LMjk0tWVVDJyDbCuUk8409dAIONW/sqmUSyN2qnHg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 07/03/2023 à 16:42, Mathis Marion a écrit :
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> The sin6_scope_id field uses the host byte order, so there is a
> conversion to be made when host and target endianness differ.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/syscall.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 247e20572d..bafa77d353 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1713,6 +1713,11 @@ static inline abi_long target_to_host_sockaddr(int fd, struct sockaddr *addr,
>   	lladdr = (struct target_sockaddr_ll *)addr;
>   	lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
>   	lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
> +    } else if (sa_family == AF_INET6) {
> +        struct sockaddr_in6 *in6addr;
> +
> +        in6addr = (struct sockaddr_in6 *)addr;
> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>       }
>       unlock_user(target_saddr, target_addr, 0);
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

