Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5355249F7D3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:05:55 +0100 (CET)
Received: from localhost ([::1]:36276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDP4j-0002Ul-Tb
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nDP1l-0001lU-Mv; Fri, 28 Jan 2022 06:02:49 -0500
Received: from [2607:f8b0:4864:20::229] (port=35810
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nDP1j-0004pQ-76; Fri, 28 Jan 2022 06:02:49 -0500
Received: by mail-oi1-x229.google.com with SMTP id s127so11657075oig.2;
 Fri, 28 Jan 2022 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vEduIIupQEuNAs65nK9c26h2XmNBu/h6oUA2dog4/ik=;
 b=VqPvpwNTkx8ftzHeRsxfL0q1Q5aQ5sx+xObRyACzFl0yZhGnV5A8PSpwwFD9Mp4z5M
 d8qD9HOxJ0M7Fwp+Y4u8teoE2aiblexkB+2qD8YoBUZ0NhjC+3nPlrPUbWXH7LEtfrxD
 sOnfisZtc0SrIbsBCg2i9OS0THosi3sbsEs/MNfZ6Og8dNGE6y91w4+E/S7nHsOTo2x1
 6MRf5UMaEpzMDNpUBHQfiTqZ5YTyGyBGf1Zx1i5lXASniu7mI5d/87sWqrxY+QQDw6gT
 bG8+zQWYyCrVsoFiGesVvEyAu+/+OTG+UMqe86L2vnVDx0l3Qc8mof+PR6fhViomWJA0
 aBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vEduIIupQEuNAs65nK9c26h2XmNBu/h6oUA2dog4/ik=;
 b=M4PKIdb2+oMFHDJfcP5yPvZQ7pSXsrZmmoDjw5Nk1ZUzpTK5P1GR7fN6rdcqQCA122
 hAiNoGEnqiM85iO6L/LZSi8XlScN5Aw0mw/2zQd5BsBMnzsULTocgOJD2qZ6hrl3+4xn
 y2oqMDj0CQrL2O/GgZFEPG0P78CJnfqjLvpv2nXkS05YBeslIGn1BoSiVSc/56m0R1GX
 C7Ds8mSv7pra00AFpcpey3LJMnjLMqU8AiJeSu5eN0iLKfRvszPnFUoPn+62avWIMsq7
 Y2ZLA76u4fa/WdrEVfcy511iNNVIZOV9ZYA4ury3tmd0aCfGkrsWyzTaATuYAFobR9Wp
 lkPw==
X-Gm-Message-State: AOAM532NnFD/NJW8VmLkCB+jNcJAEalLCCksIyWNxQjc/5xOHNKwXYoT
 2CP6/12rlUAE2RVbd6ekubY=
X-Google-Smtp-Source: ABdhPJySMteg3U3E31iUTlJnhQzw8E+Blt8PCigbFbXp0BuFXvQ5rvzIloOpz1TSGFjp9IwZ9Y5Rvw==
X-Received: by 2002:a05:6808:1413:: with SMTP id
 w19mr4808837oiv.176.1643367765508; 
 Fri, 28 Jan 2022 03:02:45 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id r13sm314581otk.68.2022.01.28.03.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 03:02:45 -0800 (PST)
Message-ID: <cbac9c93-0d4a-1914-3c9d-203b1472056c@gmail.com>
Date: Fri, 28 Jan 2022 08:02:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
 <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
 <20220128032911.440323f1.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220128032911.440323f1.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 23:29, Halil Pasic wrote:
> On Thu, 27 Jan 2022 18:34:23 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> On 1/27/22 10:28, Halil Pasic wrote:
>>> ping^2
>>>
>>> Also adding Brijesh and Daniel, as I believe you guys should be
>>> interested in this, and I'm yet to receive review.
>>>
>>> @Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
>>> too, and that the fix works for your platforms as well?
>>
>> I failed to find a host that has Power secure execution support. I'll keep looking.
>>
>>
>> Meanwhile I have to mention that this patch re-introduced the problem that Kevin's
>> commit fixed.

[...]

>>
>> I made a little experiment with upstream and reverting Kevin's patch and the result is
>> the same, meaning that this is the original bug [1] Kevin fixed back then. Note that [1]
>> was reported on x86, meaning that this particular issue seems to be arch agnostic.
> 
> We don't have this problem on s390, so it ain't entirely arch agnostic.

It is arch agnostic in a way that it relies on iommu_platform support being true to this
specific device (vhost-user-fs-pci) instead of some particularity of the machine.

> 
>>
>>
>> My point here is that your patch fixes the situation for s390x, and Brijesh already chimed
>> in claiming that it fixed for AMD SEV, but it reintroduced a bug. I believe you should
>> include this test case with vhost-user in your testing to figure out a way to fix what
>> is needed without adding this particular regression.
> 
> Can you help me with this? IMHO the big problem is that iommu_platform
> is used for two distinct things. I've described that in the commit
> message.
> 
> We may be able to differentiate between the two using ->dma_as, but for
> that it needs to be set up correctly: whenever you require translation
> it should be something different than address_space_memory. The question
> is why do you require translation but don't have your ->dma_as set up
> properly? It can be a guest thing, i.e. guest just assumes it has to do
> bus addresses, while it actually does not have to, or we indeed do have
> an IOMMU which polices the devices access to the guest memory, but for
> some strange reason we failed to set up ->dma_as to reflect that.


I have 2 suggestions. First is to separate how we interpret iommu_platform. I find it
hard to do this properly without creating a new flag/command line option.


My second suggestion is, well .... I think it's proved that s390x-PV and AMD SEV are
being impacted (and probably Power secure guests as well), so why not check for
confidential guest support to skip that check entirely? Something like this patch:


diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d23db98c56..4305fdd1b7 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -29,6 +29,7 @@
  #include "hw/virtio/virtio-bus.h"
  #include "hw/virtio/virtio.h"
  #include "exec/address-spaces.h"
+#include "hw/boards.h"
  
  /* #define DEBUG_VIRTIO_BUS */
  
@@ -42,6 +43,7 @@ do { printf("virtio_bus: " fmt , ## __VA_ARGS__); } while (0)
  /* A VirtIODevice is being plugged */
  void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
  {
+    MachineState *machine = MACHINE(qdev_get_machine());
      DeviceState *qdev = DEVICE(vdev);
      BusState *qbus = BUS(qdev_get_parent_bus(qdev));
      VirtioBusState *bus = VIRTIO_BUS(qbus);
@@ -69,7 +71,18 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
          return;
      }
  
-    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
+    /*
+     * Confidential guest technologies such as AMD SEV and s390x-PV relies
+     * on device/hypervisor offering _F_ACCESS_PLATFORM so the guest grants
+     * access to the portions of memory the device needs to see. For these
+     * guests, _F_ACCESS_PLATFORM is about the restricted access to memory,
+     * but not about infering whether iommu_platform is supported in the
+     * device.
+     *
+     * Skip this check for these guests by checking machine->cgs.
+     */
+    if (!machine->cgs && has_iommu &&
+        !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
          error_setg(errp, "iommu_platform=true is not supported by the device");
          return;
      }
-- 
2.34.1


This will not break anything for non-secure guests and, granted that machine->cgs is already
set at this point, this will fix the problem for s390x-PV and AMD SEV. And we won't have to
dive deep into a virtio-bus feature negotiation saga because of something that can be easily
handled for machine->cgs guests only.

If this patch works for you and Brijesh I believe this is a good option.



Thanks,


Daniel



> 
> @Michael: what is your opinion?
> 
>>
>>
>> In fact, I have a feeling that this is not the first time this kind of situation is discussed
>> around here. This reminds me of [2] and a discussion about the order virtiofs features
>> are negotiated versus when/how QEMU inits the devices.
>>
>>
>>
>> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1935019
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05644.html
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>> Regards,
>>> Halil
>>>
>>> On Tue, 25 Jan 2022 11:21:12 +0100
>>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>>    
>>>> ping
>>>>
>>>> On Mon, 17 Jan 2022 13:02:38 +0100
>>>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>>>   
>>>>> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>>>>> unsupported") claims to fail the device hotplug when iommu_platform
>>>>> is requested, but not supported by the (vhost) device. On the first
>>>>> glance the condition for detecting that situation looks perfect, but
>>>>> because a certain peculiarity of virtio_platform it ain't.
>>>>>
>>>>> In fact the aforementioned commit introduces a regression. It breaks
>>>>> virtio-fs support for Secure Execution, and most likely also for AMD SEV
>>>>> or any other confidential guest scenario that relies encrypted guest
>>>>> memory.  The same also applies to any other vhost device that does not
>>>>> support _F_ACCESS_PLATFORM.
>>>>>
>>>>> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
>>>>> "device can not access all of the guest RAM" and "iova != gpa, thus
>>>>> device needs to translate iova".
>>>>>
>>>>> Confidential guest technologies currently rely on the device/hypervisor
>>>>> offering _F_ACCESS_PLATFORM, so that, after the feature has been
>>>>> negotiated, the guest  grants access to the portions of memory the
>>>>> device needs to see. So in for confidential guests, generally,
>>>>> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
>>>>> about the addresses used being something else than guest physical
>>>>> addresses.
>>>>>
>>>>> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
>>>>> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
>>>>> form the vhost device that does not need it, because on the vhost
>>>>> interface it only means "I/O address translation is needed".
>>>>>
>>>>> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
>>>>> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
>>>>> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
>>>>> by the device, and thus no device capability is needed. In this
>>>>> situation claiming that the device does not support iommu_plattform=on
>>>>> is counter-productive. So let us stop doing that!
>>>>>
>>>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>>>>> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
>>>>> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
>>>>> unsupported")
>>>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>>>> Cc: qemu-stable@nongnu.org
>>>>>
>>>>> ---
>>>>>
>>>>> v1->v2:
>>>>> * Commit message tweaks. Most notably fixed commit SHA (Michael)
>>>>>
>>>>> ---
>>>>>    hw/virtio/virtio-bus.c | 11 ++++++-----
>>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>>>> index d23db98c56..c1578f3de2 100644
>>>>> --- a/hw/virtio/virtio-bus.c
>>>>> +++ b/hw/virtio/virtio-bus.c
>>>>> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>>>            return;
>>>>>        }
>>>>>    
>>>>> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>>>> -        error_setg(errp, "iommu_platform=true is not supported by the device");
>>>>> -        return;
>>>>> -    }
>>>>> -
>>>>>        if (klass->device_plugged != NULL) {
>>>>>            klass->device_plugged(qbus->parent, &local_err);
>>>>>        }
>>>>> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>>>>        } else {
>>>>>            vdev->dma_as = &address_space_memory;
>>>>>        }
>>>>> +
>>>>> +    if (has_iommu && vdev->dma_as != &address_space_memory
>>>>> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>>>> +        error_setg(errp, "iommu_platform=true is not supported by the device");
>>>>> +        return;
>>>>> +    }
>>>>>    }
>>>>>    
>>>>>    /* Reset the virtio_bus */
>>>>>
>>>>> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
>>>>   
>>>
>>>    
>>
> 

