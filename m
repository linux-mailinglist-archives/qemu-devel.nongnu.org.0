Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D172B4920
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:25:51 +0100 (CET)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegO6-0003Cf-4v
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kegMz-0002iC-Ty
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kegMw-0000Mv-1B
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605540275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxcFvr4eCCoH8oqHXqxzAReiKw8qAo6AfIboaC2V5vc=;
 b=db8VBYtx8Azt1gmUDROQSUeww2mCgsTFwk07DuS9cM7ebn/SPRROFQoZp/b3TywUaE2wYV
 G9lBHI2dcC0ScVUD26FN5UtJxld4WwK6rmedu7ITrGBsxab2RhdnsYxI/6W6yf0j41AZyL
 cVWIW0P96dlTIDdkNDHbueXj8g/79jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-fP_4iHl0PjWvdCqnnbx5_g-1; Mon, 16 Nov 2020 10:24:33 -0500
X-MC-Unique: fP_4iHl0PjWvdCqnnbx5_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703331891E82;
 Mon, 16 Nov 2020 15:24:31 +0000 (UTC)
Received: from localhost (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 733BF1002D5D;
 Mon, 16 Nov 2020 15:24:19 +0000 (UTC)
Date: Mon, 16 Nov 2020 15:24:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116152418.GG96297@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <MW2PR02MB372398B3CD4B91201A9D84558BE80@MW2PR02MB3723.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MW2PR02MB372398B3CD4B91201A9D84558BE80@MW2PR02MB3723.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
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
 Kevin" <kevin.tian@intel.com>, "mtsirkin@redhat.com" <mtsirkin@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "quintela@redhat.com" <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Zeng, Xin" <xin.zeng@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Levon <levon@movementarian.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 04:18:34PM +0000, Thanos Makatos wrote:
>=20
> > VFIO Migration
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > This document describes how to ensure migration compatibility for VFIO
> > devices,
> > including mdev and vfio-user devices.
>=20
> Is this something all VFIO/user devices will have to support? If it's not
> mandatory, how can a device advertise support?

The --print-migration-info-json command-line option described below must
be implemented by the vfio-user device emulation program. Similarly,
VFIO/mdev devices must provide the migration/ sysfs group.

If the device implementation does not expose these standard interfaces
then management tools can still attempt to migrate them, but there is no
migration compatibility check or algorithm for setting up the
destination device. In other words, it will only succeed with some luck
or by hardcoding knowledge of the specific device implementation into
the management tool.

>=20
> > Multiple device implementations can support the same device model. Doin=
g
> > so
> > means that the device implementations can offer migration compatiblity
> > because
> > they support the same hardware interface, device state representation, =
and
> > migration parameters.
>=20
> Does the above mean that a passthrough function can be migrated to a vfio=
-user
> program and vice versa? If so, then it's worth mentioning.

Yes, if they are migration compatible (they support the same device
model and migration parameters) then migration is possible. I'll make
this clear in the next revision.

Note VFIO migration is currently only working for mdev devices. Alex
Williamson mentioned that it could be extended to core VFIO PCI devices
(without mdev) in the future.

> > More complex device emulation programs may host multiple devices. The
> > interface
> > for configuring these device emulation programs is not standardized.
> > Therefore,
> > migrating these devices is beyond the scope of this document.
>=20
> Most likely a device emulation program hosting multile devices would allo=
w
> some form of communication for control purposes (e.g. SPDK implements a J=
SON-RPC
> server). So maybe it's possible to define interacting with such programs =
in
> this document?

Yes, it's definitely possible. There needs to be agreement on the RPC
mechanism. QEMU implements QMP, SPDK has something similar but
different, gRPC/Protobuf is popular, and D-Bus is another alternative. I
asked about RPC mechanisms on the muser Slack instance to see if there
was consensus but it seems to be a bit early for that.

Perhaps the most realistic option will be to define bindings to several
RPC mechanisms. That way everyone can use their preferred RPC mechanism,
at the cost of requiring management tools to support more than one
(which some already do, e.g. libvirt uses XDR itself but also implements
QEMU's QMP).

> >=20
> > The migration information JSON is printed to standard output by a vfio-=
user
> > device emulation program as follows:
> >=20
> > .. code:: bash
> >=20
> >   $ my-device --print-migration-info-json
> >=20
> > The device is instantiated by launching the destination process with th=
e
> > migration parameter list from the source:
>=20
> Must 'my-device --print-migration-info-json' always generate the same mig=
ration
> information JSON? If so, then what if the output generated by
> 'my-device --print-migration-info-json' depends on additional arguments p=
assed
> to 'my-device' when it was originally started?

Yes, it needs to be stable in the sense that you can invoke the program
with --print-migration-info-json and then expect launching the program
to succeed with migration parameters that are valid according to the
JSON.

Running the same device emulation binary on different hosts can produce
different JSON. This is because the binary may rely on host hardware
resources or features (e.g. does this host have GPUs available?).

It gets trickier when considering host reboots. I think the JSON can
change between reboots. However, the management tools may cache the JSON
so there needs to be a rule about when to refresh it.

Regarding additional command-line arguments, they can affect the JSON
output. For example, they could include the connection details to an
iSCSI LUN and affect the block size migration parameter. This leads to
the same issue - can they be cached by the management tool? The answer
is the same - stability is needed in the short-term to avoid unexpected
failures when launching the program, but over the longer term we should
allow JSON changes.

Thanks for raising these points. I'll add details to the next revision.

Stefan

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ymaIACgkQnKSrs4Gr
c8hNYgf7BIWlvQRbSQkVtG9khTkyG91zvIkJEHDED7cJ8tl2uIjRjM370coyUzMx
u7n7pJ+fW/clW5Nj5fTvi2gvTvsxijFL0jEf1x5Kae3/JmEYoh5DM+qi4Rp2DkTc
440NMomKHOI6BbfzttIE6tfddrSaGRIT7fHvdeqkj5+Yij65Pm+EqcxDINJtSdwq
tPQLLBuOo8Cad3v4ByrbJB+/9BZeKOD13hrvI43JkNTJkJb2Zf+vOplyqT0iHobV
J9LFzaA/Lc06XBEFIhBxvufBsn0t+N6uqJsh/l6eD5NCOCxMiMa5Yg3kh8TASUne
xRQH+i4CpZSBlcnPhmKYSv3lUuvsOA==
=p7qA
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--


