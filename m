Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9365411A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 13:34:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Kkk-0007qt-09; Thu, 22 Dec 2022 07:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1p8Kke-0007qk-JT
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 07:32:44 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1p8KkZ-0000ra-8l
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 07:32:44 -0500
Received: from [134.155.36.187] (dhcp187.bib.uni-mannheim.de [134.155.36.187])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D23B2DA0345;
 Thu, 22 Dec 2022 13:32:32 +0100 (CET)
Message-ID: <557dcec6-7800-b93c-708e-e06793cb9e38@weilnetz.de>
Date: Thu, 22 Dec 2022 13:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 eric.auger@redhat.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
 <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
 <Y6Q636fbFWDnF0w7@redhat.com>
 <a8f5caa6-e0b4-25fb-4eab-ff33dc45fbef@redhat.com>
 <d0cefb94-4442-3277-51c2-6a615c766129@linaro.org>
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
In-Reply-To: <d0cefb94-4442-3277-51c2-6a615c766129@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 22.12.22 um 12:51 schrieb Philippe Mathieu-Daudé:

> On 22/12/22 12:18, Eric Auger wrote:
>> Hi All,
>>
>> On 12/22/22 12:09, Daniel P. Berrangé wrote:
>>> On Thu, Dec 22, 2022 at 11:07:31AM +0100, Eric Auger wrote:
>>>> Hi Philippe,
>>>>
>>>> On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
>>>>> On 22/12/22 09:18, Paolo Bonzini wrote:
>>>>>> On 12/21/22 17:36, Eric Auger wrote:
>>>>>>> To avoid compilation errors when -Werror=maybe-uninitialized is 
>>>>>>> used,
>>>>>>> replace 'case 3' by 'default'.
>>>>>>>
>>>>>>> Otherwise we get:
>>>>>>>
>>>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>      2495 |     d->Q(3) = r3;
>>>>>>>           |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>      2494 |     d->Q(2) = r2;
>>>>>>>           |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>      2493 |     d->Q(1) = r1;
>>>>>>>           |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>      2492 |     d->Q(0) = r0;
>>>>>>>           |     ~~~~~~~~^~~~
>>>>> With what compiler? Is that a supported one?
>>>> https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/ 
>>>>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>>> ---
>>>>>>>    target/i386/ops_sse.h | 4 ++--
>>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>>>>>>> index 3cbc36a59d..c442c8c10c 100644
>>>>>>> --- a/target/i386/ops_sse.h
>>>>>>> +++ b/target/i386/ops_sse.h
>>>>>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>>>> *s, uint32_t order)
>>>>>>>            r0 = s->Q(0);
>>>>>>>            r1 = s->Q(1);
>>>>>>>            break;
>>>>>>> -    case 3:
>>>>>>> +    default:
>>>>>>>            r0 = s->Q(2);
>>>>>>>            r1 = s->Q(3);
>>>>>>>            break;
>>>>>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>>>> *s, uint32_t order)
>>>>>>>            r2 = s->Q(0);
>>>>>>>            r3 = s->Q(1);
>>>>>>>            break;
>>>>>>> -    case 3:
>>>>>>> +    default:
>>>>>>>            r2 = s->Q(2);
>>>>>>>            r3 = s->Q(3);
>>>>>>>            break;
>>>>>> Queued, but this compiler sucks. :)
>>>>> Can't we simply add a dumb 'default' case? So when reviewing we don't
>>>>> have to evaluate 'default' means 3 here.
>>>>>
>>>>> -- >8 --
>>>>> --- a/target/i386/ops_sse.h
>>>>> +++ b/target/i386/ops_sse.h
>>>>> @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>>>> uint32_t order)
>>>>>           r0 = s->Q(2);
>>>>>           r1 = s->Q(3);
>>>>>           break;
>>>>> +    default:
>>>>> +        qemu_build_not_reached();
>>>>>       }
>>>>>       switch ((order >> 4) & 3) {
>>>>>       case 0:
>>>>> @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>>>> uint32_t order)
>>>>>           r2 = s->Q(2);
>>>>>           r3 = s->Q(3);
>>>>>           break;
>>>>> +    default:
>>>>> +        qemu_build_not_reached();
>>>>>       }
>>>> I guess this won't fix the fact r0, r1, r2, r3 are not initialized, 
>>>> will it?
>>> This ultimately expands to assert() and the compiler should see that it
>>> terminates the control flow at this point, so shouldn't have a reason
>>> to warn.
>>
>> OK so with qemu_build_not_reached(); I get
>>
>> /home/augere/UPSTREAM/qemu/include/qemu/osdep.h:184:35: error: call to
>> ‘qemu_build_not_reached_always’ declared with attribute error: code path
>> is reachable
>>    184 | #define qemu_build_not_reached() 
>> qemu_build_not_reached_always()
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>>
>> However with g_assert_not_reached(), it does not complain and errors are
>> removed. So I will respin with g_assert_not_reached() if nobody advises
>> me against that.
>
> Thank you!


As noted by Paolo a better compiler could know that 0, 1, 2 and 3 are 
the only possible cases. Such a better compiler might complain that an 
additional default case is never reached. Therefore the proposed code 
might cause future compiler warnings.

But we could use this code pattern to make the intention of the code 
clearer:

case 3:
default: /* default case added to help the compiler to avoid warnings */
     ...

Stefan



