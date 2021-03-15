Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133A33C019
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:37:26 +0100 (CET)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpHZ-0002xW-Ds
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLpF2-0001vX-1d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLpF0-0004cj-Ew
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615822485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ppC3onZpFfHDviRrrH9ITbQzmn+VPVaEKj8mnHlcSMU=;
 b=FCBT9rBRQVc9sLJBzmhgJiUROleVexxXRdrzgUgIyRb1SF1vPlr1Unc0oi4AwYsY5TqyHR
 8tN7nj8U/1QBefsWXCUdjyWFMt0UcoqvF3lCFVjJWAsW3TWvbIwd9kwhGUHgBc9WSTAn0p
 awuwLg4jo8OCJQ0KFFUYmJua6+9k4ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-WCPy_vOHNHKD3qUFiESdFQ-1; Mon, 15 Mar 2021 11:34:43 -0400
X-MC-Unique: WCPy_vOHNHKD3qUFiESdFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 681791932480
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:34:42 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C0C9100239A;
 Mon, 15 Mar 2021 15:34:34 +0000 (UTC)
Date: Mon, 15 Mar 2021 15:34:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] tests/qtest/vhost-user-test: use share=on with memfd
Message-ID: <YE9+iuidTRIVOq3M@stefanha-x1.localdomain>
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-2-stefanha@redhat.com>
 <ed164725-4437-ca63-42f7-aecee0b71de8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ed164725-4437-ca63-42f7-aecee0b71de8@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vyk2vTbnh/1GK7uS"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Vyk2vTbnh/1GK7uS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 07:31:25AM +0100, Thomas Huth wrote:
> On 22/02/2021 17.10, Stefan Hajnoczi wrote:
> > For some reason memfd never used share=3Don. vhost-user relies on
> > mmap(MAP_SHARED) so this seems like a problem, but the tests still run
> > without it.
> >=20
> > Add share=3Don for consistency and to prevent future bugs in the test.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   tests/qtest/vhost-user-test.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-tes=
t.c
> > index 1a5f5313ff..2db98c4920 100644
> > --- a/tests/qtest/vhost-user-test.c
> > +++ b/tests/qtest/vhost-user-test.c
> > @@ -40,7 +40,7 @@
> >   #define QEMU_CMD_MEM    " -m %d -object memory-backend-file,id=3Dmem,=
size=3D%dM," \
> >                           "mem-path=3D%s,share=3Don -numa node,memdev=
=3Dmem"
> >   #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=3Dmem=
,size=3D%dM," \
> > -                        " -numa node,memdev=3Dmem"
> > +                        "share=3Don -numa node,memdev=3Dmem"
>=20
> Even if it's not required, it seems to be a good clean up, also with rega=
rds
> to the lonely comma at the end of the previous line.
>=20
> Acked-by: Thomas Huth <thuth@redhat.com>
>=20
> I assume this will go through the vhost tree, or do you want me to take t=
his
> single patch through my qtest tree?

I think this entire series will go through the vhost tree.

Thanks,
Stefan

--Vyk2vTbnh/1GK7uS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPfokACgkQnKSrs4Gr
c8iyqQgAvOp4TyiNSbk8AePM3wbDla2b+54VSaQbna3ZXwmN/i41WjHlA63e9Omb
OSc0MA8wZDRm/Nk3zC29QRpRcRl/D+4ujI8c4u9qV7X18Gv3I/jDJhWDqSrAiZRK
bv2vzenWApOV1DVbMd3H73CB+RdwkT2aBmdY2zYQD0KzHo2/AjrmtF+u6neYyr0k
Ku6w/dGSWFKE8X5jt5SF+OBlXns+MKHH5zytuEKi3bf1fSwUfyHat7KrYzk4BEZi
CyFeoXOL3iCNp6bUkiCQYxdybKUjB0RfuV9FIL5QcM+YKf/sb9hSODu8C7L+Vfem
EkHSkCwZFnpfT4O7FQiiut9sCOiDrg==
=z088
-----END PGP SIGNATURE-----

--Vyk2vTbnh/1GK7uS--


