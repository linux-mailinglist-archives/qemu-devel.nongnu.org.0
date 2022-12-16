Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F9B64ED20
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:47:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Bz3-0002Nn-Vq; Fri, 16 Dec 2022 09:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6Byk-00029B-MF; Fri, 16 Dec 2022 09:46:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6Byi-0007LV-BP; Fri, 16 Dec 2022 09:46:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1D49774812D;
 Fri, 16 Dec 2022 15:44:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DAA47747FAB; Fri, 16 Dec 2022 15:44:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D884A746307;
 Fri, 16 Dec 2022 15:44:33 +0100 (CET)
Date: Fri, 16 Dec 2022 15:44:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 3/7] hw/acpi/Kconfig: Do not needlessly build
 TYPE_PIIX4_PM in non-PC/Malta machines
In-Reply-To: <20221216130355.41667-4-shentey@gmail.com>
Message-ID: <af5b497b-c0ff-0d08-d37b-6eeea23b3e3d@eik.bme.hu>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-4-shentey@gmail.com>
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
> TYPE_PIIX4_PM is only used in machines where PIIX chipsets are used
> which is currently PC and Malta. There is no point building it for the
> other ACPI_X86 machines.
>
> Note that this also removes unneeded ACPI_PIIX4 from PEGASOS2.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Isn't 440fx using PIIX3 whereas Malta uses PIIX4? If so there may be still 
some inconsistency in the naming of this config option (should it be 
ACPI_PIIX maybe?) but it should not be needed for pegasos2 in any case.

Regards,
BALATON Zoltan

> ---
> hw/acpi/Kconfig | 1 -
> hw/i386/Kconfig | 1 +
> 2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 704cbc6236..b7006e18c8 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -9,7 +9,6 @@ config ACPI_X86
>     select ACPI_CPU_HOTPLUG
>     select ACPI_MEMORY_HOTPLUG
>     select ACPI_HMAT
> -    select ACPI_PIIX4
>     select ACPI_PCIHP
>     select ACPI_ERST
>
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index d22ac4a4b9..3a92566701 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -69,6 +69,7 @@ config I440FX
>     imply E1000_PCI
>     imply VMPORT
>     imply VMMOUSE
> +    select ACPI_PIIX4
>     select PC_PCI
>     select PC_ACPI
>     select ACPI_SMBUS
>

