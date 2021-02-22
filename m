Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C383321D8C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:56:48 +0100 (CET)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEVr-0002sc-4l
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEETF-0001Jq-KL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEETC-0000iL-UI
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614012841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RdIbpCz7iWNfwPRGdTk1LZAuCt6qjbofQUpU36hKxk=;
 b=ZI5SOQGuxDCHj8ykyV/nruPxeUHbrugHWm5MVaCUk80UQmymPvNUxboWTwx+wAMyqgGIiS
 nxE5UNIUfmdTHvZ/wlkoG6TeuPtS3jtZka/KrU9DWR8utiLgOlB6iW7gkH7KelV/I5A18o
 GB02D2gomgJB2FH8u+a34YAER+/iHBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-xkFXYVd-MM-yT2DkJJvWaA-1; Mon, 22 Feb 2021 11:53:57 -0500
X-MC-Unique: xkFXYVd-MM-yT2DkJJvWaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36355192D798
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 16:53:51 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3B31841CD;
 Mon, 22 Feb 2021 16:53:20 +0000 (UTC)
Date: Mon, 22 Feb 2021 16:53:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 23/24] vhost-user-fs: Implement drop CAP_FSETID
 functionality
Message-ID: <YDPhf3ycwo6+2QrQ@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-24-dgilbert@redhat.com>
 <20210211143542.GT247031@stefanha-x1.localdomain>
 <20210211144031.GB5014@redhat.com>
 <20210215155711.GA95852@stefanha-x1.localdomain>
 <20210216155710.GB10195@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210216155710.GB10195@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kzj3RFwlzhzPtnxL"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kzj3RFwlzhzPtnxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 10:57:10AM -0500, Vivek Goyal wrote:
> On Mon, Feb 15, 2021 at 03:57:11PM +0000, Stefan Hajnoczi wrote:
> > On Thu, Feb 11, 2021 at 09:40:31AM -0500, Vivek Goyal wrote:
> > > On Thu, Feb 11, 2021 at 02:35:42PM +0000, Stefan Hajnoczi wrote:
> > > > On Tue, Feb 09, 2021 at 07:02:23PM +0000, Dr. David Alan Gilbert (g=
it) wrote:
> > > > > From: Vivek Goyal <vgoyal@redhat.com>
> > > > >=20
> > > > > As part of slave_io message, slave can ask to do I/O on an fd. Ad=
ditionally
> > > > > slave can ask for dropping CAP_FSETID (if master has it) before d=
oing I/O.
> > > > > Implement functionality to drop CAP_FSETID and gain it back after=
 the
> > > > > operation.
> > > > >=20
> > > > > This also creates a dependency on libcap-ng.
> > > >=20
> > > > Is this patch only for the case where QEMU is running as root?
> > > >=20
> > >=20
> > > Yes, it primarily is for the case where qemu is running as root, or
> > > somebody managed to launch it non-root but with still having capabili=
ty
> > > CAP_FSETID.
> >=20
> > Running QEMU as root is not encouraged because the security model is
> > designed around the principle of least privilege (only give QEMU access
> > to resources that belong to the guest).
> >=20
> > What happens in the case where QEMU is not root? Does that mean QEMU
> > will drop suid/guid bits even if the FUSE client wanted them to be
> > preserved?
>=20
> QEMU will drop CAP_FSETID only if vhost-user slave asked for it. There
> is no notion of gaining CAP_FSETID.
>=20
> IOW, yes, if qemu is running unpriviliged and does not have CAP_FSETID,
> then we will end up clearing setuid bit on host. Not sure how that
> problem can be fixed.

Yeah, that seems problematic since the suid bit should stay set in that
case. The host cannot set the bit again (even if it has privileges)
because that would create a race condition where the guest expects the
bit set but it's cleared.

Stefan

--kzj3RFwlzhzPtnxL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAz4X8ACgkQnKSrs4Gr
c8hcrAf/TQ4PMBHy9o3liFFKGSxf2MZL0mBZ8h/AQhQ5FkBuNi0ooYb5H3OuUqAJ
mtdv5kpIWzAyxpW+NB/hQVLeIsh6Zx3JGldlzkd5xapfZZabwaSM3Uwb/zH5pnTd
P1u5NcbrIAgy47WwRuL3X4pigojMTmskPboq3SZni9TsjDwRrNgqGQShSD+m+nZ/
3/7v1Z8LKHYwV4NUC3BuuNfEjLiP5mM+rqKl14ecoIHHZmNppzr0sD8C70AwkaGR
0e6xHiKYHod3uongdb5378/qVi0AtZrsu4OztP951dN2mpz3dt+NusEXbG9/c0T9
6NPowwywXFY5pY5+PKJLqfin4dU3iQ==
=Ly/6
-----END PGP SIGNATURE-----

--kzj3RFwlzhzPtnxL--


