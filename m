Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973B402A65
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:07:10 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbkj-00049q-EU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNbYi-0000Z3-Vb
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNbYh-0002YI-8u
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631022882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ITQDaNC8EBh1Dt71Yns1G9hCbBYXaiSPpJjmwnxwsZY=;
 b=DQpH6SbIuTvA+WMnCwogkJ/EsBhelmRLNda0w9LYZa0zZaHiMXqhsY/tA1XNRhh+eMJwnJ
 xmhpSo3qSPdOijf+xww6eiF6pjvItgngUWy18MIPuYMGYGJf6oefgsEz/zPmWLEMlqaGC/
 QY/JPC4+FKoLRtBfphXSsFKN+G5O4l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-Rbn4-VuGP_a3cCnYsgM9gw-1; Tue, 07 Sep 2021 09:54:41 -0400
X-MC-Unique: Rbn4-VuGP_a3cCnYsgM9gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B3511005523;
 Tue,  7 Sep 2021 13:54:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EE4E5D9CA;
 Tue,  7 Sep 2021 13:54:36 +0000 (UTC)
Date: Tue, 7 Sep 2021 14:54:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 07/16] vfio-user: get device info
Message-ID: <YTdvG9Ea1KJ+nM7M@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <d2c6a72f9b0b207bcb2c7fe49abe45854d4e017b.1629131628.git.elena.ufimtseva@oracle.com>
 <YSUYfS442NY5TltC@stefanha-x1.localdomain>
 <057C9D51-759C-4424-A582-ABA783C4D923@oracle.com>
MIME-Version: 1.0
In-Reply-To: <057C9D51-759C-4424-A582-ABA783C4D923@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5YJJuspUPTHvx8xj"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5YJJuspUPTHvx8xj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 03:11:39AM +0000, John Johnson wrote:
>=20
>=20
> > On Aug 24, 2021, at 9:04 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Mon, Aug 16, 2021 at 09:42:40AM -0700, Elena Ufimtseva wrote:
> >> +int vfio_user_get_info(VFIODevice *vbasedev)
> >> +{
> >> +    VFIOUserDeviceInfo msg;
> >> +
> >> +    memset(&msg, 0, sizeof(msg));
> >> +    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof=
(msg), 0);
> >> +    msg.argsz =3D sizeof(struct vfio_device_info);
> >> +
> >> +    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0, 0);
> >> +    if (msg.hdr.flags & VFIO_USER_ERROR) {
> >> +        return -msg.hdr.error_reply;
> >> +    }
> >> +
> >> +    vbasedev->num_irqs =3D msg.num_irqs;
> >> +    vbasedev->num_regions =3D msg.num_regions;
> >> +    vbasedev->flags =3D msg.flags;
> >> +    vbasedev->reset_works =3D !!(msg.flags & VFIO_DEVICE_FLAGS_RESET)=
;
> >=20
> > No input validation. I haven't checked what happens when num_irqs,
> > num_regions, or flags are bogus but it's a little concerning. Unlike
> > kernel VFIO, we do not trust these values.
> >=20
>=20
> =09As in the last reply, vfio-user doesn=E2=80=99t know valid values
> from invalid, so I need to re-work this so the PCI-specific code that
> calls vfio-user_get_info() can test for invalid values.

Sounds good. I won't look further for missing input validation in the
VFIO message contents in this revision of the patch series. Once you're
happy with input validation I'll look at the code from this angle again.

Stefan

--5YJJuspUPTHvx8xj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3bxsACgkQnKSrs4Gr
c8jd4Qf9E0N7pC5kr3ZdZye2jFDNIMGep0CfnWvTqi1Bnr00DGcPeHG/WUYixE/E
jszUxGuQm6zIvxzx5XF0B89Xc0wlXYnTFLu+dCw66MItAVdUqvuMeJSaZ0S0C8lD
MT+rboGR2mDDvodoSGJsrBM6DttWD0TYyPB3nPC2ScXR2737LSWAhq9Il/Cn8Kmj
q3UW3oLiCrUpGA0vZuUYN05QE7i/a6Z0j6MuxlVAe5wg95M700nXfZ8ykU2/iglC
iwlZqJAWpAlxTV6pku7S6Pql8UD7IDoXOSVnEekc2jTXa70pPn/LFIEyHAuWZKMo
JI72TYgA6gQvFQY9YY3b4UTW+8a7+g==
=nxof
-----END PGP SIGNATURE-----

--5YJJuspUPTHvx8xj--


