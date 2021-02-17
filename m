Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9931E18D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:41:44 +0100 (CET)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUZr-0002pI-CZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCUFw-0004kM-N0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 16:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCUFu-0006Fa-Bl
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 16:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613596865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAZ7oQ/lHrDEMIQI/FD+1QZ6Ra1FLzG87Z/KafMwBuA=;
 b=OOtBr2g5t+OskjIDdOwuLb+Dt6Wg9MnbiNjAWDD8tvRQFGKXa6VQwHcstGwHIsoZ0DCGcG
 CfkVhNWRAZn/p1IsB0JWxR+KaT1DoC1bGMYwEIXNlVCz/YX00uHpRbcszKNhbfEonwguQ0
 wWwnL14RmJZ8cdjPC4fSo1zbQroEwvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-qysyVKq8PXO1MHaRbnMYgQ-1; Wed, 17 Feb 2021 16:21:01 -0500
X-MC-Unique: qysyVKq8PXO1MHaRbnMYgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11A45107ACE3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 21:21:00 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABE7B60C5F;
 Wed, 17 Feb 2021 21:20:59 +0000 (UTC)
Date: Wed, 17 Feb 2021 21:20:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH] Add Outreachy and GSoC announcement
Message-ID: <20210217212058.GA289197@stefanha-x1.localdomain>
References: <20210217100748.269005-1-stefanha@redhat.com>
 <10d1e37a-035b-01cc-cf34-08b0bce1e06b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <10d1e37a-035b-01cc-cf34-08b0bce1e06b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 12:03:16PM +0100, Thomas Huth wrote:
> On 17/02/2021 11.07, Stefan Hajnoczi wrote:
> > QEMU is participating in Outreachy May-August and is applying for GSoC
> > 2021. It's time to publish information on these internship programs and
> > how to apply.
>=20
> Thanks, it's online now:
>=20
>  https://www.qemu.org/2021/02/17/gsoc-and-outreachy-2021/

Nice, thank you!

Stefan

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtiLoACgkQnKSrs4Gr
c8iB9wf/V6gS8AXiTlhBZT6wQ82kjpDiXCF+98vEvRWVqDG8MV6OWkASJpWk9FeJ
6uAy9S3JZmMJSDGp0UzUmCRcrywB2Px39SRm3Cgp+8MytWnqr1vi7tmMUAd4EXxa
l1itXARf5IRHVM9Uh36mODmiTm/I983pweBEfVbXPG7mjsWaWMk7G5VLN836otFc
zs+WF1IOAzQf9GYI2bycL8FAwoYvotEx6tFwD/SXCOOygsL7y1KF3AQ/tfCKQNhL
ttLPBxO9lFZdNcrOJUf/vNKZJR2izBRkInsUhoKM4q63V85VPGU31ei76mpPXTT7
+9JZhiHeFdiXbucJHbF+OZY7KblXeg==
=UHcY
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


