Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B034FDCF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:09:57 +0200 (CEST)
Received: from localhost ([::1]:38676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXnQ-0000Fn-JC
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXm8-0008GW-PS
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXm3-0002YU-KE
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617185309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebWK1JW8esfjUCnIk6+QOoGzwdZ4BnYGo8AyZzeCDK4=;
 b=On2P5/6ZFyLjlApUqs6ziZ4yyBj6RjOB6Qo5qGZWHSIisHs7bqbgJ1siTRE38PgvCOXQ07
 DvJtbBcf/XB4X0iaGxixEQUBeRo8f/R0GjoOgYdUt0DgkFnxY2lSVl0zyKAiTPy9ThQHp6
 /I7RD1kP07Z2hvPL9fNkNhHfIOPXoq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-A4lNPHxkNEOxEJseworWWA-1; Wed, 31 Mar 2021 06:08:25 -0400
X-MC-Unique: A4lNPHxkNEOxEJseworWWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 269A38189C8
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 10:08:25 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 667AD1001281;
 Wed, 31 Mar 2021 10:08:21 +0000 (UTC)
Date: Wed, 31 Mar 2021 11:08:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Message-ID: <YGRKFDNxNaOToJeB@stefanha-x1.localdomain>
References: <20210310173004.420190-1-stefanha@redhat.com>
 <YFB17aYnCZlyp8b4@stefanha-x1.localdomain>
 <2e7bb28d-0b3c-ac69-7984-687d4ee487c7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2e7bb28d-0b3c-ac69-7984-687d4ee487c7@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="61jgAfy5TmAuIx3X"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--61jgAfy5TmAuIx3X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 08:35:14AM -0500, Eric Blake wrote:
> On 3/16/21 4:10 AM, Stefan Hajnoczi wrote:
> > On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
> >> socket_get_fd() fails with the error "socket_get_fd: too many
> >> connections" if the given listen backlog value is not 1.
> >>
> >> Not all callers set the backlog to 1. For example, commit
> >> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
> >> socket listen() backlog") uses SOMAXCONN. This will always fail with i=
n
> >> socket_get_fd().
> >>
> >> This patch calls listen(2) on the fd to update the backlog value. The
> >> socket may already be in the listen state. I have tested that this wor=
ks
> >> on Linux 5.10 and macOS Catalina.
> >>
> >> As a bonus this allows us to detect when the fd cannot listen. Now we'=
ll
> >> be able to catch unbound or connected fds in socket_listen().
> >>
> >> Drop the num argument from socket_get_fd() since this function is also
> >> called by socket_connect() where a listen backlog value does not make
> >> sense.
> >>
> >> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog =
parameter to socket_listen")
> >> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> >> Cc: Juan Quintela <quintela@redhat.com>
> >> Cc: Eric Blake <eblake@redhat.com>
> >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> ---
> >>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
> >>  1 file changed, 22 insertions(+), 7 deletions(-)
> >=20
> > Dan and Gerd: Can this go via one of your trees?
> >=20
>=20
> As it showed up as a regression in qemu-nbd, I can also consider queuing
> it in my NBD tree.  However, I claim it counts as a bug fix, so it is
> fine for -rc1 even if it misses soft freeze.
>=20
> I'm fine whichever maintainer takes this, although I've now flagged it
> to go through an NBD pull request if it doesn't land elsewhere sooner.

Hi Eric,
Is this patch going into QEMU 6.0?

Thanks,
Stefan

--61jgAfy5TmAuIx3X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBkShQACgkQnKSrs4Gr
c8gDLQf/aF7myGYPuAqZF2JzhcmNDZMqYahhDqqoJQeM0vO19SsHRG+ZR+xcuXSy
duoTnSbwEjjKE7V9AKAIo7VziYIScf9G7bMHkwr2EoXYkroyRezmpq791h7OqPev
UofkigyhnA4HpcP1qVhobLGaPDagw9p23KnkiOIuZQc0Lw2Pg839sSJA+u8f45NJ
i3pyyuLXhAN3YwSDVdp4+okCJNHR+fUkGdGWYAmlMO7AiW6mWy8Mi0WqFKKOMXF/
tcZhTIOU0fuelmXQxuv1muVrW88+NCPcKG4cgTI4Qd/9KF3WMLeuzXwZprRoOuEB
s7InO+Vj68/ky5j2/gh/cWlMhPDBig==
=jm+N
-----END PGP SIGNATURE-----

--61jgAfy5TmAuIx3X--


