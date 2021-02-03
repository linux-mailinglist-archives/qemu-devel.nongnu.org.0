Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1522330DF8B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:22:43 +0100 (CET)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KvR-00063Z-Mt
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7KpO-0001WJ-MZ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7KpM-0001ec-OO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDBKFZQRo8w/D0DbsIJWtKgU2BDMvqJrQ8Im3zge/kA=;
 b=RLSbeJTyLWIa8TVuiBOFWx+smaj1h845W0oA0eT26MzwuZgtunlleKoV8eW/b52JOroyzh
 WUgtPX8gvPexyp0W2lBOk3Tu1fUgkm7ovCmEtK31vyxuE+pPX2DZLizjnmjlxFZ2nINyQ1
 DKvrPQZ2qjXbgphTtLuEyp5Xiiz9rkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-H67LDb-kNGSakzYNz9Dm-w-1; Wed, 03 Feb 2021 11:16:18 -0500
X-MC-Unique: H67LDb-kNGSakzYNz9Dm-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76F27107ACE4
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 16:16:17 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E00D5D9E3;
 Wed,  3 Feb 2021 16:16:14 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:16:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 6/8] trace: add trace_event_iter_init_group
Message-ID: <20210203161613.GC241524@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-7-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-7-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:26PM +0100, Gerd Hoffmann wrote:
> This allows to interate over an event group.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  trace/control.h | 13 +++++++++++++
>  trace/control.c | 19 ++++++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAazE0ACgkQnKSrs4Gr
c8jdbAf+NVuuZeASKAAES/SjMyfCFgKc8ij920qTRyAyR7a71MpH4V4tAYqhexNU
nhGXrOvRbnmsiR3mCz2MLLSzatEwOr4cgwsmvXv/g/aHqatsrdpqARmKqi4s4Pd0
LyFGljWjejAlDr3PM/vo5YOuoVHVrvvUAIfcae41t/tsbPEa1UX/ejQYJcTKa8tL
Vg18E0bHPRHn11tE6xNO/zGUjuAzoi6mI3F0+FH+hiFQ7RiAzrlO8tNs+dhORib6
sBA6xWhzIZPr4tEJoH6qlv65anZYeNArM9qbmWXHTjIEr3b/gPltLpr8txKTLsY6
7YOutqg6az8NK9tZNmvKcre7UWrD9w==
=zmPI
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--


