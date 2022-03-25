Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0724E7AAD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:36:54 +0100 (CET)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqg1-00016v-6S
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:36:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXqex-0000Pm-6C
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:35:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXqet-0006OQ-TR
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648240542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hioLCCijNCx7vhve/MfYAB0JawI4oeOPMfiSdAfcbKY=;
 b=jQQZZoGvBfQYajie2sLaRzMlO6atdhwwK8Z76Wov4BAA5HG/iOSz2weZZGs11dIYl96fW0
 E7C2eptBdWHbWaDWaJ+gBz6QneOlatWSxv+CPtINglioqwO94/1OfMdacmCnSwAENmNsmA
 cRErPrHLyr6E7wDyJuHNKqI8HSRmOEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-Lvbm_l6gNAOBjtJB9xzYEw-1; Fri, 25 Mar 2022 16:35:40 -0400
X-MC-Unique: Lvbm_l6gNAOBjtJB9xzYEw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32B3A185A79C
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:35:40 +0000 (UTC)
Received: from localhost (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEB06401E96;
 Fri, 25 Mar 2022 20:35:39 +0000 (UTC)
Date: Fri, 25 Mar 2022 21:35:38 +0100
From: Victor Toso <victortoso@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/14] qapi: BlockExportRemoveMode: move comments to TODO
Message-ID: <20220325203538.eztswc6fj6we26ef@tapioca>
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com>
 <CAFn=p-aMfoxMn7ZUT1ZK4ifP6J-1PB4nj+74BM2OwAxnWKWX7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3o4nduxcqgo2lova"
Content-Disposition: inline
In-Reply-To: <CAFn=p-aMfoxMn7ZUT1ZK4ifP6J-1PB4nj+74BM2OwAxnWKWX7Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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


--3o4nduxcqgo2lova
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Many thanks for the quick review!

On Thu, Mar 24, 2022 at 04:34:42PM -0400, John Snow wrote:
> On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
> >
> > @hide and @soft are potential additions which fits the TODO section
> > perfectly.
> >
> > The main motivation is to avoid this whole block of comment entering
> > the wrong section in the python parser.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/block-export.json | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/qapi/block-export.json b/qapi/block-export.json
> > index f183522d0d..1e34927f85 100644
> > --- a/qapi/block-export.json
> > +++ b/qapi/block-export.json
> > @@ -219,13 +219,13 @@
> >  #
> >  # @hard: Drop all connections immediately and remove export.
> >  #
> > -# Potential additional modes to be added in the future:
> > +# TODO: Potential additional modes to be added in the future:
> >  #
> > -# hide: Just hide export from new clients, leave existing connections =
as is.
> > -# Remove export after all clients are disconnected.
> > +#       hide: Just hide export from new clients, leave existing connec=
tions as is.
> > +#       Remove export after all clients are disconnected.
> >  #
> > -# soft: Hide export from new clients, answer with ESHUTDOWN for all fu=
rther
> > -# requests from existing clients.
> > +#       soft: Hide export from new clients, answer with ESHUTDOWN for =
all further
> > +#       requests from existing clients.
> >  #
> >  # Since: 2.12
> >  ##
> > --
> > 2.35.1
> >
>=20
> Does this help with something in particular? (Got an example for me?)

I'm working on a Golang interface and I'm using the QAPI
documentation to document the Go's types of the QAPI spec. For this
kind of documentation, documentation related to future development
can be excluded. This patch helps me filter it out :)

Example:

  $ cd qemu/scripts && python
  >>> from qapi.schema import QAPISchema
  >>> schema =3D QAPISchema('../qapi/qapi-schema.json')

  # Without this patch, the 'Potential additional modes' doc is
  # under no specific named Section.
  >>> for s in schema._entity_dict['BlockExportRemoveMode'].doc.sections:
  ...     pprint(vars(s))
  ...
  {'_indent': 0,
   '_parser': <qapi.parser.QAPISchemaParser object at 0x7f4fcf854760>,
   'name': None,
   'text': 'Potential additional modes to be added in the future:\n'
           '\n'
           'hide: Just hide export from new clients, leave existing connect=
ions '
           'as is.\n'
           'Remove export after all clients are disconnected.\n'
           '\n'
           'soft: Hide export from new clients, answer with ESHUTDOWN for a=
ll '
           'further\n'
           'requests from existing clients.'}
   {'_indent': 7,
   '_parser': <qapi.parser.QAPISchemaParser object at 0x7f4fcf854760>,
   'name': 'Since',
   'text': '2.12'}

  # With this patch, we can filter out TODO section
  >>> pprint(schema._entity_dict['BlockExportRemoveMode'].doc.sections[0]))
  {'_indent': 6,
   '_parser': <qapi.parser.QAPISchemaParser object at 0x7f228d97e950>,
   'name': 'TODO',
   'text': 'Potential additional modes to be added in the future:\n'
           '\n'
           'hide: Just hide export from new clients, leave existing connect=
ions '
           'as is.\n'
           'Remove export after all clients are disconnected.\n'
           '\n'
           'soft: Hide export from new clients, answer with ESHUTDOWN for a=
ll '
           'further\n'
           'requests from existing clients.'}

Cheers,
Victor

--3o4nduxcqgo2lova
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmI+J5oACgkQl9kSPeN6
SE8U3Q//bnYEliHBLvp/feDwgBaa+qVIkt2UBGg/AHGVoEiWqmMXbVRuymnDw0PI
EKSnhTuLp0VtkpVKr5JeFxCOUTy3PnXMv5o+75WCxcXB/fdw/p2woVktZg1R5+pU
1mSo7kEGJ3F4sJ7PqNJfXlleGSLmX42lneuEuH2e4HIIceQ+xJlhNuyIar+Rlc5r
zowPpUsG+h6DFi2wNCgePi7wm9ihyaWZKM1x8uL+Vdd2dYD7bTrIlOhk84uIJnm9
OuufXk2JgvAtfZJOSc5E0MudFk0yxJpdPclMHFs4ozB3SBn2MSBfVjXX+sXPGGBO
bsGtmyXzF4yLsa+lfDLBp48KWmvv5IKUItpPehhiiOh/Z7kWbnDLc6+AzVYZVaaP
dyb2txjwwErZidtWlww9DdGbZWEbsQN7jrj0PPhUvsiwmF/7bD317tMRa2k3G73G
pW+22NpPTQwrxtyju8QXG7lCbm++E73RHexI1N+F0ADgcGkyBndUuOsLdRIrUcxi
ZTNWOGiTCKKFNcSiLoZI/MGbhh0e1Nu0W/tmTyr5Pht6oawcFXqeWAN2dtU2SlDP
z7kNmRunDa0HKqmkwlXVq0kFiccVIfIM3bT4GxEwqMiuwR2rsyZQ3AITUu3dMkzr
H89A4ftzB7TLRkYz71Ao3pvRZ44Ojdvu7XHSUmNkBWc25lKpJsg=
=CA8B
-----END PGP SIGNATURE-----

--3o4nduxcqgo2lova--


