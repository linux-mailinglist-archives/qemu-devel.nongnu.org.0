Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D25571A0D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:33:00 +0200 (CEST)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBF4V-0002CQ-Ih
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBEy5-0005yD-67
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBEy2-0005UU-FS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657628777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZ2BG7uSgc61gOzE20AgXWR4lnUuBh4ZajFD+pM9hNc=;
 b=KML8F3uupdBv27UKs5i203856Tv/vLymboDR6XLfPUS+XaC9OkfY/k12M4cQh9zZc5tzQh
 +fztPvDrtsv9EAbenjGGoI6ZTiTd3THOXoyWaEI1ocv3U2gU+EOr6JoobCxfQlM2fJS7p9
 zI+ak7wUKHG/8lI9KG3BpaZ1lMGZkbY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-GYqOGcLbN-qrPwESxPrNHw-1; Tue, 12 Jul 2022 08:26:16 -0400
X-MC-Unique: GYqOGcLbN-qrPwESxPrNHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF4921C1BD2A;
 Tue, 12 Jul 2022 12:26:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 610999D7F;
 Tue, 12 Jul 2022 12:26:15 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:26:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 6/8] virtio-blk: mark IO_CODE functions
Message-ID: <Ys1oZtGUpCxziwuH@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-7-eesposit@redhat.com>
 <YsRNC0tj6YP2pgMi@stefanha-x1.localdomain>
 <ab3f6227-20c2-1c3a-4bae-814f06670bd0@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S0zDzufI3g2dxFsU"
Content-Disposition: inline
In-Reply-To: <ab3f6227-20c2-1c3a-4bae-814f06670bd0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--S0zDzufI3g2dxFsU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:19:43AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 05/07/2022 um 16:39 schrieb Stefan Hajnoczi:
> > On Thu, Jun 09, 2022 at 10:37:25AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> Just as done in the block API, mark functions in virtio-blk
> >> that are called also from iothread(s).
> >>
> >> We know such functions are IO because many are blk_* callbacks,
> >> running always in the device iothread, and remaining are propagated
> >> from the leaf IO functions (if a function calls a IO_CODE function,
> >> itself is categorized as IO_CODE too).
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> ---
> >>  hw/block/dataplane/virtio-blk.c |  4 ++++
> >>  hw/block/virtio-blk.c           | 35 +++++++++++++++++++++++++++++++++
> >>  2 files changed, 39 insertions(+)
> >=20
> > The definition of IO_CODE() is:
> >=20
> >   I/O API functions. These functions are thread-safe, and therefore
> >   can run in any thread as long as the thread has called
> >   aio_context_acquire/release().
> >=20
> > I'm not sure it matches with the exact semantics you have in mind. Are
> > they really allowed to be called from any thread and even from multiple
> > threads? Or maybe just from the BlockBackend's AioContext thread?
>=20
> I think it is just from the BlockBackend's AioContext thread. But I
> classified blk_* functions as IO_CODE.
>=20
> What is your opinion on that?

There is a difference between blk_*() APIs and device emulation code.
Device emulation code controls exactly where it runs (vCPU thread, main
loop, IOThread). blk_*() APIs may be called from more of contexts and
they have no control over it.

I'd like to make sure that the annotations match the actual usage that
the code was designed for.

Stefan

--S0zDzufI3g2dxFsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNaGYACgkQnKSrs4Gr
c8hw0ggApq1gXhvGq1Wb1w1R8UTJA4NZCdNUt9DCOA3AemXpAxhZqlKzapMumI/1
Bs0s9FVq/Q3sGFLRCCUkbYns9iCuBHVBLmNZINAkrSmfo1GdYFT7QpOFPK+6zvMu
LDZVqd/VRm+ZKdD97lbtcrT+pIimBLycR/ZVNCddd4Ug+aTHdkJyAroXCSxe2Zvc
Rjqw6+TpAoeFF+tRN1PmFZyfundbhUfHL9Eu6HdCmu1r2u3ybtxGSjdoGFyFYV8j
2fh6BmVGIMinUBh5zQYBD+qJ5f00Z9X14qzt6dX7hzKoVeND7Xe6ZLQZG1k2exAk
BRkn7l9wOjNO6xioalsJ4B3iUNr7qg==
=fnRW
-----END PGP SIGNATURE-----

--S0zDzufI3g2dxFsU--


