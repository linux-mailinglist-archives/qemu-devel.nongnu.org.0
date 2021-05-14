Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE7380DC4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:07:25 +0200 (CEST)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaLU-0001My-1b
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhaA1-0007FB-AB
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lha9z-0001E9-Nu
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621007730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2aNPCT9evNpN9vOciojZifiIVCoz7/TY8GYAc/okNA=;
 b=HMm1n2Zp4wQ+7n7PzcMf8R7Nt/2C7mhRKUJIQfXFhWMYj6cUxxaRQJ/AnATlOIqAkWNFJB
 DAGWrU1xuFc5XZyCWXcwOc0C8WRecOSqwj+LXlFGFePGHbsSzQmM9tyERZ0CesvKGKpXmo
 YVxN/fUcIwdnJtwwUY9mfOuHYLyrBUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-g4h3yUPXP3eUhZFg5l8k-Q-1; Fri, 14 May 2021 11:55:26 -0400
X-MC-Unique: g4h3yUPXP3eUhZFg5l8k-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36F0B8005AD;
 Fri, 14 May 2021 15:55:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E11075D9D0;
 Fri, 14 May 2021 15:55:14 +0000 (UTC)
Date: Fri, 14 May 2021 17:55:13 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YJ6dYTNLivMuj7VM@merkur.fritz.box>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
 <YJLL7B249hN6wJTd@merkur.fritz.box>
 <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
 <YJPF9KhUWm3tGX9b@merkur.fritz.box>
 <YJz1qqXI8z1PQYkM@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJz1qqXI8z1PQYkM@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JRB6gLcHmsurkIYG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, Alberto Garcia <berto@igalia.com>, slp@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, rjones@redhat.com,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JRB6gLcHmsurkIYG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 13.05.2021 um 11:47 hat Stefan Hajnoczi geschrieben:
> On Thu, May 06, 2021 at 12:33:24PM +0200, Kevin Wolf wrote:
> > Am 06.05.2021 um 10:46 hat Stefan Hajnoczi geschrieben:
> > > What do you think about this:
> > >=20
> > > The blkio instance states are:
> > >=20
> > >   created -> attached -> started -> destroyed
> > >=20
> > > It is not possible to go backwards anymore, which simplifies driver
> > > implementations and it probably won't be needed by applications.
> > >=20
> > > The "initialized" state is renamed to "attached" to make it clearer t=
hat
> > > this means the block device has been connected/opened. Also
> > > "initialized" can be confused with "created".
> > >=20
> > > The corresponding APIs are:
> > >=20
> > > int blkio_create(const char *driver, struct blkio **bp, char **errmsg=
);
> > > int blkio_attach(struct blkio *bp, char **errmsg);
> > > int blkio_start(struct blkio *bp, char **errmsg);
> > > void blkio_destroy(struct blkio **bp);
> > >=20
> > > There is no way to query the state here, but that probably isn't
> > > necessary since an application setting up the blkio instance must
> > > already be aware of the state in order to configure it in the first
> > > place.
> > >=20
> > > One advantage of this approach is that it can support network drivers
> > > where the attach and start operations can take a long time while regu=
lar
> > > property accesses do not block.
> >=20
> > I like this.
> >=20
> > For properties, I think, each property will have a first state in which
> > it becomes available and then it will be available in all later states,
> > too.
> >=20
> > Currently, apart from properties that are always read-only, we only hav=
e
> > properties that are rw only in their first state and become read-only i=
n
> > later states. It might be reasonable to assume that properties will
> > exist that can be rw in all later states, too.
> >=20
> > In their first state, most properties only store the value into the
> > config and it's the next state transition that actually makes use of
> > them. Similarly, reading usually only reads the value from the config.
> > So these parts can be automatically covered. Usually you would then onl=
y
> > need a custom implementation for property updates after the fact. I
> > think this could simplify the driver implementations a lot. I'll play
> > with this a bit more.
>=20
> Hi Kevin,
> I posted a patch that introduces blkio_connect() and blkio_start():
> https://gitlab.com/libblkio/libblkio/-/merge_requests/4

Assuming that you want review to happen on Gitlab, I added a few
comments there.

I'm not sure if you saw it, but on Wednesday, I also created a merge
request for some first changes to reduce the properties boilerplate in
the iouring module that would otherwise be duplicated for every new
driver. Not sure if everything is a good idea, but the first patch is
almost certainly one.

(However, I just realised that the test failure is not the same as on
main, so I degraded it to a draft now. It also conflicts with your merge
request. Next thing to learn for me is how to respin a merge request on
Gitlab... You may want to have a look anyway.)

Kevin

--JRB6gLcHmsurkIYG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCenWAACgkQfwmycsiP
L9aAeBAAtCSYY72VWbfi2OFU2hmCgMtfomUI1ejsjFEzmX+zzVn8wYKPFNrWYsfV
KHZSvbroyrTRj1VeIRgFcEL3n1AJuQ3xjiYt8Ca7Dr/tDn/EWeo95fc8fRIDA+Zd
5MMOvXSpggCaXpssEzRq3mXFm4mOzmp+aLNVHpzcn483x8w02axRdRV1sMeXQ8Jb
UiKIt8FZ2oO08Q5N+gH8vNwF9qfn3ifYMEWEVcDtdkDvlzkQ10oPBB1F3rZhau6f
M4+oUKLQMsqWPrMKKvat8cyYPM/ED9qs4CBA9+olUPkRfX3mIT678cjXn/WalzOS
L99t68UQJYWO8FNK/y2uubjm3oc7s4ZsnjbPFNiIfqUtYLYsBJ7HXnYWOU5Jo6eq
/MI4oiB/CmWopvVYWMb0yffM5v5Bou4MSUtCpiOzPJUF/7kwpgb7pxFoD7DcFSLb
Z3V1X8a5FRa+cXz+NebGma/o7cfI7AgYaEuSiWUvvSIJb+3jWPITs5Xgxec5gomB
zlWPInc430/urGHcExxZEmWEmVFEbaTrKCJ4Mq2wWq+qzanLQbvGDtV/8s57ytWR
VbpSQaf3FIm4ia1uR7wS4bg8h1XFu0Sa5I8X59+yLyR8SOSyJL9Gyqg/89nBHgkS
dtlf0WeIHvmNKi4GAZg09fZKJAaTpw/eHHdIqU+CsPf99PBkpFk=
=gQYw
-----END PGP SIGNATURE-----

--JRB6gLcHmsurkIYG--


