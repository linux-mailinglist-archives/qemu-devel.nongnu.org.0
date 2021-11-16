Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55CF4533B7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:09:28 +0100 (CET)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmz9L-0002bH-P7
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmz7f-0001uX-6L
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:07:43 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mmz7b-0000ZB-Nx
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:07:42 -0500
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Htns16bXZz8vQ7;
 Tue, 16 Nov 2021 22:05:41 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 22:07:24 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 22:07:22 +0800
Subject: Re: [PATCH-for-7.0 v4 05/11] tests/unit/test-smp-parse: Split the
 'generic' test in valid / invalid
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-6-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0d3fa53c-ae1f-abfe-1418-46f96ca75015@huawei.com>
Date: Tue, 16 Nov 2021 22:07:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-6-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
> Split the 'generic' test in two tests: 'valid' and 'invalid'.
> This will allow us to remove the hack which modifies the
> MachineClass internal state.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 37c6b4981db..e27aedad354 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -487,7 +487,7 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
>       mc->name = g_strdup(SMP_MACHINE_NAME);
>   }
>   
> -static void test_generic(const void *opaque)
> +static void test_generic_valid(const void *opaque)
>   {
>       const char *machine_type = opaque;
>       Object *obj = object_new(machine_type);
> @@ -508,6 +508,19 @@ static void test_generic(const void *opaque)
>           smp_parse_test(ms, data, true);
>       }
>   
> +    object_unref(obj);
> +}
> +
> +static void test_generic_invalid(const void *opaque)
> +{
> +    const char *machine_type = opaque;
> +    Object *obj = object_new(machine_type);
> +    MachineState *ms = MACHINE(obj);
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +    SMPTestData *data = &(SMPTestData){};
> +    int i;
> +
> +
Ah, there is an extra empty line which should be deleted.

Thanks,
Yanan
>       /* Force invalid min CPUs and max CPUs */
>       mc->min_cpus = 2;
>       mc->max_cpus = 511;
> @@ -601,9 +614,12 @@ int main(int argc, char *argv[])
>   
>       g_test_init(&argc, &argv, NULL);
>   
> -    g_test_add_data_func("/test-smp-parse/generic",
> +    g_test_add_data_func("/test-smp-parse/generic/valid",
>                            TYPE_MACHINE,
> -                         test_generic);
> +                         test_generic_valid);
> +    g_test_add_data_func("/test-smp-parse/generic/invalid",
> +                         TYPE_MACHINE,
> +                         test_generic_invalid);
>       g_test_add_data_func("/test-smp-parse/with_dies",
>                            TYPE_MACHINE,
>                            test_with_dies);


