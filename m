Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6E2CD847
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:58:21 +0100 (CET)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkp7k-00034s-7I
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkp6z-0002bJ-BQ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkp6x-00051c-VU
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607003850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zCUzmhjjSQvjWyQy5gZCzYoSo2gYAaPlH8fAeS2iIqs=;
 b=AAiM+oCVpUmZBrk4RUoAnrDBPth2SKJ/bD1jfntNPMR0CPH7kNhx32+byNPhUE5g+jE88N
 cGhwy3URCLAsqWo0lmd4VQqD3QCPfhXAR0nRcxexBfW6yYD7DwdE60Gsjme4QD0O8cc1uy
 aQRqGsEhynReqdAiTDgMZt3V9Brsi4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-Eu7Tj4sQMK2qImfpYslc_Q-1; Thu, 03 Dec 2020 08:57:27 -0500
X-MC-Unique: Eu7Tj4sQMK2qImfpYslc_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D10718C8C06;
 Thu,  3 Dec 2020 13:57:26 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6542110023B3;
 Thu,  3 Dec 2020 13:57:22 +0000 (UTC)
Date: Thu, 3 Dec 2020 13:57:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH for-5.2 05/10] vhost-user-blk-test: close fork child file
 descriptors
Message-ID: <20201203135721.GA878699@stefanha-x1.localdomain>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-6-stefanha@redhat.com>
 <20201124120826.cgz2oiexopucatbt@Rk>
MIME-Version: 1.0
In-Reply-To: <20201124120826.cgz2oiexopucatbt@Rk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 08:08:26PM +0800, Coiby Xu wrote:
> Hi Stefan,
>=20
> On Wed, Nov 11, 2020 at 12:43:26PM +0000, Stefan Hajnoczi wrote:
> > Do not leave stdin and stdout open after fork. stdout is the
> > tap-driver.pl pipe. If we keep the pipe open then tap-driver.pl will no=
t
> > detect that qos-test has terminated and it will hang.
>=20
> I wonder under which situation this would happen. I couldn't re-produce
> this issue locally.

Try adding g_assert_not_reached() to one of the tests so the qos-test
process aborts. Then tap-driver.pl will hang because the pipe hasn't
been closed and "make check" never completes.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/I7sEACgkQnKSrs4Gr
c8hYRAgArykawKiycKWWTbwnd9qNjPGswv19wt5S09gilnKHlIRzZYqROMPfzNAf
AhMZsbvMa1TXo/hVo79gADzh0qEJKgS2kkV92jKWmnpjYPgNkZ8+hqKitBUTboh+
DTvZfFUhp+ZPq7vcnmjCDru05KQg/VhXEMbuojQFjMWnBhM3v+dY5++nBJDLLUYC
BNTZVgL1YhIub9Fepdp7k7Q9hN05vPGddNf0NOnB1g6lDpEVeZn1hUbdNwaBTFvr
WaU4xt/cb0GutMBA/dZdr2IDoxExN6/bMASfcpjReDhqcIHZMpwRYVcOKqiYCJwU
gSC9EccQwGYVd6/JTx/+9vF960oN4Q==
=RlaI
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


