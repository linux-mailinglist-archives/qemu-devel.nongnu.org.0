Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A991DB538
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 15:38:52 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbOvr-0004qp-B5
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 09:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOqK-0003Wg-Sx
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:33:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59450
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOqJ-00036x-Dz
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/ZKLsj99u02rgMhqtwFWQu7Na4B+yLIprFNYclwbsE=;
 b=JjskdvTQhPdk46fK3X1ZkHf+CpuMWEmPILrz1XHVZOXga4QuiDjPKi8HQ0P0EROt57pRfk
 GLRxyFyp+n1dQUGvWATfXsj62VwTbEIK96CdG1MCW/1dirZ33IH9iR9MWmvS454oa2h+RF
 b/H9yp8LLLGhtQsthXEdXFKI69qrKAU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-e3Y20ZRfOlS2a3FuYvUhcQ-1; Wed, 20 May 2020 09:33:05 -0400
X-MC-Unique: e3Y20ZRfOlS2a3FuYvUhcQ-1
Received: by mail-wr1-f69.google.com with SMTP id c14so262147wrm.15
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 06:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/ZKLsj99u02rgMhqtwFWQu7Na4B+yLIprFNYclwbsE=;
 b=niFSdFvIrFeScujlzxi4atNqj1kIEl+rHIn0JvKJhX25mOpnw1k+qGGcEMmb/+RSC0
 bphGGM/ikGcslzhednX6HdGDowVoJP3ny1jpDetbhx4DfbmoWPWScy1FRkzaXI+W/iH9
 5jIBkmfrnxjq/13HqNSBb/sn6cbBx5d7nc7Rmj3230aWBet3sK/uZwLIIbY+nQlhRFzP
 ZpIO1puiUEpvJJJtF9pSuAav/RfxGLMKLGG4kq1YB/a67/HoOAGJS4Qhi38/MkhDliqE
 EXSH/thz0j9hfG5HNU2+NKhLVQvU8mOrqOxXzQLVFhbOqErghLevqw45f8oNqfH4ACTI
 /j/w==
X-Gm-Message-State: AOAM531rU7y3T1NobnvQmLPA3JCYPmRyyQZ04LbI7dWbDxdh1D0XHOWy
 mwYiOdgi4p0Ad8kgc08TfE2ZZbyBCA+BirQYespjZGTZQooVrDuwL7yzcIvi+3myrvfuWv+HXGM
 yzCSTBtzhyK9wo6U=
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4916719wmi.131.1589981584357; 
 Wed, 20 May 2020 06:33:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi5ufkd0Ah4hxZpUPPrPk1T4beaKo+JOy9uSBecePBF8o7Ket6rKMmZurvgmVicAN973OjWQ==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4916696wmi.131.1589981584107; 
 Wed, 20 May 2020 06:33:04 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b7sm3008486wmj.29.2020.05.20.06.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:33:03 -0700 (PDT)
Subject: Re: [PATCH v3 09/22] acpi: ged: rename event memory region
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9adbb53-4b3c-dec6-5738-ea972710665d@redhat.com>
Date: Wed, 20 May 2020 15:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-10-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> Rename memory region and callbacks and ops to carry "evt" in the name
> because a second region will be added shortly.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/hw/acpi/generic_event_device.h |  2 +-
>   hw/acpi/generic_event_device.c         | 16 ++++++++--------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 83917de02425..90a9180db572 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -86,7 +86,7 @@
>   #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>   
>   typedef struct GEDState {
> -    MemoryRegion io;
> +    MemoryRegion evt;
>       uint32_t     sel;
>   } GEDState;
>   
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index b1cbdd86b66c..1cb34111e59a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -142,7 +142,7 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>   }
>   
>   /* Memory read by the GED _EVT AML dynamic method */
> -static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
> +static uint64_t ged_evt_read(void *opaque, hwaddr addr, unsigned size)
>   {
>       uint64_t val = 0;
>       GEDState *ged_st = opaque;
> @@ -161,14 +161,14 @@ static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
>   }
>   
>   /* Nothing is expected to be written to the GED memory region */
> -static void ged_write(void *opaque, hwaddr addr, uint64_t data,
> -                      unsigned int size)
> +static void ged_evt_write(void *opaque, hwaddr addr, uint64_t data,
> +                          unsigned int size)
>   {
>   }
>   
> -static const MemoryRegionOps ged_ops = {
> -    .read = ged_read,
> -    .write = ged_write,
> +static const MemoryRegionOps ged_evt_ops = {
> +    .read = ged_evt_read,
> +    .write = ged_evt_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
> @@ -287,9 +287,9 @@ static void acpi_ged_initfn(Object *obj)
>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>       GEDState *ged_st = &s->ged_state;
>   
> -    memory_region_init_io(&ged_st->io, obj, &ged_ops, ged_st,
> +    memory_region_init_io(&ged_st->evt, obj, &ged_evt_ops, ged_st,
>                             TYPE_ACPI_GED, ACPI_GED_EVT_SEL_LEN);
> -    sysbus_init_mmio(sbd, &ged_st->io);
> +    sysbus_init_mmio(sbd, &ged_st->evt);
>   
>       sysbus_init_irq(sbd, &s->irq);
>   
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


