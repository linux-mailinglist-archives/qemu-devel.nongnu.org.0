Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB31606D3
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 22:50:22 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3Rnx-0000xn-H4
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 16:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jtomko@redhat.com>) id 1j3RkD-0004Vr-Hi
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:46:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jtomko@redhat.com>) id 1j3RkC-0000Ya-J9
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:46:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35194
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jtomko@redhat.com>) id 1j3RkC-0000Xv-DQ
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581889587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJ8blW+yIy7KErza9Me94nuZUIhzEUZuDmznTUalrDo=;
 b=QNsi4cApzTFdmhxcd2xNvAJdqDdKO1A186fV5H49MVfyRmhqyCjADeA4u3kvBk2G7HR2Di
 iIV85Oy69vNHTmhtNuA1W3Q9qV/vWOc2eB7qPSnCx9dt8xXSskGWDschGFSU7/yZT7UV56
 K2yWz64cGGmrfBmdVNJjXdeGPfnAiTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-SGTXAnIcPHq7medW_gWI1Q-1; Sun, 16 Feb 2020 16:46:25 -0500
X-MC-Unique: SGTXAnIcPHq7medW_gWI1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3633F1857340;
 Sun, 16 Feb 2020 21:46:24 +0000 (UTC)
Received: from lpt (ovpn-200-18.brq.redhat.com [10.40.200.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F08EE60BEC;
 Sun, 16 Feb 2020 21:46:21 +0000 (UTC)
Date: Sun, 16 Feb 2020 22:46:18 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 4/7] commit: Inline commit_populate()
Message-ID: <20200216214618.GH745061@lpt>
References: <20200214200812.28180-1-kwolf@redhat.com>
 <20200214200812.28180-5-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214200812.28180-5-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pkrempa@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, nsoffer@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 09:08:09PM +0100, Kevin Wolf wrote:
>commit_populate() is a very short function and only called in a single
>place. Its return value doesn't tell us whether an error happened while
>reading or writing, which would be necessary for sending the right data
>in the BLOCK_JOB_ERROR QMP event.
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> block/commit.c | 28 ++++++----------------------
> 1 file changed, 6 insertions(+), 22 deletions(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl5JuCoACgkQ+YPwO/Ma
t506ZQf/UYjxB5Bx3pEH1ZkMKEAHcdddSDQqQTEdUM9kGyLHB0QUphTaeDNlRydd
gq8mqm3le4CoTP6aYmLwPk2JWqam4vwAcSkf7uGeGP7hg8qg3H2TExrHL/j4IUth
W90frGJCwxyvzSIFhVme7HXwhDmOkt4cuxMem286DkjC1I/EIPTISZYfKGGoNWOT
DLfUbjAYRoiY4j98L9zdDnWC80d1jEeltnc3u4V8C6fYwDV69KJdkCeEy1vhpqOl
8YD4iqxtEZR9JB7cSwDsqp5qLokh4a2JSWpNsRhfw39RLT64E2Dlr/7+TLqngzZg
s+vbcP7/EjTR10jhc8o3qN6i9A27dw==
=f1XO
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--


