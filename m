Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BACEE4FC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 17:44:25 +0100 (CET)
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRfSq-0003je-6T
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 11:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iRfPi-0000zQ-FX
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 11:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iRfPg-000712-EH
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 11:41:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37967 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1iRfPc-0006z4-PV
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 11:41:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 476JT73XkQz9sP6; Tue,  5 Nov 2019 03:40:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1572885659;
 bh=vIKMWest0STGnzzRZ9KejAXGHa/cjp9qNzwMlqZWirM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jge5uPgNcHFezpGI0gRgOENOd8HFtHMkY4rhuRmqgx21fJvMlGhhMcluWhzKRTdOW
 R6Ws/KzI/PmK2mSQps7ZlBOGOAMp0OX+o9AW5H1vRslVVl75yo6hVK/5iY+ZI8kmBB
 FH6O6x4AlmE7aWrmT4gLppg0jHxH/YPmHwUXJPpQ=
Date: Mon, 4 Nov 2019 17:02:28 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [RFC v2 14/22] vfio/pci: add iommu_context notifier for pasid
 bind/unbind
Message-ID: <20191104160228.GG3552@umbus.metropole.lan>
References: <1571920483-3382-1-git-send-email-yi.l.liu@intel.com>
 <1571920483-3382-15-git-send-email-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X0vpKvTpCy87tk9a"
Content-Disposition: inline
In-Reply-To: <1571920483-3382-15-git-send-email-yi.l.liu@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: tianyu.lan@intel.com, kevin.tian@intel.com, jacob.jun.pan@linux.intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, pbonzini@redhat.com,
 yi.y.sun@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--X0vpKvTpCy87tk9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 08:34:35AM -0400, Liu Yi L wrote:
> This patch adds notifier for pasid bind/unbind. VFIO registers this
> notifier to listen to the dual-stage translation (a.k.a. nested
> translation) configuration changes and propagate to host. Thus vIOMMU
> is able to set its translation structures to host.
>=20
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Yi Sun <yi.y.sun@linux.intel.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> ---
>  hw/vfio/pci.c            | 39 +++++++++++++++++++++++++++++++++++++++
>  include/hw/iommu/iommu.h | 11 +++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 8721ff6..012b8ed 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2767,6 +2767,41 @@ static void vfio_iommu_pasid_free_notify(IOMMUCTXN=
otifier *n,
>      pasid_req->free_result =3D ret;
>  }
> =20
> +static void vfio_iommu_pasid_bind_notify(IOMMUCTXNotifier *n,
> +                                         IOMMUCTXEventData *event_data)
> +{
> +#ifdef __linux__

Is hw/vfio/pci.c even built on non-linux hosts?

> +    VFIOIOMMUContext *giommu_ctx =3D container_of(n, VFIOIOMMUContext, n=
);
> +    VFIOContainer *container =3D giommu_ctx->container;
> +    IOMMUCTXPASIDBindData *pasid_bind =3D
> +                              (IOMMUCTXPASIDBindData *) event_data->data;
> +    struct vfio_iommu_type1_bind *bind;
> +    struct iommu_gpasid_bind_data *bind_data;
> +    unsigned long argsz;
> +
> +    argsz =3D sizeof(*bind) + sizeof(*bind_data);
> +    bind =3D g_malloc0(argsz);
> +    bind->argsz =3D argsz;
> +    bind->bind_type =3D VFIO_IOMMU_BIND_GUEST_PASID;
> +    bind_data =3D (struct iommu_gpasid_bind_data *) &bind->data;
> +    *bind_data =3D *pasid_bind->data;
> +
> +    if (pasid_bind->flag & IOMMU_CTX_BIND_PASID) {
> +        if (ioctl(container->fd, VFIO_IOMMU_BIND, bind) !=3D 0) {
> +            error_report("%s: pasid (%llu:%llu) bind failed: %d", __func=
__,
> +                         bind_data->gpasid, bind_data->hpasid, -errno);
> +        }
> +    } else if (pasid_bind->flag & IOMMU_CTX_UNBIND_PASID) {
> +        if (ioctl(container->fd, VFIO_IOMMU_UNBIND, bind) !=3D 0) {
> +            error_report("%s: pasid (%llu:%llu) unbind failed: %d", __fu=
nc__,
> +                         bind_data->gpasid, bind_data->hpasid, -errno);
> +        }
> +    }
> +
> +    g_free(bind);
> +#endif
> +}
> +
>  static void vfio_realize(PCIDevice *pdev, Error **errp)
>  {
>      VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
> @@ -3079,6 +3114,10 @@ static void vfio_realize(PCIDevice *pdev, Error **=
errp)
>                                           iommu_context,
>                                           vfio_iommu_pasid_free_notify,
>                                           IOMMU_CTX_EVENT_PASID_FREE);
> +        vfio_register_iommu_ctx_notifier(vdev,
> +                                         iommu_context,
> +                                         vfio_iommu_pasid_bind_notify,
> +                                         IOMMU_CTX_EVENT_PASID_BIND);
>      }
> =20
>      return;
> diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
> index 4352afd..4f21aa1 100644
> --- a/include/hw/iommu/iommu.h
> +++ b/include/hw/iommu/iommu.h
> @@ -33,6 +33,7 @@ typedef struct IOMMUContext IOMMUContext;
>  enum IOMMUCTXEvent {
>      IOMMU_CTX_EVENT_PASID_ALLOC,
>      IOMMU_CTX_EVENT_PASID_FREE,
> +    IOMMU_CTX_EVENT_PASID_BIND,
>      IOMMU_CTX_EVENT_NUM,
>  };
>  typedef enum IOMMUCTXEvent IOMMUCTXEvent;
> @@ -50,6 +51,16 @@ union IOMMUCTXPASIDReqDesc {
>  };
>  typedef union IOMMUCTXPASIDReqDesc IOMMUCTXPASIDReqDesc;
> =20
> +struct IOMMUCTXPASIDBindData {
> +#define IOMMU_CTX_BIND_PASID   (1 << 0)
> +#define IOMMU_CTX_UNBIND_PASID (1 << 1)
> +    uint32_t flag;
> +#ifdef __linux__
> +    struct iommu_gpasid_bind_data *data;

Embedding a linux specific structure in the notification message seems
dubious to me.

> +#endif
> +};
> +typedef struct IOMMUCTXPASIDBindData IOMMUCTXPASIDBindData;
> +
>  struct IOMMUCTXEventData {
>      IOMMUCTXEvent event;
>      uint64_t length;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X0vpKvTpCy87tk9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3AS5EACgkQbDjKyiDZ
s5Kjjg//SUCBaBa2SSgTf/kKJo38JdT5/wTHBsadIfvCkelJq+phiHV0lY2PVy+T
Uz3CYiuzui10CwhwKy35mKttLUZ9hBiIJkt7edNMPmCvvMnNuD0bp7stgdYXMfh0
D/WyD0yh7eBNppMqwe7eXUVWLMtD53593Ki1FevulZf9/cvimx6Pyg9/FHBGZy/R
kexEMOIZzgtAO2LMDb2M80zqb0UYmG52S/7nU/ijP7zUSS3kvLlp6RlBWGZLotxu
PK7Qn0/RKecENGKkedK35QFpfGkPDCf8llC6XoNUA/QyfNxqZfuaG+3keUfGNE+Y
bH5ycYAI0mE7g10sDye90BAptmGPdiJg7bs4qzikbFGDDkf4GuHHDiKLKHBBHWaf
5UVj3erqaILxztjxUWvwVNTaQA29WQ9MCLGIEtDoKyTOBIk1lrl9Y+GJ6tMA7fFk
gZR+kh6XvUNr6rYLcFLyAPkGVARuyt5fVT7C0+Xxhg/XAA3jyTIRivolynkPBVmY
9frrH5+MesRJd69ZJL76MS8VCYVENoqGOYM54yum8aY59stZtk4cpStrYNkFnBkV
9+iAvQcTWifi+Pjy1K0tu2HJJLUBYRSDS8s1oI++985iP0X9r4LQs1j32dDPRDTq
JJsx/0gjXg6P9O9dwZrd22WSUvhL4Wg58K82j3koJGL5tSrr4Ho=
=Bqsb
-----END PGP SIGNATURE-----

--X0vpKvTpCy87tk9a--

