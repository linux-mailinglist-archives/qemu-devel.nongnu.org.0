Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C68164BD7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 18:25:28 +0100 (CET)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4T6G-0008EQ-0f
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 12:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4T5D-0007Mh-8Q
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 12:24:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4T5B-0001qP-RB
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 12:24:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20334
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4T5B-0001ph-NL
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 12:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582133060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIqN5QV1AHFKI0WqFkuZnEim4oVZjnKqt6Fy3jMHocs=;
 b=bWr9J2i4Apx9vUmCfq/z0D1m5k6zS9PaARJ/NQepFrLRUtR25odnBRv011N3w643wfjCSi
 Ah0wli2ci6xUSMiGn0Q2aUNxSVfaNsI3xoDtB4EUV1vpbAX94KWGmccbhcEBmn3Glxus5d
 fEoOisegWCeeahRMAaK66jN5BxCxkI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-_q-FEemBNpyLtOGxf9uFPg-1; Wed, 19 Feb 2020 12:24:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABB4818C35A0
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 17:24:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33A048CCC5;
 Wed, 19 Feb 2020 17:24:04 +0000 (UTC)
Date: Wed, 19 Feb 2020 18:24:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v2] pcie_root_port: Add enable_hotplug option
Message-ID: <20200219182402.10132e77@redhat.com>
In-Reply-To: <20200219145540.648365-1-jusual@redhat.com>
References: <20200219145540.648365-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _q-FEemBNpyLtOGxf9uFPg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?B?SsOhbg==?= Tomko <jtomko@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Laine Stump <laine@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Feb 2020 15:55:40 +0100
Julia Suvorova <jusual@redhat.com> wrote:

> Make hot-plug/hot-unplug on PCIe Root Ports optional to allow libvirt
> manage it and restrict unplug for the whole machine. This is going to
> prevent user-initiated unplug in guests (Windows mostly).
> Hotplug is enabled by default.
> Usage:
>     -device pcie-root-port,enable-hotplug=3Dfalse,...
>=20
> If you want to disable hot-unplug on some downstream ports of one
> switch, disable hot-unplug on PCIe Root Port connected to the upstream
> port as well as on the selected downstream ports.
>=20
> Discussion related:
>     https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00530.html
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v1: https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04868.html
>=20
> v2:
>     * change name of the option to 'enable-hotplug' [Laine]
>     * change order of enabling capability bits [Igor]
>     * enable HPS bit [Igor]
>     * add option to xio3130_downstream [J=C3=A1n]
>=20
>  hw/pci-bridge/pcie_root_port.c     |  3 ++-
>  hw/pci-bridge/xio3130_downstream.c |  3 ++-
>  hw/pci/pcie.c                      | 11 +++++++----
>  include/hw/pci/pcie.h              |  2 +-
>  include/hw/pci/pcie_port.h         |  1 +
>  5 files changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_por=
t.c
> index 0ba4e4dea4..6eb2bc4564 100644
> --- a/hw/pci-bridge/pcie_root_port.c
> +++ b/hw/pci-bridge/pcie_root_port.c
> @@ -94,7 +94,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
> =20
>      pcie_cap_arifwd_init(d);
>      pcie_cap_deverr_init(d);
> -    pcie_cap_slot_init(d, s->slot);
> +    pcie_cap_slot_init(d, s);
>      pcie_cap_root_init(d);
> =20
>      pcie_chassis_create(s->chassis);
> @@ -147,6 +147,7 @@ static Property rp_props[] =3D {
>      DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
>                      QEMU_PCIE_SLTCAP_PCP_BITNR, true),
>      DEFINE_PROP_BOOL("disable-acs", PCIESlot, disable_acs, false),
> +    DEFINE_PROP_BOOL("enable-hotplug", PCIESlot, enable_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
> =20
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_d=
ownstream.c
> index 153a4acad2..e8c388c547 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -94,7 +94,7 @@ static void xio3130_downstream_realize(PCIDevice *d, Er=
ror **errp)
>      }
>      pcie_cap_flr_init(d);
>      pcie_cap_deverr_init(d);
> -    pcie_cap_slot_init(d, s->slot);
> +    pcie_cap_slot_init(d, s);
>      pcie_cap_arifwd_init(d);
> =20
>      pcie_chassis_create(s->chassis);
> @@ -136,6 +136,7 @@ static void xio3130_downstream_exitfn(PCIDevice *d)
>  static Property xio3130_downstream_props[] =3D {
>      DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
>                      QEMU_PCIE_SLTCAP_PCP_BITNR, true),
> +    DEFINE_PROP_BOOL("enable-hotplug", PCIESlot, enable_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
> =20
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 08718188bb..a963c0f82e 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -495,7 +495,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *=
hotplug_dev,
> =20
>  /* pci express slot for pci express root/downstream port
>     PCI express capability slot registers */
> -void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot)
> +void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
>  {
>      uint32_t pos =3D dev->exp.exp_cap;
> =20
> @@ -505,13 +505,16 @@ void pcie_cap_slot_init(PCIDevice *dev, uint16_t sl=
ot)
>      pci_long_test_and_clear_mask(dev->config + pos + PCI_EXP_SLTCAP,
>                                   ~PCI_EXP_SLTCAP_PSN);
>      pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
> -                               (slot << PCI_EXP_SLTCAP_PSN_SHIFT) |
> +                               (s->slot << PCI_EXP_SLTCAP_PSN_SHIFT) |
>                                 PCI_EXP_SLTCAP_EIP |
> -                               PCI_EXP_SLTCAP_HPS |
> -                               PCI_EXP_SLTCAP_HPC |
>                                 PCI_EXP_SLTCAP_PIP |
>                                 PCI_EXP_SLTCAP_AIP |
>                                 PCI_EXP_SLTCAP_ABP);
> +    if (s->enable_hotplug) {
> +        pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
> +                                   PCI_EXP_SLTCAP_HPS |
> +                                   PCI_EXP_SLTCAP_HPC);
> +    }
> =20
>      if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
>          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index 7064875835..14c58ebdb6 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -104,7 +104,7 @@ void pcie_cap_deverr_reset(PCIDevice *dev);
>  void pcie_cap_lnkctl_init(PCIDevice *dev);
>  void pcie_cap_lnkctl_reset(PCIDevice *dev);
> =20
> -void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot);
> +void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s);
>  void pcie_cap_slot_reset(PCIDevice *dev);
>  void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_ctl, uint16_t *slt_=
sta);
>  void pcie_cap_slot_write_config(PCIDevice *dev,
> diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> index 4b3d254b08..71be598dda 100644
> --- a/include/hw/pci/pcie_port.h
> +++ b/include/hw/pci/pcie_port.h
> @@ -55,6 +55,7 @@ struct PCIESlot {
> =20
>      /* Disable ACS (really for a pcie_root_port) */
>      bool        disable_acs;
> +    bool        enable_hotplug;
>      QLIST_ENTRY(PCIESlot) next;
>  };
> =20


