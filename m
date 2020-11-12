Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684A2B0AF2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:07:25 +0100 (CET)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdG4B-0000PJ-M7
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kdG1f-0007L1-Q3
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:04:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kdG1c-0006YC-VT
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605200683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W1WTw0Dbjyf+Qd4YTQPG0SqHQQTKxwK5uNxGqK5czic=;
 b=VLsBN+ZDq/WMP0nlJV3SJht1FJfU2ThbdMiCHEFk2u2Ycv7Bbz06pitHX9buj0LEijaWt2
 ZBAqW/zkKBj3VSqVmcwxoVJVNci8V6TYgdF/YrgNw9wW54N5TdB8dCe0W133mdwReHk71H
 8T8M8z/MwP8mP1N452rxQgmXXvE1zM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-7hpy0rhzP8izLJsqLqcuNQ-1; Thu, 12 Nov 2020 12:04:41 -0500
X-MC-Unique: 7hpy0rhzP8izLJsqLqcuNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5495518B9EDF;
 Thu, 12 Nov 2020 17:04:40 +0000 (UTC)
Received: from localhost (ovpn-115-122.ams2.redhat.com [10.36.115.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5E8C60C0F;
 Thu, 12 Nov 2020 17:04:36 +0000 (UTC)
Date: Thu, 12 Nov 2020 17:04:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-5.2 04/10] vhost-user-blk-test: rename
 destroy_drive() to destroy_file()
Message-ID: <20201112170435.GC1555653@stefanha-x1.localdomain>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-5-stefanha@redhat.com>
 <e3d13da4-823f-2b55-ed89-40832862d272@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e3d13da4-823f-2b55-ed89-40832862d272@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 03:32:58PM +0100, Max Reitz wrote:
> On 11.11.20 13:43, Stefan Hajnoczi wrote:
> > The function is used not just for image files but also for UNIX domain
> > sockets (QMP monitor and vhost-user-blk). Reflect that in the name.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   tests/qtest/vhost-user-blk-test.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> [...]
>=20
> > @@ -731,7 +732,7 @@ static char *start_vhost_user_blk(GString *cmd_line=
, int vus_instances,
> >           sock_path =3D g_strdup(sock_path_tempate);
> >           fd =3D mkstemp(sock_path);
> >           g_assert_cmpint(fd, >=3D, 0);
> > -        g_test_queue_destroy(drive_destroy, sock_path);
> > +        g_test_queue_destroy(drive_file, sock_path);
>=20
> s/drive_file/destroy_file/, I think :)

Oops! The following commit removes this line so I didn't notice this
issue: "vhost-user-blk-test: fix races by using fd passing".

Michael: If you want this intermediate commit fixed for bisectability I
will respin. Otherwise the patches in your tree are fine.

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+tayMACgkQnKSrs4Gr
c8i2yAf/YBEDu2mSTqy+sSfCy6zKn2fHpyccNbdDNn/BfYQD8OGPP+p2BZSyk4tM
ypV7BsMSkX8op/V/j8BEdmX+i17yw/KuMr6FVyhTLx6doRk4ajUfsJe7A/8zMbiA
xQDNiN1oRHn3OTkDy/En2gGUErdI0VD2XNQF7jwAPyIcgVrb/4YsPEfY+RA/hLIy
23BiUghTaOLuXx28slh7oZbt+ExtmGBiFMf7zUhKlU1VwErYh2RRtctdWBKu9yHj
7hEzC89cYSOTKHAAkxeBm1z1APCjWve1v2MAWPfQrnuI5TRxc8BN+5GKo4Ux7IJh
hgAL/XfsX+7O/y6a/4Ea3FQCGXLUsw==
=/2zC
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--


