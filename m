Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182337A890
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:09:29 +0200 (CEST)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT4i-0001T0-88
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgT2f-00072t-81
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgT2d-00086r-PQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhnALUT4Zl7C/4OZ/0MSQ1CeTijTVHGqF5a+PaTmNjI=;
 b=Iqz9IaNfTOYh4CGu78b1MKgqmLxjPSk7tpcB8ixsilP8s7q4xKf0o6tM2Buicp0Qoo1PxH
 Vx/PKAUpg579MkcjL3SHzvG/Kj8D32mWMkEwMIMyZaqA+SrxuX0Ku+bseDyIog7MEoydsy
 yZ8NyyiZxUHNvyNm5SLv6JSwX2JNKbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-uodycyKiODy0-fDzXa7-iA-1; Tue, 11 May 2021 10:07:15 -0400
X-MC-Unique: uodycyKiODy0-fDzXa7-iA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150D88042C6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 14:07:15 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4C721037F24;
 Tue, 11 May 2021 14:07:12 +0000 (UTC)
Date: Tue, 11 May 2021 15:07:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/6] coroutine: new sleep/wake API
Message-ID: <YJqPkDDJ+00vH/+k@stefanha-x1.localdomain>
References: <20210503112550.478521-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210503112550.478521-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z+ICVF8ipm9X0Nfj"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: eesposit@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--z+ICVF8ipm9X0Nfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 01:25:44PM +0200, Paolo Bonzini wrote:
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
> Paolo Bonzini (6):
>   coroutine-sleep: use a stack-allocated timer
>   coroutine-sleep: disallow NULL QemuCoSleepState** argument
>   coroutine-sleep: allow qemu_co_sleep_wake(NULL)
>   coroutine-sleep: move timer out of QemuCoSleepState
>   coroutine-sleep: replace QemuCoSleepState pointer with struct in the
>     API
>   coroutine-sleep: introduce qemu_co_sleep
>=20
>  block/block-copy.c          | 10 +++---
>  block/nbd.c                 | 14 +++-----
>  include/qemu/coroutine.h    | 26 ++++++++------
>  util/qemu-coroutine-sleep.c | 69 +++++++++++++++++--------------------
>  4 files changed, 57 insertions(+), 62 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--z+ICVF8ipm9X0Nfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCaj48ACgkQnKSrs4Gr
c8hblwgAxC4ojqdNfnXdduk4JF2Va2AwHqYxRqQ0DxmZeEGVkJEHcC88pQFsIHHR
kmN1m22+3+FxCxRpRdnBfMjSFvLDT7oUeJa+jC3v72g5t055zYb/IhX0Wh8HwQSb
KUFqE07kr4CaW4URvWoR5Oj/GOVlXZCl/nshcukFznsd7ftqKZIIRSaLVtP/7gGu
0R1/9nzB9dFUVjpJeFpkxzli4zPTNlhyCISKMiMhdNgu1HjfldP/TLK+geBvFvBK
e19z51Ze3YSiP/vckAkrsMu8MWlASLtilHGMSy7kSEO9otk/4DheK19e1NtlZe8J
WaJ0zN4V0AWXTqKriMGeW7BHPDg5SA==
=ztZr
-----END PGP SIGNATURE-----

--z+ICVF8ipm9X0Nfj--


