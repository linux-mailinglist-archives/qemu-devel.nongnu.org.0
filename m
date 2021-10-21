Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB04365A2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:15:08 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZmd-0007SU-6a
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZiQ-0002BX-2Q
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZiO-0004O2-17
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634829041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9XHpu2+MsEVeeNQt8yR6TvZEpUyYdfGrGhMaBfUtEOM=;
 b=fSLlrU+T03OKQ7jd2q6+FCDUUqaX355Ex4O2Ai5hTydI0QSAoI3GcKYEiYsq7wDCk8nrxX
 dIF+FBcpv16Tz0LFBsGLOEPXBMhnT4SgG80Pv36La02RhrMtuEO+fYPPxRQN6I1Atxy5PT
 kbTcIHYPXJyH7Dhj1lXnyyFbkqZpcfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-i1lLPecdNYudAy0_L5An_Q-1; Thu, 21 Oct 2021 11:10:38 -0400
X-MC-Unique: i1lLPecdNYudAy0_L5An_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06B271926DA0;
 Thu, 21 Oct 2021 15:10:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FA1F69217;
 Thu, 21 Oct 2021 15:10:11 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:10:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 17/25] block/copy-before-write.h: global state API +
 assertions
Message-ID: <YXGC0s2LL5iQd4sn@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-18-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-18-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iaCoR0hMMFBrTjJo"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--iaCoR0hMMFBrTjJo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:48:58AM -0400, Emanuele Giuseppe Esposito wrote:
> copy-before-write functions always run under BQL lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/copy-before-write.c | 2 ++
>  block/copy-before-write.h | 7 +++++++
>  2 files changed, 9 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--iaCoR0hMMFBrTjJo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxgtIACgkQnKSrs4Gr
c8iRRAf/TOeMRsvUHUkZ6nwLgmveI/834RLuI5kacPejIMtwc/N6Wt5chiKqyA8o
tR/KclpV+S79JhmiF+ZT0+GHc8Tzmvjc2mmADVMzrxDr6ZbyFxWRFPWZ7aMTlMes
9x+Bl0zijgKrwATIrHtSr8Fzz24EK64uH4weWDvOE16H8Wyi3f0TpuxdkTLQSqDI
1TrdI77i31csTQtUnzqFXUFCziTS35nsbsg2d9VVd9kaiLJDFBuGz7G3y0pncUFA
k5+5tmvR4D2+RPTzdSOi+RXxSz3zGFbDmK52uFcM1rwY+wgAbw4IdXqYbbF/tHcs
Uvj12EGQY9MXJ9T0woMGWYhEzU2wTQ==
=6s/+
-----END PGP SIGNATURE-----

--iaCoR0hMMFBrTjJo--


