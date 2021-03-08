Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA97331342
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:21:08 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJId1-0003yy-I1
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIa3-000313-2y
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIa1-00007f-Dc
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615220280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27FLt98suhgdTcsgCqCuM4B9NABcBHC0ApsTxKJupRw=;
 b=AwVp68UW0486h6SOZ/S9N0oRmc60yn8kv05TBEjdT1uSGrxLWw6Dkt39euh6JHjDUOQSUs
 BZgUev/scPKqRaaTd0nXJXJH8CJoi7hZaIJPP5jcnX4YasUZ3dxd6HNRSI23w0CDlA95JT
 jHNZmyYOgJe1hPO+AsXuifKeQ53Q8BE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-D9gcAGTAOGSbdtH7kLg68A-1; Mon, 08 Mar 2021 11:17:57 -0500
X-MC-Unique: D9gcAGTAOGSbdtH7kLg68A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409A3817471;
 Mon,  8 Mar 2021 16:17:56 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 262A560C4A;
 Mon,  8 Mar 2021 16:17:48 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:17:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/5] scripts/tracetool: Replace the word 'whitelist'
Message-ID: <YEZOJ5qT2uMSocsq@stefanha-x1.localdomain>
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+WEDDJ+ilCoVMlUx"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+WEDDJ+ilCoVMlUx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 07:46:41PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
>=20
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.m=
d
>=20
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  scripts/tracetool/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+WEDDJ+ilCoVMlUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGTicACgkQnKSrs4Gr
c8hGtQf+MfJfpFvLXQqT4pCcHfju8wovU4ynqWRs6FWQiv3qR0SbnRtXq4rw5RuM
HK1Oa4AiaxQyin74RaU4CIKXCm9T1WFjwNWwa+IXJFfsAgm7iZ0X8erhN56L9Hr3
LFEzfWT7Czvi7xwAkt6lk5ERtoFVjJGBRJSzoI+4KsH1VEG+Bk3nsbUNAIkiJXKh
LRF/dS6m90DmCFVAxb6CZuSgaTI5ziX0J2kunXYwTzyctuicmyJx2YdTW1eLfspa
+ECGdMOAYTgeulQZUoO7M02s+wERr27/dZXTEYVk1PcsvJb9WjJKEcLJFcP4mOPH
fyLzJmzuDKu67/FK5w+5pgizQhCvfQ==
=70yb
-----END PGP SIGNATURE-----

--+WEDDJ+ilCoVMlUx--


