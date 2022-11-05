Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774061F4FF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:12:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2qg-0000mz-Ft; Mon, 07 Nov 2022 09:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os2qe-0000kK-DC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:11:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os2qc-0005po-3W
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667830236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSz7Vt4sgb6P1K1twuWPkciibpJ2tXsduT8a8hC5z6c=;
 b=c+eqQgWMtRXhvmR7X7DOgpkS34dqLXaWBMsdhGzV13wPr1ovBBZfFXsLrw3ZYEWdHGc9T+
 TYoaxIbz/8yXYMmgzVlZo5tECyvnPP/dwkTd9p+c1KFYRZJgDcCzesTJdukmyedtRrfDTR
 Gtc24em3UA/nBkQcp/liuCRErBMKEWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-C-s78S9gPEmYiMdZMNap6w-1; Mon, 07 Nov 2022 09:10:32 -0500
X-MC-Unique: C-s78S9gPEmYiMdZMNap6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B4451C0BC69;
 Mon,  7 Nov 2022 14:10:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 956AF1415119;
 Mon,  7 Nov 2022 14:10:31 +0000 (UTC)
Date: Sat, 5 Nov 2022 08:34:53 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/7] target-arm queue
Message-ID: <Y2ZYbfe0oDAlIA71@fedora>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7nWKAV88PnRciJh0"
Content-Disposition: inline
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--7nWKAV88PnRciJh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--7nWKAV88PnRciJh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNmWG0ACgkQnKSrs4Gr
c8jZnQf7BFxB9LJ4PBVgMpOOgdd+vKRkMOWGspKxi8JGxKS65dTADFYfdAQFb8yL
RNXNMmv5RHBXMTLCauGcBbC6m99IY1C7z+6qLt7tRtzHf1IXFwGeOgNylM57rdLd
Cyj24PHo8x4yrd+ElbQpgY9lSYV0km+ZHKqdVNb1QhRUcK07ERUY4Fzv+lJFe4at
jQB7cZAL/dVQKZZuI77mJjuPQbZfoms8zqMlTG21Kyfzc2JDdF6JrWbgpKRNmBT3
JmcN4n7DbRRx3EniYKqWh3Gly3WlAxWvLMK8dIac9dLxlKznS322eDo6ZQQVQFoG
IeW0paerg39QGGAgTkbrdpCr9d8AcQ==
=HoFw
-----END PGP SIGNATURE-----

--7nWKAV88PnRciJh0--


