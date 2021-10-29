Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23F743F7FD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:47:41 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMc0-0003Wm-Dv
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mgMXK-0002fo-3X
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:42:51 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:36181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mgMXG-0000Sl-FS
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:42:49 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HgZCL0FKxz4xcB; Fri, 29 Oct 2021 18:42:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635493358;
 bh=SR1lVd6PG+8P0V1aRR4AJOumbwOV7o90q2j9EopLnoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QncDbYAN64Fas7bL7Sq6BMJBYeMufjVXXtJKrDnLBZhbpZY31U8tAqHAQQJO7KC0D
 hHGe4vNWyB/DwZUNgDij7ruQGBZ+ZugMmflXz2stGLihyKbRbYXD+PPCsfpzvFEFs9
 yNPq/GyuX9Q6J84Vck0fQF1gtCL5ECGY22LqRnbg=
Date: Fri, 29 Oct 2021 11:06:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 2/5] pci: Export pci_for_each_device_under_bus*()
Message-ID: <YXs68hRtHz1c5L/M@yekko>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X/ZQS5hzCCb4zTYy"
Content-Disposition: inline
In-Reply-To: <20211028043129.38871-3-peterx@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--X/ZQS5hzCCb4zTYy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 12:31:26PM +0800, Peter Xu wrote:
> They're actually more commonly used than the helper without _under_bus, b=
ecause
> most callers do have the pci bus on hand.  After exporting we can switch =
a lot
> of the call sites to use these two helpers.
>=20
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/i386/acpi-build.c       |  5 ++---
>  hw/pci/pci.c               | 10 +++++-----
>  hw/pci/pcie.c              |  4 +---
>  hw/ppc/spapr_pci.c         | 12 +++++-------
>  hw/ppc/spapr_pci_nvlink2.c |  7 +++----
>  hw/ppc/spapr_pci_vfio.c    |  4 ++--
>  hw/s390x/s390-pci-bus.c    |  5 ++---
>  hw/xen/xen_pt.c            |  4 ++--
>  include/hw/pci/pci.h       |  5 +++++
>  9 files changed, 27 insertions(+), 29 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 81418b7911..a76b17ed92 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2132,8 +2132,7 @@ dmar_host_bridges(Object *obj, void *opaque)
>          PCIBus *bus =3D PCI_HOST_BRIDGE(obj)->bus;
> =20
>          if (bus && !pci_bus_bypass_iommu(bus)) {
> -            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
> -                                scope_blob);
> +            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
>          }
>      }
> =20
> @@ -2339,7 +2338,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
>          PCIBus *bus =3D PCI_HOST_BRIDGE(obj)->bus;
> =20
>          if (bus && !pci_bus_bypass_iommu(bus)) {
> -            pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd=
_blob);
> +            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
>          }
>      }
> =20
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 17e59cb3a3..4a84e478ce 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1654,9 +1654,9 @@ static const pci_class_desc pci_class_descriptions[=
] =3D
>      { 0, NULL}
>  };
> =20
> -static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> -                                                  pci_bus_dev_fn fn,
> -                                                  void *opaque)
> +void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> +                                           pci_bus_dev_fn fn,
> +                                           void *opaque)
>  {
>      PCIDevice *d;
>      int devfn;
> @@ -1679,8 +1679,8 @@ void pci_for_each_device_reverse(PCIBus *bus, int b=
us_num,
>      }
>  }
> =20
> -static void pci_for_each_device_under_bus(PCIBus *bus,
> -                                          pci_bus_dev_fn fn, void *opaqu=
e)
> +void pci_for_each_device_under_bus(PCIBus *bus,
> +                                   pci_bus_dev_fn fn, void *opaque)
>  {
>      PCIDevice *d;
>      int devfn;
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 6e95d82903..914a9bf3d1 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -694,9 +694,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>          (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
>          (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) !=3D PCI_EXP_SLTCTL_PIC_O=
FF)) {
>          PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> -        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -                            pcie_unplug_device, NULL);
> -
> +        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
>          pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
>                                       PCI_EXP_SLTSTA_PDS);
>          if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7430bd6314..5bfd4aa9e5 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1317,8 +1317,7 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PC=
IBus *bus,
>                            RESOURCE_CELLS_SIZE));
> =20
>      assert(bus);
> -    pci_for_each_device_reverse(bus, pci_bus_num(bus),
> -                                spapr_dt_pci_device_cb, &cbinfo);
> +    pci_for_each_device_under_bus_reverse(bus, spapr_dt_pci_device_cb, &=
cbinfo);
>      if (cbinfo.err) {
>          return cbinfo.err;
>      }
> @@ -2306,8 +2305,8 @@ static void spapr_phb_pci_enumerate_bridge(PCIBus *=
bus, PCIDevice *pdev,
>          return;
>      }
> =20
> -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -                        spapr_phb_pci_enumerate_bridge, bus_no);
> +    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_enumerate_bridg=
e,
> +                                  bus_no);
>      pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, *bus_no, 1);
>  }
> =20
> @@ -2316,9 +2315,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *=
phb)
>      PCIBus *bus =3D PCI_HOST_BRIDGE(phb)->bus;
>      unsigned int bus_no =3D 0;
> =20
> -    pci_for_each_device(bus, pci_bus_num(bus),
> -                        spapr_phb_pci_enumerate_bridge,
> -                        &bus_no);
> +    pci_for_each_device_under_bus(bus, spapr_phb_pci_enumerate_bridge,
> +                                  &bus_no);
> =20
>  }
> =20
> diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
> index 8ef9b40a18..7fb0cf4d04 100644
> --- a/hw/ppc/spapr_pci_nvlink2.c
> +++ b/hw/ppc/spapr_pci_nvlink2.c
> @@ -164,8 +164,7 @@ static void spapr_phb_pci_collect_nvgpu(PCIBus *bus, =
PCIDevice *pdev,
>          return;
>      }
> =20
> -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -                        spapr_phb_pci_collect_nvgpu, opaque);
> +    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_collect_nvgpu, =
opaque);
>  }
> =20
>  void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
> @@ -183,8 +182,8 @@ void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error=
 **errp)
>      sphb->nvgpus->nv2_atsd_current =3D sphb->nv2_atsd_win_addr;
> =20
>      bus =3D PCI_HOST_BRIDGE(sphb)->bus;
> -    pci_for_each_device(bus, pci_bus_num(bus),
> -                        spapr_phb_pci_collect_nvgpu, sphb->nvgpus);
> +    pci_for_each_device_under_bus(bus, spapr_phb_pci_collect_nvgpu,
> +                                  sphb->nvgpus);
> =20
>      if (sphb->nvgpus->err) {
>          error_propagate(errp, sphb->nvgpus->err);
> diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> index f3b37df8ea..2a76b4e0b5 100644
> --- a/hw/ppc/spapr_pci_vfio.c
> +++ b/hw/ppc/spapr_pci_vfio.c
> @@ -164,8 +164,8 @@ static void spapr_phb_vfio_eeh_clear_dev_msix(PCIBus =
*bus,
> =20
>  static void spapr_phb_vfio_eeh_clear_bus_msix(PCIBus *bus, void *opaque)
>  {
> -       pci_for_each_device(bus, pci_bus_num(bus),
> -                           spapr_phb_vfio_eeh_clear_dev_msix, NULL);
> +       pci_for_each_device_under_bus(bus, spapr_phb_vfio_eeh_clear_dev_m=
six,
> +                                     NULL);
>  }
> =20
>  static void spapr_phb_vfio_eeh_pre_reset(SpaprPhbState *sphb)
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 6fafffb029..1b51a72838 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1163,8 +1163,7 @@ static void s390_pci_enumerate_bridge(PCIBus *bus, =
PCIDevice *pdev,
>      }
> =20
>      /* Assign numbers to all child bridges. The last is the highest numb=
er. */
> -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -                        s390_pci_enumerate_bridge, s);
> +    pci_for_each_device_under_bus(sec_bus, s390_pci_enumerate_bridge, s);
>      pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, s->bus_no, 1);
>  }
> =20
> @@ -1193,7 +1192,7 @@ static void s390_pcihost_reset(DeviceState *dev)
>       * on every system reset, we also have to reassign numbers.
>       */
>      s->bus_no =3D 0;
> -    pci_for_each_device(bus, pci_bus_num(bus), s390_pci_enumerate_bridge=
, s);
> +    pci_for_each_device_under_bus(bus, s390_pci_enumerate_bridge, s);
>  }
> =20
>  static void s390_pcihost_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index ca0a98187e..027190fa44 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -615,8 +615,8 @@ static void xen_pt_region_update(XenPCIPassthroughSta=
te *s,
>      }
> =20
>      args.type =3D d->io_regions[bar].type;
> -    pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
> -                        xen_pt_check_bar_overlap, &args);
> +    pci_for_each_device_under_bus(pci_get_bus(d),
> +                                  xen_pt_check_bar_overlap, &args);
>      if (args.rc) {
>          XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
>                      ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 4a8740b76b..5c4016b995 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -467,6 +467,11 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
>  void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
>                                   pci_bus_dev_fn fn,
>                                   void *opaque);
> +void pci_for_each_device_under_bus(PCIBus *bus,
> +                                   pci_bus_dev_fn fn, void *opaque);
> +void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> +                                           pci_bus_dev_fn fn,
> +                                           void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X/ZQS5hzCCb4zTYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF7OvAACgkQbDjKyiDZ
s5Ihxw//RXRtdDkn071zVlZUM4/lTGoAHGG9dGw0ow6vWClu8JflFVZ0fBSF4L1e
j+Vx39YyElK2j5nTiboCwqya7+CbxSIfxJJw/34GlYAiF1MAYjbtTOixcYBmC8T4
qCnEKmNm18p4d15hfxVgueTssCBMsXd73BkJPJJZftGpKbX7/pqtIO8QW9rssH+M
riPZSxMjPKJjD+skxCauoevnrpvQKjbSbrBFBzBXeG9DTjLz4xtmnQaw7Y+dpN1T
EDC7n4qHpGPfQL4er4irG7dQlt+xwkpC1+jvigLVbnuQD3v8UNQTsgIcz/ZN9CP4
YbPsnLkJYJfFF1ktDnLFOwp0neaTLuiliMW5BCvss2zJps2m2UbV+fdj+cNVTboZ
f3SfX7BbtEbSDR1mtU4XH0nUc4QjqEw/Zp7xDDC0zpS+sYJFni4o1NQePUNMfbog
bR+iOLX9vRF754cD2e8fTsN5fRo+SRdh8Cy85a5Qq+gjKtWuZVrUG3L6u0b8iC15
ki7s2WtRgPGzNFQSk7uVPG9HaZXdKx/Wa/jcQvP1KGvsjx3G5SXt/3xQYaCBCvXg
a71SW89gQWvTp9nkWe/isyL8GktdIpv6bQjAiBhuWu+y+taGXJPeJyfpVH4gC8RR
oMX2VGheEfxE87IA+R2u3e9oNTpL8YkBYn6KUIsQhOZJv6+gUYs=
=YwYD
-----END PGP SIGNATURE-----

--X/ZQS5hzCCb4zTYy--

