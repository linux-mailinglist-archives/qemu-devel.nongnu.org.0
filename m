Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D64C88CE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:04:00 +0100 (CET)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzML-0007Iy-Ec
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyd9-00046E-Eg
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyd7-0007rG-U0
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646126233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q/F/HqYnpJPC3TKTUNlph1CtKqhuNScm6tNL4w/jB9E=;
 b=FgbobRzioTO0yUEXKrmmssnot2o1br3EzqpXsMlxdeEH5l+qdIftV79fomnLqZ3Ma/55R0
 UX0JJnn6w02fVIpTOX0R11T1vOWCTp63nYyA+UOWHOnjJ6iJ1WZgEgcDIwiHNc41UNR/dr
 LszwJGNuZSkLijQ7T3T1sJa8QgyY3lE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-6Es0_xZzMzmVPWf5ZWR2sQ-1; Tue, 01 Mar 2022 04:17:10 -0500
X-MC-Unique: 6Es0_xZzMzmVPWf5ZWR2sQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C5D801AB2;
 Tue,  1 Mar 2022 09:17:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D2F11038AC6;
 Tue,  1 Mar 2022 09:17:01 +0000 (UTC)
Date: Tue, 1 Mar 2022 09:17:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH 1/3] util & iothread: Introduce event-loop abstract class
Message-ID: <Yh3kjE6DsU/PcbuQ@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-2-nsaenzju@redhat.com>
 <YhdUcRNi95PY0X98@stefanha-x1.localdomain>
 <b5f5ab5d9d5216a8df08715a9b18ba448a42fe75.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8ra9p1uzZmxQ64/u"
Content-Disposition: inline
In-Reply-To: <b5f5ab5d9d5216a8df08715a9b18ba448a42fe75.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8ra9p1uzZmxQ64/u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 08:05:52PM +0100, Nicolas Saenz Julienne wrote:
> On Thu, 2022-02-24 at 09:48 +0000, Stefan Hajnoczi wrote:
> > On Mon, Feb 21, 2022 at 06:08:43PM +0100, Nicolas Saenz Julienne wrote:
> > > diff --git a/qom/meson.build b/qom/meson.build
> > > index 062a3789d8..c20e5dd1cb 100644
> > > --- a/qom/meson.build
> > > +++ b/qom/meson.build
> > > @@ -4,6 +4,7 @@ qom_ss.add(files(
> > >    'object.c',
> > >    'object_interfaces.c',
> > >    'qom-qobject.c',
> > > +  '../util/event-loop.c',
> >=20
> > This looks strange. I expected util/event-loop.c to be in
> > util/meson.build and added to the util_ss SourceSet instead of qom_ss.
> >=20
> > What is the reason for this?
>=20
> Sorry I meant to move it into the qom directory while cleaning up the ser=
ies
> but forgot about it.
>=20
> That said, I can see how moving 'event-loop-backend' in qom_ss isn't the
> cleanest.

Yes, qom/ is meant for the QEMU Object Model infrastructure itself, not
for all the QOM classes that rely on it.

> So I tried moving it into util_ss, but for some reason nobody is calling
> 'type_init(even_loop_register_type)'. My guess is there's some compilation
> quirk I'm missing.

Maybe the issue is that libqemuutil.a (util_ss) object files are linked
on demand. If there are no symbol dependencies in the main QEMU code to
event-loop.o then it won't be linked into the executable. That may be
why event_loop_register_type() isn't being called (it's set up by an
__attribute__((constructor)) function in event-loop.o so it doesn't help
create a symbol dependency).

> Any suggestions? I wonder if util_ss is the right spot for 'event-loop-ba=
ckend'
> anyway, but I don't have a better idea.

What Paolo suggested sounds good: move event-loop.c next to iothread.c
in the top-level source directory.

Stefan

--8ra9p1uzZmxQ64/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmId5IwACgkQnKSrs4Gr
c8gW8wgAuB/QEiGlJ1bcBJYCTHHFTMv4C1DdO+YXb/bfQmP8tkMxpkuf+5Tccte+
8jGF4k9Gt4tHBYPs9u8tVngzSf7V1crRfnKPhQl3YJuQ30dDXxdaQsjkbMPuewuO
Els5TXooqI5OrGfPGJoJimTaUt3lOFdFV9Fn/0C/xRbQc1o3P+2TlB0G/QD5zOrv
2tR/z1uKvSZWCge1Ia/GC1sVrCqHoTLoJqQ6rNRIcFUHP2sWG067cWQyDQDB6U8G
IQowsrfk/vNGZfuEqvHa9z90Evo4nTEI3aDY5Y6bII7zWq9qR5ShmefvPIJwTxbG
EFJt6yt1X2adDshOajoo6evUYg23iA==
=mnQ6
-----END PGP SIGNATURE-----

--8ra9p1uzZmxQ64/u--


