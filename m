Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F505BBA48
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:20:30 +0200 (CEST)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZeIe-0004IR-RZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeG8-0008Pz-GU
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeG6-0001Bp-Te
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663445870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UILJnmbniUPP+yjEAvLOr6NCW24rfZFmU9bVZbAkMLo=;
 b=QHX4DK8q+ay2xo52mmj0UIk6QJpxOwPirz47FgkwbUSlp/YS78ZOf7xftgRlUHZfFGGREV
 6syd00kQpX5iEVqYzOoRXeZgTa8LS3R3UOd+FGN6W7871jPaXtGEkD3Db/xFx2wM0Wdcre
 Q+vw6dyVsPEHmDhiD/RILpB/YWWMZU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-G0P8AfO7PTafniMA5Zy3yA-1; Sat, 17 Sep 2022 16:17:45 -0400
X-MC-Unique: G0P8AfO7PTafniMA5Zy3yA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27A0485A583;
 Sat, 17 Sep 2022 20:17:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82A0349BB60;
 Sat, 17 Sep 2022 20:17:44 +0000 (UTC)
Date: Fri, 16 Sep 2022 16:16:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v9 1/7] include: add zoned device structs
Message-ID: <YySTY9Y+/6IplNXm@fedora>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-2-faithilikerun@gmail.com>
 <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
 <CAAAx-8KFxizaM7o82S_Zza6QjHB-mFf7hB_B-UbZ2E1Uq-sd7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lcrHx7oK0DsCuwPU"
Content-Disposition: inline
In-Reply-To: <CAAAx-8KFxizaM7o82S_Zza6QjHB-mFf7hB_B-UbZ2E1Uq-sd7g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lcrHx7oK0DsCuwPU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 06:06:38PM +0800, Sam Li wrote:
> Eric Blake <eblake@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > > ---
> > >  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 43 insertions(+)
> > >
> > > diff --git a/include/block/block-common.h b/include/block/block-commo=
n.h
> > > index fdb7306e78..36bd0e480e 100644
> > > --- a/include/block/block-common.h
> > > +++ b/include/block/block-common.h
> > > @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
> > >  typedef struct BdrvChild BdrvChild;
> > >  typedef struct BdrvChildClass BdrvChildClass;
> > >
> > > +typedef enum BlockZoneOp {
> > > +    BLK_ZO_OPEN,
> > > +    BLK_ZO_CLOSE,
> > > +    BLK_ZO_FINISH,
> > > +    BLK_ZO_RESET,
> > > +} BlockZoneOp;
> > > +
> > > +typedef enum BlockZoneModel {
> > > +    BLK_Z_NONE =3D 0x0, /* Regular block device */
> > > +    BLK_Z_HM =3D 0x1, /* Host-managed zoned block device */
> > > +    BLK_Z_HA =3D 0x2, /* Host-aware zoned block device */
> > > +} BlockZoneModel;
> > > +
> > > +typedef enum BlockZoneCondition {
> > > +    BLK_ZS_NOT_WP =3D 0x0,
> > > +    BLK_ZS_EMPTY =3D 0x1,
> > > +    BLK_ZS_IOPEN =3D 0x2,
> > > +    BLK_ZS_EOPEN =3D 0x3,
> > > +    BLK_ZS_CLOSED =3D 0x4,
> > > +    BLK_ZS_RDONLY =3D 0xD,
> > > +    BLK_ZS_FULL =3D 0xE,
> > > +    BLK_ZS_OFFLINE =3D 0xF,
> > > +} BlockZoneCondition;
> > > +
> > > +typedef enum BlockZoneType {
> > > +    BLK_ZT_CONV =3D 0x1, /* Conventional random writes supported */
> > > +    BLK_ZT_SWR =3D 0x2, /* Sequential writes required */
> > > +    BLK_ZT_SWP =3D 0x3, /* Sequential writes preferred */
> > > +} BlockZoneType;
> > > +
> > > +/*
> > > + * Zone descriptor data structure.
> > > + * Provides information on a zone with all position and size values =
in bytes.
> >
> > I'm glad that you chose bytes here for use in qemu.  But since the
> > kernel struct blk_zone uses sectors instead of bytes, is it worth
> > adding a sentence that we intentionally use bytes here, different from
> > Linux, to make it easier for reviewers to realize that scaling when
> > translating between qemu and kernel is necessary?
>=20
> Sorry about the unit mistake. The zone information is in sectors which
> is the same as kernel struct blk_zone. I think adding a sentence to
> inform the sector unit makes it clear what the zone descriptor is.

I'd make the units bytes for consistency with the rest of the QEMU block
layer. For example, the MapEntry structure that "qemu-img map" reports
has names with similar fields and they are in bytes:

  struct MapEntry {
      int64_t start;
      int64_t length;

Stefan

--lcrHx7oK0DsCuwPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMkk2IACgkQnKSrs4Gr
c8ieAgf/Y7iIvNe772+u5fdG4V0756QpK8gs7QQUCFUgJP1B0uVq3zhdnEmLqwII
XP6tDMioY+zRyC2Lp01pJVzCXrBs8fUAU/cSZOdBiYH6SJQgzAa+X7IRIDlJ3Nli
kEvxRZ6U7Z1ELHBLGIrteyQv1aq56EQrK/k7BIixJJHXKoyMgKoYgcS6NDKevPYJ
SMV0bN5HBHWSnAA9zSWzcH8TAG8RoLR8wB0JeaRy3jfUhUA6r7VaVE/OjSkui7Xa
IJFNmkgdop5S2Z/NFRgYT1ytnJ6aVqzHH8wsX/52HqnN4GQu5ZQUcHcM6G8Q0fo5
JVfmXC4MIhkTDPRpc52u84QMMIU4CQ==
=rk/f
-----END PGP SIGNATURE-----

--lcrHx7oK0DsCuwPU--


