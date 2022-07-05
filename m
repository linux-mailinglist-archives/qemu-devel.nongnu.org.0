Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F301B5664B4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:08:41 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dbs-0000m8-Vx
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dXO-0005g3-A9
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dXI-0007mj-HB
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SkBgFtYTRx1UWOC0+1qHwKvLomdlOXyBflPDwZKIp9A=;
 b=DGc6vSwHYVZR5fQhnzU/6mNPmaQBrMryxjVmz7AiqspstXee3ypu+6M9PxlcXcVSMxJzIw
 KOMbM30FRA9zfJpXzBHry9ocugFk31wTv+Hbal/2NXODmWJoWvEgn0SOQ7UxDlJEGTRuFF
 aFSxSiTW6Zi0WE8TEnTHvty5rCg7o00=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-HTeGQ7J5OZul1g2ajgWq4A-1; Tue, 05 Jul 2022 04:03:51 -0400
X-MC-Unique: HTeGQ7J5OZul1g2ajgWq4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 925D985A580;
 Tue,  5 Jul 2022 08:03:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 134D440C141F;
 Tue,  5 Jul 2022 08:03:49 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:03:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 10/20] jobs: add job lock in find_* functions
Message-ID: <YsPwZOd8A6ZBYVnp@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-11-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zy+pT93yYz8hhi1k"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--Zy+pT93yYz8hhi1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:28AM -0400, Emanuele Giuseppe Esposito wrote:
> Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
> they first search for the job and then perform an action on it.
> Therefore, we need to do the search + action under the same
> job mutex critical section.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockdev.c | 67 +++++++++++++++++++++++++++++++++++++-----------------
>  job-qmp.c  | 55 ++++++++++++++++++++++++++++++--------------
>  2 files changed, 84 insertions(+), 38 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Zy+pT93yYz8hhi1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD8GQACgkQnKSrs4Gr
c8hExAgAsW7GBg63vaqGAWC59WDCvx6Nas0i/meca9xnv+a8BcZvwFboExKNfcbO
lNC0IIwzekhV7NoXjxHHnZ7oEla5Ya0Ru1sKzM1cUgKBoUQwtN1xVqpPYQJTYuGr
fS++xwzhGc/z+yAHrdqgq32+9dQi6wiuuOsSltBJNzae8hweu/S38JcmRCDQR5ca
mSFqWIx/F6gOuNx38kJzI/0cYRZ9GG73HD833QgAko6AdcvIYjr/87Eaf5EE0QEX
wSJW/SNBDywB/8C1AovET77fAzWX64gYF/JXdGZx9t73DfbpH3/b6GIwuCQnXxAS
FLt/w8t3p30ikscgkB/1UNuyEqN6cw==
=0J9R
-----END PGP SIGNATURE-----

--Zy+pT93yYz8hhi1k--


