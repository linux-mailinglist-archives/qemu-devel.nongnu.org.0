Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A84773E7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:02:44 +0100 (CET)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrLH-0008Gg-74
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:02:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mxrGg-0002xu-Na
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:58:00 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mxrGe-0002rQ-Ml
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:57:58 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JFDCZ3WkQz8vtP;
 Thu, 16 Dec 2021 21:55:38 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 21:57:52 +0800
Subject: Re: [PATCH v6 5/8] tests/unit/test-smp-parse: Add 'smp-generic-valid'
 machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
CC: Eduardo Habkost <eduardo@habkost.net>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20211216132015.815493-1-philmd@redhat.com>
 <20211216132015.815493-6-philmd@redhat.com>
Message-ID: <c7d8c9bf-ea75-e38f-bdde-fe0070d6eabf@huawei.com>
Date: Thu, 16 Dec 2021 21:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211216132015.815493-6-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
> Keep the common TYPE_MACHINE class initialization in
> machine_base_class_init(), make it abstract, and move
> the non-common code to a new class: "smp-generic-valid".
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 47e11089e22..b20bf2c2359 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -478,13 +478,19 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
>   
> +    mc->smp_props.prefer_sockets = true;
> +
> +    mc->name = g_strdup(SMP_MACHINE_NAME);
> +}
> +
> +static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
>       mc->min_cpus = MIN_CPUS;
>       mc->max_cpus = MAX_CPUS;
>   
> -    mc->smp_props.prefer_sockets = true;
>       mc->smp_props.dies_supported = false;
> -
> -    mc->name = g_strdup(SMP_MACHINE_NAME);
>   }
>   
>   static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
> @@ -606,9 +612,14 @@ static const TypeInfo smp_machine_types[] = {
>       {
>           .name           = TYPE_MACHINE,
>           .parent         = TYPE_OBJECT,
> +        .abstract       = true,
>           .class_init     = machine_base_class_init,
>           .class_size     = sizeof(MachineClass),
>           .instance_size  = sizeof(MachineState),
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("smp-generic-valid"),
> +        .parent         = TYPE_MACHINE,
> +        .class_init     = machine_generic_valid_class_init,
>       }, {
>           .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
>           .parent         = TYPE_MACHINE,
> @@ -629,7 +640,7 @@ int main(int argc, char *argv[])
>       g_test_init(&argc, &argv, NULL);
>   
>       g_test_add_data_func("/test-smp-parse/generic/valid",
> -                         TYPE_MACHINE,
> +                         MACHINE_TYPE_NAME("smp-generic-valid"),
>                            test_generic_valid);
>       g_test_add_data_func("/test-smp-parse/generic/invalid",
>                            MACHINE_TYPE_NAME("smp-generic-invalid"),


