Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF875A00D3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:56:35 +0200 (CEST)
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQucE-0006RA-Py
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQuNt-0003Jo-Qx
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQuNk-0005BK-2T
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F/xop8NPaQvahPU4F3IgRTMKaL6Sh8zrmc+vxmHkfNc=;
 b=h4Nj29gQQJg84Bm3nwKAHAU2IclIXNA7Ww4wdBnLPvomYeaN5xco48nv10tXZGNWcBWzMU
 ZlTPVsuF/iCWVjjOhHx+nA3OeuNi1h8vEYSxRgHVE4xYzawdHJG09RtuN/z0Pzc03s3B9P
 Hdx6iR9yKrvtH7KLb02fXK7nlsxJnRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-ZM6ZANV8PlqUJoD0uR5pUg-1; Wed, 24 Aug 2022 13:41:32 -0400
X-MC-Unique: ZM6ZANV8PlqUJoD0uR5pUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B0C780A0C2;
 Wed, 24 Aug 2022 17:41:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5C0640CF8EF;
 Wed, 24 Aug 2022 17:41:31 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:41:29 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yusuke Okada <yokada.996@gmail.com>
Cc: qemu-devel@nongnu.org, Yusuke Okada <okada.yusuke@jp.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH] virtiofsd: use g_date_time_get_microsecond to get
 subsecond
Message-ID: <YwZiyXqPTlSadOOR@fedora>
References: <20220818184618.2205172-1-yokada.996@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LRng2wZE5VDJdb4c"
Content-Disposition: inline
In-Reply-To: <20220818184618.2205172-1-yokada.996@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LRng2wZE5VDJdb4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 02:46:19PM -0400, Yusuke Okada wrote:
> From: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
>=20
> The "%f" specifier in g_date_time_format() is only available in glib
> 2.65.2 or later. If combined with older glib, the function returns null
> and the timestamp displayed as "(null)".
>=20
> For backward compatibility, g_date_time_get_microsecond should be used
> to retrieve subsecond.
>=20
> In this patch the g_date_time_format() leaves subsecond field as "%06d"
> and let next snprintf to format with g_date_time_get_microsecond.
>=20
> Signed-off-by: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Thanks, applied to my block tree for QEMU 7.2:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--LRng2wZE5VDJdb4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMGYskACgkQnKSrs4Gr
c8hJSAf/cLxeZMni5nzjFmanveCyoRWXfEpLodpRJH9glUWDwg0tHliZAYXg2Cdn
tvdcaRd5KsYgoKcZujZIY54aNQ9LN+o08jQwNJpLNqIJ+ZfXCcbz7/ufExN+Bfc5
tmFNDzyi/wk2brHGanuQltWzP/xDzCHlZiHetjiaVBJOLAqiN1E4DXz8wn3EJlKi
iEudKuWK/wZXIPDuD8iOT22us2D5jmd5hkIppcfAPXUxRJWRm5MZ6RGloZXzOOhv
Zq6nCrm5v70YB5YpJujbxGiQHXcQ2m1XfFUgtsEay+Wso4Lw880wl46QyUYASsMy
1NhD4KX2t91PrS1Uf3J5HwdMGnruqQ==
=yQms
-----END PGP SIGNATURE-----

--LRng2wZE5VDJdb4c--


