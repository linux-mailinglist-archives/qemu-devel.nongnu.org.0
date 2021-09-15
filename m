Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D340C79F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:39:58 +0200 (CEST)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQW4r-00037R-U1
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQW3t-0002Ke-Fo
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQW3r-0007Xi-IS
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631716734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3wKm6BWcgKopTnsFu8fnTOJo6eAofX1NkRlRzCRrSM=;
 b=LJoxqWU6o9K6qTIAtmhSgEg9V3YRDYjE26J5au5+llqzx2BVDjXL5/ffjFTsYjWZlljj9L
 z1Zju+KDIH/jCeN5mmmwvrJrV1+F8h9v9ZeHcejPTOkDcNdppUQJHTFxv5EjUMiXpMBQwa
 5IgnGnejR+34AadghkjV0rwbKtsbHA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-l5dlcVwsPIOrF5yUKAPJVA-1; Wed, 15 Sep 2021 10:38:53 -0400
X-MC-Unique: l5dlcVwsPIOrF5yUKAPJVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DEA1084683;
 Wed, 15 Sep 2021 14:38:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B03D5D9CA;
 Wed, 15 Sep 2021 14:38:51 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:38:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 3/4] include/sysemu/block-backend: split header into
 I/O and graph API
Message-ID: <YUIFelnROLe5De8m@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-4-eesposit@redhat.com>
 <YT9RzrThGlWp4E5Q@stefanha-x1.localdomain>
 <5060185f-9a76-da5a-9214-6d11efef0281@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5060185f-9a76-da5a-9214-6d11efef0281@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2aiOcilXgwyhPjd9"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--2aiOcilXgwyhPjd9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 02:14:08PM +0200, Paolo Bonzini wrote:
> On 13/09/21 15:27, Stefan Hajnoczi wrote:
> > > +/*
> > > + * I/O API functions. These functions are thread-safe, and therefore
> > > + * can run in any AioContext.
> > "can run in any AioContext" makes me wonder what the exact requirements
> > are. Can they run in any*thread*  (regardless of whether an AioContext
> > even exists for that thread) or do they need to run in a thread that ha=
s
> > called qemu_set_current_aio_context()?
>=20
> I think they can run in any thread as long as they have called
> aio_context_acquire/release; later on, they will be able to run in any
> thread completely (which will be the underlying mechanism for multiqueue)=
.

Great, it would be good to reflect this in the comment.

Stefan

--2aiOcilXgwyhPjd9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFCBXoACgkQnKSrs4Gr
c8gmsQgAmGgVKZKUSolkODvs7713WoZEUj7hE23UFx8Z8BzxcaD9dOEg1H+Yaeg4
op5lpILPXN33OG0lEZvSMUKBGoR1ViK1+OpfpUQbP0qucnwF+1HOTERKwTzAzkzj
eyRbPGuzvNmIYgAJTEVO1v27wSGSQ/s5G2FlHRP3Slh4OH00DsH7SzYZ7V6uAcZ5
1cIRx6VaZM5a/rnGohySIMXupvutyD7Tee4Ay5Xbdot9Jm7ZnRLTYxqAAiYCvuBv
SGKieiObUmsFymGHuaC/lFGQd8usGfQgKOIQhu51UPKWI9VyGjbF1GT2fAt4prjn
+Jyl0cU3yqtJU7WNT48Za5vp71rIpw==
=9eSm
-----END PGP SIGNATURE-----

--2aiOcilXgwyhPjd9--


