Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4649B1BE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:38:14 +0100 (CET)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJDJ-00070V-DK
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJ2J-0006kr-Bz
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJ1m-00057X-3j
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/llA3crXzb+PPX8Bcxi1/zRntGTFeE+KtT7Exszo8ws=;
 b=ApD3zeALbaXDEl06JLb8HD0sWQsBlN1TbwNVlmZcS80tc9/Hg5rupFlRlA/+ZpJUr7Z13B
 aRUyrR7hdIGvXQgxPrdUuhdpOeHYOQKVELFcVVZuxJ86cfVw4I6cBgpNhweFe/XnaSGwbt
 nDcTU+J/6at7Zppu8JpBlAnjO6BBmqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-S4Ev2Bs1NFCBI4nyQOVgDg-1; Tue, 25 Jan 2022 05:25:53 -0500
X-MC-Unique: S4Ev2Bs1NFCBI4nyQOVgDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317CA839A42;
 Tue, 25 Jan 2022 10:25:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3AF57AB58;
 Tue, 25 Jan 2022 10:25:02 +0000 (UTC)
Date: Tue, 25 Jan 2022 10:25:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 04/18] pci: create and free isolated PCI buses
Message-ID: <Ye/P/dUQ1Ngz24kI@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <566b2ccf8a7a5ce2ccb21f66c988a0feee83ee8f.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VzmQfF7TsP9WFvgN"
Content-Disposition: inline
In-Reply-To: <566b2ccf8a7a5ce2ccb21f66c988a0feee83ee8f.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VzmQfF7TsP9WFvgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:53PM -0500, Jagannathan Raman wrote:
> Adds pci_isol_bus_new() and pci_isol_bus_free() functions to manage
> creation and destruction of isolated PCI buses. Also adds qdev_get_bus
> and qdev_put_bus callbacks to allow the choice of parent bus.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h   |   4 +
>  include/hw/qdev-core.h |  16 ++++
>  hw/pci/pci.c           | 169 +++++++++++++++++++++++++++++++++++++++++
>  softmmu/qdev-monitor.c |  39 +++++++++-
>  4 files changed, 225 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 9bb4472abc..8c18f10d9d 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -452,6 +452,10 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *=
rootbus,
> =20
>  PCIDevice *pci_vga_init(PCIBus *bus);
> =20
> +PCIBus *pci_isol_bus_new(BusState *parent_bus, const char *new_bus_type,
> +                         Error **errp);
> +bool pci_isol_bus_free(PCIBus *pci_bus, Error **errp);
> +
>  static inline PCIBus *pci_get_bus(const PCIDevice *dev)
>  {
>      return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..eed2983072 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -419,6 +419,20 @@ void qdev_simple_device_unplug_cb(HotplugHandler *ho=
tplug_dev,
>  void qdev_machine_creation_done(void);
>  bool qdev_machine_modified(void);
> =20
> +/**
> + * Find parent bus - these callbacks are used during device addition
> + * and deletion.
> + *
> + * During addition, if no parent bus is specified in the options,
> + * these callbacks provide a way to figure it out based on the
> + * bus type. If these callbacks are not defined, defaults to
> + * finding the parent bus starting from default system bus
> + */
> +typedef bool (QDevGetBusFunc)(const char *type, BusState **bus, Error **=
errp);
> +typedef bool (QDevPutBusFunc)(BusState *bus, Error **errp);
> +bool qdev_set_bus_cbs(QDevGetBusFunc *get_bus, QDevPutBusFunc *put_bus,
> +                      Error **errp);

Where is this used, it doesn't seem related to pci_isol_bus_new()?

> +
>  /**
>   * GpioPolarity: Polarity of a GPIO line
>   *
> @@ -691,6 +705,8 @@ BusState *qdev_get_parent_bus(DeviceState *dev);
>  /*** BUS API. ***/
> =20
>  DeviceState *qdev_find_recursive(BusState *bus, const char *id);
> +BusState *qbus_find_recursive(BusState *bus, const char *name,
> +                              const char *bus_typename);
> =20
>  /* Returns 0 to walk children, > 0 to skip walk, < 0 to terminate walk. =
*/
>  typedef int (qbus_walkerfn)(BusState *bus, void *opaque);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index d5f1c6c421..63ec1e47b5 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -493,6 +493,175 @@ void pci_root_bus_cleanup(PCIBus *bus)
>      qbus_unrealize(BUS(bus));
>  }
> =20
> +static void pci_bus_free_isol_mem(PCIBus *pci_bus)
> +{
> +    if (pci_bus->address_space_mem) {
> +        memory_region_unref(pci_bus->address_space_mem);

memory_region_unref() already does a NULL pointer check so the if
statements in this function aren't needed.

> +        pci_bus->address_space_mem =3D NULL;
> +    }
> +
> +    if (pci_bus->isol_as_mem) {
> +        address_space_destroy(pci_bus->isol_as_mem);
> +        pci_bus->isol_as_mem =3D NULL;
> +    }
> +
> +    if (pci_bus->address_space_io) {
> +        memory_region_unref(pci_bus->address_space_io);
> +        pci_bus->address_space_io =3D NULL;
> +    }
> +
> +    if (pci_bus->isol_as_io) {
> +        address_space_destroy(pci_bus->isol_as_io);
> +        pci_bus->isol_as_io =3D NULL;
> +    }
> +}
> +
> +static void pci_bus_init_isol_mem(PCIBus *pci_bus, uint32_t unique_id)
> +{
> +    g_autofree char *mem_mr_name =3D NULL;
> +    g_autofree char *mem_as_name =3D NULL;
> +    g_autofree char *io_mr_name =3D NULL;
> +    g_autofree char *io_as_name =3D NULL;
> +
> +    if (!pci_bus) {
> +        return;
> +    }
> +
> +    mem_mr_name =3D g_strdup_printf("mem-mr-%u", unique_id);
> +    mem_as_name =3D g_strdup_printf("mem-as-%u", unique_id);
> +    io_mr_name =3D g_strdup_printf("io-mr-%u", unique_id);
> +    io_as_name =3D g_strdup_printf("io-as-%u", unique_id);
> +
> +    pci_bus->address_space_mem =3D g_malloc0(sizeof(MemoryRegion));
> +    pci_bus->isol_as_mem =3D g_malloc0(sizeof(AddressSpace));
> +    memory_region_init(pci_bus->address_space_mem, NULL,
> +                       mem_mr_name, UINT64_MAX);
> +    address_space_init(pci_bus->isol_as_mem,
> +                       pci_bus->address_space_mem, mem_as_name);
> +
> +    pci_bus->address_space_io =3D g_malloc0(sizeof(MemoryRegion));
> +    pci_bus->isol_as_io =3D g_malloc0(sizeof(AddressSpace));

Where are address_space_mem, isol_as_mem, address_space_io, and
isol_as_io freed? I think the unref calls won't free them because the
objects were created with object_initialize() instead of object_new().

--VzmQfF7TsP9WFvgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHvz/0ACgkQnKSrs4Gr
c8hfHQf+ObVBdKhxkLTwgcl9IIAez3l+4bJxzRBAB/DySyHxp8E1MuRpYHB0C7Rz
1rS8rxiy1TNvNNWzcusbfhhGSWBKSTwuvHZfoGwSEsWwkB1fHb4tG71Qrp9sMF3s
V+3XNvwfPSQwkHkQS5fS3f6c+qiVX8ZtA69//FUQ6tWMT/NXcjgTrusTtwPQv5hT
KANCFxkUlYowwtqYQxxppO6gBTj4/6sAJisCll7vo5TwSbVvYVrWFoXuaeUwyf05
EEs4Vd7sOaBp5FG60bYxR7wj+2zxFAwf+85Uyc75UOMYo1YZbvN1SbDVp/jXH2Ry
2NHcGokhdQmIcbJK2j3ESIdhrX7eCg==
=rp3e
-----END PGP SIGNATURE-----

--VzmQfF7TsP9WFvgN--


