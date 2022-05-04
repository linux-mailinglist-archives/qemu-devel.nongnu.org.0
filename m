Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A392551A127
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 15:41:12 +0200 (CEST)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFFc-00078K-JP
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 09:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmFDn-0006Cz-Q8
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmFDl-0000WN-Iy
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651671552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH3AC12SzS3u+E3W0s1qeXVG0K7B/qBdgGI2wbLcPmc=;
 b=ZTIt3Hb49JN44nOsTvMpCMGCxKYsKD/l6uclu0tWULCq4BShja3enH2xGGO9h+ZXwLI6dT
 xt2AHx+0DvEjF0WXjILIlWmDl9fvCeZ+wu9XpF4T46m63KN4g/Qq1USY09KJwKn3+K6o4y
 Ll9rMWDQ0rkNZLo6hVXVlY+8xOcMzE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-nPSFL1NhNCyWDA43U1VqeQ-1; Wed, 04 May 2022 09:39:09 -0400
X-MC-Unique: nPSFL1NhNCyWDA43U1VqeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29B391014A68;
 Wed,  4 May 2022 13:39:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF818C27EBA;
 Wed,  4 May 2022 13:39:06 +0000 (UTC)
Date: Wed, 4 May 2022 14:39:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dGyLSrZCx2hNt4RD"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dGyLSrZCx2hNt4RD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:06AM -0400, Emanuele Giuseppe Esposito wrote:
> This is a new attempt to replace the need to take the AioContext lock to
> protect graph modifications. In particular, we aim to remove
> (or better, substitute) the AioContext around bdrv_replace_child_noperm,
> since this function changes BlockDriverState's ->parents and ->children
> lists.
>=20
> In the previous version, we decided to discard using subtree_drains to
> protect the nodes, for different reasons: for those unfamiliar with it,
> please see https://patchew.org/QEMU/20220301142113.163174-1-eesposit@redh=
at.com/

I reread the thread and it's unclear to me why drain is the wrong
mechanism for protecting graph modifications. We theorized a lot but
ultimately is this new mechanism sufficiently different from
bdrv_drained_begin()/end() to make it worth implementing?

Instead of invoking .drained_begin() callbacks to stop further I/O,
we're now queuing coroutines (without backpressure information that
whoever is spawning I/O needs so they can stop). The writer still waits
for in-flight I/O to finish, including I/O not associated with the bdrv
graph we wish to modify (because rdlock is per-AioContext and unrelated
to a specific graph). Is this really more lightweight than drain?

If I understand correctly, the original goal was to avoid the need to
hold the AioContext lock across bdrv_replace_child_noperm(). I would
focus on that and use drain for now.

Maybe I've missed an important point about why the new mechanism is
needed?

Stefan

--dGyLSrZCx2hNt4RD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJygfkACgkQnKSrs4Gr
c8hccQf+O0aO3pnPvMOFvUX3K9XVBB+S2b8GTaWiSHQkQCMfWPkAngrcA0076GAA
5uApRLxq5CeuVdYzgVz+hsUTWmYIWZ0a4PJSAsMu/jMkbv2qWAXYWpU4gZhDszgt
RLLVnb9mMpceabMtN5EKW+N1YduK3FKUhKpGne6OZKWwDNcldHXLsfyNDitnp/MW
yeWdrpatn85EsklVnw4AejQgb2b1CYZWxdraTVsPLZBagJhus87yTwgr7P9wXl8T
R5PBj0kAAJBCImrL0Ms0KThSmDfFkYJ3L4i68Os/OU0FMfRitGYxvK5RR03ZWSsT
jFwiupDp1cqEKozIUHjMN8QeoPhL9A==
=6vrM
-----END PGP SIGNATURE-----

--dGyLSrZCx2hNt4RD--


