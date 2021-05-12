Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219337C218
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:05:31 +0200 (CEST)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqQT-0006G0-MS
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgqOV-00057x-KG
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:03:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgqON-0007ry-Tz
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620831796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWsnmtsjq+WixnhUDmzail433uy0pSIVOKnc6cKKpEw=;
 b=HvcBev4ExrbNDy+YnyrLQu0WzC3ZauutB8EyMRX2JI78bt/TrFV7X30CNf1YXqzk34R5C0
 KJtvjCk8L3aYse4wjMC/EP3jgM7/jLEnK+ufEGjeVdG6wAJ4ZMGbXhCQKi+3Zuj378Lq3I
 +FRXWzco3MoT8+z5AgPxLPV+0EKGvac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-4HAgy76QP0GLgNhufxHhAA-1; Wed, 12 May 2021 11:03:14 -0400
X-MC-Unique: 4HAgy76QP0GLgNhufxHhAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0447DC7425;
 Wed, 12 May 2021 15:02:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-75.ams2.redhat.com [10.36.114.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 510BB63634;
 Wed, 12 May 2021 15:02:33 +0000 (UTC)
Date: Wed, 12 May 2021 17:02:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/3] vhost-user-blk-test: add tests for the
 vhost-user-blk server
Message-ID: <YJvuCPIBzcj1mJ7D@merkur.fritz.box>
References: <20210322092327.150720-1-stefanha@redhat.com>
 <YJo/Db3oifY5e6os@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJo/Db3oifY5e6os@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h6F0QzRu8n9Qh37x"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--h6F0QzRu8n9Qh37x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 11.05.2021 um 10:23 hat Stefan Hajnoczi geschrieben:
> On Mon, Mar 22, 2021 at 09:23:24AM +0000, Stefan Hajnoczi wrote:
> > These patches add a qtest for the vhost-user-blk server. CI found sever=
al
> > issues that caused these patches to be dropped from Michael Tsirkin and=
 Kevin
> > Wolf's pull requests in the past. Hopefully they will go in smoothly th=
is time!
> >=20
> > Coiby Xu (1):
> >   test: new qTest case to test the vhost-user-blk-server
> >=20
> > Stefan Hajnoczi (2):
> >   tests/qtest: add multi-queue test case to vhost-user-blk-test
> >   vhost-user-blk-test: test discard/write zeroes invalid inputs
> >=20
> >  MAINTAINERS                         |   2 +
> >  tests/qtest/libqos/vhost-user-blk.h |  48 ++
> >  tests/qtest/libqos/vhost-user-blk.c | 130 ++++
> >  tests/qtest/vhost-user-blk-test.c   | 989 ++++++++++++++++++++++++++++
> >  tests/qtest/libqos/meson.build      |   1 +
> >  tests/qtest/meson.build             |   4 +
> >  6 files changed, 1174 insertions(+)
> >  create mode 100644 tests/qtest/libqos/vhost-user-blk.h
> >  create mode 100644 tests/qtest/libqos/vhost-user-blk.c
> >  create mode 100644 tests/qtest/vhost-user-blk-test.c
>=20
> Ping for QEMU 6.1

Thanks, applied to the block branch.

Kevin

--h6F0QzRu8n9Qh37x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCb7gcACgkQfwmycsiP
L9ZJ5g/4sxtDDzqmNz98sKtiw/rOfQpwQTRtvEvo19njrPLOy9gwiCWtew7AQRKv
0QWG6j01iBI/reWzl05Ro2pi2ZCE6NFHSFKQpNiDhRz7e14osEquNUHITBSj/0Gx
IZUIQTKj4135NCdbChgctGP0njpWvhmC5RRTD6l6Jsc5gdJ3tzaKPfhpDLjqY7CK
qrLJmkEE6AOxNiO32uOBEOh4JxVWBSiRxAZRT7ic6qsmjhF7QdiDytLM2BOSybym
61O+Jeiq4uH8Njy0chnUeTJ1MDqnE4ekBS5OsRjmVVTU+ae9pDHFVBB7W4ujewIT
9+jqft1pEXtfifBS95MgYS7pQbIqk+b90Wi69yzpq7Sgf9CcJzgnICoR00HDQkXR
8qkAGsxMUQfodbPw+gh85gQsIFoeyn/G3/v9F4gKwbUwPXf73IMSUy3Ls8+WuT0H
xMHqc3dq5dZHAD5x6Mh+q1nF1NP4qWc6uVbJntFyUJEk2nu1CXVtTKzSKnysORTY
8+WY7nEeI+I8aEAicKU9+lmoFN0lzyjEuppkVrEc/cI248bfW0kA2DTLTYpwYDD/
dQ6fxCHlMw2QKx0ST/IRsS1ibA84iNTQHLOIXlsfJR53+X9KQL7G6oj8cvympAr+
FLHqbHwv1E6qub98enlbJJVJ9HydYhf1zhnQ1u/XToeozvKLlw==
=sBkl
-----END PGP SIGNATURE-----

--h6F0QzRu8n9Qh37x--


