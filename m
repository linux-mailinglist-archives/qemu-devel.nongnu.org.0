Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D934FDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:14:01 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXrM-0002J2-D6
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXqF-0001s0-Fp
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXqE-0005Bf-1L
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617185569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CvyQ5dn8D6yx1pZgbTbEYNEyMjWGx0Ga/Dfwr4kX8eY=;
 b=TnLklLp1oHMTDOG+6vXXQwFw3xm8JvJkqxjwX31FsCyoKf3vcz/Y+GTUfQzbQGayZPKI14
 YrGLWmbX6qmZoo6RfFfgqD4D8jeHXKnOpUQzwdcjuISFun/CeBL2MF/ap7+TfFG39fN4NV
 wWM6NrphVHWvnFxEM96jTaHDHpvsnkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Q_xyA6vfP3y3jfuwyjRvJQ-1; Wed, 31 Mar 2021 06:12:45 -0400
X-MC-Unique: Q_xyA6vfP3y3jfuwyjRvJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D015F6B9C5
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 10:12:44 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D74119C44;
 Wed, 31 Mar 2021 10:12:34 +0000 (UTC)
Date: Wed, 31 Mar 2021 11:12:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 16/24] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Message-ID: <YGRLERYNqhZrsWiK@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-17-dgilbert@redhat.com>
 <20210211141734.GQ247031@stefanha-x1.localdomain>
 <YFEOP+zJF4ciZ3ap@work-vm>
MIME-Version: 1.0
In-Reply-To: <YFEOP+zJF4ciZ3ap@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bDzkdXzQdU6j8nqA"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bDzkdXzQdU6j8nqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 07:59:59PM +0000, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Tue, Feb 09, 2021 at 07:02:16PM +0000, Dr. David Alan Gilbert (git) =
wrote:
> > > +            if (!mrs_size) {
> > > +                error_report("No guest region found for 0x%" HWADDR_=
PRIx, gpa);
> > > +                res =3D -EFAULT;
> > > +                break;
> > > +            }
> > > +
> > > +            trace_vhost_user_fs_slave_io_loop(mrs.mr->name,
> > > +                                          (uint64_t)mrs.offset_withi=
n_region,
> > > +                                          memory_region_is_ram(mrs.m=
r),
> > > +                                          memory_region_is_romd(mrs.=
mr),
> > > +                                          (size_t)mrs_size);
> > > +
> > > +            void *hostptr =3D qemu_map_ram_ptr(mrs.mr->ram_block,
> > > +                                             mrs.offset_within_regio=
n);
> > > +            ssize_t transferred;
> > > +            if (sm->flags[i] & VHOST_USER_FS_FLAG_MAP_R) {
> >=20
> > The flag name is specific to map requests but it's shared with the IO
> > request. Perhaps rename the flags?
>=20
> They're both read/write's; do you have a preferred alternative?

VHOST_USER_FS_FLAG_<what it does> (read? readwrite? etc)

Stefan

--bDzkdXzQdU6j8nqA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBkSxEACgkQnKSrs4Gr
c8jfDAf+L4BV1nKhkV3QM9yHyn2ypD2dql7Qt780o5QMbd7zpNHdMifVuOcNA6LH
f3lqPQ6+NnQXjsOjiJNgkJ4Yd/AW1nNi4YitlYtDpf7p62fwGZjfUc/FJwvo0gih
vb1qEoskPLWChQuh6SGGL/pFV+B8vCKsSlXI7pKoRLuz/96ezJXOEAKSYK3M5/yh
mYSfGz7r5bLNM7rn6zRsINziPhCYxeISR+dh9qSL4vDGxFmywxdQ+aWHZyKTzWtn
03nUiG7ah40uRudsA7ewn3gdqXJg0GdZPhTg2qA5w/jJyoUW+zlIQ6yugumN+C2n
JPKb2Xg3/c916R0C6F4IvWnAKYVK7g==
=Ny5n
-----END PGP SIGNATURE-----

--bDzkdXzQdU6j8nqA--


