Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20245212C9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:52:49 +0200 (CEST)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNU0-0002L7-Um
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noNSB-0001C0-R3
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noNS9-0007Hj-Tv
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652179852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRO+4Rjv3aYfNKvMLFrfjPyL2eyrWvI7ELNvIEXypqo=;
 b=N0KLjpuU79Vr6ZqaHiIUwjTKeAxq3tV+RmK52RQ3n9R5Mehrnq/AxCEkUhR57c4RnaJI5h
 maGaO5HalwHGRUk1MUYMQx+j1//ynXYiwH+abTq8iDSgT5r4X0UhYuIvuhCwmSTRsHpRJN
 wcpPfduvYg0FYlc0zqxG/6aQ+CPcmco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-Q8f2t7ZXMUOJBS2qOktWHg-1; Tue, 10 May 2022 06:50:49 -0400
X-MC-Unique: Q8f2t7ZXMUOJBS2qOktWHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4365F1C0F693
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:50:49 +0000 (UTC)
Received: from localhost (unknown [10.40.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E38BD1468F44;
 Tue, 10 May 2022 10:50:48 +0000 (UTC)
Date: Tue, 10 May 2022 12:50:47 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220510105047.jepitwuv64ammxox@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <20220510090604.ovqqybzyo6cebev7@tapioca>
 <Ynotu3ivXbZldduB@redhat.com> <YnoxQXWy9dQx9via@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jl4jerxzvnxamyo5"
Content-Disposition: inline
In-Reply-To: <YnoxQXWy9dQx9via@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jl4jerxzvnxamyo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 10:32:49AM +0100, Daniel P. Berrang=E9 wrote:
> On Tue, May 10, 2022 at 10:18:15AM +0100, Daniel P. Berrang=E9 wrote:
> > On Tue, May 10, 2022 at 11:06:39AM +0200, Victor Toso wrote:
> > > > > > generated code needs to be compatible with other Golang project=
s,
> > > > > > such as the ones mentioned above. My intention is to keep a Go
> > > > > > module with a MIT license.
> > > > >
> > > > > Meh.  Can't be helped, I guess.
> > > >=20
> > > > This does make me wonder though whether the license of the QAPI
> > > > input files has a bearing on the Go (or other $LANGUAGE) ouput
> > > > files. eg is the Go code to be considered a derived work of the
> > > > QAPI JSON files.
> > >=20
> > > GPL does not enforce that the generated code to be GPL [0] unless
> > > the generator copies GPL code to the output. My only concern has
> > > been the fact that I am copying the documentation of QAPI
> > > specification to the Go package in order to have data structures,
> > > commands, etc. with the information provided by the
> > > specification.
> > >=20
> > > [0] https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#GPLOut=
put
> > >
> > > > I'm not finding a clearly articulated POV on this question so
> > > > far.
> > >=20
> > > I don't find it trivial either but I've accepted that the Go data
> > > structures are fine based on [0] and the documentation can be
> > > split from the Go module (sadly!) if someone finds it to be a
> > > legal issue.
> >=20
> > Ah well that link above is actually reasonably clear:
> >=20
> >   "More generally, when a program translates its input into=20
> >    some other form, the copyright status of the output inherits
> >    that of the input it was generated from. "
> >=20
> > In our case the input is the QAPI JSON, and we're translating that
> > into  Golang. That could be read as meaning our Golang code has to
> > be GPLv2+ licensed just as with the QAPI, not merely the docs.
>=20
> Oh but I'm forgetting that QAPI JSON can be said to be our
> public API interface, and so while the docs text would be
> GPLv2+, we can claim fair use for the interface definition in
> the generator and pick an arbitrary output license.

Still, it explicit says in the section "In what cases is the
output of a GPL program covered by the GPL too?" is " Only when
the program copies part of itself into the output".

    https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#WhatCaseIsOu=
tputGPL

So, to my understating, even if we are consuming a GPLv2+ spec
with a GPLv2+ generator, the output does not need to be GPLv2+
too, unless we are *copying* parts of the input/generator into
the output - which is the case for the documentation only.

I'll raise this again with the my company's legal team to be
sure.

> We could likely deal with the docs problem by not copying the
> docs directly into the generated code, instead link to the
> published docs on qemu.org. This would require us to improve
> our current docs generated anchor generation. ie currently docs
> link for say the struct 'NumaNodeOptions' potentially changes
> every time we generate it
>=20
> https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#qapidoc-2416
>=20
> we would need to that be something stable, ie
>=20
> https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#struct-NumaNod=
eOptions
>=20
> Then the generated Go can just do
>=20
>    // See QAPI docs at https://www.qemu.org/docs/master/interop/qemu-qmp-=
ref.html#struct-NumaNodeOptions
>=20
> thus avoiding any copyright complication

Yes, but it would be quite sad solution. Documentation in Go is
bounded to the module source code and we would be making people
jump thorough links here.

I mean, if that's what we need to do, okay.

I'll keep thinking about alternatives.

Cheers,
Victor

--jl4jerxzvnxamyo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6Q4cACgkQl9kSPeN6
SE8QTg//e67ZXu9PJlxFlr6wz+FRwnYp074ZcC5LIRkc1WIthU4eJ4UUS4l0DTVb
+l8sKpUuFlynNwY6fvGcFr7CAxD37A4MQ4tcLoVzKEdzSxYprbEGEScb05WXE8Wz
3qVEIYthLKtALj+qFS9lSzXxhvMsculKM3VDvQ8zwOsEjbmYhnYbUJ9C3WeHJvIg
Vkua5VFI2wh8c4iYUng50bT79d2sJHJF1GUIjVTabWG2c+wwU2AsYusDLCrp++wj
Fd2tC7RGrWQ13b9RvIdi393lLyxEAoUZQAbq4QTZ/rS4gGFh+2Ks5mwnqjMTnAmf
7fTleofSsJF3+Fu9DXPFvZVW7tb5KFy6M7B9i6MmPeojoVpHcOF4u0K31XIcVB7I
8PE38/XFz38gVVt02iYPvB+jNhfIQhhi3QpfwDtSAhS9vCJ9R2MhW5qcj83BqDSH
NMqcycps7CB0Sr0wHGztJOPDLALVS066t6c7ht/ptMW341eJtW/QRpdy1ZJawphv
M18segka8wJlbGsvaYWSrE00/psKbR8hBq4HDoThrVv7bY9FEIi28vBFc9VkV/bX
xxaLOAd+x69FViplHNGhbT/O+/85Ru/dgOOe2AWsLC5DyiLiLsesBY6pkmtf9nk0
tKIz5yDLqvHV2f79Zd6VzhleK6/B/RlFOpF65076Vfki2tW52rA=
=RgdW
-----END PGP SIGNATURE-----

--jl4jerxzvnxamyo5--


