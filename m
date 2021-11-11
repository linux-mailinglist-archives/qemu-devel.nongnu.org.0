Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E344D3FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:23:22 +0100 (CET)
Received: from localhost ([::1]:44976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6Ij-00064g-6T
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ml6Hv-0005Q0-UQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ml6Hs-0004BN-VP
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636622547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uwAIAwf0iA6RLFJXR4Baq3tbG9Z2/cBKn46MptD3VlI=;
 b=E8Al/YdmW6bEy/Hx2EXehEEeEu6RbkXy0ANsOgVEuAPGJnxL2ggAHaXua1nNtrzgjJjSnw
 TVpWsAwx6wOBrq+rD2FX3YQfdnhOlVvzQc7u6WRzWLqwOG5+CiSFltwNk993R3/+fdk1OQ
 mPBns5EPQI5Bqoz22GPgjlOw2Yv4HU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-J8zFI-Q1OMuuYUsR_ns37A-1; Thu, 11 Nov 2021 04:22:21 -0500
X-MC-Unique: J8zFI-Q1OMuuYUsR_ns37A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBE5287D541;
 Thu, 11 Nov 2021 09:22:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F37C5DEFA;
 Thu, 11 Nov 2021 09:21:42 +0000 (UTC)
Date: Thu, 11 Nov 2021 09:21:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
Message-ID: <YYzgpa8rkaywN8pW@stefanha-x1.localdomain>
References: <20211104164827.21911-1-lulu@redhat.com>
 <YYkBkGdlpeer18e9@stefanha-x1.localdomain>
 <00d446c0-b5a0-9477-4e63-fc4b768a6f92@redhat.com>
MIME-Version: 1.0
In-Reply-To: <00d446c0-b5a0-9477-4e63-fc4b768a6f92@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lF5siBtgZRh1sYxE"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, mst@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, arei.gonglei@huawei.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lF5siBtgZRh1sYxE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 12:41:02PM +0800, Jason Wang wrote:
>=20
> =E5=9C=A8 2021/11/8 =E4=B8=8B=E5=8D=886:53, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
> > > these patches add the support for configure interrupt
> > >=20
> > > These codes are all tested in vp-vdpa (support configure interrupt)
> > > vdpa_sim (not support configure interrupt), virtio tap device
> > >=20
> > > test in virtio-pci bus and virtio-mmio bus
> > Hi,
> > vhost-user has a configuration space change notification but it uses a
> > slave channel message (VHOST_USER_SLAVE_CONFIG_CHANGE_MSG) instead of a=
n
> > eventfd. Ideally the vhost kernel ioctl and vhost-user interfaces would
> > follow the same design.
> >=20
> > I'm concerned "common" vhost code is going to end up with lots of
> > callbacks that are not available uniformly across vhost kernel, vdpa,
> > and vhost-user. That makes it hard to understand and debug vhost, plus
> > differences make it harder to to correctly extend these interfaces in
> > the future.
> >=20
> > Is the decision to a new eventfd-based interface instead of
> > vhost_chr_read/write() deliberate?
>=20
>=20
> I think this is a good question. Here're some reasons for using eventfd f=
rom
> the kernel perspective:
>=20
> 1) the eventfd is used for relaying interrupts for vqs, so we choose to u=
se
> that for the config interrupt
> 2) make it possible to be used for irq bypassing (posted interrupt)

Interesting point. Posted interrupts aren't supported by vhost-user's
slave channel message. Since configuration change notifications are rare
it's probably not a performance problem, but still.

This makes me think vhost-user's approach is sub-optimal, it should have
been an eventfd :(. Maybe the idea was that a slave message is less
complex than adding an additional interface to set a configuration
change notification eventfd.

Let's not worry about it too much. I guess in the long run vhost-user
can be rebased on top of the vDPA kernel interface (I wrote about that
here:
https://blog.vmsplice.net/2020/09/on-unifying-vhost-user-and-virtio.html).

Stefan

--lF5siBtgZRh1sYxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGM4KUACgkQnKSrs4Gr
c8jYugf/RPP1RZlP5UTqdD2KZz0JONo8k4R6sdo6h2OlqOTIkDqRJEC9Ak8QVDqP
RwXv+KV8MEoOlJZB1lQEvBHe/tf4Y0jlhB8RvbUEIv1PAscS7J/HdHhXTRyqUPM2
3ARicmvXG1mOmqW2dK5KELUSUc7MybF8Ps/yC6YY0MGe+5hidJVsyCCNqJ0bz8xu
2YGUlffKVyHn+0sAWxDdY8vEMsZTJE5DKdgpv4PWDmn9o/F7slCiWLd7bC5urxlc
D7oHgojonb14T0SqL+zK12lWvP67ogQO4lAdOphs9bZdp9KoAeqPyaOAsgE3ulk2
kwL3HHySX5gwGJj9IdBrAP5B7Af8jQ==
=sNDL
-----END PGP SIGNATURE-----

--lF5siBtgZRh1sYxE--


