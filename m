Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F514681BB7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMb2k-0001do-EV; Mon, 30 Jan 2023 15:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMb2d-0001bL-PV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMb2b-00035C-PY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675111572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TNvUG9cMqNukwOvQ1Cxeqg7lq0aU3vzskySsjI4HLZo=;
 b=Zi2kVPJPScmFFMncyztp4uWUzqkGEtNtIOU8HmZ15twW4EOD86JQ53m3jWW2MZmhFnJfGg
 VmsYSgVeG78Vuf3Mv+fZQisr5tNMBgIL42wh8gPcPjgh3olh1CgxKyB5xHbL+qhuq1MTOR
 hmvK5KZB8xPsfAjI4lBQRok3hU9Esn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-Iu_aRqR-OZm6yq9TiAiy6A-1; Mon, 30 Jan 2023 15:46:09 -0500
X-MC-Unique: Iu_aRqR-OZm6yq9TiAiy6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92965101A55E;
 Mon, 30 Jan 2023 20:46:08 +0000 (UTC)
Received: from localhost (unknown [10.39.195.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C51D1121314;
 Mon, 30 Jan 2023 20:46:07 +0000 (UTC)
Date: Mon, 30 Jan 2023 15:46:05 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH 4/4] iotests/detect-zeroes-registered-buf: add new test
Message-ID: <Y9gsjecmU5K6eGRe@fedora>
References: <20230126201401.348845-1-stefanha@redhat.com>
 <20230126201401.348845-5-stefanha@redhat.com>
 <20230127232548.6hofhg4tketr5ex7@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="86hMibkIsMRM3C7o"
Content-Disposition: inline
In-Reply-To: <20230127232548.6hofhg4tketr5ex7@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--86hMibkIsMRM3C7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 05:25:48PM -0600, Eric Blake wrote:
> On Thu, Jan 26, 2023 at 03:14:01PM -0500, Stefan Hajnoczi wrote:
> > This regression test demonstrates that detect-zeroes works with
> > registered buffers. Bug details:
> > https://gitlab.com/qemu-project/qemu/-/issues/1404
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  .../tests/detect-zeroes-registered-buf        | 58 +++++++++++++++++++
> >  .../tests/detect-zeroes-registered-buf.out    |  7 +++
> >  2 files changed, 65 insertions(+)
> >  create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-b=
uf
> >  create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-b=
uf.out
> >=20
> > diff --git a/tests/qemu-iotests/tests/detect-zeroes-registered-buf b/te=
sts/qemu-iotests/tests/detect-zeroes-registered-buf
> > new file mode 100755
> > index 0000000000..edb5f2cee5
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/detect-zeroes-registered-buf
> > @@ -0,0 +1,58 @@
> > +#!/usr/bin/env bash
> > +# group: rw auto quick
> > +#
> > +# Check that detect-zeroes=3Dunmap works on writes with registered I/O=
 buffers.
> > +# This is a regression test for
> > +# https://gitlab.com/qemu-project/qemu/-/issues/1404 where I/O request=
s failed
> > +# unexpectedly.
> > +#
> > +# Copyright Red Hat
>=20
> Do you need a year or a (C) or similar?

No, this is the cool new copyright style that Red Hat legal recommends!
:)

I'll send you the details in a separate email.

Stefan

--86hMibkIsMRM3C7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPYLI0ACgkQnKSrs4Gr
c8hgagf/WJAH1AytQIPzTp+JVEyOz1uS7zXET6qycrhnZTGv9BrVh9/Ezv4IoTiU
OF0jzI6xdlYCfGuFvIWBW4JgspisFKJ6F0mqG06FE3/Cg1JribXc2QV483F4OWuQ
666dAtGO87xqzFfYflZQ/eagZa0kyGSdFnADww7A3/CbMXddgpHSqB2GG23G12j6
E3GLP0scEsN8w4YU5gr2SMLbn4D7ZL+y//o8ugre4VSKf/vnN5pTUIJxWYnjnzd1
4YPmMSmFsFo7l8TD+p8kHUAbSN3TyrDGlgRLTOSPlDXlHw2GZSzWFjf0TVgvXyA8
uH4Y7PBY30hD37MQHTNZc/Ku20HCKw==
=JTTB
-----END PGP SIGNATURE-----

--86hMibkIsMRM3C7o--


