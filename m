Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8F477054
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:33:07 +0100 (CET)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxp0U-00076Z-Ox
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxozC-0005fG-QK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxoz8-0005SI-PN
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639654301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kqVYoxbxgufKQJHJr64Etu/B2p7gG/4srzJD3MYakvI=;
 b=PpugwJXlcfGNPbRwgYSX6er4cMzj8xdkddhxqatXZ5Xu+ubVsZU5nHJEZhXdwW/0GTogX0
 mtwAyqDI1l2ixkLRS0y2FmbjetFQRqJ/Z0tqcG/KpZkNvtgLnKURUTdVoE+P8Qih3j95Vo
 1Pxolon13/lU6OTr+v79SApovcaJ4eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-a4XWvqiLNYO-M4ynwLf99w-1; Thu, 16 Dec 2021 06:31:38 -0500
X-MC-Unique: a4XWvqiLNYO-M4ynwLf99w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40ED81CCB9;
 Thu, 16 Dec 2021 11:31:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D4052E058;
 Thu, 16 Dec 2021 11:30:21 +0000 (UTC)
Date: Thu, 16 Dec 2021 11:30:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: john.levon@nutanix.com, thanos.makatos@nutanix.com
Subject: Re: [PATCH v4 08/14] vfio-user: handle PCI config space accesses
Message-ID: <YbsjTPnOiAkNKmhb@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <34e287d0a8d585f104bdd06681b32fc93e8746c7.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <34e287d0a8d585f104bdd06681b32fc93e8746c7.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k+kU4GmQ4iNJJAcD"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Jagannathan Raman <jag.raman@oracle.com>, bleal@redhat.com,
 swapnil.ingle@nutanix.com, philmd@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--k+kU4GmQ4iNJJAcD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:32AM -0500, Jagannathan Raman wrote:
> Define and register handlers for PCI config space accesses
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  2 ++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index a01a0ad185..c6d0c675b7 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -43,6 +43,7 @@
>  #include "qapi/qapi-visit-sockets.h"
>  #include "qemu/notify.h"
>  #include "qemu/thread.h"
> +#include "qemu/main-loop.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
>  #include "hw/qdev-core.h"
> @@ -174,6 +175,39 @@ retry_attach:
>      qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
>  }
> =20
> +static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const bu=
f,
> +                                     size_t count, loff_t offset,
> +                                     const bool is_write)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    uint32_t pci_access_width =3D sizeof(uint32_t);
> +    size_t bytes =3D count;
> +    uint32_t val =3D 0;
> +    char *ptr =3D buf;
> +    int len;
> +
> +    while (bytes > 0) {
> +        len =3D (bytes > pci_access_width) ? pci_access_width : bytes;
> +        if (is_write) {
> +            memcpy(&val, ptr, len);
> +            pci_host_config_write_common(o->pci_dev, offset,
> +                                         pci_config_size(o->pci_dev),
> +                                         val, len);
> +            trace_vfu_cfg_write(offset, val);
> +        } else {
> +            val =3D pci_host_config_read_common(o->pci_dev, offset,
> +                                              pci_config_size(o->pci_dev=
), len);
> +            memcpy(ptr, &val, len);
> +            trace_vfu_cfg_read(offset, val);
> +        }
> +        offset +=3D len;
> +        ptr +=3D len;
> +        bytes -=3D len;
> +    }
> +
> +    return count;
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -244,6 +278,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error =
**errp)
>          goto fail;
>      }
> =20
> +    ret =3D vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
> +                           pci_config_size(o->pci_dev), &vfu_object_cfg_=
access,
> +                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_C=
B,
> +                           NULL, 0, -1, 0);

Thanos or John: QEMU's pci_host_config_read/write_common() works with
host-endian values. I don't know which endianness libvfio-user's region
callbacks expect. Does this patch look endian-safe to you (e.g. will it
work on a big-endian host)?

Thanks,
Stefan

--k+kU4GmQ4iNJJAcD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7I0wACgkQnKSrs4Gr
c8jsqQf/b8i3ieRLyDTYd6mlp+PrczZLMCExhSkuTrKsAMnx97mNqgE/yMnYs0rW
1buTSx52NlFzmSMl5SCCwI6qCHyHaaw5u5FsSimUA4LxRky5L7XhIbDMvnez3qa/
bYcAX1xlP8lwZjwW095bhCkINDnQmNArAy4HN9dao8kakIbrPJQHi8mIQxXSYcn2
MBUBmNOAg646vNh7zJ8HP67PYhjD4gImc+vd1BSKwgqygNbmfkD/HfgddXedEKgo
rZl34fL/TvYkT2SQPW3qAeq6yLWbwPeU8udGfk/CIMfx6g/fZ9OpJcytCvMS/iPA
/B+JKipT3fQNZrbKcsd1xs14+306WQ==
=wB0w
-----END PGP SIGNATURE-----

--k+kU4GmQ4iNJJAcD--


