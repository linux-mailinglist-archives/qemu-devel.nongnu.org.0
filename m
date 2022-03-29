Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82004EAD3D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:38:35 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZB7J-0006ar-EU
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:38:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZB4N-0004kD-N7
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZB4L-0003mn-Vq
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648557329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wBtmBtkYXMMriH5uLY7vrsFyMEt9xmT7ix/NdxMnPnc=;
 b=VsjuLgHyfIUlA0lxOYPlxPGEQo+UKkE1dD41zaxFPDPR8O+yIO9H4u4LzBXqJO2LllSutA
 JqTSMI6Uo2RmHpbb+MLj8NS8nWKoHjqCp8PzUKqbrt9BOxTIxML4ynaealze/4jtBwpOkv
 +PLjiF3GXJzWf6BGl4Fag1y/jTuX30M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-_VCx91cMMDOScsLAplGc1g-1; Tue, 29 Mar 2022 08:35:25 -0400
X-MC-Unique: _VCx91cMMDOScsLAplGc1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B79FD801585;
 Tue, 29 Mar 2022 12:35:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E03E1457F06;
 Tue, 29 Mar 2022 12:35:24 +0000 (UTC)
Date: Tue, 29 Mar 2022 13:35:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gOwcFQzSGxDCqdss"
Content-Disposition: inline
In-Reply-To: <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gOwcFQzSGxDCqdss
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 03:19:41PM -0400, Jagannathan Raman wrote:
> Assign separate address space for each device in the remote processes.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/remote/iommu.h | 18 ++++++++
>  hw/remote/iommu.c         | 95 +++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS               |  2 +
>  hw/remote/meson.build     |  1 +
>  4 files changed, 116 insertions(+)
>  create mode 100644 include/hw/remote/iommu.h
>  create mode 100644 hw/remote/iommu.c
>=20
> diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
> new file mode 100644
> index 0000000000..8f850400f1
> --- /dev/null
> +++ b/include/hw/remote/iommu.h
> @@ -0,0 +1,18 @@
> +/**
> + * Copyright =A9 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_IOMMU_H
> +#define REMOTE_IOMMU_H
> +
> +#include "hw/pci/pci_bus.h"
> +
> +void remote_configure_iommu(PCIBus *pci_bus);
> +
> +void remote_iommu_del_device(PCIDevice *pci_dev);
> +
> +#endif
> diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
> new file mode 100644
> index 0000000000..13f329b45d
> --- /dev/null
> +++ b/hw/remote/iommu.c
> @@ -0,0 +1,95 @@
> +/**
> + * IOMMU for remote device
> + *
> + * Copyright =A9 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/iommu.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pci.h"
> +#include "exec/memory.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> +
> +struct RemoteIommuElem {
> +    AddressSpace  as;
> +    MemoryRegion  mr;
> +};
> +
> +struct RemoteIommuTable {
> +    QemuMutex lock;
> +    GHashTable *elem_by_bdf;
> +} remote_iommu_table;
> +
> +#define INT2VOIDP(i) (void *)(uintptr_t)(i)
> +
> +static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
> +                                              void *opaque, int devfn)
> +{
> +    struct RemoteIommuTable *iommu_table =3D opaque;
> +    struct RemoteIommuElem *elem =3D NULL;
> +    int pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_bus), devfn);
> +
> +    elem =3D g_hash_table_lookup(iommu_table->elem_by_bdf, INT2VOIDP(pci=
_bdf));

Why is a lock needed around g_hash_table_insert() below but no lock is
held around g_hash_table_lookup()?

Insertion isn't atomic because lookup and insert are separate operations
and they are not done under a single lock.

> +
> +    if (!elem) {
> +        g_autofree char *mr_name =3D g_strdup_printf("vfu-ram-%d", pci_b=
df);
> +        g_autofree char *as_name =3D g_strdup_printf("vfu-as-%d", pci_bd=
f);
> +
> +        elem =3D g_malloc0(sizeof(struct RemoteIommuElem));
> +
> +        memory_region_init(&elem->mr, NULL, mr_name, UINT64_MAX);
> +        address_space_init(&elem->as, &elem->mr, as_name);
> +
> +        qemu_mutex_lock(&iommu_table->lock);
> +        g_hash_table_insert(iommu_table->elem_by_bdf, INT2VOIDP(pci_bdf)=
, elem);
> +        qemu_mutex_unlock(&iommu_table->lock);
> +    }
> +
> +    return &elem->as;
> +}
> +
> +static void remote_iommu_del_elem(gpointer data)
> +{
> +    struct RemoteIommuElem *elem =3D data;
> +
> +    g_assert(elem);
> +
> +    memory_region_unref(&elem->mr);
> +    address_space_destroy(&elem->as);
> +
> +    g_free(elem);
> +}
> +
> +void remote_iommu_del_device(PCIDevice *pci_dev)
> +{
> +    int pci_bdf;
> +
> +    if (!remote_iommu_table.elem_by_bdf || !pci_dev) {
> +        return;
> +    }
> +
> +    pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev=
->devfn);
> +
> +    qemu_mutex_lock(&remote_iommu_table.lock);
> +    g_hash_table_remove(remote_iommu_table.elem_by_bdf, INT2VOIDP(pci_bd=
f));
> +    qemu_mutex_unlock(&remote_iommu_table.lock);
> +}
> +
> +void remote_configure_iommu(PCIBus *pci_bus)
> +{
> +    if (!remote_iommu_table.elem_by_bdf) {
> +        remote_iommu_table.elem_by_bdf =3D
> +            g_hash_table_new_full(NULL, NULL, NULL, remote_iommu_del_ele=
m);
> +        qemu_mutex_init(&remote_iommu_table.lock);
> +    }
> +
> +    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, &remote_iommu_tab=
le);

Why is remote_iommu_table global? It could be per-PCIBus and indexed by
just devfn instead of the full BDF.

--gOwcFQzSGxDCqdss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJC/QsACgkQnKSrs4Gr
c8iPXwf/cgAovqkD/IzvhhOIumwAHEyCBgm1D7Oq5tEohoReMI8pz55mEHDM/4BA
0heLYUDzOw4i+3jUY/5X5HbdbP4bscI6XOm51pOmq70/sICXgjopSdxQ6YOlhGXG
rEkvz/RmKZlvajuePkOvJpS+uWyaxffMM5OJkyNxD/Rvw0pAOgVv4LsvtdyOvOkc
2BZ+sglOOhcmJWWamhqsRAqnPQaQF/jIyF+p3+9dclEoPDc6ohj0yU7JyGY1viZw
fbGtoUi3KsfT4Xqg+jNMROFEnFJklKp/hWYJPWckfdbN9J/Bpg43dh7euFU/CwH3
dV3eBSo72Rmf7nZwiP4nWJow9zInlg==
=M7oP
-----END PGP SIGNATURE-----

--gOwcFQzSGxDCqdss--


