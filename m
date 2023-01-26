Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059A67D115
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:13:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4r3-0006LH-GK; Thu, 26 Jan 2023 11:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL4r1-0006L1-2l
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:11:59 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL4qy-0003Sc-Ay
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:11:58 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhDN4-1ogo9q1HcY-00eK9s; Thu, 26 Jan 2023 17:11:52 +0100
Message-ID: <3930b9b4-a9b0-2157-c2ea-6739224ea2d6@vivier.eu>
Date: Thu, 26 Jan 2023 17:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Add strace output for clock_getres_time64()
 and futex_time64()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20230115113517.25143-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230115113517.25143-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:By20nr7zOzaOIUJ5spXJDYAbg60Zua57M7GeuosY+f4uH8hMlwt
 xcQnMiaP/Cs5MWWtVDrq5j/9fAPFQyg5Zv5R3OjJbSQeFyMkOlOLUI6px9EdyOYXOWAWdrq
 VpMqej/9B1g3JR1TV5DOKntUpZb4wrVPcTbeY2ORv1705mcO7Us4r/jGRvCIYNnsWMYL6Gi
 36Hm1de2tby0Tbz4hwWvg==
UI-OutboundReport: notjunk:1;M01:P0:ww4/in8XTXE=;Svl0zZCWgjYXn5+EBHkMpRwYQz9
 7pPSj4Ra1Y6fgBaZ9y/mxaUj/L1u8WjMAherz6zNFoz0TKYVwYsC1/JjOkM5Tv3N8Cf/ughzF
 9//BiK1ErxGEGypYsBzbblLJYnKNwSZRnzzYEr8fq10o5y2de0iYXFcszO5moUs7uV6HNRdgY
 /rxTT1OV+ktnIS/BvUhZ9yBg/3GZ69sKq4AXhwoIXvqqFwRBy3L45LVeeS9CV79EVKogVxQjV
 gGmTRnHB/pEAveg0BJZEMjbWtIXcgJkL3BdsaWCOp7a1w/3JPcKhMImazk3aIDxQnnuFZAj5Z
 9KYYwB0OaMYugWzeXENbA3DTiewm9ypNOSLa9CQWf0d7Fmquz5SNcEwVzFYt4HlZopFZmIDmJ
 kaCykv9rQ/0eKpdcQUaLKf99ERVPWf9fcqIeutTNNBfGo+0Wax0sMIQSVX0qQBZdWEN7yBcwq
 D8ntSRRWY0raiuZFRyf1BuLzOidknyggrKCUUF2wMiF//Ju01bD3nMGtoH5YsCehGN/Zep06S
 zfu+r7UZj6R/MaZHApEBsd8OVlmmu1nzUTGqh/eOTzV53JUqis7+bubxyw2+e673n3egFn239
 maBfC6XrjS2jPNScp/EiQkJwh9y0BGW3uKxBLxhcNaATfV415PaizYaBvaqqzikXU/C0cwZox
 UlPmxUdTJGok+5D0pe7r85qzAzOqMsjH6S89/J9WgQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 15/01/2023 à 12:35, Helge Deller a écrit :
> Add the two syscalls to strace output to avoid "Unknown syscall" message.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 41bb6bbfbc..3924046426 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -86,6 +86,9 @@
>   { TARGET_NR_clock_getres, "clock_getres" , NULL, print_clock_getres,
>                             print_syscall_ret_clock_getres },
>   #endif
> +#ifdef TARGET_NR_clock_getres_time64
> +{ TARGET_NR_clock_getres_time64, "clock_getres_time64" , NULL, NULL, NULL },
> +#endif
>   #ifdef TARGET_NR_clock_gettime
>   { TARGET_NR_clock_gettime, "clock_gettime" , NULL, print_clock_gettime,
>                              print_syscall_ret_clock_gettime },
> @@ -275,6 +278,9 @@
>   #ifdef TARGET_NR_futex
>   { TARGET_NR_futex, "futex" , NULL, print_futex, NULL },
>   #endif
> +#ifdef TARGET_NR_futex_time64
> +{ TARGET_NR_futex_time64, "futex_time64" , NULL, NULL, NULL },
> +#endif
>   #ifdef TARGET_NR_futimesat
>   { TARGET_NR_futimesat, "futimesat" , NULL, print_futimesat, NULL },
>   #endif
> --
> 2.38.1
> 
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent



