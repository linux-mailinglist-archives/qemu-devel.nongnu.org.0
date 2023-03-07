Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C26AE0B9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXVk-0001cU-12; Tue, 07 Mar 2023 08:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZXVg-0001QO-4Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:37:44 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZXVe-0005YR-GM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:37:43 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MbTCr-1qAnCN1J5F-00bsW4; Tue, 07 Mar 2023 14:37:30 +0100
Message-ID: <baa0d31c-ffba-c619-e90a-9e4596342be0@vivier.eu>
Date: Tue, 7 Mar 2023 14:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
Content-Language: fr
To: Mathis MARION <mamarion1@silabs.com>,
 Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-3-Mathis.Marion@silabs.com>
 <008ca1be-e4ca-1588-fe85-6be807b48b0b@vivier.eu>
 <5af1e768-820a-68d4-5d98-e4b6fbcc7d90@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5af1e768-820a-68d4-5d98-e4b6fbcc7d90@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Oaah1JBEwKPOD7Y6RitDOZAYWDOKI7Hcfz2nJp5zn93dElZHUqq
 vbC1iCFBFfFAkQEzgOw2pKxURXdW+mU92kJvgxnWlKT0wEnuEyeg4oGXl+tFpVkOyScbGUR
 GGcR+QimS5BHYPya9yJ4uZW/7MupG47psvKewzSJ3COKLAjrYDz4kRiBCaEmjEhdTWTbo88
 SqQuOK7YyTcQZZ/ssTy5g==
UI-OutboundReport: notjunk:1;M01:P0:9SlWUgPhiTY=;Iu6BN10WB437OIUQXtr98pcSrM5
 oxgD5nAhHxwsgXiBgdN/54tPyY6z10sn/b5XTGFRJbJLZyB4Ton/HDDnLijU6TX4WPSeEn5kT
 d8MRW2YSIChmJgbxirjKkCMgoHLEKzdpjGajLg/vB42S+kBIqTSXasppfvIkIN4pGWKj5J+jN
 yxD3mXPtxl22vhowKZyzM5p221Beryw+UKgduH2OiJdz3XNvE5Rr6aol198Y5qilnK60Wi/DI
 PuAyMiXRiJ5Yf+4v1ZSkS7Eekv04+SNiUapElVoe1jbcc8BBftLRcHVZ6rljZYmUQAJKFVZmE
 cckJfPUNAGZ27X4Y9GTRfYPEPY4MJI1nPbDlXh9YtAZsUcMeUMRSeR2byWc7sBi2pahCA2A0F
 0BC7p/9utVegLN4pX5NliyBxrIY/X6qS00hIeM141IIuaSY24ipFOq7kO3Iv/3zErl0qZdzbL
 LJBW6MT5gPptZaco6+FxAh+OyPOjDBacuBRg/jZegJGxer2ZgoZPgo1mg72M7vTK4RQVthpRE
 AInqIVQC3J4r/hDVhwMuiTYTo0i1vusc7I3QAepPiTOyJxV3E5UgOHUiLLc21ZaPV1HNBKkXf
 /5bXla32jvr7N0Gq40p5XuJJFvu8SsxOqz5wdrZjwDNMiY6ih6yDDtJappdYhSQ1b84TcM1oL
 qsQKap74gp+SPwaoxfE9icfOQhRJEu5KexiJBZhCMQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Le 07/03/2023 à 12:27, Mathis MARION a écrit :
> 
> 
> On 06/03/2023 22:52, Laurent Vivier wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open 
>> attachments unless you recognize the sender and know the content is safe.
>>
>>
>> Le 20/02/2023 à 09:58, Mathis Marion a écrit :
>>> From: Mathis Marion <mathis.marion@silabs.com>
>>>
>>> Fields sin6_flowinfo and sin6_scope_id use the host byte order, so there
>>> is a conversion to be made when host and target endianness differ.
>>>
>>> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
>>> ---
>>>   linux-user/syscall.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 58549de125..1a6856abec 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -1713,6 +1713,12 @@ static inline abi_long target_to_host_sockaddr(int fd, struct sockaddr *addr,
>>>       lladdr = (struct target_sockaddr_ll *)addr;
>>>       lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
>>>       lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
>>> +    } else if (sa_family == AF_INET6) {
>>> +        struct sockaddr_in6 *in6addr;
>>> +
>>> +        in6addr = (struct sockaddr_in6 *)addr;
>>> +        in6addr->sin6_flowinfo = tswap32(in6addr->sin6_flowinfo);
>>
>> In /usr/include/linux/in6.h, it's defined as a __be32, so I don't think we need to change its
>> endianness.
>>
> 
> Right.
> Thank you for integrating the other patches! Before I send a v3, do you
> have any comments on patch 4?
> 

Yes, use *_MASK rather than ~*_NESTED. It looks cleaner. I prefer to ignore flags rather than return 
an error, so on architectures with same endiannes/wordsize it generally works.

Thanks,
Laurent


