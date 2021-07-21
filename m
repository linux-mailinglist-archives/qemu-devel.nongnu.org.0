Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36C3D1075
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:03:43 +0200 (CEST)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cp4-000081-EG
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6CnB-0007i2-UT
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6Cn9-0005E4-Rz
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626876103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1+IEZP3c40OeeWKhJ73EsCayG+jzSSBpfinIz9K6BM=;
 b=UqEPmeixWAYzR5hlJ2qfedn28eqUYiv5zl4IexflG1qIz2roZQ33ueF7H+74n+HN3vhHBO
 KLm3MwIxH6RdLAETE2fOEgnUgRtQzlrFiZlUN4v9+JPkW6pFTgL0SE9xrtuqiiyLthNYxL
 u6GgPUgQU8qt/QWNfStNfPHn8fTtByM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-x-X22h2sPhqpOsp5XW6Jbg-1; Wed, 21 Jul 2021 10:01:35 -0400
X-MC-Unique: x-X22h2sPhqpOsp5XW6Jbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so1090622wmc.6
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 07:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l1+IEZP3c40OeeWKhJ73EsCayG+jzSSBpfinIz9K6BM=;
 b=A0kEuPwaPf/nCYzkwjQPr41qUfcGlMOaM4gjR/npR/x9TOZ8HT3XBJh5UjCQ/kSXTO
 pLgDDrnQj8eMr6dpcxKE34xr9hgTPccz930/B1TSkPmqPIPnkN3cLjiBzzSZ3wJNFdTw
 NJnGmKyw6hFaeCeZY3KDvGjMICfTZ6Pi0XN6JF+16v2kwUleJFzk/FAID1uzwS8EtVDy
 9sdqpUCwsIpga0yiNLNtzVv4CKghmGJyeXxXTYgGGqZW2k5f0IxUcutocZ1cCXsGju4E
 bowtV/y3ssYtpjN8QSScC86OkOcJzgu9UaHtIUy1H6ZWRuLg2o1ngszf3s/7TpJUIqjt
 GJMA==
X-Gm-Message-State: AOAM5312C2nXryZSTSFdOLb6MQEoiEPEG6jwhMszy7h26LaeYt0udB73
 SkfFme9C6ajQ4I9ODBpoaEG9ils5AWegS8GxwaUKh4qWzdfiXgVngA9mIAVRD7VpVPjJ+9pdXVb
 kMXzEehnAZYMjPFQ=
X-Received: by 2002:a5d:55c1:: with SMTP id i1mr43343239wrw.77.1626876093563; 
 Wed, 21 Jul 2021 07:01:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyatzzrztQerkBPc29LO1DhIMzvyCyucXFlO72mhVQCSnL57Y2Utfm6BJPm7s6KPDw1hK3YKw==
X-Received: by 2002:a5d:55c1:: with SMTP id i1mr43343132wrw.77.1626876092952; 
 Wed, 21 Jul 2021 07:01:32 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f7sm43283wml.35.2021.07.21.07.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 07:01:32 -0700 (PDT)
Subject: Re: [PATCH v3] failover: unregister ROM on unplug
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20210721093955.225759-1-lvivier@redhat.com>
 <YPgAjFzE/hq+tSIS@work-vm> <87tukneqdi.fsf@secure.mitica>
 <YPgk/FqrhyLL42OT@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <494e9441-6c05-da11-93a6-c9359b54d865@redhat.com>
Date: Wed, 21 Jul 2021 16:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPgk/FqrhyLL42OT@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 3:45 PM, Dr. David Alan Gilbert wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>> * Laurent Vivier (lvivier@redhat.com) wrote:
>>>> The intend of failover is to allow to migrate a VM with a VFIO
>>>> networking card without disrupting the network operation by switching
>>>> to a virtio-net device during the migration.
>>>>
>>>> This simple change allows to test failover with a simulated device
>>>> like e1000e rather than a vfio device, even if it's useless in real
>>>> life it can help to debug failover.
>>>>
>>>> This is interesting to developers that want to test failover on
>>>> a system with no vfio device. Moreover it simplifies host networking
>>>> configuration as we can use the same bridge for virtio-net and
>>>> the other failover networking device.
>>>>
>>>> Without this change the migration of a system configured with failover
>>>> fails with:
>>>>
>>>>   ...
>>>>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>>>>   -device e1000,failover_pair_id=virtionet0,... \
>>>>   ...
>>>>
>>>>   (qemu) migrate ...
>>>>
>>>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>>>   error while loading state for instance 0x0 of device 'ram'
>>>>   load of migration failed: Invalid argument
>>>>
>>>> This happens because QEMU correctly unregisters the interface vmstate but
>>>> not the ROM one. This patch fixes that.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> ---
>>>>
>>>> Notes:
>>>>     v3:
>>>>       remove useless space before comma
>>>>     
>>>>     v2:
>>>>       reset has_rom to false
>>>>       update commit log message
>>>>
>>>>  hw/net/virtio-net.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index 16d20cdee52a..c0c2ec1ebb98 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -3256,6 +3256,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>>>>      if (migration_in_setup(s) && !should_be_hidden) {
>>>>          if (failover_unplug_primary(n, dev)) {
>>>>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>>>> +            if (PCI_DEVICE(dev)->has_rom) {
>>>> +                PCI_DEVICE(dev)->has_rom = false;
>>>> +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom, dev);
>>>> +            }
>>>
>>> Not actually originated by your fix, but....
>>>
>>> Why doesn't failover_replug_primary re-add the vmstates?
>>
>> Because we can't migrate until the "unplug" has happened.
>> Yes, it is a mess.
> 
> But if the migrate fails, shouldn't it add it back?
> 
> Dave
> 
>> I think this is the saner patch that I can think of for that
>> functionality.
>>
>> What I wonder is why we register rom as ram, but I guess that the rom
>> can be updated from userspace, or who knows.

Unlikely, and if we can, this is a bug.

We call memory_region_init_rom() in pci_add_option_rom().

 * memory_region_init_rom: Initialize a ROM memory region.
 *
 * This has the same effect as calling memory_region_init_ram()
 * and then marking the resulting region read-only with
 * memory_region_set_readonly(). This includes arranging for the
 * contents to be migrated.

I agree it would be clearer to have a vmstate_unregister_rom()
function internally calling vmstate_unregister_ram().

>>
>> Later, Juan.
>>
>>> (I did wonder if passing rom-file="" to the e1000 would help in your
>>> testing case, but it still creates the RAM image).
>>>
>>> Dave
>>>
>>>>              qapi_event_send_unplug_primary(dev->id);
>>>>              qatomic_set(&n->failover_primary_hidden, true);
>>>>          } else {
>>>> -- 
>>>> 2.31.1
>>>>
>>


