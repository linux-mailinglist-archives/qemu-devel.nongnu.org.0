Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF446748A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 19:45:42 +0200 (CEST)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlzc5-0008Rr-9C
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 13:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlzbr-00083g-Fd
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlzbp-0004Fr-Fb
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:45:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50325)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlzbn-0003wv-H4
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:45:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so9680369wml.0
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 10:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DABft7Xmau+7qZngjO5X63mPtsrMvlu2KKX49QWwwWA=;
 b=q3nrDO6PRaFdiIuPDJVvMoIXA0d+iX42U0seZZ+gxClZ9GAHMaXkk9ECepNQCZMjoS
 FiP2IXGS4WDUrN0XVCxDTbvJiP/mYBaEcIL2PpNPae73xxCHOEf2V3dwixX2iKvptDff
 flFR1RWwQ4HcDCD6v35o7YSqDMqAcn0A7qmSAccNcXc4C6WxeszOfIDsTep2tp4siuQ2
 uQgbTcXBLwPHQFx0gKPhKV4PvjdfOp0uMRH6XTfjAGbb4CzaQXVUb5pZ5OL1xJC+uN0d
 EhGwOlz5y3vLTvOTHckNPpc07z/L1O7puUf4S8OkQxNfkxnYm6424x/vQOnvAcfhXz6R
 qOHg==
X-Gm-Message-State: APjAAAUQdgt+8ng7mBK+Dzrm/DoTigHYaxPix2HipPsFJZaHvmnMZ7yQ
 F3FRk4FU28RjSxErdcZcGKtkwA==
X-Google-Smtp-Source: APXvYqyV4zs0NGBbRb0wWna9Bb7MJEuiRGjIJnPyhwXRP3dzMeGz4aBq/c4RLyoayl51K1UvhrTzgQ==
X-Received: by 2002:a1c:1a4c:: with SMTP id a73mr10990838wma.109.1562953518607; 
 Fri, 12 Jul 2019 10:45:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id k17sm6893742wrq.83.2019.07.12.10.45.17
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 10:45:18 -0700 (PDT)
To: Julio Montes <julio.montes@intel.com>, qemu-devel@nongnu.org
References: <20190712145017.17879-1-julio.montes@intel.com>
 <20190712160257.18270-1-julio.montes@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <31753f10-d5da-e7a7-0cf4-ed4c91f1b66d@redhat.com>
Date: Fri, 12 Jul 2019 19:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712160257.18270-1-julio.montes@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2] hw/i386: turn off vmport if
 CONFIG_VMPORT is disabled
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/07/19 18:02, Julio Montes wrote:
> vmport device is not included when CONFIG_VMPORT is disabled, hence
> QEMU fails with the following error:
> 
> `Unknown device 'vmport' for bus 'ISA': unknown.`
> 
> v2: imply VMPORT (Paolo Bonzini )
> 
> Signed-off-by: Julio Montes <julio.montes@intel.com>
> ---
>  hw/i386/Kconfig | 4 ++--
>  hw/i386/pc.c    | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 4ddf2a9c55..b9c96ac361 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -51,6 +51,7 @@ config PC_ACPI
>  config I440FX
>      bool
>      imply E1000_PCI
> +    imply VMPORT
>      select PC_PCI
>      select PC_ACPI
>      select ACPI_SMBUS
> @@ -58,7 +59,6 @@ config I440FX
>      select IDE_PIIX
>      select DIMM
>      select SMBIOS
> -    select VMPORT
>      select VMMOUSE
>      select FW_CFG_DMA
> 
> @@ -77,6 +77,7 @@ config Q35
>      imply VTD
>      imply AMD_IOMMU
>      imply E1000E_PCI_EXPRESS
> +    imply VMPORT
>      select PC_PCI
>      select PC_ACPI
>      select PCI_EXPRESS_Q35
> @@ -84,7 +85,6 @@ config Q35
>      select AHCI_ICH9
>      select DIMM
>      select SMBIOS
> -    select VMPORT
>      select VMMOUSE
>      select FW_CFG_DMA
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c33ce47578..549c437050 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -83,6 +83,7 @@
>  #include "hw/mem/memory-device.h"
>  #include "sysemu/replay.h"
>  #include "qapi/qmp/qerror.h"
> +#include "config-devices.h"
> 
>  /* debug PC/ISA interrupts */
>  //#define DEBUG_IRQ
> @@ -2793,7 +2794,11 @@ static void pc_machine_initfn(Object *obj)
> 
>      pcms->max_ram_below_4g = 0; /* use default */
>      pcms->smm = ON_OFF_AUTO_AUTO;
> +#ifdef CONFIG_VMPORT
>      pcms->vmport = ON_OFF_AUTO_AUTO;
> +#else
> +    pcms->vmport = ON_OFF_AUTO_OFF;
> +#endif /* CONFIG_VMPORT */
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled = true;
> --
> 2.17.2
> 

Queued, thanks.

Paolo

