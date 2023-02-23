Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62436A07AE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 12:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVA5O-0002bu-Lv; Thu, 23 Feb 2023 06:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVA5L-0002W7-Uo
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVA5K-0000qx-7V
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677152905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqtwwUGoQmHGy1bMQ/wwb10V9kgkYbkqlDYI2174xQg=;
 b=C25tvvqu1cHkftn7gb1pskkaIynkcCdtqpJojMvBrTHQJwtciscBr06JOjanQmFvA0faPe
 UoH5P/5j7wMl+49awJX/kQPmdiw9qNraUATgSwSgyJgSd1hA90Z2GzvuFXcQNREacMIKze
 NeHAIRqnfSfD9dnAw2LKomQ0VWqxzEU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-HiJhsVdcNGi4WU5He13aTg-1; Thu, 23 Feb 2023 06:48:21 -0500
X-MC-Unique: HiJhsVdcNGi4WU5He13aTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99ED33C0E458;
 Thu, 23 Feb 2023 11:48:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 595622026D4B;
 Thu, 23 Feb 2023 11:48:20 +0000 (UTC)
Date: Thu, 23 Feb 2023 12:48:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 00/23] block: Lock the graph, part 2 (BlockDriver
 callbacks)
Message-ID: <Y/dSgm564nCLaAjx@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com> <Y/VCFcYsqMmEF0zc@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7wNJEcDXCALcuGgt"
Content-Disposition: inline
In-Reply-To: <Y/VCFcYsqMmEF0zc@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--7wNJEcDXCALcuGgt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 21.02.2023 um 23:13 hat Stefan Hajnoczi geschrieben:
> On Fri, Feb 03, 2023 at 04:21:39PM +0100, Kevin Wolf wrote:
> > After introducing the graph lock in a previous series, this series
> > actually starts making widespread use of it.
> >=20
> > Most of the BlockDriver callbacks access the children list in some way,
> > so you need to hold the graph lock to call them. The patches in this
> > series add the corresponding GRAPH_RDLOCK annotations and take the lock
> > in places where it doesn't happen yet - all of the bdrv_*() co_wrappers
> > are already covered, but in particular BlockBackend coroutine_fns still
> > need it.
> >=20
> > There is no particularly good reason why exactly these patches and not
> > others are included in the series. I couldn't find a self-contained part
> > that could reasonable be addressed in a single series. So these just
> > happen to be patches that are somewhat related (centered around the
> > BlockDriver callback theme), are ready and their number looks
> > manageable. You will still see some FIXMEs at the end of the series
> > that will only be addressed in future patches.
>=20
> Two things occurred to me:
>=20
> 1. The graph lock is becoming the new AioContext lock in the sense that
> code using the block layer APIs needs to carefully acquire and release
> the lock around operations. Why is it necessary to explicitly take the
> rdlock in mirror_iteration()?
>=20
>   + WITH_GRAPH_RDLOCK_GUARD() {
>         ret =3D bdrv_block_status_above(source, NULL, offset,
>=20
> I guess because bdrv_*() APIs are unlocked? The equivalent blk_*() API
> would have taken the graph lock internally. Do we want to continue using
> bdrv APIs even though it spreads graph locking concerns into block jobs?

The thing that makes it a bit ugly is that block jobs mix bdrv_*() and
blk_*() calls. If they only used blk_*() we wouldn't have to take care
of locking (but that means that the job code itself must not have a
problem with a changing graph!). If they only used bdrv_*(), the
function could just take a lock at the start and only temporarily
release it around pause points. Both ways would look nicer than what we
have now.

> 2. This series touches block drivers like qcow2. Luckily block drivers
> just need to annotate their BlockDriver functions to indicate they run
> under the rdlock, a lock that the block driver itself doesn't mess with.
> It makes me wonder whether there is any point in annotating the
> BlockDriver function pointers? It would be simpler if the block drivers
> were unaware of the graph lock.

If you're unaware of the graph lock, how do you tell if you can call
certain block layer functions that require the lock?

Especially since different BlockDriver callbacks have different rules
(some have a reader lock, some have a writer lock, and some may stay
unlocked even in the future), it would seem really hard to keep track of
this when you don't make it explicit.

Kevin

--7wNJEcDXCALcuGgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmP3UoIACgkQfwmycsiP
L9Yc9RAAujJkk9yNZnSsatnnu3FduEyK+4sB5ibW3p2DJurAldzL8xsB2tKgzI86
C2GugGn9udU5TsVSwyOehEHptXZBVIJrrMs/gBk5gkjIFdd70D73Xir0heiI6ZvD
vH6Lm4dMMeB24RtrkDMvqJoX5TwtcHllav2OWiOOJI5FzBH37xwBGbpiZgaUBfoO
X5hj9ILuNJN41u7KpBHwfXqaHTg0KxDXxOYo55WKYwEtGXx68gJ0FKydoBp4egfD
j7oTTFIGzugIIhVWBa3B3+f1XCtjhdx0dOhQ17TnJJwohPhFyOs/BI0q3x1O6hfj
KhP1SWDWE8pwlGB/r3I2ZR3ERA8Z2Xz2OsCPT+VUU11zQp3uZDjA7YARUHcFHHf9
xCfz3SeBqwFjX87njWrlAAh9Gn+hBck/Yhl1iEylVsXBaAwZBUO/l8C7m2IAbZ5T
zuVd/mVNtgg/A+6pM+4Y3n30qo9e9vZHF/Voia7K0RPYtP7zuhHfB951kDzIpy9a
55c6EEU71DYw4p8Co6kIc0OUtxRSYzR5f+24ypSd5iS+BOnwkn75G95zhjy9r/G/
9A08t89WSYcBri7l45hzn1WT8dcdhWnvonSJYEV2oI5IF4nRKX6NQYh995+6URWJ
+CjALkGdM5m0HQfkzdICqzJdko9GMVgyV3du8yx4DzE6wftWsZw=
=zf5q
-----END PGP SIGNATURE-----

--7wNJEcDXCALcuGgt--


