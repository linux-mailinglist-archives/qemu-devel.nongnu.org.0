Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62843AFF2F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:23:46 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbhB-00010Y-RA
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvbfx-0000GH-A9
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvbfv-0004yj-4q
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624350146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rgsSFtzBDG0oSGhhCWW0PBefydcRo5S7AiE0b6UV9I=;
 b=NVt/C0k6nOyp4boYqI6Xj0YQnzr+JDLZefNsfvCQMDN7X0NmZ7PC4Uk6tmakZuzvc/VGxv
 EF0C9bDad3hdkZezv9fu4BT/Pd7Cn0OeE/9d78HfCG/Vf24zYRO/oxNqBoG99icUmpJOr6
 urlS6N1guFpShNhBsYOznhZ0XTeUI0Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-ibDbJxy4Nqmg1Nz4DyvKqg-1; Tue, 22 Jun 2021 04:22:23 -0400
X-MC-Unique: ibDbJxy4Nqmg1Nz4DyvKqg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u16-20020a5d51500000b029011a6a17cf62so9054423wrt.13
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rgsSFtzBDG0oSGhhCWW0PBefydcRo5S7AiE0b6UV9I=;
 b=F3KoHllDv1XYmd+e41/1gFoqRYlClTrg+WgFGIpJrV5n+8YdDeX5mueqJVQiJ0an5i
 okjHKtnrlA7tR6ZoG+yO0Ia06shOodhwOt+mvQETpJtP4iXG3Krayu/z4n9piDYkETb3
 PWOa+GIK74NG8IsjENYkv4nV4X7DH+PISlTxV/6hMtAVFgAkRrzKfmxfSBpgOrlpfecu
 jD2K4H7RL4pepBdnxGU/4D0ZAm3vkFANoK5Yer7uXLAzhRDs2si35AoNs8M+njEQ42im
 6yz03nZUv2sUljnQQT/6H/wjQ3KiW5gNkiaeX99d2uZFLOoTlE0lZUjokp0RQ0EuzfZy
 zTRA==
X-Gm-Message-State: AOAM5328FTZ0KAn6EmM7slQ5Qs6AKcZDou1onJGjMTO17xjdYD1ieAFb
 5YA8JAx4KqkKo8uM/E892K/XJ8MrWqXl/XQk7rsDO+TkMGrI/xYCheTogaw2Z3VFU3m9t0mtVSB
 NM2HWi1vCoB4jRSksj7ZE5ssl2XKw6boLTnwpaVbJaeORxyJD6GmG7tQSfdqPMmko
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr2918783wmk.135.1624350141810; 
 Tue, 22 Jun 2021 01:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyE8Aeso6oDdlBH9DSnmPk5HLTlrrgXLk3bsHmMLpISACq6fRingyJhXPS0U/x3Nu3L7ENhw==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr2918762wmk.135.1624350141575; 
 Tue, 22 Jun 2021 01:22:21 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b11sm20793718wrf.43.2021.06.22.01.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 01:22:21 -0700 (PDT)
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <d10ba45f-c71c-f472-fac7-9f8e5770c735@suse.de>
 <20210618132647.07cf2008@redhat.com>
 <2f7ae379-92e0-3274-6944-84a5bce6e82e@suse.de>
 <20210618152943.2009ad82@redhat.com> <874kdqtj25.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ca74cc39-6e30-6588-aa5a-48f74d305b56@redhat.com>
Date: Tue, 22 Jun 2021 10:22:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <874kdqtj25.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 10:07 AM, Alex Bennée wrote:
> Igor Mammedov <imammedo@redhat.com> writes:
>> On Fri, 18 Jun 2021 14:43:46 +0200
>> Claudio Fontana <cfontana@suse.de> wrote:
>>> On 6/18/21 1:26 PM, Igor Mammedov wrote:
>>>> On Thu, 17 Jun 2021 18:49:17 +0200
>>>> Claudio Fontana <cfontana@suse.de> wrote:
>>>>> On 6/16/21 5:24 PM, Igor Mammedov wrote:  
>>>>>>
>>>>>> Sometimes it's necessary to execute a test that depends on KVM,
>>>>>> however qtest is not aware if tested QEMU binary supports KVM
>>>>>> on the host it the test is executed.    
>>>>>
>>>>> Hello,
>>>>>
>>>>> It seems to me that we are constantly re-implementing the same feature with slight variations?
>>>>>
>>>>> Didn't we have a generic series to introduce qtest_has_accel() from Philippe before?  
>>>> It's mentioned in cover letter (PS: part) and in [1/3] with rationale
>>>> why this was posted.  
>>>
>>> Thought it was separate, but now I see that it uses query-accel underneath.
>>>
>>> Seems strange to add another check to do the same thing, it may point to qtest_has_accel() needing some update?
>>> You mention it is time consuming to use qtest_has_accel(), have you measured an important overhead?
>>> With qtest_has_accel() not even being committed yet, is it already necessary to work around it because it's too slow? 
>>
>> Tests are already take a lot of time as is, so I'd try to avoid slowing
>> them down.
>>
>> proposed qtest_has_accel() requires spawning QEMU to probe, which is slow.
>> Worst case would be:
>>  = qemu startup time * number of checks * number of targets
>>
>> It's fine to run occasionally, I can take a coffee break while tests run.
>> But put it in context of CI and it multiplies by the number of push requests
>> and starts to eat not only time but also limited CI resources.
>>
>> In current form qtest_has_accel() is only marginally better functionality
>> wise, as it reports all built in accelerators while qtest_has_kvm() accounts
>> only for KVM.
>>
>> qtest_has_kvm() is collecting info about built-in accelerators at
>> configure/build time and that probably could be extended to other
>> accelerators (not a thing that I'm interested in at the moment).
>> So it could be extended to support the same accelerators
>> as currently proposed qtest_has_accel().
> 
> One minor downside is this forever ties the tests to the build. I have
> spoken with people before about the idea of separating the test
> artefacts from the build so they can be used either as a) cached test
> objects or b) other testing environments, for example verifying the
> kernel has not regressed. However we don't do either of those things at
> the moment so it's not a major concern.

This is the feature that is interesting RedHat QE too, run the latest
qtests on various released binaries to compare performances between
releases.

> If the worry is about extending test times by having an extra round trip
> of a spawn and query step for every test could we not consider caching
> the information somewhere? Really any given binary should only need to
> be queried once per run, not per test.

Good idea.

>> Given a less expensive approach exists, the qtest_has_accel()
>> in its current form might be not justifiable. 
>>
>>    
>>>>> Does this series work with --disable-kvm builds? (TCG-only builds?)  
>>>> I'll test. But on the first glance it should work without issues.
>>>> (i.e. kvm only tests will be skipped).
>>>>   
>>>>>
>>>>> Thanks,
>>>>>
>>>>> CLaudio
>>>>>
>>>>>  
>>>>>>
>>>>>> For an example:
>>>>>>  test q35 machine with intel_iommu
>>>>>>  This test will run only is KVM is available and fail
>>>>>>  to start QEMU if it fallsback to TCG, thus failing whole test.
>>>>>>  So if test is executed in VM where nested KVM is not enabled
>>>>>>  or on other than x86 host, it will break 'make check-qtest'
>>>>>>
>>>>>> Series adds a lightweight qtest_has_kvm() check, which abuses
>>>>>> build system and should help to avoid running KVM only tests
>>>>>> on hosts that do not support it.
>>>>>>
>>>>>> PS:
>>>>>> there is an alternative 'query-accels' QMP command proposal
>>>>>> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
>>>>>> which I think is more robust compared to qtest_has_kvm() and
>>>>>> could be extended to take into account machine type.
>>>>>> But it's more complex and what I dislike about it most,
>>>>>> it requires execution of 'probing' QEMU instance to find
>>>>>> execute 'query-accels' QMP command, which is rather resource
>>>>>> consuming. So I'd use query-accels approach only when it's
>>>>>> the only possible option to minimize load on CI systems.
>>>>>>
>>>>>> Igor Mammedov (2):
>>>>>>   tests: acpi: q35: test for x2APIC entries in SRAT
>>>>>>   tests: acpi: update expected tables blobs
>>>>>>
>>>>>> root (1):
>>>>>>   tests: qtest: add qtest_has_kvm() to check if tested bynary supports
>>>>>>     KVM
>>>>>>
>>>>>>  tests/qtest/libqos/libqtest.h    |   7 +++++++
>>>>>>  meson.build                      |   1 +
>>>>>>  tests/data/acpi/q35/APIC.numamem | Bin 0 -> 2686 bytes
>>>>>>  tests/data/acpi/q35/DSDT.numamem | Bin 7865 -> 35222 bytes
>>>>>>  tests/data/acpi/q35/FACP.numamem | Bin 0 -> 244 bytes
>>>>>>  tests/data/acpi/q35/SRAT.numamem | Bin 224 -> 5080 bytes
>>>>>>  tests/qtest/bios-tables-test.c   |  10 +++++++---
>>>>>>  tests/qtest/libqtest.c           |  20 ++++++++++++++++++++
>>>>>>  8 files changed, 35 insertions(+), 3 deletions(-)
>>>>>>  create mode 100644 tests/data/acpi/q35/APIC.numamem
>>>>>>  create mode 100644 tests/data/acpi/q35/FACP.numamem
>>>>>>     
>>>>>  
>>>>   
>>>
> 
> 


