Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2737602B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 08:18:59 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1letpC-0000v3-KD
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 02:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1leto4-0000U7-3T
 for qemu-devel@nongnu.org; Fri, 07 May 2021 02:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1leto0-000733-9c
 for qemu-devel@nongnu.org; Fri, 07 May 2021 02:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620368262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pDjDDZMOUNrZd7P9egvIhsLB7uiANhOkGNXhcLPSdk=;
 b=BueMmBoNi5w+otGAgTBOG0dhY5Jt/Rn/vhiwKl6akSxPrfAyBvGnrsC03UbGExlwkG/d6I
 0CJweSzf2WMhH8r4X68bkO4O3DXqRZ6HXoYdXscbTMMxQkAjHfndQT1Ep9b4zblGN6ZYfN
 TQKNZ9HvTTPJo5vz52CsW9PDJA2xK8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-znqrez-EMZ68PDuQvvJIaw-1; Fri, 07 May 2021 02:17:40 -0400
X-MC-Unique: znqrez-EMZ68PDuQvvJIaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A2761242
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 06:17:39 +0000 (UTC)
Received: from [10.36.114.90] (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0CE63B8C;
 Fri,  7 May 2021 06:17:33 +0000 (UTC)
Subject: Re: [PATCH] scripts: add a script to list virtio devices in a system
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210506193341.140141-1-lvivier@redhat.com>
 <6b7500f7-2e24-6da1-028e-d7e77ca17f27@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <51a6753f-2d98-2aee-4d88-0c49e87e0cea@redhat.com>
Date: Fri, 7 May 2021 08:17:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6b7500f7-2e24-6da1-028e-d7e77ca17f27@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/05/2021 21:50, Philippe Mathieu-Daudé wrote:
> On 5/6/21 9:33 PM, Laurent Vivier wrote:
>> Add "lsvirtio" that lists all virtio devices in a system
>> the same way lspci does for the PCI cards.
>>
>> For instance:
>>
>>  $ ./lsvirtio
>>  0000:01:00.0 virtio0 Red Hat, Inc. (PCI) Virtio Network Card
>> 	 Subsystem: virtio
>> 	 Modalias: virtio:d00000001v00001AF4
> 
> "ModAlias" maybe?
> 
>> 	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
>> 	 Feature: CSUM
>> 	 Feature: GUEST_CSUM
>> 	 Feature: CTRL_GUEST_OFFLOADS
>> 	 Feature: MAC
>> 	 Feature: GUEST_TSO4
>> 	 Feature: GUEST_TSO6
>> 	 Feature: GUEST_ECN
>> 	 Feature: GUEST_UFO
>> 	 Feature: HOST_TSO4
>> 	 Feature: HOST_TSO6
>> 	 Feature: HOST_ECN
>> 	 Feature: HOST_UFO
>> 	 Feature: MRG_RXBUF
>> 	 Feature: STATUS
>> 	 Feature: CTRL_VQ
>> 	 Feature: CTRL_RX
>> 	 Feature: CTRL_VLAN
>> 	 Feature: GUEST_ANNOUNCE
>> 	 Feature: CTRL_MAC_ADDR
>> 	 Feature: RING_INDIRECT_DESC
>> 	 Feature: RING_EVENT_IDX
>> 	 Feature: VERSION_1
>> 	 Kernel driver in use: virtio_net
>>          Interfaces: enp1s0
>>
>>  0000:03:00.0 virtio1 Red Hat, Inc. (PCI) Virtio Console
>> 	 Subsystem: virtio
>> 	 Modalias: virtio:d00000003v00001AF4
>> 	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
>> 	 Feature: MULTIPORT
>> 	 Feature: RING_INDIRECT_DESC
>> 	 Feature: RING_EVENT_IDX
>> 	 Feature: VERSION_1
>> 	 Kernel driver in use: virtio_console
>>          Interfaces: vport1p1
>>  ...
>>
>> This is useful to have the list of virtio devices when they are not
>> mapped by a PCI card:
>>
>>  $ ./lsvirtio
>>  virtio-mmio.121 virtio0 Virt (MMIO) Virtio 9P transport
>> 	 Subsystem: virtio
>> 	 Modalias: virtio:d00000009v554D4551
>> 	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
>> 	 Feature: MOUNT_TAG
>> 	 Feature: RING_INDIRECT_DESC
>> 	 Feature: RING_EVENT_IDX
>> 	 Feature: VERSION_1
>> 	 Kernel driver in use: 9pnet_virtio
>>          Interfaces: home0
>>
>>  virtio-mmio.122 virtio1 Virt (MMIO) Virtio GPU Device
>> 	 Subsystem: virtio
>> 	 Modalias: virtio:d00000010v554D4551
>> 	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
>> 	 Feature: EDID
>> 	 Feature: RING_INDIRECT_DESC
>> 	 Feature: RING_EVENT_IDX
>> 	 Feature: VERSION_1
>> 	 Kernel driver in use: virtio_gpu
>>          Interfaces: fb0
>>  ...
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  scripts/lsvirtio | 317 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 317 insertions(+)
>>  create mode 100755 scripts/lsvirtio
> 
> Can you add an entry for the file in MAINTAINERS?

Yes, but where?

It would go under virtio section, but I'm not sure Michael wants to maintain it.

Perhaps "Python scripts" section?

> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks,
Laurent


