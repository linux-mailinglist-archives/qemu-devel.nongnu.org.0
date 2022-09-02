Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3025AD1FF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:02:06 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAnl-0002Zr-TT
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFG-0003Bn-1F
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFE-0000SY-H1
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662377184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=moM3OMGRb2tgrV4Q7Ymm2zqV6ZeaHwMvUj3R0WVQiWE=;
 b=SPsjXTkVbKD5afnq8VSs1fvxgD+FVA++9iHGFmt3HLxhOvZ2JTSpW4xuD+WlIbuUcF7lap
 1x1W48mAklMfq7TuDKQY4rvOQRarjnLkOjw16tpD92mHED++3jd0ss0VdHxZGBcyyQKQ7C
 DYWYcZGBMN+6UchDZOxuqyNCXsZG6ek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-hebT5P96O9-k2Ip3APgTrg-1; Mon, 05 Sep 2022 07:26:21 -0400
X-MC-Unique: hebT5P96O9-k2Ip3APgTrg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B053D85A585;
 Mon,  5 Sep 2022 11:26:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41881492C3B;
 Mon,  5 Sep 2022 11:26:20 +0000 (UTC)
Date: Fri, 2 Sep 2022 16:33:09 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PULL 00/21] Net patches
Message-ID: <YxJohR8eVdXFwPUW@fedora>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8NQ0JXRAbjjNvrx4"
Content-Disposition: inline
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--8NQ0JXRAbjjNvrx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--8NQ0JXRAbjjNvrx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMSaIUACgkQnKSrs4Gr
c8ixfwf/WuchQqmcwriYbhUI2Yqntmdy5eTbz20oVBGz1Whw79jyj0uAFTV0Laag
in+fQKsLETvK/kREVhIH3Gyse7a+WvldbDHt5n8kDgphuMw0KegkBOegDQmmUhqT
LhcI342FgxL6atyO2JrnvH/jwzuPIqyWsv1PWYWL/YjmfYwNV1VRxNxdCx2Rpb0o
Vqp61h+TTGDQIQAztE8FoJ2X0PaZ0RCeMkzB8V3NPra8K4KFoCj4KH7AZ8wbuSGP
YYjt7YHJHwv8/yq1BjR4N7A0+s66zZOBCTmBAYpdgugZBXXy1Y2BCG4cVxgRbhPE
CteXO7vOVGkBbV2mSJpLKlyB78AXbA==
=qJMf
-----END PGP SIGNATURE-----

--8NQ0JXRAbjjNvrx4--


