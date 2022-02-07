Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CC4AC04F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:01:15 +0100 (CET)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4Zu-0003w8-HK
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:01:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nH4IM-0005yM-Eq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nH4IJ-0005ui-An
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644241368;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GctIYNpBcRz+M+Bh1AIN6DNAM0yGSVQpFxrkNqGo+f0=;
 b=MDmSJt59TJtLROTqIX9ytr37ihpoRqv6SR41eEdJDWRIbResoytCB8UDvkWJf6NDQbOHUq
 +XqEcJIWUgmKHodu2FUjFsHm9UFL61wSxK3iJTOwoJkvlL8D7AXRgxDMGmyAUfjkKLyfrg
 rZ/B0PtyQagYopiCMh6mm8EnYERSo5k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-xcJIjXzCNd-lL6R-oaiWLA-1; Mon, 07 Feb 2022 08:42:45 -0500
X-MC-Unique: xcJIjXzCNd-lL6R-oaiWLA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f26-20020a7bc8da000000b0037bd7f39dbbso95786wml.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 05:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GctIYNpBcRz+M+Bh1AIN6DNAM0yGSVQpFxrkNqGo+f0=;
 b=g18wiF4U+hl/dBl7U1K0x+b3Sq3F6VslrfQ1wdFC0EVpyUrRe+R88UM6NGYgIQWwyp
 UJkqnFT/V8HlBTCJ68hetARz0bUY7kqDIoWaM7e59JeX96qYwEbI5fzBVcJYtEdaK7SN
 ZjAVFKyegXLxHAUGQpNsvY6z03ngUaEhOtMZyUpSw9+IcYFG1X31BCHmSvZxlhsoohSz
 WAc83qK0iwzdmioZudLhrc0v6vG34zlzGo9/NlE3dG1rhkRk5Yxdom23ffu6LyAQP3He
 RoyQFMuxk5fdK7SY2464Otbr7I00uuzIVMrmtZvIZfmqoZiLhYPnlR6k6WvOXIRMS4Vp
 L1yA==
X-Gm-Message-State: AOAM533D9+vSI3gmflMWFR8DOisjf55hOyl6T1f1N/Fm4v5N7OV5uyDw
 H8E+SiyqymV2m2Zo8odoVm6aTvFuueNAlRLgJ87FGavi3xW1J5tdAvILbd34CgtfCow5STU09b7
 l27MyHOpCNczwls0=
X-Received: by 2002:a05:600c:4255:: with SMTP id
 r21mr7229159wmm.188.1644241364474; 
 Mon, 07 Feb 2022 05:42:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+BbAo2jxkvc8mHIEJZZ2wCYlXxYytC5h2B/sj4o+e0w8zd8JNBdrevUwOpcZ1eGEuLLqsBQ==
X-Received: by 2002:a05:600c:4255:: with SMTP id
 r21mr7229145wmm.188.1644241364215; 
 Mon, 07 Feb 2022 05:42:44 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id u7sm2228723wrq.112.2022.02.07.05.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 05:42:43 -0800 (PST)
Subject: Re: [PULL 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Igor Mammedov <imammedo@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <164392772418.1683127.9746374099330960813.stgit@omen>
 <20220204130846.31f5b396@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <23247634-a264-8ea2-9b9f-5708626578b3@redhat.com>
Date: Mon, 7 Feb 2022 14:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220204130846.31f5b396@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Juan Quintela <quintela@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 2/4/22 1:08 PM, Igor Mammedov wrote:
> On Thu, 03 Feb 2022 15:35:35 -0700
> Alex Williamson <alex.williamson@redhat.com> wrote:
>
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Representing the CRB cmd/response buffer as a standard
>> RAM region causes some trouble when the device is used
>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>> as usual RAM but this latter does not have a valid page
>> size alignment causing such an error report:
>> "vfio_listener_region_add received unaligned region".
>> To allow VFIO to detect that failing dma mapping
>> this region is not an issue, let's use a ram_device
>> memory region type instead.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Link: https://lore.kernel.org/r/20220120001242.230082-2-f4bug@amsat.org
>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>> ---
>>  hw/tpm/tpm_crb.c |   22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>> index 58ebd1469c35..be0884ea6031 100644
>> --- a/hw/tpm/tpm_crb.c
>> +++ b/hw/tpm/tpm_crb.c
>> @@ -25,6 +25,7 @@
>>  #include "sysemu/tpm_backend.h"
>>  #include "sysemu/tpm_util.h"
>>  #include "sysemu/reset.h"
>> +#include "exec/cpu-common.h"
>>  #include "tpm_prop.h"
>>  #include "tpm_ppi.h"
>>  #include "trace.h"
>> @@ -43,6 +44,7 @@ struct CRBState {
>>  
>>      bool ppi_enabled;
>>      TPMPPI ppi;
>> +    uint8_t *crb_cmd_buf;
>>  };
>>  typedef struct CRBState CRBState;
>>  
>> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>  
>> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
>> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>> +
>>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>>          "tpm-crb-mmio", sizeof(s->regs));
>> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
>> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
>> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
>> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
> Does it need a compat knob for the case of migrating to older QEMU/machine type,
> not to end-up with target aborting migration when it sees unknown section.

It does not seem to be requested. I am able to migrate between this
version and qemu 6.2, back and forth, using a pc-q35-6.2 machine type.
My guess is, as the amount of RAM that is migrated is the same, it does
not complain. Adding Dave and Juan though.

Thanks

Eric
>
>
>>      memory_region_add_subregion(get_system_memory(),
>>          TPM_CRB_ADDR_BASE, &s->mmio);
>> @@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>      qemu_register_reset(tpm_crb_reset, dev);
>>  }
>>  
>> +static void tpm_crb_unrealize(DeviceState *dev)
>> +{
>> +    CRBState *s = CRB(dev);
>> +
> likewise, should vmstate be unregistered here, before freeing
> actually happens?
>
>> +    qemu_vfree(s->crb_cmd_buf);
>> +
>> +    if (s->ppi_enabled) {
>> +        qemu_vfree(s->ppi.buf);
>> +    }
>> +}
>> +
>>  static void tpm_crb_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>      TPMIfClass *tc = TPM_IF_CLASS(klass);
>>  
>>      dc->realize = tpm_crb_realize;
>> +    dc->unrealize = tpm_crb_unrealize;
>>      device_class_set_props(dc, tpm_crb_properties);
>>      dc->vmsd  = &vmstate_tpm_crb;
>>      dc->user_creatable = true;
>>
>>
>>


