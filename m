Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E761445A360
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 13:59:21 +0100 (CET)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpVOK-0005gC-JE
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 07:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mpVNO-0004xz-PU
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 07:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mpVNL-0004Nw-6m
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 07:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637672297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IU9/wU7Xp8HvRHwDiKs92LBfdq4AgDeAylpUev7ZsDI=;
 b=iHWA3v5kkTbPBR2kIP1jhOwzj+Tp+EFL87LYfgwmMdJHcwgJFZqOGxAUfjcb0I1lEhAJam
 v0NhMylc0Dhmi6n9hEhdpjPN4wpptOv9RK1MdOiBP4DrQfojAXAp42u17qSY5Q/h4kzHJH
 oLvLcnNNgkbX+r0+IYcpmXmNNa+yb+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-nGW9B4czPQujZM5_DsJNkg-1; Tue, 23 Nov 2021 07:58:13 -0500
X-MC-Unique: nGW9B4czPQujZM5_DsJNkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6F88066EC;
 Tue, 23 Nov 2021 12:58:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F7EF5F4E0;
 Tue, 23 Nov 2021 12:58:08 +0000 (UTC)
Date: Tue, 23 Nov 2021 12:58:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
Message-ID: <YZzlX60Yj9uURH/o@stefanha-x1.localdomain>
References: <20211118122912.4051779-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211118122912.4051779-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F+QGGX8aCVz0nJ+f"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--F+QGGX8aCVz0nJ+f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 01:29:12PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Add a page listing QEMU sponsors.
>=20
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
>=20
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Since v1:
> - move to footer (Daniel)
> - only list sponsor who asked to be listed (Stefan)
> ---
>  _includes/footer.html | 3 +++
>  assets/css/style.css  | 6 +++++-
>  sponsors.md           | 9 +++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 sponsors.md

Or with Daniel's suggested change:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--F+QGGX8aCVz0nJ+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGc5V8ACgkQnKSrs4Gr
c8jqCAgAh4hfOBQfQ835QHhCfJ8xmeqcadwrqQymJR6+u5LGjmjOwgH8cSDquxfg
gjULnApm/Xa6r5SOZb8stiS47Al9R3GggXzbiCryyRVNsxXjE7ZU9dLLPXYd4awA
HnOSIUlWWaZXG/TvedbuHXfUWM8anzQCMpliJcZ/fcShjTAvTTrl3TztRGWxnURB
HabVsP8eeaqCph5GlokOQ3Jk/M63g6bRhkNjqfdNbkWsL3j0TGlF2Jct/hDxIrW5
3pS7lzgpSOpVe4zO8OO2usLzOOD+/FxcrdernpIVUOsP2TjxTrhelRpBDJZR3kXJ
iz1SY5KSrFiLgkk2CUsj1Nd94pIBlQ==
=7lnY
-----END PGP SIGNATURE-----

--F+QGGX8aCVz0nJ+f--


