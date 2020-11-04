Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C6E2A6A6E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:51:11 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaM06-0001vC-9z
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kaLpj-0001rA-Ii
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kaLph-0001qk-Md
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604508024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFaDDE5G3QsxQBe0+0kEr6deIw5hdHxGgXVQJu9MKXw=;
 b=DawCmOn0PXLlibuaZUgNH+WFvlrWscxUvRGs+8Dhmu7qfwRRV/0/G7gWVYwIF+PFyStU0C
 J9cILcypr4P0KdB9GY4tVlRWKukZwUzk71/Fn5WR0nedRj/K6n10c04ikCDao2puOvMMBr
 TDVZD0Bb9ILxQFkSeEyCps5iQWX0cAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-nK2cQ0LQP6-9vs_N0hx6YQ-1; Wed, 04 Nov 2020 11:40:20 -0500
X-MC-Unique: nK2cQ0LQP6-9vs_N0hx6YQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B35195CC4A;
 Wed,  4 Nov 2020 16:40:19 +0000 (UTC)
Received: from localhost (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA8915DA76;
 Wed,  4 Nov 2020 16:40:11 +0000 (UTC)
Date: Wed, 4 Nov 2020 16:40:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: VFIO Migration
Message-ID: <20201104164010.GB425016@stefanha-x1.localdomain>
References: <20201102111153.GC42093@stefanha-x1.localdomain>
 <20201102132844.332f680c.cohuck@redhat.com>
 <20201102145626.GA186617@stefanha-x1.localdomain>
 <20201104080745.qvpofinyni2wprq2@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201104080745.qvpofinyni2wprq2@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 09:07:45AM +0100, Gerd Hoffmann wrote:
> > > > The hardware interface together with the device state representatio=
n is called
> > > > a *device model*. Device models can be assigned URIs such as
> > > > https://qemu.org/devices/e1000e to uniquely identify them.
> > >=20
> > > Is that something that needs to be put together for every device wher=
e we
> > > want to support migration? How do you create the URI?
> >=20
> > Yes. If you are creating a custom device that no one else needs to
> > emulate then you can simply pick a unique URL:
> >=20
> >   https://vendor.com/my-dev
> >=20
> > There doesn't need to be anything at the URL. It's just a unique string
> > that no one else will use and therefore web URLs are handy because no
> > one else will accidentally pick your string.
>=20
> If this is just a string I think it would be better to use the reverse
> domain name scheme (as used by virtio-serial too), i.e.
>=20
>  - org.qemu.devices.e1000e
>  - com.vendor.my-dev

This is the Java syntax. Go uses gitlab.com/my-user/foo and I think it's
nicer but I think I'm bikeshedding.

Is there any particular reason why you prefer the reverse domain name
approach?

Stefan

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+i2WkACgkQnKSrs4Gr
c8jlGgf+MaDelGxEnAYF6kroqJlgqytv+0+Ru4H8MdEDyZ8N2/mlReX0IZxtnSIa
WibUV/Bhf2JWtVru9xws9juds3pqzDmJ+0SNllPP+vjQ+w87wPrmUsgStAUplnnb
aEeq/F8ioXDR953jzk3TSxWXa0UOXx5QeUpfaZnAS9iD6VatKNXhI1n6h10HCVMN
e5+KjNMFLxzbd2/CpyXYXhvjqgzYdIaRCzpfdt/tO1UsUYPpo9QoNoWxleoVHSTr
7A0xd7w0SxmTB8MkLC5mmjMgvKjMFkou613wWI5ZqkvXBksporYKu0rj1T1EVQG0
8Iy3T5kBBQcX4GFIkcNnobxBVl2NjA==
=rNq5
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--


