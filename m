Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B0512F6E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:32:58 +0200 (CEST)
Received: from localhost ([::1]:49468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0W8-0005zg-TY
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk0QT-0002Vc-L1
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk0QQ-00058e-07
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651138020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i4wZKo8brxV+RigM9gOCcTn77rG5NpwZZyJeYlodfYs=;
 b=MhMEk78ViYolux9WC1LbLVriGtWXGF4v4wTtSMVUy/xrtMG6UAiagImx85nvUWt4PLF4sd
 1lvflxxqBRAFv9gMthuYqubHKkVz+gA65zzn17zuHGw6HDz9Uw3qY9R2LEtrax4WyNu7Pt
 9rUSzV7X8arMeJ/m+9VL+BNSIw09GJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-92dmvUbxNQu0BlikVJbNuA-1; Thu, 28 Apr 2022 05:26:56 -0400
X-MC-Unique: 92dmvUbxNQu0BlikVJbNuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BC37185A7BA;
 Thu, 28 Apr 2022 09:26:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C77C2166B5E;
 Thu, 28 Apr 2022 09:26:55 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:26:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: Signing QEMU up for GitLab for Open Source?
Message-ID: <Ympd3xpIu6EOz8hG@stefanha-x1.localdomain>
References: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
 <8735i17278.fsf@linaro.org> <YmaunCsOBmTZyt2Z@redhat.com>
 <87o80m4wmm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tWtMjaFy52glyTZ4"
Content-Disposition: inline
In-Reply-To: <87o80m4wmm.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tWtMjaFy52glyTZ4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 12:02:27PM +0100, Alex Benn=E9e wrote:
>=20
> Daniel P. Berrang=E9 <berrange@redhat.com> writes:
>=20
> > On Mon, Apr 25, 2022 at 01:53:28PM +0100, Alex Benn=E9e wrote:
> >>=20
> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> >>=20
> >> > [[PGP Signed Part:Undecided]]
> >> > Hi,
> >> > QEMU needs to enroll in GitLab for Open Source before July 1st to
> >> > receive 50,000 CI/CD pipeline minutes and GitLab Ultimate features:
> >> >
> >> > https://about.gitlab.com/blog/2022/02/04/ultimate-perks-for-open-sou=
rce-projects/
> >> > https://about.gitlab.com/solutions/open-source/
> >> >
> >> > CI/CD minutes also become available to personal forks for open source
> >> > repos so contributors can run CI pipelines without hitting CI limits=
 as
> >> > easily.
> >> >
> >> > Alex, Paolo, Peter, and I are qemu-project owners on GitLab. Has any=
one
> >> > already submitted an application?
> >>=20
> >> No but if we are happy with the terms we should go ahead. I don't reca=
ll
> >> SFLC having any major objections and GitLab seem to be pretty engaged =
in
> >> ensuring open source projects are well treated.
> >
> > Yep, they've been pretty receptive to feedback myself & other maintaine=
rs
> > been giving about the usage & needs of QEMU/libvirt and other major OSS
> > projects.
> >
> > FWIW, I've applied on behalf of the libvirt group today.
>=20
> OK I'll push the button for the QEMU project.

Thank you!

Stefan

--tWtMjaFy52glyTZ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqXd8ACgkQnKSrs4Gr
c8j9AQgAuuSatYji5mfpYzuj7MzJ2HyRDrQsr6GFgOWAm4myF3TqqSclh8g2c68N
YULYsfhdS10do8lgD81+JP/uia0VvHCGyRmOqkFScyaeuzNQXAYgRTcsde3SInDY
N/z+GP7ElwlvQLkeLxK/RGre5/GyipZSsdffrM9Y8yary6LdG4JFY+6mZnPBOrhJ
IVKybtAwP78MaVRYOKGT1AT16Kl1UcTjVgrqqTyO4tUk4zxXpJaBCTXoWdpw0S/0
jeftvG6qkBgYrA/ba74t8KL0UtVR9lf57B5aQhBeArw+Q22f40Gk8ckPxbcgVwCA
Cfuff1G2eyy7eSIgTRQst3NRNDYGKA==
=+39z
-----END PGP SIGNATURE-----

--tWtMjaFy52glyTZ4--


