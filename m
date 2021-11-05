Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7204463A3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 13:49:50 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miyfF-0000zU-Lx
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 08:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1miydN-0007Tx-0c
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1miydJ-0002ZF-0M
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636116467;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoSM/62d82M77mRNIO4+H6iltV2oGoSzDR/YF/qDEKM=;
 b=dozrKP7qUoFNJwr8ClBAI+goWmKg5wuRD22DC79/IStppwb6+vfZ5MxjjsDNQIy4mPjmGe
 c2XGykbDWr33qgPz0agHVdI1ELaOYqL4xqm42aJXjEeKKuxJx3lJIoz2OeBY2r8hedAprM
 P6DZ/sstwkibTsMZ4O0qtvGylwuUVOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-Pe4h1IQINVK3hDhcEDbj7Q-1; Fri, 05 Nov 2021 08:47:46 -0400
X-MC-Unique: Pe4h1IQINVK3hDhcEDbj7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FEBD879500;
 Fri,  5 Nov 2021 12:47:45 +0000 (UTC)
Received: from [10.64.54.99] (vpn2-54-99.bne.redhat.com [10.64.54.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E3A5F4ED;
 Fri,  5 Nov 2021 12:47:41 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
To: Andrew Jones <drjones@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
Date: Fri, 5 Nov 2021 23:47:37 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211102073948.am3p3hcqqd3cfvru@gator.home>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew and Igor,

On 11/2/21 6:39 PM, Andrew Jones wrote:
> On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:
>>
>> Yeah, I agree. I don't have strong sense to expose these empty nodes
>> for now. Please ignore the patch.
>>
> 
> So were describing empty numa nodes on the command line ever a reasonable
> thing to do? What happens on x86 machine types when describing empty numa
> nodes? I'm starting to think that the solution all along was just to
> error out when a numa node has memory size = 0...
> 

Sorry for the delay as I spent a few days looking into linux virtio-mem
driver. I'm afraid we still need this patch for ARM64. I don't think x86
has this issue even though I didn't experiment on X86. For example, I
have the following command lines. The hot added memory is put into node#0
instead of node#2, which is wrong.

There are several bitmaps tracking the node states in Linux kernel. One of
them is @possible_map, which tracks the nodes available, but don't have to
be online. @passible_map is sorted out from the following ACPI table.

   ACPI_SRAT_TYPE_MEMORY_AFFINITY
   ACPI_SRAT_TYPE_GENERIC_AFFINITY
   ACPI_SIG_SLIT                          # if it exists when optional distance map
                                          # is provided on QEMU side.

Note: Drew might ask why we have node#2 in "/sys/devices/system/node" again.
hw/arm/virt-acpi-build.c::build_srat() creates additional node in ACPI SRAT
table and the node's PXM is 3 ((ms->numa_state->num_nodes - 1)) in this case,
but linux kernel assigns node#2 to it.

   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
   -accel kvm -machine virt,gic-version=host               \
   -cpu host -smp 4,sockets=2,cores=2,threads=1            \
   -m 1024M,slots=16,maxmem=64G                            \
   -object memory-backend-ram,id=mem0,size=512M            \
   -object memory-backend-ram,id=mem1,size=512M            \
   -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
   -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
   -numa node,nodeid=2 -numa node,nodeid=3                 \
   -object memory-backend-ram,id=vmem0,size=512M           \
   -device virtio-mem-pci,id=vm0,memdev=vmem0,node=2,requested-size=0 \
   -object memory-backend-ram,id=vmem1,size=512M           \
   -device virtio-mem-pci,id=vm1,memdev=vmem1,node=3,requested-size=0
      :
   # ls  /sys/devices/system/node | grep node
   node0
   node1
   node2
   # cat /proc/meminfo | grep MemTotal\:
   MemTotal:        1003104 kB
   # cat /sys/devices/system/node/node0/meminfo | grep MemTotal\:
   Node 0 MemTotal: 524288 kB

   (qemu) qom-set vm0 requested-size 512M
   # cat /proc/meminfo | grep MemTotal\:
   MemTotal:        1527392 kB
   # cat /sys/devices/system/node/node0/meminfo | grep MemTotal\:
   Node 0 MemTotal: 1013652 kB

Try above test after the patch is applied. The hot added memory is
put into node#2 correctly as the user expected.

   # ls  /sys/devices/system/node | grep node
   node0
   node1
   node2
   node3
   # cat /proc/meminfo | grep MemTotal\:
   MemTotal:        1003100 kB
   # cat /sys/devices/system/node/node2/meminfo | grep MemTotal\:
   Node 2 MemTotal: 0 kB

   (qemu) qom-set vm0 requested-size 512M
   # cat /proc/meminfo | grep MemTotal\:
   MemTotal:        1527388 kB
   # cat /sys/devices/system/node/node2/meminfo | grep MemTotal\:
   Node 2 MemTotal: 524288 kB

Thanks,
Gavin


   


