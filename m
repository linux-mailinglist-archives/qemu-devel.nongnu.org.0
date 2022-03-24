Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC44E66C8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 17:15:21 +0100 (CET)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXQ7M-0000G4-EV
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 12:15:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXPyF-00014C-Rl
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 12:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXPyC-0001Ht-CE
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 12:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648137951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qk+IN1Z3PKQSmSQOiWae3wFT0NXglU2+B8Iwc3vuBEo=;
 b=BVr52EUS8/l8rU5V42vO44gDYFygVIEJMMNCR/W5WjvINk0FWWDQA3bE9PvrA+2nMCeSrv
 565jkyKSRvpOG5iW3t/ftyrGSs2ZYKxYu/tEgKjT4FIyr/UNbPrvnOpNlLlR2g7Vviejvx
 hYPJdS8vWuqtYy9zfcPGr54vkAobQRY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-icFaaprBOH-TvM_YVNnDTA-1; Thu, 24 Mar 2022 12:05:49 -0400
X-MC-Unique: icFaaprBOH-TvM_YVNnDTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2092238035B3;
 Thu, 24 Mar 2022 16:05:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1FBA4010E58;
 Thu, 24 Mar 2022 16:05:48 +0000 (UTC)
Date: Thu, 24 Mar 2022 16:05:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] iotests: update test owner contact information
Message-ID: <YjyW21T/i7s3TnPu@stefanha-x1.localdomain>
References: <20220322174212.1169630-1-jsnow@redhat.com>
 <51806099-c55d-ce5e-ae3f-e1609c8a92e5@redhat.com>
 <993fb20b-0445-037b-e6a5-f13a48f9db4f@redhat.com>
 <YjxJsSRRk1kBzwz9@stefanha-x1.localdomain>
 <f0727d57-74e2-31b3-a89e-20ee636cfa0a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+1q1IzL9LH94bz2h"
Content-Disposition: inline
In-Reply-To: <f0727d57-74e2-31b3-a89e-20ee636cfa0a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+1q1IzL9LH94bz2h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 12:08:20PM +0100, Hanna Reitz wrote:
> On 24.03.22 11:36, Stefan Hajnoczi wrote:
> > On Wed, Mar 23, 2022 at 01:10:19PM +0100, Hanna Reitz wrote:
> > > On 23.03.22 09:39, Thomas Huth wrote:
> > > > On 22/03/2022 18.42, John Snow wrote:
> > > > > Quite a few of these tests have stale contact information. This p=
atch
> > > > > updates the stale ones that I happen to be aware of at the moment.
> > > > >=20
> > > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > > ---
> > > > >  =C2=A0 tests/qemu-iotests/025 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/027 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/028 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/036 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/039 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/059 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/060 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/061 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/062 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/064 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/066 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/068 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/069 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/070 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/071 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/072 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/074 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/084 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/085 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/089 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/090 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/091 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/094 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/095 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/097 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/098 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/099 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/102 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/103 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/105 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/106 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/107 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/108 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/110 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/111 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/112 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/113 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/115 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/117 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/119 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/120 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/121 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/123 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/125 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/126 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/127 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/135 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/138 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/140 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/141 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/143 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/144 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/146 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/150 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/153 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/156 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/162 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/173 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/176 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/182 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/192 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/200 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/216 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/218 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/224 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/225 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/228 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/229 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/231 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/250 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/251 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/252 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/258 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/259 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/261 | 2 +-
> > > > >  =C2=A0 tests/qemu-iotests/310 | 2 +-
> > > > >  =C2=A0 76 files changed, 76 insertions(+), 76 deletions(-)
> > > > >=20
> > > > > diff --git a/tests/qemu-iotests/025 b/tests/qemu-iotests/025
> > > > > index 80686a30d5..5771ea9200 100755
> > > > > --- a/tests/qemu-iotests/025
> > > > > +++ b/tests/qemu-iotests/025
> > > > > @@ -20,7 +20,7 @@
> > > > >  =C2=A0 #
> > > > >  =C2=A0 =C2=A0 # creator
> > > > > -owner=3Dstefanha@linux.vnet.ibm.com
> > > > > +owner=3Dstefanha@redhat.com
> > > > Wow, these were really old ones ... I wonder whether these "owner" =
lines
> > > > really still make that much sense if they are neglected that much, =
or
> > > > whether the information should maybe rather be captured in MAINTAIN=
ERS
> > > > instead?
> > > Or maybe we should just drop the whole concept of ownership in the io=
tests
> > > altogether, I can=E2=80=99t remember it ever coming up.=C2=A0 If a te=
st fails, it never
> > > mattered to me who the =E2=80=9Cowner=E2=80=9D is, I just did my best=
 to fix it myself,
> > > usually.=C2=A0 If I couldn=E2=80=99t, I used git-blame to figure out =
who to ask, because
> > > tests tend to be written by multiple people anyway.
> > >=20
> > > Anyway, that=E2=80=99d be more difficult, I suppose, because dropping=
 ownership
> > > information would (I guess) require consent from everyone, so this is
> > > simpler for now.
> > >=20
> > > Thanks for the patch, I=E2=80=99ve applied it to my block branch:
> > >=20
> > > https://gitlab.com/hreitz/qemu/-/commits/block
> > For the record:
> > I'm happy fro my @linux.vnet.ibm.com email address to be removed or
> > replaced since the address is no longer in use. IBM copyright needs to
> > be kept.
>=20
> Absolutely.=C2=A0 I just don=E2=80=99t think putting actual contact info =
into each test
> is helpful; or at least less helpful then what git-blame + .mailmap
> provides.

I agree.

Stefan

--+1q1IzL9LH94bz2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI8ltsACgkQnKSrs4Gr
c8g6Qgf9Eoc+ErWGPanujhC9UQKpAVQrqV/kHNBUz2Y96MIZZUdXLUMlA1gmuJa/
ynzCCKarfb079k5/16Ukkp7pT9hzsFrdMtI4u0kjQz9Bgk88huAAhYvN5ExQ01qo
jHBO7BJ4VjTzcA5WHxEKJpoyIRJ6Oqbu3BUCvt6QIzRSP/Y6cByIHswN0KyJv/63
fc63abY+08u6qpBkJtGvbVdo7zA77SDohGIgGSX0T5hihetaS2BygTEl0r8Z5bP5
StHjNpOL5tmROBsF+nGMpKzWhrmjbQy/rOdmHeCQF1Lfl7cavMZIxdemEQJOpPEJ
qVDFAykKQMEab1p6LUyPbtBYNZv30A==
=JKV9
-----END PGP SIGNATURE-----

--+1q1IzL9LH94bz2h--


