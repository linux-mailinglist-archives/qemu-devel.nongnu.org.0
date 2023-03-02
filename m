Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1E6A81EC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhkd-0004WE-Du; Thu, 02 Mar 2023 07:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXhkY-0004Vm-97
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXhjs-0007Xo-0F
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677758927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zYlH+hIiB4rpEx0aI7Jl43K417fIUls6bh2grm6pmnY=;
 b=Tl4Bou+tURgyPytNtw10mBoP84V6Y9qvy9Zms/+uwyWsuF/K1vvxXBIHL2xYGeJiyE0dSN
 jx5JkZy+ssjyZZSO0zGjm0EnRSpFlFYJaRaC1iMiOp4oRHU10M3GaRYJ4h8fEhS8PTEbsL
 CgjIvr+xSiHzlGupFoUjG3yHTK2ilCs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-zd8RQRQ2Pp2eE56cxYUSzQ-1; Thu, 02 Mar 2023 07:08:45 -0500
X-MC-Unique: zd8RQRQ2Pp2eE56cxYUSzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0B0629AA2D1;
 Thu,  2 Mar 2023 12:08:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 252BAC16900;
 Thu,  2 Mar 2023 12:08:43 +0000 (UTC)
Date: Thu, 2 Mar 2023 07:08:42 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <20230302120842.GB2480875@fedora>
References: <Y/9zkDAS4odz93GM@fedora> <877cw0ctpr.fsf@linaro.org>
 <Y/+LdfF0rL3wEqfd@fedora>
 <20230302081907.pwt4nvz5buyt2dz3@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R8x4bQWlTQ/fknb6"
Content-Disposition: inline
In-Reply-To: <20230302081907.pwt4nvz5buyt2dz3@vireshk-i7>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--R8x4bQWlTQ/fknb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2023 at 01:49:07PM +0530, Viresh Kumar wrote:
> On 01-03-23, 12:29, Stefan Hajnoczi wrote:
> > What is the advantage over defining separate messages? Separate messages
> > are cleaner and more typesafe.
>=20
> I thought we wanted to keep single message for one kind of functionality,=
 which
> is mmap related quirks here. And so it would be better if we can reuse th=
e same
> for next hypervisor which may need this.
>=20
> The value parameter is not fixed and is hypervisor specific, for Xen this=
 is the
> domain id, for others it may mean something else.

mmap-related quirks have no parameters or behavior in common so there's
no advantage in sharing a single vhost-user protocol message. Sharing
the same message just makes it awkward to build and parse the message.

> > I don't have a concrete example, but was thinking of a guest that shares
> > memory with other guests (like the experimental virtio-vhost-user
> > device). Maybe there would be a scenario where some memory belongs to
> > one domain and some belongs to another (but has been mapped into the
> > first domain), and the vhost-user back-end needs to access both.
>=20
> These look tricky (and real) and I am not sure how we would want to handle
> these. Maybe wait until we have a real use-case ?

A way to deal with that is to include mmap information every time fds
are passed with a message instead of sending one global message at the
start of the vhost-user connection. This would allow each mmap to
associate extra information instead of forcing them all to use the same
information.

> > The other thing that comes to mind is that the spec must clearly state
> > which mmaps are affected by the Xen domain information. For example,
> > just mem table memory regions and not the
> > VHOST_USER_PROTOCOL_F_LOG_SHMFD feature?
>=20
> Maybe we can mention that only the mmap's performed via /dev/xen/privcmd =
and
> /dev/xen/gntdev files are affected by this ?

No, this doesn't explain when mmap must be performed via
/dev/xen/privcmd and /dev/xen/gntdev. The spec should be explicit about
this instead of assuming that the device implementer already knows this.

Stefan

--R8x4bQWlTQ/fknb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQAkcoACgkQnKSrs4Gr
c8iQbgf7BYwOXalaOt9tawNBuNNxLm51ZzyWrR5YxkBDb7Ko5Ja0ft7PtgNn876L
a4Ike7lWdQM1O+glxxDybaubjNLbx5rl6H86QR5jkn1HaMUGDNnePPWMwi6jj+1M
MrXoTPbTaSlzFIZSnTSYDcg9qEYan2cSK4J9ol40Isv9wHA7xLxD9kKmfEMNqiLY
9wnUkNbvd9E7C6ODp7R3UZlCy/XHGt0xFEAATzSGKRj9K47TM0Fj208dYIrNOtiO
XYc4hdGsEC4QXqNEDmhbH15uTbn8QHr4aiA8v7gn9Tzv3ux81adOpdf/i5dfSnzr
HnK2yy7RDHS1+5bXCGQdLYyed8Wufg==
=NjUt
-----END PGP SIGNATURE-----

--R8x4bQWlTQ/fknb6--


