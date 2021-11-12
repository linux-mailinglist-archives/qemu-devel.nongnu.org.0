Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72B44E049
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:29:20 +0100 (CET)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlMJb-0007Ny-72
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:29:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlMIs-0006jV-Fe
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:28:34 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlMIo-0007Ni-GV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:28:33 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hr2Wj6ZrHzZcv6;
 Fri, 12 Nov 2021 10:26:09 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:28:26 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:28:25 +0800
Subject: Re: [PATCH-for-6.2 v3 3/6] tests/unit/test-smp-parse: Explicit
 MachineClass name
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-4-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <fee6d60b-9070-7fbb-3275-cdd4aa7ee144@huawei.com>
Date: Fri, 12 Nov 2021 10:28:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-4-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
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
> If the MachineClass::name pointer is not explicitly set, it is NULL.
> Per the C standard, passing a NULL pointer to printf "%s" format is
> undefined. Some implementations display it as 'NULL', other as 'null'.
> Since we are comparing the formatted output, we need a stable value.
> The easiest is to explicit a machine name string.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 51670297bf9..de6d226b455 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -23,6 +23,8 @@
>   #define MIN_CPUS 1   /* set the min CPUs supported by the machine as 1 */
>   #define MAX_CPUS 512 /* set the max CPUs supported by the machine as 512 */
>   
> +#define SMP_MACHINE_NAME "TEST-SMP"
> +
>   /*
>    * Used to define the generic 3-level CPU topology hierarchy
>    *  -sockets/cores/threads
> @@ -307,13 +309,13 @@ static struct SMPTestData data_generic_invalid[] = {
>            * should tweak the supported min CPUs to 2 for testing */
>           .config = SMP_CONFIG_GENERIC(T, 1, F, 0, F, 0, F, 0, F, 0),
>           .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
> -                        "by machine '(null)' is 2",
> +                        "by machine '" SMP_MACHINE_NAME "' is 2",
>       }, {
>           /* config: -smp 512
>            * should tweak the supported max CPUs to 511 for testing */
>           .config = SMP_CONFIG_GENERIC(T, 512, F, 0, F, 0, F, 0, F, 0),
>           .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
> -                        "by machine '(null)' is 511",
> +                        "by machine '" SMP_MACHINE_NAME "' is 511",
>       },
>   };
>   
> @@ -481,6 +483,8 @@ static void machine_class_init(ObjectClass *oc, void *data)
>   
>       mc->smp_props.prefer_sockets = true;
>       mc->smp_props.dies_supported = false;
> +
> +    mc->name = g_strdup(SMP_MACHINE_NAME);
I'm not very familiar with Qom code, so it may be a stupid question.
The mc->name will be automatically freed elsewhere when all the
testing is finished and exits, right? :)
>   }
>   
>   static void test_generic(void)
With my uncertainty clarified:
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

