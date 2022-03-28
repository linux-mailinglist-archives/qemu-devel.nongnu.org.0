Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE54E90C7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:09:05 +0200 (CEST)
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlN2-0008C7-UC
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:09:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYlKn-0006sW-B1
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYlKl-00064i-M4
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648458403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTTqWVqFzUzZ8EEB1q6hVy5YoeKgDoDYRodZSdn/SQs=;
 b=M8Q6WvwG1bUdFn/duwWiUFkoJQcnPg5vuR31iq/16dwojfrraSQWN2HA670jspzT/4ss8+
 Mjl5wcUGlgXokMHzGMmCewkVi+0Ov239fu++Nqd2TJD55rIMew1gpphL3DSNOjRnhbtAyp
 iMyatF1hCTv4Pqg3tKexcsdl3tkx+nk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-EK2KqHsPMuedb62VuOnqoQ-1; Mon, 28 Mar 2022 05:06:41 -0400
X-MC-Unique: EK2KqHsPMuedb62VuOnqoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 317E1101AA42
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 09:06:40 +0000 (UTC)
Received: from localhost (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 860462166B46;
 Mon, 28 Mar 2022 09:06:36 +0000 (UTC)
Date: Mon, 28 Mar 2022 11:06:35 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
Message-ID: <20220328090635.asa3jcwxdapt4f6s@tapioca>
References: <20220325220707.52118-1-victortoso@redhat.com>
 <20220325220707.52118-3-victortoso@redhat.com>
 <87czi6bgoe.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hhcswlo7hnbawwic"
Content-Disposition: inline
In-Reply-To: <87czi6bgoe.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--hhcswlo7hnbawwic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 28, 2022 at 10:54:41AM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Fatal is not optional.
>=20
> Recognizing that "Fatal" refers to member "fatal" takes mental
> effort.  Always use identifiers verbatim, including case.
> Where that makes for confusing prose, prefix with a @ like
> @fatal, or rephrase, like "The
> member fatal".

That's true.

> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/block-core.json | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index e89f2dfb5b..63c30a5378 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -5006,10 +5006,9 @@
> >  # Example:
> >  #
> >  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
> > -#      "data": { "device": "ide0-hd0", "node-name": "node0",
> > -#                "msg": "Prevented active L1 table overwrite", "offset=
": 196608,
> > -#                "size": 65536 },
> > -#      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
> > +#      "data": { "device": "", "node-name": "drive", "fatal": false,
> > +#                "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 inde=
x: 0)" },
> > +#      "timestamp": { "seconds": 1648243240, "microseconds": 906060 } }
> >  #
> >  # Since: 1.7
> >  ##
>=20
> Changing the value of @msg makes sense, but is worth a note in the
> commit message.
>=20
> Here's my try:
>=20
>     qapi: fix example of BLOCK_IMAGE_CORRUPTED event
>=20
>     Example output lacks mandatory member @fatal.  Provide it.
>=20
>     Example output shows a value of @msg no version of the code
>     produces.  No big deal, but replace it anyway by one that today's
>     code does produce.
>=20
> How do you like it?

I agree. I'll be more careful in near future. Thanks for the
suggestion. I've submit a v2.1 of this patch.

Cheers,
Victor

--hhcswlo7hnbawwic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJBepoACgkQl9kSPeN6
SE9eOw//W00T3L+wwkqyZPeLQA+n2h/dAobSh06IeXdIX/qykM5ZD9DYrLPs2f02
fRDo1eXcGwlkpbBxCQ5p5ZESkRByTvZWQ98Et9ZWAJM2l4g3oJLxwQ4xTvC/2aOc
ft2cxCdQRMzXqeFsqEeGLSKPIcbdDtg5ZfdRh2+Uu+bWVyF9xFx/1tCYA0FuHwm8
4w5TYaW1s4S/2R7rl6yU8RIxNkff9pgATi+1QCYOUBnEZfLY/tgXGxd3oql1nu/M
Zqn8Juo6BVohBWuI5lgfJp3JQny7NhEiJ04lVojauslGr3CS9eBo0jjmCj4y7c/Y
2wDuAg0ue+K+W4UIhU0ZY1a5Fney4m5LBPGot1dhJFkDhitS9VJjDqQILu2rNUcD
AKHgWkthbB5MTUHOgbIj1K2YsAEFhQrBgGAVt0MNDpkj0OkGXu+4dmKEGrLAENNh
sqAKddDb4Yw0OhxVOmWqpdNs+RmiOQcFJWwIUHmHsxU/Ok/M8j3hk+uKavURu8wd
LrJTDzoJsbKx0Y6/RCTghGmrdmrBI6VsL82YgMb98aXivLqARgE7Q3AWw/tV6+ID
LRO/HRUKs2NTDqEjIl4CeZ9NOTqYEBDHrIitgNnq+qXESK6s/P/VOzAvCpFZIG9A
cr5QqMJvyj3lTYQI3MGG31Eoca5AvXpwbcSRJLcpzCf1uvBP0ME=
=Qm+c
-----END PGP SIGNATURE-----

--hhcswlo7hnbawwic--


