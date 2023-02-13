Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217E694711
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:32:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYwG-0001Ud-0P; Mon, 13 Feb 2023 08:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRYwC-0001U9-Lo
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:32:08 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRYw9-0008Rl-1b
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:32:08 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PFlYq27pBznW8s;
 Mon, 13 Feb 2023 21:29:35 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Mon, 13 Feb 2023 21:31:53 +0800
Message-ID: <0f64a5cd-a97c-ee54-e131-387fee0be853@huawei.com>
Date: Mon, 13 Feb 2023 21:31:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 01/18] machine: Fix comment of
 machine_parse_smp_config()
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-2-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-2-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> Now smp supports dies and clusters, so add description about these 2
> levels in the comment of machine_parse_smp_config().
>
> Fixes: 864c3b5 (hw/core/machine: Introduce CPU cluster topology support)
> Suggested-by: Robert Hoo <robert.hu@linux.intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/core/machine-smp.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index c3dab007dadc..3fd9e641efde 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -51,8 +51,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>    * machine_parse_smp_config: Generic function used to parse the given
>    *                           SMP configuration
>    *
> - * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
> - * automatically computed based on the provided ones.
> + * Any missing parameter in "cpus/maxcpus/sockets/dies/clusters/cores/threads"
> + * will be automatically computed based on the provided ones.
This is intential. Newly added topo params (apart from maxcpus/
socket/cores/threads) wiil be assigned to 1 and not computed
based the provided ones. There is no problem about this part.
>    *
>    * In the calculation of omitted sockets/cores/threads: we prefer sockets
>    * over cores over threads before 6.2, while preferring cores over sockets
> @@ -66,7 +66,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>    *
>    * For compatibility, apart from the parameters that will be computed, newly
>    * introduced topology members which are likely to be target specific should
> - * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
> + * be directly set as 1 if they are omitted (e.g. dies for PC since v4.1 and
> + * clusters for arm since v7.0).
>    */
Given that we are going to support cluster for PC machine.
Maybe simple "(i.e. dies for PC since 4.1)" here is good enough?

Thanks,
Yanan
>   void machine_parse_smp_config(MachineState *ms,
>                                 const SMPConfiguration *config, Error **errp)


