Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E94091FC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:05:47 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmag-0005k4-9O
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPloL-0003LJ-52
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPloI-0001Fn-Oj
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631538946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AExYyLcnXaCmttxtVgyqcHNT9iO5VpPHP68RIVQ05Hg=;
 b=A1EHfijV0/D7of1+YYqVkZv1CDWRGK7VxWgePIcgZSGgV18yTvjl58OTaFCuvnmNknSx2O
 oE2EOeueDxC9sXX+1+WEHC9iCBieAt+RLxnFfkVP3sDhsl9IhjjShai6zNpmTrSXCe91wg
 FiMqn+PqcY1Q+srgVeedA1gKiufX31M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-07uS9uAHP92dk3kKhmAw2A-1; Mon, 13 Sep 2021 09:15:42 -0400
X-MC-Unique: 07uS9uAHP92dk3kKhmAw2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72446911AD;
 Mon, 13 Sep 2021 13:15:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11B5B10013C1;
 Mon, 13 Sep 2021 13:15:40 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:15:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 1/4] main-loop.h: introduce qemu_in_main_thread()
Message-ID: <YT9O/F4FY9ye/sk8@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f5wXm2TpQkXc00GE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--f5wXm2TpQkXc00GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 09:10:18AM -0400, Emanuele Giuseppe Esposito wrote:
> When invoked from the main loop, this function is the same
> as qemu_mutex_iothread_locked, and returns true if the BQL is held.
> When invoked from iothreads or tests, it returns true only
> if the current AioContext is the Main Loop.
>=20
> This essentially just extends qemu_mutex_iothread_locked to work
> also in unit tests or other users like storage-daemon, that run
> in the Main Loop but end up using the implementation in
> stubs/iothread-lock.c.
>=20
> Using qemu_mutex_iothread_locked in unit tests defaults to false
> because they use the implementation in stubs/iothread-lock,
> making all assertions added in next patches fail despite the
> AioContext is still the main loop.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/main-loop.h | 13 +++++++++++++
>  softmmu/cpus.c           |  5 +++++
>  stubs/iothread-lock.c    |  5 +++++
>  3 files changed, 23 insertions(+)
>=20
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 8dbc6fcb89..c6547207f7 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -245,6 +245,19 @@ AioContext *iohandler_get_aio_context(void);
>   */
>  bool qemu_mutex_iothread_locked(void);
> =20
> +/**
> + * qemu_in_main_thread: Return true if the function runs with BQL
> + * or in the main loop AioContext.
> + *
> + * This function falls back to qemu_mutex_iothread_locked() if
> + * called from the main loop, otherwise it checks if the current
> + * AioContext is the main loop. This is useful to check that the BQL
> + * is held, and not make it return false when invoked by unit
> + * tests or other users like storage-daemon that end up using
> + * stubs/iothread-lock.c implementation.
> + */
> +bool qemu_in_main_thread(void);

This description doesn't match the behavior because the "or in the main
loop AioContext" part only applies to non softmmu builds (e.g. tests).

Please phrase it so it's clear that this function is the same as
qemu_mutex_iothread_locked() when softmmu/cpus.c is linked into the
program. Otherwise it checks that the current AioContext is the global
AioContext.

--f5wXm2TpQkXc00GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/TvsACgkQnKSrs4Gr
c8jacQf/YIr/dv5oH7uT9Te+NJrJmWy/GmOTvRSMvLYjsYeHKu/Ne9VPTub8bkAs
dLDoeE3RfXOVhOtKWUoJkUyWZtxxpATsqQtWWpTWkjDAbO6cLfuFXzvoeYWdX8A5
ScAhOR3I3TPkSVZQB3Sp933RdgNKIRXhU/vpvxgHgOf1znP+ocd88YovVEOqswr+
5TRadncyfSeCHi+sY5rGTpA+jdIdzDqcoteouSR5p60ZkMWQMBsy7eKB4yQMRGdW
0Axdmxuq9KNb9myl7VnbsdVS3S3FMjecFNVVHVp3wNfCEMYUMluqouygagMsrcxg
cuXupyzu7mY3qWz2swM3erlxriz9Ng==
=N1k2
-----END PGP SIGNATURE-----

--f5wXm2TpQkXc00GE--


