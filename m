Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB63F19D4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:55:59 +0200 (CEST)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhaQ-0008IY-UM
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGhXO-0004Ne-TF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:52:50 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGhXM-0005Ad-OP
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:52:50 -0400
Received: by mail-pf1-x429.google.com with SMTP id g14so5409112pfm.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=L+qaitpqcXmyDQFIX2Z6qWpJ4emK2fGNq20VhNoHod8=;
 b=TFLu9gkRxISDYtaMYNIKRqIJ1E7L3DxiAFEyEhP0GxW130mx9jFsgCqtvrBS8mYfq0
 xdN0JJRBxrmdkVT2RSz6zLucE2ENeJbBv+fDUnO08BIur99lvK/Mmw78Wie0Zwu16B1e
 lVWfbeuCSPe5AnUISjNmtuzx1FGIHYm6AWwwGgaziDYwkZVw9Qn4lCud3mTm2UxQTpu2
 QyQ9fm2gyiQNl1lxVsZ7d2UBVqGhi5Ry/osHT0J9C0jZCxGMAfW7Gr5Mfsqi5qy7isOm
 g09Lsp/AwW2e7/qH95EO4SHolLxeshXPCtGS0KVwiUibiEvoel11d0TXbizn/OP+XlV7
 vTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=L+qaitpqcXmyDQFIX2Z6qWpJ4emK2fGNq20VhNoHod8=;
 b=X8ASCQrq+0GlfSSMeynGaTFgq3zr4XBiCwcpWUczhMWJHBTp4r2135ZOhqCf3eaGkr
 Rb2KREFk7zqMB2ei3gBIQx0f1rWGss9W3N1qsHARyf3NMfLt2SFHlgZFM4vbzJOJjlTo
 zZl4AohDMzSd6SksVR/LR5S2FeglFWTX4Bjn1JcndEMYCEaqQ5PcQMC1AEjP0AfvwQbp
 vnjOhlifLWP2gXDWqpmw9U9RN6UMI+OvQPoXpzMO3NIOSTnmI8WXaB/YJnXwPNboY1yz
 tS+YXSWFhHsPKi8FsXUQG4moOWvsLPL9TQYK23KseWk7pfwfPJ9U8Ek/CNCfe9eIj0nA
 t+Iw==
X-Gm-Message-State: AOAM531neB6RTdgDkCHZF529ESQaNYE6AoAJYYNwiQiTG9gUxetDgsIT
 lRm2GlYDWUjKvyHreOi98V9HjQ==
X-Google-Smtp-Source: ABdhPJz0j6JXecA4/eh+uUkYpgglmMuLcIqZNjw/J/IbGTnNBoD9RxaS3LWPPqQ7d6X1Qb020F2mzg==
X-Received: by 2002:a65:6908:: with SMTP id s8mr14004371pgq.263.1629377566415; 
 Thu, 19 Aug 2021 05:52:46 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.234.32])
 by smtp.googlemail.com with ESMTPSA id c14sm7749022pjr.3.2021.08.19.05.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:52:45 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 19 Aug 2021 18:22:34 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
In-Reply-To: <26cc841b-792a-305a-2708-b1ed11de8151@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2108191819340.273833@anisinha-lenovo>
References: <20210812071409.492299-1-ani@anisinha.ca>
 <26cc841b-792a-305a-2708-b1ed11de8151@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1967759509-1629377565=:273833"
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1967759509-1629377565=:273833
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 19 Aug 2021, Philippe Mathieu-Daudé wrote:

> On 8/12/21 9:14 AM, Ani Sinha wrote:
> > Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> > hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> > This brings in support for whole lot of subsystems that some targets like
> > mips does not need. They are added just to satisfy symbol dependencies. This
> > is ugly and should be avoided. Targets should be able to pull in just what they
> > need and no more. For example, mips only needs support for PIIX4 and does not
> > need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> > etc. This change is an effort to clean this up.
> > In this change, new config variables are added for various acpi hotplug
> > subsystems. Targets like mips can only enable PIIX4 support and not the rest
> > of all the other modules which were being previously pulled in as a part of
> > CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> > are not required by mips (for example, symbols specific to pci hotplug etc)
> > are available to satisfy the dependencies.
> >
> > Currently, this change only addresses issues with mips malta targets. In future
> > we might be able to clean up other targets which are similarly pulling in lot
> > of unnecessary hotplug modules by enabling ACPI_X86.
> >
> > This change should also address issues such as the following:
> > https://gitlab.com/qemu-project/qemu/-/issues/221
> > https://gitlab.com/qemu-project/qemu/-/issues/193
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  configs/devices/mips-softmmu/common.mak |  5 +--
> >  hw/acpi/Kconfig                         | 10 +++++
> >  hw/acpi/acpi-cpu-hotplug-stub.c         | 50 +++++++++++++++++++++++++
> >  hw/acpi/acpi-mem-hotplug-stub.c         | 35 +++++++++++++++++
> >  hw/acpi/acpi-nvdimm-stub.c              |  8 ++++
> >  hw/acpi/acpi-pci-hotplug-stub.c         | 47 +++++++++++++++++++++++
> >  hw/acpi/meson.build                     | 14 +++++--
> >  7 files changed, 161 insertions(+), 8 deletions(-)
> >  create mode 100644 hw/acpi/acpi-cpu-hotplug-stub.c
> >  create mode 100644 hw/acpi/acpi-mem-hotplug-stub.c
> >  create mode 100644 hw/acpi/acpi-nvdimm-stub.c
> >  create mode 100644 hw/acpi/acpi-pci-hotplug-stub.c
> >
> > diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
> > index ea78fe7275..752b62b1e6 100644
> > --- a/configs/devices/mips-softmmu/common.mak
> > +++ b/configs/devices/mips-softmmu/common.mak
> > @@ -18,10 +18,7 @@ CONFIG_PCSPK=y
> >  CONFIG_PCKBD=y
> >  CONFIG_FDC=y
> >  CONFIG_ACPI=y
> > -CONFIG_ACPI_X86=y
> > -CONFIG_ACPI_MEMORY_HOTPLUG=y
> > -CONFIG_ACPI_NVDIMM=y
> > -CONFIG_ACPI_CPU_HOTPLUG=y
> > +CONFIG_ACPI_PIIX4=y
> >  CONFIG_APM=y
> >  CONFIG_I8257=y
> >  CONFIG_PIIX4=y
> > diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> > index cfc4ede8d9..3b5e118c54 100644
> > --- a/hw/acpi/Kconfig
> > +++ b/hw/acpi/Kconfig
> > @@ -8,6 +8,8 @@ config ACPI_X86
> >      select ACPI_CPU_HOTPLUG
> >      select ACPI_MEMORY_HOTPLUG
> >      select ACPI_HMAT
> > +    select ACPI_PIIX4
> > +    select ACPI_PCIHP
> >
> >  config ACPI_X86_ICH
> >      bool
> > @@ -24,6 +26,14 @@ config ACPI_NVDIMM
> >      bool
> >      depends on ACPI
> >
> > +config ACPI_PIIX4
> > +    bool
> > +    depends on ACPI
> > +
> > +config ACPI_PCIHP
> > +    bool
> > +    depends on ACPI
> > +
> >  config ACPI_HMAT
> >      bool
> >      depends on ACPI
> > diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> > new file mode 100644
> > index 0000000000..3fc4b14c26
> > --- /dev/null
> > +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> > @@ -0,0 +1,50 @@
> > +#include "qemu/osdep.h"
> > +#include "hw/acpi/cpu_hotplug.h"
> > +#include "migration/vmstate.h"
> > +
> > +
> > +/* Following stubs are all related to ACPI cpu hotplug */
> > +const VMStateDescription vmstate_cpu_hotplug;
> > +
> > +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
> > +                                CPUHotplugState *cpuhp_state,
> > +                                uint16_t io_port)
> > +{
> > +    return;
>
> I suppose if you replace all 'return' by 'g_assert_not_reached()'
> both issues reproducers crash?

yes, I presume so. For example, with the following change :

diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index 3fc4b14c26..9725e4a81b 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -16,7 +16,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
 void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
                                   AcpiCpuHotplug *gpe_cpu, uint16_t base)
 {
-    return;
+    g_assert_not_reached();
 }

 void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)


I get the following crash :

./qemu-system-mips -machine malta -bios /dev/null -nodefaults -monitor stdio -S
QEMU 6.0.93 monitor - type 'help' for more information
(qemu) **
ERROR:../hw/acpi/acpi-cpu-hotplug-stub.c:19:legacy_acpi_cpu_hotplug_init:
code should not be reached
Bail out!
ERROR:../hw/acpi/acpi-cpu-hotplug-stub.c:19:legacy_acpi_cpu_hotplug_init:
code should not be reached
Aborted (core dumped)

--2088271309-1967759509-1629377565=:273833--

