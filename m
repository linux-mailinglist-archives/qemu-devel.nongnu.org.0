Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD783F5ECF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:17:13 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWId-0001ax-A5
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWHS-0000QF-GW
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWHQ-00005q-Mo
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629810951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iAVOjM0auXQe0XQPJwMjgEyB5yByPFtMCiPLhl1DI4s=;
 b=i3a8a+Egw/0wFE27WruLTybx2C+8rn/vkfNANACijbYxXcjhGifJ/BcYyVTNkuSZbLV0ko
 0IX5yQTCrjrBAmCN+uWGNmKTuVriYAvCe8/b9oC5G04Z1n73xAhFhn5/neDwNj/P/PPIfm
 /PyppGxnbl3GbxNJCnH8p9oj6gqJ2Lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-Bu8-Y6wnNdqMMZd4lpyIYQ-1; Tue, 24 Aug 2021 09:15:49 -0400
X-MC-Unique: Bu8-Y6wnNdqMMZd4lpyIYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BA0D760C4;
 Tue, 24 Aug 2021 13:15:48 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 672F85DA61;
 Tue, 24 Aug 2021 13:15:34 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:15:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
Message-ID: <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="41nAj7jRFH3UlYKe"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--41nAj7jRFH3UlYKe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Check bus permission in flatview_access_allowed() before
> running any bus transaction.
>=20
> There is not change for the default case (MEMTXPERM_UNSPECIFIED).
>=20
> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
> using it won't be checked by flatview_access_allowed().
>=20
> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
> using this flag will reject transactions and set the optional
> MemTxResult to MEMTX_BUS_ERROR.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  softmmu/physmem.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 0d31a2f4199..329542dba75 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryR=
egion *mr, MemTxAttrs attrs,
>                                             hwaddr addr, hwaddr len,
>                                             MemTxResult *result)
>  {
> -    return true;
> +    if (unlikely(attrs.bus_perm =3D=3D MEMTXPERM_RAM_DEVICE)) {
> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr))=
 {
> +            return true;
> +        }
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Invalid access to non-RAM device at "
> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
> +                      "region '%s'\n", addr, len, memory_region_name(mr)=
);
> +        if (result) {
> +            *result |=3D MEMTX_BUS_ERROR;

Why bitwise OR?

> +        }
> +        return false;
> +    } else {
> +        /* MEMTXPERM_UNRESTRICTED and MEMTXPERM_UNSPECIFIED cases */
> +        return true;
> +    }
>  }
> =20
>  /* Called within RCU critical section.  */
> --=20
> 2.31.1
>=20

--41nAj7jRFH3UlYKe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk8PUACgkQnKSrs4Gr
c8gOrQgAnUd/jiEbrPHMv7Wcq9dhEnQS6MRRvw5WR+DXDb5dWlb0Jshi13LVHMrv
SW752fJhNR6HHaAy+gZ+Zz9v5llGSO4Tjxx5WCt8J4PE+iApC9rQ8rjQHQWzrzI5
/8F1/D/05pMfJtUUiM1R3aUYWEEIMahKaVrIKAcVV66pjZLU3PCtNTLlvUU6Fc1d
g/QgODCr/n2frlCsy17lpnLVDvpQDRMkPSMQ/VohOe9V1zRhVE4UK7mwP7y5+kh9
832s+AT2TUDgZoLb2gHH2E8ZEyQgq6EGrLcJGzEWMnSHlwr7dXz7I6eguCx6KHXC
bsRSxwf55/XRil91xewOEmtGfs13ng==
=y7yh
-----END PGP SIGNATURE-----

--41nAj7jRFH3UlYKe--


