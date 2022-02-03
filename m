Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12214A86B2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:38:41 +0100 (CET)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdFw-0004xj-JS
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nFcxl-0007ET-Qb
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:19:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nFcxh-0006Zi-NS
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2YjGtbsZyYZS4csjmESFGPtbn+5H/ofsCPOLJtDPzM0=;
 b=CGGni9XWuqsbANrIN0OxFLN61kitSSBwmU+gmIpKSEHOy3kVruAeGNn7uk1fbi64iJe0W+
 0C0mMQ8H5iL6Bly7/mNwuCtULAlOEd1YLF0Oz/WSbDGOeTqGTJHvGaobfNESLpUvjC7NY0
 n3lkJplR6W/kU0BKxyCifwWM1H91VMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-IY-jYQdTNPy3NdS9YWwnPA-1; Thu, 03 Feb 2022 09:19:46 -0500
X-MC-Unique: IY-jYQdTNPy3NdS9YWwnPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6E164A88;
 Thu,  3 Feb 2022 14:19:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC9D97DE52;
 Thu,  3 Feb 2022 14:19:44 +0000 (UTC)
Date: Thu, 3 Feb 2022 14:19:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
 <Yfu08bAJKnRC3eFD@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XOnHSze+t3uPkQLB"
Content-Disposition: inline
In-Reply-To: <Yfu08bAJKnRC3eFD@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XOnHSze+t3uPkQLB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 10:56:49AM +0000, Daniel P. Berrang=E9 wrote:
> On Thu, Feb 03, 2022 at 10:53:07AM +0000, Stefan Hajnoczi wrote:
> > On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julienne wrote:
> > > The thread pool regulates itself: when idle, it kills threads until
> > > empty, when in demand, it creates new threads until full. This behavi=
our
> > > doesn't play well with latency sensitive workloads where the price of
> > > creating a new thread is too high. For example, when paired with qemu=
's
> > > '-mlock', or using safety features like SafeStack, creating a new thr=
ead
> > > has been measured take multiple milliseconds.
> > >=20
> > > In order to mitigate this let's introduce a new option to set a fixed
> > > pool size. The threads will be created during the pool's initializati=
on,
> > > remain available during its lifetime regardless of demand, and destro=
yed
> > > upon freeing it. A properly characterized workload will then be able =
to
> > > configure the pool to avoid any latency spike.
> > >=20
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > >=20
> > > ---
> > >=20
> > > The fix I propose here works for my specific use-case, but I'm pretty
> > > sure it'll need to be a bit more versatile to accommodate other
> > > use-cases.
> > >=20
> > > Some questions:
> > >=20
> > > - Is unanimously setting these parameters for any pool instance too
> > >   limiting? It'd make sense to move the options into the AioContext t=
he
> > >   pool belongs to. IIUC, for the general block use-case, this would be
> > >   'qemu_aio_context' as initialized in qemu_init_main_loop().
> >=20
> > Yes, qemu_aio_context is the main loop's AioContext. It's used unless
> > IOThreads are configured.
> >=20
> > It's nice to have global settings that affect all AioContexts, so I
> > think this patch is fine for now.
> >=20
> > In the future IOThread-specific parameters could be added if individual
> > IOThread AioContexts need tuning (similar to how poll-max-ns works
> > today).
> >=20
> > > - Currently I'm setting two pool properties through a single qemu
> > >   option. The pool's size and dynamic behaviour, or lack thereof. I
> > >   think it'd be better to split them into separate options. I thought=
 of
> > >   different ways of expressing this (min/max-size where static happens
> > >   when min-size=3Dmax-size, size and static/dynamic, etc..), but you =
might
> > >   have ideas on what could be useful to other use-cases.
> >=20
> > Yes, "min" and "max" is more flexible than fixed-size=3Dn. fixed-size=
=3Dn is
> > equivalent to min=3Dn,max=3Dn. The current default policy is min=3D0,ma=
x=3D64.
> > If you want more threads you could do min=3D0,max=3D128. If you want to
> > reserve 1 thread all the time use min=3D1,max=3D64.
> >=20
> > I would go with min and max.
>=20
> This commit also exposes this as a new top level command line
> argument. Given our aim to eliminate QemuOpts and use QAPI/QOM
> properties for everything I think we need a different approach.
>=20
> I'm not sure which exisiting QAPI/QOM option it most appropriate
> to graft these tunables onto ?  -machine ?  -accel ?  Or is there
> no good fit yet ?

Yep, I didn't comment on this because I don't have a good suggestion.

In terms of semantics I think we should have:

1. A global default value that all new AioContext take. The QEMU main
   loop's qemu_aio_context will use this and all IOThread AioContext
   will use it (unless they have been overridden).

   I would define it on --machine because that's the "global" object for
   a guest, but that's not very satisfying.

2. (Future patch) --object iothread,thread-pool-min=3DN,thread-pool-max=3DM
   just like poll-max-ns and friends. This allows the values to be set
   on a per-IOThread basis.

Stefan

--XOnHSze+t3uPkQLB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmH75H8ACgkQnKSrs4Gr
c8gljgf/bic/DK0ZORttHLmM1bCAWHm63AUGBvZ5f6S6HfSQvZZCyO0+MSNJl4hI
zqcB27d7W4Nrsmt/xvRbSPekv7T1BF80mrCsVpAlnkF5c8swLcN8DO0/cgUSpczL
gNzkHD+FMsxt1RofkymczYiEyOu6md6AElj8DEhfWP7sUi8dh5rkjlV0dIFH5gnb
5Ppxp0hJ5PZkMLyW3SgzwB6WnXvFf+TN8PmNzaPgI70U/z+5fqfTFtJKiI3Qn3ou
6TcHK71vlZc4WZ59FiDhZo0HJiAzaa9m47uYwGqc9kP/b3D+WftbBoIaCHkk6Cex
WoGbCMjdMkJi4xHV+R57JimpkZ3i5A==
=KXvK
-----END PGP SIGNATURE-----

--XOnHSze+t3uPkQLB--


