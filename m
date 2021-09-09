Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77316404547
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:01:19 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOD7e-0000ad-Ff
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOD5v-0008LR-Vg
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOD5s-0008M4-FD
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631167167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1E/zGwjGpIlaYJMnUnQl5eGgIiPT5isOkY2wJBtAjj0=;
 b=QfjwSnX2NRnXbEFJ7W39TRgTw9UvD7y5/Djgd5X98cykAcvUICUf+lEZ/uwsmeg+S93F3z
 S3ekXcbwpP2x4TWiz2lU9C4oegs4ek5A6+020x7VXJl8Z/obYEuYYz1G7Je1R2X3lKtUH3
 8Qm/Jg30p4AgvChS1S/6eM77lyJkfNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-MkR1DbloPOyAtPd_waLJPg-1; Thu, 09 Sep 2021 01:59:25 -0400
X-MC-Unique: MkR1DbloPOyAtPd_waLJPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A03FF801E72;
 Thu,  9 Sep 2021 05:59:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45C2226DFF;
 Thu,  9 Sep 2021 05:59:20 +0000 (UTC)
Date: Thu, 9 Sep 2021 06:59:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 08/16] vfio-user: get region info
Message-ID: <YTmitzIL/oBoOaOO@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <d442105953151559982c8b1a753d847fb89da3ba.1629131628.git.elena.ufimtseva@oracle.com>
 <YTd3zRAjg51tzzfd@stefanha-x1.localdomain>
 <59C70EB8-E4D5-4F54-B0E8-A5A10334C0EC@oracle.com>
MIME-Version: 1.0
In-Reply-To: <59C70EB8-E4D5-4F54-B0E8-A5A10334C0EC@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fJi8e19/5GR2Cttp"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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

--fJi8e19/5GR2Cttp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 05:35:40AM +0000, John Johnson wrote:
>=20
>=20
> > On Sep 7, 2021, at 7:31 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >=20
> > On Mon, Aug 16, 2021 at 09:42:41AM -0700, Elena Ufimtseva wrote:
> >> @@ -1514,6 +1515,16 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_=
type1_info *info,
> >>     return true;
> >> }
> >>=20
> >> +static int vfio_get_region_info_remfd(VFIODevice *vbasedev, int index=
)
> >> +{
> >> +    struct vfio_region_info *info;
> >> +
> >> +    if (vbasedev->regions =3D=3D NULL || vbasedev->regions[index] =3D=
=3D NULL) {
> >> +        vfio_get_region_info(vbasedev, index, &info);
> >> +    }
> >=20
> > Maybe this will be called from other places in the future, but the
> > vfio_region_setup() caller below already invoked vfio_get_region_info()
> > so I'm not sure it's necessary to do this again?
> >=20
> > Perhaps add an int *remfd argument to vfio_get_region_info(). That way
> > vfio_get_region_info_remfd() isn't necessary.
> >=20
>=20
> =09I think they could be combined, but the region capabilities are
> retrieved with separate calls to vfio_get_region_info_cap(), so I followe=
d
> that precedent.
>=20
>=20
> >> @@ -2410,6 +2442,24 @@ int vfio_get_region_info(VFIODevice *vbasedev, =
int index,
> >>                          struct vfio_region_info **info)
> >> {
> >>     size_t argsz =3D sizeof(struct vfio_region_info);
> >> +    int fd =3D -1;
> >> +    int ret;
> >> +
> >> +    /* create region cache */
> >> +    if (vbasedev->regions =3D=3D NULL) {
> >> +        vbasedev->regions =3D g_new0(struct vfio_region_info *,
> >> +                                   vbasedev->num_regions);
> >> +        if (vbasedev->proxy !=3D NULL) {
> >> +            vbasedev->regfds =3D g_new0(int, vbasedev->num_regions);
> >> +        }
> >> +    }
> >> +    /* check cache */
> >> +    if (vbasedev->regions[index] !=3D NULL) {
> >> +        *info =3D g_malloc0(vbasedev->regions[index]->argsz);
> >> +        memcpy(*info, vbasedev->regions[index],
> >> +               vbasedev->regions[index]->argsz);
> >> +        return 0;
> >> +    }
> >=20
> > Why is it necessary to introduce a cache? Is it to avoid passing the
> > same fd multiple times?
> >=20
>=20
> =09Yes.  For polled regions, the server returns an FD with each
> message, so there would be an FD leak if I didn=E2=80=99t check that the =
region
> hadn=E2=80=99t already returned one.  Since I had to cache the FD anyway,=
 I
> cached the whole struct.

If vfio_get_region_info() takes an int *fd argument then fd ownership
becomes explicit and the need for the cache falls away. Maybe Alex has a
preference for how to structure the code to track per-region fds.

Stefan

--fJi8e19/5GR2Cttp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5orcACgkQnKSrs4Gr
c8hCKwf/c80+lAZdu+It4uyM8zY/f2yZy4MMuiUcBlOYky/OeqanQY87129tdM6Z
XQf11ysc0iJ0ZWpabdlhVLD3upgWPfyup4+TZ9SHqXR9EU/RLxLfEmtS2Ho2ogXJ
+FCnUi1t3MGO/YOem8dQZr+ZC4KCiZ0swfaopR6tXX+bcTuCMsBTm2E6jLCg0Kxj
wUzkSjTFv4+EC9gqW+WwWgb0I/GD8O38gSvRLlWkzpI/0MuenQCEUN0GD1hFHUvw
4sSW0ZwX3ys9y9DP9wLuS1HVlOeGeub5CiaMo716/pGrHwlloXWH8iTShwp7wNHy
ygmmYnDyULzPE2jWvJmvrs+h4KIdQQ==
=Nmd1
-----END PGP SIGNATURE-----

--fJi8e19/5GR2Cttp--


