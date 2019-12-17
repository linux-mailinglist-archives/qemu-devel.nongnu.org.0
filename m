Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804FA122908
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 11:39:28 +0100 (CET)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihAGF-0002LA-Jn
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 05:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ihAFP-0001p9-I3
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 05:38:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ihAFO-0002Ww-Es
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 05:38:35 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45804
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ihAFO-0002W8-AU
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 05:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576579113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ooYjuBiwtPb5pylZdOo7A8KiLahx6aPtEPV+EIIg09w=;
 b=INTXEUTlMY4SUHnQZOpJXk4PMfFL+nRsalU0kA+/el7Q9qfQOc49ONedhF8P0L8zjtsMj9
 y7JvdBTQSofdec/Hk+5MD0XHFcu0SHm2g4vknTuXVU6plvTdlQizgQhFfPx6IoWA1/eCWN
 FgXGcEacYE0EY3JcRVR/GRY4vVTqI+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-MF1YvaAEO6ql3FGq7yGLtA-1; Tue, 17 Dec 2019 05:38:32 -0500
X-MC-Unique: MF1YvaAEO6ql3FGq7yGLtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C6C593A0;
 Tue, 17 Dec 2019 10:38:31 +0000 (UTC)
Received: from localhost (ovpn-117-244.ams2.redhat.com [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50FC55D9C9;
 Tue, 17 Dec 2019 10:38:26 +0000 (UTC)
Date: Tue, 17 Dec 2019 10:38:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-blk: deprecate SCSI passthrough
Message-ID: <20191217103825.GD1267701@stefanha-x1.localdomain>
References: <20191213144626.1208237-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191213144626.1208237-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:46:26PM +0000, Stefan Hajnoczi wrote:
> The Linux virtio_blk.ko guest driver is removing legacy SCSI passthrough
> support.  Deprecate this feature in QEMU too.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qemu-deprecated.texi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl34sCEACgkQnKSrs4Gr
c8gzMAgAnDcXk0uDqnMGo7Zg1aApia5PRAgWoRr5g7EJxcLK9LyJ7QsloyPoGlji
Z9iYWeA3rR7qFGCz09aqCKWXasyVUSC1GbEE+BbiR7ulq2UrXcby+szrBQkMuI2Z
//RVEyfFqNhw50k4J5J+G7uRGFsThhdBuEtBgNgpH7VssvARbZKiWp0JPLfo7LgS
Ie0OoMw8IQUuZK95cLk+EAh/Xa65AJiNh0aT1OPTPsQiFETchJX3f6Jwnz/xLnMt
dmd2+9Jes6uwdJjOJIo4Vxo+2G/jwN2HWdg+wlWHZiUgx1BucJCCKcVpCq0OWnYP
oh5OJavlktalC7U8rrSZn3XB9ZQ/zg==
=DL/2
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--


