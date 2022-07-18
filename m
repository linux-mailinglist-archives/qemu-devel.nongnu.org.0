Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C0578535
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:20:34 +0200 (CEST)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRbt-0002JO-3c
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRUf-0006zO-A3
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRUc-000587-Hw
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658153581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QG3J6JARrq24FEIRWZXtH9zbwyv/aLPWNaX5d5dsdJY=;
 b=CWp+Sayn9KJ9bh7yV0LUrFfo4ciemx8a1lCB2xjS62UIzarrKhRaIhMWQ3JooaTOPjoOeK
 DTgr5+83QgxaFgEvy3HvsM4GFnb5xhFf2v1viAqzfZER4lRae1smqUXHbfrxGx0AVAU0CW
 m5nRrRZY/tNfZxUVS7w26oJV4y2Ol5w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-xvv83aENM3S3VVhWZ99Cvg-1; Mon, 18 Jul 2022 10:13:00 -0400
X-MC-Unique: xvv83aENM3S3VVhWZ99Cvg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so8026141edd.17
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QG3J6JARrq24FEIRWZXtH9zbwyv/aLPWNaX5d5dsdJY=;
 b=tHUK4JZyVIRGL1nbkaNEL5MHDdREL1JyQOTx5MXL/4I8aqiAkb1ZsLEiab6gvDqfkq
 8Mq0yaDjaGNRpnTPLxrTizNGs9hDBQYMcnttbwwQEcTQiPpzk6HayWUmqUsj/pdQmzjJ
 Y2vcOJ3fyaLE3CpWIeFuGgVarGstsb/WP/WaMucP+LiVsHwXGQIqb0MiJO/G+ijTZ9Ww
 KQEnBG+32kRGXdBeCNF6Sc2Q9W8A0xSBNpkLE99cgY2GZv9p209bZ+pjTWpkyRtab7qX
 Qmy/BQToSMEnC0NSJfIr5NnYpMhnJez6Xi3B1P0u1YFLAAladtxOBVy7+xFOOvFJmIVZ
 HewA==
X-Gm-Message-State: AJIora9TiawPGnnzfhC0nP/3+/eTFGU4FXIIRNZqV8sbDnIUPhqfxQ0Z
 GNSgkd1a8Ecv6dadCrZo7vf765XAEG3M1L9SOhJ0n7Qsms6pDhiVkS/YJHFfL6y7+y9/C3jddGx
 3hAwTKTMu25a6QxE=
X-Received: by 2002:a17:907:94d1:b0:72f:10c:bb3c with SMTP id
 dn17-20020a17090794d100b0072f010cbb3cmr14632954ejc.532.1658153579398; 
 Mon, 18 Jul 2022 07:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u/v5K1wH0AJSHNKBoTLLOeEltng4T3QOW/1aQ5/0uCIqjvB/9SKOCbCmtLWkVSVX9ZCyk1+g==
X-Received: by 2002:a17:907:94d1:b0:72f:10c:bb3c with SMTP id
 dn17-20020a17090794d100b0072f010cbb3cmr14632930ejc.532.1658153579211; 
 Mon, 18 Jul 2022 07:12:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z13-20020aa7d40d000000b0043adc6552d6sm8594300edq.20.2022.07.18.07.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:12:58 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:12:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 6/8] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20220718161257.7bc16d9c@redhat.com>
In-Reply-To: <20220711104436.8363-7-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-7-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 11:44:34 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
> HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/Kconfig           | 1 +
>  hw/arm/virt-acpi-build.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 15fa79afd3..17fcde8e1c 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -30,6 +30,7 @@ config ARM_VIRT
>      select ACPI_VIOT
>      select VIRTIO_MEM_SUPPORTED
>      select ACPI_CXL
> +    select ACPI_HMAT
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 449fab0080..f19b55e486 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -42,6 +42,7 @@
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
> +#include "hw/acpi/hmat.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>              build_slit(tables_blob, tables->linker, ms, vms->oem_id,
>                         vms->oem_table_id);
>          }
> +
> +        if (ms->numa_state->hmat_enabled) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_hmat(tables_blob, tables->linker, ms->numa_state,
> +                       vms->oem_id, vms->oem_table_id);
> +        }
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {


