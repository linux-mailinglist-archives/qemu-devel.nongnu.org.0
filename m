Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED73645DF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:20:28 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUlH-0005y3-Fp
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lYUkA-0005KZ-5Y
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lYUk8-0002H3-7W
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618841955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7DFxEdK8nKhuDYwN0GboXTsc6paypLLl9SW//cr9EeQ=;
 b=Bv1/N8ABOPhlnsWGRxOP7+Zql4NFw5KNggOKzurocBhUU0aOmUD/Co6/YB7LP5fL5l5gfI
 YpwaPqCPFbzEaNIwZBUSz7chWtVIp/+IUZ44dJ1sbEAz+EMGMNvW8FwLwo+NNM9SnGrNOc
 Lcm0V1ayYOa+/tTukuHS5smKQ2bFW3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-DXTvtMpNNlOWPTOiLrTsAQ-1; Mon, 19 Apr 2021 10:19:12 -0400
X-MC-Unique: DXTvtMpNNlOWPTOiLrTsAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3BA1020C20;
 Mon, 19 Apr 2021 14:19:10 +0000 (UTC)
Received: from localhost (ovpn-113-179.ams2.redhat.com [10.36.113.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D6260843;
 Mon, 19 Apr 2021 14:19:10 +0000 (UTC)
Date: Mon, 19 Apr 2021 15:19:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 0/8] virtiofsd: Changed various allocations to GLib
 functions
Message-ID: <YH2RXdTSVSO7TWQc@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <CAD-LL6hpUObLT-sQcDPnLt4m406TBv_SDUYgT346ZDc8eWsSig@mail.gmail.com>
 <YFi9WoL1hqY/0MWU@stefanha-x1.localdomain>
 <CAD-LL6gkQnBo5rxJFHsHGTUq=aS+=u=FaeK1Uhak7BL1Giba2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD-LL6gkQnBo5rxJFHsHGTUq=aS+=u=FaeK1Uhak7BL1Giba2g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0aDr0lP2Kz9nXLie"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0aDr0lP2Kz9nXLie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 10:43:07AM +0200, Mahmoud Mandour wrote:
> On Mon, Mar 22, 2021 at 5:53 PM Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
>=20
> > On Fri, Mar 19, 2021 at 03:47:03PM +0200, Mahmoud Mandour wrote:
> > > On Fri, Mar 19, 2021 at 3:25 PM Mahmoud Mandour <ma.mandourr@gmail.co=
m>
> > > wrote:
> > >
> > > > Replaced allocations done using malloc(), calloc(), and realloc()
> > > > to their equivalent functions in GLib.
> > > >
> > > > Memory that is allocated locally and freed when the function exits
> > > > are annotated g_autofree so that the deallocation is automatically
> > > > handled. Subsequently, I could remove a bunch of free() calls.
> > > >
> > > > Also, tried to keep the semantics of the code as is, but when the
> > > > allocation is a small one, or a crucial one, I replaced the
> > > > NULL-checking mechanisms with glib's functions that crash on error.
> > > >
> > > > This is related to a patch that I had submitted as a part of a
> > > > previous series. The previous patch had some errors. Also, I though=
t
> > > > that it's better to split the patch into smaller pieces.
> > > >
> > > > The previous patch can be found here:
> > > > https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05153.html
> > > >
> > > > Mahmoud Mandour (8):
> > > >   virtiofsd: Changed allocations of fuse_req to GLib functions
> > > >   virtiofds: Changed allocations of iovec to GLib's functions
> > > >   virtiofsd: Changed fuse_pollhandle allocation to GLib's functions
> > > >   virtiofsd: Changed allocations of fuse_session to GLib's function=
s
> > > >   virtiofsd: Changed allocation of lo_map_elems to GLib's functions
> > > >   virtiofsd: Changed allocations of fv_VuDev & its internals to GLi=
b
> > > >     functions
> > > >   virtiofsd/passthrough_ll.c: Changed local allocations to GLib
> > > >     functions
> > > >   virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib
> > > >
> > > >  tools/virtiofsd/fuse_lowlevel.c  | 43 +++++++++++-----------------=
----
> > > >  tools/virtiofsd/fuse_virtio.c    | 34 ++++++++-----------------
> > > >  tools/virtiofsd/passthrough_ll.c | 21 ++++++----------
> > > >  3 files changed, 34 insertions(+), 64 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > > Hello,
> > > For some reason, my get_maintainers script auto cc-filling did not wo=
rk,
> > so
> > > I had to manually cc
> > > you.
> > > Sorry for the inconvenience.
> >
> > Thanks, will review tomorrow.
> >
> > Stefan
> >
>=20
> Hello
>=20
> I wanted to ask whether I need to resend the patch series with updates
> utilizing
> the feedback I got? There are patches that are overall superfluous, and
> others are
> "reviewed". Should I resend an updated series with only the patches
> reviewed?

That would be great. Thanks!

Stefan

--0aDr0lP2Kz9nXLie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB9kV0ACgkQnKSrs4Gr
c8hd2gf+Kbl7o9+mXs4feQWbWDiVEXGC3hbd1VJ7/4F9f4rifrBCgtIPXPFxeRsM
4szetr1D2H/ZFPLk6vj9qw/FFsokKgxRaadl1RFunxGhxSRTlWqFqzSQXJOU2TQ2
ca87XGm0CL8r1n0w9kjzOEfvXnaYEesPtCIPjUxLosJIP7yNRyp0CXZ9dAXO16/R
HiLDLEjuWyDFbdwUP85SXVmu+LcH8YpZAgME90s4wadxTuGuoKZ5bQ7sC/d2awZ9
xnn+KRUXrqzjbbHWfZgs5WICCZ5rp1+v2+X8xBI05WnE5tGkBpm4v/CJrExTL1or
F1BO0qTqFk20UwtXEluQrlLQEAh3tA==
=Yi9a
-----END PGP SIGNATURE-----

--0aDr0lP2Kz9nXLie--


