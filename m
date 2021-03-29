Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2EB34D53A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:35:39 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQura-00089L-B3
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQuoO-0006NT-PT
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQuoM-0004x6-Bm
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617035536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TD1IBNtw8m7q+Xp/jesD8d62QfTfc4Pt0r+cuMjHpmk=;
 b=HSXTBib1T6ALXXSHhJKCi79frj/z+M/lQuWns6AmIRBk8uxWTTJ5OMe/CHPIxbJwEur+G9
 OWJUUPp8ALIC+vfxNpO36UPw4aNq6ejNg2zPqsOrjXQ/Xzl9SoGou9B5nI6OTCHX6YugMz
 tCmh3Oq9plzYtN71zvGvvVMfwL9IStI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-wO3tXX4gM5-EACz4-Wxi1A-1; Mon, 29 Mar 2021 12:32:13 -0400
X-MC-Unique: wO3tXX4gM5-EACz4-Wxi1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D574108BD08
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 16:32:12 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C2F1001281;
 Mon, 29 Mar 2021 16:32:09 +0000 (UTC)
Date: Mon, 29 Mar 2021 17:32:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YGIBCERbt5G+ceoG@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiBRyV3DCMTWC+4@stefanha-x1.localdomain>
 <YFiDr7XEPyRudWEb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YFiDr7XEPyRudWEb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pptd3NtuuAz2pBeP"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pptd3NtuuAz2pBeP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 11:46:55AM +0000, Daniel P. Berrang=E9 wrote:
> On Mon, Mar 22, 2021 at 11:36:39AM +0000, Stefan Hajnoczi wrote:
> > On Mon, Feb 22, 2021 at 04:13:32PM +0100, Gerd Hoffmann wrote:
> > >   Hi,
> > >=20
> > > > > TODO:
> > > > > Enabling modular tracepoints via -trace cmd line doesn't work yet=
.
> > > > > Guess we need to store the list somewhere for later re-processing=
.
> > > > > Error handling is tricky, specifically the "tracepoint doesn't ex=
ist"
> > > > > error.  Suggestions / ideas are welcome.
> > > >=20
> > > > Two ideas:
> > > >=20
> > > > Global trace event name list
> > > > ----------------------------
> > > > Build *some* global information about all trace events, including
> > > > modules, into the main QEMU binary. For example, generate an array =
of
> > > > all trace event names so QEMU can always print an error if a
> > > > non-existent trace event name is used. (This is similar to the
> > > > trace-events-all file, which is a global list of all trace events.)
> > > >=20
> > > > Module name prefixes
> > > > --------------------
> > > > Allow an optional module/group prefix like qxl:my_trace_event. When=
 the
> > > > user says:
> > > >=20
> > > >   --trace qxl:my_trace_event
> > > >=20
> > > > QEMU knows that this trace event belongs to the "qxl" module/group.=
 It
> > > > will not attempt to load it until the qxl module registers itself.
> > > >=20
> > > > If "my_trace_event" doesn't exist in the qxl module:
> > > > 1. If the qxl module is not loaded we don't hit an error. Nevermind=
.
> > > > 2. When the qxl module is loaded pending events are resolved and an
> > > >    error is printed.
> > >=20
> > > Finally found the time to look at this again...=20
> > >=20
> > > So, we already have a "group".  Which is basically the sub-directory =
of
> > > the trace-events file right now, and it seems to be mostly a build sy=
stem
> > > thing.  We get many small lists instead of one huge, but there seems =
to
> > > be no other effect.  We could change that though, by giving each grou=
p
> > > an (optional?) prefix.
> >=20
> > Yes. This reminds me of an idea that was mentioned at the beginning of
> > this effort: maybe QEMU modules should always have their own directory
> > in the source tree instead of being alongside other source files that
> > are built into the main binary.
>=20
> This implies that each time we modularize something, we have to move
> its source code. It is possible,  but it wouldn't be by preferred
> choice.

If it bothers you then it probably bothers others too. Let's leave it.

> > > There also is a probe prefix, apparently used by dtrace only.  Not su=
re
> > > how to deal with that.  It prefix is qemu-<target-type>-<target-name>=
.
> > > Giving qemu modules its own dtrace prefix looks sensible to me.  That
> > > would probably something like "qemu-module-<name>".
> >=20
> > I think the DTrace prefix needs to be the same as the executable name,
> > but I'm not sure. I also don't know how that extends to shared librarie=
s
> > like QEMU modules. I'm afraid you would need to investigate the DTrace
> > prefix.
>=20
> I'm not aware of any requirement for dtrace prefix to match the
> executable name. We don't even have an executable called "qemu"
> so we're not matching even today.

Great, thanks for the other email reply where you showed how the
SystemTap tapsetsuse the prefix!

Stefan

--pptd3NtuuAz2pBeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiAQgACgkQnKSrs4Gr
c8jw1wgApN5UGP1de5KzLWMiRtZ0TKjJAjB5YthgDrPAxIA6Z29wAPz2oKI10Ue8
jeDuyRLfiVo8WoFQP49h4ksnPLLEQQcedCwqd5IsYFcP1FwFhK+MBEOZqMqxkXaj
WK9erexsh285HW5KPC2usY5wwHRvwmo3qbkkHI4Xbt2CIONi4+5nOIQ3+t8szCln
WAyNUJFHGuWX+PzJuCSwxF0J6Vo64wG2CsUIyJqjz/6xxpQAre/wopt+fI6AjPjq
j+5+cFtj6Wb+i/WSrfPLlH9BZCWkX8lnkAzkZbrT0KKO9zIInYuhpeGso4toJZXB
X3c0pC19zsqeFMMKJUoIOhzHqM2LMg==
=6zoV
-----END PGP SIGNATURE-----

--pptd3NtuuAz2pBeP--


