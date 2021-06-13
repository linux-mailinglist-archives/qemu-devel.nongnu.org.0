Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC03A5AB1
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:49:01 +0200 (CEST)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXyW-0000fm-9a
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lsXxb-0008PQ-RN; Sun, 13 Jun 2021 17:48:03 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:45024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lsXxa-0005X8-7u; Sun, 13 Jun 2021 17:48:03 -0400
Received: by mail-qt1-x841.google.com with SMTP id d9so4965482qtp.11;
 Sun, 13 Jun 2021 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trqlftbc0FIgHKHAmzpHqqvTOng/7ZoI9PAOUqII7Ko=;
 b=XbVea8At3b8h9CISbept5VKoMUTp2+rgo9jyQPjqHkxRc1b4DsZyFS0zZ27ZOWVXB0
 6EbdVF40B+TXFrG4+tD4schKvEwrNAU2CcqADuFRKq6P/oVcNUFnazSNoWQexgnTPxDG
 e7Bh5Nepb7PAPOz56W2a4r0YNEMt5WErZUP/btwJh4ObdveRr1p2WUDsu+lmP6jLqEqY
 1ESORqMBIGwPbCm8e30IKM6fvEfimLTIgztxJrkI4P4x0HdXFeA4bb16F5s5hieQPsYj
 +1n1NSDZWfVbqShgbSiNTxVEvg17nhJWn8BO8Vcn0cktIibGD2wFpQq7De31t23oUDaA
 Vm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trqlftbc0FIgHKHAmzpHqqvTOng/7ZoI9PAOUqII7Ko=;
 b=fXh79O5XwBX5S4lvwX0tB6sU02SwbI7vJ1NMhx/GLQsHh3Rh/lH3qlJtuUtp3lec2F
 uNUQ+Vr4/rvVCJev/PYrtpqM1MviHKHz4dktqT3CJQKZDqhUpztUq3BBJGJwWTukA/a2
 1Cow+B/mUyVJqtye72k+JPuomlXYB2lGG/anPMrw4FUfcjUcQfq7BDdbHK4wXpRs1D5J
 kLNJzthS2cNd5Sqm0uRSWJNXunN+DLMps3icdu9HqMjLwvUwRBPhuHesDom5G8eCaHY1
 Ek/HXp2qx6V4BkCnc9Cm06xIHgKImG42qi5mXgPkOL59NmEOftfLuA3c7nXzMPPuvXoc
 vp8A==
X-Gm-Message-State: AOAM533D1SBg4vUofcgSEDwqB1oq/kxiDSc+d5QpfJ2XVMGTxVHwBrWK
 t8/P8eCye4y2TC+JS4p4l0UWAiRHeyQ0mXfQ8NE=
X-Google-Smtp-Source: ABdhPJzt2IgrP5zdKdTe9MAg5xnOxgURiciJQf1R/u3JQl1jp0W46YaNm7Coe3Mv50CDLerKi5Lm4aUWp0p+onRf3bo=
X-Received: by 2002:ac8:6885:: with SMTP id m5mr13985887qtq.268.1623620880442; 
 Sun, 13 Jun 2021 14:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-2-peter.maydell@linaro.org>
In-Reply-To: <20210603171259.27962-2-peter.maydell@linaro.org>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 14 Jun 2021 05:47:51 +0800
Message-ID: <CABSBigSa+fueAhw90KVNKNjad4iRK_Z+LA_nMkdm8KDPSXOLLg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-qt1-x841.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Swetha <swjoshi@microsoft.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 01:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Generic code in target/arm wants to call acpi_ghes_record_errors();
> provide a stub version so that we don't fail to link when
> CONFIG_ACPI_APEI is not set. This requires us to add a new
> ghes-stub.c file to contain it and the meson.build mechanics
> to use it when appropriate.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/acpi/ghes-stub.c | 17 +++++++++++++++++
>  hw/acpi/meson.build |  6 +++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
>  create mode 100644 hw/acpi/ghes-stub.c
>
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> new file mode 100644
> index 00000000000..9faba043b85
> --- /dev/null
> +++ b/hw/acpi/ghes-stub.c
> @@ -0,0 +1,17 @@
> +/*
> + * Support for generating APEI tables and recording CPER for Guests:
> + * stub functions.
> + *
> + * Copyright (c) 2021 Linaro, Ltd
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/ghes.h"
> +
> +int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> +{
> +    return -1;
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index dd69577212a..03ea43f8627 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -13,13 +13,13 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
> -acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
>  acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
> -softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
>  softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
> -                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
> +                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))
> --
> 2.20.1
>

Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>

