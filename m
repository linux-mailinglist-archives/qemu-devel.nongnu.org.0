Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E34EBEED
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:37:45 +0200 (CEST)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVhu-000795-Mm
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:37:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nZVMl-0004be-K5
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nZVMj-00007c-Vw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648635348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sWPMcJems7Ue7u8eStQSaCQh8ZmBaZEg4YvKVbY0k48=;
 b=i3iNqkO7wYrO3Um33FXlBsIWyTfUPYnHLBR6M5hHvQRcT3qo/WLaITqItsfDULIYN9j+jP
 e3VN9PIGzdTOaRsooWQ0gB2gdEElGDOxgkyKgEBS2O1kNdMTITKBliL5IVHbyk3Hl7xDIL
 LZiKyF4OjHlWuu8nQ1jXEUcCpRbtn4U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-Dt-pWhI-O4yXmpHXF-MFXQ-1; Wed, 30 Mar 2022 06:15:47 -0400
X-MC-Unique: Dt-pWhI-O4yXmpHXF-MFXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BAF93C0012F
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 10:15:46 +0000 (UTC)
Received: from localhost (unknown [10.40.193.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B40DC400E132;
 Wed, 30 Mar 2022 10:15:45 +0000 (UTC)
Date: Wed, 30 Mar 2022 12:15:44 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 11/14] qapi: fix example of MEMORY_FAILURE
Message-ID: <20220330101544.yhz4sy5d6fdzhwlo@tapioca>
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-12-victortoso@redhat.com>
 <87wngczrg0.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d6epvgfti66jfko3"
Content-Disposition: inline
In-Reply-To: <87wngczrg0.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--d6epvgfti66jfko3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 29, 2022 at 05:52:47PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Example output lacks mandatory member @timestamp.  Provide it.
> >
> > While @flags is an optional member,
>=20
> Uh, it isn't.

Wow! I was so sure I saw "*flags" before. Nice catch.

> >                                     if it is defined then all its
> > members should be include. For that reason, we add @recursive member.
>=20
> Perhaps:
>=20
>   Example output lacks mandatory member flags.recursive.  Provide it.
>=20
> Happy to make such a change in my tree.

Yes, many thanks!

> > Minor: Change quotes from '' to "" in @action-required member.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > Reviewed-by: John Snow <jsnow@redhat.com>
> > ---
> >  qapi/run-state.json | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > index 7f1c788c4e..8124220bd9 100644
> > --- a/qapi/run-state.json
> > +++ b/qapi/run-state.json
> > @@ -571,7 +571,9 @@
> >  # <- { "event": "MEMORY_FAILURE",
> >  #      "data": { "recipient": "hypervisor",
> >  #                "action": "fatal",
> > -#                "flags": { 'action-required': false } }
> > +#                "flags": { "action-required": false,
> > +#                           "recursive": false } },
> > +#      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
> >  #
> >  ##
> >  { 'event': 'MEMORY_FAILURE',
>=20
> With the commit message fixed:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Cheers,
Victor

--d6epvgfti66jfko3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJELdAACgkQl9kSPeN6
SE+LGxAAgDWyCLTWVqOP3MZT8FH/BlmDGCsjA0ThAirAkS2orkd4ISyMvcF84Hz8
+KnhkCFqiXnIzdg4tUXEA4znIy/jwv53fffDQdkvrtzWPkhSh1eXei8uHWwIhYRb
Z+k7BEw7PGp1UUmJ4xnxvfTFxcsq7lpGk8DW2cF9lZnY1rs8kbSSbOnlWFu9IR76
4cO7sfrnlG+RYlKvTIil9G2dPIxZ1/WvszkbDp25sgpDu9jWEZf52QLzUXYp91eu
nS7XFFdVvr7WUtg2xeyqvPHYXmMkSnwV1LwGcIt4jMqvCfgnYyWXQdmikFnbIws2
5smY8l81Qs2VLp8hg6PqHjiHeJ2Qps3dPCP/bi5V/6KfZAyEf0qhyLw5YdDi1hrE
wRiiA1otXKVIFZdhgin3n+/MirV1EfizMSKMrNSQFAdi84MnA8+uXNZfBzlM1UyP
wD5irMaVqiK5Te12uSdLn31ECL5mo/pj3NAZTjeA/mamnhRA1UDLSM+6tHUoaeXb
cSEbke4ZTt3ZyUBqPzbeqUyOq5mzk0KEVzzNEl5mYvLGGdjsYQP2p8e3gBz8HE46
8HZH6yy9MC2I7h5OcLPRayGoyofDcO+oYf/Z/iJEHyxDTw5r3I26oU5dUFSgXTxs
TkZ95liwQv7/1QI8zfizD2reHKFvL//sfHaEyB1bWgACxWn5znA=
=3dH7
-----END PGP SIGNATURE-----

--d6epvgfti66jfko3--


