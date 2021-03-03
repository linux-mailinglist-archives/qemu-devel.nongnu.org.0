Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318332B9A5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:57:29 +0100 (CET)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVkW-0006nS-Dp
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHViz-0005S1-Hg
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHViy-0000q1-5t
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614794151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R06waiacOZJ9MsXLO7IwoLxf2cHC23FyANNKpZlm7e0=;
 b=CurXFK8qYcxuZuKhjXWMytALBU4oJBD7zmNSqt+8E5lZ/ifEnOw5pnAh16GMRTlc79zLiN
 Ww+2ZIq/VMvMPcCMDSb0knz5wuEjcnzLwWoVyRkX7Q45PowfkGv9s/JVTerd2hE2RA7N9y
 zHkNSO2gkyKAImmizH3ocDsIhC0n070=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-lZc915H7ONe9hqKKkFON8w-1; Wed, 03 Mar 2021 12:55:47 -0500
X-MC-Unique: lZc915H7ONe9hqKKkFON8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48CA9100A688;
 Wed,  3 Mar 2021 17:55:46 +0000 (UTC)
Received: from localhost (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B254F5D9C6;
 Wed,  3 Mar 2021 17:55:45 +0000 (UTC)
Date: Wed, 3 Mar 2021 17:55:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs/system: add a gentle prompt for the complexity
 to come
Message-ID: <YD/NoOBsdqT0SFO3@stefanha-x1.localdomain>
References: <20210301112741.31047-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210301112741.31047-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cNjMHqQa/4jMAUW2"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cNjMHqQa/4jMAUW2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 11:27:41AM +0000, Alex Benn=E9e wrote:
> We all know the QEMU command line can become a fiendishly complex
> beast. Lets gently prepare our user for the horrors to come by
> referencing where other example command lines can be found in the
> manual.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  docs/system/quickstart.rst | 8 ++++++++
>  docs/system/targets.rst    | 2 ++
>  2 files changed, 10 insertions(+)

Aside from Thomas' comment:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cNjMHqQa/4jMAUW2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA/zaAACgkQnKSrs4Gr
c8iKpwf/YzMZMDxrLVc6BXQzsKPHY+2/kOQRY6YirT2vKH4ss7K9k0Sxt2Ac8dHe
ztOGiyk6/StsTT90nxbEiS9imESPWC3SuFfuI0PQs4hGo6HlEBLVTv8h8zLiPDie
Itb0a2gQ3Lz27J/v87yfPjzqWEQ0gq1iu/AimKfZASOyMBrg0b7YVTMwJ7CLdcLq
98e/VXUJQy+vDcodzYbIrbrppvF1m2uZanEhzWoHCzfK8PlJR11nfKAV7i3KRZNk
Y44soS7MrKzeKLtIw3Od9RzSyD0qn5uzkCKMpTAu7chSV8bPvLFf1thZnMf4XbAp
4v1CIpgdWJstA2yqwk8BZ7jU6D4YTQ==
=1oT1
-----END PGP SIGNATURE-----

--cNjMHqQa/4jMAUW2--


