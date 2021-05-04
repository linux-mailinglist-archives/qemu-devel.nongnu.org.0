Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC77372CD1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:14:04 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwkM-0001En-PW
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwj8-0000lG-Gk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwj4-0002S2-Ga
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620141160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=byxsm863H2VCcoAz4ug3EylNPJwYmMzRm710h1Cx+rA=;
 b=fEVQEQYI6EGeBHzKNAFvD/LiNZmjoTeXfy1HyVM4IzKTnsOhhGkTIN/Yaefdng9V9wRS9d
 5HrLaDfPwMMKCKzijWgr/qVp+yfDLBVsWb4L623vfTQHngsqccDf7VIbhScC+mkfuzuvpL
 VuakFGG9blKOzHzxhbhQDcQ8AsE2Ruk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-rQ5V5dZ6PWOBh8DZPZ_VSg-1; Tue, 04 May 2021 11:12:38 -0400
X-MC-Unique: rQ5V5dZ6PWOBh8DZPZ_VSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7C03107ACF8;
 Tue,  4 May 2021 15:12:37 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B5A45D6B1;
 Tue,  4 May 2021 15:12:37 +0000 (UTC)
Date: Tue, 4 May 2021 16:12:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 02/26] virtiofsd: Don't assume header layout
Message-ID: <YJFkZA4O+KT4nunq@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-3-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-3-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+gHic+xH234Qie+K"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+gHic+xH234Qie+K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:36PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> virtiofsd incorrectly assumed a fixed set of header layout in the virt
> queue; assuming that the fuse and write headers were conveniently
> separated from the data;  the spec doesn't allow us to take that
> convenience, so fix it up to deal with it the hard way.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 94 +++++++++++++++++++++++++++--------
>  1 file changed, 73 insertions(+), 21 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+gHic+xH234Qie+K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRZGMACgkQnKSrs4Gr
c8gANggAk+5DPo3kDQ9APbrx5HDtEJmdmbvgOH/NNIN6XRhmKOMpz0XOk+K/6+y7
sdJPPsRatzXtl5PfxE5i4/bblNlcvFAD6hKU2ZGuJvMD73s66oQ2Vs+zr83K7cr4
W209oPi2tZb7h8LUNy5CAi5JUtj1h62ey0oVBCZ/KSC80zH9G3iHU8v07jkILvdN
hspYfdZHE61iNZwOUeucxoeEaoLuAWRoElb41YZ1zoXK0o/sW0GYZfKofoBGAn60
6mJGrKQPWVkSMT+3KWHwo3bqleq/cS3ds6wCP8CPR0TrNeVWHhjX7pj3CJjq3oh9
oLFIdjhyN0Hb5X9+AY/xrMVdnx02yw==
=HQRB
-----END PGP SIGNATURE-----

--+gHic+xH234Qie+K--


