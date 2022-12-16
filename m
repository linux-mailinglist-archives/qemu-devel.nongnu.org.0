Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C96664ED22
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:51:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C26-0006AU-Na; Fri, 16 Dec 2022 09:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6C24-000682-Sf; Fri, 16 Dec 2022 09:49:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6C23-0007ub-EB; Fri, 16 Dec 2022 09:49:52 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9BC94748130;
 Fri, 16 Dec 2022 15:48:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 63C1C74812D; Fri, 16 Dec 2022 15:48:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 619B9746307;
 Fri, 16 Dec 2022 15:48:05 +0100 (CET)
Date: Fri, 16 Dec 2022 15:48:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 6/7] i386, mips: Resolve redundant ACPI and APM
 dependencies
In-Reply-To: <20221216130355.41667-7-shentey@gmail.com>
Message-ID: <773f556a-5fee-b4c7-93af-3cf1b607858a@eik.bme.hu>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-7-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 16 Dec 2022, Bernhard Beschow wrote:
> Now that all ACPI controllers select the ACPI and APM dependencies
> themselves, these explicit dependencies became redundant. Remove them.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> configs/devices/mips-softmmu/common.mak | 3 ---
> hw/i386/Kconfig                         | 2 --
> 2 files changed, 5 deletions(-)
>
> diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
> index 416161f833..88aff94625 100644
> --- a/configs/devices/mips-softmmu/common.mak
> +++ b/configs/devices/mips-softmmu/common.mak
> @@ -17,9 +17,7 @@ CONFIG_I8254=y
> CONFIG_PCSPK=y
> CONFIG_PCKBD=y
> CONFIG_FDC=y
> -CONFIG_ACPI=y
> CONFIG_ACPI_PIIX4=y
> -CONFIG_APM=y
> CONFIG_I8257=y
> CONFIG_PIIX4=y
> CONFIG_IDE_ISA=y
> @@ -32,6 +30,5 @@ CONFIG_MIPS_ITU=y
> CONFIG_MALTA=y
> CONFIG_PCNET_PCI=y
> CONFIG_MIPSSIM=y
> -CONFIG_ACPI_SMBUS=y
> CONFIG_SMBUS_EEPROM=y
> CONFIG_TEST_DEVICES=y
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 3a92566701..c4fb5b49bd 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -51,7 +51,6 @@ config PC_PCI
>     bool
>     select APIC
>     select IOAPIC
> -    select APM
>     select PC
>
> config PC_ACPI
> @@ -72,7 +71,6 @@ config I440FX
>     select ACPI_PIIX4
>     select PC_PCI
>     select PC_ACPI
> -    select ACPI_SMBUS
>     select PCI_I440FX
>     select PIIX3
>     select IDE_PIIX
>

Is select APM now redundant in VT82686 too?

Regards,
BALATON Zoltan

