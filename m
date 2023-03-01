Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9366A7215
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQGr-00033r-B3; Wed, 01 Mar 2023 12:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXQGm-00033g-UG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:29:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXQGk-0004xQ-Pl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677691774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNUtwYSzrma9QPDi9kyv0SaiYSEO9P+i9joIVnBked8=;
 b=VzN0Vo150PEQQcxXe/CwyHCDviPuel1ypvlZ8ACTyiGASJdGsXO9xrdzeownlZqhupBExu
 8Rg5btVj33geW6kM1AqoGjT7giUUHmUM8WykxQI+U2T28js+Ya+CTIaIy4cmofA5kK51Kf
 DGyv7tyhviKJ64nSZ1irOlEh1cOX53c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-AmWt6nP_Mm2y_Io2Gr2Kzw-1; Wed, 01 Mar 2023 12:29:29 -0500
X-MC-Unique: AmWt6nP_Mm2y_Io2Gr2Kzw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DA843C18346;
 Wed,  1 Mar 2023 17:29:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAFD0492C14;
 Wed,  1 Mar 2023 17:29:27 +0000 (UTC)
Date: Wed, 1 Mar 2023 12:29:25 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
Message-ID: <Y/+LdfF0rL3wEqfd@fedora>
References: <Y/9zkDAS4odz93GM@fedora>
 <877cw0ctpr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ji5TbNtGJsInl60F"
Content-Disposition: inline
In-Reply-To: <877cw0ctpr.fsf@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--ji5TbNtGJsInl60F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2023 at 04:31:41PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > [[PGP Signed Part:Undecided]]
> > Resend - for some reason my email didn't make it out.
> >
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> > Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
> >  mapping support
> > To: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S.
> >  Tsirkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org=
>,
> >  Alex Benn=E9e <alex.bennee@linaro.org>,
> > 	stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
> >  <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
> >  <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
> >  Boeuf
> > 	<sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>, Math=
ieu
> >  Poirier <mathieu.poirier@linaro.org>
> > Date: Tue, 21 Feb 2023 10:17:01 -0500 (1 week, 1 day, 1 hour ago)
> > Flags: seen, signed, personal
> >
> > On Tue, Feb 21, 2023 at 03:20:41PM +0530, Viresh Kumar wrote:
> >> The current model of memory mapping at the back-end works fine with
> >> Qemu, where a standard call to mmap() for the respective file
> >> descriptor, passed from front-end, is generally all we need to do befo=
re
> >> the front-end can start accessing the guest memory.
> >>=20
> >> There are other complex cases though, where we need more information at
> >> the backend and need to do more than just an mmap() call. For example,
> >> Xen, a type-1 hypervisor, currently supports memory mapping via two
> >> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (v=
ia
> >> /dev/gntdev). In both these cases, the back-end needs to call mmap()
> >> followed by an ioctl() (or vice-versa), and need to pass extra
> >> information via the ioctl(), like the Xen domain-id of the guest whose
> >> memory we are trying to map.
> >>=20
> >> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
> >> lets the back-end know about the additional memory mapping requirement=
s.
> >> When this feature is negotiated, the front-end can send the
> >> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
> >> information to the back-end.
> >>=20
> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >> ---
> >>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
> >>  1 file changed, 32 insertions(+)
> >
> > The alternative to an in-band approach is to configure these details
> > out-of-band. For example, via command-line options to the vhost-user
> > back-end:
> >
> >   $ my-xen-device --mapping-type=3Dforeign-mapping --domain-id=3D123
> >
> > I was thinking about both approaches and don't see an obvious reason to
> > choose one or the other. What do you think?
>=20
> In-band has the nice property of being dynamic and not having to have
> some other thing construct command lines. We are also trying to keep the
> daemons from being Xen specific and keep the type of mmap as an
> implementation detail that is mostly elided by the rust-vmm memory
> traits.

Okay.

> >
> >> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> >> index 3f18ab424eb0..f2b1d705593a 100644
> >> --- a/docs/interop/vhost-user.rst
> >> +++ b/docs/interop/vhost-user.rst
> >> @@ -258,6 +258,23 @@ Inflight description
> >> =20
> >>  :queue size: a 16-bit size of virtqueues
> >> =20
> >> +Custom mmap description
> >> +^^^^^^^^^^^^^^^^^^^^^^^
> >> +
> >> ++-------+-------+
> >> +| flags | value |
> >> ++-------+-------+
> >> +
> >> +:flags: 64-bit bit field
> >> +
> >> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory =
mapping.
> >> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapp=
ing.
> >> +
> >> +:value: a 64-bit hypervisor specific value.
> >> +
> >> +- For Xen foreign or grant memory access, this is set with guest's xe=
n domain
> >> +  id.
> >
> > This is highly Xen-specific. How about naming the feature XEN_MMAP
> > instead of CUSTOM_MMAP? If someone needs to add other mmap data later,
> > they should define their own struct instead of trying to squeeze into
> > the same fields as Xen.
>=20
> We hope to support additional mmap mechanisms in the future - one
> proposal is to use the hypervisor specific interface to support an
> ioctl() that creates a domain specific device which can then be treated
> more generically.
>=20
> Could we not declare the message as flag + n bytes of domain specific
> message as defined my msglen?

What is the advantage over defining separate messages? Separate messages
are cleaner and more typesafe.

> > There is an assumption in this design that a single
> > VHOST_USER_CUSTOM_MMAP message provides the information necessary for
> > all mmaps. Are you sure the limitation that every mmap belongs to the
> > same domain will be workable in the future?
>=20
> Like a daemon servicing multiple VMs? Won't those still be separate
> vhost-user control channels though?

I don't have a concrete example, but was thinking of a guest that shares
memory with other guests (like the experimental virtio-vhost-user
device). Maybe there would be a scenario where some memory belongs to
one domain and some belongs to another (but has been mapped into the
first domain), and the vhost-user back-end needs to access both.

The other thing that comes to mind is that the spec must clearly state
which mmaps are affected by the Xen domain information. For example,
just mem table memory regions and not the
VHOST_USER_PROTOCOL_F_LOG_SHMFD feature?

> >
> >> +
> >>  C structure
> >>  -----------
> >> =20
> >> @@ -867,6 +884,7 @@ Protocol features
> >>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
> >>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
> >>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> >> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
> >> =20
> >>  Front-end message types
> >>  -----------------------
> >> @@ -1422,6 +1440,20 @@ Front-end message types
> >>    query the back-end for its device status as defined in the Virtio
> >>    specification.
> >> =20
> >> +``VHOST_USER_CUSTOM_MMAP``
> >
> > Most vhost-user protocol messages have a verb like
> > get/set/close/add/listen/etc. I suggest renaming this to
> > VHOST_USER_SET_XEN_MMAP_INFO.
>=20
> VHOST_USER_CONFIG_MMAP_QUIRKS?
>=20
> VHOST_USER_CONFIG_MMAP_TYPE?

SET is the verb that's often used when the front-end provides
configuration parameters to the back-end (e.g.
VHOST_USER_SET_MEM_TABLE, VHOST_USER_SET_FEATURES, etc).

Stefan

--ji5TbNtGJsInl60F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP/i3UACgkQnKSrs4Gr
c8g0qgf/aroAfmrv1TKO2MYdPTHh2fwqteXAzCt8TAYg0U3/xHgLY/ao9VPUDPKu
ZJkCQ/HBUSZnHbh8XkXwbq6D7vIyXBi6SYbQ59aLIPojafvrXUaKPgPD/4pr0Qut
bToML/9vzfGInhDDB2b6appsFUVpx2MIJf9mWDhsxeL9TeMcbiy+zefjizBejGAL
OM0aRjnxrG8pB4DIXlLM+K5gNm1hvuE/8SR0gEFQQ8KLmu4HpkTTCm1/hLvrfXRL
uCCAOg6CKfUfxJcxIywC4TgsJ6b3/7r8O3wwItcmvPCup8mc5dnz7c9W9JqkOU/i
MrmqUcDNOLz9nOqJfGufULCLFLawRA==
=OtkO
-----END PGP SIGNATURE-----

--ji5TbNtGJsInl60F--


