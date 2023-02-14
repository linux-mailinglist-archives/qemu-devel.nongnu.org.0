Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8B6956BD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 03:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRlAN-0004Xx-S4; Mon, 13 Feb 2023 21:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRlAL-0004Wu-0D
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:35:33 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRlAI-0002zL-2k
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:35:32 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PG4xq08NmznW9W;
 Tue, 14 Feb 2023 10:33:03 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Feb 2023 10:34:47 +0800
Message-ID: <f8733b97-2bb5-c15a-d863-02891ef8ea7e@huawei.com>
Date: Tue, 14 Feb 2023 10:34:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 13/18] hw/i386/pc: Support smp.clusters for x86 PC
 machine
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
 <20230213093625.158170-14-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-14-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
> From: Zhuocheng Ding <zhuocheng.ding@intel.com>
>
> As module-level topology support is added to X86CPU, now we can enable
> the support for the cluster parameter on PC machines. With this support,
> we can define a 5-level x86 CPU topology with "-smp":
>
> -smp cpus=*,maxcpus=*,sockets=*,dies=*,clusters=*,cores=*,threads=*.
>
> Additionally, add the 5-level topology example in description of "-smp".
>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/pc.c    |  1 +
>   qemu-options.hx | 10 +++++-----
>   2 files changed, 6 insertions(+), 5 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969aa..c329df56ebd2 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1929,6 +1929,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>       mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
>       mc->nvdimm_supported = true;
>       mc->smp_props.dies_supported = true;
> +    mc->smp_props.clusters_supported = true;
>       mc->default_ram_id = "pc.ram";
>   
>       object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 88e93c610314..3caf9da4c3af 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -312,14 +312,14 @@ SRST
>           -smp 8,sockets=2,cores=2,threads=2,maxcpus=8
>   
>       The following sub-option defines a CPU topology hierarchy (2 sockets
> -    totally on the machine, 2 dies per socket, 2 cores per die, 2 threads
> -    per core) for PC machines which support sockets/dies/cores/threads.
> -    Some members of the option can be omitted but their values will be
> -    automatically computed:
> +    totally on the machine, 2 dies per socket, 2 clusters per die, 2 cores per
> +    cluster, 2 threads per core) for PC machines which support sockets/dies
> +    /clusters/cores/threads. Some members of the option can be omitted but
> +    their values will be automatically computed:
>   
>       ::
>   
> -        -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
> +        -smp 32,sockets=2,dies=2,clusters=2,cores=2,threads=2,maxcpus=32
>   
>       The following sub-option defines a CPU topology hierarchy (2 sockets
>       totally on the machine, 2 clusters per socket, 2 cores per cluster,


