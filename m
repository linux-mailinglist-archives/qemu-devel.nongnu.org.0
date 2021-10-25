Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C74396D6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:55:27 +0200 (CEST)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezVe-0002te-7J
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mezJp-00006z-7v
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mezJm-0003dB-M5
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635165789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=79f/9afnwtB829IMzgS0+GQeVHdsj73e3rNCJCAuleY=;
 b=DVJnsMPhEtwXBJ0U4ryCGl+rWG5xnhqnwJJ0YK56tdBLRoH1UhOdNsEum6gHlqGC+zcnXw
 fwZQSdxfdeNIRQsAr0VbTsoktWTkw9PYt6oesKQVmk90im0G97mpRbYt/ZjE7NNVBKKc22
 YAIVZnYR5aatyusg9pKAF3SmqsgkwZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-dUyAEKn0Ne6zLaA8wcLKsw-1; Mon, 25 Oct 2021 08:43:04 -0400
X-MC-Unique: dUyAEKn0Ne6zLaA8wcLKsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AACF0101F000;
 Mon, 25 Oct 2021 12:43:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53C825BAFB;
 Mon, 25 Oct 2021 12:42:57 +0000 (UTC)
Date: Mon, 25 Oct 2021 13:42:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena <elena.ufimtseva@oracle.com>
Subject: Re: MMIO/PIO dispatch file descriptors (ioregionfd) design discussion
Message-ID: <YXamUDa5j9uEALYr@stefanha-x1.localdomain>
References: <88ca79d2e378dcbfb3988b562ad2c16c4f929ac7.camel@gmail.com>
 <YWUeZVnTVI7M/Psr@heatpipe>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PKDBWrlb7QGTn9i6"
Content-Disposition: inline
In-Reply-To: <YWUeZVnTVI7M/Psr@heatpipe>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, kvm@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 eafanasova@gmail.com, felipe@nutanix.com, dinechin@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PKDBWrlb7QGTn9i6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 10:34:29PM -0700, elena wrote:
> On Wed, Nov 25, 2020 at 12:44:07PM -0800, Elena Afanasova wrote:
> > Hello,
> >
>=20
> Hi
>=20
> Sorry for top-posting, just wanted to provide a quik update.
> We are currently working on the support for ioregionfd in Qemu and will
> be posting the patches soon. Plus the KVM patches will be posted based
> of the RFC v3 with some fixes if there are no objections from Elena's side
> who originally posted KVM RFC patchset.

Hi Elena,
I'm curious what approach you want to propose for QEMU integration. A
while back I thought about the QEMU API. It's possible to implement it
along the lines of the memory_region_add_eventfd() API where each
ioregionfd is explicitly added by device emulation code. An advantage of
this approach is that a MemoryRegion can have multiple ioregionfds, but
I'm not sure if that is a useful feature.

An alternative is to cover the entire MemoryRegion with one ioregionfd.
That way the device emulation code can use ioregionfd without much fuss
since there is a 1:1 mapping between MemoryRegions, which are already
there in existing devices. There is no need to think deeply about which
ioregionfds to create for a device.

A new API called memory_region_set_aio_context(MemoryRegion *mr,
AioContext *ctx) would cause ioregionfd (or a userspace fallback for
non-KVM cases) to execute the MemoryRegion->read/write() accessors from
the given AioContext. The details of ioregionfd are hidden behind the
memory_region_set_aio_context() API, so the device emulation code
doesn't need to know the capabilities of ioregionfd.

The second approach seems promising if we want more devices to use
ioregionfd inside QEMU because it requires less ioregionfd-specific
code.

Stefan

--PKDBWrlb7QGTn9i6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF2plAACgkQnKSrs4Gr
c8hugQgAsK965URBPD6/lg7f0ucQqEchs2Spk7bGtxC1VOoSL7mxqgDmaNGfqzME
BWlS7vNeCaaiT13vsw1H0rDh6QumtlQpnJfNkNnX+K2tjxjZIftNnhlRiN/NHbzN
ZbeBAJKlf6yf9wuePTMwu+zxR6yPFIAVVZrvPh27OInSOEkRMCx1MmjqyA3pRnFX
gyY8Krxcrgh1rgoyC03MNOkTRTEHExn40sNcIXcqcNfwd1k/dEAXnaiulT1qya1i
o/b6L4LGDpw5BwwqsTu2dSJ6+cjhiaJ2BPuSewFjGf8xr37IXKB2hexPmar958sI
gvbcgCEHS+0KtUXXb5O8VA3f5HRmNQ==
=zbN3
-----END PGP SIGNATURE-----

--PKDBWrlb7QGTn9i6--


