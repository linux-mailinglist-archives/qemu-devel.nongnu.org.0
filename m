Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BF477668
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 16:57:51 +0100 (CET)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxt8f-0005tQ-OU
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 10:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxt7Y-000531-Pm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxt7V-00062L-Rs
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:56:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639670197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mnWhAZY2p6duyH8xHkFUb7eKxzzZ6xsXRRLZB/C5nNc=;
 b=dUK6R9uCnTBGucMv7NBOem1oIE8Q0Xm+KPB8WksV1+oqaoznxR+2vtpIqqnQpKpIdneBUi
 Ossz57PhZom0PVaKbdnkwH64AUHY1yetM1kNYIrBBctsxSl0aOeFwwuOAJOUgkOp99vH14
 +ORw6U+smNcaNHGqvwoCPU3xU+KsmwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-1uNIT4qRPaeh9t7VMI2Buw-1; Thu, 16 Dec 2021 10:56:29 -0500
X-MC-Unique: 1uNIT4qRPaeh9t7VMI2Buw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8720D802921;
 Thu, 16 Dec 2021 15:56:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1645045D98;
 Thu, 16 Dec 2021 15:56:17 +0000 (UTC)
Date: Thu, 16 Dec 2021 15:56:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 12/14] vfio-user: handle device interrupts
Message-ID: <YbthoFWD0XtXrhtq@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <219410a610c55ac7f8db806aa8a4bc2e124e9d5c.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <219410a610c55ac7f8db806aa8a4bc2e124e9d5c.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jy9hCD95I/NR1K8B"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jy9hCD95I/NR1K8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:36AM -0500, Jagannathan Raman wrote:
> @@ -62,6 +66,9 @@ void remote_iohub_set_irq(void *opaque, int pirq, int l=
evel)
>      QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
> =20
>      if (level) {
> +        if (iohub->intx_notify) {
> +            iohub->intx_notify(pirq, 0);
> +        }
>          if (++iohub->irq_level[pirq] =3D=3D 1) {
>              event_notifier_set(&iohub->irqfds[pirq]);
>          }

Does it make sense to use iohub.c in vfio-user since these irqfds are
unused?

Instead of adding iohub->intx_notify(), can vfio-user register its own
set_irq() callback for the PCI bus?

> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index ae375e69b9..2b28d465d5 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -50,6 +50,9 @@
>  #include "hw/pci/pci.h"
>  #include "qemu/timer.h"
>  #include "hw/remote/iommu.h"
> +#include "hw/pci/msi.h"
> +#include "hw/pci/msix.h"
> +#include "hw/remote/iohub.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -81,6 +84,8 @@ struct VfuObject {
>      int vfu_poll_fd;
>  };
> =20
> +static GHashTable *vfu_object_dev_table;
> +
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> =20
>  static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> @@ -347,6 +352,54 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_=
ctx, PCIDevice *pdev)
>      }
>  }
> =20
> +static void vfu_object_intx_notify(int pci_devfn, unsigned vector)
> +{
> +    vfu_ctx_t *vfu_ctx =3D g_hash_table_lookup(vfu_object_dev_table,
> +                                             (void *)(uint64_t)pci_devfn=
);

I'm not sure the hash table is necessary. The function arguments
currently don't contain the information we need, but that's easy to fix
because these functions are added by this patch. Add an opaque pointer
argument to ->intx_notify, ->msix_notify, and ->msi_notify in order to
pass along the VfuObject we need.

> +
> +    if (vfu_ctx) {
> +        vfu_irq_trigger(vfu_ctx, vector);
> +    }
> +}
> +
> +static void vfu_object_msi_notify(PCIDevice *pci_dev, unsigned vector)
> +{
> +    vfu_object_intx_notify(pci_dev->devfn, vector);
> +}
> +
> +static int vfu_object_setup_irqs(vfu_ctx_t *vfu_ctx, PCIDevice *pci_dev)
> +{
> +    RemoteMachineState *machine =3D REMOTE_MACHINE(current_machine);
> +    RemoteIOHubState *iohub =3D &machine->iohub;
> +    int ret;
> +
> +    ret =3D vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    iohub->intx_notify =3D vfu_object_intx_notify;
> +
> +    ret =3D 0;
> +    if (msix_nr_vectors_allocated(pci_dev)) {
> +        ret =3D vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
> +                                       msix_nr_vectors_allocated(pci_dev=
));
> +
> +        pci_dev->msix_notify =3D vfu_object_msi_notify;
> +    } else if (msi_nr_vectors_allocated(pci_dev)) {
> +        ret =3D vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
> +                                       msi_nr_vectors_allocated(pci_dev)=
);
> +
> +        pci_dev->msi_notify =3D vfu_object_msi_notify;
> +    }
> +
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -437,6 +490,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error =
**errp)
> =20
>      vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
> =20
> +    ret =3D vfu_object_setup_irqs(o->vfu_ctx, o->pci_dev);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to setup interrupts for %s",
> +                   o->device);
> +        goto fail;
> +    }
> +
>      ret =3D vfu_realize_ctx(o->vfu_ctx);
>      if (ret < 0) {
>          error_setg(errp, "vfu: Failed to realize device %s- %s",
> @@ -450,6 +510,9 @@ static void vfu_object_init_ctx(VfuObject *o, Error *=
*errp)
>          goto fail;
>      }
> =20
> +    g_hash_table_insert(vfu_object_dev_table,
> +                        (void *)(uint64_t)o->pci_dev->devfn, o->vfu_ctx)=
;

vfu_object_dev_table seems like a misnomer since the values stored are
actually vfu_ctx_t, not VfuObjects. vfu_devfn_to_vfu_ctx_table?

> +
>      qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
> =20
>      return;
> @@ -504,9 +567,18 @@ static void vfu_object_finalize(Object *obj)
>          remote_iommu_free(o->pci_dev);
>      }
> =20
> +    if (o->pci_dev &&
> +            g_hash_table_lookup(vfu_object_dev_table,
> +                                (void *)(uint64_t)o->pci_dev->devfn)) {

lookup() is unnecessary since remove() is a nop if the key does not
exist.

--jy9hCD95I/NR1K8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7YaAACgkQnKSrs4Gr
c8jd4AgAuHxkvrO/Ynsb8TMpfRed9gyyPrMmSaz6rilUdKe1a8y1zGMSAKbfFGIr
IbOK8d23a1zDUOlQE4JPOoX506jwCcyMpFFgR5zSf3u9Jl1KsN/FBVt+tdWkVx50
J0Do0CIujkPdJr669UwVfkfLzNzOwMZtTsumQX9I6qZZgrkyBmMjidtOOmU1u69i
PhipQN9/yxnlQtBV6T212uimWfwP/rruEeMecPtOpEyDdBSK4wiediQLItSWRLLy
b2gcMYxwInNu3g5/XT0f4n6oU0+TG9VG6Pp5baSwQ5Nlc79kqwaVRjwYm7S9Q8UM
6CJVXLS6O8lGfh16EUbcDWe92fYx2A==
=C52R
-----END PGP SIGNATURE-----

--jy9hCD95I/NR1K8B--


