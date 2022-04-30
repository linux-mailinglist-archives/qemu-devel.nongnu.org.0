Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC61515A98
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 07:24:18 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkfab-0000zz-5V
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 01:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkfYa-0008CA-PZ
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkfYV-0005cg-4b
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651296125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=111Kh2r6ki1vxO84qerylq8O+1FxrjSSFJDVv+wTLus=;
 b=TkFgWayUok9y7HYL9LRUQ5WyPIpRiAwrouKNNIl8jQKd5EU66sQWs5I6YyAP0voaSCVXT1
 sa0Zrz6AXDkvrJrxykxV8AHMgsJxY/xOB/Pee56q0uw8Fi6mzz2IXh4kmHXL33l4buXGVF
 oB9NsQOXEAp2cGDrbjEN0JgTnsaUmME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-N1wcHnqfPnqeCTIF35EZSg-1; Sat, 30 Apr 2022 01:21:59 -0400
X-MC-Unique: N1wcHnqfPnqeCTIF35EZSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA6D0800186;
 Sat, 30 Apr 2022 05:21:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7713D2024CB6;
 Sat, 30 Apr 2022 05:21:57 +0000 (UTC)
Date: Sat, 30 Apr 2022 06:21:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 1/8] aio_wait_kick: add missing memory barrier
Message-ID: <YmzHdG9a4F+ZjJg7@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-2-eesposit@redhat.com>
 <Ymp12Ng5/mns+ngw@stefanha-x1.localdomain>
 <d8ac2a96-4508-9cc3-9ca8-762851997103@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WEv7p1GRTfmngZhI"
Content-Disposition: inline
In-Reply-To: <d8ac2a96-4508-9cc3-9ca8-762851997103@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--WEv7p1GRTfmngZhI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 10:06:33AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 28/04/2022 um 13:09 schrieb Stefan Hajnoczi:
> > On Tue, Apr 26, 2022 at 04:51:07AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> It seems that aio_wait_kick always required a memory barrier
> >> or atomic operation in the caller, but almost nobody actually
> >> took care of doing it.
> >>
> >> Let's put the barrier in the function instead.
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> ---
> >>  util/aio-wait.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/util/aio-wait.c b/util/aio-wait.c
> >> index bdb3d3af22..c0a343ac87 100644
> >> --- a/util/aio-wait.c
> >> +++ b/util/aio-wait.c
> >> @@ -35,7 +35,8 @@ static void dummy_bh_cb(void *opaque)
> >> =20
> >>  void aio_wait_kick(void)
> >>  {
> >> -    /* The barrier (or an atomic op) is in the caller.  */
> >> +    smp_mb();
> >=20
> > What is the purpose of the barrier and what does it pair with?
> >=20
> > I guess we want to make sure that all stores before aio_wait_kick() are
> > visible to the other thread's AIO_WAIT_WHILE() cond expression. that
> > would require smp_wmb(). I'm not sure why it's a full smp_mb() barrier.
>=20
> I think we need the full smp_mb barrier because we have a read
> afterwards (num_readers) and we want to ensure ordering also for that.
>=20
> Regarding pairing, yes you are right. I need to also add a smp_mb()
> between the write(num_waiters) and read(condition) in AIO_WAIT_WHILE,
> otherwise it won't work properly.
>=20
> So we basically have
>=20
> Caller:
> 	write(condition)
> 	aio_wait_kick()
> 		smp_mb()
> 		read(num_writers)
>=20
> AIO_WAIT_WHILE:
> 	write(num_writers)
> 	read(condition)

That makes sense to me, thank you! Please include the explanation in the
comments.

Stefan

--WEv7p1GRTfmngZhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJsx3QACgkQnKSrs4Gr
c8hdYQgAr103EADR1ekHzOXXlQF6HDTDoemkbXP2VGEHlSrqYl69dGCGE4gpsqzx
B+VF+C0/UvUGNJvy6RzsvvQaBsRZitq6yvCGU530VzPU3MuWPW43O6KHbKoFYMKL
5pJYAjGwML13mdDqEL7s4se8l2fv6jWk5pfNjgt3AIY144a1D9YdiWKFeVEm7xb0
wbZoRiTzmIwN6QDwdTniHNAf+mIyEZvNl3eInvtUQVmIPEArV6sPx2LnWbtgGISH
tqZcLYQqYxSpfccJhO7LlNyiyj2E5fXMOy4avKkXtXxyYBAkxfFMw/UBKtwtcyLG
tbOBSwdF4wvbhJ7yH+31MvsoXrqrbA==
=7M98
-----END PGP SIGNATURE-----

--WEv7p1GRTfmngZhI--


