Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D8618A87
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:27:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhjr-0004NG-H4; Thu, 03 Nov 2022 17:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhjn-0004Mt-Gg
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhjm-0006vM-2W
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667510817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnXS90rkEwQOQxHKdRMtEnt208o7NdSPmSmCGgwoe4Q=;
 b=fyRSA2r813bUKQKRa+IAzNu408tYPU6qTKgOWjrZbCjJU8uSt5iJAavnpcMaQe46JIrZ6u
 GT0umC1/Q+kueB87C8TnsND0PjX2SG59194CNyBEZYarqJG6/EJfE3Yw0b4KIJhTAbIUwn
 xPFYcaceqFwVGAsRd2apcw1sHyo6spI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-H5hn5IBePjm0Wkg3nmU71Q-1; Thu, 03 Nov 2022 17:26:54 -0400
X-MC-Unique: H5hn5IBePjm0Wkg3nmU71Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B7DE101A52A;
 Thu,  3 Nov 2022 21:26:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A9891121314;
 Thu,  3 Nov 2022 21:26:52 +0000 (UTC)
Date: Thu, 3 Nov 2022 17:26:51 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PULL 0/2] hw/nvme fixes
Message-ID: <Y2QyG+RJQbnC4ixn@fedora>
References: <20221102082555.65165-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RDkqSK+qQNB2Z3hX"
Content-Disposition: inline
In-Reply-To: <20221102082555.65165-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--RDkqSK+qQNB2Z3hX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--RDkqSK+qQNB2Z3hX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNkMhsACgkQnKSrs4Gr
c8iZxAf+JYf1tXGpPDPk3xyhUmy4UJsx/Eehn9Tn6NpD2RK79lryIYY7QpMgQEWM
O1sveN2KikF8GO2w6/NHAFYWm2dTT6p458kjrnGT0El6OOfWBnDHvPqnJ5uFi+Uv
9ablMOi8BxcKyWPNCNEQi9yqu/t752bJ8YRrHXTb4F3344VE5ROBQoCMwc3EiZzu
htXqzr8qU85NI89DHsDRX+3yV6S2XoeS1ZM6vwMfD5gurC5ZyPwryWqEGnC2K75w
jPrAyYBySBOI11c8FJIZvK++NI5UrXIw14ChgWgrE78mStfoJxtxk9+O1aKpfOlu
zoirkAxH8QbA+ICTcwrzKMxIt1hoCQ==
=4Htt
-----END PGP SIGNATURE-----

--RDkqSK+qQNB2Z3hX--


