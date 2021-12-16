Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A794F4773C9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:59:42 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrIL-0004HK-Q2
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mxrG8-0001Be-UN
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:57:24 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mxrG4-0002k5-70
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:57:24 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JFDDX4RX6z91jj;
 Thu, 16 Dec 2021 21:56:28 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 21:57:13 +0800
Subject: Re: [PATCH v6 4/8] tests/unit/test-smp-parse: Add
 'smp-generic-invalid' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
CC: Eduardo Habkost <eduardo@habkost.net>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20211216132015.815493-1-philmd@redhat.com>
 <20211216132015.815493-5-philmd@redhat.com>
Message-ID: <d0b96f6c-b3fc-59bf-abce-ec3f5ea3dd00@huawei.com>
Date: Thu, 16 Dec 2021 21:57:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211216132015.815493-5-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>


On 2021/12/16 21:20, Philippe Mathieu-Daudé wrote:
> Avoid modifying the MachineClass internals by adding the
> 'smp-generic-invalid' machine, which inherits from TYPE_MACHINE.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index f66cf7bb598..47e11089e22 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -487,6 +487,17 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
>       mc->name = g_strdup(SMP_MACHINE_NAME);
>   }
>   
> +static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    /* Force invalid min CPUs and max CPUs */
> +    mc->min_cpus = 2;
> +    mc->max_cpus = 511;
> +
> +    mc->smp_props.dies_supported = false;
> +}
> +
>   static void machine_with_dies_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -530,10 +541,6 @@ static void test_generic_invalid(const void *opaque)
>       SMPTestData *data = &(SMPTestData){};
>       int i;
>   
> -    /* Force invalid min CPUs and max CPUs */
> -    mc->min_cpus = 2;
> -    mc->max_cpus = 511;
> -
>       for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
>           *data = data_generic_invalid[i];
>           unsupported_params_init(mc, data);
> @@ -541,10 +548,6 @@ static void test_generic_invalid(const void *opaque)
>           smp_parse_test(ms, data, false);
>       }
>   
> -    /* Reset the supported min CPUs and max CPUs */
> -    mc->min_cpus = MIN_CPUS;
> -    mc->max_cpus = MAX_CPUS;
> -
>       object_unref(obj);
>   }
>   
> @@ -606,6 +609,10 @@ static const TypeInfo smp_machine_types[] = {
>           .class_init     = machine_base_class_init,
>           .class_size     = sizeof(MachineClass),
>           .instance_size  = sizeof(MachineState),
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
> +        .parent         = TYPE_MACHINE,
> +        .class_init     = machine_generic_invalid_class_init,
>       }, {
>           .name           = MACHINE_TYPE_NAME("smp-with-dies"),
>           .parent         = TYPE_MACHINE,
> @@ -625,7 +632,7 @@ int main(int argc, char *argv[])
>                            TYPE_MACHINE,
>                            test_generic_valid);
>       g_test_add_data_func("/test-smp-parse/generic/invalid",
> -                         TYPE_MACHINE,
> +                         MACHINE_TYPE_NAME("smp-generic-invalid"),
>                            test_generic_invalid);
>       g_test_add_data_func("/test-smp-parse/with_dies",
>                            MACHINE_TYPE_NAME("smp-with-dies"),


