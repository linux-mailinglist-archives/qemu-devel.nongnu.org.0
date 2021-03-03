Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D706032B9AA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:58:45 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVlk-0008EU-U3
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHVjz-000773-Et
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:56:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHVjx-00018T-S9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614794213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nBjG8nW650QvxQQGz5lJ9AsOSM6p3HRE63SnlqaN1Lk=;
 b=RXqhvElnwHDNMl6u/mZ6vS6zeVZklVgY1tYF1OXr0OnI9QJSvp9JVb1rRgI+Sf2vsr8BjX
 kRxK89mp/HEwOM92ZD3wWQ6+TmFFxTEIXro+UAJBHybRB9kaCwT81OEi+lpRmXBDxgnES0
 Pk5HXs3OG3Wk+5IWLykEMmU/uz0mE2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-NQ5PpE7AN62b9ppvnck1pg-1; Wed, 03 Mar 2021 12:56:49 -0500
X-MC-Unique: NQ5PpE7AN62b9ppvnck1pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3452780196E;
 Wed,  3 Mar 2021 17:56:48 +0000 (UTC)
Received: from localhost (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED6C19C48;
 Wed,  3 Mar 2021 17:56:44 +0000 (UTC)
Date: Wed, 3 Mar 2021 17:56:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] vhost-user.rst: add clarifying language about
 protocol negotiation
Message-ID: <YD/N23Ov4PbVoat3@stefanha-x1.localdomain>
References: <20210303145011.14547-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210303145011.14547-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6113DJEvE2kc3A3p"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jiang Liu <gerry@linux.alibaba.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6113DJEvE2kc3A3p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 02:50:11PM +0000, Alex Benn=E9e wrote:
> Make the language about feature negotiation explicitly clear about the
> handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
> avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:
>=20
>   https://github.com/rust-vmm/vhost/pull/24
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Jiang Liu <gerry@linux.alibaba.com>
> Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>
>=20
> ---
> v2
>   - use Stefan's suggested wording
>   - Be super explicit in the message descriptions
> ---
>  docs/interop/vhost-user.rst | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6113DJEvE2kc3A3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA/zdsACgkQnKSrs4Gr
c8ijbAgAk2ssYrVqkqbLA/8OIyHnGYqqVcZIzficuf7Z9k+9mdqJrDp0omMs4ccX
3g/Sirk7O/chHUBL0ucycd+oewSjd9L4Pp3feoZxstKa0TyY/WszIqfkHyTZoqWv
upwRPxkgJ9fH/GO+D1eTZtm1tXA3XMvJBhecIuw6k12/bCFTFNKa/MnuyxE44PS7
8BelB0bMATNBo8hyZTv24oCkoUye5ZxSs0rKVygVLunucehszaM6GegvPWXGMnAl
nhLUI7ju6X0ZuLKmY8iG2bGqzxP1iHYhCVPoq7cuX+BzDc+ptbHUeM7LaIia4cXP
QM3xWDj2Gm+ZRo4ZFfzlnG/J3pbTrw==
=WLUo
-----END PGP SIGNATURE-----

--6113DJEvE2kc3A3p--


