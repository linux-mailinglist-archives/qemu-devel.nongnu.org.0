Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C83D4CA4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 10:13:03 +0200 (CEST)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7ZFt-0001H1-Ua
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 04:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m7ZF3-0000bH-Ab
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 04:12:09 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:40513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m7ZF1-0004Mr-3Z
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 04:12:08 -0400
Received: by mail-oi1-x22e.google.com with SMTP id q6so7186470oiw.7
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOuaoeIXFqpcPYKF8WBl03ovxJiX9t4/gzaWWDqTMTs=;
 b=IE1aAgwEV+zqnHKmY9asCJWx2V/F0Hm2bEXTkqmHV2IuAhi4xv5oEgYz85ecVNYezO
 6L3SzL+GG6+IHoFPYShBRLTx5yjjsOnj0cWzzClrGcttC5JvGhw2J9A6dy5Pz7eBIBp+
 mDggrQpylkuPa15rQ4AkXLISaXEgI/qrBWm3NMKOxMg/k/usJdUEFdEQsyBHjBmSdDD6
 aF2P4i5LTR1GiuKsVmvD3nYOyn4GyH+kPsmsX+gBfVMzyN6/64s6x+ReRg9PLESVWwlD
 SF8Dn7sh6+wkvh6419tfwDGZmqM+417A/UQIoolLkHkCGQE9dls5cPcEMZYZQ8bHdhmf
 x3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOuaoeIXFqpcPYKF8WBl03ovxJiX9t4/gzaWWDqTMTs=;
 b=kH7vkyurkt2g7Xa5IUZvyfFxSpjXMBL97WEpgSZfktJnJ6fr36Uz6VlR1xUDoeQQMC
 BLCi5ysMsKnmNQbwexE7a/zo+c2oUlbsZks7SCNGd18syCBnhWsd/BAHj84aBAK3h1oF
 vGFppNYssF/jyXGx3CBDAJUo5CGy2AAe4rmR19cs8SQPfpIlE5RfkxVTDvqb1sbzET51
 vMVLjULg6CzwF6pSFHTNEgxoZC2JK3sVWSct/PAhODUyHOpdJvTqmPO09Pp983SECyJa
 G6XrsyWBqaHYdKAjzbtpjoHFaw6NSgL4pyJ3hOXW6VRvQTxpPsQbGke6mQ7pxcFrtHBH
 zuwQ==
X-Gm-Message-State: AOAM530JqsFxF8HI16CeavXOM77Rt2QrN4dNljy6FoQtmvTKPJBXWu4d
 vDjjyCGAvjQKgGwilM10ht49UlNJAiSynX10VKY=
X-Google-Smtp-Source: ABdhPJzCDIhYeJybhz4uK4dGjgCQlE8N0RHJv5mgT0odk7IlAFdxy7dbUX2+/GZZUyJ7Ny6DPlhC0uZwIt7hbCFNNGA=
X-Received: by 2002:a05:6808:1448:: with SMTP id
 x8mr8018375oiv.57.1627200725196; 
 Sun, 25 Jul 2021 01:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210723090424.2092226-1-imammedo@redhat.com>
In-Reply-To: <20210723090424.2092226-1-imammedo@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 25 Jul 2021 11:11:54 +0300
Message-ID: <CAC_L=vVHYMiiKGB3ZGjfTZAzDfkHnMPpi4gVDYL-fX1yKZH80g@mail.gmail.com>
Subject: Re: [PATCH v2] acpi: x86: pcihp: add support hotplug on multifunction
 bridges
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000034244105c7ee31e1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034244105c7ee31e1
Content-Type: text/plain; charset="UTF-8"

Hi Igor,

On Fri, Jul 23, 2021 at 12:04 PM Igor Mammedov <imammedo@redhat.com> wrote:

> Commit [1] switched PCI hotplug from native to ACPI one by default.
>
> That however breaks hotplug on following CLI that used to work:
>    -nodefaults -machine q35 \
>    -device
> pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1
> \
>    -device
> pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
>
> where PCI device is hotplugged to pcie-root-port-1 with error on guest
> side:
>
>   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT],
> AE_NOT_FOUND (20201113/psargs-330)
>   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
> (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: Aborting method \_GPE._E01 due to previous error
> (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
> (20201113/evgpe-515)
>
> cause is that QEMU's ACPI hotplug never supported functions other then 0
> and due to bug it was generating notification entries for not described
> functions.
>
> Technically there is no reason not to describe cold-plugged bridges
> (root ports) on functions other then 0, as they similarly to bridge
> on function 0 are unpluggable.
>
> So since we need to describe multifunction devices iterate over
> fuctions as well. But describe only cold-plugged bridges[root ports]
> on functions other than 0 as well.
>
> 1)
> Fixes: 17858a169508609ca9063c544833e5a1adeb7b52 (hw/acpi/ich9: Set ACPI
> PCI hot-plug as default on Q35)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> ---
> v2:
>   * squash 1/2 "acpi: x86: pcihp: cleanup devfn usage in
> build_append_pci_bus_devices()"
>     into the main patch
>   * drop Sxx -> Sxxx change as devfn fits into 2 digits anyway
>   * cleanup PCI_FUN/DEVFN and use func/devfn local variables instead
>   * fix typos
> ---
>  hw/i386/acpi-build.c | 44 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..a33ac8b91e 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>      Aml *dev, *notify_method = NULL, *method;
>      QObject *bsel;
>      PCIBus *sec;
> -    int i;
> +    int devfn;
>
>      bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL,
> NULL);
>      if (bsel) {
> @@ -384,23 +384,31 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>          notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
>      }
>
> -    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
> +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>          DeviceClass *dc;
>          PCIDeviceClass *pc;
> -        PCIDevice *pdev = bus->devices[i];
> -        int slot = PCI_SLOT(i);
> +        PCIDevice *pdev = bus->devices[devfn];
> +        int slot = PCI_SLOT(devfn);
> +        int func = PCI_FUNC(devfn);
> +        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
> +        int adr = slot << 16 | func;
>          bool hotplug_enabled_dev;
>          bool bridge_in_acpi;
>          bool cold_plugged_bridge;
>
>          if (!pdev) {
> -            if (bsel) { /* add hotplug slots for non present devices */
> +            /*
> +             * add hotplug slots for non present devices.
> +             * hotplug is supported only for non-multifunction device
> +             * so generate device description only for function 0
> +             */
> +            if (bsel && !func) {
>                  if (pci_bus_is_express(bus) && slot > 0) {
>                      break;
>                  }
> -                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> +                dev = aml_device("S%.02X", devfn);
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> -                aml_append(dev, aml_name_decl("_ADR", aml_int(slot <<
> 16)));
> +                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>                  method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
>                  aml_append(method,
>                      aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> @@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>              continue;
>          }
>
> -        /* start to compose PCI slot descriptor */
> -        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> -        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> +        /*
> +         * allow describing coldplugged bridges in ACPI even if they are
> not
> +         * on function 0, as they are not unpluggable, for all other
> devices
> +         * generate description only for function 0 per slot
> +         */
> +        if (func && !bridge_in_acpi) {
> +            continue;
> +        }
> +
> +        /* start to compose PCI device descriptor */
> +        dev = aml_device("S%.02X", devfn);
> +        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>
>          if (bsel) {
>              /*
> @@ -496,7 +513,7 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>
>              build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
>          }
> -        /* slot descriptor has been composed, add it into parent context
> */
> +        /* device descriptor has been composed, add it into parent
> context */
>          aml_append(parent_scope, dev);
>      }
>
> @@ -525,13 +542,12 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>          /* Notify about child bus events in any case */
>          if (pcihp_bridge_en) {
>              QLIST_FOREACH(sec, &bus->child, sibling) {
> -                int32_t devfn = sec->parent_dev->devfn;
> -
>                  if (pci_bus_is_root(sec)) {
>                      continue;
>                  }
>
> -                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +                aml_append(method, aml_name("^S%.02X.PCNT",
> +                                            sec->parent_dev->devfn));
>              }
>          }
>
> --
> 2.27.0
>
>

Thanks for fixing it!

 Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--00000000000034244105c7ee31e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Igor,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 12:04 PM Igor Mammedo=
v &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Commit [1] =
switched PCI hotplug from native to ACPI one by default.<br>
<br>
That however breaks hotplug on following CLI that used to work:<br>
=C2=A0 =C2=A0-nodefaults -machine q35 \<br>
=C2=A0 =C2=A0-device pcie-root-port,id=3Dpcie-root-port-0,multifunction=3Do=
n,bus=3Dpcie.0,addr=3D0x1,chassis=3D1 \<br>
=C2=A0 =C2=A0-device pcie-root-port,id=3Dpcie-root-port-1,port=3D0x1,addr=
=3D0x1.0x1,bus=3Dpcie.0,chassis=3D2<br>
<br>
where PCI device is hotplugged to pcie-root-port-1 with error on guest side=
:<br>
<br>
=C2=A0 ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_=
FOUND (20201113/psargs-330)<br>
=C2=A0 ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE=
_NOT_FOUND) (20201113/psparse-531)<br>
=C2=A0 ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT=
_FOUND) (20201113/psparse-531)<br>
=C2=A0 ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (202011=
13/evgpe-515)<br>
<br>
cause is that QEMU&#39;s ACPI hotplug never supported functions other then =
0<br>
and due to bug it was generating notification entries for not described<br>
functions.<br>
<br>
Technically there is no reason not to describe cold-plugged bridges<br>
(root ports) on functions other then 0, as they similarly to bridge<br>
on function 0 are unpluggable.<br>
<br>
So since we need to describe multifunction devices iterate over<br>
fuctions as well. But describe only cold-plugged bridges[root ports]<br>
on functions other than 0 as well.<br>
<br>
1)<br>
Fixes: 17858a169508609ca9063c544833e5a1adeb7b52 (hw/acpi/ich9: Set ACPI PCI=
 hot-plug as default on Q35)<br>
Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;<br>
Reported-by: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" targe=
t=3D"_blank">lvivier@redhat.com</a>&gt;<br>
---<br>
v2:<br>
=C2=A0 * squash 1/2 &quot;acpi: x86: pcihp: cleanup devfn usage in=C2=A0 bu=
ild_append_pci_bus_devices()&quot;<br>
=C2=A0 =C2=A0 into the main patch<br>
=C2=A0 * drop Sxx -&gt; Sxxx change as devfn fits into 2 digits anyway<br>
=C2=A0 * cleanup PCI_FUN/DEVFN and use func/devfn local variables instead<b=
r>
=C2=A0 * fix typos<br>
---<br>
=C2=A0hw/i386/acpi-build.c | 44 ++++++++++++++++++++++++++++++-------------=
-<br>
=C2=A01 file changed, 30 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
index 17836149fe..a33ac8b91e 100644<br>
--- a/hw/i386/acpi-build.c<br>
+++ b/hw/i386/acpi-build.c<br>
@@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml *parent_sc=
ope, PCIBus *bus,<br>
=C2=A0 =C2=A0 =C2=A0Aml *dev, *notify_method =3D NULL, *method;<br>
=C2=A0 =C2=A0 =C2=A0QObject *bsel;<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *sec;<br>
-=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 int devfn;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bsel =3D object_property_get_qobject(OBJECT(bus), ACPI_=
PCIHP_PROP_BSEL, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (bsel) {<br>
@@ -384,23 +384,31 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0notify_method =3D aml_method(&quot;DVNT&q=
uot;, 2, AML_NOTSERIALIZED);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(bus-&gt;devices); i +=3D PCI=
_FUNC_MAX) {<br>
+=C2=A0 =C2=A0 for (devfn =3D 0; devfn &lt; ARRAY_SIZE(bus-&gt;devices); de=
vfn++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceClass *dc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCIDeviceClass *pc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIDevice *pdev =3D bus-&gt;devices[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int slot =3D PCI_SLOT(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIDevice *pdev =3D bus-&gt;devices[devfn];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int slot =3D PCI_SLOT(devfn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int func =3D PCI_FUNC(devfn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus =
Types, PCI type */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int adr =3D slot &lt;&lt; 16 | func;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool hotplug_enabled_dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool bridge_in_acpi;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool cold_plugged_bridge;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pdev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsel) { /* add hotplug slots=
 for non present devices */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* add hotplug slots for no=
n present devices.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* hotplug is supported onl=
y for non-multifunction device<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so generate device descr=
iption only for function 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsel &amp;&amp; !func) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pci_bus_i=
s_express(bus) &amp;&amp; slot &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D aml_device=
(&quot;S%.02X&quot;, PCI_DEVFN(slot, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D aml_device=
(&quot;S%.02X&quot;, devfn);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(de=
v, aml_name_decl(&quot;_SUN&quot;, aml_int(slot)));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(dev, am=
l_name_decl(&quot;_ADR&quot;, aml_int(slot &lt;&lt; 16)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(dev, am=
l_name_decl(&quot;_ADR&quot;, aml_int(adr)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D am=
l_method(&quot;_EJ0&quot;, 1, AML_NOTSERIALIZED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(me=
thod,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0aml_call2(&quot;PCEJ&quot;, aml_name(&quot;BSEL&quot;), aml_name(&quot;_=
SUN&quot;))<br>
@@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml *parent_s=
cope, PCIBus *bus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start to compose PCI slot descriptor */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D aml_device(&quot;S%.02X&quot;, PCI_DEV=
FN(slot, 0));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(dev, aml_name_decl(&quot;_ADR&quot;=
, aml_int(slot &lt;&lt; 16)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* allow describing coldplugged bridges i=
n ACPI even if they are not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* on function 0, as they are not unplugg=
able, for all other devices<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* generate description only for function=
 0 per slot<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (func &amp;&amp; !bridge_in_acpi) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start to compose PCI device descriptor */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D aml_device(&quot;S%.02X&quot;, devfn);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(dev, aml_name_decl(&quot;_ADR&quot;=
, aml_int(adr)));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bsel) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
@@ -496,7 +513,7 @@ static void build_append_pci_bus_devices(Aml *parent_sc=
ope, PCIBus *bus,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_append_pci_bus_device=
s(dev, sec_bus, pcihp_bridge_en);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* slot descriptor has been composed, add it i=
nto parent context */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* device descriptor has been composed, add it=
 into parent context */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(parent_scope, dev);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -525,13 +542,12 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Notify about child bus events in any c=
ase */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pcihp_bridge_en) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(sec, &amp;bus=
-&gt;child, sibling) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int32_t devfn =3D =
sec-&gt;parent_dev-&gt;devfn;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pci_bus_i=
s_root(sec)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method,=
 aml_name(&quot;^S%.02X.PCNT&quot;, devfn));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method,=
 aml_name(&quot;^S%.02X.PCNT&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sec-&gt;parent_dev-&gt;devfn));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.27.0<br>
<br></blockquote><div><br></div><div><br></div><div>Thanks for fixing it!</=
div><div><br></div><div>=C2=A0Reviewed-by: Marcel Apfelbaum &lt;<a href=3D"=
mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel.apfelbaum@gmail=
.com</a>&gt;</div><div><br></div><div>Thanks,</div><div>Marcel</div></div><=
/div>

--00000000000034244105c7ee31e1--

