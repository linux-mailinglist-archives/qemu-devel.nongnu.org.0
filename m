Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498664ED2C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C7y-0000jB-I6; Fri, 16 Dec 2022 09:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6C7m-0000ga-1L; Fri, 16 Dec 2022 09:55:46 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p6C7d-0001Ru-VV; Fri, 16 Dec 2022 09:55:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E04B474900C;
 Fri, 16 Dec 2022 15:53:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ADF7874813B; Fri, 16 Dec 2022 15:53:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id ACE7F74812D;
 Fri, 16 Dec 2022 15:53:51 +0100 (CET)
Date: Fri, 16 Dec 2022 15:53:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 7/7] hw/ppc/Kconfig: Remove unused dependencies from
 PEGASOS2
In-Reply-To: <20221216130355.41667-8-shentey@gmail.com>
Message-ID: <7047cf26-4e54-b177-afe4-e99d04bd7f8f@eik.bme.hu>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-8-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Removes the following dependencies from ppc-softmmu:
> - CONFIG_ACPI_CPU_HOTPLUG
> - CONFIG_ACPI_CXL
> - CONFIG_ACPI_HMAT
> - CONFIG_ACPI_MEMORY_HOTPLUG
> - CONFIG_ACPI_NVDIMM
> - CONFIG_ACPI_PCIHP
> - CONFIG_ACPI_X86
> - CONFIG_MEM_DEVICE
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Thanks for sorting this out.

> ---
> hw/ppc/Kconfig | 2 --
> 1 file changed, 2 deletions(-)
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index b8d2522f45..0087369f5b 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -76,8 +76,6 @@ config PEGASOS2
>     select VT82C686
>     select SMBUS_EEPROM
>     select VOF
> -# This should come with VT82C686
> -    select ACPI_X86
>
> config PREP
>     bool
>

