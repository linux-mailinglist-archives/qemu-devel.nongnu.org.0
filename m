Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C352BDA2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:58:52 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrL8U-0000ov-DZ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrL7M-0008PL-2J
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrL7K-0000Qp-1K
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652885857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gt/hzax9T74K2kM4EPUX4cDsp4GqlXdRsDZ1BHM57Ug=;
 b=fXODziOOgB5dE7AWJYS1kndmJ2XYseBmFql44iFX+y4R/15yVQVdCTXl5ATPNbn6GuwNwg
 LJmvI3M6RK8ZDXk8LkIKnCgcmuuyMowz2bf9px7alMrAi0ef3u0o70+yEnpZmcHn1K1eWz
 D8FZMdMoPbAXHosD1oWw9NEWIyZlgMc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-ejiOR_qnNcqTPbECSKEWlQ-1; Wed, 18 May 2022 10:57:33 -0400
X-MC-Unique: ejiOR_qnNcqTPbECSKEWlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 952791E7DCC7;
 Wed, 18 May 2022 14:57:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25F0D1410DD5;
 Wed, 18 May 2022 14:57:30 +0000 (UTC)
Date: Wed, 18 May 2022 15:57:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoUJWbOBBijpd2sD@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8Uc/eeVhyknqTCh+"
Content-Disposition: inline
In-Reply-To: <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8Uc/eeVhyknqTCh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2022 at 02:43:50PM +0200, Paolo Bonzini wrote:
> On 5/18/22 14:28, Emanuele Giuseppe Esposito wrote:
> > For example, all callers of bdrv_open() always take the AioContext lock.
> > Often it is taken very high in the call stack, but it's always taken.
>=20
> I think it's actually not a problem of who takes the AioContext lock or
> where; the requirements are contradictory:
>=20
> * IO_OR_GS_CODE() functions, when called from coroutine context, expect to
> be called with the AioContext lock taken (example: bdrv_co_yield_to_drain)
>=20
> * to call these functions with the lock taken, the code has to run in the
> BDS's home iothread.  Attempts to do otherwise results in deadlocks (the
> main loop's AIO_WAIT_WHILEs expect progress from the iothread, that cannot
> happen without releasing the aiocontext lock)
>
>=20
> * running the code in the BDS's home iothread is not possible for
> GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main
> thread, but that cannot be guaranteed in general)
>=20
> > We might suppose that many callbacks are called under drain and in
> > GLOBAL_STATE, which should be enough, but from our experimentation in
> > the previous series we saw that currently not everything is under drain,
> > leaving some operations unprotected (remember assert_graph_writable
> > temporarily disabled, since drain coverage for bdrv_replace_child_noperm
> > was not 100%?).
> > Therefore we need to add more drains. But isn't drain what we decided to
> > drop at the beginning? Why isn't drain good?
>=20
> To sum up the patch ordering deadlock that we have right now:
>=20
> * in some cases, graph manipulations are protected by the AioContext lock
>=20
> * eliminating the AioContext lock is needed to move callbacks to coroutine
> contexts (see above for the deadlock scenario)
>=20
> * moving callbacks to coroutine context is needed by the graph rwlock
> implementation
>=20
> On one hand, we cannot protect the graph across manipulations with a graph
> rwlock without removing the AioContext lock; on the other hand, the
> AioContext lock is what _right now_ protects the graph.
>=20
> So I'd rather go back to Emanuele's draining approach.  It may not be
> beautiful, but it allows progress.  Once that is in place, we can remove =
the
> AioContext lock (which mostly protects virtio-blk/virtio-scsi code right
> now) and reevaluate our next steps.

Me too, I don't think the rwlock was particularly nice either.

Stefan

--8Uc/eeVhyknqTCh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKFCVkACgkQnKSrs4Gr
c8iNQwf/XqLps6YsBg0awa5lfBV+GX5U/eDR84PT/TAGqBbDLYX19NLEejzIbE50
+oV7pxR11Vcr55c/av2MMuM9wGEcuV3/80e1MWqDNlvEnPc47sq9wSgcw/vWeCOa
nnVcOqvk0MzSkyx3KqVo29aNYqYHkoJvTnOF1P9ydWbl/aI+srh36+v9GDNmS2jS
D951DucUa/j9ISJHrEAf9uFd1HvSgnlQ+uhK7kOROTQ1/IfloA+cNpIh1MEXCkGv
9CRd4DzjMRAjezdDVXMbObe/12gsPiGaIvJ8eejP1D/pTy91U2IUMDPJU759fHkQ
8ljtzzGRZypqcF7yvDBXS14sWYfQGQ==
=FhtK
-----END PGP SIGNATURE-----

--8Uc/eeVhyknqTCh+--


