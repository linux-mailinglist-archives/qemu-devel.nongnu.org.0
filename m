Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EB38F2EE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:26:38 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFHi-0008LJ-0I
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llFDD-0004Sx-QH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llFD7-0004Vs-6w
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ii24BMP6tWejj+P9otVvphHlufBSu/IdvSc5cseUuA=;
 b=Yw2+BOfI/2dChOZ7lXoRsxGBxgxdciXrOyQ7AtBWdRwOxKq3haAomXIEzYZyrbO4ib77Hj
 Y4Cf49MhVwBsmEvKT5LwYeqImzikmQ07O8FYMX7VYIPiZ8KsJnWEFNKomqcsXo0LjgpYyj
 xVkmUXRUqQ0rQv7FvPlezE9LXaA1qbo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-fCqSoV6XMuuOtWa3WWb8UQ-1; Mon, 24 May 2021 14:21:50 -0400
X-MC-Unique: fCqSoV6XMuuOtWa3WWb8UQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso13444001wrc.23
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ii24BMP6tWejj+P9otVvphHlufBSu/IdvSc5cseUuA=;
 b=L5SHussjTVPhW8p+8KaVIhsYVxykv0YMXpLuYds+A+aVqLgml3U0HSPb6btalZQ80c
 DzvF799SqaRrCpOfqHgjdawEgyF+DZjEcJn33kGjPSLHve8wdn4mRZAyadZwkUcIQ7Ay
 ChzF+0Ta29SYp7sRyUV6uIARZaDmV6aj6PcjaFAxJueuEIuN7nAJH7rrpP59wKXBrpL5
 fQYW7FYEP7364iBOX6t2CmjsoaapQvhw26q89U4KloDbUlvLdzNek0u0qun/BeBAURQZ
 4iMi1Xi4+Qd3V5+0bDIGUg7ioWKu7uguwgaWikpMhGTzb7mJ+Bxg197tRkX6DJ9fmVyK
 xG2w==
X-Gm-Message-State: AOAM530Uv61/OeOtxJh/YG/oiM5WcYD+Ikua8ERM94/AjL8KwALQiIor
 AKWxnWzofIlATJ1ZAEo7K2DQss7RwM4vN+jHuBd44q9qVlVIMcw522pibvGjg9XERamGuAWVARt
 F8BnJqvu5/l6RvHE=
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr22601703wri.327.1621880509661; 
 Mon, 24 May 2021 11:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtJG1xX9fOaJ6VfhP26hsjeyrJk7Rgd7bCgIGPeJ5LLsMw0hkRK0ina8CN/wzrmCJO5kEgzw==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr22601686wri.327.1621880509465; 
 Mon, 24 May 2021 11:21:49 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z6sm8768869wml.29.2021.05.24.11.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 11:21:49 -0700 (PDT)
Subject: Re: [PATCH] hw/virtio: Have virtio_bus_get_vdev_bad_features() return
 64-bit value
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210520102822.2471710-1-philmd@redhat.com>
 <20210523040632-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71329505-7dd7-506f-be64-c366ab6931b6@redhat.com>
Date: Mon, 24 May 2021 20:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523040632-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Frederic Konrad <konrad@adacore.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/21 10:07 AM, Michael S. Tsirkin wrote:
> On Thu, May 20, 2021 at 12:28:22PM +0200, Philippe Mathieu-Daudé wrote:
>> In commit 019a3edbb25 ("virtio: make features 64bit wide") we
>> increased the 'features' field to 64-bit, but forgot to update
>> the virtio_bus_get_vdev_bad_features() helper. The 'bad features'
>> are truncated to 32-bit. The virtio_net_bad_features() handler
>> from the virtio-net devices is potentially affected.
> 
> I'm fine with increasing it for consistency, but bad features
> are all legacy things aren't they? So there isn't a functional
> issue ... or did I miss anything?

Are you saying all bad legacy features are < 32-bit and there is no
potential problem?

> 
>>
>> Have the virtio_bus_get_vdev_bad_features() helper return the
>> full 64-bit value.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: 019a3edbb25 ("virtio: make features 64bit wide")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/virtio/virtio-bus.h | 2 +-
>>  hw/virtio/virtio-bus.c         | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
>> index ef8abe49c5a..f9955ff577a 100644
>> --- a/include/hw/virtio/virtio-bus.h
>> +++ b/include/hw/virtio/virtio-bus.h
>> @@ -122,7 +122,7 @@ uint16_t virtio_bus_get_vdev_id(VirtioBusState *bus);
>>  /* Get the config_len field of the plugged device. */
>>  size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus);
>>  /* Get bad features of the plugged device. */
>> -uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
>> +uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
>>  /* Get config of the plugged device. */
>>  void virtio_bus_get_vdev_config(VirtioBusState *bus, uint8_t *config);
>>  /* Set config of the plugged device. */
>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>> index 859978d2487..25a2b68a234 100644
>> --- a/hw/virtio/virtio-bus.c
>> +++ b/hw/virtio/virtio-bus.c
>> @@ -134,7 +134,7 @@ size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus)
>>  }
>>  
>>  /* Get bad features of the plugged device. */
>> -uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
>> +uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
>>  {
>>      VirtIODevice *vdev = virtio_bus_get_device(bus);
>>      VirtioDeviceClass *k;
>> -- 
>> 2.26.3
> 


