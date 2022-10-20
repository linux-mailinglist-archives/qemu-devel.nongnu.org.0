Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAB6062EC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:25:42 +0200 (CEST)
Received: from localhost ([::1]:46986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWUE-0005Ny-5M
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:25:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWQt-00078k-9F
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olTZ4-0005im-9n; Thu, 20 Oct 2022 07:18:23 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olTZ0-0001Mo-W0; Thu, 20 Oct 2022 07:18:17 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso24128423fac.6; 
 Thu, 20 Oct 2022 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bAGXtaYuxmlhJQDHOQ4tyXFpi1hEf9DiSgDn3OOhPZk=;
 b=Vgk+yLQxt7xrEILvEj34/umnICH5GOrs+PGkZT0M4odacA2NvTky7aJht+nKDX3ZrQ
 9ZHIHSWW4jo3npQb2M2bYieuvJGshrRKBt6fIfm3ZjK0IDz+HDkQy2o1UcXklYtVjhlf
 Uy4o3g5n7VQALQcJlF4v+j47Lzxpl7l2H+/LcffBcMa3A98SgESre4lkIwbiPByTo920
 S2wZgy6wDS6/PEfypiRR4NNRxdwL/FqTbjmDYxUjBjdIBAmzcVvOxw8VL5cJ4BCQeVJ8
 NDQOWyTWEERgKgN6oWvvWPGd0gKsHRh05PlvzgcqwXCiLYDAIib/gPZQcPL3cyMkxyM9
 Yg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAGXtaYuxmlhJQDHOQ4tyXFpi1hEf9DiSgDn3OOhPZk=;
 b=jW4vnkpTp5wix+J9X4xa7YpM/ziOpvL9BHRwKzt6N/cmpUYneomTDEuzVczwHkIEzL
 xF8Faolx1M59sxYxP7Z7i8TaJhDrBI5QuFWKGB1wcejaQLntowgdkycFmNa810T8z5Wx
 Wkl8AZ+a+Jf2QKnHbqchGB1cQ4eOBwhkFCXJ3cP/nlkAt30sq3jaPhZzhliF/zg5wTkF
 OpJ0elHE4eEuaTgh8Q5Im7YHuuCibj7eMRJAvhAZ27lRvCmtgzUrsr6FeNgk5PSZCLY6
 rdOyPJdjbIpw+pZh327XvzgujM2bR0qFAl/cIFH3B2MKNk/BvlxwAakkeJcdH+UPRUWc
 flRg==
X-Gm-Message-State: ACrzQf29eAft7Six9pyNeOLxUuMxLh6Il6MfUgRYJonPQ58gLM42LbDT
 sgQTMwaojQfB9togTcoMsUs=
X-Google-Smtp-Source: AMsMyM7PFoAFzLr8fcbkGox1yI6jCjUmYuJO1BFM4EZWy00L/lHQcyt2psOe69QLXCLMC8Lt6/j0ng==
X-Received: by 2002:a05:6870:470d:b0:132:a777:4961 with SMTP id
 b13-20020a056870470d00b00132a7774961mr25514033oaq.287.1666264693062; 
 Thu, 20 Oct 2022 04:18:13 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 er33-20020a056870c8a100b0011e37fb5493sm8738389oab.30.2022.10.20.04.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:18:12 -0700 (PDT)
Message-ID: <3cf56329-4513-d983-88da-4265a1d5f677@gmail.com>
Date: Thu, 20 Oct 2022 08:18:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 00/29] PowerPC interrupt rework
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <56d9bc9d-65ac-05a5-d35b-4d64766687a4@gmail.com>
In-Reply-To: <56d9bc9d-65ac-05a5-d35b-4d64766687a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/19/22 18:55, Daniel Henrique Barboza wrote:
> Matheus,
> 
> This series fails 'make check-avocado' in an e500 test. This is the error output:

Scrap that.

This avocado test is also failing on master 10% of the time, give or take.
It might be case that patch 27 makes the failure more consistent, but I can't
say it's the culprit.


I'll take a closer look and see if I can diagnose one particular commit that
is making the patch fail 1 out of 10 times. It can be case where I might need
to skip the test altogether.


Thanks,


Daniel


> 
> 
> & make -j && \
>      make check-avocado AVOCADO_TESTS=tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500
> 
> (...)
> 
> Fetching asset from tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500
> JOB ID     : 506b6b07bf40cf1bffcf3911a0f9b8948de6553c
> JOB LOG    : /home/danielhb/qemu/build/tests/results/job-2022-10-19T17.37-506b6b0/job.log
>   (1/1) tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '1-tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500', 'logdir': '/home/danielhb/qemu/build/tests/results/job-2022-10-19T17.37-506b6b0/test-... (120.31 s)
> RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 | CANCEL 0
> JOB TIME   : 121.00 s
> 
> 
> 
> 'git bisect' pointed the following commit as the culprit:
> 
> d9bdb6192edc5c74cda754a6cd32237b1b9272f0 is the first bad commit
> commit d9bdb6192edc5c74cda754a6cd32237b1b9272f0
> Author: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Date:   Tue Oct 11 17:48:27 2022 -0300
> 
>      target/ppc: introduce ppc_maybe_interrupt
> 
> This would be patch 27.
> 
> 
> As a benchmark, this test when successful takes around 11 seconds in my test
> env:
> 
>   (33/42) tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500: PASS (11.02 s)
> 
> 
> Cedric's qemu-ppc-boot test suit works fine with this series, so I'd say that
> this avocado test is doing something else that is causing the problem.
> 
> 
> I'll test patches 1-26 later and see if all tests pass. In that case I'll push
> 1-26 to ppc-next and then you can work on 27-29.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> On 10/11/22 17:48, Matheus Ferst wrote:
>> Link to v2: https://lists.gnu.org/archive/html/qemu-ppc/2022-09/msg00556.html
>> This series is also available as a git branch: https://github.com/PPC64/qemu/tree/ferst-interrupt-fix-v3
>> Patches without review: 3-27
>>
>> This new version rebases the patch series on the current master and
>> fixes some problems pointed out by Fabiano on v2.
>>
>> Matheus Ferst (29):
>>    target/ppc: define PPC_INTERRUPT_* values directly
>>    target/ppc: always use ppc_set_irq to set env->pending_interrupts
>>    target/ppc: split interrupt masking and delivery from ppc_hw_interrupt
>>    target/ppc: prepare to split interrupt masking and delivery by excp_model
>>    target/ppc: create an interrupt masking method for POWER9/POWER10
>>    target/ppc: remove unused interrupts from p9_next_unmasked_interrupt
>>    target/ppc: create an interrupt deliver method for POWER9/POWER10
>>    target/ppc: remove unused interrupts from p9_deliver_interrupt
>>    target/ppc: remove generic architecture checks from p9_deliver_interrupt
>>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER9
>>    target/ppc: add power-saving interrupt masking logic to p9_next_unmasked_interrupt
>>    target/ppc: create an interrupt masking method for POWER8
>>    target/ppc: remove unused interrupts from p8_next_unmasked_interrupt
>>    target/ppc: create an interrupt deliver method for POWER8
>>    target/ppc: remove unused interrupts from p8_deliver_interrupt
>>    target/ppc: remove generic architecture checks from p8_deliver_interrupt
>>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER8
>>    target/ppc: add power-saving interrupt masking logic to p8_next_unmasked_interrupt
>>    target/ppc: create an interrupt masking method for POWER7
>>    target/ppc: remove unused interrupts from p7_next_unmasked_interrupt
>>    target/ppc: create an interrupt deliver method for POWER7
>>    target/ppc: remove unused interrupts from p7_deliver_interrupt
>>    target/ppc: remove generic architecture checks from p7_deliver_interrupt
>>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER7
>>    target/ppc: add power-saving interrupt masking logic to p7_next_unmasked_interrupt
>>    target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
>>    target/ppc: introduce ppc_maybe_interrupt
>>    target/ppc: unify cpu->has_work based on cs->interrupt_request
>>    target/ppc: move the p*_interrupt_powersave methods to excp_helper.c
>>
>>   hw/ppc/pnv_core.c        |   1 +
>>   hw/ppc/ppc.c             |  17 +-
>>   hw/ppc/spapr_hcall.c     |   6 +
>>   hw/ppc/spapr_rtas.c      |   2 +-
>>   hw/ppc/trace-events      |   2 +-
>>   target/ppc/cpu.c         |   4 +
>>   target/ppc/cpu.h         |  43 +-
>>   target/ppc/cpu_init.c    | 212 +---------
>>   target/ppc/excp_helper.c | 887 ++++++++++++++++++++++++++++++++++-----
>>   target/ppc/helper.h      |   1 +
>>   target/ppc/helper_regs.c |   2 +
>>   target/ppc/misc_helper.c |  11 +-
>>   target/ppc/translate.c   |   2 +
>>   13 files changed, 833 insertions(+), 357 deletions(-)
>>

