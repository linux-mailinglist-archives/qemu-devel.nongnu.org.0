Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC544E01D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:07:21 +0100 (CET)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlLyK-0006ac-4U
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlLwG-00056I-0J
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:05:12 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlLwB-0004ex-7Y
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:05:11 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hr2315Cnpz90vF;
 Fri, 12 Nov 2021 10:04:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:05:02 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:05:01 +0800
Subject: Re: [PATCH-for-6.2 v3 2/6] tests/unit/test-smp-parse: QOM'ify
 smp_machine_class_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-3-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5742cc41-a156-0fc6-4615-944e90d1e660@huawei.com>
Date: Fri, 12 Nov 2021 10:05:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-3-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
> smp_machine_class_init() is the actual TypeInfo::class_init().
> Declare it as such in smp_machine_info, and avoid to call it
> manually in each test. Move smp_machine_info definition just
> before we register the type to avoid a forward declaration.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index bd11fbe91de..51670297bf9 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -75,14 +75,6 @@ typedef struct SMPTestData {
>       const char *expect_error;
>   } SMPTestData;
>   
> -/* Type info of the tested machine */
> -static const TypeInfo smp_machine_info = {
> -    .name = TYPE_MACHINE,
> -    .parent = TYPE_OBJECT,
> -    .class_size = sizeof(MachineClass),
> -    .instance_size = sizeof(MachineState),
> -};
> -
>   /*
>    * List all the possible valid sub-collections of the generic 5
>    * topology parameters (i.e. cpus/maxcpus/sockets/cores/threads),
> @@ -480,9 +472,10 @@ static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
>       }
>   }
>   
> -/* Reset the related machine properties before each sub-test */
> -static void smp_machine_class_init(MachineClass *mc)
> +static void machine_class_init(ObjectClass *oc, void *data)
>   {
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
>       mc->min_cpus = MIN_CPUS;
>       mc->max_cpus = MAX_CPUS;
>   
> @@ -498,8 +491,6 @@ static void test_generic(void)
>       SMPTestData *data = &(SMPTestData){{ }};
>       int i;
>   
> -    smp_machine_class_init(mc);
> -
>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>           *data = data_generic_valid[i];
>           unsupported_params_init(mc, data);
> @@ -539,7 +530,6 @@ static void test_with_dies(void)
>       unsigned int num_dies = 2;
>       int i;
>   
> -    smp_machine_class_init(mc);
>       mc->smp_props.dies_supported = true;
>   
>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
> @@ -582,6 +572,15 @@ static void test_with_dies(void)
>       object_unref(obj);
>   }
>   
> +/* Type info of the tested machine */
> +static const TypeInfo smp_machine_info = {
> +    .name = TYPE_MACHINE,
> +    .parent = TYPE_OBJECT,
> +    .class_init = machine_class_init,
> +    .class_size = sizeof(MachineClass),
> +    .instance_size = sizeof(MachineState),
> +};
> +
>   int main(int argc, char *argv[])
>   {
>       g_test_init(&argc, &argv, NULL);


