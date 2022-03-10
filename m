Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FD4D4FEC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:08:14 +0100 (CET)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMGq-0003iN-Ty
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSMFh-0001dl-ST
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSMFe-0001uQ-Ei
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+6z7fKNtOLJyn/fQpUZKotUh+R62dVr+H8YXd+TCvw=;
 b=Rzg1hQDW2L8FOHJovsYkvZjqodZ+eACm7Uq249ZN5TxYhK7lP+MxP+ZIbW0DD/LWPXv3kH
 662M60pil2vlqtPP0lBu3ajmOoggIsG4hgKmM3sawJtW+sv5vAc/iyl5bjqFA//IqjJXKD
 XVaVWWUPiQb5NCuHkzAe/1fMAwF1HVc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-md0ysBCcNPGGShaGKZDE9Q-1; Thu, 10 Mar 2022 12:06:51 -0500
X-MC-Unique: md0ysBCcNPGGShaGKZDE9Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq34-20020a1709073f2200b006d677c94909so3474516ejc.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s+6z7fKNtOLJyn/fQpUZKotUh+R62dVr+H8YXd+TCvw=;
 b=1ryNAa8GG8QXA1hKggfwz1BT2pSpJQ2h6MZZtZywb/G+P9FjQGAowyt5F+yOxzcSRv
 ecQEOZzaC4xSnZx1FwnZnK2rXZbHBkTGU6yvwuIWTpuQW4kYyY132rxXKMoV20gUVIvz
 8lFu1KKK6hMHgjFfzTY7CMG3QzfH4IKaIiQpEtkjhqGLIRgbhUSPWH3uviw26sLDTeWO
 AB6q+sTc6NO7aMDT+YpA4iu1OlaKNwL1ju/81hN6rbrtlfJsS/K8FxUKYtwOQsYl8Se5
 ++3wBgxQPGY6Y6TYZmHZciecwB3QyFGl6EP+X+Fkv/96m7eyCMa/BV4ubPp2Ivhe9cGR
 eVWA==
X-Gm-Message-State: AOAM531/P3+MdpzD7GX0LX2c2u+eYpKrfFfr1xw/4BfApr9b2/IYdTz1
 WdifKjrFP/uBwMXNUZPZ0bxzeA+z/QhPU/qzQT3OvrkbM2VwCgw25leIhxKLmI2b1ciELzxioWH
 37DTsjYQSBolKFl4jBNdNUfZKmEEomFAYJ8Ws0ec/rOGYQVBXHajlyikebv6Kc2s=
X-Received: by 2002:aa7:db07:0:b0:415:d33e:a8ea with SMTP id
 t7-20020aa7db07000000b00415d33ea8eamr5299944eds.342.1646932009852; 
 Thu, 10 Mar 2022 09:06:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQY1NrFl/hVHw4PMq7TvHUmPeOK95uirIg7hdKrMys0+A/OljdAV0vbdIxntzUFEbtJRdS7A==
X-Received: by 2002:aa7:db07:0:b0:415:d33e:a8ea with SMTP id
 t7-20020aa7db07000000b00415d33ea8eamr5299914eds.342.1646932009537; 
 Thu, 10 Mar 2022 09:06:49 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 x18-20020a05640226d200b00416a502c147sm1608413edd.10.2022.03.10.09.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 09:06:48 -0800 (PST)
Message-ID: <bc14f172-eeda-a5a9-6c99-b9e198bb8bc5@redhat.com>
Date: Thu, 10 Mar 2022 18:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
To: qemu-devel@nongnu.org, kraxel@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210816135504.9089-1-jziviani@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210816135504.9089-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/2021 15.55, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers the device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and exiting without crashing.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
> v2 to v3: Improved error message
> v1 to v2: Use error_setg instead of error_report
> 
>   hw/display/vga-isa.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 90851e730b..30d55b41c3 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,6 +33,7 @@
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
>   
>   #define TYPE_ISA_VGA "isa-vga"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>       MemoryRegion *vga_io_memory;
>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>   
> +    /*
> +     * make sure this device is not being added twice, if so
> +     * exit without crashing qemu
> +     */
> +    if (qemu_ram_block_by_name("vga.vram")) {
> +        error_setg(errp, "'isa-vga' device already registered");
> +        return;
> +    }
> +
>       s->global_vmstate = true;
>       vga_common_init(s, OBJECT(dev));
>       s->legacy_address_space = isa_address_space(isadev);

v4 of this patch had other issues ... Philippe's rework of the vga-mmio code 
also did not fix the crash ... shall we just go with this v3 of the patch 
again to fix the issue?

  Thomas


