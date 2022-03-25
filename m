Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7924E7AB7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:48:39 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqrO-0004Ce-5D
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:48:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXqqL-0003UD-6a
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXqqI-0007wl-6J
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648241248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3GRUYVcKnSolHWumEhkuKl70P3FXVixU1PqpXMAXXbI=;
 b=B/8WzLiOCUgjRGzWpctFHRrolPD8G1tYlMw9/HZCT7f9FY+TyaG9diWyqI2iPb+MfivhTU
 SHTUlONRwdxU/mtaWt+UDwSco4ugYpK/8K0NOzyAyhT8q2FjIFW49UXyNxsvY9aDx8OGLM
 OEWkucTZt8owNG3S8Mqqi4i9yU6eCs4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-eu3PWsFAOn66Y4CBKzoZGg-1; Fri, 25 Mar 2022 16:47:26 -0400
X-MC-Unique: eu3PWsFAOn66Y4CBKzoZGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A256899EC2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:47:26 +0000 (UTC)
Received: from localhost (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC14F40C1438;
 Fri, 25 Mar 2022 20:47:25 +0000 (UTC)
Date: Fri, 25 Mar 2022 21:47:24 +0100
From: Victor Toso <victortoso@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/14] qapi: BlockExportRemoveMode: move comments to TODO
Message-ID: <20220325204724.g4utzgpmqk4skgm6@tapioca>
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com>
 <87tubmnrde.fsf@pond.sub.org>
 <CAFn=p-bS-at1xvCok2LZzXhgFtc14E-2GfTCZf6Se2Fm6Q6PWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3os2c27jzfjrwce3"
Content-Disposition: inline
In-Reply-To: <CAFn=p-bS-at1xvCok2LZzXhgFtc14E-2GfTCZf6Se2Fm6Q6PWA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3os2c27jzfjrwce3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 25, 2022 at 11:11:23AM -0400, John Snow wrote:
> On Fri, Mar 25, 2022, 8:33 AM Markus Armbruster <armbru@redhat.com> wrote:
>=20
> > Victor Toso <victortoso@redhat.com> writes:
> >
> > > @hide and @soft are potential additions which fits the TODO section
> > > perfectly.
> > >
> > > The main motivation is to avoid this whole block of comment entering
> > > the wrong section in the python parser.
> > >
> > > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > > ---
> > >  qapi/block-export.json | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/qapi/block-export.json b/qapi/block-export.json
> > > index f183522d0d..1e34927f85 100644
> > > --- a/qapi/block-export.json
> > > +++ b/qapi/block-export.json
> > > @@ -219,13 +219,13 @@
> > >  #
> > >  # @hard: Drop all connections immediately and remove export.
> > >  #
> > > -# Potential additional modes to be added in the future:
> > > +# TODO: Potential additional modes to be added in the future:
> > >  #
> > > -# hide: Just hide export from new clients, leave existing connections
> > as is.
> > > -# Remove export after all clients are disconnected.
> > > +#       hide: Just hide export from new clients, leave existing
> > connections as is.
> > > +#       Remove export after all clients are disconnected.
> > >  #
> > > -# soft: Hide export from new clients, answer with ESHUTDOWN for all
> > further
> > > -# requests from existing clients.
> > > +#       soft: Hide export from new clients, answer with ESHUTDOWN for
> > all further
> > > +#       requests from existing clients.
> > >  #
> > >  # Since: 2.12
> > >  ##
> >
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks,

> > Doc comments embed user documentation in the source code.  The doc
> > generator extracts it.
> >
> > TODOs are generally for developers.  Should the doc generator suppress
> > TODO sections?
>=20
> Needs an audit to make sure we're using it consistently with
> that semantic, but broadly it's probably a good idea to squelch
> "internal" todos, yes.
>=20
> Things like "Watch out, were definitely gonna deprecate this
> soon probably maybe!" can stay outside of the TODO section.
> (Sometimes heads up are legitimate, even if most won't read
> them. the faithful and diligent will be rewarded with painless
> upgrades.)

There are 5 TODO sections in QAPI (including this patch):

 qapi/block-export.json:222:# TODO: Potential additional modes to be added =
in the future:
 qapi/introspect.json:300:# TODO: @success-response (currently irrelevant, =
because it's QGA, not QMP)
 qapi/machine.json:913:# TODO: Better documentation; currently there is non=
e.
 qapi/migration.json:933:# TODO either fuse back into MigrationParameters, =
or make
 qapi/qdev.json:70:# TODO: This command effectively bypasses QAPI completel=
y due to its

I think their usage is a bit broad but helpful.

> Anyway, if Markus is happy with this change, I am too, I was
> just curious to know if there were bigger cleanups to do here
> and what the impact was.

I'll let you know if I find more :)

> Anyway:
>=20
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks! I'll send a v2 later with all suggestions.

Cheers,
Victor

--3os2c27jzfjrwce3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmI+KlwACgkQl9kSPeN6
SE9wFRAAt1un+svSOPMucg9UOKS8a1WLBcXF/qemcKR6OkpnfTPrirV9/5myJAcQ
hlym7/3c2d6aurHj/YK0CRilKQCAO/a81RdAMXw3EbDy3DKHDN3FLW30UEUd39s8
XAFyRYcrjcUTYEC8Z7UZLr4hF9/9pZ23C48MO7haRcBWk3TPN2FXhQiAU+MSKMZ1
kiONvt0xB64C7hrt3deXX4/67ysAm2tff5Y4oqCTrfwTyRFR/mt8Guc6McfvMr+9
AdzxaV8RuchISpy/VJATfqBye9URBJUv4jp7aFqGu+6+VCwy51iXNWBkbBxooFm3
r6a7ffax1UiTlr/n5Jo+Wu57FAIlBU9UbJDZw1v8LGyc59vo4SHk3/93vvpT5bFe
Vn6iABg9qPbqvQ4nsDsesy5D+U4DYGXdhI8HWriKZmAuPxOKRAf7/wUauoCHdQAz
YOe496bRHA72fQZTSEC/JozI+k/Pvpf7peipBGtGslLMx/q9I8n3C1mRLxi3IGyJ
zxw8pDfwd9ztP3IlxgIx8ZM10BMYMwsGMkOGXJO1Frl6CU4eXqUZwKhEF5/L1F9m
oP9/kDxthF5oCtkWuE4oFL/tOhs8tBYceK7i6mshGr+Z3Cs6Ks7tdZbK+QeEEK9E
kaV0qJfRta79w/g6yhzWqcF+9saICqeP4VmSP3pNrzRIvalob/o=
=5rm8
-----END PGP SIGNATURE-----

--3os2c27jzfjrwce3--


