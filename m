Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA93A25FD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:00:33 +0200 (CEST)
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFc8-0003o2-Ep
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lrFal-0002ct-4e
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lrFah-0005Uk-Ki
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623311941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ONcCJ4Go1jxMPXoxG//GGjnyWc0MkxLdFH9E9Co60Zw=;
 b=iuY4fYuQm9gO0nteD3BKXcNlIfDV0aPLIC6fngR01O3ZgrPdBWjud3B8OAHYfl5vWjDi5k
 mrURrINqbFA4ynMLQDVKKawcNdEKFrb2oqW0+xVPBnQteXGOA3RlxLPOFKHDgGGqbHU2Bd
 1JhgKRI5irPEyZcDd7qLAE7cXhmv0WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-oPSGqE7kMwul4O55La1frw-1; Thu, 10 Jun 2021 03:58:59 -0400
X-MC-Unique: oPSGqE7kMwul4O55La1frw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59E76800D62
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:58:58 +0000 (UTC)
Received: from localhost (ovpn-114-58.ams2.redhat.com [10.36.114.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7E0560C04;
 Thu, 10 Jun 2021 07:58:51 +0000 (UTC)
Date: Thu, 10 Jun 2021 08:58:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/13] [RfC] fix tracing for modules
Message-ID: <YMHGOnMTiagIHk/0@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <YMDaxBVivnksvA/7@stefanha-x1.localdomain>
 <20210610063205.aabxmgionkj7ae7p@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210610063205.aabxmgionkj7ae7p@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pOlKFWVu4M+9NQlU"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pOlKFWVu4M+9NQlU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 08:32:05AM +0200, Gerd Hoffmann wrote:
> On Wed, Jun 09, 2021 at 04:14:12PM +0100, Stefan Hajnoczi wrote:
> > On Tue, Jun 01, 2021 at 03:24:01PM +0200, Gerd Hoffmann wrote:
> > > First version that actually works.  Only qxl covered for this RfC,
> > > other modules will follow once the basics are hashed out.
> > >=20
> > > v4:
> > >  - rebase to latest master.
> > >  - fix systemtap tracing.
> > >  - also cover virtio-gpu modules.
> > >  - pick up some review tags.
> > >  - misc minor tweaks.
> > >=20
> > > v3:
> > >  - handle initialization of modular tracepoints.
> > >=20
> > > TODO:
> > > Enabling modular tracepoints via -trace cmd line doesn't work yet.
> > > Guess we need to store the list somewhere for later re-processing.
> > > Error handling is tricky, specifically the "tracepoint doesn't exist"
> > > error.  Suggestions / ideas are welcome.
> >=20
> > Excellent! I think we discussed these TODOs in the past. Can we merge
> > this series in close to its current form or does it degrade the tracing
> > experience (e.g. does the -trace command-line no longer work for
> > trace-events files that were split off into modules)?
>=20
> Main focus for v4 was to make stap work.
> The cmd line issue is still there.
>=20
> Patches 1-5 can be cherry-picked without breaking something.

Thanks, I have applied Patches 1-5 to my tracing tree:
https://gitlab.com/stefanha/qemu/-/tree/tracing

Stefan

--pOlKFWVu4M+9NQlU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDBxjoACgkQnKSrs4Gr
c8jjPAf+JqB+0s0Eg607Ryy1ZocNqq8ib/54qtJzJgzEbx/8H5+KvBYdBe6zDvlv
+B46AMZ354SHONwtjV+zEGMQ+N4OrE1seAOoxwm/k/O6IY2+fAao9hqhRt0Xi4xg
wkN6vPbyOfshag/fOsaQ3V3d2E82xKYiUHWlWUXL3t8JTrD0kFn5Pt3QJhyklT5d
Nkwv6yPk9bu7fDpxa1b4NHTkG4OwwGHTa4bSIHq0s7y2I6FGmIv67oSQcxuqHuOC
erzEb6HtCHk1vVrHoBuxclv8TFMmYQ4ZNY1436F+v5Zju8cXjMpMOKLbW8GJFgrc
MSPDwQecxbGE5qsCjD2ejbU1oSY5aQ==
=sqv7
-----END PGP SIGNATURE-----

--pOlKFWVu4M+9NQlU--


