Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C157F4D4DE6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:59:35 +0100 (CET)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLCQ-0002Mo-Tu
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:59:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSL7z-0007T1-DN
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSL7x-0007K2-96
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646927696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5I267wJoKaC5Crh9uemICRxD7tJSsxBUIfOIU9048E=;
 b=Bw/yjLEvd9m8cFgMXz0nkouCBwYBBt5f/3tjiNGnagGhp7hfmWPjShFxRadUe8b+zpcWQo
 oyDoxMFSF90J/EzTEC1I/Sb3bLMqZJ27ZvhmkYjdDMZHfNFm9bMOGCYIWNkbhJT8YABLlu
 X5QSt1q/CtckJM9iAjTL+HTlTRJroag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-iCPb-BfwMyiA802RTZP8iw-1; Thu, 10 Mar 2022 10:54:52 -0500
X-MC-Unique: iCPb-BfwMyiA802RTZP8iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C09B3FC83;
 Thu, 10 Mar 2022 15:54:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F251526DF3;
 Thu, 10 Mar 2022 15:54:48 +0000 (UTC)
Date: Thu, 10 Mar 2022 15:54:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Message-ID: <YiofR6yyQjpxJUsC@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2qLJXzjnGL51LX6u"
Content-Disposition: inline
In-Reply-To: <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2qLJXzjnGL51LX6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 02:26:28PM +0100, Emanuele Giuseppe Esposito wrote:
> Am 02/03/2022 um 10:47 schrieb Stefan Hajnoczi:
> > On Tue, Mar 01, 2022 at 09:21:08AM -0500, Emanuele Giuseppe Esposito wr=
ote:
> >> Possible scenarios
> >> -------------------
> >> Keeping in mind that we can only have an iothread and the main loop
> >> draining on a certain node, we could have:
> >>
> >> main loop successfully drains and then iothread tries to drain:
> >>   impossible scenario, as iothread is already stopped once main
> >>   successfully drains.
> >>
> >> iothread successfully drains and then main loop drains:
> >>   should not be a problem, as:
> >>   1) the iothread should be already "blocked" by its own drain
> >=20
> > Once drained_begin() returns in the IOThread, the IOThread can do
> > anything it wants, including more submitting I/O. I don't consider that
> > "blocked", so I'm not sure what this sentence means?
> >=20
> > The way the main loop thread protects itself against the IOThread is via
> > the aio "external" handler concept and block job drain callbacks, which
> > are activated by drained_begin(). They ensure that the IOThread will not
> > perform further processing that submits I/O, but the IOThread code that
> > invoked drained_begin() can still do anything it wants.
>=20
> As above I think that regardless on what the iothread is doing, once the
> main loop has finished executing bdrv_drained_begin the iothread should
> not be doing anything related to the nodes that have been drained.

I agree. What I wanted to highlight is that waiting for requests to
complete is not what stops the IOThread, it's the "external" AIO handler
mechanism.

Stefan

--2qLJXzjnGL51LX6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqH0cACgkQnKSrs4Gr
c8hl2gf/czaI3j3078arsj8vJQD07E1hcEv8DJT6SGuJWBMAReBzS1+LDdUshC1h
5z6ohTmgzlQIq3LxXd5f/+L8sPIQId7fsE3bP3F+tCnjjT5zvSwGuac9YrlZr9Hn
ojeIyTFZf+MD+t5zCsgcrpiSegomSvpwQ7U1vKnnFmT3pCseWGRP3Ga8p247VHE+
ap2+Q1zBhtTEjJaRist27zuDUDsYV39nbFuy491l52ONqGPwWuDM1RV5GYZtXIrW
dYxROSDgpPtsqdqtJp5p+rPXs8r7GUh2Gwivjk/NUXb5MbwL1zpAdvRLd+uVZkkg
DhxPXaGVpyxVOQ1pPPvkJHSUbhLZgA==
=nCqa
-----END PGP SIGNATURE-----

--2qLJXzjnGL51LX6u--


