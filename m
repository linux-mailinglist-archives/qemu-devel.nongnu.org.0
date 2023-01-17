Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326766E398
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:33:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHot4-00073P-Dh; Tue, 17 Jan 2023 11:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHosv-00072c-EY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHost-0006zZ-Lv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673973145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Lk+mhXGuSupSdshS6kviwk3PyvKU3rV0vXPKJK/+Rw=;
 b=BNNOj5P1haXKJHfkqQuxjdj6XnsORISkzICPjUEHKcL8zhjt40dhCP8g5u3QSz7pU6Y4wW
 EfQXPkGFc+OJO9xoMp5fAXJF15+SXgdhENbwOkRDJPxmnWGOoLIT8b2br1wosGQxuDB9Zn
 4k7FBq++X2c+oGX1rcsrhVmkjpVyll8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-g-n79XpkP52k7UYEVlMclQ-1; Tue, 17 Jan 2023 11:32:23 -0500
X-MC-Unique: g-n79XpkP52k7UYEVlMclQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B84C1991C47;
 Tue, 17 Jan 2023 16:32:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7BF9492B00;
 Tue, 17 Jan 2023 16:32:20 +0000 (UTC)
Date: Tue, 17 Jan 2023 11:32:19 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
Message-ID: <Y8bNk0W8OKlO/hGI@fedora>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WXGemy9kRENHJo/3"
Content-Disposition: inline
In-Reply-To: <20230117135203.3049709-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--WXGemy9kRENHJo/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 08:52:02AM -0500, Emanuele Giuseppe Esposito wrote:
> QEMU does not compile when enabling clang's thread safety analysis
> (TSA),
> because some functions create wrappers for pthread mutexes but do
> not use any TSA macro. Therefore the compiler fails.
>=20
> In order to make the compiler happy and avoid adding all the
> necessary macros to all callers (lock functions should use
> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of pt=
hread_mutex_lock/pthread_mutex_unlock),
> simply use TSA_NO_TSA to supppress such warnings.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  bsd-user/qemu.h         | 5 +++--
>  include/exec/exec-all.h | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

As a TSA newbie I'm wondering how would we go about annotating this
properly?

Maybe:
1. mmap_lock() ACQUIRE(), mmap_unlock() RELEASE()
2. Find all functions that call mmap_lock() but not mmap_release() and
   add ACQUIRE().
3. Find all functions that call mmap_unlock() but not mmap_lock() and
   add RELEASE().

Can you add an item to https://wiki.qemu.org/BiteSizedTasks so someone
who wants to spend a few hours auditing the code can do this?

Thanks!

--WXGemy9kRENHJo/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPGzZMACgkQnKSrs4Gr
c8gkqAgAkTiNBVPzz0UMqN88r+zfmZ24M4tHLT4G3642r2C5yQWDYM6ZRqxHWsjM
Slkn6SxxpmMIRwzQs/SWZidVEQif2qHl2rcIrLMOROha6xExff/rq5etTFKGKgxZ
uoFMaOFs0xwPg3Zh1k7liJZzul7h2fR61S+s6MHSLlndw5/bqIoHPc8KBhhMIkRF
qJWA4krIge58ILl3tmFiWBDd0QLsofFLxujpqDU4qqK+IjYCN2kPyt7DXiD0sEgR
nWP8/uCcLofZ/PTzjogsQcKQmps3/jR5x7E4Gus+CElP3KPWrOjge5Nf4kZsKNBO
uCNa8v62AB79WCcBSueO3IfdPzCaOw==
=v1xj
-----END PGP SIGNATURE-----

--WXGemy9kRENHJo/3--


