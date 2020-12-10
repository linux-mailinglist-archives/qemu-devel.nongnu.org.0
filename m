Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B92D5913
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:15:51 +0100 (CET)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJvJ-00073h-Du
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knJtq-0006Yu-0m
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knJtn-0003Zh-3i
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607598853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tok+y1KLeSWv4mvcStFgrwbH0KKKJrquAitIz6iLijM=;
 b=JVDPagHe87MrLfCjBIKFiSMROaGP1JqvXBHDVe6uDSwrb+lid2o78HZy7LKKJu3HQ/Xu78
 zbEoVnovIBtYG4dkiKdTDZaOHwPiaZpX7+AzHXQ9xqQZziEU5DaFvLt7Tmh89eTJ6Pykc9
 D0pQCPEm2otJNXfzp562vkjbDgayGIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-rLvpPIcEMwig_239asiyXg-1; Thu, 10 Dec 2020 06:14:09 -0500
X-MC-Unique: rLvpPIcEMwig_239asiyXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123A6CE646;
 Thu, 10 Dec 2020 11:14:07 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD40F5D9DD;
 Thu, 10 Dec 2020 11:13:56 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:13:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
Message-ID: <20201210111355.GD416119@stefanha-x1.localdomain>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <20201203091404.GA687169@stefanha-x1.localdomain>
 <CAFEAcA_YTeBy3T5umkRKnUx90yqLD1HRHzcW9FsA1iDJGezcEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YTeBy3T5umkRKnUx90yqLD1HRHzcW9FsA1iDJGezcEQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, john.g.johnson@oracle.com,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Felipe Franciosi <felipe@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 konrad.wilk@oracle.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, thanos.makatos@nutanix.com,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 08:40:11PM +0000, Peter Maydell wrote:
> On Thu, 3 Dec 2020 at 09:51, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Tue, Dec 01, 2020 at 03:22:35PM -0500, Jagannathan Raman wrote:
> > > This is the v12 of the patchset. Thank you very much for the
> > > review of the v11 of the series.
> >
> > I'm in favor of merging this for QEMU 6.0. The command-line interface
> > has the x- prefix so QEMU is not committing to a stable interface.
> > Changes needed to support additional device types or to switch to the
> > vfio-user protocol can be made later.
> >
> > Jag, Elena, JJ: I suggest getting your GPG key to Peter Maydell so you
> > can send multi-process QEMU pull requests.
>=20
> I would prefer to see this going through the tree of an
> established QEMU developer who's already sending pullrequests,
> at least initially.

Once the discussion has completed I can send the patches in a pull
request.

I don't want to be the bottleneck for all multi-process QEMU patches in
the future though. That's why I think the authors should be able to send
pull requests on their own after the initial code is merged. Much of
this work is isolated an only affects multi-process QEMU and the feature
is marked experimental. There is little risk of introducing instability
for non-multi-process QEMU users/developers. Hence why this is a new
subsystem and has MAINTAINERS files entries.

Does that sound good?

Stefan

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SAvMACgkQnKSrs4Gr
c8jDPAf/UkRVnjtTdySUZ/KQbpxa1nGwfxfrRGfvvXN9AVH4pIYZctCbUNPgFEyd
Aq4sdQpjJzkY2+uyXo6/8rkw1Y7ZR44R/k/WQkNbhYSF/3Qc2r+a31m1lYslCvAv
gfJ9ske+C8nU0BDTKfCFk5EF5q/DCNPfHye/tseIJX936DJMDSdGfyyqhaIZflTR
BEA6giVbv0NXFY8B4zkmGjT6bEvvvMw01bQXDFp9p6bjdV585u0D18RXjHKpETLD
QkeusBxGa/t6y1p5i+uu0xCYBXklusBf3oZDt+ysnCmFmQk6aHa6I0Ror64rs0vg
mPDiTRv4zvzCPzINNrjiQ839MI107Q==
=Grws
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--


