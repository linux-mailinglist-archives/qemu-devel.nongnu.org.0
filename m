Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD32AF500
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:37:35 +0100 (CET)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsBi-0000ed-Lq
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcs9v-00083E-UZ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:35:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcs9u-0001CU-9G
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605108941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcPJh23pI0lYWiDb4vprzSXiNbdU/OLxMGTbaGuKWu0=;
 b=NDi6FmGeo6dXkm47NFS2ML3OcsBXT96mBh796RMEoxKycd1zNGJdsdFZ5x6SL8hu8gXJTI
 db69BeqYHlRrurhX6BDZ+bgbAfqbGxT2gTvlb523cAsmOytbZm9Zib0mkBKI3DmQiajm7J
 XlwwgkPskmBn27AQOT3JjaHZVZ7WAQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-z3HskqxtPvWv-FVJE_xY1Q-1; Wed, 11 Nov 2020 10:35:39 -0500
X-MC-Unique: z3HskqxtPvWv-FVJE_xY1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 754F3AC86A;
 Wed, 11 Nov 2020 15:35:22 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9994C5B4A7;
 Wed, 11 Nov 2020 15:35:12 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:35:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111153511.GE1421166@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201111121918.53e3b2fc.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111121918.53e3b2fc.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 12:19:18PM +0100, Cornelia Huck wrote:
> On Tue, 10 Nov 2020 09:53:49 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> (...)
>=20
> > The meaning of the migration parameter and its possible values are spec=
ific to
> > the device, but values are based on one of the following types:
> > * bool - booleans (on/off)
> > * int - integers (0, 1, 2, ...)
> > * str - character strings
> >=20
> > Migration parameters are represented as <name>=3D<value> in this docume=
nt.
> > Examples include my-feature=3Don and num-queues=3D4.
> >=20
> > When a new migration parameter is introduced, its absence must have the=
 same
> > effect as before the migration parameter was introduced. For example, i=
f
> > my-feature=3Don|off is added to control the availability of a new devic=
e feature,
> > then my-feature=3Doff is equivalent to omitting the migration parameter=
.
>=20
> Maybe this could be made more clear by using a non-bool parameter as
> an example?
>=20
> For the num-queues parameter used as an example above, if num-queues=3D2
> would lead to the same effect as before, omitting the num-queues
> parameter must be treated as if num-queues had been specified as 2.

Will fix, thanks!

Stefan

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+sBK8ACgkQnKSrs4Gr
c8h/IggAhQxFS0TCAa+Dl1t6+E9uCHszFw7p8JBtpdekOLToQ68TL/2pY1uGhLRh
a0GzDoZ8QRwVRmRV67JKR/NVgtQJT6zNNapv2KckfZpzyYPfFYDuw8xFMWtciYwL
m9WnKo/2Ttm+CCyuFFrkc/SpsCikO5SvIAiRCuk9dAA/W2hzaCYeNt+4+Lde0u7i
cmBa+9m6KdYuA5PgrbzfwlBaDBmQmw+NO/wanYRDuzjEJvujMSM5gjIX5AvUMDu9
Q/YWUx4XqSk5Nh/QdbaBvrpGtduJpnqaayQBaMmc0z1Ki527vxJqD6OraWuOg4oq
gnv1TmUNfR8v0Crba1KU4ZcgAFgoBQ==
=Gd1r
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--


