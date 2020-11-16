Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CD2B3B62
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 03:15:46 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keU3V-0002R7-0X
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 21:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1keU2W-0001qT-2b; Sun, 15 Nov 2020 21:14:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1keU2S-0007fv-Vn; Sun, 15 Nov 2020 21:14:43 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZCLV0xHfz6tw8;
 Mon, 16 Nov 2020 10:14:10 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 10:14:12 +0800
Message-ID: <5FB1E074.50205@huawei.com>
Date: Mon, 16 Nov 2020 10:14:12 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <mst@redhat.com>, <stefanha@redhat.com>, <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH] contrib/libvhost-user: Fix bad printf format specifiers
References: <5FA28106.6000901@huawei.com>
In-Reply-To: <5FA28106.6000901@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:14:23
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping...

On 2020/11/4 18:23, AlexChen wrote:
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  contrib/libvhost-user/libvhost-user.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> index bfec8a881a..5c73ffdd6b 100644
> --- a/contrib/libvhost-user/libvhost-user.c
> +++ b/contrib/libvhost-user/libvhost-user.c
> @@ -701,7 +701,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>          return false;
>      }
> 
> -    DPRINT("Adding region: %d\n", dev->nregions);
> +    DPRINT("Adding region: %u\n", dev->nregions);
>      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
>             msg_region->guest_phys_addr);
>      DPRINT("    memory_size:     0x%016"PRIx64"\n",
> @@ -848,7 +848,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
>      VhostUserMemory m = vmsg->payload.memory, *memory = &m;
>      dev->nregions = memory->nregions;
> 
> -    DPRINT("Nregions: %d\n", memory->nregions);
> +    DPRINT("Nregions: %u\n", memory->nregions);
>      for (i = 0; i < dev->nregions; i++) {
>          void *mmap_addr;
>          VhostUserMemoryRegion *msg_region = &memory->regions[i];
> @@ -938,7 +938,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
>          return vu_set_mem_table_exec_postcopy(dev, vmsg);
>      }
> 
> -    DPRINT("Nregions: %d\n", memory->nregions);
> +    DPRINT("Nregions: %u\n", memory->nregions);
>      for (i = 0; i < dev->nregions; i++) {
>          void *mmap_addr;
>          VhostUserMemoryRegion *msg_region = &memory->regions[i];
> @@ -1049,8 +1049,8 @@ vu_set_vring_num_exec(VuDev *dev, VhostUserMsg *vmsg)
>      unsigned int index = vmsg->payload.state.index;
>      unsigned int num = vmsg->payload.state.num;
> 
> -    DPRINT("State.index: %d\n", index);
> -    DPRINT("State.num:   %d\n", num);
> +    DPRINT("State.index: %u\n", index);
> +    DPRINT("State.num:   %u\n", num);
>      dev->vq[index].vring.num = num;
> 
>      return false;
> @@ -1105,8 +1105,8 @@ vu_set_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
>      unsigned int index = vmsg->payload.state.index;
>      unsigned int num = vmsg->payload.state.num;
> 
> -    DPRINT("State.index: %d\n", index);
> -    DPRINT("State.num:   %d\n", num);
> +    DPRINT("State.index: %u\n", index);
> +    DPRINT("State.num:   %u\n", num);
>      dev->vq[index].shadow_avail_idx = dev->vq[index].last_avail_idx = num;
> 
>      return false;
> @@ -1117,7 +1117,7 @@ vu_get_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
>  {
>      unsigned int index = vmsg->payload.state.index;
> 
> -    DPRINT("State.index: %d\n", index);
> +    DPRINT("State.index: %u\n", index);
>      vmsg->payload.state.num = dev->vq[index].last_avail_idx;
>      vmsg->size = sizeof(vmsg->payload.state);
> 
> @@ -1478,8 +1478,8 @@ vu_set_vring_enable_exec(VuDev *dev, VhostUserMsg *vmsg)
>      unsigned int index = vmsg->payload.state.index;
>      unsigned int enable = vmsg->payload.state.num;
> 
> -    DPRINT("State.index: %d\n", index);
> -    DPRINT("State.enable:   %d\n", enable);
> +    DPRINT("State.index: %u\n", index);
> +    DPRINT("State.enable:   %u\n", enable);
> 
>      if (index >= dev->max_queues) {
>          vu_panic(dev, "Invalid vring_enable index: %u", index);
> @@ -1728,7 +1728,7 @@ vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
>          return false;
>      }
> 
> -    DPRINT("Got kick message: handler:%p idx:%d\n",
> +    DPRINT("Got kick message: handler:%p idx:%u\n",
>             dev->vq[index].handler, index);
> 
>      if (!dev->vq[index].started) {
> @@ -1772,7 +1772,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
>      DPRINT("Request: %s (%d)\n", vu_request_to_string(vmsg->request),
>             vmsg->request);
>      DPRINT("Flags:   0x%x\n", vmsg->flags);
> -    DPRINT("Size:    %d\n", vmsg->size);
> +    DPRINT("Size:    %u\n", vmsg->size);
> 
>      if (vmsg->fd_num) {
>          int i;
> 


