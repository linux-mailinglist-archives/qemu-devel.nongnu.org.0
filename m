Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EF37FB4B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:13:30 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDxp-0003eC-RL
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDur-0007Uj-IU; Thu, 13 May 2021 12:10:25 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDuo-00009e-5H; Thu, 13 May 2021 12:10:25 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPGNn-1lqmYG2OKr-00PfQa; Thu, 13 May 2021 18:10:09 +0200
Subject: Re: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210406133944.4193691-1-philmd@redhat.com>
 <20210406143928.shfhgsdupbjqgohc@mozz.bu.edu>
 <31e0de30-c461-33d5-9f12-0f2505aed049@redhat.com>
 <60e2df83-b2e2-e710-5abf-ab3b812e7465@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c8e01e45-1018-c1b5-d0c1-ad60c82878e2@vivier.eu>
Date: Thu, 13 May 2021 18:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60e2df83-b2e2-e710-5abf-ab3b812e7465@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QHquuJOwnthEw2vlLRGxyL/N9Zvjto51fRl6zzP/qGf3twfrYFI
 9nJtiyllsvIU59EfauiO+UfzpvxedIjh9+Zj79oSsnleRWG/s0WThU8xQbizLlgiEFwy/w0
 pRBpLqvZHJ8pAmpV/MexVMBXYyqggBqIMgmZPAP6NSYQp9GfeakdHg8KAZZ3cJIk6Q0JOmE
 vYv51vtLikiojYMf6UGjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7oc974HYvnM=:OXGO/RmjrS2AXP5pCOYpUk
 qBXR4Y8a7Ni43MwE5FX6KNVpvsYwR2tr3BD5L23820LKhs2gLn8KE6QkGAkMxyoX9aOOBxjdx
 LDULqpJr3n/b/ywODOBNcvX8ZehBdUPYkbFqr292Dqdyby5LlsEF+3u5D5PNcF6LeGgvqB6rx
 3OpkAaPm2olPdIJgs8WDMGFzyqd4XxUcpn8xuyu1XTDBx4q4sYw0W9AbAft+2SncCq5IKSphA
 31JZ1M0iIx9cPs6fGBnjg2xtXqtRHRY4lMPl1nWGxogRyrCEbBAJUny8uPu+VQdqty5UO6zkQ
 8xdC+ZhY0kpaydUu6XZx7mUKCYk7RETiy6o3UY9nqBbfR1vGyMw0bLQO3O9FrRWvr86fkOubz
 5ZAQylqgUl+hlHKqnTbOntdFbjaDmUIjYHCjMHE3SYZsy/DkC9MWdD9FkKb2QOschW1BdyUnZ
 dhX4yRjkR0B7Pv+K1o94LRRny9lPxeTKPDW3MfVxcHT8g/DdWWFtKytbeeVhdEfBzZmta8Ant
 VukkGseXeny6nbejoYY5rk=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/05/2021 à 05:48, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial (patch reviewed).

Applied to my trivial-patches branch.

Thanks,
Laurent

> 
> On 4/12/21 1:07 PM, Philippe Mathieu-Daudé wrote:
>> ping?
>>
>> On 4/6/21 4:39 PM, Alexander Bulekov wrote:
>>> On 210406 1539, Philippe Mathieu-Daudé wrote:
>>>> sparse-mem.c is added to the 'mem_ss' source set, which itself
>>>> is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
>>>> selected.
>>>> But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
>>>> even if CONFIG_FUZZ is selected:
>>>>
>>>>   /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
>>>>   tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
>>>>   clang-10: error: linker command failed with exit code 1 (use -v to see invocation)
>>>>
>>>> Fix by adding sparse-mem.c directly to the softmmu_ss set.
>>>>
>>>> Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> Oops..
>>> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>>>
>>>> ---
>>>>  hw/mem/meson.build | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
>>>> index ef79e046787..3c8fdef9f9e 100644
>>>> --- a/hw/mem/meson.build
>>>> +++ b/hw/mem/meson.build
>>>> @@ -1,8 +1,9 @@
>>>>  mem_ss = ss.source_set()
>>>>  mem_ss.add(files('memory-device.c'))
>>>> -mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>>>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>>>>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>>>>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>>>>  
>>>>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>>>> +
>>>> +softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>>> -- 
>>>> 2.26.3
>>>>
>>>>
>>>
>>
> 
> 


