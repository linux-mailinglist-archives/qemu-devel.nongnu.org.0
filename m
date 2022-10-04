Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F095F42E5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:25:46 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofgzY-0000R4-8r
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1ofgvv-0006cW-FI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1ofgvs-0004kD-4Q
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664886114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2b/W95oF6/5e7Er18V5+xTHFDdQt9Lq2WRndIzs79Y=;
 b=DjDtcYcLnlw+MxLixuLuNtwEUJ9fcZfulB1Le8gFTlFKb5Hh0I3fQ3QMmH4vl3fJrbGcvV
 1Rik0pKaGKgWsz1LGeaoPyNmSFiyr5dtlUwRQzHeED/0Do9TL4ikJyqrfs94kVB/joWDz7
 VkDAaNMSwWSY+bGPHDkNBQlRZHUcWEk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-6X5qkdCQOeeMO5Nk9bwhdA-1; Tue, 04 Oct 2022 08:21:51 -0400
X-MC-Unique: 6X5qkdCQOeeMO5Nk9bwhdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21B538027ED
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 12:21:51 +0000 (UTC)
Received: from localhost (unknown [10.40.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF37A1121314;
 Tue,  4 Oct 2022 12:21:50 +0000 (UTC)
Date: Tue, 4 Oct 2022 14:21:49 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com
Subject: Re: [PATCH] Revert "qapi: fix examples of blockdev-add with qcow2"
Message-ID: <20221004122149.6aj67n2gwxa6m26u@tapioca>
References: <20220930171908.846769-1-armbru@redhat.com>
 <20221004081317.m7zewxcqbwabntkr@tapioca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5xjaklhyi3a4xitr"
Content-Disposition: inline
In-Reply-To: <20221004081317.m7zewxcqbwabntkr@tapioca>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5xjaklhyi3a4xitr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 04, 2022 at 10:13:17AM +0200, Victor Toso wrote:
> Hi,
>=20
> Sorry taking some time to reply.
>=20
> On Fri, Sep 30, 2022 at 07:19:08PM +0200, Markus Armbruster wrote:
> > This reverts commit b6522938327141235b97ab38e40c6c4512587373.
>=20
> Which is:
> ```
>   qapi: fix examples of blockdev-add with qcow2
>=20
>   The examples use "qcow2" driver with the wrong member name for
>   BlockdevRef alternate type. This patch changes all wrong member names
>   from "file" to "data-file" which is the correct member name in
>   BlockdevOptionsQcow2 for the BlockdevRef field.
>=20
>   Problem was noticed when using the example as a test case for Go
>   bindings.
> ```
>=20
> > Kevin Wolf NAKed this patch, because:
> >
> >     'file' is a required member (defined in BlockdevOptionsGenericForma=
t),
> >     removing it makes the example invalid. 'data-file' is only an addit=
ional
> >     optional member to be used for external data files (i.e. when the g=
uest
> >     data is kept separate from the metadata in the .qcow2 file).
>=20
> You are correct. I apologize for the mistake. I trusted a bit too
> much on the Go bindings and didn't realize that @file member was
> actually present:
>     @BlockdevOptionsQcow2 >
>     @BlockdevOptionsGenericCOWFormat >
>     @BlockdevOptionsGenericCOWFormat >
>     @BlockdevOptionsGenericFormat
>=20
> > However, it had already been merged then.  Revert.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Acked-by: Victor Toso <victortoso@redhat.com>

Just realized, this should have been a reviewed-by ...

> > ---
> >  qapi/block-core.json | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index f21fa235f2..882b266532 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -1541,8 +1541,8 @@
> >  # -> { "execute": "blockdev-add",
> >  #      "arguments": { "driver": "qcow2",
> >  #                     "node-name": "node1534",
> > -#                     "data-file": { "driver": "file",
> > -#                                    "filename": "hd1.qcow2" },
> > +#                     "file": { "driver": "file",
> > +#                               "filename": "hd1.qcow2" },
> >  #                     "backing": null } }
> >  #
> >  # <- { "return": {} }
> > @@ -4378,7 +4378,7 @@
> >  #      "arguments": {
> >  #           "driver": "qcow2",
> >  #           "node-name": "test1",
> > -#           "data-file": {
> > +#           "file": {
> >  #               "driver": "file",
> >  #               "filename": "test.qcow2"
> >  #            }
> > @@ -4395,7 +4395,7 @@
> >  #           "cache": {
> >  #              "direct": true
> >  #            },
> > -#           "data-file": {
> > +#            "file": {
> >  #              "driver": "file",
> >  #              "filename": "/tmp/test.qcow2"
> >  #            },
> > @@ -4477,7 +4477,7 @@
> >  #      "arguments": {
> >  #           "driver": "qcow2",
> >  #           "node-name": "node0",
> > -#           "data-file": {
> > +#           "file": {
> >  #               "driver": "file",
> >  #               "filename": "test.qcow2"
> >  #           }
> > --=20
> > 2.37.2
> >=20



--5xjaklhyi3a4xitr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmM8JV0ACgkQl9kSPeN6
SE9Qlw/+MhC8uVU9IroFwikDym9COMBj7s1IPr6bTOIKbVmtiGxgZoziF/sHxtm4
qee0PsB7GPxrV+hFOb1OWIxL2sO1PrAQ35yE8ADZkehsLZ6MWVzcArwbmXjTrIqC
/XoT8IjiBb32IX7xYKv4HE+7CvJwc/Cv1l6HMbBx1CRiiQ001Z/mTF6B2P+7/d+T
iEqLMnzrmBMsDgTq62T1dlhb1SMtlruxNi1q0bgCZldCt8kLg/sg3PNADIEL8kG4
pvcNv7EUQm2tgz+9HXhPAVjYm+JNZtythpB+9Ul5nGfaPLolbmtAog82hZANabTY
XjbN+/hx7PkFkIGv37u2S1T8FWKjs4p7syNGfmISDS0l1s4mTbw4ChZfKknJq1kA
KJHS/G90p11wMbF4BlET1xFPu8FcH/8c2k+mTPk+d1xwLxMj64W9sYJKTgwKwvjB
KTpmz1W3pR/y4BY2WRdyXENpmtYh5uVToV+V5l1Kb6Ko9c7xMP5dycrqSwRE6vUp
iw4pHf/l9H0kvvqGwWhkryhrDzOq8UsT5DvV7eMpZXf9NauqX0matC7SWlQ6dEmk
cBK1o5Ohx7U1xtUdTFb0Vzzn1nlndHajKAMONbnK+GnV0Eq6BaMcAA3miNqhBHkh
8L7Yiap2L50lAnJt0DOb+u5IUyPBHFbtEvs1VjgBCjSy+K6PjEA=
=KdSk
-----END PGP SIGNATURE-----

--5xjaklhyi3a4xitr--


