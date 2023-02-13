Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F6694661
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYK2-0004r4-LT; Mon, 13 Feb 2023 07:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRYK0-0004qv-72
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:52:40 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRYJu-0008SS-55
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:52:38 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PFkgr6GVZzRs2H;
 Mon, 13 Feb 2023 20:49:44 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Mon, 13 Feb 2023 20:52:14 +0800
Message-ID: <6270bfbe-ab8c-80a2-4e27-27adfdcbb854@huawei.com>
Date: Mon, 13 Feb 2023 20:52:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 05/52] hw/core/machine: Rename machine-smp.c to
 machine-topo.c
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-6-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-6-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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

Hi Zhao，
在 2023/2/13 17:49, Zhao Liu 写道:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> Hybrid topology support will also be added to this file.
>
> In order to maintain the semantic consistency of the file name and
> content, the file name is changed to "machine-topo.c".
>
> This file will handle all cpu topology related things, thus also change
> the file description comment.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   MAINTAINERS                               | 2 +-
>   hw/core/{machine-smp.c => machine-topo.c} | 2 +-
>   hw/core/meson.build                       | 2 +-
>   tests/unit/meson.build                    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
>   rename hw/core/{machine-smp.c => machine-topo.c} (99%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71c1bc24371b..58794885ced3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1733,7 +1733,7 @@ F: cpu.c
>   F: hw/core/cpu.c
>   F: hw/core/machine-qmp-cmds.c
>   F: hw/core/machine.c
> -F: hw/core/machine-smp.c
> +F: hw/core/machine-topo.c
>   F: hw/core/null-machine.c
>   F: hw/core/numa.c
>   F: hw/cpu/cluster.c
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-topo.c
> similarity index 99%
> rename from hw/core/machine-smp.c
> rename to hw/core/machine-topo.c
Better named as cpu-topology.c? So that it's consistent with the
header "cpu-topology.h" in a following patch.

Thanks,
Yanan
> index 3fd9e641efde..8066d2c46bef 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-topo.c
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU Machine core (related to -smp parsing)
> + * QEMU Machine core (related to CPU topology)
>    *
>    * Copyright (c) 2021 Huawei Technologies Co., Ltd
>    *
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 7a4d02b6c050..71d523dc6826 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -23,7 +23,7 @@ else
>   endif
>   
>   common_ss.add(files('cpu-common.c'))
> -common_ss.add(files('machine-smp.c'))
> +common_ss.add(files('machine-topo.c'))
>   softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
>   softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
>   softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index a9df2843e92e..1720a769f1a2 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -46,7 +46,7 @@ tests = {
>     'test-uuid': [],
>     'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
>     'test-qapi-util': [],
> -  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
> +  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-topo.c'],
>     'test-interval-tree': [],
>   }
>   


