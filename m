Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CC402A69
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:08:56 +0200 (CEST)
Received: from localhost ([::1]:60696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbmR-0000HJ-Ts
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNbX2-0006PM-8T
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNbX0-0001Sk-JE
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631022777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OeD8WxjIZDgnMW04fP6Sd8WytjPAvCzO5EKmO4dfHX0=;
 b=DQ6/rEaXqKoQvAVT9xGORzA53tDh1YS9M9cjCvVM/qoksU+Iix4IE6c+gb4CASIlC/k0hx
 QWqQl7EEZzKenYhHydh6o9skaRkiFMdzWzHertl5tI39y5PwpIKD/EZvFkywEiLJpegNgm
 9crLGGgYTdUt9sZM808XdyhdNVAQNQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-g6CfRYiEMs2df62VlpZk6w-1; Tue, 07 Sep 2021 09:52:56 -0400
X-MC-Unique: g6CfRYiEMs2df62VlpZk6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AEFC107ACC7;
 Tue,  7 Sep 2021 13:52:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BCE05C3DF;
 Tue,  7 Sep 2021 13:52:51 +0000 (UTC)
Date: Tue, 7 Sep 2021 14:52:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 06/16] vfio-user: negotiate version with remote
 server
Message-ID: <YTdusqD0z7rykZMN@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a14c2c09f41ddda83cd710516cac8d210ec9db08.1629131628.git.elena.ufimtseva@oracle.com>
 <YSUXVQJwkubjpp9x@stefanha-x1.localdomain>
 <4F549CE3-D6F2-4A55-A0A6-168F5EBDCE0E@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4F549CE3-D6F2-4A55-A0A6-168F5EBDCE0E@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v9g1OwkVrQ4eCMut"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--v9g1OwkVrQ4eCMut
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 03:08:50AM +0000, John Johnson wrote:
> > On Aug 24, 2021, at 8:59 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > On Mon, Aug 16, 2021 at 09:42:39AM -0700, Elena Ufimtseva wrote:
> >> +int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
> >> +{
> >> +    g_autofree VFIOUserVersion *msgp;
> >> +    GString *caps;
> >> +    int size, caplen;
> >> +
> >> +    caps =3D caps_json();
> >> +    caplen =3D caps->len + 1;
> >> +    size =3D sizeof(*msgp) + caplen;
> >> +    msgp =3D g_malloc0(size);
> >> +
> >> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_VERSION, size, 0);
> >> +    msgp->major =3D VFIO_USER_MAJOR_VER;
> >> +    msgp->minor =3D VFIO_USER_MINOR_VER;
> >> +    memcpy(&msgp->capabilities, caps->str, caplen);
> >> +    g_string_free(caps, true);
> >> +
> >> +    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, 0, 0);
> >> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> >> +        error_setg_errno(errp, msgp->hdr.error_reply, "version reply"=
);
> >> +        return -1;
> >> +    }
> >> +
> >> +    if (msgp->major !=3D VFIO_USER_MAJOR_VER ||
> >> +        msgp->minor > VFIO_USER_MINOR_VER) {
> >> +        error_setg(errp, "incompatible server version");
> >> +        return -1;
> >> +    }
> >> +    if (caps_check(msgp->minor, (char *)msgp + sizeof(*msgp), errp) !=
=3D 0) {
> >=20
> > The reply is untrusted so we cannot treat it as a NUL-terminated string
> > yet. The final byte msgp->capabilities[] needs to be checked first.
> >=20
> > Please be careful about input validation, I might miss something so it'=
s
> > best if you audit the patches too. QEMU must not trust the device
> > emulation process and vice versa.
> >=20
>=20
> =09This message is consumed by vfio-user, so I can check for valid
> replies, but for most messages this checking will have to be done at in
> the VFIO common or bus-specific code, as vfio-user doens=E2=80=99t know v=
alid
> data from invalid.

Good point. Today's VFIO code trusts the replies because they come from
the kernel. Now that they can come from an untrusted source they must be
validated and common VFIO code may need to change its trust model.

Stefan

--v9g1OwkVrQ4eCMut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3brIACgkQnKSrs4Gr
c8iUPgf/bm1nycmfPx6K4d0T69A82D79Q5cyT1dIRYmMj7UXmvFbIAoFdHIMvPEW
8B9neahhwyckAsJyE3KeXWI5V/j4ehuPjThu6CKIFSgVKiN0QpUn8fLFvRLs8jSt
TYs7S02D+rutjaB6uq/0mgHfBEwcZ/79QYYXxm4MYKr0FpRKwsYTP7iojLK6u9e6
oENA3rO7crYNEjZO73Wcgk3MyHK2rb4TaXZ8z3Gb0l5YvBk3Rm5cZxGHB3Coc4Hp
29dlzoXFasUn4wn0ah4sHWqQ6SSgw2CPqFD/YRzk4pv/WHbtDmBH5qEWr9P9FSPE
qHEtTWsxlJQzPaxuNOJpsIg+z1oU3A==
=FsFj
-----END PGP SIGNATURE-----

--v9g1OwkVrQ4eCMut--


