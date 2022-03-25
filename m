Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F74E7AB9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:53:15 +0100 (CET)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqvq-0006Bg-DM
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:53:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXqum-0005UR-TV
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXquk-0000GP-8Z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648241525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AauODokgmOf5ymr4ZGcBKjRnQ//b7Nm378ZqP4/bXU4=;
 b=SXq83b9Zf/KLqHwoTcBNaaTii/VUPxLFCKUxrOyvSc4kb1d4ZRdGyHMK38B7jblZIBeHIt
 BfrCbnXIa5QkdixwxQvCmAbKd7y4PZleMfiVTsydMJJdMXi1TJU1jVWVfR3+qsWa7+1WId
 +y7HPPqRYLSKSYqk/dUUHAS8iqJS6vU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-SDXiLGYqPCWMPrzQFSBIUA-1; Fri, 25 Mar 2022 16:52:03 -0400
X-MC-Unique: SDXiLGYqPCWMPrzQFSBIUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 487049219A2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:52:03 +0000 (UTC)
Received: from localhost (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7228C27D8A;
 Fri, 25 Mar 2022 20:52:01 +0000 (UTC)
Date: Fri, 25 Mar 2022 21:52:00 +0100
From: Victor Toso <victortoso@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 03/14] qapi: fix example of BLOCK_IO_ERROR event
Message-ID: <20220325205200.cvaufycz4qvviuuf@tapioca>
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-4-victortoso@redhat.com>
 <CAFn=p-ZAc3xB49KEYf2LOvUKFNVWq3C8EU-vbVpc9QdgAuMqqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="giiwsenl2vxp7qnn"
Content-Disposition: inline
In-Reply-To: <CAFn=p-ZAc3xB49KEYf2LOvUKFNVWq3C8EU-vbVpc9QdgAuMqqA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--giiwsenl2vxp7qnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 24, 2022 at 04:47:30PM -0400, John Snow wrote:
> On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
> >
> > Reason is not optional.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/block-core.json | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 585a9e020e..5b6c069dd9 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -5059,7 +5059,8 @@
> >  #      "data": { "device": "ide0-hd1",
> >  #                "node-name": "#block212",
> >  #                "operation": "write",
> > -#                "action": "stop" },
> > +#                "action": "stop",
> > +#                "reason": "Driver requires too large request alignmen=
t" },
> >  #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
> >  #
> >  ##
> > --
> > 2.35.1
> >
>=20
> We discourage people using the reason programmatically, but
> there will indeed be one. Where'd you pull the message out
> from?

I was looking into the block related errors and pick a string. It
wasn't a real error that I had.

> I see this:
>=20
> static void send_qmp_error_event(BlockBackend *blk,
>                                  BlockErrorAction action,
>                                  bool is_read, int error)
> {
>     IoOperationType optype;
>     BlockDriverState *bs =3D blk_bs(blk);
>=20
>     optype =3D is_read ? IO_OPERATION_TYPE_READ : IO_OPERATION_TYPE_WRITE;
>     qapi_event_send_block_io_error(blk_name(blk), !!bs,
>                                    bs ? bdrv_get_node_name(bs) : NULL, op=
type,
>                                    action, blk_iostatus_is_enabled(blk),
>                                    error =3D=3D ENOSPC, strerror(error));
> }
>=20
>=20
> so it should be one of the "standard" strerror messages, right?

Yep. I'll pick that one and use 'No space left on device'

Cheers,

--giiwsenl2vxp7qnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmI+K3AACgkQl9kSPeN6
SE87fg//ZabzAEf6EG42UzevcwRemfRBY5u753AKZRhVHccwVFwvYFrWr/vtVYCC
J4sP/3Pa0owOtteq3tUF5VWzJIVA8oTtGHGM2uVlSfQbgAh1cLDUj+Dq9tRdJsjo
DZmQKb9nrYc4PJPWTQcfrxDABvZJdNQtrw0MBfDbdPcb4uD60W/072xee6uy/yvc
TEgVuEpZCbaJgTLOvc35osK40mvy4+TbVtPbO+B4SPdHxHg6yqq1G1dYlOwzkfWN
Oa7ZT9RzZ7m8NxoCXLYwG34usuNX1cizfs/EKoVyRMtS+uGqWOtD1KxaPxVBE02x
k8QWRo8EXeHK0YoIRma+RLN6w3gtCqCXtG7fs29zGBWdbuvpQ8vug4eywOCTt8zH
BIWHruANDtVoy56FTRHCIHGCf+2go6N2IlH9LOaFpimvK65gl2T+QcDv5Pj24Yli
jk/UVoKj3MS1FD1HDis0Fo7r8eGY6kY9eg+zeEd2verML2zTkY3bHURAhWRjS8SH
aHjlGzvHcwbHbyphVL5mw//+C4TWzckLRemd25YwlNtMWQwnsIpEsms65Qz/ZkzQ
nVBZRL4e7R4cGKRkoGjFW+0pgsatI5wGtlXvVaR/RwZGayUctogQAdUQy6j8Uutw
3MXcOPslpSLq0zVUIp8nupYAUlsfhz9ZOOLU1dTC4RNyddm74io=
=Czx2
-----END PGP SIGNATURE-----

--giiwsenl2vxp7qnn--


