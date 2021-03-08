Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0B3313DF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:53:32 +0100 (CET)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJ8N-0000jy-6g
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJJ1q-0005Ad-Hd
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJJ1j-0004Vd-0T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YgfT2fonwCh52Mmw2zagGhKH5B/zfxIg5t3b/xgNcxk=;
 b=cTxbQZuGwEBG0w/Xws1byiQc2En3q1fcV+ln9UPhP4hOCfAPiHyZD8JEelgaDsX7GaSAYx
 fjUn5VQWHJvfSAlW8IXL30dkI0oW2JPMyWCCzJgMTfNBy1Utc4OR76PtAvR6tpOKJZOZiK
 skj3Jy6QWZD5CToC5b0DRYKBH8nCV4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264--J9XfNoNOc-ENmvPL7nmwQ-1; Mon, 08 Mar 2021 11:46:33 -0500
X-MC-Unique: -J9XfNoNOc-ENmvPL7nmwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D73157;
 Mon,  8 Mar 2021 16:46:32 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD57160C04;
 Mon,  8 Mar 2021 16:46:31 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:46:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
Message-ID: <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
References: <20210224213515.3331631-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224213515.3331631-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/CfB8kusWXHGxHoj"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/CfB8kusWXHGxHoj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 10:35:15PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We don't need to generate trace files for targets we
> are not building. Restrict the the ones selected.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  meson.build | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meson.build b/meson.build
> index 05a67c20d93..8503aa1b628 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1826,16 +1826,16 @@
>    trace_events_subdirs +=3D [
>      'accel/tcg',
>      'hw/core',
> -    'target/arm',
> -    'target/hppa',
> -    'target/i386',
>      'target/i386/kvm',

Please add a comment explaining why an exception is needed here and the
rest of the target directories are handled by the loop below when you
send a non-RFC patch.

That will help people who add sub-directories in the future.

Thanks,
Stefan

--/CfB8kusWXHGxHoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGVOIACgkQnKSrs4Gr
c8jSGwf9Htt/tQZi74XykqtGU77kSzRajYI93iWMSd37QWJcKGhNieya7AyuL/Hj
nCQ9xx6xwJCO5r8wZNKxSY9hgsNHivoiLr4dbTBnsqmNPxf0fKmpAq/DNSwZJNXV
oqDZHxY2Rka8sFhqLxfsHEtpdsNeg8V3/Nmrgn8waq0Ef6vHWIQ04HhVtsnB33On
66rbryb1rYgJEQj8qjKBB6ezaCz4/2L/AejqWSQwFIkDlFTRSf2NAOFxM/1p22Vx
5uZLh2oVdm9qT114Zg6Lj27yoq80AwDCK7Sd005vUjao1xlCieuzzzdQQCB9VkO6
5lUiTUjfQKEFVQOQCjXllPSrSlv+Jg==
=A0bw
-----END PGP SIGNATURE-----

--/CfB8kusWXHGxHoj--


