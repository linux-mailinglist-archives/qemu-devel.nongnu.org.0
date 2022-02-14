Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54F4B48ED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:11:54 +0100 (CET)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYKl-000805-Gg
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJYJH-000714-Ff
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJYJC-0004hF-8e
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644833413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MLlmw2IDuuq8Nfnj9t8/4+AsEDjI1k6u5fuX1I/odqE=;
 b=hLxVCleOvt+vd2Tpb9pgc4birjCS6XRnOJcm0GKIX50riZi0UdZ2s3NJHQUA/emfNPF4Mm
 l6rmRPPMDc8Cw7derVqWJpyfxCesOzp0yiadHnLCAo+6BM4JbKhF0Z5bkUDS7MFbF1VPva
 4OKcga0kxUMaeR6dKqYcTAebPSaY1D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-Idt-uPUoMCKKX0J4ssd2UA-1; Mon, 14 Feb 2022 05:10:09 -0500
X-MC-Unique: Idt-uPUoMCKKX0J4ssd2UA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C62E1F2DA;
 Mon, 14 Feb 2022 10:10:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 740ED6E1EB;
 Mon, 14 Feb 2022 10:09:59 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:09:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <YgoqdtB9I3HrB1su@stefanha-x1.localdomain>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
 <Yfu08bAJKnRC3eFD@redhat.com>
 <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
 <YgZJaTtoHN8hzrvk@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KIVNUwogjCPNNxKj"
Content-Disposition: inline
In-Reply-To: <YgZJaTtoHN8hzrvk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--KIVNUwogjCPNNxKj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 12:32:57PM +0100, Kevin Wolf wrote:
> Am 03.02.2022 um 15:19 hat Stefan Hajnoczi geschrieben:
> > On Thu, Feb 03, 2022 at 10:56:49AM +0000, Daniel P. Berrang=E9 wrote:
> > > On Thu, Feb 03, 2022 at 10:53:07AM +0000, Stefan Hajnoczi wrote:
> > > > On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julienne wr=
ote:
> > 1. A global default value that all new AioContext take. The QEMU main
> >    loop's qemu_aio_context will use this and all IOThread AioContext
> >    will use it (unless they have been overridden).
> >=20
> >    I would define it on --machine because that's the "global" object for
> >    a guest, but that's not very satisfying.
>=20
> Semantically, -machine is about the virtual hardware where as iothreads
> are about the backend, so I agree it's not a good fit.
>=20
> For the main thread, you may want to configure all the same options that
> you can configure for an iothread. So to me that sounds like we would
> want to allow using an iothread object for the main thread, too.
>=20
> That would still require us to tell QEMU which iothread object should be
> used for the main thread, though.

Making the main loop thread an IOThread is an interesting direction but
not an easy change to make.

The main loop thread has a custom event loop that is not interchangeable
with the IOThread event loop:
- The main loop has a poll notifier interface for libslirp fd monitoring
  integration.
- The main loop is a GLib event loop but manually polls to get
  nanosecond resolution timers.
- The main loop has icount integration.
- The main loop has the special iohandler AioContext

The IOThread event loop runs an optimized AioContext event loop instead.
It falls back to regular g_main_loop_run() if there is a GSource user.

It would definitely be nice to unify the main loop with IOThread and
then use --object iothread,... to configure main loop parameters.

I'm not sure if requiring that of Nicolas is fair though. The event
loops in QEMU are complex and changes are likely to introduce subtle
bugs or performance regressions.

Stefan

--KIVNUwogjCPNNxKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKKnYACgkQnKSrs4Gr
c8gnswf8D7HZtE4mxM5LzDPEW4MlMey5AEz2sq3Z7XYA743AXjI+kSF9ultsiSZO
xgRseclrUI3oZn8aEZFvxQm1FKMu3MxYhCdtWFHWpS2axCRNDESt0hQUOQJmY9g/
AMmsxXvDT5oXpfElQbIPqqdOFA8J7tAwRWY6QaWGSTCzqMavNBtslZiX82kwvI8d
2wsDxTY2EIEH0IFHWQ08vJaOvF4mz06A6qqcinDAIdfD6YGT1W6wn3Gdwjj4doa3
LAneOPu+1zX8R8a6zGyCreLbqYtNG9f9yMOsj9f1EosytdrDTEk7wAUFf1ZRHCXK
0y1DxjmyRPRCmr9Fkznh7hFRqJCT3Q==
=zhTB
-----END PGP SIGNATURE-----

--KIVNUwogjCPNNxKj--


