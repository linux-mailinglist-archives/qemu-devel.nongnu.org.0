Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DE318D36
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:23:53 +0100 (CET)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACsq-00085j-Ci
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lACoD-0002nO-Ct
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:19:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lACoB-0000FK-S0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613053142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yv5IIG+Xjt5YQCFf4B/sQNdqd51yHl+prTrHl4aB0i8=;
 b=R76mpy6NWWe45bMhXpFpxLGV4Ecvcys6IX0LSmfMKumXrPNCgzIfzo6A+1GExswmxjEcLN
 l3ODyd1DtsUoduvJxuW47XTJJQ34t5hiUNDCp5r+j8r235SnIM033jfH1Gz901r8d+azC8
 T7vCnDRhTehb0gDfRTeDKz73wTsrd+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-L5dojYEeMPqwir9Xj25hQQ-1; Thu, 11 Feb 2021 09:19:00 -0500
X-MC-Unique: L5dojYEeMPqwir9Xj25hQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8807A195D560
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 14:18:59 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BAAC5D6B1;
 Thu, 11 Feb 2021 14:18:50 +0000 (UTC)
Date: Thu, 11 Feb 2021 14:18:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 17/24] DAX/unmap virtiofsd: Add wrappers for
 VHOST_USER_SLAVE_FS_IO
Message-ID: <20210211141849.GR247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-18-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-18-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N+qDRRsDvMgizTft"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N+qDRRsDvMgizTft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:17PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Add a wrapper to send VHOST_USER_SLAVE_FS_IO commands and a
> further wrapper for sending a fuse_buf write using the FS_IO
> slave command.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.h | 25 ++++++++++++++++++++++
>  tools/virtiofsd/fuse_virtio.c   | 38 +++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--N+qDRRsDvMgizTft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlPMkACgkQnKSrs4Gr
c8hZ1AgAiC4+Vz3v4FFdS92CamOrd+loZoji2loPcTfiag4R3fgNs2/xRpEEbF+t
Bq52sIe0ued8NYBHtwo6xYIeeJPQ06NBK3dTIf8iFdyXhh/QGtFeXX6+wLPppk+F
ziEPtk52dlMhE4fs/uxvsS5sIrqZoDdF02rw1hBJYS2Z1tBanCO6c+T7nQorhSp3
jxhQzXouIpXAkNUGFXFUP5SAZMZzFDpC1hWUwezMC3bRQT3pN8ox0Ya4TUZdx98K
YKtwXYL1InzoBvy/YI0asPdcotFj58oj9ACNECp4fuO67Xbp9HQtptbkROCAmYHt
6HXU09crj5KbAhATUEtpY1AWAmkq7A==
=Gajt
-----END PGP SIGNATURE-----

--N+qDRRsDvMgizTft--


