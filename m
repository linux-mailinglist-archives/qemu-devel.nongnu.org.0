Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4154541FB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:39:39 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnFXd-0003sd-Rx
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:39:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mnFVV-0002WB-JS
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:37:25 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mnFVT-0002EZ-2o
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:37:25 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HvF7h0THgz1DJWj;
 Wed, 17 Nov 2021 15:34:56 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 15:37:17 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 15:37:17 +0800
Subject: Re: [PATCH-for-7.0 v4 08/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-valid' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-9-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <06bcb095-66f5-6c11-0cd2-fa9defce799e@huawei.com>
Date: Wed, 17 Nov 2021 15:37:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-9-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 2021/11/15 22:58, Philippe Mathieu-Daudé wrote:
> Keep the common TYPE_MACHINE class initialization in
> machine_base_class_init(), make it abstract, and move
> the non-common code to a new class: "smp-without-dies-valid".
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index dfe7f1313b0..90a249fe8c8 100644
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
> +static void machine_without_dies_valid_class_init(ObjectClass *oc, void *data)
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
>   static void machine_without_dies_invalid_class_init(ObjectClass *oc, void *data)
> @@ -606,9 +612,14 @@ static const TypeInfo smp_machine_types[] = {
>       {
>           .name           = TYPE_MACHINE,
>           .parent         = TYPE_OBJECT,
> +        .abstract       = true,
>           .class_init     = machine_base_class_init,
>           .class_size     = sizeof(MachineClass),
>           .instance_size  = sizeof(MachineState),
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("smp-without-dies-valid"),
> +        .parent         = TYPE_MACHINE,
> +        .class_init     = machine_without_dies_valid_class_init,
>       }, {
>           .name           = MACHINE_TYPE_NAME("smp-without-dies-invalid"),
>           .parent         = TYPE_MACHINE,
> @@ -629,7 +640,7 @@ int main(int argc, char *argv[])
>       g_test_init(&argc, &argv, NULL);
>   
>       g_test_add_data_func("/test-smp-parse/generic/valid",
> -                         TYPE_MACHINE,
> +                         MACHINE_TYPE_NAME("smp-without-dies-valid"),
>                            test_generic_valid);
>       g_test_add_data_func("/test-smp-parse/generic/invalid",
>                            MACHINE_TYPE_NAME("smp-without-dies-invalid"),
After patch #7 and #8, we will have sub-tests as below. It looks nice, 
but it will
probably be better to tweak "smp-without-dies-valid" to "smp-generic-valid",
and "smp-without-dies-invalid" to "smp-generic-invalid", which will be more
consistent with the corresponding sub-test name.

It's Ok now as we only have dies currently besides generic 
sockets/cores/threads,
but "smp-without-dies-xxx" will become a bit confusing when new topology
members are introduced and tested here.

int main(int argc, char *argv[])
{
module_call_init(MODULE_INIT_QOM);

     g_test_init(&argc, &argv, NULL);

g_test_add_data_func("/test-smp-parse/generic/valid",
MACHINE_TYPE_NAME("smp-without-dies-valid"),
test_generic_valid);
g_test_add_data_func("/test-smp-parse/generic/invalid",
MACHINE_TYPE_NAME("smp-without-dies-invalid"),
test_generic_invalid);
g_test_add_data_func("/test-smp-parse/with_dies",
MACHINE_TYPE_NAME("smp-with-dies"),
test_with_dies);

g_test_run();

     return 0;
}

Otherwise, #7 and #8 look nice. Thanks for your work!

Thanks,
Yanan

