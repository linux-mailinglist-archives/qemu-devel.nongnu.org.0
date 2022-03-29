Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46F4EB637
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 00:54:03 +0200 (CEST)
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZKiw-0002Wg-Do
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 18:54:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1nZHuo-0001o5-NA
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:54:07 -0400
Received: from buffalo.birch.relay.mailchannels.net ([23.83.209.24]:10793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1nZHum-0004Gu-LC
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:54:06 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 4F3906C10E2;
 Tue, 29 Mar 2022 19:53:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a244.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id D81FE6C1AD1;
 Tue, 29 Mar 2022 19:53:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1648583638; a=rsa-sha256;
 cv=none;
 b=OFITkfAoc5/sspkCiBJyeMCPKNmnQvhoOpOdiI+pzQ/WRSSXl7skW6T57uIy1qtIbFW+es
 vK+t27PELgmSFADO3WKDk5FcDFXiqzW8h9p9GcO66JiVzYPDTshmWzuf1FjfgVyIsX5+JK
 nM4/tJCITQbEtyErVN7cPd6VvFwDAVO3cXO6auLIbyvjglctfQLLbpxgL9zGvMAk8uC/NQ
 koOgOM9U2VxBHMjl4KuCZygj9bIBFu9TNAqodOVtgsitWUf+b5XObiK+LeEoAzT96IgDMv
 2thiaY0KauVOF75S1EOpWkUuQso0JLWvHVgV95iPuv9gFGulAxBfZBE5MZtnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1648583638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=MDoZ7VH1LJYaOluDPA0h2NMvTW9wZDbD1ftNVOvbwQc=;
 b=YHQ6v2zaK7Fa2nAs7NrV+xhwZD7hM82SeRB777wEfG6pMGqddUSbmCX6wb8WePXu9+qI43
 /Uty16bBJtkuya0XEBhLro7ku9i9MQ33UY2sGGDHWRoxdH2QUfP/LQEan7dvCjTQfXJqAN
 YsLD8EGDKT902XAfQ7flf2fVBLVEiW1nb8Y81s91o6B7mtDqwxvMu0Xn3ZJjRzxLJI62L/
 53gTH8GYYj6E6KpSpWl1R/enqhSBDyRiN2qKKYp96govyewiA+49TW/oaX6pHgjJVq9Gjx
 uLbmhE4cNZ7oLbLfIzVB4K5koGwu7uGox99/hOPPhU9XkfFgXkHWd0deAX1DyQ==
ARC-Authentication-Results: i=1; rspamd-5b56854b7c-qw747;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from pdx1-sub0-mail-a244.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.121.210.153 (trex/6.5.3); Tue, 29 Mar 2022 19:53:59 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Juvenile-Trade: 35a735e51efa4bdf_1648583638732_242768432
X-MC-Loop-Signature: 1648583638731:2972254907
X-MC-Ingress-Time: 1648583638731
Received: from offworld (unknown [104.36.25.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a244.dreamhost.com (Postfix) with ESMTPSA id 4KSgHQ5cRWz1fR; 
 Tue, 29 Mar 2022 12:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1648583637;
 bh=UXaOqDe1qTrs2ifIOTePvidBbHXFEN/hKuQHyrfotcA=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=qVGPudwKTQf2R8IW4T4kTW8xWDJePRxRsHAuX/H2Ux77qLeU9EA4noOGXMmcGY9Wq
 ksIblNwX+y+IJ33FhEG1pQ2/eNiqFv3rpr/P9QRskThiaKkzPAW5Hdd9gYa9nghq6Y
 Ri3Vjx4IFS2dhF73RuNhhFKPh52v/1cyx4t7VwqzFRpSaRlUm+2Efg4eYV6C6PIzGE
 rjwZUzno2A4hG/5f7EnwIM/MuGC/tLVvfuDcPtCHS/k/YS5deAICHwvn7VBEGk9htS
 na4HiEQT59jxmAF9cEw4dGdtsgseTi9vitn0dc6pl10lbYW7EDO3Lzx/a02l4YE3ha
 D4PDQkuGWipfQ==
Date: Tue, 29 Mar 2022 12:53:51 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Adam Manzanares <a.manzanares@samsung.com>
Subject: Re: [PATCH v8 04/46] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20220329195351.mzlbgxu2riscdb22@offworld>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-5-Jonathan.Cameron@huawei.com>
 <CGME20220329181401uscas1p2b229afdbb479a012e140f84367c35ccd@uscas1p2.samsung.com>
 <20220329181353.GA59203@bgt-140510-bm01>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220329181353.GA59203@bgt-140510-bm01>
User-Agent: NeoMutt/20201120
Received-SPF: pass client-ip=23.83.209.24; envelope-from=dave@stgolabs.net;
 helo=buffalo.birch.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Mar 2022 18:52:26 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Tong Zhang <t.zhang2@samsung.com>,
 Chris Browy <cbrowy@avery-design.com>, Saransh Gupta1 <saransh@ibm.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Peter Xu <peterx@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex =?utf-8?B?QmVubsOvwr/CvWU=?= <alex.bennee@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 Philippe =?utf-8?B?TWF0aGlldS1EYXVkw6/Cv8K9?= <f4bug@amsat.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022, Adam Manzanares wrote:
>> +typedef struct cxl_device_state {
>> +    MemoryRegion device_registers;
>> +
>> +    /* mmio for device capabilities array - 8.2.8.2 */
>> +    MemoryRegion device;
>> +    MemoryRegion caps;
>> +
>> +    /* mmio for the mailbox registers 8.2.8.4 */
>> +    MemoryRegion mailbox;
>> +
>> +    /* memory region for persistent memory, HDM */
>> +    uint64_t pmem_size;
>
>Can we switch this to mem_size and drop the persistent comment? It is my
>understanding that HDM is independent of persistence.

Agreed, but ideally both volatile and persistent capacities would have been
supported in this patchset. I'm also probably missing specific reasons as to
why this isn't the case.

Looking at it briefly could it be just a matter of adding to cxl_type3_dev
a new hostmem along with it's AddressSpace for the volatile? If so, I'm
thinking something along these lines:

@@ -123,8 +123,8 @@ typedef struct cxl_device_state {
	 uint64_t host_set;
      } timestamp;

-    /* memory region for persistent memory, HDM */
-    uint64_t pmem_size;
+    /* memory region for persistent and volatile memory, HDM */
+    uint64_t pmem_size, mem_size;
  } CXLDeviceState;

  /* Initialize the register block for a device */
@@ -235,9 +235,9 @@ typedef struct cxl_type3_dev {
      PCIDevice parent_obj;

      /* Properties */
-    AddressSpace hostmem_as;
+    AddressSpace hostmem_as, hostmemv_as;
      uint64_t size;
-    HostMemoryBackend *hostmem;
+    HostMemoryBackend *hostmem, *hostmemv;
      HostMemoryBackend *lsa;
      uint64_t sn;

Then for cxl_setup_memory(), with ct3d->hostmem and/or ct3d->hostmemv
non-nil, set the respective MemoryRegions:

+    if (ct3d->hostmem) {
+            memory_region_set_nonvolatile(mr, true);
+            memory_region_set_enabled(mr, true);
+            host_memory_backend_set_mapped(ct3d->hostmem, true);
+            address_space_init(&ct3d->hostmem_as, mr, name);
+            ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
+    }
+    if (ct3d->hostmemv) {
+            memory_region_set_nonvolatile(mrv, false);
+            memory_region_set_enabled(mrv, true);
+            host_memory_backend_set_mapped(ct3d->hostmemv, true);
+            address_space_init(&ct3d->hostmem_as, mrv, name);
+            ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
+    }

For corresponding MB commands, it's mostly IDENTIFY_MEMORY_DEVICE that needs
updating:

@@ -281,7 +281,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,

      CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
      CXLType3Class *cvc = CXL_TYPE3_DEV_GET_CLASS(ct3d);
-    uint64_t size = cxl_dstate->pmem_size;
+    uint64_t size = cxl_dstate->pmem_size + cxl_dstate->mem_size;

      if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
	 return CXL_MBOX_INTERNAL_ERROR;
@@ -290,11 +290,11 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
      id = (void *)cmd->payload;
      memset(id, 0, sizeof(*id));

-    /* PMEM only */
      snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);

      id->total_capacity = size / (256 << 20);
-    id->persistent_capacity = size / (256 << 20);
+    id->persistent_capacity = cxl_dstate->pmem_size / (256 << 20);
+    id->volatile_capacity = cxl_dstate->mem_size / (256 << 20);
      id->lsa_size = cvc->get_lsa_size(ct3d);

      *len = sizeof(*id);
@@ -312,16 +312,16 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
	 uint64_t next_pmem;
      } QEMU_PACKED *part_info = (void *)cmd->payload;
      QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
-    uint64_t size = cxl_dstate->pmem_size;
+    uint64_t psize = cxl_dstate->pmem_size;
+    uint64_t vsize = cxl_dstate->mem_size;

-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if (!QEMU_IS_ALIGNED(psize + vsize, 256 << 20)) {
	 return CXL_MBOX_INTERNAL_ERROR;
      }

-    /* PMEM only */
-    part_info->active_vmem = 0;
-    part_info->next_vmem = 0;
-    part_info->active_pmem = size / (256 << 20);
+    part_info->active_vmem = vsize / (256 << 20);
+    part_info->next_vmem = part_info->active_vmem;
+    part_info->active_pmem = psize / (256 << 20);
      part_info->next_pmem = part_info->active_pmem;

Then for reads/writes, both cxl_type3_write() and _read() would, after computing the dpa_offset,
first try the volatile region then upon error attempt the same in the persistent memory - this
assuming the DPA space is consistent among both types of memory. Ie:

address_space_read(&ct3d->hostmemv_as, dpa_offset, attrs, data, size)
or
address_space_read(&ct3d->hostmem_as, dpa_offset, attrs, data, size)

... but then again all this is probably just wishful thinking.

Thanks,
Davidlohr

