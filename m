Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08C43B76D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:40:54 +0200 (CEST)
Received: from localhost ([::1]:43786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPVN-0006HL-FA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfPPI-0006V9-5z
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfPPF-0004QR-Fi
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635266072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9s7FHgPJuojaZcSwGg4jHThruvUgpJeP88dPmsZIi/E=;
 b=SUqRWL4h+MlZDjqwQmtFvY/QNZDSVzK1DXlOlsaeh0ijtDUV7pKnKbrEFovOLNvJ9wS/oF
 vRn6FBmfTIVFdcQqZeW/jaGeTSZ1Iwkqu5DXbIm6aBGgco3E+9wVg0ArZqjjRAjOcwB322
 1gV+j1AlKvf34TzGVpn83bU41xjkB04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-tRoa1MjNNwyfAeHGfq3Ogw-1; Tue, 26 Oct 2021 12:34:29 -0400
X-MC-Unique: tRoa1MjNNwyfAeHGfq3Ogw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25652801FCE;
 Tue, 26 Oct 2021 16:34:28 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB9FE10016FE;
 Tue, 26 Oct 2021 16:34:27 +0000 (UTC)
Date: Tue, 26 Oct 2021 17:34:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
 <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
MIME-Version: 1.0
In-Reply-To: <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N8li67rO5Ym0sF0x"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N8li67rO5Ym0sF0x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 08:10:16AM -0700, Richard Henderson wrote:
> On 10/26/21 6:22 AM, Stefan Hajnoczi wrote:
> > If "safe" TLS variables are opt-in then we'll likely have obscure bugs
> > when code changes to access a TLS variable that was previously never
> > accessed from a coroutine. There is no compiler error and no way to
> > detect this. When it happens debugging it is painful.
>=20
> Co-routines are never used in user-only builds.

If developers have the choice of using __thread then bugs can slip
through.

Your assembly get_addr() approach reduces the performance overhead of
TLS getters/setters.

Are you concerned about performance, the awkwardness of calling
getters/setters, or something else for qemu-user?

Stefan

--N8li67rO5Ym0sF0x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4LhIACgkQnKSrs4Gr
c8j70Af/YC2+XYC1qo8vCONHfOWu8j3fTgCqs1+HrWzJ3rB2JYAdb8Nbn6RsjUQr
BfAtpsQOU4EncLgUT46VZoR0L+Pzs+2TvJGhI1kegaRnOfqrn/4tUFVXcpveXIGn
vGAmCZ76qQx6zNImGbFnPWl76SVq0Y+ZI9spgQrpEWZeKAXDgxYEyD6IFHinrBwX
NdjVQmYMIbGNilIr/af5+9g7CKvk+02TuudiXP5jIZgreek3wzLVL22UCxDPxT2I
ChQ1Y/E2DPfIfTtIrSpYUaSEBcz9XAjevvOapY4wqi1TzRU/wqy2+/y3IcRZGaR0
ndOAcwL/4s3SAz9uUCGUTc+LCtzzuw==
=aPFN
-----END PGP SIGNATURE-----

--N8li67rO5Ym0sF0x--


