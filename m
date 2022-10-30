Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C6612B51
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 16:47:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAVb-000223-6L; Sun, 30 Oct 2022 11:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opAVY-00021b-AU
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:45:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opAVW-0000K7-90
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:45:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so8382030pjl.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LpKpws7EiuToUM/rl48Z6hzgdQ4xu/QHeg3h1k3bp0o=;
 b=NMXr8hw1FQbE1CRQaTmpNfN24Nx01cmcI+Rxm+nRMRBXCT++L3kiJuj1+byc+Xngq1
 VK6KS4A5k7R4FJ8fW0XBAQdYvv30YXDRT9989nnU7ZTaASl4uGCbiqRT5XR1aUv95uNN
 zTDgYuymCoSgivYdUzszjtxBLzlameitq+c2BK+iWuS+6H75Fcs7YStG92Rm4j26vGMl
 ImmJJZni+qDgoFXITvcGGUzlQ9mBj4GgITIy25gQwU1He1FHz9iP27vPN1ve2evH4nco
 kqTC2HmuLahZRadTL/uN+ci32tgiVKVTvw48DA3s9K/tBiJbuDVQHy3eRJ3WeE3iuTgn
 OPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LpKpws7EiuToUM/rl48Z6hzgdQ4xu/QHeg3h1k3bp0o=;
 b=TNeyo7KspT7SggONvJywloEqbgu6IpkYJGE+Uge9BKyV6KopRc60hXuZ9mOHhSbI0P
 LxOeKqI42cwIjGOrzVrGRNjmKHI7TSlUinJmIglBLrFhTLFYhuPq8qI9AfxgOIEq9Zhw
 pHcRkTxjHD2Nh2gbBgMSMtWl2ElNoFvuPQUKhwLWnr/pm8GOPLAiPah1O2t9JVkQMl4c
 uz7j8aYImUzZzRM5qaHlQ4Ozt7GTuleA0tDOs/PyPbrrMYaZdFIqASU/BmuSNIS107Ix
 7Br7Va6Ipkz4vgHCbw+EEvWAJN09y7FJlWX3H9XUl43+VBxh3MlLMVjbs+rQUHgBceQ9
 0VrA==
X-Gm-Message-State: ACrzQf1PiiOxKDc9H23scvy3UwQtVuVIe9JN4VD7AqEiJPIxvtaKt70z
 jx+xSF5z7BMVhHFBM3MxAZwaxg==
X-Google-Smtp-Source: AMsMyM4tBJJ1nbGfn39pWK5VsKx0TbLWmkX5YPF5DQu5cYvumTT5507JreeveGg4a2+W18xF8XAPmw==
X-Received: by 2002:a17:902:9308:b0:182:b2ba:755 with SMTP id
 bc8-20020a170902930800b00182b2ba0755mr9850403plb.107.1667144752066; 
 Sun, 30 Oct 2022 08:45:52 -0700 (PDT)
Received: from ani-ubuntu ([156.146.57.39])
 by smtp.googlemail.com with ESMTPSA id
 124-20020a620582000000b0056afd55722asm2773635pff.153.2022.10.30.08.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 08:45:51 -0700 (PDT)
Date: Sun, 30 Oct 2022 21:15:44 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: B <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
In-Reply-To: <20221029043803-mutt-send-email-mst@kernel.org>
Message-ID: <fe7a1bbb-9993-4eee-6543-5e7e8391b6c@anisinha.ca>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
 <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
 <20221029043803-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
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



On Sat, 29 Oct 2022, Michael S. Tsirkin wrote:

> On Fri, Oct 28, 2022 at 10:18:43PM +0530, Ani Sinha wrote:
> > On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
> > >
> > >
> > >
> > > Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> > > >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> > > >>
> > > >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> > > >> AML generation has been moved into the south bridges and since the
> > > >> machines define themselves primarily through their north bridges, let's
> > > >> switch to resolving the north bridges for AML generation instead. This
> > > >> also allows for easier experimentation with different south bridges in
> > > >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> > > >
> > > >Unfortunately this patch does not apply on the latest master. Also the
> > > >code seems to be off. Can you rebase and rework the patch?
> > >
> > > I've rebased onto Igor's series to avoid merge conflicts,
> >
> > Ok I will let Igor deal with this then since I have not followed his patchset.
>
> should you want to review this, it's all in my tree right now.

I tried your "next" branch from
git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git

and it does not apply there either.

On another note, seems you have picked up all the bits patches except
the one that adds the documentation. I wonder why.

>
> > > that's why it doesn't apply onto master. It applies fine there [1].
> > >
> > > The first two patches of this series apply fine on both branches, so could possibly be pulled already if Igor's series doesn't make it for 7.2.
> > >
> > > Best regards,
> > > Bernhard
> > >
> > > [1] https://github.com/patchew-project/qemu/commits/patchew/20221028103419.93398-1-shentey%40gmail.com
> > > >
> > > >>
> > > >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > > >> ---
> > > >>  hw/i386/acpi-build.c | 11 ++++++-----
> > > >>  1 file changed, 6 insertions(+), 5 deletions(-)
> > > >>
> > > >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > >> index 73d8a59737..d9eaa5fc4d 100644
> > > >> --- a/hw/i386/acpi-build.c
> > > >> +++ b/hw/i386/acpi-build.c
> > > >> @@ -60,6 +60,7 @@
> > > >>  #include "hw/i386/fw_cfg.h"
> > > >>  #include "hw/i386/ich9.h"
> > > >>  #include "hw/pci/pci_bus.h"
> > > >> +#include "hw/pci-host/i440fx.h"
> > > >>  #include "hw/pci-host/q35.h"
> > > >>  #include "hw/i386/x86-iommu.h"
> > > >>
> > > >> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
> > > >>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
> > > >>  {
> > > >> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> > > >> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> > > >> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> > > >> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
> > > >>      CrsRangeEntry *entry;
> > > >>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> > > >>      CrsRangeSet crs_range_set;
> > > >> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
> > > >>                          .oem_table_id = x86ms->oem_table_id };
> > > >>
> > > >> -    assert(!!piix != !!lpc);
> > > >> +    assert(!!i440fx != !!q35);
> > > >>
> > > >>      acpi_table_begin(&table, table_data);
> > > >>      dsdt = init_aml_allocator();
> > > >>
> > > >>      build_dbg_aml(dsdt);
> > > >> -    if (piix) {
> > > >> +    if (i440fx) {
> > > >>          sb_scope = aml_scope("_SB");
> > > >>          dev = aml_device("PCI0");
> > > >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > > >> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> > > >>          }
> > > >>          build_piix4_pci0_int(dsdt);
> > > >> -    } else if (lpc) {
> > > >> +    } else if (q35) {
> > > >>          sb_scope = aml_scope("_SB");
> > > >>          dev = aml_device("PCI0");
> > > >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > > >> --
> > > >> 2.38.1
> > > >>
>
>

