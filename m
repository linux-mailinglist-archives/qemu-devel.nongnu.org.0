Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA443DCDC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:16:46 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0ab-00058f-A5
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg0YQ-000491-Qi
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg0YO-0003es-Mh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635408867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDuOiyvsuW5iZzHfKwncUU1ksOibBW1HjvLFDhVTp80=;
 b=SzfYZwpxtrWiOfCJDE+LJ/qM97QDlcptZFNV/ojGEk1UVpeyIZP1ludOsxUg6JyXDD5aM4
 2qrl+tZcQASGfQBozzXZzzOamzG1GoxFHTgsJOHMmg12V2lU2rAHBXAPNw6xYJsyR5gMky
 FlpRQs0NgQMXi6mUEoEppSLMfKP68Sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-IDBgccwHNOu-sOzrvvQ5Dg-1; Thu, 28 Oct 2021 04:14:24 -0400
X-MC-Unique: IDBgccwHNOu-sOzrvvQ5Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C2D2101796C;
 Thu, 28 Oct 2021 08:14:22 +0000 (UTC)
Received: from localhost (unknown [10.39.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 266645D740;
 Thu, 28 Oct 2021 08:14:13 +0000 (UTC)
Date: Thu, 28 Oct 2021 09:14:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <levon@movementarian.org>
Subject: Re: MMIO/PIO dispatch file descriptors (ioregionfd) design discussion
Message-ID: <YXpb1f3KicZxj1oj@stefanha-x1.localdomain>
References: <88ca79d2e378dcbfb3988b562ad2c16c4f929ac7.camel@gmail.com>
 <YWUeZVnTVI7M/Psr@heatpipe>
 <YXamUDa5j9uEALYr@stefanha-x1.localdomain>
 <20211025152122.GA25901@nuker> <YXhQk/Sh0nLOmA2n@movementarian.org>
 <YXkmx3V0VklA6qHl@stefanha-x1.localdomain>
 <YXlEhCYAJuhsVwDv@movementarian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cwItEpQlM3dmBURJ"
Content-Disposition: inline
In-Reply-To: <YXlEhCYAJuhsVwDv@movementarian.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Elena <elena.ufimtseva@oracle.com>, john.g.johnson@oracle.com,
 jag.raman@oracle.com, kvm@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, eafanasova@gmail.com,
 felipe@nutanix.com, dinechin@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cwItEpQlM3dmBURJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 01:22:28PM +0100, John Levon wrote:
> On Wed, Oct 27, 2021 at 11:15:35AM +0100, Stefan Hajnoczi wrote:
>=20
> > > > I like this approach as well.
> > > > As you have mentioned, the device emulation code with first approach
> > > > does have to how to handle the region accesses. The second approach=
 will
> > > > make things more transparent. Let me see how can I modify what ther=
e is
> > > > there now and may ask further questions.
> > >=20
> > > Sorry I'm a bit late to this discussion, I'm not clear on the above W=
RT
> > > vfio-user. If an ioregionfd has to cover a whole BAR0 (?), how would =
this
> > > interact with partly-mmap()able regions like we do with SPDK/vfio-use=
r/NVMe?
> >=20
> > The ioregionfd doesn't need to cover an entire BAR. QEMU's MemoryRegions
> > form a hierarchy, so it's possible to sub-divide the BAR into several
> > MemoryRegions.
>=20
> I think you're saying that when vfio-user client in qemu calls
> VFIO_USER_DEVICE_GET_REGION_IO_FDS, it would create a sub-MR correspondin=
g to
> each one, before asking KVM to configure them?

Yes. Actually I wasn't thinking of the vfio-user client but just about
QEMU device emulation code in general. What you suggested sounds like a
clean mapping from MemoryRegions to vfio-user.

Stefan

--cwItEpQlM3dmBURJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF6W9UACgkQnKSrs4Gr
c8i+hwgAyCI2iGTHLFwogMjJbsa9jdKXiwENuqVpyhbeW7ov29LHVODiRJX0FvDj
RhQRePoHohxQSaMU2czi5re+0QD6QoVpSnTuhsWkoBHH6LUQJgT+WP5la2AItplG
YBeE7KdtEqpkRVKrRlvZMTGEbg4+rSLh80fdyh6owqFw531pOtlvZjx6Qpdj+rwb
UbOv//OuSq/RJGsi3ZDsL0ifUctKS4+NUIcxawjTvprbpLY5jnSdarxgjEKn2NJh
axhKFgV0D+DaU9xxrtLl12uqI1cGrY07gPEhiDI5bTMmc91OtMZJ9OxHEnDX7CVn
pS/A+nv2kQq74Y/LqT3lIWGVpeJMmA==
=4x+E
-----END PGP SIGNATURE-----

--cwItEpQlM3dmBURJ--


