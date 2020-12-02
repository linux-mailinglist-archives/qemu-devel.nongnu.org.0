Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5432CBFA1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:29:19 +0100 (CET)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkT8A-0008E4-Sr
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT70-0007Ca-PI
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT6y-0003uu-Hu
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606919283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l8C72Lz7xnsHc5Svkf7WCGI95e//0he6BnaoKfXL3Dw=;
 b=Gnkio9MDWkUzv5iu41aYQzCGkQi5Gy6uCAG7MTWkyMIUKbU9JkH3mN9LMcC7/B4SdxjCVf
 75jTQOsCLTTUaiVFTxqx320mCZSKovxWbxDUW23DtKkcUPzlITIGSt+1BQHSAwakZ70PSm
 r6hjnHEESJrJOKtjTeD/uNNV0GkcFNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375--acdJ-aaPV2u-sZIQCLKng-1; Wed, 02 Dec 2020 09:28:01 -0500
X-MC-Unique: -acdJ-aaPV2u-sZIQCLKng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABA5D817B9D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 14:28:00 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA7660636;
 Wed,  2 Dec 2020 14:27:54 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:27:53 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 6/8] libvhost-user: check memfd API
Message-ID: <20201202142753.GH655829@stefanha-x1.localdomain>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-7-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="17/8oYur5Y32USnW"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--17/8oYur5Y32USnW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:06:38PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Do not compile potentially panicking code, instead check memfd API is
> present during configure time.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c |  6 ------
>  subprojects/libvhost-user/meson.build     | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 6 deletions(-)

Runtime checks are useful in environments where the QEMU and kernel
version are not matched. In other words, if QEMU can be built against
new kernel headers and launched on an old kernel then it needs to handle
ENOSYS. But in some cases this situation is unlikely and we can stick to
static feature checks. I'm not sure if it matters here, so...

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--17/8oYur5Y32USnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HpGkACgkQnKSrs4Gr
c8h9iQf+MY6eyIza0SGfax5QEb4x8mUkHg5t70phL5v21u4K6LJridr4RGqDQKMj
RV2mVNc8Vk8kkkAxzk23EFB/5FR2nZWCZejm+uJ5CFAYSN/YbTczGaCd2PUw8wgy
ID2TCu1xpCQY0ujaUqExB5QdlDCdKkTNTRKvI0tHLLGohlvct85iA2cItWOtpCV0
V6yJVnf2kxxTg102Sld4qXhQIb27TNXsvZYBWXkdDdq9ERh7A41Fbjs3A+hI2v+G
rsgdfazI/6R5ntDCowAYye1XO8yvzhZurwFlls6SXfZkbpfQtYW58SnWoI8hYpBh
dwo8UflxblL8OeNR1RUZyyaZ/jnkdg==
=JZdQ
-----END PGP SIGNATURE-----

--17/8oYur5Y32USnW--


