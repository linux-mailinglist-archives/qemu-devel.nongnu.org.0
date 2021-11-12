Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7109844E01C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:07:03 +0100 (CET)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlLy0-00064R-CY
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlLvx-0004sj-Qv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:04:53 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlLvv-0004dq-FV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:04:53 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hr1xP6T9lzcb5c;
 Fri, 12 Nov 2021 09:59:53 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:04:44 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:04:44 +0800
Subject: Re: [PATCH-for-6.2 v3 1/6] tests/unit/test-smp-parse: Restore
 MachineClass fields after modifying
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-2-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <df6a0315-6b94-51c4-9854-96c6ba08f3db@huawei.com>
Date: Fri, 12 Nov 2021 10:04:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-2-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/11 18:03, Philippe Mathieu-Daudé wrote:
> There is a single MachineClass object, registered with
> type_register_static(&smp_machine_info). Since the same
> object is used multiple times (an MachineState object
> is instantiated in both test_generic and test_with_dies),
> we should restore its internal state after modifying for
> the test purpose.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index cbe0c990494..bd11fbe91de 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -512,7 +512,7 @@ static void test_generic(void)
>           smp_parse_test(ms, data, true);
>       }
>   
> -    /* Reset the supported min CPUs and max CPUs */
> +    /* Force invalid min CPUs and max CPUs */
>       mc->min_cpus = 2;
>       mc->max_cpus = 511;
>   
> @@ -523,6 +523,10 @@ static void test_generic(void)
>           smp_parse_test(ms, data, false);
>       }
>   
> +    /* Reset the supported min CPUs and max CPUs */
> +    mc->min_cpus = MIN_CPUS;
> +    mc->max_cpus = MAX_CPUS;
> +
>       object_unref(obj);
>   }
>   
Just want to have a note:
Besides the supported min/max CPUs, mc->smp_props is dirtied
too for test purpose in each sub-test function. But for now, it is
not functionally necessary to also restore them at the final of each
sub-test function. We need to do this when new specific parameters
are tested in separate tests. At that time, for example, we will need
to at least add:

/* Restore the SMP compat properties */
mc->smp_props.dies_supported = false;

at the bottom of test_with_dies()

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan


