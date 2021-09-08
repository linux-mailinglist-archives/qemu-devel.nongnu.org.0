Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E4403BB3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:43:15 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNynC-0005aT-Vr
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNymL-0004ud-CU
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNymJ-0000ZP-R8
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631112138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yQkx3NLOU4ujNIw6JZOB+GJCMfNdcNOEvPwbUJAR4nI=;
 b=cxcI0nYtrG1HA7btPLkTuOWkIpVKfW+s4GjntPUWXfZfDoFZPmY7DnRDkqfXC7EdGnHJng
 OhXwcBH89eKauZ1Q6zReVBRVKIPWca8aqyieipwZadFdFMo6oijZjN06sjeNgEYktYWod7
 EjAvjzdD6qZMQSXsIAQxmqCQAa1nPfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-daBNFcGpPVeYShhvTzc_Ag-1; Wed, 08 Sep 2021 10:42:17 -0400
X-MC-Unique: daBNFcGpPVeYShhvTzc_Ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 603C9835DE1
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 14:42:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0541C1A26A;
 Wed,  8 Sep 2021 14:42:15 +0000 (UTC)
Date: Wed, 8 Sep 2021 15:42:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 2/2] iothread: use IOThreadParamInfo in
 iothread_[set|get]_param()
Message-ID: <YTjLxwRcwfOj8Pv1@stefanha-x1.localdomain>
References: <20210727145936.147032-1-sgarzare@redhat.com>
 <20210727145936.147032-3-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210727145936.147032-3-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oi9xz5AIOA89NDND"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Oi9xz5AIOA89NDND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 04:59:36PM +0200, Stefano Garzarella wrote:
> Commit 0445409d74 ("iothread: generalize
> iothread_set_param/iothread_get_param") moved common code to set and
> get IOThread parameters in two new functions.
>=20
> These functions are called inside callbacks, so we don't need to use an
> opaque pointer. Let's replace `void *opaque` parameter with
> `IOThreadParamInfo *info`.
>=20
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  iothread.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Oi9xz5AIOA89NDND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4y8cACgkQnKSrs4Gr
c8jf/Af/cZKx5pJYkZnoW/sirAT5xmB7PY3ZIPoQsDs7GYu8D1tNiMbUu8XUzKRx
iCalJxCyZctObLWTGMpa0A99wkyxDmd2HotoiJUHSR7b0Vz6F7e1nJW03YyHKJpD
WBByWLhLDSGaTF6hp2/gisGPcxl2gmp+Cx7E0CwTErPpleD+yyNyHrRohs915wRp
1TSWuIuz8Tb6dTINX3fI9daV35P/Xb0YR+TYENzgjMTrxQCtJJSrAe8zExz4l1hy
5dvsTBsrmaHp4fMf/hz9U4ueK86Ipxzu0Y1mo/S+Ps6LDM27MZqB/QxvAd/lSsvN
xXNEtoWrvBWu+K8/EC8emsADppGcCQ==
=L/5D
-----END PGP SIGNATURE-----

--Oi9xz5AIOA89NDND--


