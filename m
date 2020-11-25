Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC092C466B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 18:06:44 +0100 (CET)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khyFg-0008G4-0P
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 12:06:44 -0500
Received: from [2001:470:142:3::10] (port=41128 helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khyDB-0005gr-OM
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 12:04:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:55140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khyD7-0005l1-Ft
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 12:04:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D93DEAC22;
 Wed, 25 Nov 2020 17:04:03 +0000 (UTC)
Subject: Re: help with a build-user and build-user-plugin failure
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
 <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org> <871rghixhb.fsf@linaro.org>
 <6efbff12-a10b-8e55-908b-f2233fc8001e@suse.de> <87sg8xgyj7.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ff24dee6-a7c5-af88-0b84-e6a978a7f210@suse.de>
Date: Wed, 25 Nov 2020 18:04:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87sg8xgyj7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 6:02 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi Alex,
>>
>> On 11/25/20 10:42 AM, Alex Bennée wrote:
>>>
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> On 11/24/20 12:04 PM, Claudio Fontana wrote:
>>>>> Hi Alex,
>>>>>
>>>>> I am seeing build failures with build-user and build-user-plugin:
>>>>>
>>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/220245998
>>>>>
>>>>> and I am trying to start investigating.
>>>>>
>>>>> How do I reproduce this locally?
>>>>>
>>>>> I am trying to run locally the check-tcg rule, but I cannot get it to work.
>>>>> I managed to work around the problem of static libraries (disabled them),
>>>>>
>>>>> but then I get:
>>>>>
>>>>>   BUILD   TCG tests for x86_64-linux-user
>>>>>   BUILD   x86_64-linux-user guest-tests with cc
>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /tmp/ccgqtAM9.o: in function `test_fops':
>>>>> /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:759: undefined reference to `fmod'
>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:760: undefined reference to `sqrt'
>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:761: undefined reference to `sin'
>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:762: undefined reference to `cos'
>>>>>
>>>>> Have you seen it before?
>>>>> Any suggestions? I'm on OpenSUSE Leap 15 SP2.
>>>>
>>>> Related to 3fc1aad3864 ("configure: remove unnecessary libm test")
>>>> + tcg tests still not ported to Meson?
>>>
>>> Hmm so we certainly need libm for the testcase but I guess this is> failing with a local cross compiler rather than docker? I'm not sure the
>>> global feature test should be relevant for testcases.
>>>
>>
>> Probably it's my attempt to make it work with non-static libm that failed then,
>>
>> is it supposed to work?
>>
>> I see mention of BUILD_STATIC there, but it does not seem to actually work for me.
>>
>> If I use static libm, then it works.
>> If I uninstall static libm, any attempt to build fails, regardless of
>> whether I pass BUILD_STATIC='n' or so.
> 
> All the test cases themselves should be built as static although I see
> we fall back for the case of using a local cross compiler. That normally
> only covers the case where the host compiler can also build for 32 bit
> for testcases.
> 
>>
>> Ciao and thanks,
>>
>> CLaudio
> 
> 

Ok, so static build required then, np!

Thanks,

Claudio

