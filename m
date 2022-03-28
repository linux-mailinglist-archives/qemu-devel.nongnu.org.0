Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472314E98BD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:51:43 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpmY-00033N-Cl
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:51:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYpLf-00056S-Pj
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 09:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYpKk-0006Uc-CZ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 09:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648473777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLCHOkqL2zGGYLKsnuStLUOTwa+Gph0NyUDIBBi/a+M=;
 b=g/n0fLGwjY4bvPnzw6DnSb+muPjffpJ+4BJ+ULRxSXsjyJ5N9MwVuCRdcQpcO7tqRpaT5N
 du+tFZ5GnjkF7mTFPIGFOUDGTfkdNn/A1S4pOnGLNTCncMfW8905Fa/+TYJQCb3WXNvtPX
 jlHWH6X6z14U9kCbI2SWsHXyAIh1TrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-_IqIoOVUPCyk6Gx0Vao4EQ-1; Mon, 28 Mar 2022 09:22:54 -0400
X-MC-Unique: _IqIoOVUPCyk6Gx0Vao4EQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47BDC185A7B2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:22:54 +0000 (UTC)
Received: from localhost (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA0FD76C4;
 Mon, 28 Mar 2022 13:22:53 +0000 (UTC)
Date: Mon, 28 Mar 2022 15:22:52 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
Message-ID: <20220328132252.teqjysvaw3t5holu@tapioca>
References: <20220325220707.52118-1-victortoso@redhat.com>
 <20220325220707.52118-3-victortoso@redhat.com>
 <87czi6bgoe.fsf@pond.sub.org>
 <20220328090635.asa3jcwxdapt4f6s@tapioca>
 <87ilry9ve9.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l3xcko4vtrnssvvo"
Content-Disposition: inline
In-Reply-To: <87ilry9ve9.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l3xcko4vtrnssvvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 28, 2022 at 01:19:42PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Hi,
> >
> > On Mon, Mar 28, 2022 at 10:54:41AM +0200, Markus Armbruster wrote:
> >> Victor Toso <victortoso@redhat.com> writes:
> >>=20
> >> > Fatal is not optional.
> >>=20
> >> Recognizing that "Fatal" refers to member "fatal" takes mental
> >> effort.  Always use identifiers verbatim, including case.
> >> Where that makes for confusing prose, prefix with a @ like
> >> @fatal, or rephrase, like "The
> >> member fatal".
> >
> > That's true.
> >
> >> >
> >> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> >> > ---
> >> >  qapi/block-core.json | 7 +++----
> >> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> >> > index e89f2dfb5b..63c30a5378 100644
> >> > --- a/qapi/block-core.json
> >> > +++ b/qapi/block-core.json
> >> > @@ -5006,10 +5006,9 @@
> >> >  # Example:
> >> >  #
> >> >  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
> >> > -#      "data": { "device": "ide0-hd0", "node-name": "node0",
> >> > -#                "msg": "Prevented active L1 table overwrite", "off=
set": 196608,
> >> > -#                "size": 65536 },
> >> > -#      "timestamp": { "seconds": 1378126126, "microseconds": 966463=
 } }
> >> > +#      "data": { "device": "", "node-name": "drive", "fatal": false,
> >> > +#                "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 i=
ndex: 0)" },
> >> > +#      "timestamp": { "seconds": 1648243240, "microseconds": 906060=
 } }
> >> >  #
> >> >  # Since: 1.7
> >> >  ##
> >>=20
> >> Changing the value of @msg makes sense, but is worth a note in the
> >> commit message.
> >>=20
> >> Here's my try:
> >>=20
> >>     qapi: fix example of BLOCK_IMAGE_CORRUPTED event
> >>=20
> >>     Example output lacks mandatory member @fatal.  Provide it.
> >>=20
> >>     Example output shows a value of @msg no version of the code
> >>     produces.  No big deal, but replace it anyway by one that today's
> >>     code does produce.
> >>=20
> >> How do you like it?
> >
> > I agree. I'll be more careful in near future. Thanks for the
> > suggestion. I've submit a v2.1 of this patch.
>=20
> That's okay.  Asking me to replace the commit message in my
> tree is also okay.
>=20
> PATCH 3's commit message could use the same treatment.  Would
> you like to go over all of them and respin?  Should be quick,
> no code changes.

Sure, I'll be sending a v3 and amend the commit messages where
your previous suggestions fits.  I'll add the changes in the
cover-letter to help identify them.

Cheers,

--l3xcko4vtrnssvvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJBtqwACgkQl9kSPeN6
SE8Y4RAAiZJnx2PZ3FMX1LN8asg1xygJ7jrR5WbXvmPU+t+OjiOMbs6XJyjD096b
wP7t4tfvtwgiMGHTwE0bB0XT/fTaysFp/fKMrhSP9SY3lywxGYR3zG9mWFznWT+/
f3LMN43CDNjUecLeuPfT0eLraKD7nUEGI3Z6jnxtnljDq5twmHDW1UUtDbMKWJHz
keMi20N1FiKsuCKxRh+U1jKmNTRqIUwyY/GkzrQ1r8a1dBIDCsJDjj8pO8J5QRRh
UFi0wBUfQozgBuSXYjFA1XaIMd7TuH6Dp/0sIXbMrrwi2UOFPy6GnMUYVIMLVmft
/cbQTo6WQaR9gsKPOBtGx5xgEPdbx4NeoPtpbUFx9hruTttV050sXmzssiKbk/yx
zf9QKeqo7L3i038RX/74AI4QBtiVAhfnWFwC6f+MJ+hZ4IMRiST75QjpVXs/vWup
3BcJahnOrY5Ft3zChnnDX2XQC6DNIREbZK44tMW2nGKFWJhdSP1Viq2uZwogm0de
0ISU2h0GuGfHx/VHUtbF3Ctp/AoZ672Qf4lpyo68rKszBjqwWFp6SBsfANYQLbAL
Jsupel7ktRMnfmWzgEAEY4dBMG+8fDNt+fCLeQhoNnsOpilEiorCHUW2aMQ9PDGO
773e9LRa7ptbCdvlBb/kqGocWVSb5H604jWDuCywfHQV6O9U0Vo=
=wIvT
-----END PGP SIGNATURE-----

--l3xcko4vtrnssvvo--


