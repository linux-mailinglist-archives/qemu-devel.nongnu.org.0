Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A34F49ED7C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:37:17 +0100 (CET)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCSC-0005sr-5x
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nDCPY-0004OD-3b; Thu, 27 Jan 2022 16:34:32 -0500
Received: from [2607:f8b0:4864:20::22d] (port=34460
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nDCPV-0002Uu-QD; Thu, 27 Jan 2022 16:34:31 -0500
Received: by mail-oi1-x22d.google.com with SMTP id b186so2329773oif.1;
 Thu, 27 Jan 2022 13:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6bbAIqQ3XYJf69QBHUc/tWKGKhVQIT2gR/aqDdSBCyg=;
 b=J3vuXXTW3QqvX46sx3quA3MV/F+TC6ANGAS3XY1byFW0RfJhN6zuWpI8Q0s7Yf1zHQ
 T+sAdBZ9Ep2S4U+dsJoHg9m/nf98QMkXAIJ+ZnydNRm70IrlSHt4nU9EXI/Vfiv3iKyh
 jy3aseMjQSexXHHCseQ+IKhnw4I31PxIjV4vRmEEHDLWrhTbdAHFRBLv0slC8bqtWGN9
 H5xk9JfB2JUwyBmHeBYLH7kEUCsrc4nQjO/oH3/u2jERgC/JLk8DQTzq8vdA9yuNc6kG
 CwdOulFOqE2mKPZMPqoySCRfulGOnSDixmPfi5rBQFGnRksXk+cBy4p4uD6WUai7UedD
 eDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6bbAIqQ3XYJf69QBHUc/tWKGKhVQIT2gR/aqDdSBCyg=;
 b=50O0z2JkYk45uz/J18DPfpW2W+skbuKhUv7vJJqAMYjvhVJt2g8cxuSQ2BajvwCweq
 HZJR7C+zK3n/lnb+cBZl7cU8aVk7ye5xahyy5VkCDTgxxgm3CURgVBNp6wIS5xm3e+1a
 JYVQakE93jDWoWvp2xrWrGuIlnbZc2f6LkbnFpaFy9L5wE3nbL4bTUoecEB3JO8esrMp
 dZKVi6TJ3JPfU6D+Vjao9upq1FE7KuJ7ckitY/msI2ooQPTkhy/4K4VFz9Ae6z3yIlOv
 rWsz2H1d22ZH0TNz+EK4qwinT+ljNphO7oIYUYLle5EJ0vzTT8pCLe5rgi9v5qG4gvU9
 REog==
X-Gm-Message-State: AOAM532Gr307FdpSFEn31HJjVtkatPIUOXlY6GXpbiObX4UJSyqgjvqr
 mFtos3YvdWGxndRwx4ZQtVE=
X-Google-Smtp-Source: ABdhPJxOWRm+Jt5TPsnxDmW5EoFbWCfVAO7xPcSWR1WUQRfv8gprICDCCSblCI4MWixQx6w/YV5SGg==
X-Received: by 2002:a05:6808:200d:: with SMTP id
 q13mr8157216oiw.37.1643319268150; 
 Thu, 27 Jan 2022 13:34:28 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id u25sm11050886oth.56.2022.01.27.13.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 13:34:27 -0800 (PST)
Message-ID: <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
Date: Thu, 27 Jan 2022 18:34:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 qemu-devel@nongnu.org
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220127142800.11d8f1be.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 10:28, Halil Pasic wrote:
> ping^2
> 
> Also adding Brijesh and Daniel, as I believe you guys should be
> interested in this, and I'm yet to receive review.
> 
> @Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
> too, and that the fix works for your platforms as well?

I failed to find a host that has Power secure execution support. I'll keep looking.


Meanwhile I have to mention that this patch re-introduced the problem that Kevin's
commit fixed.


With current upstream, if you start a regular guest with the following command line:

qemu-system-ppc64 (....)
-chardev socket,id=char0,path=/tmp/vhostqemu
-device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on

i.e. a guest with a vhost-user-fs-pci device that claims to have iommu support,
but it doesn't, this is the error message:


qemu-system-ppc64: -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on: iommu_platform=true is not supported by the device


With this patch, that command line above starts the guest. virtiofsd fails during boot:

sudo ~/qemu/build/tools/virtiofsd/virtiofsd --socket-path=/tmp/vhostqemu -o source=~/linux-L1
[sudo] password for danielhb:
virtio_session_mount: Waiting for vhost-user socket connection...
virtio_session_mount: Received vhost-user socket connection
virtio_loop: Entry
fv_panic: libvhost-user: Invalid vring_addr message


And inside the guest, if you attempt to mount and use the virtiofs filesystem, the guest
hangs:

[root@localhost ~]# mount -t virtiofs myfs /mnt
[root@localhost ~]# cd /mnt

(hangs)

Exiting QEMU throws several vhost related errors:


QEMU 6.2.50 monitor - type 'help' for more information
(qemu) quit
qemu-system-ppc64: Failed to set msg fds.
qemu-system-ppc64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-ppc64: Failed to set msg fds.
qemu-system-ppc64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-ppc64: Failed to set msg fds.
qemu-system-ppc64: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-ppc64: Failed to set msg fds.
qemu-system-ppc64: vhost_set_vring_call failed: Invalid argument (22)



I made a little experiment with upstream and reverting Kevin's patch and the result is
the same, meaning that this is the original bug [1] Kevin fixed back then. Note that [1]
was reported on x86, meaning that this particular issue seems to be arch agnostic.


My point here is that your patch fixes the situation for s390x, and Brijesh already chimed
in claiming that it fixed for AMD SEV, but it reintroduced a bug. I believe you should
include this test case with vhost-user in your testing to figure out a way to fix what
is needed without adding this particular regression.


In fact, I have a feeling that this is not the first time this kind of situation is discussed
around here. This reminds me of [2] and a discussion about the order virtiofs features
are negotiated versus when/how QEMU inits the devices.



[1] https://bugzilla.redhat.com/show_bug.cgi?id=1935019
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05644.html


Thanks,


Daniel


> 
> Regards,
> Halil
> 
> On Tue, 25 Jan 2022 11:21:12 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> ping
>>
>> On Mon, 17 Jan 2022 13:02:38 +0100
>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>
>>> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>>> unsupported") claims to fail the device hotplug when iommu_platform
>>> is requested, but not supported by the (vhost) device. On the first
>>> glance the condition for detecting that situation looks perfect, but
>>> because a certain peculiarity of virtio_platform it ain't.
>>>
>>> In fact the aforementioned commit introduces a regression. It breaks
>>> virtio-fs support for Secure Execution, and most likely also for AMD SEV
>>> or any other confidential guest scenario that relies encrypted guest
>>> memory.  The same also applies to any other vhost device that does not
>>> support _F_ACCESS_PLATFORM.
>>>
>>> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
>>> "device can not access all of the guest RAM" and "iova != gpa, thus
>>> device needs to translate iova".
>>>
>>> Confidential guest technologies currently rely on the device/hypervisor
>>> offering _F_ACCESS_PLATFORM, so that, after the feature has been
>>> negotiated, the guest  grants access to the portions of memory the
>>> device needs to see. So in for confidential guests, generally,
>>> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
>>> about the addresses used being something else than guest physical
>>> addresses.
>>>
>>> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
>>> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
>>> form the vhost device that does not need it, because on the vhost
>>> interface it only means "I/O address translation is needed".
>>>
>>> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
>>> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
>>> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
>>> by the device, and thus no device capability is needed. In this
>>> situation claiming that the device does not support iommu_plattform=on
>>> is counter-productive. So let us stop doing that!
>>>
>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>>> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
>>> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>>> unsupported")
>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>> Cc: qemu-stable@nongnu.org
>>>
>>> ---
>>>
>>> v1->v2:
>>> * Commit message tweaks. Most notably fixed commit SHA (Michael)
>>>
>>> ---
>>>   hw/virtio/virtio-bus.c | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>> index d23db98c56..c1578f3de2 100644
>>> --- a/hw/virtio/virtio-bus.c
>>> +++ b/hw/virtio/virtio-bus.c
>>> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>           return;
>>>       }
>>>   
>>> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>> -        error_setg(errp, "iommu_platform=true is not supported by the device");
>>> -        return;
>>> -    }
>>> -
>>>       if (klass->device_plugged != NULL) {
>>>           klass->device_plugged(qbus->parent, &local_err);
>>>       }
>>> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>       } else {
>>>           vdev->dma_as = &address_space_memory;
>>>       }
>>> +
>>> +    if (has_iommu && vdev->dma_as != &address_space_memory
>>> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>> +        error_setg(errp, "iommu_platform=true is not supported by the device");
>>> +        return;
>>> +    }
>>>   }
>>>   
>>>   /* Reset the virtio_bus */
>>>
>>> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
>>
> 
> 

