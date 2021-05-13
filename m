Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321B37F8E2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:37:18 +0200 (CEST)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBWf-0005Nl-KQ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhBUa-0004Yh-U9
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhBUZ-00039K-7R
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620912905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9pwUTDp5WuTx/9lO9tocmgfvRVI/8OVTHMdUuvvyhGk=;
 b=arAO6fao5b/hIQP1N2iC/BOp4W3aPbv2n8iYFMY4Lf1rlVmgxSI1qoN/AvEMpMqVcZUIBY
 f0VEoKmnT+F8jdyadCuLr7pR6FTFzyIH+g0r0oxpHMDcx6k7NlWKHDhzFkszzU2aCXF23Z
 +VyBTDSdLGGAm/VZfDt9vRCJBlSOkno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-Qux1RE7qPTKWAgRUH9uo8Q-1; Thu, 13 May 2021 09:35:01 -0400
X-MC-Unique: Qux1RE7qPTKWAgRUH9uo8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFDCA8049CB;
 Thu, 13 May 2021 13:35:00 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF4016268E;
 Thu, 13 May 2021 13:34:53 +0000 (UTC)
Date: Thu, 13 May 2021 14:34:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Subject: Re: [vhost-user] Expectations around reconnection
Message-ID: <YJ0q/N5JlStNl20a@stefanha-x1.localdomain>
References: <BY5PR11MB44014FC44FFAC6976FC89BC1EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
 <6eded3ad-ea69-3d07-65ee-01d4ac7cf067@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6eded3ad-ea69-3d07-65ee-01d4ac7cf067@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aQi8dvtt75hiAre3"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aQi8dvtt75hiAre3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 11:43:25AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing few developers
>=20
> On 5/11/21 3:33 PM, Boeuf, Sebastien wrote:
> > Hi All,
> >=20
> > In the context of vhost-user, I was wondering how a reconnection should
> > be handled from the VMM perspective?
> >=20
> > In particular, I'm looking at the OVS-DPDK use case using the client=20
> > mode (meaning QEMU acts as the server), and I'd like to understand what=
=20
> > QEMU does to handle this. Upon disconnection from the backend, does QEM=
U
> >  reset the virtio device (meaning the guest
> > is notified about it)? And upon the new connection from the backend,=20
> > does QEMU go through the whole vhost-user initialization once again=20
> > (feature acknowledgement, setup of vrings, etc...), or does it simply=
=20
> > assume the backend will have saved all these information?

I started a virtio-fs-specific email thread about vhost-user
reconnection here after your IRC messages the other day:
https://listman.redhat.com/archives/virtio-fs/2021-May/msg00105.html

The VMM does not reset the device. In general vhost-user reconnection is
transparent to the guest. While the device is disconnected the
virtqueues are not processed.

Upon reconnection the vhost-user protocol traffic is almost identical to
a fresh connection. The VMM negotiates features, send memory regions,
etc.

The device backend needs to persist device-specific state. This is why
reconnection and crash recovery are device-specific (and to some extent
implementation-specific because not every device may support it or
implement it in the same way). Stateless devices are easiest to support.

vhost-user-net and vhost-user-blk are the only devices I'm aware of that
support reconnection today.

Expect to encounter bugs. Reconnection is underspecified and leaves a
lot to the vhost-user implementation. There might also be design flaws
around synchronous VIRTIO transport hardware registers where either the
vCPU hangs because it needs a response from the disconnected device or
the VMM ignores the disconnected device in order to avoid hanging the
vCPU thread but the state is out of sync upon reconnection. It's hard to
test all possible states so I doubt it's bullet-proof. It probably works
best for vhost-user-net and less well for other device types.

Stefan

--aQi8dvtt75hiAre3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCdKvwACgkQnKSrs4Gr
c8gvPgf/csk84HgIxG0rxwM5L7M208gdVwDIxNXhcIHQzcXnXoBcUyDUAdCRzbiC
auBK2+sX58XnKn/PaHqOeMLi47WINrfX3y1hwxPNRsHw/k5fp7eNxZ4vwREMpDE4
I6bk9ycGi37/cjaBmUvIyoZ09yZGAt7LiefZnLi0mOSWxlpI7k8BiCrWNmjvX3Hy
THlhm9Etb2vgQUHyRqVCVFx0pztMgX8TI9vM7WJbEHD0Pk1gqQO03Nf7dsbf010t
tCIU/Oq7G6EinFtRjJV53+s2rcxfHT2WwNzDmewVdmtBZqnwm0Z6dvxZtw/3Ej1r
0MMo4lJM2avNTYzN2s6RuE5L7utjDg==
=nU8J
-----END PGP SIGNATURE-----

--aQi8dvtt75hiAre3--


