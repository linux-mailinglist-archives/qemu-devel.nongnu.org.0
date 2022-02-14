Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476464B53CF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:56:27 +0100 (CET)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcm9-0002F5-Qu
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJc2b-00062B-8o
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJc2V-00041B-N1
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644847755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rnovYNLuam5Ib5LMd+a9Lw9q0nFEYo0NKf7e7EOTamc=;
 b=VWClf75vXDXgYPzocu5BRI0g7AdukU9Am+xpyEQfPFS8GVvamIxcSrTZU8iWU31n6mTApz
 21tnGmx45++aO7kEQWfNHBNZQfJRDZmtU8clc6Jqubb00ZttvAMa9bluDPE5dMOyYorRDB
 XZUdRXN40OILA0lFAmkp4ycm+AUO6Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-LlSp0lmQPAeq96AOwwfaHg-1; Mon, 14 Feb 2022 09:09:11 -0500
X-MC-Unique: LlSp0lmQPAeq96AOwwfaHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B587802924;
 Mon, 14 Feb 2022 14:09:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 005FE70D5F;
 Mon, 14 Feb 2022 14:09:08 +0000 (UTC)
Date: Mon, 14 Feb 2022 15:09:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <Ygpig768ziKoGRKa@redhat.com>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
 <Yfu08bAJKnRC3eFD@redhat.com>
 <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
 <YgZJaTtoHN8hzrvk@redhat.com>
 <YgoqdtB9I3HrB1su@stefanha-x1.localdomain>
 <Ygo/LimCnA7BDshE@redhat.com>
 <YgpU082hsgXjxOye@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0WimVM3U5QPPWlxD"
Content-Disposition: inline
In-Reply-To: <YgpU082hsgXjxOye@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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


--0WimVM3U5QPPWlxD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 14.02.2022 um 14:10 hat Stefan Hajnoczi geschrieben:
> On Mon, Feb 14, 2022 at 12:38:22PM +0100, Kevin Wolf wrote:
> > Am 14.02.2022 um 11:09 hat Stefan Hajnoczi geschrieben:
> > > On Fri, Feb 11, 2022 at 12:32:57PM +0100, Kevin Wolf wrote:
> > > > Am 03.02.2022 um 15:19 hat Stefan Hajnoczi geschrieben:
> > > > > On Thu, Feb 03, 2022 at 10:56:49AM +0000, Daniel P. Berrang=E9 wr=
ote:
> > > > > > On Thu, Feb 03, 2022 at 10:53:07AM +0000, Stefan Hajnoczi wrote:
> > > > > > > On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julie=
nne wrote:
> > > > > 1. A global default value that all new AioContext take. The QEMU =
main
> > > > >    loop's qemu_aio_context will use this and all IOThread AioCont=
ext
> > > > >    will use it (unless they have been overridden).
> > > > >=20
> > > > >    I would define it on --machine because that's the "global" obj=
ect for
> > > > >    a guest, but that's not very satisfying.
> > > >=20
> > > > Semantically, -machine is about the virtual hardware where as iothr=
eads
> > > > are about the backend, so I agree it's not a good fit.
> > > >=20
> > > > For the main thread, you may want to configure all the same options=
 that
> > > > you can configure for an iothread. So to me that sounds like we wou=
ld
> > > > want to allow using an iothread object for the main thread, too.
> > > >=20
> > > > That would still require us to tell QEMU which iothread object shou=
ld be
> > > > used for the main thread, though.
> > >=20
> > > Making the main loop thread an IOThread is an interesting direction b=
ut
> > > not an easy change to make.
> > >=20
> > > The main loop thread has a custom event loop that is not interchangea=
ble
> > > with the IOThread event loop:
> > > - The main loop has a poll notifier interface for libslirp fd monitor=
ing
> > >   integration.
> > > - The main loop is a GLib event loop but manually polls to get
> > >   nanosecond resolution timers.
> > > - The main loop has icount integration.
> > > - The main loop has the special iohandler AioContext
> > >=20
> > > The IOThread event loop runs an optimized AioContext event loop inste=
ad.
> > > It falls back to regular g_main_loop_run() if there is a GSource user.
> > >=20
> > > It would definitely be nice to unify the main loop with IOThread and
> > > then use --object iothread,... to configure main loop parameters.
> > >=20
> > > I'm not sure if requiring that of Nicolas is fair though. The event
> > > loops in QEMU are complex and changes are likely to introduce subtle
> > > bugs or performance regressions.
> >=20
> > I'm not suggesting actually running the iothread event loop instead,
> > merely using the properties of an object to configure the main thread as
> > the external user interface.
> > Whether this uses the same main loop code as today or is moved to the
> > regular iothread event loop is an implementation detail that can be
> > changed later.
> >=20
> > Or we could maybe use a different object type like 'mainthread' and
> > share the properties using QOM inheritance.
>=20
> That seems cleaner than trying faking an IOThread to me since I don't
> see a concrete plan to unify the two event loops.
>=20
> The main loop code is in util/main-loop.c. Maybe call it --object
> main-loop? Attempting to instantiate more than one main-loop object
> should fail.

Sounds good. And if you don't create one explicitly, we'll just
internally create a default main-loop object.

Kevin

--0WimVM3U5QPPWlxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmIKYoMACgkQfwmycsiP
L9a6MA/9GF7WH5kTtA4vcR5KJUwemxkZ7auXR26QiOZfW5X5Vholg4CU9VJqEGJh
TzHqc9jLWy1+GUNjQ1fFzbz3pjX8GQMbqQGIqCj0FZtqGWKKZxbwgOkfZFQQGwD7
IE5D8NQjDjFnT1EwsE19mHjBKiXiQxlVRZmNkCnpCWVH8Z6tEkpP1SZCGG1z5UqJ
Ztuj0gjH/eIED9CBPrAJOJadkRx5N9UPGA0sCRRBOZTr5DH61trQYZdmTWpwKbxm
MHrOu8jwz5ZBjV3UarDi7tRI8nQVWD0/4tfmw2/QN9Wsf8HvjU7Qid7cyFCLtfIO
qEG3yvil/POrJ1thDFKAkPK5TfisSRKtakEuaROWY2BgQWocqcQ3/kAd3LIMr6Zn
1A9tyJWl31C6mJfVXgxQNXHAbh5InKtUezHQCsbLWb9ihTI2usgTtUQQBs+IR9na
oqYSa9ceyWoYoY3LHcXCgt5FcmmFsSiDn2jyeI/6bmcstCnC805dNJqY5vRBR4LQ
qtaOUhrkbafxfUBNiBTztM7MbgL9lcdyYussMD7aLt758GJazNJfDYcx1Sg4dL1I
2R9OQDh/yEM8rP+boaLUSAk9lVEjQw0XD6ZONxeIYA/b5HY6gQx06yvF+bsouAVl
e6pbrzI1YbtAHeKhG7Hq4nlb4NWw24JLvKpfMYKxiX9RkCxpcOE=
=S+Tw
-----END PGP SIGNATURE-----

--0WimVM3U5QPPWlxD--


