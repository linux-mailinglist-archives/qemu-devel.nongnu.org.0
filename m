Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1906240CE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5PF-0006mX-38; Thu, 10 Nov 2022 06:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot5PA-0006kJ-E2
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot5P8-0003Gp-Fk
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668078448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OSN61cwKe8Zcas45HUpY9LCxQRz3OB6/2gGlVLgB82E=;
 b=aclZeI3FQGyDBtxez7Nc+1EPgJ3mUykLcwwvnfQnGR0Umghb/VXmnril10CpwHBmEv6+J/
 LpkdHOZ4WvB2T6cgeAMRNvR0iqd7z/31dP0YntRPcfAT8AZg6neq/W8lgdW9zrLMicHjHf
 S6WccVOSTvf67eGG+tie9Q1Xn01ZejM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-HW54wTcAOwmursid9Efmig-1; Thu, 10 Nov 2022 06:07:24 -0500
X-MC-Unique: HW54wTcAOwmursid9Efmig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE27A185A78B;
 Thu, 10 Nov 2022 11:07:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D000A40C83EF;
 Thu, 10 Nov 2022 11:07:22 +0000 (UTC)
Date: Thu, 10 Nov 2022 12:07:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/13] qed: Don't yield in bdrv_qed_co_drain_begin()
Message-ID: <Y2zbaa0HLoZV+8Uu@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-2-kwolf@redhat.com>
 <Y2wgVjPNC/dDHO3n@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7Jjw8aBsls0VFK4q"
Content-Disposition: inline
In-Reply-To: <Y2wgVjPNC/dDHO3n@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--7Jjw8aBsls0VFK4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 09.11.2022 um 22:49 hat Stefan Hajnoczi geschrieben:
> On Tue, Nov 08, 2022 at 01:37:26PM +0100, Kevin Wolf wrote:
> > @@ -310,9 +309,20 @@ static void coroutine_fn qed_need_check_timer_entr=
y(void *opaque)
> >      (void) ret;
> >  }
> > =20
> > +static void coroutine_fn qed_need_check_timer_entry(void *opaque)
> > +{
> > +    BDRVQEDState *s =3D opaque;
> > +
> > +    qed_need_check_timer(opaque);
> > +    bdrv_dec_in_flight(s->bs);
> > +}
> > +
> >  static void qed_need_check_timer_cb(void *opaque)
> >  {
> > +    BDRVQEDState *s =3D opaque;
> >      Coroutine *co =3D qemu_coroutine_create(qed_need_check_timer_entry=
, opaque);
> > +
> > +    bdrv_inc_in_flight(s->bs);
> >      qemu_coroutine_enter(co);
> >  }
> > =20
> > @@ -363,8 +373,12 @@ static void coroutine_fn bdrv_qed_co_drain_begin(B=
lockDriverState *bs)
> >       * header is flushed.
> >       */
> >      if (s->need_check_timer && timer_pending(s->need_check_timer)) {
> > +        Coroutine *co;
> > +
> >          qed_cancel_need_check_timer(s);
> > -        qed_need_check_timer_entry(s);
> > +        co =3D qemu_coroutine_create(qed_need_check_timer_entry, s);
> > +        bdrv_inc_in_flight(bs);
>=20
> Please include comments that indicate where inc/dec are paired. This is
> like pairing memory barriers where it can be very hard to know after the
> code has been written (and modified).

I can do this, of course, if you like to have it in qed. However, it's
not something we're doing elsewhere.

bdrv_inc/dec_in_flight() are a lot simpler than barriers which
synchronise two completely independently running tasks. You just need to
follow the control flow from the inc() and you'll find the dec(). They
are much more similar to taking and releasing a lock than to barriers.

Callbacks always make the code a little harder to read, but personally I
think inc() before scheduling a new coroutine and then dec() at the end
of its entry function is a very obvious pattern that exists in other
places, too.

Kevin

--7Jjw8aBsls0VFK4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmNs22kACgkQfwmycsiP
L9bVJw//UxUAo5S2xMB/s3cpVo4oQjELbcnQuWzaI9pcfC2+l2Qe1MWEfDUr0F8M
L45B3QmHOxTuSzknvN2PJMFI7/I764aI02ToOZ68tt8NVjvOXr4VTK+cpe/DBOv2
WuCUB7uw/Vy/Ykhb7lCN4era73CgQzNZmCn6JE6HRBCxY51AcJ1FzGI+pxOkLkBD
6sbfc8WyCEZmb3mtzdueTKaW7hXIGPjIMHPEArcg53L1qy/mPanla5ABdwhtdK3t
4Or8WHw21TbcMdbYMdk02vtPo7XR3MAAvGfu90smXy0A1IVVEfUZHEn58xwVAQSl
gpY5HKh7ltOvbBs40lcIZWO18JYTyCB402uEqZsLI4JI5TtLpL2G/OgNrFDI3/Xo
IiVTBf5frl2u+EhoVfGZD8mkaYA51HK7/GIzNFhYKgrT3jW/ESwvQUYhy4c3kiEM
7VOxAVEJV66Giptcg+gb3P0dV/S/SXWd7ZjpBJMea7tmHubssYMQBS0+c9gGFh93
R0T64Z6x5i939/Rd9HVv+w+2wKIMI1p8/Kturg+RNkk8aPkc9xbCoDxz1XnymBJb
IwtSr5rkGOGV214Jn1hk+keb036Yk1Ph7l5kFnPiTue0NJznU4dRtWIt2m2GXC8m
3zfAQuO3OvYfi07zYM6cs1D0zk3I76CtaVvzl1msD0SSaZhlekI=
=4T1F
-----END PGP SIGNATURE-----

--7Jjw8aBsls0VFK4q--


