Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A02515AB6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 07:54:02 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkg3N-00059R-20
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 01:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkfyb-0004Bn-EQ
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkfyY-0000Lp-Bc
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651297741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x2vEuAYNZc26zf9s7ZmRXYXD03CqOhRFzTWISFC4lQQ=;
 b=TGwtfi0jR7mHi5qclrh1Z8if/ZZLJbNPXIxsJOWy2GicUPGNspCcPc0jtrig6j5NfIjubM
 i0yUSZS4XkXPsVMCZSwazDidcG8tC+XuuwJOkmDoVngpEZVh1zjMM/7BkLCRRvHCxPB7cL
 3L79qMWIXWSqIxZqYjbCjZoM1ijsuKw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-_awPojmjPnuh5S2p5lMQkg-1; Sat, 30 Apr 2022 01:48:57 -0400
X-MC-Unique: _awPojmjPnuh5S2p5lMQkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0673E3C01B87;
 Sat, 30 Apr 2022 05:48:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E89A4010E3D;
 Sat, 30 Apr 2022 05:48:54 +0000 (UTC)
Date: Sat, 30 Apr 2022 06:48:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 3/8] block: introduce a lock to protect graph
 operations
Message-ID: <YmzNxS8A3ETA9duq@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-4-eesposit@redhat.com>
 <Ymqaa1dDUZau9rdS@stefanha-x1.localdomain>
 <1650055a-6b58-2a1a-c19c-3c663e131602@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5Y6q9Pxme9uc8yFb"
Content-Disposition: inline
In-Reply-To: <1650055a-6b58-2a1a-c19c-3c663e131602@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--5Y6q9Pxme9uc8yFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 10:37:54AM +0200, Emanuele Giuseppe Esposito wrote:
> Am 28/04/2022 um 15:45 schrieb Stefan Hajnoczi:
> > On Tue, Apr 26, 2022 at 04:51:09AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> +static int has_writer;
> >=20
> > bool?
>=20
> Yes and no. With the latest findings and current implementation we could
> have something like:
>=20
> wrlock()
> 	has_writer =3D 1
> 	AIO_WAIT_WHILE(reader_count >=3D1) --> job_exit()
> 						wrlock()
>=20
> But we are planning to get rid of AIO_WAIT_WHILE and allow wrlock to
> only run in coroutines. This requires a lot of changes, and switch a lot
> of callbacks in coroutines, but then we would avoid having such problems
> and nested event loops.

I don't understand how this answer is related to the question about
whether the type of has_writer should be bool?

> > How can rd be negative, it's uint32_t? If AioContext->reader_count can
> > be negative then please use a signed type.
>=20
> It's just "conceptually negative" while summing. The result is
> guaranteed to be >=3D 0, otherwise we have a problem.
>=20
> For example, we could have the following AioContext counters:
> A1: -5 A2: -4 A3: 10
>=20
> rd variable below could become negative while looping, but we read it
> only once we finish reading all counters, so it will always be >=3D 0.

AioContext->reader_count is uint32_t but can hold negative values. It
should be int32_t.

IMO even rd should be int32_t so it's clear that it will hold negative
values, even temporarily.

The return value of reader_count() should be uint32_t because it's
always a positive value.

That way the types express what is going on clearly.

> >=20
> >> +            aio_wait_kick();
> >> +            qemu_co_queue_wait(&exclusive_resume, &aio_context_list_l=
ock);
> >=20
> > Why loop here instead of incrementing reader_count and then returning?
> > Readers cannot starve writers but writers can starve readers?
>=20
> Not sure what you mean here. Why returning?

It was a misconception on my part. Looping is necessary. Somehow I
thought that since we have aio_context_list_lock when we awake,
has_writer cannot be 1 but that's incorrect.

>=20
> >=20
> >> +        }
> >> +    }
> >> +}
> >> +
> >> +/* Mark bs as not reading anymore, and release pending exclusive ops.=
  */
> >> +void coroutine_fn bdrv_graph_co_rdunlock(void)
> >> +{
> >> +    AioContext *aiocontext;
> >> +    aiocontext =3D qemu_get_current_aio_context();
> >> +
> >> +    qatomic_store_release(&aiocontext->reader_count,
> >> +                          aiocontext->reader_count - 1);
> >=20
> > This is the point where reader_count can go negative if the coroutine
> > was created in another thread. I think the type of reader_count should
> > be signed.
>=20
> I think as long as we don't read it as a single, there's no problem

There is no problem with the program's behavior, two's complement means
unsigned integer operations produce the same result as signed integer
operations.

The issue is clarity: types should communicate the nature of the values
held in a variable. If someone takes a look at the struct definition
they will not know that ->reader_count is used to hold negative values.
That can lead to misunderstandings and bugs in the future.

Stefan

--5Y6q9Pxme9uc8yFb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJszcUACgkQnKSrs4Gr
c8gtZAf9GiTLaSC2XT1jkWYudhSM56V2jC5CERbmTrtCTup+uhnewoTpfo7hGaUe
7zvh37Ad+PrhWKfv93xjdC7k+Xey0alwKlyju3d4JZw42Uw30nbedqOjGtmpd3Vw
DVqGWS4wkpFnYQDxDrVPiU5Nuh8Nwp4XK7SO/5Wko3KcLAUgyLIbKaOgdjezUaB8
jmdf75J+C5FfBzP9/Jaicw3OshZkmrtA/oMmdbDMPQNAO4jlydklAa8WwVyQAEUq
ysbhFd3S9UD0MV/6IDMSGZzSfGEIGFqqjKsajQwOS/XSwtmzBSKQepyYMtYVpYJz
GFHPAKbOGYd5ZVzzYIkXcmiaSJkVpg==
=CVpC
-----END PGP SIGNATURE-----

--5Y6q9Pxme9uc8yFb--


