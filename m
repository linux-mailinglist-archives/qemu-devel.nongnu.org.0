Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92928424FB8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:07:32 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPND-0006c4-4H
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYPLm-0005oN-FW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYPLj-0001p9-RD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633597559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KW9AHRNGTudxA+Fmgid5OYa4NwKrKYq6V/dM1L3ehIs=;
 b=P1+6F/eoSKcYkGzxCL8kFxJ/tUMtIvA0N3YO2Rro6bOJXDeH0CYdlBzgqsCnjDocLb4Esn
 2tEVuBJ2/yk142sK8DVaV48u861isSEqIEksKMT05vQ8nNrsMe0mwxN9AhYwDL1BFKg6OF
 AGp2ZcSc9TIZWqUiC8srH2ZScqIofEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-SWzjWfwXOZa6lCoJGQJJPQ-1; Thu, 07 Oct 2021 05:05:45 -0400
X-MC-Unique: SWzjWfwXOZa6lCoJGQJJPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA028CC627;
 Thu,  7 Oct 2021 09:05:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A1265F4ED;
 Thu,  7 Oct 2021 09:05:21 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:05:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 01/25] main-loop.h: introduce qemu_in_main_thread()
Message-ID: <YV64UL9vQz7Em8Ci@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vLAL1qhktVGOAcjW"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vLAL1qhktVGOAcjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:31:51AM -0400, Emanuele Giuseppe Esposito wrote:
> When invoked from the main loop, this function is the same
> as qemu_mutex_iothread_locked, and returns true if the BQL is held.
> When invoked from iothreads or tests, it returns true only
> if the current AioContext is the Main Loop.
>=20
> This essentially just extends qemu_mutex_iothread_locked to work
> also in unit tests or other users like storage-daemon, that run
> in the Main Loop but end up using the implementation in
> stubs/iothread-lock.c.
>=20
> Using qemu_mutex_iothread_locked in unit tests defaults to false
> because they use the implementation in stubs/iothread-lock,
> making all assertions added in next patches fail despite the
> AioContext is still the main loop.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/main-loop.h | 13 +++++++++++++
>  softmmu/cpus.c           |  5 +++++
>  stubs/iothread-lock.c    |  5 +++++
>  3 files changed, 23 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vLAL1qhktVGOAcjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFeuFAACgkQnKSrs4Gr
c8jVswgAiZx9WeGxHZioSd+mr+OUhYYcUT1iiFMxFW6JYf8brbxVt85p8OYt0fw7
oEEquryIEYSrWgBAddue6pr4NBC4PCmRyhtGMy3lIpVrHREn7fYnhG8/uvbUC95I
g0jgRHA98C0lLtK6lyM64lxeQ9ydRlxTQegWgN2L6bJmLhMsjnlLBDjiMRYILKmQ
tHYhXUBzSRtgigRH32IOyrc81T+z9r7CFfm3vbj78aHqdY+0+mPX+burk2P7fUzA
zh+hgbWdu9X1KbInRHqvAPn1UwOAS2yJnoeALvSsu/9WKMM2o9A4xAJkKajJXEKp
7grrh8sToDZP9YjKz8tTuU0pyqPVvQ==
=fTwH
-----END PGP SIGNATURE-----

--vLAL1qhktVGOAcjW--


