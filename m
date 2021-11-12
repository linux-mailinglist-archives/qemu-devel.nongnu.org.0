Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6E44E0B3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 04:14:31 +0100 (CET)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlN1K-0002sV-4R
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 22:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlN02-0002B9-HI
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:13:10 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlMzx-0004Xa-Fo
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:13:10 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hr3YT1F9vz915Z;
 Fri, 12 Nov 2021 11:12:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 11:12:58 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 11:12:57 +0800
Subject: Re: [PATCH-for-6.2 v3 5/6] tests/unit/test-smp-parse: Constify some
 pointer/struct
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-6-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <45438a56-693e-6483-820e-bdc0f48e9661@huawei.com>
Date: Fri, 12 Nov 2021 11:12:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-6-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
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
> Declare structures const when we don't need to modify
> them at runtime.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 83a5b8ffdcf..11109752799 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -83,7 +83,7 @@ typedef struct SMPTestData {
>    * then test the automatic calculation algorithm of the missing
>    * values in the parser.
>    */
> -static struct SMPTestData data_generic_valid[] = {
> +static const struct SMPTestData data_generic_valid[] = {
>       {
>           /* config: no configuration provided
>            * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
> @@ -285,7 +285,7 @@ static struct SMPTestData data_generic_valid[] = {
>       },
>   };
>   
> -static struct SMPTestData data_generic_invalid[] = {
> +static const struct SMPTestData data_generic_invalid[] = {
>       {
>           /* config: -smp 2,dies=2 */
>           .config = SMP_CONFIG_WITH_DIES(T, 2, F, 0, T, 2, F, 0, F, 0, F, 0),
> @@ -319,7 +319,7 @@ static struct SMPTestData data_generic_invalid[] = {
>       },
>   };
>   
> -static struct SMPTestData data_with_dies_invalid[] = {
> +static const struct SMPTestData data_with_dies_invalid[] = {
>       {
>           /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=16 */
>           .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 2, T, 16),
> @@ -356,7 +356,7 @@ static char *smp_config_to_string(SMPConfiguration *config)
>           config->has_maxcpus ? "true" : "false", config->maxcpus);
>   }
>   
> -static char *cpu_topology_to_string(CpuTopology *topo)
> +static char *cpu_topology_to_string(const CpuTopology *topo)
>   {
>       return g_strdup_printf(
>           "(CpuTopology) {\n"
> @@ -372,7 +372,7 @@ static char *cpu_topology_to_string(CpuTopology *topo)
>   }
>   
>   static void check_parse(MachineState *ms, SMPConfiguration *config,
> -                        CpuTopology *expect_topo, const char *expect_err,
> +                        const CpuTopology *expect_topo, const char *expect_err,
>                           bool is_valid)
>   {
>       g_autofree char *config_str = smp_config_to_string(config);
> @@ -466,7 +466,7 @@ static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
>   }
>   
>   /* The parsed results of the unsupported parameters should be 1 */
> -static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
> +static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
>   {
>       if (!mc->smp_props.dies_supported) {
>           data->expect_prefer_sockets.dies = 1;


