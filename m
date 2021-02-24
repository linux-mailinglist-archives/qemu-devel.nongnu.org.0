Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34173240EE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:51:50 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwS5-00017f-QG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwPh-0007qJ-UN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwPg-0007mK-CX
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614181759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REm61OJC2WmOt3PwcpBFIVwO9sZhrSyPrD4Qv2aVybo=;
 b=TUEaqG+lWhMpf/CHxkblR7Je6XHmFySdl4jUE8dgcBeLH4ySsn6fqQSHUnoaIMYTPE4y+D
 3YsnNTnB2l1TchDxdvh27mVRvQHidK1l5G8eJvuDeLzTXK9iQRPYrJhmqLj/7+k94nvmIK
 FqlK2+/5pF6eRVUSW23+YUJqaXmrBvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-BwcGuutqPRmTVvJ1jHbEWg-1; Wed, 24 Feb 2021 10:49:13 -0500
X-MC-Unique: BwcGuutqPRmTVvJ1jHbEWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1245A113DCB1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 15:31:14 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7044360C6F;
 Wed, 24 Feb 2021 15:31:13 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:31:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 1/3] tests/qtest/vhost-user-test: use share=on with memfd
Message-ID: <YDZxQBA4sTCPE5r6@stefanha-x1.localdomain>
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-2-stefanha@redhat.com>
 <CAMxuvazaCQ+WN6-rkhydEHmV7o4MrUzU7YBV4i1ZYodedV4aLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvazaCQ+WN6-rkhydEHmV7o4MrUzU7YBV4i1ZYodedV4aLw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3dhJQLM7MzqgIpXR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3dhJQLM7MzqgIpXR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 02:22:31PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Mon, Feb 22, 2021 at 8:11 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>=20
> > For some reason memfd never used share=3Don. vhost-user relies on
> > mmap(MAP_SHARED) so this seems like a problem, but the tests still run
> > without it.
> >
> >
> Simply because it's on by default with memory-backend-memfd (it wouldn't
> make much sense to use memfd in the first place without share)

Thanks for solving this mystery!

Please update the commit description with this information when merging
(or I'll update it when respinning).

Stefan

--3dhJQLM7MzqgIpXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2cUAACgkQnKSrs4Gr
c8jSmggAyb8CjazNtKxh1u7mnkCX8gOl5F1VzUkmL9xtkvpIIYsdEnKb4t0CwWpC
rHGfLrxQaFpPEfk2u1jUlq/1OmE5328E05vIR6F2NEDxLUk4WXr34TdoJk1n043E
mrD8kVgz3xD1ZU/KNaFbhtAhNR8N3RdeXJ2063NjT8PuHNWm0kG/Lj3poUHgazoc
8WnMx8ykZIt2sxFsNQ8snCifz7e15Fqu8jexlmWjkVs22Yn/W6sajGA9BpfmDHUe
jf5C67urJSw4wZV+PrnCWir3shpn0OJQ4vWQWy1IfBDSz65oNPWNu8oSIweabuv7
653n1WB14Nx4UoMrR2drhGwjRevfng==
=QmHM
-----END PGP SIGNATURE-----

--3dhJQLM7MzqgIpXR--


