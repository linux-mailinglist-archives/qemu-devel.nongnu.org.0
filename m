Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B338C973
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:46:36 +0200 (CEST)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6Q7-0007d2-LT
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lk6Oe-0006q1-8j
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lk6Oc-0007Gg-Ht
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621608301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/Rs14zZV/gzhpWdXcMKECCB85GM59KDgveL/0pGUbE=;
 b=EQSCMW5913wQwzxWKnqozX10Sq49m3HBnmTPqRLme9eS3jHSNKCKhqV3vl9PR1C8EkNdLI
 AvfgK0TjboqO3hDwHzcalHFPiLpC8RkJvMjJWg/je1+SxSzeiMAD+QJ6/hrn8cdgJPBdEy
 gBCMBc5IWBgM8km9VXWFvdXbalWQNDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-9ORSv884P3qMMikavBm_wA-1; Fri, 21 May 2021 10:44:58 -0400
X-MC-Unique: 9ORSv884P3qMMikavBm_wA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BEBB343BA;
 Fri, 21 May 2021 14:44:57 +0000 (UTC)
Received: from localhost (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60DA5D9D5;
 Fri, 21 May 2021 14:44:56 +0000 (UTC)
Date: Fri, 21 May 2021 15:44:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/6] coroutine: new sleep/wake API
Message-ID: <YKfHZ8xFPN8Lm/rM@stefanha-x1.localdomain>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pg5Tex+mawjUv58n"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pg5Tex+mawjUv58n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 12:05:42PM +0200, Paolo Bonzini wrote:
> This is a revamp of the qemu_co_sleep* API that makes it easier to
> extend the API: the state that is needed to wake up a coroutine is now
> part of the public API instead of hidden behind a pointer-to-pointer;
> the API is made more extensible by pushing the rest of QemuCoSleepState
> into local variables.
>=20
> In the future, this will be extended to introduce a prepare/sleep/cancel
> API similar to Linux's prepare_to_wait/schedule/finish_wait functions.
> For now, this is just a nice refactoring.
>=20
> Paolo
>=20
> v1->v2: comment and commit message updates in patches 3, 5 and 6
>=20
> Paolo Bonzini (6):
>   coroutine-sleep: use a stack-allocated timer
>   coroutine-sleep: disallow NULL QemuCoSleepState** argument
>   coroutine-sleep: allow qemu_co_sleep_wake that wakes nothing
>   coroutine-sleep: move timer out of QemuCoSleepState
>   coroutine-sleep: replace QemuCoSleepState pointer with struct in the
>     API
>   coroutine-sleep: introduce qemu_co_sleep
>=20
>  block/block-copy.c          | 10 ++---
>  block/nbd.c                 | 14 +++----
>  include/qemu/coroutine.h    | 27 ++++++++-----
>  util/qemu-coroutine-sleep.c | 75 +++++++++++++++++++------------------
>  4 files changed, 64 insertions(+), 62 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--pg5Tex+mawjUv58n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCnx2cACgkQnKSrs4Gr
c8jeOAgAmPdQzWBIAWsZ5Dym84jjHZuIY5Hb1FLXOjqNL0MMXL2G+ydtF/bDmI3Z
14SQ7vkFync7As6kbJXHNFX3mlL/iQ+kg08BSc4k6Fmh7XU9jzORJZpqBm3WoJdM
Hvyho/5S1jJvsO7dIWXY1Rwwu7HevxBCQz6R5pfskDnV0odhRvB/CR2DgkA/KGuA
HUvyQrsMMOJINTXSScJL98IBeL0remz354A3kgX/br0kvd8vlq3Af0OKoXdEFslL
Xui+VRFnzpyhN4NjsP7nYPUhs0LMO3o82Csl2gc98k1kEkqShciHrXjiyozNBhBD
vR0TTn90AhQPjXv3DStL7AxaHGv2HQ==
=z8se
-----END PGP SIGNATURE-----

--pg5Tex+mawjUv58n--


