Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874C3F83E1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 10:42:48 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJAyF-0008RB-0d
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 04:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJAwY-000733-Nq
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 04:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJAwU-0007Fl-Pv
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 04:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629967256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R24vFnkGkeb3UrlS06slb+CN5ohRSpiRo6WqQGLlR/A=;
 b=S72Y4gG/epTx3/VVDhdiuBeN8spr3aomW2qlv5aKxc+tYH4oXF6VYAdEdvCVrZLVpAtGXI
 wcy5AISttcGXY5pHVrf/aPUFJevV3B47kiGowaCvJ7ha0CC7jHAPxhI8li0dQzhXS1GkSs
 NCfh7LNVdH2cRDG2YacT1E0Gy4vZh6M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-5XO50trSOZ6HaXdAV4CZcA-1; Thu, 26 Aug 2021 04:40:52 -0400
X-MC-Unique: 5XO50trSOZ6HaXdAV4CZcA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so4034486wmd.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 01:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R24vFnkGkeb3UrlS06slb+CN5ohRSpiRo6WqQGLlR/A=;
 b=GeemJdnGfVXKurPc6JH30K+mVllKiVekJy+fF1ftA+nVOPYxWcXhDzW89AjUMQUxDo
 EUmi8bPW0IXe3MdiMAFgfU8UTL284ggKqfDl8x6XYBqROR0hzJuE1JFci9NtiLekEMv5
 9DKK40dM6fA1oSd64jmzH3PwEIs7aC5m8N/MYep832XIvgCcBxn1BVx6Btc1lxFipElv
 NBkMgqqHL+Z5YsK5A/2SwobijSZtjXQsnY7uyciXP9lxpfoqDoAPeKJljoqJYUuqpmgA
 ik27B7KQ7YPMDoPAmKl+5zBP7AVVrH4AcDY4px+r1UCtsVxRzQ6DTdLCxg2MErdDIeZA
 Ff8g==
X-Gm-Message-State: AOAM532on6HktJ37yoUC33P+mYHidTbN0/ROHAfSiHmG2BtjMqsNX4Dv
 QQ5vkv0qVVfCsxIiI9P/KR3O85D/vTFHukbcbLbZpOCnr40ASt1uSjZ9llmUjv+wZagcosL0znm
 WbXDAA8jA1dvujKM=
X-Received: by 2002:a7b:c847:: with SMTP id c7mr2515272wml.1.1629967249361;
 Thu, 26 Aug 2021 01:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0QXe34ABhBHK/upXt8k/pUom5ZnBnA0pHPGI1CVp5sElhIOWjugkuGAIYU8i97+oduk1xHA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr2515250wml.1.1629967249106;
 Thu, 26 Aug 2021 01:40:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b2sm2014305wmd.3.2021.08.26.01.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 01:40:48 -0700 (PDT)
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
To: Jason Wang <jasowang@redhat.com>
References: <20210825224256.1750286-1-philmd@redhat.com>
 <CACGkMEv5qiA7D2LphdzvEZDE+bgiPHsyX++R21xNYtJA_e+AVQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6824eed8-30e6-dbbf-4a4f-92e394c5430c@redhat.com>
Date: Thu, 26 Aug 2021 10:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACGkMEv5qiA7D2LphdzvEZDE+bgiPHsyX++R21xNYtJA_e+AVQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 8/26/21 5:28 AM, Jason Wang wrote:
> On Thu, Aug 26, 2021 at 6:43 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> When a ring queue size is modified, we need to call
>> virtio_queue_update_rings() to re-init the memory region
>> caches. Otherwise the region might have outdated memory
>> size, and later load/store access might trigger an
>> assertion, such:
>>
>>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
>>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>>   (gdb) bt
>>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
>>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
>>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
>>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
>>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
>>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
>>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
>>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
>>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
>>
>> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
>> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/virtio/virtio.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 874377f37a7..04ffe5f420e 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>>          return;
>>      }
>>      vdev->vq[n].vring.num = num;
>> +    virtio_queue_update_rings(vdev, n);
>>  }
>>
> 
> Spec said:
> 
> "
> The driver MUST configure the other virtqueue fields before enabling
> the virtqueue with queue_enable.
> "
> 
> So I think we should forbid the num to be changed if the virtqueue is ready?

Alright. virtio_pci_common_write() doesn't report errors although.


