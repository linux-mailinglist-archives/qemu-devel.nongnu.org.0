Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C521F4CFD76
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:55:07 +0100 (CET)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBxC-0000Uc-RN
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRBfW-0007dI-Cu
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:36:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRBfU-0001AG-Jd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646653007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9oLrldq/+c8NNaTjNJte/1F69tAJfD5+5JWH4EfLOg=;
 b=MdLDHLQ5xx4jdS5Va1hsKSNKu2fVX9hdjC2V9JpklxxEjqOxByzJxnHRdRV92AHVdusCpP
 BO/v2BBCOEhY09gTwkIv70cnOWOYeSHzNC/2ej4z5vz6H61uf7Cl6cnqf8DkycIioQ8tg8
 2/+sESjMbegvj5YjVgFwxVt1TRCdHr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-N7sdEJxpPBCJyfESsrOWIQ-1; Mon, 07 Mar 2022 06:36:44 -0500
X-MC-Unique: N7sdEJxpPBCJyfESsrOWIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A353A807335;
 Mon,  7 Mar 2022 11:36:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB5E1842DD;
 Mon,  7 Mar 2022 11:36:08 +0000 (UTC)
Date: Mon, 7 Mar 2022 11:36:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 18/19] vfio-user: handle reset of remote device
Message-ID: <YiXuJ2YqCZEbrsHn@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <54278334564d9e9f8d2eb3ff884260ac90da44e5.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jTD4SmxRnU15TD5q"
Content-Disposition: inline
In-Reply-To: <54278334564d9e9f8d2eb3ff884260ac90da44e5.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--jTD4SmxRnU15TD5q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:49:05AM -0500, Jagannathan Raman wrote:
> Adds handler to reset a remote device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 2304643003..55f1bf5e0f 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -989,6 +989,19 @@ static bool vfu_object_migratable(VfuObject *o)
>      return dc->vmsd && !dc->vmsd->unmigratable;
>  }
> =20
> +static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t =
type)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +
> +    if (type =3D=3D VFU_RESET_LOST_CONN) {
> +        return 0;
> +    }

Why is a lost connection ignored? Should there be a QMP monitor event?

> +
> +    qdev_reset_all(DEVICE(o->pci_dev));
> +
> +    return 0;
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -1105,6 +1118,12 @@ static void vfu_object_init_ctx(VfuObject *o, Erro=
r **errp)
>          goto fail;
>      }
> =20
> +    ret =3D vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_res=
et);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to setup reset callback");
> +        goto fail;
> +    }
> +
>      if (!vfu_object_migratable(o)) {
>          goto realize_ctx;
>      }
> --=20
> 2.20.1
>=20

--jTD4SmxRnU15TD5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIl7icACgkQnKSrs4Gr
c8hR4Af/encpypzSrnN9KTQ0Lg3A8jZeB6LLUKwksEk32julKNRaIg7esnpGlCKh
z0gdaQSOBu3WnwLlBpHkQ577lIU6K+EWSOWlu0028jWAwkqkNN9R6nqi294VLYvw
QhhbfDImLPEk6c1wpP0Ns2KAVPTu0v/ZhBOa/X/G8jn39+YNyGaWdgQ9WaRgmEu8
PeIyq3iya0FwNCNto9NvqgE/LAvg5tdH1Ag1hLUdWCEM26YJGYulhK9/1X5awLn7
Qfwy3B1VhhJA8AmEoGBlLuQI0+Nei3d75msYgg75YJ45qAE7Zc0qvtaZXfPclRui
voExtQLvtzdTlzRaJBSlAy8oHX3oeA==
=FqbT
-----END PGP SIGNATURE-----

--jTD4SmxRnU15TD5q--


