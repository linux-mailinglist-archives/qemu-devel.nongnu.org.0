Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91733A4E0
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 13:51:41 +0100 (CET)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLQDc-0006MX-3i
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 08:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lLQCo-0005qt-RJ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:50:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lLQCm-0003jA-KK
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:50:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e10so7251854wro.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cyberhaven.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qS0ijlSyP5k2ULFA9RBS3wpmfBqmsBrLCjIrseR8SZA=;
 b=MezIcxb8lQRE6oe4Wf8DtmmVwJ2Go565EucQLi96xJUsvxYG+0LtgHXm0K0Owu0KDO
 RaDoxRk/nwr3RmZ2ctTnlr9Gw0l/zwPuQcnJLCYczlPDo9uwbpy/iQ5F9zNi1Y/SpEgN
 m2uG2xOmmd/KWs7lCLH2Tvnt+7ldAxrJorpOD0x7pB8X++Kbh0UT9cGV5aN8CtLj2iz2
 S9g80iCDyGKKbMAtsCvUOcgqnhqOe5vhjbUYF9j94gkNbUnBE2X4ixBBGpadE9T2xHO3
 IYKYJ9/m8XHonA6uAVFBdtUBfn3e8eBELFR+kmk+Pbye35INQBd+/VnbJvlsSVcpz3gm
 9Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qS0ijlSyP5k2ULFA9RBS3wpmfBqmsBrLCjIrseR8SZA=;
 b=Q5WXTXBjiTheS0NPTCUIRMgB8wN79DEp0q44Lr/95rUJtFHVwDVH8EkJrbheNSXopF
 oNllZBpG/j/cuEJlGpSVWm1QnxNcp2D5oNdmYx3TYq+rAPKHvzjPwkcgGyx6MZvb1Rey
 UvOV/SENlSI9r6XGyhD+ndRgUly97xxmD0UCXzVVN0RbT9acSHUYqbU7SGI8UmTqQ68J
 v14dBS+7kw8OIvIkBJtPf4GaqW7P8TM//8F9e+22p8oXqaLbTlk8fDDhqwZz+logp527
 EYNnDuQ7lPThADXv49/FnYqdtVe0JeTIk9nDeYHXg+n5iLx4uZsb5zmJQirnOA+Nw3G+
 PMRA==
X-Gm-Message-State: AOAM530aksfD8lnDZjOxZymUoLUE/KzJZUPcrR6JaWVUqIlalqCm+TVC
 H4nFSFOGqmBoBb2puR6QpJcJZw==
X-Google-Smtp-Source: ABdhPJyGjISrMhlKOWeJHorVSuLWcWjvwZ7up9/B49bUuiwbp/yZzwGcpM+R7NLoKPb4o8QA1sQ4nw==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr23190911wrx.243.1615726246800; 
 Sun, 14 Mar 2021 05:50:46 -0700 (PDT)
Received: from [192.168.252.28] (bbcs-71-51.pub.wingo.ch. [144.2.71.51])
 by smtp.gmail.com with ESMTPSA id d16sm15011287wrx.79.2021.03.14.05.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 05:50:46 -0700 (PDT)
Subject: Re: [PATCH] hw/display/virtio-vga: made vga memory size configurable
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210314122314.3201195-1-vitaly@cyberhaven.com>
 <21f7c376-931-b050-3d4a-aaedff26e78c@eik.bme.hu>
From: Vitaly Chipounov <vitaly@cyberhaven.com>
Message-ID: <fc7868a0-d279-e7c3-8e5c-46294168c581@cyberhaven.com>
Date: Sun, 14 Mar 2021 13:50:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <21f7c376-931-b050-3d4a-aaedff26e78c@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=vitaly@cyberhaven.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, it's a typo in the commit message, sorry.

Vitaly

On 3/14/21 1:45 PM, BALATON Zoltan wrote:
> On Sun, 14 Mar 2021, vitaly@cyberhaven.com wrote:
>> From: Vitaly Chipounov <vitaly@cyberhaven.com>
>>
>> This enables higher resolutions. The default is still 8MB for
>> backwards compatibility with existing snapshots.
>>
>> The property name "vgamem_fb" is similar to that of the other
>
> Isn't that vgamem_mb? Code has that so it's just a typo in commit 
> message.
>
> Regards,
> BALATON Zoltan
>
>> graphic adapters.
>>
>> seabios/vgasrc/svgamodes.c needs to be updated as well.
>> For example, adding the following line would expose
>> a 3840x2160 resolution to the guest.
>>
>> { 0x199, { MM_DIRECT, 3840, 2160, 32, 8, 16, SEG_GRAPH } },
>>
>> Signed-off-by: Vitaly Chipounov <vitaly@cyberhaven.com>
>> ---
>> hw/display/virtio-vga.c | 3 ++-
>> hw/virtio/virtio-pci.h  | 2 ++
>> 2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
>> index d3c6404061..657fafc48f 100644
>> --- a/hw/display/virtio-vga.c
>> +++ b/hw/display/virtio-vga.c
>> @@ -118,7 +118,7 @@ static void 
>> virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>     int i;
>>
>>     /* init vga compat bits */
>> -    vga->vram_size_mb = 8;
>> +    vga->vram_size_mb = vpci_dev->vgamem_size_mb;
>>     vga_common_init(vga, OBJECT(vpci_dev));
>>     vga_init(vga, OBJECT(vpci_dev), 
>> pci_address_space(&vpci_dev->pci_dev),
>>              pci_address_space_io(&vpci_dev->pci_dev), true);
>> @@ -204,6 +204,7 @@ static void virtio_vga_set_big_endian_fb(Object 
>> *obj, bool value, Error **errp)
>>
>> static Property virtio_vga_base_properties[] = {
>>     DEFINE_VIRTIO_GPU_PCI_PROPERTIES(VirtIOPCIProxy),
>> +    DEFINE_PROP_UINT32("vgamem_mb", VirtIOPCIProxy, vgamem_size_mb, 8),
>>     DEFINE_PROP_END_OF_LIST(),
>> };
>>
>> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
>> index d7d5d403a9..8684311a8d 100644
>> --- a/hw/virtio/virtio-pci.h
>> +++ b/hw/virtio/virtio-pci.h
>> @@ -151,6 +151,8 @@ struct VirtIOPCIProxy {
>>     VirtIOIRQFD *vector_irqfd;
>>     int nvqs_with_notifiers;
>>     VirtioBusState bus;
>> +
>> +    uint32_t vgamem_size_mb;
>> };
>>
>> static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
>>

