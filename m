Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E045154C97F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:14:13 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Sqa-00057p-Vi
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1Sni-0002BT-3K
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1Sna-0000C0-7S
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655298664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8vU0i5IteNW7CS6utQ3JOqJYGAiwGE3XYxqE366cbsQ=;
 b=QaX3UIlUWTV5o28RgBVTHmf8cw2VPp1mdW0kwIHGq1WD1QrcZnN91dg8CIlKcb5CZAEDWc
 DLVa50iHTJqRAQI1n9ZTgJcspxVJFDEeykYxOJiYZ6BASOUOTDO5yIjcqmSS2zU5TMeYIz
 smvRGaZGggPM913kWm9KnKVdurbLCes=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-EfUbOI6JP_-jOlV4FbiBZQ-1; Wed, 15 Jun 2022 09:11:00 -0400
X-MC-Unique: EfUbOI6JP_-jOlV4FbiBZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E1F53C0F725;
 Wed, 15 Jun 2022 13:11:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0965C28112;
 Wed, 15 Jun 2022 13:10:58 +0000 (UTC)
Date: Wed, 15 Jun 2022 14:10:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH 0/2] Make local migration with TAP network device possible
Message-ID: <YqnaYfYxv0yPCmpP@stefanha-x1.localdomain>
References: <20220614111843.24960-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yFpjpLS5bgghq3Jm"
Content-Disposition: inline
In-Reply-To: <20220614111843.24960-1-arbn@yandex-team.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--yFpjpLS5bgghq3Jm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 02:18:41PM +0300, Andrey Ryabinin wrote:
> Hi
>=20
> These couple patches aims to  make possible local migration (within one h=
ost)
> on the same TAP device used by source and destination QEMU
>=20
> The scenario looks like this
>  1. Create TAP devices and pass file descriptors to source QEMU
>  2. Launch destination QEMU (-incoming defer) and pass same descriptors t=
o it.
>  3. Start migration
>=20
>=20
> Regarding the first patch: It makes possible to receive file descriptor i=
n non-blocking
> state. But I probably didn't cover all FD users which might need to set b=
locking state after
> the patch. So I'm hopping for the hints where else, besides fd_start_inco=
ming_migration()
> I need to put qemu_socket_set_block() calls.

Nice feature. I am worried that these patches are unsafe/incomplete
though.

Tap local migration isn't explicitly visible in the code. How will other
developers know the feature is there and how to avoid breaking it when
modifying the code? Maybe a migration test case, comments that explain
the rules about accessing the tap fd, and/or assertions?

How does this interact with hw/net/vhost_net.c, which uses tap_get_fd()
to borrow the fd? I guess the idea is that the source VM is paused and
no tap activity is expected. Then migration handover happens and the
destination VM starts running and is allowed to access the tap fd.
However, the source VM still has vhost_net with the tap fd set up. I
wonder if there is any issue with interference between the two vhost_net
instances?

These kinds of questions should be answered, mostly in the code but also
in the cover letter. It should be clear why this approach is correct.

Thanks,
Stefan

>=20
>=20
> Andrey Ryabinin (2):
>   chardev: don't set O_NONBLOCK on SCM_RIGHTS file descriptors.
>   tap: initialize TAPState->enabled according to the actual state of
>     queue
>=20
>  chardev/char-socket.c |  3 ---
>  io/channel-socket.c   |  3 ---
>  migration/fd.c        |  2 ++
>  net/tap-bsd.c         |  5 +++++
>  net/tap-linux.c       | 12 ++++++++++++
>  net/tap-solaris.c     |  5 +++++
>  net/tap.c             |  2 +-
>  net/tap_int.h         |  1 +
>  8 files changed, 26 insertions(+), 7 deletions(-)
>=20
> --=20
> 2.35.1
>=20

--yFpjpLS5bgghq3Jm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKp2mEACgkQnKSrs4Gr
c8ik4Af+Kag49awcmdft9M1BDMP8CzwWKPaoFm7kEl0OuHfUQJsO6UoR+yfPw0AR
C2urXhKt06P0F7+DJzahAGGfLnd3Td7TteuAoAHGjVuP1qvZ8tHR2kouAKB+vjUv
HFUFIsK93gwrLg2vCI6nwnjbDNpo/jQRMjRU6bmHYo1BSN5c9tr//BB/aoEVA6L6
ac4xjHXjcN/IB7R+Oks5rEtakE1Jidz/v++mN6Rj0PFySUkCfI4JASqAnPpZtqU5
i3jFbx0+HB9ZC+1uGvnq0HdUkdANZKv+T/K3ixH8z/crkvLrGUICeIiUcCTJlGQ4
1XAjvZupk4v5XmYQ0E1LJc6abSVv5g==
=omhr
-----END PGP SIGNATURE-----

--yFpjpLS5bgghq3Jm--


