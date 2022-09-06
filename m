Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952AC5AEB55
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:08:16 +0200 (CEST)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZFN-0004he-Pb
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVXiv-0005kM-Mx
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVXir-0005gg-P9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662467429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PooZu5e1duDQsY4lYWWXtrcECC2CpQzsQQ6pzpjaIWo=;
 b=OX+8LdS1QpJ/5H6yVhx2DaRJBiM58zVBSj7wM2UPgve6CefFzRsF3HoeFWHoLuC5rpL4Uc
 XAGDsrpGc0pA2MlRakjPybI/5T3lZId4MfAacOQDRySMzTJGjsQAh91C4NBh1HlAQDa8Rh
 WlQ0Kdv3PyDhAgfZx00KKBm5B6fvUBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-_ZR1frDxPxeqCQphTO_mjg-1; Tue, 06 Sep 2022 08:30:28 -0400
X-MC-Unique: _ZR1frDxPxeqCQphTO_mjg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 382AD299E754;
 Tue,  6 Sep 2022 12:30:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F8B492C3B;
 Tue,  6 Sep 2022 12:30:26 +0000 (UTC)
Date: Tue, 6 Sep 2022 08:30:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PULL v3 00/20] tcg patch queue
Message-ID: <Yxc9YDilU22br7PI@fedora>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6m5WD8E40woDFR9R"
Content-Disposition: inline
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
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


--6m5WD8E40woDFR9R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--6m5WD8E40woDFR9R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMXPWAACgkQnKSrs4Gr
c8jp1wf/SghcR97SMFcdyt1ZbzzfdNQ+1OHfTyE7if6tMzFTlDdVk+AgIK104AME
KAhh+yoSib9bfovIaHOA8ZNBvA3vpLXzNpZBr1HUbS7HTt5BUY/VoVzaC/MpY+Vn
uHuzs2Q1rc98gA0gY70QEqjpWDhGePQzirESb7bde9AphmR1/oVS1R9ngjmtxdkk
V8J0yl/7YTeMtu6TMxICO3HIAeIyU6xIm7QQP/8IxrkY3U1TXyIWhQTArfr9IRFC
JGg9gR4EK4R87+UPOieYgfrRB3cE3qypYDC37CPiV4so3X0bvHiuX1E8MCMAtQwU
/dwH8NEZs4mszszTZYgFZyeDBXCF5g==
=KSq/
-----END PGP SIGNATURE-----

--6m5WD8E40woDFR9R--


