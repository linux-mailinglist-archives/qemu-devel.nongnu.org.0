Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F07F40C7A8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:44:49 +0200 (CEST)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQW9Y-0005S6-Bz
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQW8U-0004hm-97
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQW8S-0003Aj-O0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631717019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJ2pHqP7FykKm62yThrwUOebQPwI4ntHoHkY5bdih9w=;
 b=arjhjG3s6XCrWDXJGopxjFh9HL1NHtoCo6q2EopUM3kma57bLlTvk1rfDy75zWuywFtqUh
 Su8zosm9wMubv6ma/Bzp8SNn0oljTMVV6Nlqm5nqRGYUW87JS35OCKlGAsgUg7MOAGaxhe
 Ej94ulNTOSqd6m6s4Cc6JLx8+QZbDME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-hteNxukROqmMzcbKHSb_jw-1; Wed, 15 Sep 2021 10:43:38 -0400
X-MC-Unique: hteNxukROqmMzcbKHSb_jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C2DC801E72;
 Wed, 15 Sep 2021 14:43:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3061972E;
 Wed, 15 Sep 2021 14:43:36 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:43:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
Message-ID: <YUIGlyfL+SleHCAc@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <YT9NuK84J2hvMXs2@stefanha-x1.localdomain>
 <916c8456-9433-42a0-df2d-3e62ced283fd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <916c8456-9433-42a0-df2d-3e62ced283fd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X/7EBZwGz06rO4O3"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--X/7EBZwGz06rO4O3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 02:11:41PM +0200, Paolo Bonzini wrote:
> On 13/09/21 15:10, Stefan Hajnoczi wrote:
> > On Wed, Sep 08, 2021 at 09:10:17AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> > > Currently, block layer APIs like block-backend.h contain a mix of
> > > functions that are either running in the main loop and under the
> > > BQL, or are thread-safe functions and run in iothreads performing I/O=
.
> > > The functions running under BQL also take care of modifying the
> > > block graph, by using drain and/or aio_context_acquire/release.
> > > This makes it very confusing to understand where each function
> > > runs, and what assumptions it provided with regards to thread
> > > safety.
> > >=20
> > > We call the functions running under BQL "graph API", and
> > > distinguish them from the thread-safe "I/O API".
> >=20
> > Maybe "BQL" is clearer than "graph" because not all functions classifie=
d
> > as "graph" need to traverse/modify the graph.
>=20
> Bikeshedding, I like it! :)
>=20
> ... on the other hand, qemu-storage-daemon does not have a BQL (see patch
> 1); "graph API" functions run from the main (monitor) thread.
>=20
> The characteristic of the "graph API" is that they affect global state, s=
o
> another possibility could be "global state API".  But is there any global
> state apart from the BlockDriverState graph and the associated
> BlockBackends?

I would be happy with that name too.

Stefan

--X/7EBZwGz06rO4O3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFCBpcACgkQnKSrs4Gr
c8icBQgArros7pQMOuD36E30sokXMfHjaE7jjyCePGZlc2jTL2v3nTs6KaIH3vAy
v545snhaHIyDOVJU1cw2SBWQXnMETjkPgWTyy+2pdlC7AvoPNXih1I9mwEQzVVQd
BZORFG3UUjIkZjYMmV8TWb0IP9ySvKUhrGGcbSxk246j9tNQHu3OckCN6e33rl8T
El71e0/ixQnVAUN2gBnyXpGbLGQxdjNaBwPivJFzqjX705CC7LJoaRYo7sGoAFWu
0KTITawG/3KXVDk7pSv8LSGXtl1KK8s7/F+3r0MSgzwiAXjUbABrBq/BG4qULsg3
r14DGJycQTnbhaPihsktXozM8sJ9Xg==
=H1fb
-----END PGP SIGNATURE-----

--X/7EBZwGz06rO4O3--


