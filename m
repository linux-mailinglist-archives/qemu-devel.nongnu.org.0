Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C530A66C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:24:39 +0100 (CET)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XJu-0000Jm-DL
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6XIb-0007mM-Oi
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6XIa-0005Xy-2O
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612178595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qe0vKwf6MtkbbnyxBeS3Pa0sxVj4q7EXmQOpicUbjPw=;
 b=DMIC1lpkMND4M9WCxF2t9qOcyZUgt9AiHLFdWliNTalcEEheSc0nC4H8YDG+Fi5RIHWz88
 FrifUDy2WhdnTgGVc6WLH3rmL5J1Om6Cgu8a7jRgYux/yIY3PhVFqimXCro55O8QyKw0O+
 aY+5XgRfWJfVAIgPq99TiEd4kYjyuww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-k734tIh-Mv24V4z9km6ujw-1; Mon, 01 Feb 2021 06:23:13 -0500
X-MC-Unique: k734tIh-Mv24V4z9km6ujw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55B6E8049C1;
 Mon,  1 Feb 2021 11:23:12 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDF551002382;
 Mon,  1 Feb 2021 11:23:11 +0000 (UTC)
Date: Mon, 1 Feb 2021 11:23:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] trace: documentation improvements
Message-ID: <20210201112310.GB160382@stefanha-x1.localdomain>
References: <20210112165859.225534-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112165859.225534-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 04:58:57PM +0000, Stefan Hajnoczi wrote:
> A recent discussion raised missing information in the tracing documentati=
on.
> Add it!
>=20
> Based-on: 20201216160923.722894-1-stefanha@redhat.com
>=20
> Stefan Hajnoczi (2):
>   trace: document how to specify multiple --trace patterns
>   trace: update docs with meson build information
>=20
>  docs/devel/tracing.rst | 66 ++++++++++++++++++++++++++----------------
>  1 file changed, 41 insertions(+), 25 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAX5J4ACgkQnKSrs4Gr
c8gFagf9Ge+4WexNfSgxcQew/cvM1raQBEzrqbx+oxIGS3aenhba1fzGFdS0lrHC
xga9KNsdLm8TlPyxB8URIrEMnXf+EFRhvlMp61cPojAbXq3fIEjiaIIrUhyHMGdA
Vga8P0Q8xDq0oVbGYu4AAofQiOgIHTmw6PDmHxbfRbjovHQP0pJP89Hsz4Yt3F2F
zFu4JdmkmZDbHZ21iWOr6BXp4g96HzGB9tg7s7SZQ85SIA/4iNtMVvwSC1k8SQJs
PpbeaIBKsaMLZJE5WD4aJS+FNpq71EuwuOiHlYAeRWWxMoqQAmLKi6AaBTVeqKnM
BhWiviadCPv1QPBkm7MwhAVPP5LxsA==
=Wotl
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--


