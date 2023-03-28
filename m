Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7BC6CC9EA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 20:12:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDmZ-000819-Cv; Tue, 28 Mar 2023 14:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1phDmR-00080i-Jd
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1phDmQ-0003wG-0w
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680027045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dowhO9LAGfI18CFNW8jliboYJAmvLw/Vz+1s0bjJJCA=;
 b=RQj5/MzeOXWCNaQuJK71fEca6Bb2HF2mzTBiLPA98/8X16xOEwK+Y8LhELqLAxmNK4/qZV
 JeVslTcu6ZN+WXLCLfZdq+kocc1BW0nIYjD5VyM2Qjp4WefxE6oBqLA0w0ee4/LQ5gqp4Z
 OU+w7FUT4NM7osWvGwDTby9SUogpGT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-DAEJ0_pRNeG_nJZE9_9rKg-1; Tue, 28 Mar 2023 14:10:38 -0400
X-MC-Unique: DAEJ0_pRNeG_nJZE9_9rKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86DB7802D32;
 Tue, 28 Mar 2023 18:10:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A03D1121330;
 Tue, 28 Mar 2023 18:10:37 +0000 (UTC)
Date: Tue, 28 Mar 2023 14:10:36 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: "Woodhouse, David" <dwmw@amazon.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: Re: aio_set_event_notifier(is_external=true) in Xen code?
Message-ID: <20230328181036.GA1636312@fedora>
References: <20230328155050.GA1632689@fedora>
 <1c064dc2c005455a88025f985a9bf66b@amazon.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="94TeDdcn0jQUmJE9"
Content-Disposition: inline
In-Reply-To: <1c064dc2c005455a88025f985a9bf66b@amazon.co.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--94TeDdcn0jQUmJE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 04:36:29PM +0000, Durrant, Paul wrote:
> > -----Original Message-----
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> > Sent: 28 March 2023 16:51
> > To: Woodhouse, David <dwmw@amazon.co.uk>; Durrant, Paul
> > <pdurrant@amazon.co.uk>
> > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org
> > Subject: [EXTERNAL] aio_set_event_notifier(is_external=3Dtrue) in Xen c=
ode?
> >=20
> > Hi,
> > I'm removing the aio_disable_external() API from QEMU and noticed that
> > Xen code calls aio_set_fd_handler(is_external=3Dtrue) in hw/xen/xen-bus=
=2Ec
> > and hw/i386/kvm/xen_xenstore.c.
> >=20
> > It wasn't clear to me whether is_external=3Dtrue is necessary here.
> > is_external=3Dtrue is mainly used to temporarily pause I/O submission in
> > the QEMU block layer. Maybe is_external=3Dtrue was chosen out of caution
> > but actually has no effect in this code.
> >=20
> > Does the Xen code rely on is_external=3Dtrue?
>=20
>=20
> That's a good question. The call in xen-bus.c has been there since commit=
 83361a8a1f932, which was when it substituted the old call to qemu_set_fd_h=
andler(). I suspect this was out of caution (or possibly misunderstanding) =
at the time, although setting the call to xen_device_set_event_channel_cont=
ext() in xen_block_dataplane_stop() does suggest it may be happening while =
I/O could be in progress so it could have been in response to problems caug=
ht in testing.
> I suspect the code in xen_xenstore.c just copied what xen-bus.c did.
>=20
> Sorry I can't give you a definitive answer... it's all rather a long time=
 ago.

Thanks, that helped! I'll study hw/block/dataplane/xen-block.c and make
sure it has a safe alternative to is_external=3Dtrue.

I think is_external=3Dfalse is safe for xen_xenstore.c.

Stefan

--94TeDdcn0jQUmJE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQjLZwACgkQnKSrs4Gr
c8j7Owf+PQmJHMwpyAyz+ctQtFC8QiTA2njCFdVjmiYPqQw7MKugKc61cfxiXTJB
sWsJr3qKInYZqWn4bZZa6HKVMETgiC6N24I+DGWzt/H852sU9Q8zMalZt46lmJYu
wBA9+zJ2biCFJlj/KbXePXMR4qeMXhOb8qEU5S3yTWu4y3u7IBEK/uT62ZSuclEX
3a1wnsAoedRYgzDXqVMBJqEji1F3U5Csqx7gSVpeqbyOrUxnvMuS5dA+OMKr+lZw
vvUHtG/VUyP7sPT9JrvH5SUIsLi3jlPXKGaK1u0OD2lG+jTestim413f/qOJauHV
qwndqTT8owYPIOhmRuu58cSZ6wVR8A==
=On4Z
-----END PGP SIGNATURE-----

--94TeDdcn0jQUmJE9--


