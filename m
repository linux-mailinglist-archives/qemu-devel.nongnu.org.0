Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88C36FE75
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:26:53 +0200 (CEST)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVye-0001Oy-Jt
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lcVt8-00067R-32
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lcVt6-0002hD-BS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619799667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C1OlEqyFPLIto61EUFPrqGNn8PDoJx8505AC1AQZyOI=;
 b=O8uCx78DkXPxWgK7scPMVU7NMDkSR/PL71KHzZKjl5Ad4hEXI1bApljBG6NVUpmIKKe3a3
 x3MLneVoTFV8/wYIHhKMKglEWJxaL+PC2H6N9Y043WMkinOWtDsXFpJcTyV/TwuHU8AT7y
 4OzRXSm1//UYhuTk+DZW1vsXv5ZzyPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-cS0ljIyKNYexWyGUOwhBrQ-1; Fri, 30 Apr 2021 12:21:02 -0400
X-MC-Unique: cS0ljIyKNYexWyGUOwhBrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3BF8186E8;
 Fri, 30 Apr 2021 16:21:01 +0000 (UTC)
Received: from localhost (ovpn-112-107.ams2.redhat.com [10.36.112.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF9EC60C04;
 Fri, 30 Apr 2021 16:20:55 +0000 (UTC)
Date: Fri, 30 Apr 2021 17:20:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YIwuZrw/573HqvUe@stefanha-x1.localdomain>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <20210429142259.GR26415@redhat.com>
 <YIrFmZgh5IAeiLdm@stefanha-x1.localdomain>
 <20210429150038.GT26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429150038.GT26415@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UhWn9nU4un2JGM2e"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Alberto Garcia <berto@igalia.com>, slp@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UhWn9nU4un2JGM2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 04:00:38PM +0100, Richard W.M. Jones wrote:
> On Thu, Apr 29, 2021 at 03:41:29PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Apr 29, 2021 at 03:22:59PM +0100, Richard W.M. Jones wrote:
> > > This is where I get confused about what this library actually does.
> > > It's not just a nicer wrapper around io_uring, but what is it actuall=
y
> > > doing?
> >=20
> > It's a library for what QEMU calls protocol drivers (POSIX files,
> > userspace NVMe driver, etc). In particular, anything offering
> > multi-queue block I/O fits into libblkio.
> >=20
> > It is not intended to replace libnbd or other network storage libraries=
.
> > libblkio's properties API is synchronous to keep things simple for
> > applications. Attaching to network storage needs to be asynchronous,
> > although the libblkio API could be extended if people want to support
> > network storage.
>=20
> I think what confuses me is why is NVMe any different from io_uring?
> ie would this work?
>=20
> $ blkio-info --output=3Djson io_uring path=3D/dev/nvme0

The libblkio io_uring driver can handle /dev/nvme* block devices.

The future userspace NVMe driver mentioned above will be a VFIO PCI
driver, like the block/nvme.c driver in QEMU today. It uses a PCI device
directly, not a /dev/nvme* block device.

Stefan

--UhWn9nU4un2JGM2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCMLmYACgkQnKSrs4Gr
c8hgugf9EEhDIeO1CqH8Ev7qLFDcw9f24SdQ5XV8N8UZaAl5UCoG5RiLjh1tPVHj
H/jKAH+Wfk2apeeiYCLoDlmvZEmKib0bRXL4ZaRiwvxSaFQcaTqyJMfXmn4ovGSG
36xoOYIvGlPBWtT3/dd4FzrxufpT31JMFBxEqMhEstD/kOpH7fnPPRgqCHXGSIW8
6NeM9iKThbV5uwQZWDWtMHbPCGvbpyiLraHNaRhFkWdEZ9FeFIhSV7RSVsGN7kU2
Yvs3Jd0k3wHJ24G4Kb4R2YvBV5KvCACQ0wpZU/CDMrb7neV9T+u95gMo5ULL1rIh
nN5ZUZF7uACooNPW5b4rvEU+L7ISTQ==
=aJ5O
-----END PGP SIGNATURE-----

--UhWn9nU4un2JGM2e--


