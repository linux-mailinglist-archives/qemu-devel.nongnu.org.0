Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B464613DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZuf-0001Yn-6z; Mon, 31 Oct 2022 14:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu2-0001B9-0n
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu0-0003hm-Iq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3XwA6QjrcHXVXQ0Y3jBY17Trwv0AJm+I+6FFZicpkg=;
 b=OxAr/zOpfAc+mI3lNVByMyx5neKcibLJEIngwTyWgU1bPG4p4u7clThC3wKZMTRv0yKKHe
 2ZhFdWuf3M7cOK8fqoR9pSV26f0APj4x32sxgzAyAWzi4dmmO2AZ883ddgU8CiY6Xq5oDt
 k2X97BqJ72p+t1/z4Nl+76y9QoPNgmQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-i4V31SoXMeODhhqinT4CMw-1; Mon, 31 Oct 2022 14:52:45 -0400
X-MC-Unique: i4V31SoXMeODhhqinT4CMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72E9F884342;
 Mon, 31 Oct 2022 18:52:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E33872028DC1;
 Mon, 31 Oct 2022 18:52:44 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:38:31 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>
Subject: Re: [PULL 0/1] Imp 202210 patches
Message-ID: <Y2AWJ6rfHieP4StK@fedora>
References: <20221028174546.88683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CXcWyxtJkYllWyrD"
Content-Disposition: inline
In-Reply-To: <20221028174546.88683-1-imp@bsdimp.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--CXcWyxtJkYllWyrD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--CXcWyxtJkYllWyrD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFicACgkQnKSrs4Gr
c8ge5ggAlKkvHIQfEX5cluQ7tiXw9Ft/EdEdBPlL78UVxB1LzNoyzpnXnsNOYJ5W
ZWolpB3V/tRVX6mTWIQYdpGGiXbxgsT9R+Pho2vu9X2OMKlSX8LCs07LR95Yb6XS
GWt/kPCISodimvKx65jb6Q+n/6jvJhPabDuGKopAg3PG2bJWDac/igKpkQ/Ihs87
o3oUGKirxkiNFIY/SDbWt0HD3xUfRpS7HkaxqA8bIPeAS2yuEnKa8OyZc9EraCZo
um620VEuYge1giD35eUVboCVVRw0qvC7coaWV5v5o3VhllnKD/dLK9EzAwwnotKL
N0/V/GaNAQO2Cv8WSv8tSjpCegsb5g==
=/bEL
-----END PGP SIGNATURE-----

--CXcWyxtJkYllWyrD--


