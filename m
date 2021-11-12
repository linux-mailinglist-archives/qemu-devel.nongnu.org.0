Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6A44E07A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:47:58 +0100 (CET)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlMbd-0001xq-25
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlMas-0001I7-SQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:47:10 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlMap-0001C3-EV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:47:10 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hr2x72CLfzZcww;
 Fri, 12 Nov 2021 10:44:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:46:59 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:46:58 +0800
Subject: Re: [PATCH-for-6.2 v3 4/6] tests/unit/test-smp-parse: Simplify
 pointer to compound literal use
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-5-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <839fc70e-6a0f-f762-fb46-231c5c6fb7c3@huawei.com>
Date: Fri, 12 Nov 2021 10:46:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-5-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
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
> We can simply use a local variable (and pass its pointer) instead
> of a pointer to a compound literal.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 64 ++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index de6d226b455..83a5b8ffdcf 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -492,19 +492,19 @@ static void test_generic(void)
>       Object *obj = object_new(TYPE_MACHINE);
>       MachineState *ms = MACHINE(obj);
>       MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){{ }};
> +    SMPTestData data = {};
>       int i;
>   
>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
> -        *data = data_generic_valid[i];
> -        unsupported_params_init(mc, data);
> +        data = data_generic_valid[i];
> +        unsupported_params_init(mc, &data);
>   
> -        smp_parse_test(ms, data, true);
> +        smp_parse_test(ms, &data, true);
>   
>           /* Unsupported parameters can be provided with their values as 1 */
> -        data->config.has_dies = true;
> -        data->config.dies = 1;
> -        smp_parse_test(ms, data, true);
> +        data.config.has_dies = true;
> +        data.config.dies = 1;
> +        smp_parse_test(ms, &data, true);
>       }
>   
>       /* Force invalid min CPUs and max CPUs */
> @@ -512,10 +512,10 @@ static void test_generic(void)
>       mc->max_cpus = 511;
>   
>       for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
> -        *data = data_generic_invalid[i];
> -        unsupported_params_init(mc, data);
> +        data = data_generic_invalid[i];
> +        unsupported_params_init(mc, &data);
>   
> -        smp_parse_test(ms, data, false);
> +        smp_parse_test(ms, &data, false);
>       }
>   
>       /* Reset the supported min CPUs and max CPUs */
> @@ -530,47 +530,47 @@ static void test_with_dies(void)
>       Object *obj = object_new(TYPE_MACHINE);
>       MachineState *ms = MACHINE(obj);
>       MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){{ }};
> +    SMPTestData data = {};
>       unsigned int num_dies = 2;
>       int i;
>   
>       mc->smp_props.dies_supported = true;
>   
>       for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
> -        *data = data_generic_valid[i];
> -        unsupported_params_init(mc, data);
> +        data = data_generic_valid[i];
> +        unsupported_params_init(mc, &data);
>   
>           /* when dies parameter is omitted, it will be set as 1 */
> -        data->expect_prefer_sockets.dies = 1;
> -        data->expect_prefer_cores.dies = 1;
> +        data.expect_prefer_sockets.dies = 1;
> +        data.expect_prefer_cores.dies = 1;
>   
> -        smp_parse_test(ms, data, true);
> +        smp_parse_test(ms, &data, true);
>   
>           /* when dies parameter is specified */
> -        data->config.has_dies = true;
> -        data->config.dies = num_dies;
> -        if (data->config.has_cpus) {
> -            data->config.cpus *= num_dies;
> +        data.config.has_dies = true;
> +        data.config.dies = num_dies;
> +        if (data.config.has_cpus) {
> +            data.config.cpus *= num_dies;
>           }
> -        if (data->config.has_maxcpus) {
> -            data->config.maxcpus *= num_dies;
> +        if (data.config.has_maxcpus) {
> +            data.config.maxcpus *= num_dies;
>           }
>   
> -        data->expect_prefer_sockets.dies = num_dies;
> -        data->expect_prefer_sockets.cpus *= num_dies;
> -        data->expect_prefer_sockets.max_cpus *= num_dies;
> -        data->expect_prefer_cores.dies = num_dies;
> -        data->expect_prefer_cores.cpus *= num_dies;
> -        data->expect_prefer_cores.max_cpus *= num_dies;
> +        data.expect_prefer_sockets.dies = num_dies;
> +        data.expect_prefer_sockets.cpus *= num_dies;
> +        data.expect_prefer_sockets.max_cpus *= num_dies;
> +        data.expect_prefer_cores.dies = num_dies;
> +        data.expect_prefer_cores.cpus *= num_dies;
> +        data.expect_prefer_cores.max_cpus *= num_dies;
>   
> -        smp_parse_test(ms, data, true);
> +        smp_parse_test(ms, &data, true);
>       }
>   
>       for (i = 0; i < ARRAY_SIZE(data_with_dies_invalid); i++) {
> -        *data = data_with_dies_invalid[i];
> -        unsupported_params_init(mc, data);
> +        data = data_with_dies_invalid[i];
> +        unsupported_params_init(mc, &data);
>   
> -        smp_parse_test(ms, data, false);
> +        smp_parse_test(ms, &data, false);
>       }
>   
>       object_unref(obj);


