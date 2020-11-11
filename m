Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99B2AF491
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:16:39 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrrS-00046k-57
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcrq1-0003Gi-VH
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcrq0-000275-2j
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605107707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12v23ob0HVA+N2O56TwSRMKF+CZmbtYO2zjVxnV2VGU=;
 b=GstSSDk/dDz8ozSFpiVumW434HyokQZL4mgH0c/nMSehJR9C6Y65yXyqpcAVpMHlcInwPr
 +M2sp67n+GSjsuxVXAvvjucLO/ilpB9pYPglfifR4mtmhJgFV0Z5Ng1JSNCO3HU24uehsh
 uHrv2VqsiEX0x79jmGVksi/zz9BxjFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Ec16nO-OP2OHLKe_tUxUyA-1; Wed, 11 Nov 2020 10:15:03 -0500
X-MC-Unique: Ec16nO-OP2OHLKe_tUxUyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A89B010924A3;
 Wed, 11 Nov 2020 15:15:01 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C77A5DA6A;
 Wed, 11 Nov 2020 15:14:50 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:14:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111151449.GC1421166@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111124853.5a7fa359.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111124853.5a7fa359.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 12:48:53PM +0100, Cornelia Huck wrote:
> On Tue, 10 Nov 2020 13:14:04 -0700
> Alex Williamson <alex.williamson@redhat.com> wrote:
> > On Tue, 10 Nov 2020 09:53:49 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > > Device models supported by an mdev driver and their details can be re=
ad from
> > > the migration_info.json attr. Each mdev type supports one device mode=
l. If a
> > > parent device supports multiple device models then each device model =
has an
> > > mdev type. There may be multiple mdev types for a single device model=
 when they
> > > offer different migration parameters such as resource capacity or fea=
ture
> > > availability.
> > >=20
> > > For example, a graphics card that supports 4 GB and 8 GB device insta=
nces would
> > > provide gfx-4GB and gfx-8GB mdev types with memory=3D4096 and memory=
=3D8192
> > > migration parameters, respectively. =20
> >=20
> >=20
> > I think this example could be expanded for clarity.  I think this is
> > suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> > implement some common device model, ie. com.gfx/GPU, where the
> > migration parameter 'memory' for each defaults to a value matching the
> > type name.  But it seems like this can also lead to some combinatorial
> > challenges for management tools if these parameters are writable.  For
> > example, should a management tool create a gfx-4GB device and change to
> > memory parameter to 8192 or a gfx-8GB device with the default parameter=
?
>=20
> I would expect that the mdev types need to match in the first place.
> What role would the memory=3D parameter play, then? Allowing gfx-4GB to
> have memory=3D8192 feels wrong to me.

Yes, I expected these mdev types to only accept a fixed "memory" value,
but there's nothing stopping a driver author from making "memory" accept
any value.

> > > An open mdev device typically does not allow migration parameters to =
be changed
> > > at runtime. However, certain migration/params attrs may allow writes =
at
> > > runtime. Usually these migration parameters only affect the device st=
ate
> > > representation and not the hardware interface. This makes it possible=
 to
> > > upgrade or downgrade the device state representation at runtime so th=
at
> > > migration is possible to newer or older device implementations. =20
>=20
> This refers to generation of device implementations, but not to dynamic
> configuration changes. Maybe I'm just confused by this sentence, but
> how are we supposed to get changes while the mdev is live across?

This is about dynamic configuration changes. For example, if a field was
forgotten in the device state representation then a migration parameter
can be added to enable the fix. When the parameter is off the device
state is incomplete but migration to old device implementations still
works. An old device can be migrated to a new device implementation with
the parameter turned off. And then you can safely enable the migration
parameter at runtime without powering off the guest because it's purely
a device state representation change, not a hardware interface change
that would disturb the guest.

This is kind of similar to QEMU migration subsections.

Stefan

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+r/+kACgkQnKSrs4Gr
c8ja/Qf/XouIyF2oSB+w9IS264VqFjmPG/DImvdiJFJPBfpuTC6xURjVlsWXuYVc
fMzhLPWZj9SgmyN9RjAGm1qNS434xK0EPyhxevGHprtCUgnRi7kKvVgFsdD0h7RA
T4oBK8R3mQOi6KEPHUTggpyRwaTQ/w3NSdsjSyHQvScKwHBWpLgeU3OQBTclhT77
K9IKQhXAs2v5XG1WpLWietTPDUuNd3NQ+AFOdCOIigaWrEs5KE5hq757zPpUybMw
QHBXsl4XWdA49AEaCgDXpRaODy0QWytuvCqfRb/7qF5cCabZHlzvPtc3h34fwt8f
G7yKZpD4NfKH/iIrjyFbzrWzlWBcRQ==
=JX1u
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--


