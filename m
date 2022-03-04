Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A682E4CD2C4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:51:45 +0100 (CET)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5XE-00033O-PT
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:51:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nQ5W2-0001uG-6u
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:50:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nQ5W0-0001iP-MP
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646391028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSTaLr+NvfDXVC5SCfeAPB5Wqc0CyU+6cZPlDm/2vsM=;
 b=BtZBYts4sHESzoGi2+fAAtmELYy1Ud6JJzIC7GnNtEa4PCU3Yg170Kwt9Imnp3dl+gFg07
 gO7fsyUZsWbzFoSO1Ka8Q89lYZQzEpsN+YZW7u+Ql53LbN2Tyvq38OlpXRibluCqJAISaW
 3P46kQlVXHDRuML9TrG7+SGCzERm1PU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-Jb7Oy0RFMKeBTBZYB3cCXA-1; Fri, 04 Mar 2022 05:50:26 -0500
X-MC-Unique: Jb7Oy0RFMKeBTBZYB3cCXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605C61091DA1;
 Fri,  4 Mar 2022 10:50:24 +0000 (UTC)
Received: from localhost (unknown [10.33.36.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA1442B3B7;
 Fri,  4 Mar 2022 10:50:23 +0000 (UTC)
Date: Fri, 4 Mar 2022 11:50:43 +0100
From: Sergio Lopez <slp@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 4/4] docs: vhost-user: add subsection for non-Linux
 platforms
Message-ID: <20220304105043.agaor6txfgtd2zek@mhamilton>
References: <20220303115911.20962-1-slp@redhat.com>
 <20220303115911.20962-5-slp@redhat.com>
 <20220304053326-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c7vjzt7v36rtj4td"
Content-Disposition: inline
In-Reply-To: <20220304053326-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 John G Johnson <john.g.johnson@oracle.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 kvm@vger.kernel.org, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--c7vjzt7v36rtj4td
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 05:35:01AM -0500, Michael S. Tsirkin wrote:
> On Thu, Mar 03, 2022 at 12:59:11PM +0100, Sergio Lopez wrote:
> > Add a section explaining how vhost-user is supported on platforms
> > other than Linux.
> >=20
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  docs/interop/vhost-user.rst | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >=20
> > diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> > index edc3ad84a3..590a626b92 100644
> > --- a/docs/interop/vhost-user.rst
> > +++ b/docs/interop/vhost-user.rst
> > @@ -38,6 +38,24 @@ conventions <backend_conventions>`.
> >  *Master* and *slave* can be either a client (i.e. connecting) or
> >  server (listening) in the socket communication.
> > =20
> > +Support for platforms other than Linux
>=20
>=20
> It's not just Linux - any platform without eventfd.
>=20
> So I think we should have a section explaining that whereever
> spec says eventfd it can be a pipe if system does not
> support creating eventfd.

I'm confused. This is exactly what this subsection intends to do...

Thanks,
Sergio.

> > +--------------------------------------
> > +
> > +While vhost-user was initially developed targeting Linux, nowadays is
> > +supported on any platform that provides the following features:
> > +
> > +- The ability to share a mapping injected into the guest between
> > +  multiple processes, so both QEMU and the vhost-user daemon servicing
> > +  the device can access simultaneously the memory regions containing
> > +  the virtqueues and the data associated with each request.
> > +
> > +- AF_UNIX sockets with SCM_RIGHTS, so QEMU can communicate with the
> > +  vhost-user daemon and send it file descriptors when needed.
> > +
> > +- Either eventfd or pipe/pipe2. On platforms where eventfd is not
> > +  available, QEMU will automatically fallback to pipe2 or, as a last
> > +  resort, pipe.
> > +
> >  Message Specification
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> > --=20
> > 2.35.1
>=20

--c7vjzt7v36rtj4td
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmIh7wAACgkQ9GknjS8M
AjWilxAAnNIS1WAe3sQyLr2mX/rC0JeslU2CIVCvEgfZ2kTACBdNG3bKmyWkA+xX
8L0hYdVfomAilkkMa4TV9LJvS7/fSnpf13xGgX9mvG4SNF87vg/AAfk/gxFGboK7
Mu7lO14ykgqhMV2jy4QclFkaHXtmbdPwfIzUfUg3KNKmHqxeGZxhx5VnQlJhtG4w
OwQnZuXMDRfNLuFgfrKvk8K0RlHqStq58x1qcX7NgSmwYcgV1Rc5OVzmIMkRqEOU
laut4PzBLXEtloSSKkpkIF+3UZzklL1UKBnv8LsFN9/qJb/pCytclle+f8PtQuIs
Gn87SyJwouQ+lYlr7piRwFHjTgf9LA/MBEmyeOPAmKgAXPdZW4XAO0PdhUpTjjjs
hY6GJNQv0kKZEONvooZcQsFxpsAbBahKAKZV+9DTPEq9C49YZG970cadUAwDSbw+
sNdcWX1nR1UGsXVEE9DsLHNQUWkBnPmfzpWHHPhGGMxnlVLGcXchHL/P2lJEHgTb
zSf05+kg0+AkxcYsOs1zoSpEWTzJ+7lP8qkstN4AbfCfKzmxCJGtTquHzKaJzI3+
Xj5a6Rt7+NEnisq3UT/xyiGPxBFHkgEUSp1qZXgmANRQ/N7psY1UBEoxNwq/kSYv
S3JMFzi6KwsUp9d9KnYfhmzpYSvJhZGuK/SearMcCxjzaUym8k0=
=Yuan
-----END PGP SIGNATURE-----

--c7vjzt7v36rtj4td--


