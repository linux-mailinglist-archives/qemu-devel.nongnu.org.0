Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B383A2FD597
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:27:04 +0100 (CET)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GJz-0007vx-Pl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2GG9-0005AW-Px
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:23:07 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2GG7-0005Bw-Q8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:23:05 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJEAV-1lIPX72rMp-00Kdw5; Wed, 20 Jan 2021 17:22:58 +0100
Subject: Re: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210119175427.2050737-1-laurent@vivier.eu>
 <20210119175427.2050737-4-laurent@vivier.eu>
 <58abf222-2bcb-4433-7608-ebcc999a2241@amsat.org>
 <c2a2537c-b042-9065-dac6-749815f66ba4@vivier.eu>
 <02481ce6-7fc0-c40d-1b31-0260ee3a323e@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <96635a5c-6442-52e6-1fc5-ad241a130c8b@vivier.eu>
Date: Wed, 20 Jan 2021 17:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <02481ce6-7fc0-c40d-1b31-0260ee3a323e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4AvY4ryXWC+pLmOBBY8m7DfVLmQC85o1muDfHTGfC5GMvr6H2fK
 AP+HgJGjzvH7NI/zO+o+CfW3CHI/b3seno6c5L0JlwBKlVV732o/CijdiBuKTP7n1edM38N
 vEckADHZxOZ1zUH69bhjudoGbVUnIWKXmCjUMO6Qd6tzcjWZFE8LzhrrCOql9IDf1itk5N3
 D+cMMvbDX3JqDZCqzDoKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Efuxecr9G4=:BXTJGc58Wuv192dF91fN/W
 s5MZsNdJCUFc1hykIHLDO1RCyrE2cbH27nJKaBhD/Za6752tc2hcZKTRCR7qF4zgH06i5jywK
 8Kj4mbwmM8S2aKaxge7aAY/8BTgPLmHUQHU0Y6JJZ+y2Gy4q6AHVV9vU0rPkxQHvNXLUlQGee
 irs3juBpm08lRAQiI4hgKUKh7k3LSn/LQuMhv5EQ3mSuSA+5NwTJsdy2d8aSOnfcX9HMCP45f
 l9BiF7JL4YGERXKSU7VfcxAbfpKJwR5dg9xkMId68WOiEG5O9eP2+ViWyus+o1LD+m/HkY3wa
 LRl7usobkEOnO16HD1NTRUdHSegyMLwwsiAmm0RsQf1/F5u56yc6A88/gdWRKHW4qQX+7UYe8
 waycU1aY+PXrb+bKTyiDKHHW1qneRCUvhPKLN4P2VK00FIO26ZKQJWNFB8o0GQO9Evt+70mUs
 TGYrGKEhbw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/01/2021 à 17:12, Philippe Mathieu-Daudé a écrit :
> On 1/20/21 5:00 PM, Laurent Vivier wrote:
>> Le 20/01/2021 à 13:16, Philippe Mathieu-Daudé a écrit :
>>> On 1/19/21 6:54 PM, Laurent Vivier wrote:
>>>> From: Shu-Chun Weng <scw@google.com>
>>>>
>>>> IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.
>>>>
>>>> Signed-off-by: Shu-Chun Weng <scw@google.com>
>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>> Message-Id: <20201218193213.3566856-4-scw@google.com>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>>  linux-user/syscall.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>> index 969db2008104..70c61d15ebf8 100644
>>>> --- a/linux-user/syscall.c
>>>> +++ b/linux-user/syscall.c
>>>> @@ -51,6 +51,7 @@
>>>>  #include <sys/sysinfo.h>
>>>>  #include <sys/signalfd.h>
>>>>  //#include <sys/user.h>
>>>> +#include <netinet/in.h>
>>>>  #include <netinet/ip.h>
>>>>  #include <netinet/tcp.h>
>>>>  #include <netinet/udp.h>
>>>> @@ -2272,6 +2273,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>>>>          case IPV6_RECVDSTOPTS:
>>>>          case IPV6_2292DSTOPTS:
>>>>          case IPV6_TCLASS:
>>>> +        case IPV6_ADDR_PREFERENCES:
>>>>  #ifdef IPV6_RECVPATHMTU
>>>>          case IPV6_RECVPATHMTU:
>>>>  #endif
>>>> @@ -2926,6 +2928,7 @@ get_timeout:
>>>>          case IPV6_RECVDSTOPTS:
>>>>          case IPV6_2292DSTOPTS:
>>>>          case IPV6_TCLASS:
>>>> +        case IPV6_ADDR_PREFERENCES:
>>>>  #ifdef IPV6_RECVPATHMTU
>>>>          case IPV6_RECVPATHMTU:
>>>>  #endif
>>>>
>>>
>>> Building on Centos7:
>>>
>>> ../linux-user/syscall.c: In function 'do_setsockopt':
>>> ../linux-user/syscall.c:2276:14: error: 'IPV6_ADDR_PREFERENCES'
>>> undeclared (first use in this function)
>>>          case IPV6_ADDR_PREFERENCES:
>>>               ^
>>> ../linux-user/syscall.c:2276:14: note: each undeclared identifier is
>>> reported only once for each function it appears in
>>> ../linux-user/syscall.c: In function 'do_getsockopt':
>>> ../linux-user/syscall.c:2931:14: error: 'IPV6_ADDR_PREFERENCES'
>>> undeclared (first use in this function)
>>>          case IPV6_ADDR_PREFERENCES:
>>>               ^
>>>
>>
>> Strange... this is defined since kernel v2.6.26 in /usr/include/linux/in6.h
>>
>> 7cbca67c0732 [IPV6]: Support Source Address Selection API (RFC5014).
>>
>> Could try adding the include?
> 
> Yes, this fixed it, thanks:
> 
> -- >8 --
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1f91aa0ed5e..34760779c8e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -59,6 +59,7 @@
>  #include <linux/icmp.h>
>  #include <linux/icmpv6.h>
>  #include <linux/if_tun.h>
> +#include <linux/in6.h>
>  #include <linux/errqueue.h>
>  #include <linux/random.h>
>  #ifdef CONFIG_TIMERFD
> ---
> 

Could you send a patch to the ML?

Thanks,
Laurent

