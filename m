Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BC611819
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:51:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSZ5-00028R-6Z; Fri, 28 Oct 2022 12:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ooSXY-00041M-MW
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:49:14 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ooSXW-0002n7-JZ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:49:04 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id ml12so4471790qvb.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=liqaWegPBWbdVJr5+pYGebPJoXCsFJlpuYhXI6ml8EI=;
 b=ZjtJo7RYqaRh1S01O6zVqFMtMvW/DQaX9YGmxLbbfiEis4VcSN2Tu5cfdg85l9Ux8e
 sBNINKucn3uWE6Op+N0qVf/mSX5N3I/QpfK7vxMAQMrr9BRhNENFdLq55mjbU00NoSwW
 WgArM6YY1aA1jlMtmeMFPnXObEmZU7bNZbJ5llXltXwyOj8JacUJuemmoMl9cALo9XUY
 GoDkumAL9t97eB6PWgikkTuXB4Kz1VyoYUEOQNEtc3FM7IRmvn7IbudFhzJchjn4s7+J
 l9YZkxbygPUmL1b88Ayl/HiPd8/bn7gClITlkg40npCMHIc+mlpm/jU3tXkMnmnXYTEJ
 j8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=liqaWegPBWbdVJr5+pYGebPJoXCsFJlpuYhXI6ml8EI=;
 b=hb5FUHIGmli53YYMy18DXpvWOA7kqcJ+R4PZf+GR/m8DzYB+DH9RDaXYmJgoil6Pv3
 PLK3pEj+5vOxrPBl+4qYH4NVKatihPos2TnzHMW7p0o7YbY6k2TpeW8p3jeybypEr7Nb
 Q/IViKNNjI7HZqg0tvHQ3D4YKrfPuLpBQNy+LjKmnJQ95qp4EGb2QQ5G5E/bco67Xm6w
 AgoOpkadjwGzbvWQVIaQfOY+OInq3vF4oyf9ahM/8eNJG+6HkG8lCC8NbYTnwtod+3yl
 H7la6LKt6S5UoUTOn5B/x18DaMpkApNCGjn0SnFBsRhkaXTm1U55kSPIM5hC3lnopou/
 KQgw==
X-Gm-Message-State: ACrzQf3UGlOtALbjuJMyHUH5EZPe+QAsMr/c/6U7hmSLfPA5bVR5aRj+
 0nq1PlfZA7OsHQ3yerBOi3e09Swr6c9+zlwrCTd9TA==
X-Google-Smtp-Source: AMsMyM7kT2VcMp/poKopV7h8u5gW/bU848nTK/oTHxXGOd5ifiPOwN1uegQ9o/GrOXpKiYN7MQYojIf00DvAspff53E=
X-Received: by 2002:a05:6214:5289:b0:4bb:6a33:37d7 with SMTP id
 kj9-20020a056214528900b004bb6a3337d7mr437651qvb.31.1666975734685; Fri, 28 Oct
 2022 09:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
In-Reply-To: <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 28 Oct 2022 22:18:43 +0530
Message-ID: <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
To: B <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
>
>
>
> Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> >> AML generation has been moved into the south bridges and since the
> >> machines define themselves primarily through their north bridges, let's
> >> switch to resolving the north bridges for AML generation instead. This
> >> also allows for easier experimentation with different south bridges in
> >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> >
> >Unfortunately this patch does not apply on the latest master. Also the
> >code seems to be off. Can you rebase and rework the patch?
>
> I've rebased onto Igor's series to avoid merge conflicts,

Ok I will let Igor deal with this then since I have not followed his patchset.

> that's why it doesn't apply onto master. It applies fine there [1].
>
> The first two patches of this series apply fine on both branches, so could possibly be pulled already if Igor's series doesn't make it for 7.2.
>
> Best regards,
> Bernhard
>
> [1] https://github.com/patchew-project/qemu/commits/patchew/20221028103419.93398-1-shentey%40gmail.com
> >
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  hw/i386/acpi-build.c | 11 ++++++-----
> >>  1 file changed, 6 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 73d8a59737..d9eaa5fc4d 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -60,6 +60,7 @@
> >>  #include "hw/i386/fw_cfg.h"
> >>  #include "hw/i386/ich9.h"
> >>  #include "hw/pci/pci_bus.h"
> >> +#include "hw/pci-host/i440fx.h"
> >>  #include "hw/pci-host/q35.h"
> >>  #include "hw/i386/x86-iommu.h"
> >>
> >> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
> >>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
> >>  {
> >> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> >> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> >> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> >> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
> >>      CrsRangeEntry *entry;
> >>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> >>      CrsRangeSet crs_range_set;
> >> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
> >>                          .oem_table_id = x86ms->oem_table_id };
> >>
> >> -    assert(!!piix != !!lpc);
> >> +    assert(!!i440fx != !!q35);
> >>
> >>      acpi_table_begin(&table, table_data);
> >>      dsdt = init_aml_allocator();
> >>
> >>      build_dbg_aml(dsdt);
> >> -    if (piix) {
> >> +    if (i440fx) {
> >>          sb_scope = aml_scope("_SB");
> >>          dev = aml_device("PCI0");
> >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> >> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> >>          }
> >>          build_piix4_pci0_int(dsdt);
> >> -    } else if (lpc) {
> >> +    } else if (q35) {
> >>          sb_scope = aml_scope("_SB");
> >>          dev = aml_device("PCI0");
> >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> >> --
> >> 2.38.1
> >>

