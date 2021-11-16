Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAD4533DA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:13:34 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzDJ-0007qP-8V
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmzAg-0006Ep-67
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:10:50 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmzAb-00019H-N2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:10:48 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Htns53MbWzcbLK;
 Tue, 16 Nov 2021 22:05:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 22:10:37 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 22:10:36 +0800
Subject: Re: [PATCH-for-7.0 v4 06/11] tests/unit/test-smp-parse: Add
 'smp-with-dies' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-7-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <a4b73cb3-be72-e016-6ad7-3ee226be60b5@huawei.com>
Date: Tue, 16 Nov 2021 22:10:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-7-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
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


On 2021/11/15 22:58, Philippe Mathieu-Daudé wrote:
> Avoid modifying the MachineClass internals by adding the
> 'smp-with-dies' machine, which inherits from TYPE_MACHINE.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index e27aedad354..ff61da06e3d 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -487,6 +487,16 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
>       mc->name = g_strdup(SMP_MACHINE_NAME);
>   }
>   
> +static void machine_with_dies_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->min_cpus = MIN_CPUS;
> +    mc->max_cpus = MAX_CPUS;
> +
> +    mc->smp_props.dies_supported = true;
> +}
> +
>   static void test_generic_valid(const void *opaque)
>   {
>       const char *machine_type = opaque;
> @@ -549,9 +559,6 @@ static void test_with_dies(const void *opaque)
>       unsigned int num_dies = 2;
>       int i;
>   
> -    /* Force the SMP compat properties */
> -    mc->smp_props.dies_supported = true;
> -
>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>           *data = data_generic_valid[i];
>           unsupported_params_init(mc, data);
> @@ -589,9 +596,6 @@ static void test_with_dies(const void *opaque)
>           smp_parse_test(ms, data, false);
>       }
>   
> -    /* Restore the SMP compat properties */
> -    mc->smp_props.dies_supported = false;
> -
>       object_unref(obj);
>   }
>   
> @@ -603,6 +607,10 @@ static const TypeInfo smp_machine_types[] = {
>           .class_init     = machine_base_class_init,
>           .class_size     = sizeof(MachineClass),
>           .instance_size  = sizeof(MachineState),
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("smp-with-dies"),
> +        .parent         = TYPE_MACHINE,
> +        .class_init     = machine_with_dies_class_init,
>       }
>   };
>   
> @@ -621,7 +629,7 @@ int main(int argc, char *argv[])
>                            TYPE_MACHINE,
>                            test_generic_invalid);
>       g_test_add_data_func("/test-smp-parse/with_dies",
> -                         TYPE_MACHINE,
> +                         MACHINE_TYPE_NAME("smp-with-dies"),
>                            test_with_dies);
>   
>       g_test_run();
I have tested this patch locally and all works as expected:

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

