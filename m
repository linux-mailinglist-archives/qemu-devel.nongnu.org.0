Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088E36C846
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:05:54 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPHb-00072m-Q4
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbPDk-00050h-N5
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbPDd-0006Iz-FW
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w2AYXJGY42N2Zys4dMIZm8PoMl/4S0gjwdfVZjVf4sM=;
 b=e+Bu6aUupchKbMfBOq3QfIOXoTS0kBYKBbxJpBmwiIHs8zDOP0nFeAE/HtvTGG2xn9yYvd
 k2t41J6yQGqsIXyuL+7D6aZKrGxSL1uwdSS+uhpbTv42U7X41rbpWRXzRXudsQ5ZFa4kwo
 1VFuZVCKMMgp72RJyDD2r8RRrx5xZOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-1A-1CMEzOTCYuih3lg9DZQ-1; Tue, 27 Apr 2021 11:01:21 -0400
X-MC-Unique: 1A-1CMEzOTCYuih3lg9DZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F451008075;
 Tue, 27 Apr 2021 15:01:18 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5D05C626;
 Tue, 27 Apr 2021 15:01:01 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:01:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YIgnLEUSqedRO9Rj@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YIbgtbUJxtuQ5PoM@stefanha-x1.localdomain>
 <MW2PR02MB37238C9134B09733779D0DB88B419@MW2PR02MB3723.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MW2PR02MB37238C9134B09733779D0DB88B419@MW2PR02MB3723.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9IzSfQn42dFlYsCD"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 John Levon <john.levon@nutanix.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9IzSfQn42dFlYsCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 12:02:44PM +0000, Thanos Makatos wrote:
>=20
>=20
> > -----Original Message-----
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> > Sent: 26 April 2021 16:48
> > To: Thanos Makatos <thanos.makatos@nutanix.com>; Peter Maydell
> > <peter.maydell@linaro.org>; Michael S. Tsirkin <mst@redhat.com>
> > Cc: qemu-devel@nongnu.org; John Levon <levon@movementarian.org>;
> > John G Johnson <john.g.johnson@oracle.com>;
> > benjamin.walker@intel.com; Elena Ufimtseva
> > <elena.ufimtseva@oracle.com>; jag.raman@oracle.com;
> > james.r.harris@intel.com; Swapnil Ingle <swapnil.ingle@nutanix.com>;
> > konrad.wilk@oracle.com; alex.williamson@redhat.com;
> > yuvalkashtan@gmail.com; tina.zhang@intel.com;
> > marcandre.lureau@redhat.com; ismael@linux.com;
> > Kanth.Ghatraju@oracle.com; Felipe Franciosi <felipe@nutanix.com>;
> > xiuchun.lu@intel.com; tomassetti.andrea@gmail.com; Raphael Norwitz
> > <raphael.norwitz@nutanix.com>; changpeng.liu@intel.com;
> > dgilbert@redhat.com; Yan Zhao <yan.y.zhao@intel.com>; Michael S . Tsirk=
in
> > <mst@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Christophe de
> > Dinechin <cdupontd@redhat.com>; Jason Wang <jasowang@redhat.com>;
> > Cornelia Huck <cohuck@redhat.com>; Kirti Wankhede
> > <kwankhede@nvidia.com>; Paolo Bonzini <pbonzini@redhat.com>;
> > mpiszczek@ddn.com; John Levon <john.levon@nutanix.com>
> > Subject: Re: [PATCH v8] introduce vfio-user protocol specification
> >=20
> > On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> > > This patch introduces the vfio-user protocol specification (formerly
> > > known as VFIO-over-socket), which is designed to allow devices to be
> > > emulated outside QEMU, in a separate process. vfio-user reuses the
> > > existing VFIO defines, structs and concepts.
> > >
> > > It has been earlier discussed as an RFC in:
> > > "RFC: use VFIO over a UNIX domain socket to implement device offloadi=
ng"
> > >
> > > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > > Signed-off-by: Thanos Makatos <thanos.makatos@nutanix.com>
> > > Signed-off-by: John Levon <john.levon@nutanix.com>
> >=20
> > No review yet but I wanted to agree on the next steps once the spec has
> > been reviewed.
> >=20
> > One or more of you would be added to ./MAINTAINERS and handle future
> > patch review and pull requests for the spec.
> >=20
> > The spec will be unstable/experimental at least until QEMU vfio-user
> > implementation has landed. Otherwise it's hard to know whether the
> > protocol really works.
> >=20
> > Does this sound good?
>=20
> Yes, of course.

Great, hope to hear from Michael and Peter too.

I will review the spec on Monday.

Stefan

--9IzSfQn42dFlYsCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCIJywACgkQnKSrs4Gr
c8jrAgf8CAFK1g4zq/2KOubAwd4Qv2/lHoPceZjEGxks5qQUin6yTlRy500YVZsE
RVd0AgkCZSsHCB2N62Uc0HzQDppbAEhl27UjQd2fFb872yVQznFtH9m1JQ5BOSvb
lvFzODK7drenVM93LJzN3tlpoMV8Qz/vs/cgY72eC0CGM7pgF6y2qDeuOQ9NYOFo
XV1FBwLhjJyibOSegmMmXJpdBU2IDiX6jY/jm+9oHt9n+AyI2TUpFPOQoYInmtgP
ITAKt6vS+4hDiIgP4uxj+ZVwG1aj/egezvUsd0tIgXxqbvYz7jI1yQY5sMlVyXxm
K/gu2bgtGtZ6BQo7+iyBrh/7GSaYkQ==
=ynka
-----END PGP SIGNATURE-----

--9IzSfQn42dFlYsCD--


