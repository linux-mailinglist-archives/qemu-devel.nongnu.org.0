Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8921731D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 17:58:18 +0200 (CEST)
Received: from localhost ([::1]:47964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jspz7-0006kp-Ft
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 11:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jspxl-0005Ly-CF
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:56:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51169
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jspxj-0004V2-RB
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594137409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8V0/QkE5IkUNx5pE+I/4MUeN1q+8fIdkpgbsEBeEu48=;
 b=XFpxWKctBDjasWp2S+pIXbB1yXq+/8DhFAzWuSnfUWqgmrySzN6GyJIIg7pDyWyIQ71xPA
 MEUEPX1xB0bdiXB331xYI3oK16JD4wAyuXhHu33eM7Sbo8pU+qaDf20l80Ay3C9DzQRXdD
 xz7eIctQVj6a1jANT4H5RikBMxu0jZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-gB8wflvpM9iRU8ojAmPsFw-1; Tue, 07 Jul 2020 11:56:45 -0400
X-MC-Unique: gB8wflvpM9iRU8ojAmPsFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E7D710059C6;
 Tue,  7 Jul 2020 15:56:44 +0000 (UTC)
Received: from localhost (ovpn-113-68.ams2.redhat.com [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5014660CC0;
 Tue,  7 Jul 2020 15:56:42 +0000 (UTC)
Date: Tue, 7 Jul 2020 16:56:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/5] block/io: introduce bdrv_try_mark_request_serialising
Message-ID: <20200707155640.GA459887@stefanha-x1.localdomain>
References: <20200620143649.225852-1-vsementsov@virtuozzo.com>
 <20200620143649.225852-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200620143649.225852-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:31:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Anton.Nefedov@acronis.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2020 at 05:36:45PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Introduce a function to mark the request serialising only if there are
> no conflicting request to wait for.
>=20
> The function is static, so mark it unused. The attribute is to be
> dropped in the next commit.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 7 deletions(-)

I found this patch difficult to understand because there are multiple
levels of functions passing flags to ultimiately do different things in
a common function.

Here are some ideas if you have time to rework this patch:

1. Introduce a bdrv_find_overlapping_request() function that does most
   of bdrv_wait_serialising_requests_locked() but does not wait. Then
   bdrv_wait_serialising_requests_locked() can call that function in a
   loop and wait if an overlapping request is found.

2. Pass overlap_offset/overlap_bytes arguments to
   bdrv_find_overlapping_request() instead of changing and restoring the
   value in bdrv_do_mark_request_serialising().

3. Use consistent names for flags: wait/blocking, found/success

I'm not sure if all these ideas will work, but I get the feeling this
code can be refactored to make it easier to understand. Since I don't
have a concrete suggestion and the code looks correct:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8EmzgACgkQnKSrs4Gr
c8iVtQf/ThpLqNuWennPVWPeyG+9wi5hNsqVDD7fN2Qc99HC2IjNLRoH1HXghZM3
jB3uLbdHds7UDwfRqzQRxMqM3ic3JydSQm2iwmQSxqZzC/eDO7bh8b7p3794DPPD
wmLDcxS5wqTRnPueAGk0ENJKloRu0r/AqrLf2PPJ4nlVljXquBL+AqkJq1okSuwr
HWoO6upRG/MKB52bwX8pp8gPDAoyrmhh/x7QLAeGpkGJq5/OJBe6sHwS/AvXLDSi
cDXvinExxUhlRbtC6DB2td5eXO7V+IRzZdSUNbnXKIQ6qHt68oNeGS4qJsh5lkW+
tpVYlY21KqILWPKJJQPBziqbiteW6g==
=sEYa
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--


