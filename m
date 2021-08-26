Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49233F8AD9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:18:54 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJH9Z-0004U9-Nm
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJH72-0002E4-54
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJH6z-00022u-Sn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629990972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bwo+0S1NcVAF9ZrLl/BcW3hjzdlfRVSzNYqk9R7vZjg=;
 b=VCByVeOwzFtTCQFaDYxASr0RQO+GOLM5+xUzEFkWCWzF/pO8fet3N2KArLdTJlFxMfMEdo
 YW2apO3jTT62PdmFrl2NQMCWldGHvcurTT4Z8vsdBUHowmjtRx++gbkub4xAbyGC6VHePP
 rVoBejnnFHDC4RXx0OSDDhFzWONkEb0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-zGY2wgmdNxOikwi9WZr3Gw-1; Thu, 26 Aug 2021 11:16:06 -0400
X-MC-Unique: zGY2wgmdNxOikwi9WZr3Gw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n10-20020a5d660a0000b02901551ef5616eso940306wru.20
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bwo+0S1NcVAF9ZrLl/BcW3hjzdlfRVSzNYqk9R7vZjg=;
 b=T6721dqiOsJm+HCwN0nGiwM70hJ7bEnULhLBIG4YEc5m021Gvb3DmlPEosheMMybSB
 4l5oLl2W3aFCfww5aDOKj35KcKx7ptmCgubbM6d6zQCrfHefpZ7fpMio59/6Hr58xEt4
 RH9bh0v2q5pI37ZZbkba79mUJT6KRs6ENvqwKs0uMYaxrey9OVsWQBykXt1wYmspE4mw
 NiUZJim35u/2eTrLzvXEppyged9LC+pAIxE6uu9Xng+2bc9elHPUBLTgBZk1Zlzy4IjE
 iV+khVqVzxpYrwtXEdTsWVo5lq9GQrmW6rFg+ZXoP3NAVFO5iCuj1rDxU7rRVY4J4jtH
 YEng==
X-Gm-Message-State: AOAM530hJieRXReMhdz+gYE1Fc2rM0EDP/f0g/5+VTC0yfHdXNHZXZ1s
 76MSIlXxP4UaQfTZfmxcQS55VSMOQTmA41bjOv77GEFbzUOvESN7dR9hzuUBHrmOGjMGWVwR6bE
 TizSlrZAcimQlP8g=
X-Received: by 2002:adf:dd81:: with SMTP id x1mr4660949wrl.362.1629990965024; 
 Thu, 26 Aug 2021 08:16:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdU3DCrHUpLJ5Yax2D3oGCI2nbSdzYBEhuQb5C4+2Ht9ge6+M2/VS2qVtfYxGTaQ2toCj0Xg==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr4660920wrl.362.1629990964821; 
 Thu, 26 Aug 2021 08:16:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j1sm4444479wrd.50.2021.08.26.08.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 08:16:04 -0700 (PDT)
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Jason Wang <jasowang@redhat.com>
References: <20210825224256.1750286-1-philmd@redhat.com>
 <CACGkMEv5qiA7D2LphdzvEZDE+bgiPHsyX++R21xNYtJA_e+AVQ@mail.gmail.com>
 <6824eed8-30e6-dbbf-4a4f-92e394c5430c@redhat.com>
Message-ID: <ff371c04-555b-1a73-a82f-e3b7ddc3bc64@redhat.com>
Date: Thu, 26 Aug 2021 17:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6824eed8-30e6-dbbf-4a4f-92e394c5430c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 10:40 AM, Philippe Mathieu-Daudé wrote:
> On 8/26/21 5:28 AM, Jason Wang wrote:
>> On Thu, Aug 26, 2021 at 6:43 AM Philippe Mathieu-Daudé
>> <philmd@redhat.com> wrote:
>>>
>>> When a ring queue size is modified, we need to call
>>> virtio_queue_update_rings() to re-init the memory region
>>> caches. Otherwise the region might have outdated memory
>>> size, and later load/store access might trigger an
>>> assertion, such:
>>>
>>>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
>>>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>>>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>>>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>>>   (gdb) bt
>>>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>>>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
>>>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
>>>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
>>>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
>>>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
>>>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>>>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>>>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
>>>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>>>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
>>>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
>>>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
>>>
>>> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
>>> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
>>> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  hw/virtio/virtio.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>> index 874377f37a7..04ffe5f420e 100644
>>> --- a/hw/virtio/virtio.c
>>> +++ b/hw/virtio/virtio.c
>>> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>>>          return;
>>>      }
>>>      vdev->vq[n].vring.num = num;
>>> +    virtio_queue_update_rings(vdev, n);
>>>  }
>>>
>>
>> Spec said:
>>
>> "
>> The driver MUST configure the other virtqueue fields before enabling
>> the virtqueue with queue_enable.
>> "
>>
>> So I think we should forbid the num to be changed if the virtqueue is ready?

What about virtio_queue_set_addr() and virtio_queue_set_align()?


