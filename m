Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D10269F0B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 09:04:35 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI510-0002KB-31
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 03:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kI4zj-0001uT-4q
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 03:03:15 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kI4zg-0001bl-SG
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 03:03:14 -0400
Received: by mail-wm1-x344.google.com with SMTP id e17so2222060wme.0
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQ4nk8lj2lK67KihJWFLQQiNVNhfjhJliSNPASxV3W4=;
 b=jHnMDetKcAlIS2xIaYi6lQrQsvnBH8LuGwpzYv5ijWft4bzlHbmfeqjPx4koy4CK6Q
 I2gj9gsT0R8h1FOubUSE8ewZGgWYGsCPYMr2/YDygiFx5AHgtQAVoGYamSIku1FiMh64
 AG35Fx3DT4mCle403w3QZTutOhlrll+uV0I1RHvXMuyhv/fXZImAxzEC3q/p6ZhBPabV
 JvKebFuQiqqtIoYMrX8XpCSggcmje0TObWm7VLEaqRra6r7PYo9RudvHQJwb4MXpwmha
 oEFmbjYdTUk7mtESrFmIB7xGFjOEnWzyPYQ8LxLHvbD6hGVQS7qz0QJqwJDbabeUD2i6
 tOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQ4nk8lj2lK67KihJWFLQQiNVNhfjhJliSNPASxV3W4=;
 b=iO9/+U74oi3qbgUmSX1yQ58s8UfWgadWrTFHu70XT+WNcaqp+n97k4czLPPAAPoh5q
 PDMudUU9bZVQsbVOsVs/b0yhbCYDMFV63ZOMOKWP9BaztFrSr9RoMszoe8eRs5h+svPs
 ERj/KDQTzPXHxV7XYVdtGEa1XG1l2cvL1uwauBmzggqi0otLSj+Vj/XNX+B7K+mhzXG4
 6rgXmWvG5d9URQGMy9L6cI9WNc+MDjG6SHQf1ms/zaQQkRlmNPa/eYVNRpHFG5j9qskR
 si2CUBwON093TnuF3Hu+FNvFVU15IGe2glEvu/6BKfoUKcv7mYKaOEyT7mXL8weOmjxi
 gyWQ==
X-Gm-Message-State: AOAM5326omnm9+77xJbuxdP3xDDxCusW21E5J3ppn1wkfrsvT4L+421C
 fIafIWguMt68yQ5NS4LfBSzWX8iMKrWH2NTCH4TxjQ==
X-Google-Smtp-Source: ABdhPJwpxzfInJwewk50915ETxsJOifi5ulK/ePVXTd31P1CbPII0t5PVGH3xCWN891cTcoGVNoGtxRK3n3FR/UqC9s=
X-Received: by 2002:a1c:7405:: with SMTP id p5mr3053396wmc.35.1600153391043;
 Tue, 15 Sep 2020 00:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200911180755.28409-1-ani@anisinha.ca>
 <20200911180755.28409-9-ani@anisinha.ca>
 <20200914150550.23a91fa2@redhat.com>
 <CAARzgwyrSW4jjrPCc1SJkDZUV9C-e_96RNGytZ8VjpPzzrWfXg@mail.gmail.com>
 <CAARzgwx4T0MXtFTMe-b8DbAQCi7xq231kjOv8wRcRxwE5HPCyw@mail.gmail.com>
 <20200914160910.66785da8@redhat.com>
 <CAARzgwzSg7zCk_jaQ7iriC4_L+9oTykv0RhPdkTroP9pNtiMCg@mail.gmail.com>
 <CAARzgwyr4tHFHO=8O0Mtuwzv5Q2Me+-HLdXa-qRDDP6jSc-0Gg@mail.gmail.com>
 <CAARzgwzpbQ9pGiRqTcMrwf+fKZxgxGK_sZtxFh4Oacug7aJzaQ@mail.gmail.com>
In-Reply-To: <CAARzgwzpbQ9pGiRqTcMrwf+fKZxgxGK_sZtxFh4Oacug7aJzaQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Sep 2020 12:32:59 +0530
Message-ID: <CAARzgwwt1tWOM6czSzz2HOkD0EW2EE+8Eu4SPsxWh6eB4ipNrg@mail.gmail.com>
Subject: Re: [PATCH 9/9] piix4: don't reserve hw resources when hotplug is off
 globally
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::344;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 14, 2020 at 9:11 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Mon, Sep 14, 2020 at 8:51 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Mon, Sep 14, 2020 at 8:20 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Mon, Sep 14, 2020 at 7:39 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > > >
> > > > On Mon, 14 Sep 2020 18:58:19 +0530
> > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > > On Mon, Sep 14, 2020 at 6:40 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > >
> > > > > > On Mon, Sep 14, 2020 at 6:36 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, 11 Sep 2020 23:37:55 +0530
> > > > > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > > > > >
> > > > > > > > When acpi hotplug is turned off for both root pci bus as well as for pci
> > > > > > > > bridges, we should not generate the related amls for DSDT table or initialize
> > > > > > > > related hw ports or reserve hw resources. This change makes sure all those
> > > > > > > > operations are turned off in the case acpi pci hotplug is off globally.
> > > > > > >
> > > > > > > it still leaves around pure PCI hotplug ACPI code:
> > > > > > >
> > > > > > >             Method (PCNT, 0, NotSerialized)
> > > > > > >             {
> > > > > > >             }
> > > > > >
> > > > > > How do you suggest we fix this?
> > > > >
> > > > > One way to fix this would be to do this:
> > > > >
> > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > index 7e3cf3b57b..2bd0c37143 100644
> > > > > --- a/hw/i386/acpi-build.c
> > > > > +++ b/hw/i386/acpi-build.c
> > > > > @@ -483,7 +483,8 @@ static void build_append_pci_bus_devices(Aml
> > > > > *parent_scope, PCIBus *bus,
> > > > >              aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> > > > >          }
> > > > >      }
> > > > > -    aml_append(parent_scope, method);
> > > > > +    if (bsel)
> > > > > +        aml_append(parent_scope, method);
> > > > >      qobject_unref(bsel);
> > > > >  }
> > > > >
> > > > > This means that if the hotplug on the root bus is disabled, we also
> > > > > disable PCNT. This will also need the unit test update as the unit
> > > > Does bridge hot-plug still work if we disable it only on root bus?
> > >
> > > Just did a quick test. Windows seems to eject devices on the bridge
> > > even when the root bus hot plug is off.
> >
> > OK I am really confused! With the above change, the unit tests are
> > failing because of differences in tests/data/acpi/q35/DSDT !! Why is
> > q35 affected?
>
> Following is the list of golden master tables which need to be
> refreshed in order to make the change:
>
> > > > > -    aml_append(parent_scope, method);
> > > > > +    if (bsel)
> > > > > +        aml_append(parent_scope, method);
> > > > >      qobject_unref(bsel);
>
> "tests/data/acpi/pc/DSDT.roothp",
> "tests/data/acpi/q35/DSDT",
> "tests/data/acpi/q35/DSDT.tis",
> "tests/data/acpi/q35/DSDT.bridge",
> "tests/data/acpi/q35/DSDT.mmio64",
> "tests/data/acpi/q35/DSDT.ipmibt",
> "tests/data/acpi/q35/DSDT.cphp",
> "tests/data/acpi/q35/DSDT.memhp",
> "tests/data/acpi/q35/DSDT.numamem",
> "tests/data/acpi/q35/DSDT.dimmpxm",
> "tests/data/acpi/q35/DSDT.acpihmat",
>
> I am not sure if this is the right thing to do. The diff in every case is:
>
> @@ -3413,24 +3413,20 @@
>                  Name (_ADR, 0x00010000)  // _ADR: Address
>                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
>                  {
>                      Return (Zero)
>                  }
>
>                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
>                  {
>                      Return (Zero)
>                  }
>
>                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
>                  {
>                      Return (Zero)
>                  }
>              }
> -
> -            Method (PCNT, 0, NotSerialized)
> -            {
> -            }
>          }
>      }
>  }
>
> @Igor Mammedov  Please advice.

I could be wrong but it seems bsel is not set for pci buses for q35.

>
> >
> > >
> > > >
> > > > > test
> > > > > will fail with :
> > > > >
> > > > > @@ -3113,24 +3113,20 @@
> > > > >                  Name (_ADR, 0x00010000)  // _ADR: Address
> > > > >                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
> > > > >                  {
> > > > >                      Return (Zero)
> > > > >                  }
> > > > >
> > > > >                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
> > > > >                  {
> > > > >                      Return (Zero)
> > > > >                  }
> > > > >
> > > > >                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
> > > > >                  {
> > > > >                      Return (Zero)
> > > > >                  }
> > > > >              }
> > > > > -
> > > > > -            Method (PCNT, 0, NotSerialized)
> > > > > -            {
> > > > > -            }
> > > > >          }
> > > > >      }
> > > > >  }
> > > > >
> > > > > Let's fix this as a separate patch.
> > > >
> > > > I'd rather fix up this patch, so it would do what it claims.
> > > >
> > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > > > ---
> > > > > > > >  hw/acpi/piix4.c      |  6 ++++--
> > > > > > > >  hw/i386/acpi-build.c | 10 ++++++++--
> > > > > > > >  2 files changed, 12 insertions(+), 4 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > > > > > > index e6163bb6ce..b70b1f98af 100644
> > > > > > > > --- a/hw/acpi/piix4.c
> > > > > > > > +++ b/hw/acpi/piix4.c
> > > > > > > > @@ -596,8 +596,10 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
> > > > > > > >                            "acpi-gpe0", GPE_LEN);
> > > > > > > >      memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
> > > > > > > >
> > > > > > > > -    acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> > > > > > > > -                    s->use_acpi_hotplug_bridge);
> > > > > > > > +    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
> > > > > > > > +        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> > > > > > > > +                        s->use_acpi_hotplug_bridge);
> > > > > > > > +    }
> > > > > > > >
> > > > > > > >      s->cpu_hotplug_legacy = true;
> > > > > > > >      object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
> > > > > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > > > > index e079b686f5..7e3cf3b57b 100644
> > > > > > > > --- a/hw/i386/acpi-build.c
> > > > > > > > +++ b/hw/i386/acpi-build.c
> > > > > > > > @@ -95,6 +95,7 @@ typedef struct AcpiPmInfo {
> > > > > > > >      bool s3_disabled;
> > > > > > > >      bool s4_disabled;
> > > > > > > >      bool pcihp_bridge_en;
> > > > > > > > +    bool pcihp_root_en;
> > > > > > > >      uint8_t s4_val;
> > > > > > > >      AcpiFadtData fadt;
> > > > > > > >      uint16_t cpu_hp_io_base;
> > > > > > > > @@ -245,6 +246,9 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
> > > > > > > >      pm->pcihp_bridge_en =
> > > > > > > >          object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
> > > > > > > >                                   NULL);
> > > > > > > > +    pm->pcihp_root_en =
> > > > > > > > +        object_property_get_bool(obj, "acpi-root-pci-hotplug",
> > > > > > > > +                                 NULL);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void acpi_get_misc_info(AcpiMiscInfo *info)
> > > > > > > > @@ -1504,7 +1508,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > > > > >          build_hpet_aml(dsdt);
> > > > > > > >          build_piix4_isa_bridge(dsdt);
> > > > > > > >          build_isa_devices_aml(dsdt);
> > > > > > > > -        build_piix4_pci_hotplug(dsdt);
> > > > > > > > +        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> > > > > > > > +            build_piix4_pci_hotplug(dsdt);
> > > > > > > > +        }
> > > > > > > >          build_piix4_pci0_int(dsdt);
> > > > > > > >      } else {
> > > > > > > >          sb_scope = aml_scope("_SB");
> > > > > > > > @@ -1698,7 +1704,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > > > > >      crs_range_set_free(&crs_range_set);
> > > > > > > >
> > > > > > > >      /* reserve PCIHP resources */
> > > > > > > > -    if (pm->pcihp_io_len) {
> > > > > > > > +    if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
> > > > > > > >          dev = aml_device("PHPR");
> > > > > > > >          aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
> > > > > > > >          aml_append(dev,
> > > > > > >
> > > > >
> > > >

