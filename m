Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A72AB40D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 10:54:27 +0100 (CET)
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc3sY-0002O8-9T
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 04:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kc3nS-00077Q-Bo
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 04:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kc3nP-00048Y-8Q
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 04:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604915346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GYQEAAa5h4VRcW2Vu5hfA7ddKZXUga36/qRGMP2q2V0=;
 b=buVJ4zOgXnT+A3s49OgXy8TPftsNVSbSlJrDI7U/hd7zm2jYf/GDnZ93Y6JhYRBNHNeR5p
 qZV8t3X1l9W1yQRfvL9HNZrFB2Y9guo2d3QsJPlaoteDFEkX0HFIMTRGsbOWOV/oHCFkF1
 HMaYXp1jp5r8FVb/9YKyU9vWNauDYDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-e7UtqBW7MxyIjyYIaCXJMw-1; Mon, 09 Nov 2020 04:49:02 -0500
X-MC-Unique: e7UtqBW7MxyIjyYIaCXJMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B3E6809DCD;
 Mon,  9 Nov 2020 09:49:00 +0000 (UTC)
Received: from localhost (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C828277C7;
 Mon,  9 Nov 2020 09:48:53 +0000 (UTC)
Date: Mon, 9 Nov 2020 09:48:53 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.0 v4 14/17] gitlab-ci: Move trace backend tests
 across to gitlab
Message-ID: <20201109094853.GC783516@stefanha-x1.localdomain>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-15-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-15-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2020 at 09:45:32PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Similarly to commit 8cdb2cef3f1, move the trace backend
> tests to GitLab.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  .gitlab-ci.yml | 18 ++++++++++++++++++
>  .travis.yml    | 19 -------------------
>  2 files changed, 18 insertions(+), 19 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+pEIQACgkQnKSrs4Gr
c8iEEwf/c/JiHSybGiq8YiQJTIp92DXHWTDJrTB/0Bz1/oR2OgyGzb35oEFRJZbX
odhL4hrV8JagqrCubA8Q06Ahykfe8TwXX4nws0IAUGYbzFhmd4LKOEyTsMXVRz8j
D+EOgXrT4W6S6BvgZ8fe0nNetcTfRfskEmHm0lCwHFCRqKT54+9KP5dHD1SS+OJL
Cm4nFiTJiBy+gI4tpdxC77d1fIxIOBDL5E8ZOtI0XyGvLpFSdXF7HK2NUHTHW861
wrodR0pxNmMj2JHFOED0j+Um8ZiB05QzuGru9tsBN0W8hPeqO/+yLN5h5BKHnXH5
uXPwSlsEGaB//JXF9cJ/s+xctW4mIw==
=JLQv
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--


