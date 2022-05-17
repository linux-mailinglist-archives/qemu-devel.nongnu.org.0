Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5E529FF3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:05:42 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqv1J-0008Kv-IC
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nquv4-0007MV-IA
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:59:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nquv1-0003VA-UA
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652785150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SPmcKgs4NbEbFamd3M7PqMck2uAC2usqn4mD5Xm5LVU=;
 b=HfBnmJiTOUuWH7ja3i0E96wUD+jO18c0stz+1NSU3ttpAxYdqSTTdOiKYkgqzoBSg/Iznk
 iGdlZxDy11L03oEpFWKNgAXXaN2YX6Fu5JAWSq03/dvi/AYwDXdNG2pwRdLtAU8y7w6dSf
 cCXDORgZgobCtb5r7PJxybCQHl6z7CQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-32vz9zrjMD2DgX11TX_BuQ-1; Tue, 17 May 2022 06:59:08 -0400
X-MC-Unique: 32vz9zrjMD2DgX11TX_BuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AD2F3C16186;
 Tue, 17 May 2022 10:59:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89D4C2166B2D;
 Tue, 17 May 2022 10:59:04 +0000 (UTC)
Date: Tue, 17 May 2022 11:59:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WbrWsekXV14Q5x4t"
Content-Disposition: inline
In-Reply-To: <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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


--WbrWsekXV14Q5x4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 02:39:05PM +0100, Stefan Hajnoczi wrote:
> On Tue, Apr 26, 2022 at 04:51:06AM -0400, Emanuele Giuseppe Esposito wrot=
e:
> > This is a new attempt to replace the need to take the AioContext lock to
> > protect graph modifications. In particular, we aim to remove
> > (or better, substitute) the AioContext around bdrv_replace_child_noperm,
> > since this function changes BlockDriverState's ->parents and ->children
> > lists.
> >=20
> > In the previous version, we decided to discard using subtree_drains to
> > protect the nodes, for different reasons: for those unfamiliar with it,
> > please see https://patchew.org/QEMU/20220301142113.163174-1-eesposit@re=
dhat.com/
>=20
> I reread the thread and it's unclear to me why drain is the wrong
> mechanism for protecting graph modifications. We theorized a lot but
> ultimately is this new mechanism sufficiently different from
> bdrv_drained_begin()/end() to make it worth implementing?
>=20
> Instead of invoking .drained_begin() callbacks to stop further I/O,
> we're now queuing coroutines (without backpressure information that
> whoever is spawning I/O needs so they can stop). The writer still waits
> for in-flight I/O to finish, including I/O not associated with the bdrv
> graph we wish to modify (because rdlock is per-AioContext and unrelated
> to a specific graph). Is this really more lightweight than drain?
>=20
> If I understand correctly, the original goal was to avoid the need to
> hold the AioContext lock across bdrv_replace_child_noperm(). I would
> focus on that and use drain for now.
>=20
> Maybe I've missed an important point about why the new mechanism is
> needed?

Ping?

Stefan

--WbrWsekXV14Q5x4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDf/cACgkQnKSrs4Gr
c8hnmggAtZobt8KnQSUntFoyL9xd0X29jl9Q921hYrPTwyNTVX5RBGiiUE+u19q8
wRTB+J1Rtgr/NQxnUim2OIF8+qPdVqvm/e31/jlo+7mDfm4wkPsxKsy3NoOQAAOC
w5o/gYKrJvsHDGCfrSH8Pgc+ifWo2SZxog5ps4s4UmTQMDs4W+FeNw6+rO4xO42h
VbB4xczKSf/flPZezPXhSCJrH8M/9ou7UBOgPhI+DFUiPBddh2luYHm80qXKnV/I
fD9xIBrAkfRjt+RHvu3ER8u7KOzYK9hz1UiBnGZwNcm5Ql0P7tj+22LpC9wEPaXB
LuAwzqcNLLB5ce0PtYHIJUAd3z63Gg==
=6W+p
-----END PGP SIGNATURE-----

--WbrWsekXV14Q5x4t--


