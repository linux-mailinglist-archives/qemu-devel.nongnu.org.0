Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88B38C913
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:20:32 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk60s-0000ku-58
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk5zQ-0008KJ-3H; Fri, 21 May 2021 10:19:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk5zO-0003CV-2y; Fri, 21 May 2021 10:18:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id b7so10636784wmh.5;
 Fri, 21 May 2021 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qBE1vxre3jYJiNov21DSebxkYu9szsjnQiy5QjABJT4=;
 b=qteOA93L6bbpDuUL2+dpOwtJYcEDIh0efXJiIBeX0YvJ6xVbK1hn8KWbI+gCgfhKd/
 4edXjQXSaqVX+DQoDv2maYXxp12ytkeWtSOrED5JoVHNmWRhc+1SIyl/wx70cTD/FGte
 ZJPmn5KMWxEgMSQxmdUyhlqIK5DXop50+1/ss3LnGaTylpmDu+bfhjJ3imuqM6PTZmLK
 zNzXf9mJA1kC1JW7nppxHlUNZy0eJTDRlexvDVvWwQqgH0nzyOn+NAduTnqxxuFE5WDp
 BjQa0N+ucB39e1kLKCuppWJfZ9+BxvnaKebnNb+1AHOPk9ScVNdN+5Xtzbd2LK9Zkx7I
 omLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qBE1vxre3jYJiNov21DSebxkYu9szsjnQiy5QjABJT4=;
 b=Hn5XIM9lB10H6xsXEIV4cqfDsVhUqI/gZt6kR86X1F58t8a6X9Dj6S9rkjDRyMr0Gq
 UQvPdPRwBHF0CIQibjJx07JDrMigvrIe+U87X16FT7MLZuUwCVZcYsNbUhvJjUaA7yPu
 77l4B4nRK3H9cCmfOjgM022g23/Nhtp9T8llGCw5/+oHyaSUs+qpLcDylJ02ZuOMlWtr
 YaPH1a3zrsitk741mVy1syj8rcd91228ZK3ut8DN1KiS2R474dZzy37z1wku9MWR9NH+
 XWsfDT11Q+mDlIj2FlPSO8IuxFfl9iig/BiNJZ9vgWAW0+g0br5FbmTW2eUsMfcbrt2N
 ctSA==
X-Gm-Message-State: AOAM532G4tNzdI5ODSdPb2hTC6aS+c15N6tnq1SZdhGeii7v5W+dygpO
 ujjHshNGmDRofD24S58tYZk=
X-Google-Smtp-Source: ABdhPJwOI1OOX5PK/xtsmjYPNnhCxP8fCCf8eeXnB44dRS/KGN6bzHtNd4qUrAXl/lXEkguToKxRZA==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr1628996wmq.107.1621606736132; 
 Fri, 21 May 2021 07:18:56 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z5sm2356516wrn.69.2021.05.21.07.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 07:18:54 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
Date: Fri, 21 May 2021 16:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg2gb5lf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 3:03 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>> On 5/21/21 2:28 PM, Willian Rampazzo wrote:
>>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 20/05/2021 22.28, Philippe Mathieu-Daudé wrote:
>>>>> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>>>>>> Conceptually speaking, acceptance tests "are a series of specific tests
>>>>>> conducted by the customer in an attempt to uncover product errors before
>>>>>> accepting the software from the developer. Conducted by the end-user rather
>>>>>> than software engineers, acceptance testing can range from an informal
>>>>>> “test drive” to a planned and systematically executed series of scripted
>>>>>> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
>>>>>> also refers to user's agreement in the final state of an implemented feature.
>>>>>> Today, QEMU is not implementing user acceptance tests as described by Pressman.
>>>>>>
>>>>>> There are other three possible terms we could use to describe what is currently
>>>>>> QEMU "acceptance" tests:
>>>>>>
>>>>>>    1 - Integration tests:
>>>>>>        - "Integration testing is a systematic technique for constructing the
>>>>>>           software architecture while at the same time conducting tests to
>>>>>>           uncover errors associated with interfacing. The objective is to take
>>>>>>           unit-tested components and build a program structure that has been
>>>>>>           dictated by design." [2]
>>>>>>        * Note: Sommerville does not have a clear definition of integration
>>>>>>          testing. He refers to incremental integration of components inside
>>>>>>          the system testing (see [3]).
>>>>
>>>> After thinking about this for a while, I agree with you that renaming the
>>>> "acceptance" tests to "integration" tests is also not a good idea. When I
>>>> hear "integration" test in the context of the virt stack, I'd rather expect
>>>> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
>>>> virt-manager on top and tests them all together. So we should look for a
>>>> different name indeed.
>>>>
>>>>>>    2 - Validation tests:
>>>>>>        - "Validation testing begins at the culmination of integration testing,
>>>>>>           when individual components have been exercised, the software is
>>>>>>           completely assembled as a package, and interfacing errors have been
>>>>>>           uncovered and corrected. At the validation or system level, the
>>>>>>           distinction between different software categories disappears. Testing
>>>>>>           focuses on user-visible actions and user-recognizable output from the
>>>>>>           system." [4]
>>>>>>        - "where you expect the system to perform correctly using a set of test
>>>>>>           cases that reflect the system’s expected use." [5]
>>>>>>        * Note: the definition of "validation testing" from Sommerville reflects
>>>>>>          the same definition found around the Internet, as one of the processes
>>>>>>          inside the "Verification & Validation (V&V)." In this concept,
>>>>>>          validation testing is a high-level definition that covers unit testing,
>>>>>>          functional testing, integration testing, system testing, and acceptance
>>>>>>          testing.
>>>>>>
>>>>>>    3 - System tests:
>>>>>>        - "verifies that all elements mesh properly and that overall system
>>>>>>           function and performance is achieved." [6]
>>>>>>        - "involves integrating components to create a version of the system and
>>>>>>           then testing the integrated system. System testing checks that
>>>>>>           components are compatible, interact correctly, and transfer the right
>>>>>>           data at the right time across their interfaces." [7]
>>>>>>
>>>>>> The tests implemented inside the QEMU "acceptance" directory depend on the
>>>>>> software completely assembled and, sometimes, on other elements, like operating
>>>>>> system images. In this case, the proposal here is to rename the current
>>>>>> "acceptance" directory to "system."
>>>>>
>>>>> Are user-mode tests using Avocado also system tests?
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>>>>
>>>> We've indeed got the problem that the word "system" is a little bit
>>>> overloaded in the context of QEMU. We often talk about "system" when
>>>> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-user
>>>> emulator binaries). For example, the "--disable-system" switch of the
>>>> configure script, or the "build-system" and "check-system" jobs in the
>>>> .gitlab-ci.yml file ... thus this could get quite confusing in the
>>>> .gitlab-ci.yml file afterwards.
>>>
>>> I agree with you here. After I made the changes to the code, I noticed
>>> QEMU has the "system" word spread all over the place. That may confuse
>>> people looking at the "system tests" without much interaction with
>>> software testing terminology.
>>>
>>>>
>>>> So I think renaming "acceptance" to "system" is especially ok if we only
>>>> keep the "softmmu"-related tests in that folder... would it maybe make sense
>>>> to add the linux-user related tests in a separate folder called tests/user/
>>>> instead, Philippe? And we should likely rename the current build-system and
>>>> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or so?
>>>>
>>>
>>> As I mentioned in Philippe's reply, those tests are still considered
>>> system tests because system testing is the software built and
>>> interacting with external test artifacts in software engineering.
>>>
>>>> Alternatively, what about renaming the "acceptance" tests to "validation"
>>>> instead? That word does not have a duplicated definition in the context of
>>>> QEMU yet, so I think it would be less confusing.
>>>
>>> While at the beginning of your reply, I started thinking if
>>> "validation" would cause less confusion for the QEMU project. Although
>>> validation testing is a broader concept inside the Verification &
>>> Validation process, encompassing unit testing, functional testing,
>>> integration testing, system testing, and acceptance testing, it may be
>>> an option for the QEMU project.
>>>
>>> While system testing would be the correct terminology to use, if it
>>> causes more confusion, using a less strict terminology, like
>>> validation testing, is valid, in my opinion.
>>
>> This works for me:
>>
>> - tests/system/softmmu
>> - tests/system/user
>>
>> Or validation, as you prefer.
> 
> So what are tests/tcg if not user tests? They *mostly* test
> linux-user emulation but of course we have softmmu tests in there as
> well. 

I expect a tests/tcg/ to check a specific TCG feature, which doesn't
have to be user-mode specific (IIRC Xtensa does some sysemu checks).
Also, you control the compiler toolchain, flags, etc... so you can
adapt for a specific feature bit to test, use kludges and so on.

I expect tests in tests/system/ (user/softmmu) to user real-world
binaries, which we aren't modifying. Sometime non-public/released
compiler toolchain has been used.

See for example the test referred tests the bFLT loader (beside
testing userland Linux binary for Cortex-M).

Another example is the Sony PlayStation2 binary testing the
O32 ABI and multiple opcodes from the TX79 SIMD core:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782493.html

Personally I'm not interested in writing a test for a loader or
multiple opcodes when we have pre-built binaries. For the opcodes
coverage I'd use a TCG plugin to confirm the opcodes have been
used.

If you think these tests belong to tests/tcg/, I am OK to put
them they, but I don't think adding the Avocado buildsys
machinery to the already-complex tests/tcg/ Makefiles is going
to help us...

Regards,

Phil.

