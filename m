Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63E1681A1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 16:30:31 +0100 (CET)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5AG6-0008Fc-Jx
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 10:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j5AF1-0007Oe-Sy
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:29:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j5AEx-0001we-LY
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:29:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35634
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j5AEx-0001wS-Hy
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582298958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eulhHXTtp7ebjfIde77lRBsZu3yMvtuv+7S6RGx6xyo=;
 b=VxbH1POwowFLbqV4ZprQzDlC8OThZjaoJGecc6g/JZrJTuz1ZU2PY/rc3nZiErW4MdUUMt
 26vo80cmewWemZthG/NkgZrlMFeRJdFrGgP7SYMbj4km4JS3giTareX5LRnMNiALCmeuRp
 hcrpbOMktRNDymV/x9A1FoOOeKTAf5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-GC4mChnBNriJ76BRiALKXA-1; Fri, 21 Feb 2020 10:29:14 -0500
X-MC-Unique: GC4mChnBNriJ76BRiALKXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BBC2800D54;
 Fri, 21 Feb 2020 15:29:13 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB845D9E2;
 Fri, 21 Feb 2020 15:29:10 +0000 (UTC)
Date: Fri, 21 Feb 2020 15:29:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/5] aio-posix: towards an O(1) event loop
Message-ID: <20200221152909.GD1511783@stefanha-x1.localdomain>
References: <20200214171712.541358-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214171712.541358-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 05:17:07PM +0000, Stefan Hajnoczi wrote:
> This patch series makes AioHandler deletion and dispatch O(1) with respec=
t to
> the total number of registered handlers.  The event loop has scalability
> problems when many AioHandlers are registered because it is O(n).  Linux
> epoll(7) is used to avoid scanning over all pollfds but parts of the code=
 still
> scan all AioHandlers.
>=20
> This series reduces QEMU CPU utilization and therefore increases IOPS,
> especially for guests that have many devices.  It was tested with 32 vCPU=
s, 2
> virtio-blk,num-queues=3D1,iothread=3Diothread1, and 99
> virtio-blk,num-queues=3D32,iothread=3Diothread1 devices.  Using an IOThre=
ad is
> necessary because this series does not improve the glib main loop, a non-=
goal
> since the glib API is inherently O(n).
>=20
> AioContext polling remains O(n) and will be addressed in a separate patch
> series.  This patch series increases IOPS from 260k to 300k when AioConte=
xt
> polling is commented out
> (rw=3Drandread,bs=3D4k,iodepth=3D32,ioengine=3Dlibaio,direct=3D1).
>=20
> Stefan Hajnoczi (5):
>   aio-posix: fix use after leaving scope in aio_poll()
>   aio-posix: don't pass ns timeout to epoll_wait()
>   qemu/queue.h: add QLIST_SAFE_REMOVE()
>   aio-posix: make AioHandler deletion O(1)
>   aio-posix: make AioHandler dispatch O(1) with epoll
>=20
>  block.c              |   5 +-
>  chardev/spice.c      |   4 +-
>  include/block/aio.h  |   6 +-
>  include/qemu/queue.h |  17 +++++
>  util/aio-posix.c     | 172 +++++++++++++++++++++++++++++--------------
>  5 files changed, 141 insertions(+), 63 deletions(-)
>=20
> --=20
> 2.24.1
>=20

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5P90UACgkQnKSrs4Gr
c8hdGQf9E1nhLfXMlZw0egPpP1TIOpfUve5FO7eiidMsLDlBh95kZ5mjn55p8DmL
Er9miJoT8Yt/asT6gTP4ZMGtkFUja856yk2hJ507nj//oO/WItL8LXIeXslGC6tG
ej668v6FB8bPNkcLpyvNrJyevqmLktD2HkDUA8IyItppVE+qjcAsvAloWKCTE7XT
r6sUqBb0YFA2KViYVOSs/XZzfI4gMw03r8zLFWpgAQNcZSPzdR9kHD12Nh9LTQPb
Tr9zTFJ5imb+rHoPKKMdBYAUM15BLRWV4R8l/LltMC9x2j2yVsvB58L7L2Cz9wtm
x0iY039G1TWE+6VDSFs5tcft+hI6qQ==
=Uf48
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--


