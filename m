Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374D6152AE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 21:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opxUU-0001kp-FT; Tue, 01 Nov 2022 16:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opxUS-0001kP-5H
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 16:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opxUQ-00022R-Ba
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 16:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667333041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KADiN44kWNeruLPtlowFEV1ZjTQC10lbL1rHbUN8yRI=;
 b=R9xcSzh18IJADaRJMQjV9mkuAqtubQn9O0PDITB74pQsgMZmU4KhNPR7s/ZlnvAi3g8DZG
 4eZDWrj2OYNg4Y6fgry6IYudsLPYhxbIlzaoAB2xJZulLVL+iszuAMGx1y1/+1au0ifvXu
 cKHiiPDWpgKWuA7fgJjjrWFWu+bVJ68=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-3FhlkQ5wMTukONI-K4jh8g-1; Tue, 01 Nov 2022 16:03:59 -0400
X-MC-Unique: 3FhlkQ5wMTukONI-K4jh8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9B74101A58E;
 Tue,  1 Nov 2022 20:03:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF2C2166B2D;
 Tue,  1 Nov 2022 20:03:58 +0000 (UTC)
Date: Tue, 1 Nov 2022 16:03:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v3 for 7.2 00/31] testing and plugin updates
Message-ID: <Y2F7rJVByOAaD/2g@fedora>
References: <20221101135057.1294566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XnTiLCkq9dcsC0kt"
Content-Disposition: inline
In-Reply-To: <20221101135057.1294566-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--XnTiLCkq9dcsC0kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--XnTiLCkq9dcsC0kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNhe6wACgkQnKSrs4Gr
c8hqQwgAhQgjV3y7trWx4OCp7XI0YuvNOOJQIhfuytoQOEVhYlfDNM2DNTE/+tTM
Rp3stPlIEq6fvTeI5aV5dew/J4vcvUjXBbATmJ9WsxbXgvac/qTyjXr90YuPy6aF
NUT41LQzl4ZEbwUwXXXQjYmPSQB0dVE2h+LqXY4o4SalH/4vtwSR44fXd8hBGAzQ
c9kb+F/DO/vVNrcAV3SMVWms9AIUDK76h2Ow+31k35t1TTf/ST90qeSi5SHSOocP
lzKDtqbvv9blsYzhcCMW5RBf41/4rn6SguD89PgAEIkoU4jb1nxqrys1rmaAsthN
3sk2rjfLZkkxA8RgelBxV7WG6uGuPA==
=w2El
-----END PGP SIGNATURE-----

--XnTiLCkq9dcsC0kt--


