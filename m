Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0C4F601C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:46:44 +0200 (CEST)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc5zf-0006jc-CA
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nc5xq-0005mU-9j
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:44:53 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nc5xl-0001v2-SN
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:44:48 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KYQfB0ZW1z67K73;
 Wed,  6 Apr 2022 21:41:38 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Apr 2022 15:44:35 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 14:44:34 +0100
Date: Wed, 6 Apr 2022 14:44:33 +0100
To: Brice Goglin <Brice.Goglin@inria.fr>
CC: <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>, Liu Jingqi
 <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
Message-ID: <20220406144433.000049e3@huawei.com>
In-Reply-To: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Wed, 6 Apr 2022 14:29:56 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires initiator=X when hmat=on.
> 
> Unsetting this flag allows to create more complex memory topologies
> by having multiple best initiators for a single memory target.
> 
> This patch allows -numa with initiator=X when hmat=on by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it. And
> hmat_build_table_structs() already unset the Valid flag when needed.
> 
> Tested with
> qemu-system-x86_64 -accel kvm \
>   -machine pc,hmat=on \
>   -drive if=pflash,format=raw,file=./OVMF.fd \
>   -drive media=disk,format=qcow2,file=efi.qcow2 \
>   -smp 4 \
>   -m 3G \
>   -object memory-backend-ram,size=1G,id=ram0 \
>   -object memory-backend-ram,size=1G,id=ram1 \
>   -object memory-backend-ram,size=1G,id=ram2 \
>   -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
>   -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
>   -numa node,nodeid=2,memdev=ram2 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>   -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
>   -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>   -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>   -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
>   -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
>   -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
> 
> This exposes NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
> 
> Machine (2966MB total) + Package P#0
>    NUMANode P#2 (979MB)
>    Group0
>      NUMANode P#0 (980MB)
>      Core P#0 + PU P#0
>      Core P#1 + PU P#1
>    Group0
>      NUMANode P#1 (1007MB)
>      Core P#2 + PU P#2
>      Core P#3 + PU P#3
> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Useful fix / extension of what can be described.

Thanks,

Jonathan
> ---
>   hw/core/machine.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..9884ef7ac6 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1012,9 +1012,7 @@ static void numa_validate_initiator(NumaState *numa_state)
>   
>       for (i = 0; i < numa_state->num_nodes; i++) {
>           if (numa_info[i].initiator == MAX_NODES) {
> -            error_report("The initiator of NUMA node %d is missing, use "
> -                         "'-numa node,initiator' option to declare it", i);
> -            exit(1);
> +            continue;
>           }
>   
>           if (!numa_info[numa_info[i].initiator].present) {


