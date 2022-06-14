Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CD54B655
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:39:33 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19Zk-0002iJ-Aj
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o19QW-0004CY-Nz
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o19QV-00081d-4c
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655224198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=McoDb/w28CSFjuSD5TXpYn3oG0GcvgVSX4wYtLjAFjI=;
 b=XxWad/fqRNuM2lOEXsKyevPBYYq9DJ5SDKp2l3H6rSE1VdRwL7GSa2xwiF5fQf/oTk7Cz3
 rLpm7LYN1NetNomUm7emhZbwfsqixpXaSfGvZPgxRm+IMbQLHJjhFL09jcqbbtNimRPYnf
 nAxBuCOFPCzGInzA+Zzg2Bbnr0PMFyk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-H7jsu-6gOJmpMWBltyiNhg-1; Tue, 14 Jun 2022 12:29:54 -0400
X-MC-Unique: H7jsu-6gOJmpMWBltyiNhg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58701299E755;
 Tue, 14 Jun 2022 16:29:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20A5416164;
 Tue, 14 Jun 2022 16:29:53 +0000 (UTC)
Date: Tue, 14 Jun 2022 17:29:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-stable@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 0/2] linux-aio: fix unbalanced plugged counter in
 laio_io_unplug()
Message-ID: <Yqi3gMu8pHuhqxXz@stefanha-x1.localdomain>
References: <20220609164712.1539045-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uJUoLb3eEhTfmPyS"
Content-Disposition: inline
In-Reply-To: <20220609164712.1539045-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--uJUoLb3eEhTfmPyS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 05:47:10PM +0100, Stefan Hajnoczi wrote:
> An unlucky I/O pattern can result in stalled Linux AIO requests when the
> plugged counter becomes unbalanced. See Patch 1 for details.
>=20
> Patch 2 adds a comment to explain why the laio_io_unplug() even checks max
> batch in the first place.
>=20
> Stefan Hajnoczi (2):
>   linux-aio: fix unbalanced plugged counter in laio_io_unplug()
>   linux-aio: explain why max batch is checked in laio_io_unplug()
>=20
>  block/linux-aio.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.36.1
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--uJUoLb3eEhTfmPyS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKot4AACgkQnKSrs4Gr
c8i7Wgf9Hq2Y5lY+FyYkF+YvGMyhyPnBfOlzj9Ag8rKDnpljNnqzcxtDnal3MHY5
q9JlD+IHUgBxwJRjzQaP3Qb/0K9GEKfhXo9JOt2GNakNbqUcZy3ulcp9MhcsPjhW
e+GGQg6SuNqe3x4CIYb8oSv2uw7+PMs9Z9d2EVBQm/njtkmc+W2tbJ4z6nD+JLvE
4srkG/STn7PMWqE5w1qwYo5ho1JeIIzefO/Tafrv4LUC5d0YXp7hKNftfwvG20Fp
4dgrqlgI7ZwLUiA1LJfW3nXZnGMx50FDQ0yjdCZxD0BGpSpNtLEC1UgZUjsGpNDO
zqeJO0vwVtbcvMRmqlE1ebuTnaD4Nw==
=mu9s
-----END PGP SIGNATURE-----

--uJUoLb3eEhTfmPyS--


