Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374575AD1C0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:46:39 +0200 (CEST)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAYo-0001mi-0h
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFG-000398-3q
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFD-0000SM-05
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662377182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFAeOzP79e8hHqUlWHeR9BmqywNQJO+GX0+afILSREg=;
 b=ZNcCjldv+Tj5M3hKK8Lr2OMBOaS9jVZrgiHcpJGU6tmbd5FybXJrKeGUWRvoXY8mt4oWtQ
 A5QtGQbMgNtxZjkzRZ3PU3H5nFUIPFJtDwDUHcU1fgLYOu8wy0MrSlRcUlAI0nTaRZpFgt
 BgyuwwjnpyUydf2EyXgdnhBUSgaroMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-V6zEBmGjMlGzpLJW4m1v2Q-1; Mon, 05 Sep 2022 07:26:18 -0400
X-MC-Unique: V6zEBmGjMlGzpLJW4m1v2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A05B3804191;
 Mon,  5 Sep 2022 11:26:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3412540357BA;
 Mon,  5 Sep 2022 11:26:18 +0000 (UTC)
Date: Fri, 2 Sep 2022 13:20:50 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/4] target/avr patch queue
Message-ID: <YxI7cpzE2g0A49rJ@fedora>
References: <20220901054843.31646-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z7Ym90DzNSS/n1Qw"
Content-Disposition: inline
In-Reply-To: <20220901054843.31646-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--Z7Ym90DzNSS/n1Qw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Z7Ym90DzNSS/n1Qw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMSO3IACgkQnKSrs4Gr
c8gzGQgAwoFMobThWKlrg04FJoxs2QGCRLJbDgVrJ3sCDsTh79UW8MlibIU11ENp
CR1zSiD9bysjKS0R4uT94tgaYCRz1twHvmVM7YZegqfsEygb/cXxFZDUNi73oBbr
75/700T45BrcgdojJshgQevMbbG4+4yMCVrfqyNHo5T1SWc37YTKDheswL8FrPZw
sVD9wiJ3mOcobb15fkWgwRhZEA7iJkRejvbs5JDCcMC3U4rVQOyLsGoFgCi9FWK/
1BVORJp5LpzgFMRwPUnjFMy6YzR+3yNClFla2eRz72uA/Oc7LnAWuyvEZsvs7LmM
YRUenhXH0x7MvyoerdeE87WjDcQYGg==
=mfWh
-----END PGP SIGNATURE-----

--Z7Ym90DzNSS/n1Qw--


