Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83ED61377D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUVj-0002yN-4o; Mon, 31 Oct 2022 09:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTi-0008F9-Gc
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTg-0007ld-Dd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1AlA2gRF1HFYU2EhKMXAThAbXHYBrqCHzngbTtTlnGI=;
 b=LvYFE76hIV9MPoEz4Ab8767aFJpSumK6WLkmxP3ZNU12TNxDHi5cXZGf05PDM9PgdFBgE5
 ZbUiBHnfJ/4owEie0Q8b1C4SUgl5KFh4My/QGMTyy4YHbGXCFnBTwIMArzr1B1uZTqEzVy
 J6v5yAGvWLx3K0KCx/ocvXbyy83sciU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-llBRn15xPtuvLBIMJf_E9g-1; Mon, 31 Oct 2022 09:05:17 -0400
X-MC-Unique: llBRn15xPtuvLBIMJf_E9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 691EA1871D97;
 Mon, 31 Oct 2022 13:05:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E13AA40C955A;
 Mon, 31 Oct 2022 13:05:16 +0000 (UTC)
Date: Mon, 31 Oct 2022 06:14:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>
Subject: Re: [GIT PULL 0/8] Host Memory Backends and Memory devices patches
Message-ID: <Y1+f+4yuX2u94mMB@fedora>
References: <20221028095225.86118-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mmeZhmEjJwcfxntD"
Content-Disposition: inline
In-Reply-To: <20221028095225.86118-1-david@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--mmeZhmEjJwcfxntD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--mmeZhmEjJwcfxntD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNfn/sACgkQnKSrs4Gr
c8gTWAgApyXzW1X6jVjmovNG7HhJFbEWMTTLcJgyAiWYbqDvF7lg0aLIBqcSvD+y
VVFy2n+zVzJ/R3mRvZx9B0LdQDbek61WISnxNrCfxBBixMQ76S0siHQvuugiVdT7
sgDfN/XkuJUsAm9jrdgJQINdAJOnSyNaE+IisRAqCw45AkueY7q30vZwyjtX5mgl
Ch4hczvOii8CL7Fro7dpq7eT6xUaCgjltW0BM28wUmUTbm+o5ifSkM1w2qMbOkqD
94SZffQ7BAU2lPmTnJyDIiSeK5RgVlqfQhjwSU0YJr1adMrW9zfPPNzSb8sFf375
IGFSezpFN3ZVcr10Xn+HoH9usYIjDA==
=ALLe
-----END PGP SIGNATURE-----

--mmeZhmEjJwcfxntD--


