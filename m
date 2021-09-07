Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2E4021EA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:24:53 +0200 (CEST)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQn7-0008C7-3l
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQcy-0005lp-Pi
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:14:24 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mNQcw-0002Eh-FH
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 22:14:24 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H3TMX3yH9z1DGmg;
 Tue,  7 Sep 2021 10:13:28 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:14:18 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 10:14:17 +0800
Subject: Re: [PATCH 5/5] vfio: defer to commit kvm route in migraiton resume
 phase
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-6-longpeng2@huawei.com>
 <20210903155759.3a933fa7.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <95f40d4d-b900-441b-5582-613a2516bdfc@huawei.com>
Date: Tue, 7 Sep 2021 10:14:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210903155759.3a933fa7.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



ÔÚ 2021/9/4 5:57, Alex Williamson Ð´µÀ:
> On Wed, 25 Aug 2021 15:56:20 +0800
> "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
> 
>> In migration resume phase, all unmasked msix vectors need to be
>> setup when load the VF state. However, the setup operation would
>> takes longer if the VF has more unmasked vectors.
>>
>> In our case, the VF has 65 vectors and each one spend at most 0.8ms
>> on setup operation the total cost of the VF is about 8-58ms. For a
>> VM that has 8 VFs of this type, the total cost is more than 250ms.
>>
>> vfio_pci_load_config
>>   vfio_msix_enable
>>     msix_set_vector_notifiers
>>       for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>>         vfio_msix_vector_do_use
>>           vfio_add_kvm_msi_virq
>>             kvm_irqchip_commit_routes <-- expensive
>>       }
>>
>> We can reduce the cost by only commit once outside the loop. The
>> routes is cached in kvm_state, we commit them first and then bind
>> irqfd for each vector.
>>
>> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
>> we mesure the cost of the vfio_msix_enable for each one, and
>> we can see 90+% costs can be reduce.
>>
>>         Origin          Apply this patch
>>                         and vfio enable optimization
>> 1st     8               2
>> 2nd     15              2
>> 3rd     22              2
>> 4th     24              3
>> 5th     36              2
>> 6th     44              3
>> 7th     51              3
>> 8th     58              4
>> Total   258ms           21ms
> 
> Almost seems like we should have started here rather than much more
> subtle improvements from patch 3.
> 
>  
>> The optimition can be also applied to msi type.
>>
>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> ---
>>  hw/vfio/pci.c | 47 ++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 3ab67d6..50e7ec7 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -427,12 +427,17 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>          return;
>>      }
>>  
>> -    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev, false);
>> +    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev,
>> +                                     vdev->defer_add_virq);
> 
> See comment on previous patch about these bool function args.
> 
>>      if (virq < 0) {
>>          event_notifier_cleanup(&vector->kvm_interrupt);
>>          return;
>>      }
>>  
>> +    if (vdev->defer_add_virq) {
>> +        goto out;
>> +    }
> 
> See comment on previous patch about this goto flow.
> 
>> +
>>      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
>>                                         NULL, virq) < 0) {
>>          kvm_irqchip_release_virq(kvm_state, virq);
>> @@ -440,6 +445,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>          return;
>>      }
>>  
>> +out:
>>      vector->virq = virq;
>>  }
>>  
>> @@ -577,6 +583,36 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>>      }
>>  }
>>  
>> +static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
>> +{
>> +    int i;
>> +    VFIOMSIVector *vector;
>> +    bool commited = false;
>> +
>> +    for (i = 0; i < vdev->nr_vectors; i++) {
>> +        vector = &vdev->msi_vectors[i];
>> +
>> +        if (vector->virq < 0) {
>> +            continue;
>> +        }
>> +
>> +        /* Commit cached route entries to KVM core first if not yet */
>> +        if (!commited) {
>> +            kvm_irqchip_commit_routes(kvm_state);
>> +            commited = true;
>> +        }
> 
> Why is this in the loop, shouldn't we just start with:
> 

The kvm_irqchip_commit_routes won't be called if all of the vector->virq are -1
originally, so I just want to preserve the behavior here.

But it seems no any side effect if we call it directly, I'll take your advice in
the next version, thanks.

>     if (!vdev->nr_vectors) {
>         return;
>     }
> 
>     kvm_irqchip_commit_routes(kvm_state);
> 
>     for (...
> 
>> +
>> +        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
>> +                                               &vector->kvm_interrupt,
>> +                                               NULL, vector->virq) < 0) {
>> +            kvm_irqchip_release_virq(kvm_state, vector->virq);
>> +            event_notifier_cleanup(&vector->kvm_interrupt);
>> +            vector->virq = -1;
>> +            return;
>> +        }
> 
> And all the other vectors we've allocated?  Error logging?
> 

Oh, it's a bug, will fix.

>> +    }
>> +}
>> +
>>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>  {
>>      PCIDevice *pdev = &vdev->pdev;
>> @@ -624,6 +660,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>>      if (!pdev->msix_function_masked && vdev->defer_add_virq) {
>>          int ret;
>>          vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
>> +        vfio_commit_kvm_msi_virq(vdev);
>>          ret = vfio_enable_vectors(vdev, true);
>>          if (ret) {
>>              error_report("vfio: failed to enable vectors, %d", ret);
>> @@ -664,6 +701,10 @@ retry:
>>          vfio_add_kvm_msi_virq(vdev, vector, i, false);
>>      }
>>  
>> +    if (vdev->defer_add_virq){
>> +        vfio_commit_kvm_msi_virq(vdev);
>> +    }
> 
> Again, why is the load_config path unique, shouldn't we always batch on
> setup?
> 
>> +
>>      /* Set interrupt type prior to possible interrupts */
>>      vdev->interrupt = VFIO_INT_MSI;
>>  
>> @@ -2473,13 +2514,13 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>>      vfio_pci_write_config(pdev, PCI_COMMAND,
>>                            pci_get_word(pdev->config + PCI_COMMAND), 2);
>>  
>> +    vdev->defer_add_virq = true;
>>      if (msi_enabled(pdev)) {
>>          vfio_msi_enable(vdev);
>>      } else if (msix_enabled(pdev)) {
>> -        vdev->defer_add_virq = true;
>>          vfio_msix_enable(vdev);
>> -        vdev->defer_add_virq = false;
>>      }
>> +    vdev->defer_add_virq = false;
>>  
>>      return ret;
>>  }
> 
> .
> 

