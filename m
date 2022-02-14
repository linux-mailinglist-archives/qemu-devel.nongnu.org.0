Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D234B4EE4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:40:30 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZiX-0005Fh-MX
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:40:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJZgv-0004Q8-4I
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJZgt-0002M1-If
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644838726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2NIQ/Gu+cOrnkgcuu6YkIdxFZujafle+mEe5M5lG72o=;
 b=DE2z5aUMNsv6f/RiidwbWXmD/Px1ZNrX4jdsK0oRb4FN1JsoXPC9dMuiCdE45wUuRaNAD9
 k5eVR4e6mG/rOHxWDN99WeVD3jyrbNt0ivIM/XebuYJhjJAIhABah7SDDJ1wsX/ZpwoZEx
 cj1HN2VA8g9eYgoHUb/MvbVvYE7ILIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-qv1gGjXPMv2XO3neuNIp-w-1; Mon, 14 Feb 2022 06:38:43 -0500
X-MC-Unique: qv1gGjXPMv2XO3neuNIp-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A041091DA2;
 Mon, 14 Feb 2022 11:38:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD963108647A;
 Mon, 14 Feb 2022 11:38:23 +0000 (UTC)
Date: Mon, 14 Feb 2022 12:38:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <Ygo/LimCnA7BDshE@redhat.com>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
 <Yfu08bAJKnRC3eFD@redhat.com>
 <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
 <YgZJaTtoHN8hzrvk@redhat.com>
 <YgoqdtB9I3HrB1su@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+nrueTLIhly9M0iX"
Content-Disposition: inline
In-Reply-To: <YgoqdtB9I3HrB1su@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, mtosatti@redhat.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+nrueTLIhly9M0iX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 14.02.2022 um 11:09 hat Stefan Hajnoczi geschrieben:
> On Fri, Feb 11, 2022 at 12:32:57PM +0100, Kevin Wolf wrote:
> > Am 03.02.2022 um 15:19 hat Stefan Hajnoczi geschrieben:
> > > On Thu, Feb 03, 2022 at 10:56:49AM +0000, Daniel P. Berrang=E9 wrote:
> > > > On Thu, Feb 03, 2022 at 10:53:07AM +0000, Stefan Hajnoczi wrote:
> > > > > On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julienne =
wrote:
> > > 1. A global default value that all new AioContext take. The QEMU main
> > >    loop's qemu_aio_context will use this and all IOThread AioContext
> > >    will use it (unless they have been overridden).
> > >=20
> > >    I would define it on --machine because that's the "global" object =
for
> > >    a guest, but that's not very satisfying.
> >=20
> > Semantically, -machine is about the virtual hardware where as iothreads
> > are about the backend, so I agree it's not a good fit.
> >=20
> > For the main thread, you may want to configure all the same options that
> > you can configure for an iothread. So to me that sounds like we would
> > want to allow using an iothread object for the main thread, too.
> >=20
> > That would still require us to tell QEMU which iothread object should be
> > used for the main thread, though.
>=20
> Making the main loop thread an IOThread is an interesting direction but
> not an easy change to make.
>=20
> The main loop thread has a custom event loop that is not interchangeable
> with the IOThread event loop:
> - The main loop has a poll notifier interface for libslirp fd monitoring
>   integration.
> - The main loop is a GLib event loop but manually polls to get
>   nanosecond resolution timers.
> - The main loop has icount integration.
> - The main loop has the special iohandler AioContext
>=20
> The IOThread event loop runs an optimized AioContext event loop instead.
> It falls back to regular g_main_loop_run() if there is a GSource user.
>=20
> It would definitely be nice to unify the main loop with IOThread and
> then use --object iothread,... to configure main loop parameters.
>=20
> I'm not sure if requiring that of Nicolas is fair though. The event
> loops in QEMU are complex and changes are likely to introduce subtle
> bugs or performance regressions.

I'm not suggesting actually running the iothread event loop instead,
merely using the properties of an object to configure the main thread as
the external user interface.
Whether this uses the same main loop code as today or is moved to the
regular iothread event loop is an implementation detail that can be
changed later.

Or we could maybe use a different object type like 'mainthread' and
share the properties using QOM inheritance.

Kevin

--+nrueTLIhly9M0iX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmIKPy0ACgkQfwmycsiP
L9agGQ/+JxQQGbN0KfhZpkaG7h+vmeqzjqOBey2C/oKzwuio2SRZgEDOnKWGOxcN
LcaUL89JRD95to37UpdmCX2Ug3eQu/vs3feQi0R7dYOL2UJEaRzCDuvuWAYJSofR
xx2YLPdES4kqdq+4kKDGvqYBHD/T82MAlzrnhGgXGfklI04kQP1ycCj1OP6huw7K
u4n2rvtDZk3Jk+hnRAae31LcgI14vwgimVrVb+x9q++rh0S/bsVhWbszuUoVpgBP
xBUFfuc02lfh8OiocWWLyAFZ1pzFWBxSdJcUwhKzkw/GvMKyFsSe8A92KE9FPca1
NJm8lWl7fMYDDDpbATv+egrJneGXkl6s7vlI4jR9juj1LJlVN+NyQHIqRWrj+olf
8Omkqtm9w6EbgIl+t9zmSL2PowSRo7T25p7tIxGt7nn5cO/vjzFCre0HvCJCoUKH
AZxOsxE5q/YBttk7RxMd4TsrWC+xWF3x9teCw2Zr8IXySaSwDwbgaFcG8c9e9quE
2R68r8DwlrYESDRWytat5uO/sqUv4scndhTuKIn/WYya40KetKSsjHJZD2onbep+
uTW81TcSRyRzwY2JxSYX9egjL6DwNjkXQLAcZ8OZWf/S0OUI69PmEYuWUdS4y4Mo
Kz8Y/eP0MV1Du2hfEDVYvYE+J5VTjk5ivDJ1MdEb1K5az0LqQ+M=
=uE9K
-----END PGP SIGNATURE-----

--+nrueTLIhly9M0iX--


