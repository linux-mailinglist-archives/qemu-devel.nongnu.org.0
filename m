Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09E610F3B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:00:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooN4G-0002Eh-Dv; Fri, 28 Oct 2022 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ooN4E-00027Z-5U
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:58:26 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ooN48-0004yz-8B
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:58:21 -0400
Received: by mail-qk1-x72e.google.com with SMTP id d13so3150956qko.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=li8ne5+9LiRWxfVk4YkaTUHE07vjTVEDZzOBuh12RyU=;
 b=uAcViUlhatpU/E2iq7LdU2tO0j4TPugvfkEmHi7tRkjxN+s4VnXpMwG8G+T7UX0+fI
 Gtm09MznDkPhwMZsc7W43+IRl83EW9+w7i1/BiHZONxzYEqNad4nz5/T3zwVrC8Ldeq+
 FskFLSwn0d24TKO1SP6OwciF3uUYV5hskKjdJVl5D+H2C1UQt+b2uQvOarV+WsPrzrg7
 K8foYwLYuql1oQ9zZ9qCKuvAFrh4yMAuWFGCR/TjquRfPZ/l0xiS6c70Q/hRJMilQF2N
 k9SdaaSBln0Rs91SnAs90g585DdFJ3DJ70cd78Jt8h5mHO4Mdh++sJD7ZgnCsWk7gvhX
 ihfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=li8ne5+9LiRWxfVk4YkaTUHE07vjTVEDZzOBuh12RyU=;
 b=VrVCYhmfPeOxjDA6xFLq8LDK/qbSyNTzaZ270iDzo9+TNYNz9BaM8mWY0MxJFmzNgA
 nYwXn9ErPqDO5wR6WHsAaF2l2iKgDk6oBD71BVuTbOTwvx7QD+qw5znaWgtVus5Fbpk2
 AvCkZI7BpIpNoDGU7pPMwdo70ryqG4dEBsvZizbVB15knwH89O793C9sNm0yOkBfQ3oM
 LSzL+ejSG+/QHyJxR3a0IXGS35iE7nJMPEGgnj26ViMg+Ddw5l0lQwbIjXIz9j8b3aEx
 jfnH9kyROpujOQmsgIZdXuBq3K/ql+G0AcHiUpOkNSVNmZ11X/wQeY5JoqMjucjN7Plp
 GSPg==
X-Gm-Message-State: ACrzQf1pB44g3apiGXnUhQB8Oz6owyyWcudsVZYEw9POtY4aUXj3rxAw
 0ky7eNvINnOic6dPoGJ7KjfHFJmNyFT3jleW8SiRBA==
X-Google-Smtp-Source: AMsMyM6d6OPFw8WOBM53MQ7gWsqzGEK8Jfyii8T4aiKPKNwQU4aul7PGjbi1KzaVhlt7QyDLfK+9fVof2yDyizSV5Xs=
X-Received: by 2002:a05:620a:294f:b0:6cf:920e:4f3a with SMTP id
 n15-20020a05620a294f00b006cf920e4f3amr37810584qkp.66.1666954698705; Fri, 28
 Oct 2022 03:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
In-Reply-To: <20221028103419.93398-4-shentey@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 28 Oct 2022 16:28:07 +0530
Message-ID: <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::72e;
 envelope-from=ani@anisinha.ca; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> AML generation has been moved into the south bridges and since the
> machines define themselves primarily through their north bridges, let's
> switch to resolving the north bridges for AML generation instead. This
> also allows for easier experimentation with different south bridges in
> the "pc" machine, e.g. with PIIX4 and VT82xx.

Unfortunately this patch does not apply on the latest master. Also the
code seems to be off. Can you rebase and rework the patch?

>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/i386/acpi-build.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 73d8a59737..d9eaa5fc4d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -60,6 +60,7 @@
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/ich9.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/pci-host/i440fx.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/i386/x86-iommu.h"
>
> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>  {
> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
>      CrsRangeEntry *entry;
>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>      CrsRangeSet crs_range_set;
> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
>                          .oem_table_id = x86ms->oem_table_id };
>
> -    assert(!!piix != !!lpc);
> +    assert(!!i440fx != !!q35);
>
>      acpi_table_begin(&table, table_data);
>      dsdt = init_aml_allocator();
>
>      build_dbg_aml(dsdt);
> -    if (piix) {
> +    if (i440fx) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
> -    } else if (lpc) {
> +    } else if (q35) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> --
> 2.38.1
>

