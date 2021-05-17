Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC79382422
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:19:18 +0200 (CEST)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liWaz-0007mu-0A
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1liWZT-0006kM-00
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:17:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:56146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1liWZQ-0001b3-LP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:17:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2E7EB1B6;
 Mon, 17 May 2021 06:17:37 +0000 (UTC)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de> <87o8dpo4ww.fsf@linaro.org>
 <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
 <20210505193141.4tb6k5cupbovctbs@habkost.net>
 <a6049846-2edf-c22f-0b7b-5a9f087223ab@suse.de>
 <a6f5e405-039a-a055-ffec-dd9e65bf209e@redhat.com>
 <19a1ed59-af39-3c20-2156-6bf4b3026973@redhat.com>
 <d3fea8e3-57a8-b50e-c072-9718f8d0967d@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f6784ff8-71e7-f2b8-61b0-caf007f6ce1b@suse.de>
Date: Mon, 17 May 2021 08:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d3fea8e3-57a8-b50e-c072-9718f8d0967d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:17 AM, Philippe Mathieu-Daudé wrote:
> On 5/6/21 11:33 AM, Philippe Mathieu-Daudé wrote:
>> On 5/6/21 11:10 AM, Philippe Mathieu-Daudé wrote:
>>> On 5/6/21 9:55 AM, Claudio Fontana wrote:
>>>> On 5/5/21 9:31 PM, Eduardo Habkost wrote:
>>>>> On Wed, May 05, 2021 at 02:15:29PM +0200, Philippe Mathieu-Daudé wrote:
>>>>>> On 5/5/21 12:04 PM, Alex Bennée wrote:
>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>> On 3/8/21 3:02 PM, Alex Bennée wrote:
>>>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> anything else for me to do here?
>>>>>>>>>
>>>>>>>>> It looks to me that this series is looking pretty good. Every patch has
>>>>>>>>> at least one review so I think it's just waiting on the maintainers to
>>>>>>>>> pick it up.
>>>>>>>>>
>>>>>>>>> Paolo/Richard - are you intending to take the series as is or are you
>>>>>>>>> waiting for something else? I'd like to see the patch delta reduced for
>>>>>>>>> the ARM cleanup work which is still ongoing.
>>>>>>>>
>>>>>>>> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
>>>>>>>> Rebasing is starting to become more and more draining;
>>>>>>>
>>>>>>> This is still the latest re-factor right?
>>>>>>>
>>>>>>>   Subject: [PATCH v28 00/23] i386 cleanup PART 2
>>>>>>>   Date: Mon, 22 Mar 2021 14:27:36 +0100
>>>>>>>   Message-Id: <20210322132800.7470-1-cfontana@suse.de>
>>>>>>>
>>>>>>>> I am seeing some changes from Phil that redo some of the patches here (like target arch user),
>>>>>>>> maybe you would like to drive this?
>>>>>>>
>>>>>>> AIUI his changes where to get qtest passing.
>>>>>>
>>>>>> I hadn't read Claudio's mail, I think he's mentioning commit 46369b50ee3
>>>>>>
>>>>>>     meson: Introduce meson_user_arch source set for arch-specific user-mode
>>>>>>
>>>>>>     Similarly to the 'target_softmmu_arch' source set which allows
>>>>>>     to restrict target-specific sources to system emulation, add
>>>>>>     the equivalent 'target_user_arch' set for user emulation.
>>>>>>
>>>>>> The patch only contains 6 lines in 2 hunks, if it introduced a conflict
>>>>>> it should be trivial to resolve (I wasn't expecting it to conflict with
>>>>>> your work when I merged it TBH).
>>>
>>>> I'd suggest to move the discussions about the ARM series to the arm series thread.
>>>>
>>>> I am concerned here about the groundwork and x86 part.
>>>
>>> OK sorry, I was explaining the IRC chat.
>>>
>>> Is there any issue rebasing the groundwork on top of commit 46369b50ee3?
>>>
>>> Maybe my qtest/accel series is irrelevant to your x86 part, TBH I don't
>>> remember.
>>
>> So far I could rebase this series on top of commit 229a834518b
>> (Mon Mar 8 15:45:48 2021).
> 
> Pfff I realized late you asked on the v26 series, but v28 is
> available... Let's try again.

Hi Philippe,

I think that Paolo picked it up in the end?

Thanks,

Claudio

> 
>> First trivial conflict with 2cc1a90166b ("Remove deprecated
>> target tilegx"), removing target/tilegx/meson.build resolves it.
>>
>> Then apparently commit b8184135835 ("target/i386: allow modifying
>> TCG phys-addr-bits") which is not trivial (to me).
>>
>> Finally "meson: add target_user_arch" indeed clashes with commit
>> 46369b50ee3 ("meson: Introduce meson_user_arch source set for
>> arch-specific user-mode"). I am sorry I didn't notice your patch,
>> but am glad we both sent a similar patch :) Mine allows optional
>> sourceset, so you can simplify your patch, only keeping the x86
>> part:
>>
>> -- >8 --
>> diff --git a/target/i386/meson.build b/target/i386/meson.build
>> index fd24479590..cac26a4581 100644
>> --- a/target/i386/meson.build
>> +++ b/target/i386/meson.build
>> @@ -19,6 +19,7 @@ i386_softmmu_ss.add(files(
>>    'machine.c',
>>    'monitor.c',
>>  ))
>> +i386_user_ss = ss.source_set()
>>
>>  subdir('kvm')
>>  subdir('hax')
>> @@ -28,3 +29,4 @@ subdir('tcg')
>>
>>  target_arch += {'i386': i386_ss}
>>  target_softmmu_arch += {'i386': i386_softmmu_ss}
>> +target_user_arch += {'i386': i386_user_ss}
>> ---
>>
>> Regards,
>>
>> Phil.
>>
> 
> 


