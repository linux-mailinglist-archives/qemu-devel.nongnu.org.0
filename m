Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E504B1606AF
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 22:13:54 +0100 (CET)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3REf-0000oo-Gf
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 16:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jtomko@redhat.com>) id 1j3RDj-00085D-Sn
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jtomko@redhat.com>) id 1j3RDi-0001Ze-Fy
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:12:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33333
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jtomko@redhat.com>) id 1j3RDi-0001Xx-6x
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581887573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9XlwZOd5fe0GZQTmBbLgJeGV8Rplg/r0Y2wPRswr96I=;
 b=ipeA1DHYgOmNbJ7RxT6Uo70n367TjZXUT2lS5QeQNzVYrSHtHW7hj5X+k+MrWRWZlVsykJ
 mahQkiQIcRQkdM1uNktJHd1gz/oIkSdoz/SzEUS2hqNTpBvfAa4jrzWXJa1hl+1NdRK0d1
 U77mAW1iKDG+mhSHcHuAOaW+IFfHObw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-trySBYpoO-CvTOrVVIyP-A-1; Sun, 16 Feb 2020 16:12:48 -0500
X-MC-Unique: trySBYpoO-CvTOrVVIyP-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BA8C1005516;
 Sun, 16 Feb 2020 21:12:47 +0000 (UTC)
Received: from lpt (ovpn-200-18.brq.redhat.com [10.40.200.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D23F1001B2C;
 Sun, 16 Feb 2020 21:12:38 +0000 (UTC)
Date: Sun, 16 Feb 2020 22:12:35 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] block/qcow2-bitmap: Remove unneeded variable
 assignment
Message-ID: <20200216211235.GA745061@lpt>
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2020 at 05:15:55PM +0100, Philippe Mathieu-Daud=E9 wrote:
>Fix warning reported by Clang static code analyzer:
>
>    CC      block/qcow2-bitmap.o
>  block/qcow2-bitmap.c:650:5: warning: Value stored to 'ret' is never read
>      ret =3D -EINVAL;
>      ^     ~~~~~~~
>
>Reported-by: Clang Static Analyzer
>Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>---
> block/qcow2-bitmap.c | 1 -
> 1 file changed, 1 deletion(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Unused since its introduction in 88ddffae8fc1e30cc907c2dbb989b7eba9e62319

Jano

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl5JsD8ACgkQ+YPwO/Ma
t51NgQgArr2H7dAcPdCRtNPcIVZY5MMCMNi3sqT2HIK9T8Cuc/Uu3Ep3TcgmrS3L
tsmuM0q/Y8PnPuX6X8qq3q4wU3jd3jerHkXjGCE6wUalE0hz1TI9CprHW9an/SmJ
BKtjE3huUeTglhz9WqPBjlKU2psJ1AxuZ2MR4evifyI4gKPV678rRvRlLxvu+LiS
qPCOPxu7EPOUKkziz0nh2pkD8fGShRYBRp43lzopd3sDk/LAkGFJikPw2kdP5tPb
FKpnK9HHG0iKj6YeUvlI7CtIN1+C/nQOd+RHAEIe2oyMPw/OwO5/pSJDHg+kmQ7k
CGhNi1gcGwviEWJdEZPRrn9uGJJhYg==
=7drt
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--


