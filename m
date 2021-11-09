Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B344AD69
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:20:48 +0100 (CET)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQ7K-0004PM-ON
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mkQ5c-0002Uk-Sm
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:19:00 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mkQ5Z-0004mS-U3
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:19:00 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HpRpg6Qmyz911j;
 Tue,  9 Nov 2021 20:18:35 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 9 Nov 2021 20:18:47 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Tue, 9 Nov 2021 20:18:46 +0800
Subject: Re: [PATCH v4 2/2] tests/unit: Add an unit test for smp parsing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211028150913.1975305-1-philmd@redhat.com>
 <20211028150913.1975305-3-philmd@redhat.com>
 <cb4307b9-e4b1-da06-3f69-556e8f074a88@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0d991e20-05d7-a182-5270-81c1892656b4@huawei.com>
Date: Tue, 9 Nov 2021 20:18:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cb4307b9-e4b1-da06-3f69-556e8f074a88@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/11/9 17:36, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 10/28/21 17:09, Philippe Mathieu-Daudé wrote:
>> From: Yanan Wang <wangyanan55@huawei.com>
>>
>> Now that we have a generic parser smp_parse(), let's add an unit
>> test for the code. All possible valid/invalid SMP configurations
>> that the user can specify are covered.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20211026034659.22040-3-wangyanan55@huawei.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS                 |   1 +
>>   tests/unit/meson.build      |   1 +
>>   3 files changed, 596 insertions(+)
>>   create mode 100644 tests/unit/test-smp-parse.c
> Could you have a look at this test failure please?
> https://cirrus-ci.com/task/5823855357853696
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> G_TEST_SRCDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/tests/unit
> G_TEST_BUILDDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/unit
> tests/unit/test-smp-parse.exe --tap -k
> Test smp_parse failed!
> Input configuration: (SMPConfiguration) {
>      .has_cpus    =  true, cpus    = 1,
>      .has_sockets = false, sockets = 0,
>      .has_dies    = false, dies    = 0,
>      .has_cores   = false, cores   = 0,
>      .has_threads = false, threads = 0,
>      .has_maxcpus = false, maxcpus = 0,
> }
> Should be valid: no
> Expected error report: Invalid SMP CPUs 1. The min CPUs supported by
> machine '(null)' is 2
> Result is valid: no
> Output error report: Invalid SMP CPUs 1. The min CPUs supported by
> machine '(NULL)' is 2
> ERROR test-smp-parse - too few tests run (expected 2, got 0)
> make: *** [Makefile.mtest:576: run-test-70] Error 1
>
>
> .
Obviously, the name string for the tested machine type in cirrus-ci is 
"NULL",
while the expected name string is "null". It was also "null" when running on
my Arm64 platform locally.

Anyway, I shouldn't have hardcoded this expected error message. I can
send a fix patch to make it more flexible then more stable. :)

Thanks,
Yanan


