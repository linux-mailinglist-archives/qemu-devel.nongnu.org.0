Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254175132D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:53:06 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2hl-0001v7-0t
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk2DR-00082I-DW
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:21:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk2DN-0000Kv-Hq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651144900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nIVqHgu5u0iyjIF6LgD7osVzHb9IxA/ThSUPMBbXoqs=;
 b=FuQo0H2l/ECbYTGDXx4eNmu+hzgVvupMuChNuG32dHQ95bZLymcxRmR4LgeNd6nO4WtvUB
 W2TcLJ77XS70o/b/yOEPbU4MI0sIB//XjdFlHn1LHkA8tLPGnbrq4xbApCswkrBpOexpFw
 WyDeHoRmu+/WAww1n4XV34jqTs2KZJU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-WXjNYgQXMEuCjo5IsQKcCA-1; Thu, 28 Apr 2022 07:21:36 -0400
X-MC-Unique: WXjNYgQXMEuCjo5IsQKcCA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 759363811F31;
 Thu, 28 Apr 2022 11:21:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B94040314F;
 Thu, 28 Apr 2022 11:21:35 +0000 (UTC)
Date: Thu, 28 Apr 2022 12:21:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] coroutine-lock: release lock when restarting
 all coroutines
Message-ID: <Ymp4vs+oMc7pipe7@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0H+O0UBjKkhRSvg2"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0H+O0UBjKkhRSvg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:08AM -0400, Emanuele Giuseppe Esposito wrote:
> Current implementation of qemu_co_queue_do_restart
> does not releases the lock before calling aio_co_wake.
> Most of the time this is fine, but if the coroutine
> acquires the lock again then we have a deadlock.
>=20
> Instead of duplicating code, use qemu_co_enter_next_impl, since
> it implements exactly the same functionality that we
> want.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---

It's unclear whether this patch fixes a bug or introduces a new API that
will be used in later patches.

The commit message is a bit misleading: existing functions are not
changed to release the lock when restarting all coroutines.

I think what this commit is actually doing is adding a new API that will
be used in later patches?

--0H+O0UBjKkhRSvg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqeL4ACgkQnKSrs4Gr
c8hchwf7BKl9H63EhzV7r1PhhJNvtSaX3c2Wc7KQKSSZ1PCMNc2c3rOwWZp2xfKy
FEym0/AYFK0YS9bl6rJcApQYm5jWq0sza0gpSObR6D7OQUOK8Ch2ms07BiyZjjrC
8iAro4oQZEBhAsSeVdHJaXL0cMicwSI2HQdsWF2j9CRFZZvV+4Nh95qqVNgNIwCp
1kOpbD38rSrgXUjYPr1qjhg45bEVt1HJRNYY996D3sSLpjPimqjc1TxDW+K9TOaS
9+60trdvvc3kG0s6sVbyMua7KFcK2YsEZo7Rk9HVivzAKZVrcTMWVCu2A7Yr8Ftx
glOUUmDJfufrZMdIfA8KR/koOuzR/A==
=ePzv
-----END PGP SIGNATURE-----

--0H+O0UBjKkhRSvg2--


