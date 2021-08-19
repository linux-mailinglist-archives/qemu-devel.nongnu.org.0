Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED533F1DBF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:24:31 +0200 (CEST)
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkqE-0004EH-DA
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mGkp7-0003LW-IJ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mGkp3-0006pT-EM
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=URZxcOpSU0q03czY2VT3//55huAVzhbBs42cBq3Uqyc=;
 b=ZT0cVDTThwnSuMEv5CR7VXA3qi5F+2wCn/TCwCDQ6R+nXa+CjqTkFC/timEtTMhX58H+bO
 H3HCGikmNv6Q4aX60W5EjL7X+kPjclTbk+PBw22jCVABNLiZrdvpSMIDu+WQ2Qm1zKzsJO
 i8T4hxWKFYeTjx30kU/9vJXuMHXv/fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-VzxX0QVwOAyUXpdfu5Rg2A-1; Thu, 19 Aug 2021 12:23:14 -0400
X-MC-Unique: VzxX0QVwOAyUXpdfu5Rg2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3565A1082921
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 16:23:13 +0000 (UTC)
Received: from localhost (unknown [10.39.195.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE74A1017CE6;
 Thu, 19 Aug 2021 16:23:12 +0000 (UTC)
Date: Thu, 19 Aug 2021 17:23:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
Message-ID: <YR6FauCbECxehubc@stefanha-x1.localdomain>
References: <20210819102501.69638-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210819102501.69638-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PST/LGVDfqwT3I5M"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PST/LGVDfqwT3I5M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
> This post explains when FUSE block exports are useful, how they work,
> and that it is fun to export an image file on its own path so it looks
> like your image file (in whatever format it was) is a raw image now.
>=20
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> You can also find this patch here:
> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
>=20
> My first patch to qemu-web, so I hope I am not doing anything overly
> stupid here (adding SVGs with extremely long lines comes to mind)...
> ---
>  _posts/2021-08-18-fuse-blkexport.md       | 488 ++++++++++++++++++++++
>  screenshots/2021-08-18-block-graph-a.svg  |   2 +
>  screenshots/2021-08-18-block-graph-b.svg  |   2 +
>  screenshots/2021-08-18-block-graph-c.svg  |   2 +
>  screenshots/2021-08-18-block-graph-d.svg  |   2 +
>  screenshots/2021-08-18-block-graph-e.svg  |   2 +
>  screenshots/2021-08-18-root-directory.svg |   2 +
>  screenshots/2021-08-18-root-file.svg      |   2 +
>  8 files changed, 502 insertions(+)
>  create mode 100644 _posts/2021-08-18-fuse-blkexport.md
>  create mode 100644 screenshots/2021-08-18-block-graph-a.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-b.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-c.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-d.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-e.svg
>  create mode 100644 screenshots/2021-08-18-root-directory.svg
>  create mode 100644 screenshots/2021-08-18-root-file.svg

Great! Two ideas:

It would be nice to include a shoutout to libguestfs and mention that
libguestfs avoids exposing the host kernel's file systems and partion
code to untrusted disk images. If you don't mount the image then the
FUSE export has similar security properties.

This is a long blog post. One idea is to show a quickstart
qemu-storage-daemon FUSE export command-line in the beginning before
explaining all the details. That way people who just want to see what
this is about can get an idea without learning all the background first.

--PST/LGVDfqwT3I5M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEehWoACgkQnKSrs4Gr
c8gQsQgAgSZbsz09KyMKfv81nV1mwfrTkoWRaZSDgsPyQ4oEUl+YRdQT8IFsVdgw
r/vnZBXsb7MOqo4pmCBzmC/PnSxPtDG+lwbTHV/L2zPyZxEZY/KpqmjHEKodXQ/b
G5YL2Ews/VhiTn1xFBPABsB/JOHMjlcfTP9x2VNXZvwXtyhhGW6dPg4vg3cORsVf
9JF/m/cqdhgIWb2pf+MidIGIbwLdGSF7zw5pDDRQaNka7nP9tz9CLjmwZUw3/Wep
7Cdas4kXzmHbDYfa9CNJz24N4046MXtF3KimzbvIRyalwCQATIcJ8iqeKAhSGmhi
HakCroxsxmLeAX8ZfQ3gR2pTHQLzzQ==
=5dVK
-----END PGP SIGNATURE-----

--PST/LGVDfqwT3I5M--


