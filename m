Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA6F93D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 14:49:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLSCT-0000QA-4D
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 08:49:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hLSAk-0008Dr-OA
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hLSAj-0002N3-GY
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:47:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hLSAj-0002K9-8U
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:47:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B1F13091783
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 12:47:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37FAB2B3AB;
	Tue, 30 Apr 2019 12:47:43 +0000 (UTC)
Date: Tue, 30 Apr 2019 13:47:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190430124740.GM6818@redhat.com>
References: <20190423212246.3542-1-ehabkost@redhat.com>
	<20190423212246.3542-2-ehabkost@redhat.com>
	<20190424082652.GC28615@redhat.com>
	<20190424182036.GH18406@habkost.net>
	<20190430101006.GA6818@redhat.com>
	<20190430124236.GC28722@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190430124236.GC28722@habkost.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 30 Apr 2019 12:47:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] qapi: SupportStatusInfo struct
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mprivozn@redhat.com, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 30, 2019 at 09:42:36AM -0300, Eduardo Habkost wrote:
> On Tue, Apr 30, 2019 at 11:10:06AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > On Wed, Apr 24, 2019 at 03:20:36PM -0300, Eduardo Habkost wrote:
> > > On Wed, Apr 24, 2019 at 09:26:52AM +0100, Daniel P. Berrang=C3=A9 w=
rote:
> > > > On Tue, Apr 23, 2019 at 06:22:44PM -0300, Eduardo Habkost wrote:
> > > > > This struct will be used to represent support and deprecation
> > > > > status of QEMU features.
> > > > >=20
> > > > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > > ---
> > > > >  qapi/common.json | 24 ++++++++++++++++++++++++
> > > > >  1 file changed, 24 insertions(+)
> > > > >=20
> > > > > diff --git a/qapi/common.json b/qapi/common.json
> > > > > index 99d313ef3b..b59d0dc66b 100644
> > > > > --- a/qapi/common.json
> > > > > +++ b/qapi/common.json
> > > > > @@ -193,3 +193,27 @@
> > > > >               'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
> > > > >               'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore3=
2',
> > > > >               'x86_64', 'xtensa', 'xtensaeb' ] }
> > > > > +
> > > > > +##
> > > > > +# @SupportStatusInfo:
> > > > > +#
> > > > > +# Information on support status of a given feature
> > > > > +# (e.g. machine type)
> > > > > +#
> > > > > +# @deprecated: if true, the given feature is deprecated and ma=
y be removed
> > > > > +#              in future versions of QEMU according to the QEM=
U deprecation
> > > > > +#              policy.
> > > > > +#
> > > > > +# @status-message: Human readable message describing support s=
tatus
> > > > > +#                  of the feature.
> > > > > +#
> > > > > +# @suggested-alternative: Optional.  Suggested alternative for=
 a deprecated
> > > > > +#                         feature.  For machine types, this sh=
ould be the name
> > > > > +#                         of an available machine-type.
> > > > > +#
> > > > > +# Since: 4.1
> > > > > +##
> > > > > +{ 'struct': 'SupportStatusInfo',
> > > > > +  'data': { 'deprecated': 'bool',
> > > > > +            '*status-message': 'str',
> > > > > +            '*suggested-alternative': 'str' } }
> > > >=20
> > > > I see status-message has to be optional, since you're embedding t=
he
> > > > struct into another struct and want deprecated=3D=3Dfalse by defa=
ult.
> > > >=20
> > > > I'd be inclined to change it to embed a pointer to the struct and
> > > > drop the deprecated field, and make both status-message and
> > > > suggested-alternative be mandatory. ie a struct  "DeprecationInfo=
"=20
> > > > the pointer to which is NULL if not deprecated.
> > >=20
> > > That could be a simple solution if we were sure we would only
> > > track deprecation info.  But I would like us to track additional
> > > support status on that struct eventually.
> >=20
> > I've no objection to expanding it to capture other info - we'll
> > want to change the 'deprecated' field to an enum though. Also,
> > in some cases there won't be any real alternative so lets just
> > call it 'hint' instead. How about
> >=20
> >     { 'enum':  "SupportStatus",
> >       'data': { 'production',  # Secure for use in hostile production=
 env
> >                 'development', # No security guarentee, friendly dev =
only
> > 		'deprecated',  # To be removed in the future
> >     } }
>=20
> "secure for production" and "deprecated" are independent
> variables.  There are deprecated features that are still secure,
> and deprecated features that were never supposed to be used in
> production in the first place.

Good point - we should track  quality status separately. So still
need a boolean deprecation flag too i guess.=20

>=20
> >=20
> >     { 'struct': "SupportStatusInfo",
> >        'data': { 'status': 'SupportStatus',
> >                  '*info': 'str',
> > 		 '*hint': 'str' } }
>=20
> "hint" seems nicer than "suggested" or "recommended".  I like it.
>=20
> --=20
> Eduardo

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

