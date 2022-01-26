Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1C49C8AC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 12:31:40 +0100 (CET)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCgWX-0001id-UK
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 06:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCgV1-0000gE-So
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCgUx-0002Nl-OG
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643196594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvhlJY0wOr14W7niwOEQv8vfV6z+jXqOVRcepykok6w=;
 b=Dvb1szf9j3bWWaYnkfm+E2K9gug4/OgMmPCEJCX0owzkML8dUEoWzPfzvr1ZL0s7zpsZE8
 Wb345+Mds4j0RatthalGnjn0Sgcw8Dcw8pF60HWVZtUMNoEkSv1lVAxkuvS9ShgI8wFdES
 KeAZs8Mb38GTLcxjiN8GLZ2kLDOFqCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-O9kDzdOgOHeIE5Ta3lUMZQ-1; Wed, 26 Jan 2022 06:29:52 -0500
X-MC-Unique: O9kDzdOgOHeIE5Ta3lUMZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5339351082;
 Wed, 26 Jan 2022 11:29:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 969567B026;
 Wed, 26 Jan 2022 11:29:42 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:29:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 00/12] Removal of Aiocontext lock through drains: protect
 bdrv_replace_child_noperm.
Message-ID: <YfEwpbxfcNF6K5Cm@stefanha-x1.localdomain>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GgBdaJCc3KdSO0V7"
Content-Disposition: inline
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GgBdaJCc3KdSO0V7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If I understand correctly aio_context_acquire() calls are not explicitly
removed in this patch series but switching to BDRV_POLL_WHILE_UNLOCKED()
means that we no longer need to run under the AioContext lock?

Still, I'm a bit surprised I didn't notice any
aio_context_acquire/release() removals in this patch series because I
thought callers need that before they switch to
BDRV_POLL_WHILE_UNLOCKED()?

--GgBdaJCc3KdSO0V7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxMKUACgkQnKSrs4Gr
c8hPrAgAiASYOFYLPgS0NIZ6WSGDR7S5xJAnLXDIGUVUXzmpbTqnxV/vysqvGjmv
kNblTgdlA7uh6nbLOHZh0INPF6Sob/e+iERCV2FS4wUEVluwiyP2b36AMSyTHc8x
wNsRY+YbFHuxylWG4UvylCiF96uhmS1bcfZOnjhtsGqUaXqqxWslnV74PaMvQQ20
PxglTBRJh8puxbYNKFbglXcdxxXcQ8CHwLK5BijsA83NiblXQXyux2R7qa/7toq8
AzlvWSJuVUQqj0Pwyuz3Pnt8+vZLSILk5fiM2CMvhoX/1mOBlhSXfSDNPsoNAYwC
9ezVc6tgCmm6ldWep85fTOowqHWlMg==
=2Er4
-----END PGP SIGNATURE-----

--GgBdaJCc3KdSO0V7--


