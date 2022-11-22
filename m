Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D5634849
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxa0L-0007kQ-Ax; Tue, 22 Nov 2022 15:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxa0I-0007jk-Jc
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxa0G-0000JV-F7
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669149382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4O2RI+JzryDg0z1/I5BHeiwOfaPMplV7mAD/rjBP/+0=;
 b=bWvqK6MDuTSqumB96+1YZ57xyfrhlMNFQOsGULtXkCvPVvbEvPVl8SUwdcY1OI8E1FHUGi
 s6iCOdpXHk9weRqsZiVQ4J8aJfRAFP7c5o+Y4Df/IuaIfj66pN1PjbYOJ5CfLTAn84FemO
 EPXV6dp0xvwNIFJA2qPkZREbZ4zOV6c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-FT7vJFQ8OLC9eNqYCGh5xQ-1; Tue, 22 Nov 2022 15:36:20 -0500
X-MC-Unique: FT7vJFQ8OLC9eNqYCGh5xQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F7FB1C05EA4;
 Tue, 22 Nov 2022 20:36:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7471121314;
 Tue, 22 Nov 2022 20:36:19 +0000 (UTC)
Date: Tue, 22 Nov 2022 15:36:16 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/2] target-arm queue
Message-ID: <Y30ywN8RsZt895yc@fedora>
References: <20221122163954.1900093-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zgrdj7qi6yLfCCG9"
Content-Disposition: inline
In-Reply-To: <20221122163954.1900093-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--zgrdj7qi6yLfCCG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--zgrdj7qi6yLfCCG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN9MsAACgkQnKSrs4Gr
c8hrNwf4+1lDZjw5YHy4Pn7BIRFNssXIh2cIhNGsRNCBiwB6BBVuBma0OKaiDbff
ht4ILQKjWNJRFHIvgMhQMa8qrXUpQym9hIPzCTciowkI70iaBbAeMRIhvThObwP/
YIwDqi1E0akvZLd45Kaqj7t0kI0MfGpk9gF6uug4X5WgEOY0KERmhLrsky378CRR
8gmUwkmrBdl+cUwbgnjtsXhU9e1ey+BPMHiJunaiX8oDRAh7YGlhDUB6UoMWmXVr
BokZg16TdLPeg8t5cLl43Tz112JYAWe2PdHPWVJuI7qCjC3X4Vc2UVzfHzXtNFrL
lcMUvz6+rxB7iRrWu2x139S7Ak93
=Xvxx
-----END PGP SIGNATURE-----

--zgrdj7qi6yLfCCG9--


