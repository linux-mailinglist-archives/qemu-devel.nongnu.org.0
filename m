Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DC6A08DE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB2I-0001cT-DK; Thu, 23 Feb 2023 07:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pVB0D-0005qx-EA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:47:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pVAzv-0005Af-Jj
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677156414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0Z3cmpE0ylLAmYkTYxDwLozuFbUp5t4n17CybMDh4o=;
 b=gx+G8Jzj2cvUdgJUTBAh0qygEYi8m4K0ZA3MxP5S6kTZm9lnWVljAvKtVe38SeUqsuzc2j
 n0sWhKm7H8UP7TScVraOjSJEux/NWE6m4s6GtxJzrwmbFeQYgH81xI5UGOxNtVFPzKILuT
 mykJ+vbsoSM0p5num+g6LwIqTxzlP6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-alGVWHBsM72W3u6Dr3PBpA-1; Thu, 23 Feb 2023 07:46:52 -0500
X-MC-Unique: alGVWHBsM72W3u6Dr3PBpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E5A85A588;
 Thu, 23 Feb 2023 12:46:52 +0000 (UTC)
Received: from localhost (unknown [10.39.195.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DED72166B29;
 Thu, 23 Feb 2023 12:46:51 +0000 (UTC)
Date: Thu, 23 Feb 2023 07:46:48 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 00/23] block: Lock the graph, part 2 (BlockDriver
 callbacks)
Message-ID: <Y/dgOHl4tRgyKXzK@fedora>
References: <20230203152202.49054-1-kwolf@redhat.com> <Y/VCFcYsqMmEF0zc@fedora>
 <Y/dSgm564nCLaAjx@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AZ1NnsILUZGI3SEX"
Content-Disposition: inline
In-Reply-To: <Y/dSgm564nCLaAjx@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--AZ1NnsILUZGI3SEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 12:48:18PM +0100, Kevin Wolf wrote:
> Am 21.02.2023 um 23:13 hat Stefan Hajnoczi geschrieben:
> > On Fri, Feb 03, 2023 at 04:21:39PM +0100, Kevin Wolf wrote:
> > > After introducing the graph lock in a previous series, this series
> > > actually starts making widespread use of it.
> > >=20
> > > Most of the BlockDriver callbacks access the children list in some wa=
y,
> > > so you need to hold the graph lock to call them. The patches in this
> > > series add the corresponding GRAPH_RDLOCK annotations and take the lo=
ck
> > > in places where it doesn't happen yet - all of the bdrv_*() co_wrappe=
rs
> > > are already covered, but in particular BlockBackend coroutine_fns sti=
ll
> > > need it.
> > >=20
> > > There is no particularly good reason why exactly these patches and not
> > > others are included in the series. I couldn't find a self-contained p=
art
> > > that could reasonable be addressed in a single series. So these just
> > > happen to be patches that are somewhat related (centered around the
> > > BlockDriver callback theme), are ready and their number looks
> > > manageable. You will still see some FIXMEs at the end of the series
> > > that will only be addressed in future patches.
> >=20
> > Two things occurred to me:
> >=20
> > 1. The graph lock is becoming the new AioContext lock in the sense that
> > code using the block layer APIs needs to carefully acquire and release
> > the lock around operations. Why is it necessary to explicitly take the
> > rdlock in mirror_iteration()?
> >=20
> >   + WITH_GRAPH_RDLOCK_GUARD() {
> >         ret =3D bdrv_block_status_above(source, NULL, offset,
> >=20
> > I guess because bdrv_*() APIs are unlocked? The equivalent blk_*() API
> > would have taken the graph lock internally. Do we want to continue using
> > bdrv APIs even though it spreads graph locking concerns into block jobs?
>=20
> The thing that makes it a bit ugly is that block jobs mix bdrv_*() and
> blk_*() calls. If they only used blk_*() we wouldn't have to take care
> of locking (but that means that the job code itself must not have a
> problem with a changing graph!). If they only used bdrv_*(), the
> function could just take a lock at the start and only temporarily
> release it around pause points. Both ways would look nicer than what we
> have now.
>=20
> > 2. This series touches block drivers like qcow2. Luckily block drivers
> > just need to annotate their BlockDriver functions to indicate they run
> > under the rdlock, a lock that the block driver itself doesn't mess with.
> > It makes me wonder whether there is any point in annotating the
> > BlockDriver function pointers? It would be simpler if the block drivers
> > were unaware of the graph lock.
>=20
> If you're unaware of the graph lock, how do you tell if you can call
> certain block layer functions that require the lock?
>=20
> Especially since different BlockDriver callbacks have different rules
> (some have a reader lock, some have a writer lock, and some may stay
> unlocked even in the future), it would seem really hard to keep track of
> this when you don't make it explicit.

Hi Kevin,
Can you give an example of where it is necessary (not accidental
complexity) to expose an unlocked API and put the responsibility of
locking on the caller?

Thanks,
Stefan

--AZ1NnsILUZGI3SEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP3YDgACgkQnKSrs4Gr
c8jJywf+Mg8as3t0cDfWuUq2/HzlpyhO2ky6Ft3Vvg78duk/bDHkAM2RCpixOpXZ
sMl99VIaq0HGqd289XP3FuvEkTI+oPkyQi6SFoUKh9Kzfu29AYos1DSPXVSA43VM
0xyizZK+547aZzxpPSxxxYo1rjwzq4Z3+E/U/vePQdz/XeSRxaCZwvdF3ScjEQcy
mq7olC3o4u+uHpmkJJqwdmis52c5tIEOzZsNd61kSD2IdxpKCWVD3YN0GEzBggjj
MgUEe73h9YublGFkMZ/G2u+F8gor3WT4IWe7T/9Da+kvd4ewf2S9jDwPdZtiM2+g
WnjUl8oqZypftWtQ0FkBwNg0UnAGpA==
=prAh
-----END PGP SIGNATURE-----

--AZ1NnsILUZGI3SEX--


