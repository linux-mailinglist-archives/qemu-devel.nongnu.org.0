Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728FB488C40
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 21:22:51 +0100 (CET)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6eiI-0001Zk-33
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 15:22:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6egz-0000sf-LX
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:21:29 -0500
Received: from mailout06.t-online.de ([194.25.134.19]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6egx-0007mT-Bp
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:21:29 -0500
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout06.t-online.de (Postfix) with SMTP id E9BD68D1B;
 Sun,  9 Jan 2022 21:19:20 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n6eeu-07oWAr0; Sun, 9 Jan 2022 21:19:20 +0100
Message-ID: <a3a11d6e-82d1-826b-a20c-aaa8a1158a36@t-online.de>
Date: Sun, 9 Jan 2022 21:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PULL v3 12/55] virtio-pci: add support for configure interrupt
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
 <20220108003423.15830-13-mst@redhat.com>
 <2ebfb2e7-bd51-d5ee-7e17-7cec59a0f0d5@t-online.de>
 <20220109110613-mutt-send-email-mst@kernel.org>
 <75f376c9-e1bb-297e-50f1-0934b8cae022@t-online.de>
 <20220109125933-mutt-send-email-mst@kernel.org>
 <cc038d5f-fad4-3640-3703-00fbe896a7c1@t-online.de>
In-Reply-To: <cc038d5f-fad4-3640-3703-00fbe896a7c1@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641759560-0000B8A1-86449BDB/0/0 CLEAN NORMAL
X-TOI-MSGID: 1e677587-7c34-483c-ac2e-eb2f647d8a7e
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.01.22 um 19:54 schrieb Volker Rümelin:
> Am 09.01.22 um 19:01 schrieb Michael S. Tsirkin:
>> On Sun, Jan 09, 2022 at 06:52:28PM +0100, Volker Rümelin wrote:
>>> Am 09.01.22 um 17:11 schrieb Michael S. Tsirkin:
>>>> On Sun, Jan 09, 2022 at 07:17:30AM +0100, Volker Rümelin wrote:
>>>>> Hi,
>>>>>
>>>>>> From: Cindy Lu <lulu@redhat.com>
>>>>>>
>>>>>> Add support for configure interrupt, The process is used 
>>>>>> kvm_irqfd_assign
>>>>>> to set the gsi to kernel. When the configure notifier was signal by
>>>>>> host, qemu will inject a msix interrupt to guest
>>>>>>
>>>>>> Signed-off-by: Cindy Lu <lulu@redhat.com>
>>>>>> Message-Id: <20211104164827.21911-11-lulu@redhat.com>
>>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>> ---
>>>>>>     hw/virtio/virtio-pci.h |  4 +-
>>>>>>     hw/virtio/virtio-pci.c | 92 
>>>>>> ++++++++++++++++++++++++++++++++++++------
>>>>>>     2 files changed, 83 insertions(+), 13 deletions(-)
>>>>>>
>>>>> Since this commit I see the following warnings.
>>>>>
>>>>> With -drive
>>>>> if=virtio,id=disk1,file=/srv/cdimg/Linux/images/opensuse.qcow2,discard=unmap 
>>>>>
>>>>>
>>>>> qemu-system-x86_64: virtio-blk failed to set guest notifier (-16), 
>>>>> ensure
>>>>> -accel kvm is set.
>>>>> qemu-system-x86_64: virtio_bus_start_ioeventfd: failed. Fallback to
>>>>> userspace (slower).
>>>>>
>>>>> With libvirt
>>>>>       <controller type='pci' index='1' model='pcie-root-port'>
>>>>>         <address type='pci' domain='0x0000' bus='0x00' slot='0x1c'
>>>>> function='0'
>>>>>          multifunction='on'/>
>>>>>       </controller>
>>>>>       <controller type='pci' index='2' model='pcie-root-port'>
>>>>>         <address type='pci' domain='0x0000' bus='0x00' slot='0x1c'
>>>>> function='1'/>
>>>>>       </controller>
>>>>>       <controller type='scsi' index='0' model='virtio-scsi'>
>>>>>         <driver queues='4'/>
>>>>>         <address type='pci' domain='0x0000' bus='0x01' slot='0x00'
>>>>> function='0'/>
>>>>>       </controller>
>>>>>       <disk type='block' device='disk'>
>>>>>         <driver name='qemu' type='raw' cache='none' discard='unmap'
>>>>> io='io_uring'/>
>>>>>         <source dev='/dev/vgtmp/lnxpowerm1'/>
>>>>>         <target dev='sda' bus='scsi'/>
>>>>>         <address type='drive' controller='0' bus='0' unit='0'/>
>>>>>         <boot order='1'/>
>>>>>       </disk>
>>>>>
>>>>> 2022-01-08T17:45:26.911491Z qemu-system-x86_64: virtio-scsi: 
>>>>> Failed to set
>>>>> guest notifiers (-16), ensure -accel kvm is set.
>>>>> 2022-01-08T17:45:26.911505Z qemu-system-x86_64: 
>>>>> virtio_bus_start_ioeventfd:
>>>>> failed. Fallback to userspace (slower).
>>>>>
>>>>> The messages appear around the time the Linux guest initializes 
>>>>> the drivers.
>>>>>
>>>>> With best regards,
>>>>> Volker
>>>> I guess it's a host that has an oldish kernel?
>>> It's an openSUSE 5.3.18 frankenstein kernel.
>>>
>>>> Does the following help?
>>>>
>>> No.
>>>
>>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>>> index 98fb5493ae..b77cd69f97 100644
>>>> --- a/hw/virtio/virtio-pci.c
>>>> +++ b/hw/virtio/virtio-pci.c
>>>> @@ -1130,15 +1130,15 @@ static int 
>>>> virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>>>>                proxy->vector_irqfd =
>>>>                    g_malloc0(sizeof(*proxy->vector_irqfd) *
>>>> msix_nr_vectors_allocated(&proxy->pci_dev));
>>>> +            r = kvm_virtio_pci_vector_config_use(proxy);
>>>> +            if (r < 0) {
>>>> +                goto config_error;
>>>> +            }
>>>>                r = kvm_virtio_pci_vector_use(proxy, nvqs);
>>>>                if (r < 0) {
>>>>                    goto config_assign_error;
>>>>                }
>>>>            }
>>>> -        r = kvm_virtio_pci_vector_config_use(proxy);
>>>> -        if (r < 0) {
>>>> -            goto config_error;
>>>> -        }
>>>>            r = msix_set_vector_notifiers(&proxy->pci_dev, 
>>>> virtio_pci_vector_unmask,
>>>> virtio_pci_vector_mask,
>>>> virtio_pci_vector_poll);
>>> With and without this patch msix_set_vector_notifiers() returns -16.
>>
>> EBUSY
>>
>> strace? did a syscall return this?
>
> I hope I got that right. I used
>
> strace ./qemu-system-x86_64 ... 2>strace.txt
>
> There is no EBUSY in strace.txt.
>
> I will sprinkle a few fprintfs to find the first function returning -16.
>

This is the call sequence:

virtio_pci_set_guest_notifiers: call msix_set_vector_notifiers()
msix_set_vector_notifiers: call msix_set_notifier_for_vector(dev, 0);
msix_set_notifier_for_vector: call msix_vector_use_notifier(dev, 0, msg);
virtio_pci_vector_unmask: call virtio_pci_one_vector_unmask(proxy, 
VIRTIO_CONFIG_IRQ_IDX, 0, msg, n)
virtio_pci_one_vector_unmask: call kvm_irqchip_update_msi_route()
kvm_irqchip_update_msi_route ret 0
virtio_pci_one_vector_unmask: call kvm_virtio_pci_irqfd_use(proxy, n, 0)
kvm_irqchip_assign_irqfd: call kvm_vm_ioctl(s, KVM_IRQFD, &irqfd)
kvm_vm_ioctl ret 0
kvm_virtio_pci_irqfd_use ret 0
virtio_pci_one_vector_unmask ret 0
msix_vector_use_notifier ret 0
msix_set_notifier_for_vector ret 0
msix_set_vector_notifiers: call msix_set_notifier_for_vector(dev, 1);
msix_set_notifier_for_vector: call msix_vector_use_notifier(dev, 1, msg);
virtio_pci_vector_unmask: call virtio_pci_one_vector_unmask(proxy, 0, 1, 
msg, n)
virtio_pci_one_vector_unmask: call kvm_irqchip_update_msi_route()
kvm_irqchip_update_msi_route ret 0
virtio_pci_one_vector_unmask: call kvm_virtio_pci_irqfd_use(proxy, n, 1)
kvm_irqchip_assign_irqfd: call kvm_vm_ioctl(s, KVM_IRQFD, &irqfd)
kvm_vm_ioctl ret 0
kvm_virtio_pci_irqfd_use ret 0
virtio_pci_one_vector_unmask ret 0
virtio_pci_vector_unmask: call virtio_pci_one_vector_unmask(proxy, 
VIRTIO_CONFIG_IRQ_IDX, 1, msg, n)
virtio_pci_one_vector_unmask: call kvm_irqchip_update_msi_route()
kvm_irqchip_update_msi_route ret 0
virtio_pci_one_vector_unmask: call kvm_virtio_pci_irqfd_use(proxy, n, 1)
kvm_irqchip_assign_irqfd: call kvm_vm_ioctl(s, KVM_IRQFD, &irqfd)
kvm_vm_ioctl ret -16
kvm_virtio_pci_irqfd_use ret -16
virtio_pci_one_vector_unmask ret -16
kvm_irqchip_assign_irqfd: call kvm_vm_ioctl(s, KVM_IRQFD, &irqfd)
kvm_vm_ioctl ret 0
kvm_irqchip_assign_irqfd: call kvm_vm_ioctl(s, KVM_IRQFD, &irqfd)
kvm_vm_ioctl ret 0
msix_vector_use_notifier ret -16
msix_set_notifier_for_vector ret -16
kvm_irqchip_assign_irqfd: call kvm_vm_ioctl(s, KVM_IRQFD, &irqfd)
kvm_vm_ioctl ret 0
msix_set_vector_notifiers r -16
qemu-system-x86_64: virtio-blk failed to set guest notifier (-16), 
ensure -accel kvm is set.
qemu-system-x86_64: virtio_bus_start_ioeventfd: failed. Fallback to 
userspace (slower).

>>
>>>> @@ -1155,7 +1155,9 @@ notifiers_error:
>>>>            kvm_virtio_pci_vector_release(proxy, nvqs);
>>>>        }
>>>>    config_error:
>>>> -    kvm_virtio_pci_vector_config_release(proxy);
>>>> +    if (with_irqfd) {
>>>> +        kvm_virtio_pci_vector_config_release(proxy);
>>>> +    }
>>>>    config_assign_error:
>>>>        virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, 
>>>> !assign,
>>>>                                      with_irqfd);
>


