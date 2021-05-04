Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A17372C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:30:58 +0200 (CEST)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw4f-0005uS-Ff
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldw2s-00055A-0M
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldw2n-0000wL-Rg
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620138541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uwRYgiUOircZKd6MDaHCe9AHunH4mtIXAUDZll6DHjU=;
 b=UoCCVC/oTrFQCv5VzQBIBj9J5ZH8JZ6WRqQgmwFJiIM01NllC0dFQ0GvQ7miEaQf1IJFmC
 +Eg8Rgsvp4snGWubnnCB3ePYqmLlQtQmFeRmagk/Xqx11P6errlymX+/6SLdANP9epaxu6
 9kwq+tcWRd1LEPBAfkp6YEV8FVJBzVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-tK27bWu9M_yCpt83uda8bw-1; Tue, 04 May 2021 10:28:59 -0400
X-MC-Unique: tK27bWu9M_yCpt83uda8bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F17A5801817;
 Tue,  4 May 2021 14:28:57 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2F1B5D9D5;
 Tue,  4 May 2021 14:28:50 +0000 (UTC)
Date: Tue, 4 May 2021 15:28:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <YJFaITqqHaDTQDVn@stefanha-x1.localdomain>
References: <20210429155221.1226561-1-stefanha@redhat.com>
 <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nQhmgPCngL/7jJAt"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nQhmgPCngL/7jJAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 02:03:52PM -0400, Eduardo Habkost wrote:
> On Thu, Apr 29, 2021 at 04:52:21PM +0100, Stefan Hajnoczi wrote:
> > The scsi=3Don|off property was deprecated in QEMU 5.0 and can be remove=
d
> > completely at this point.
> >=20
> > Drop the scsi=3Don|off option. It was only available on Legacy virtio-b=
lk
> > devices. Linux v5.6 already dropped support for it.
> >=20
> > Remove the hw_compat_2_4[] property assignment since scsi=3Don|off no
> > longer exists. Old guests with Legacy virtio-blk devices no longer see
> > the SCSI host features bit.
> >=20
>=20
> This means pc-2.4 will now break guest ABI if using virtio-blk
> devices, correct?

Yes.

However, this feature was only enabled on Linux hosts, so cross-host OS
migration was always broken and no one noticed. Maybe that configuration
is too niche and QEMU never supported cross-host OS migration, but it
still means that the "pc-2.4" ABI was never solid to begin with :).

>=20
> > Live migrating old guests from an old QEMU with the SCSI feature bit
> > enabled will fail with "Features 0x... unsupported. Allowed features:
> > 0x...". We've followed the QEMU deprecation policy so users have been
> > warned...
> >=20
>=20
> Were they really warned, though?  People running
> "-machine pc-i440fx-2.4" might be completely unaware that it was
> silently enabling a deprecated feature.
>=20
> Can we have this documented in a more explicit way?  Maybe just a
> comment at hw_compat_2_4 would be enough, to warn people doing
> backports and rebases downstream.
>=20
> Can we make QEMU refuse to start if using pc-2.4 + virtio-blk
> together, just to be sure?
>=20
> An alternative would be keeping the property (and the
> hw_compat_2_4 entry) just to keep pc-2.4 working (until pc-2.4 is
> deprecated and removed), but refusing to realize the device if
> the feature is enabled.

Yes, the least invasive approach is to leave the property in place but
refuse to realize the virtio-blk device when scsi=3Don. The cost is more
cruft, including a useless scsi=3Doff command-line option that will
continue to show up in libvirt-generated QEMU command-lines.

The cautious approach makes sense to me and I'll send a new revision.

Stefan

--nQhmgPCngL/7jJAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRWiEACgkQnKSrs4Gr
c8jCjAf+PNF2dJCvDznYk1b7YhiNPqqLz1i8hyhNG2l78hKDrvvzSTvDbMtQ4lXu
5zFL2Incm8IuTqp0VNts2VzvSqk1O/tlPNdFEj3GDJ/UFQ2mToCCYXtB91eIZANJ
8ky6LrNa1ptxZ7jYYt8fC1OzWoM2k2JVhOrbDBVx9wdYkc8fj7jjeNeUb0vIcmUi
CINm2XWv7ALCFWI86K5NuKxfSu/AQB2JRVNrYuJirb0giVmgxlZUt9EOT/3HMAyE
QHhu+h2HUeZrOQQsi1P6woJ5L8l8LLCHr4A8Srk+AymLn2/e2/Qa7mZEYOVtxf0R
MpS3Bc0nlCkzZQYb57/ZCxXT5EtEwA==
=X/54
-----END PGP SIGNATURE-----

--nQhmgPCngL/7jJAt--


