Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1171BC559
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 18:37:47 +0200 (CEST)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTTEw-0005A3-9P
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 12:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jTTA0-0006bO-4F
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:33:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jTT8Q-0005re-2f
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:32:39 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35932
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jTT8P-0005rJ-Hg
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588091460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFhMoHoPF3lnQm2aNb3cWCmaHCTXTt0eHMZPzpSbE6Y=;
 b=dQeHOatKeZ0RxHNoU+uVZy+PTOyg/jU/Nl8yb1PgMpgyLKDr2kWjudUk11bdJVZN5V09cv
 7YEWiLxRj0sfPkqY/vQvYAbzlPBmdc7NzNj/cD4LwLcrxNcpQQCnsVuvszcHLxZdJwgIgj
 HltpZnCBqYumWV/YVzKBJq8BVhnDSzQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-_D-D9tcvOb2Y_Ibp72dh7g-1; Tue, 28 Apr 2020 12:30:58 -0400
X-MC-Unique: _D-D9tcvOb2Y_Ibp72dh7g-1
Received: by mail-wm1-f69.google.com with SMTP id j5so1316883wmi.4
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 09:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Heajt97GMXClDs2lKb0tBcKHamTHVh+0aPVw5s/JDME=;
 b=GnIyexN5gUGQN5NdJfua9rGJM2W9D4V9n31QMwim3r77R9rVhUwWzmXEpw0A7ndCDr
 klj/naxQsWZUO9sQB0JVHDUaXrE5MiGfc9IpzRK1SLRApwyoSzTHlHKsE7EneKgjCeDu
 Tk6gw+QbB9NvhVM3HfoG86OwsXAPm/voTsesZqZQK4CytNfu1FGACep4qOkmtl5rwawW
 YMYw3KZdYUxRKJ6FiXFlkte7MT/CkgARmXQFe2AVxUp74zCfZ/90R3wyoMgACbu3hTM1
 HZGy2JSXimL+1Z64GhLs+WK82EViCRYW5ITEXsr1/4dFqmjm8XFIZIkzGhOb5bajG/V6
 KIZg==
X-Gm-Message-State: AGi0Puaw5k/Pv/yB81Ityd95kDA5TKku09wwkVyFUQmy/SKWSVnd3wJ7
 gikJlOg5rX6tAJVzVE31a7mzhOTqr5cVOqFcAA3SX7j47WXv96Ywb2OaQ2bQ5hFePJdFINqDCAL
 aXzm2u+ELkOL4YkQ=
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr5723031wmk.92.1588091457230; 
 Tue, 28 Apr 2020 09:30:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypLZthERnu2Rz8kv+LqwI1Qg/7CIBIdSF4mTW5MQ81iVwAtcP/wmqLyk7jPT1S1L1gfE9tv43Q==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr5723002wmk.92.1588091456969; 
 Tue, 28 Apr 2020 09:30:56 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 b22sm4863741wmj.1.2020.04.28.09.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:30:56 -0700 (PDT)
Date: Tue, 28 Apr 2020 12:30:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH V2] Add a new PIIX option to control PCI hot unplugging
 of devices on non-root buses
Message-ID: <20200428122931-mutt-send-email-mst@kernel.org>
References: <1588069012-211196-1-git-send-email-ani.sinha@nutanix.com>
 <20200428120426-mutt-send-email-mst@kernel.org>
 <20200428162836.GI1374620@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200428162836.GI1374620@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:11:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Ani Sinha <ani.sinha@nutanix.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, ani@anisinha.ca,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 28, 2020 at 05:28:36PM +0100, Daniel P. Berrang=E9 wrote:
> On Tue, Apr 28, 2020 at 12:05:47PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Apr 28, 2020 at 10:16:52AM +0000, Ani Sinha wrote:
> > > A new option "use_acpi_unplug" is introduced for PIIX which will
> > > selectively only disable hot unplugging of both hot plugged and
> > > cold plugged PCI devices on non-root PCI buses. This will prevent
> > > hot unplugging of devices from Windows based guests from system
> > > tray but will not prevent devices from being hot plugged into the
> > > guest.
> > >=20
> > > It has been tested on Windows guests.
> > >=20
> > > Signed-off-by: Ani Sinha <ani.sinha@nutanix.com>
> >=20
> > It's still a non starter until we find something similar for PCIE and
> > SHPC. Do guests check command status? Can some unplug commands fail?
>=20
> Why does PCIE need anything ? For that we already have ability to
> control hotplugging per-slot in pcie-root-port.

At the moment that does not support unplug of hotplugged devices.


> If SHPC doesn't
> support this that's fine too, it isn't a reason to block its merge
> and use with x86 i440fx machine.
>=20
> >=20
> >=20
> > > ---
> > >  hw/acpi/piix4.c      |  3 +++
> > >  hw/i386/acpi-build.c | 40 ++++++++++++++++++++++++++--------------
> > >  2 files changed, 29 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > index 964d6f5..59fa707 100644
> > > --- a/hw/acpi/piix4.c
> > > +++ b/hw/acpi/piix4.c
> > > @@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
> > > =20
> > >      AcpiPciHpState acpi_pci_hotplug;
> > >      bool use_acpi_pci_hotplug;
> > > +    bool use_acpi_unplug;
> > > =20
> > >      uint8_t disable_s3;
> > >      uint8_t disable_s4;
> > > @@ -633,6 +634,8 @@ static Property piix4_pm_properties[] =3D {
> > >      DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
> > >      DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PM=
State,
> > >                       use_acpi_pci_hotplug, true),
> > > +    DEFINE_PROP_BOOL("acpi-pci-hotunplug-enable-bridge", PIIX4PMStat=
e,
> > > +                     use_acpi_unplug, true),
> > >      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
> > >                       acpi_memory_hotplug.is_enabled, true),
> > >      DEFINE_PROP_END_OF_LIST(),
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 23c77ee..71b3ac3 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
> > >      bool s3_disabled;
> > >      bool s4_disabled;
> > >      bool pcihp_bridge_en;
> > > +    bool pcihup_bridge_en;
> > >      uint8_t s4_val;
> > >      AcpiFadtData fadt;
> > >      uint16_t cpu_hp_io_base;
> > > @@ -240,6 +241,9 @@ static void acpi_get_pm_info(MachineState *machin=
e, AcpiPmInfo *pm)
> > >      pm->pcihp_bridge_en =3D
> > >          object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-=
support",
> > >                                   NULL);
> > > +    pm->pcihup_bridge_en =3D
> > > +        object_property_get_bool(obj, "acpi-pci-hotunplug-enable-bri=
dge",
> > > +                                 NULL);
> > >  }
> > > =20
> > >  static void acpi_get_misc_info(AcpiMiscInfo *info)
> > > @@ -451,7 +455,8 @@ static void build_append_pcihp_notify_entry(Aml *=
method, int slot)
> > >  }
> > > =20
> > >  static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *=
bus,
> > > -                                         bool pcihp_bridge_en)
> > > +                                         bool pcihp_bridge_en,
> > > +                                         bool pcihup_bridge_en)
> > >  {
> > >      Aml *dev, *notify_method =3D NULL, *method;
> > >      QObject *bsel;
> > > @@ -479,11 +484,14 @@ static void build_append_pci_bus_devices(Aml *p=
arent_scope, PCIBus *bus,
> > >                  dev =3D aml_device("S%.02X", PCI_DEVFN(slot, 0));
> > >                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot))=
);
> > >                  aml_append(dev, aml_name_decl("_ADR", aml_int(slot <=
< 16)));
> > > -                method =3D aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> > > -                aml_append(method,
> > > -                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_S=
UN"))
> > > -                );
> > > -                aml_append(dev, method);
> > > +                if (pcihup_bridge_en || pci_bus_is_root(bus)) {
> > > +                    method =3D aml_method("_EJ0", 1, AML_NOTSERIALIZ=
ED);
> > > +                    aml_append(method,
> > > +                               aml_call2("PCEJ", aml_name("BSEL"),
> > > +                                         aml_name("_SUN"))
> > > +                        );
> > > +                    aml_append(dev, method);
> > > +                }
> > >                  aml_append(parent_scope, dev);
> > > =20
> > >                  build_append_pcihp_notify_entry(notify_method, slot)=
;
> > > @@ -537,12 +545,14 @@ static void build_append_pci_bus_devices(Aml *p=
arent_scope, PCIBus *bus,
> > >              /* add _SUN/_EJ0 to make slot hotpluggable  */
> > >              aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> > > =20
> > > -            method =3D aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> > > -            aml_append(method,
> > > -                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN")=
)
> > > -            );
> > > -            aml_append(dev, method);
> > > -
> > > +            if (pcihup_bridge_en || pci_bus_is_root(bus)) {
> > > +                method =3D aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> > > +                aml_append(method,
> > > +                           aml_call2("PCEJ", aml_name("BSEL"),
> > > +                                     aml_name("_SUN"))
> > > +                    );
> > > +                aml_append(dev, method);
> > > +            }
> > >              if (bsel) {
> > >                  build_append_pcihp_notify_entry(notify_method, slot)=
;
> > >              }
> > > @@ -553,7 +563,8 @@ static void build_append_pci_bus_devices(Aml *par=
ent_scope, PCIBus *bus,
> > >               */
> > >              PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(pd=
ev));
> > > =20
> > > -            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_=
en);
> > > +            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_=
en,
> > > +                                         pcihup_bridge_en);
> > >          }
> > >          /* slot descriptor has been composed, add it into parent con=
text */
> > >          aml_append(parent_scope, dev);
> > > @@ -2196,7 +2207,8 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
> > >          if (bus) {
> > >              Aml *scope =3D aml_scope("PCI0");
> > >              /* Scan all PCI buses. Generate tables to support hotplu=
g. */
> > > -            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridg=
e_en);
> > > +            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridg=
e_en,
> > > +                                         pm->pcihup_bridge_en);
> > > =20
> > >              if (TPM_IS_TIS_ISA(tpm)) {
> > >                  if (misc->tpm_version =3D=3D TPM_VERSION_2_0) {
> > > --=20
> > > 1.9.4
> >=20
> >=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|


