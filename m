Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40730382EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:10:26 +0200 (CEST)
Received: from localhost ([::1]:42720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidwv-0002Xu-B4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lidw5-0001ia-Az
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lidvz-0003i8-PG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621260566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bakDOCCmvEC8xYY3i1OkGAdJQxLWm18c06x6sfeBjdU=;
 b=AHIzmDL9yvBhHaj7A1HfBfsVSRu6H21RNI4QG0UJzzt6xz08Up2iATAmQTd34I+Yuxi1Jg
 sAlwUEoZcijT3stCaK/rUVXhZK4YaiwC+t21d7BFQHaHB00QJGSKQadyeDQKsvEqqmyK1L
 F8U7+6hsJAcuYJ8390OWnu7PbYlqIkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-BNeGO_cQP-KUhrlHo-zCOQ-1; Mon, 17 May 2021 10:09:22 -0400
X-MC-Unique: BNeGO_cQP-KUhrlHo-zCOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748886D246;
 Mon, 17 May 2021 14:09:20 +0000 (UTC)
Received: from localhost (ovpn-114-183.ams2.redhat.com [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FE55614F0;
 Mon, 17 May 2021 14:09:12 +0000 (UTC)
Date: Mon, 17 May 2021 15:09:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YKJ5B9F+uvjzM2Uh@stefanha-x1.localdomain>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
 <YJLL7B249hN6wJTd@merkur.fritz.box>
 <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
 <YJPF9KhUWm3tGX9b@merkur.fritz.box>
 <YJz1qqXI8z1PQYkM@stefanha-x1.localdomain>
 <YJ6dYTNLivMuj7VM@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YJ6dYTNLivMuj7VM@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g6+64kitTGLKyhcI"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

--g6+64kitTGLKyhcI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 05:55:13PM +0200, Kevin Wolf wrote:
> Am 13.05.2021 um 11:47 hat Stefan Hajnoczi geschrieben:
> > On Thu, May 06, 2021 at 12:33:24PM +0200, Kevin Wolf wrote:
> > > Am 06.05.2021 um 10:46 hat Stefan Hajnoczi geschrieben:
> > > > What do you think about this:
> > > >=20
> > > > The blkio instance states are:
> > > >=20
> > > >   created -> attached -> started -> destroyed
> > > >=20
> > > > It is not possible to go backwards anymore, which simplifies driver
> > > > implementations and it probably won't be needed by applications.
> > > >=20
> > > > The "initialized" state is renamed to "attached" to make it clearer=
 that
> > > > this means the block device has been connected/opened. Also
> > > > "initialized" can be confused with "created".
> > > >=20
> > > > The corresponding APIs are:
> > > >=20
> > > > int blkio_create(const char *driver, struct blkio **bp, char **errm=
sg);
> > > > int blkio_attach(struct blkio *bp, char **errmsg);
> > > > int blkio_start(struct blkio *bp, char **errmsg);
> > > > void blkio_destroy(struct blkio **bp);
> > > >=20
> > > > There is no way to query the state here, but that probably isn't
> > > > necessary since an application setting up the blkio instance must
> > > > already be aware of the state in order to configure it in the first
> > > > place.
> > > >=20
> > > > One advantage of this approach is that it can support network drive=
rs
> > > > where the attach and start operations can take a long time while re=
gular
> > > > property accesses do not block.
> > >=20
> > > I like this.
> > >=20
> > > For properties, I think, each property will have a first state in whi=
ch
> > > it becomes available and then it will be available in all later state=
s,
> > > too.
> > >=20
> > > Currently, apart from properties that are always read-only, we only h=
ave
> > > properties that are rw only in their first state and become read-only=
 in
> > > later states. It might be reasonable to assume that properties will
> > > exist that can be rw in all later states, too.
> > >=20
> > > In their first state, most properties only store the value into the
> > > config and it's the next state transition that actually makes use of
> > > them. Similarly, reading usually only reads the value from the config=
.
> > > So these parts can be automatically covered. Usually you would then o=
nly
> > > need a custom implementation for property updates after the fact. I
> > > think this could simplify the driver implementations a lot. I'll play
> > > with this a bit more.
> >=20
> > Hi Kevin,
> > I posted a patch that introduces blkio_connect() and blkio_start():
> > https://gitlab.com/libblkio/libblkio/-/merge_requests/4
>=20
> Assuming that you want review to happen on Gitlab, I added a few
> comments there.
>=20
> I'm not sure if you saw it, but on Wednesday, I also created a merge
> request for some first changes to reduce the properties boilerplate in
> the iouring module that would otherwise be duplicated for every new
> driver. Not sure if everything is a good idea, but the first patch is
> almost certainly one.
>=20
> (However, I just realised that the test failure is not the same as on
> main, so I degraded it to a draft now. It also conflicts with your merge
> request. Next thing to learn for me is how to respin a merge request on
> Gitlab... You may want to have a look anyway.)

Awesome, I will take a look, thanks. I need to tweak my GitLab
notification options :-).

You can force push to your topic branch to respin the merge request.

Stefan

--g6+64kitTGLKyhcI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCieQcACgkQnKSrs4Gr
c8jhiggAk8aDWi8zPo1eZ0oXchGye8mDyMxA+R4+B4oa/FDk5+b9hVTgPeScC1Te
FS7mrpm9DbLjy0eyuZBu6ASCnk4YsvdEjzhjVtLqsPVKgdH2JRQytOtvm6Eq4TJp
qqopNnI3wrAPvkrKwSs8Qu/NNEZOh9I063wnKyNgJOLtH6ghrSD1N4a8bmWUK10J
GGIOVx4tdNrPMYMQ6yc0KnE9Q88v32RYoqpEMftKNfu09Cedp+hegEXmu68LjIJT
LFGRTxEdFR9WObYkfAf6KIMHDFfyvhvdJ4PCbvf6nWTZQ5gAXf3XIidxAsRsi3ep
HCEpTfY4gTaxYRuS5CnRSIaWiXwQbw==
=1nxs
-----END PGP SIGNATURE-----

--g6+64kitTGLKyhcI--


