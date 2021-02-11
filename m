Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9659318B08
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:45:31 +0100 (CET)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABLe-0003pN-TX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lAB8Q-0000L3-Bh
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lAB8M-0005eK-AJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613046704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6y17JquV5gV65TiDNPOs4Rlom+HtKWmzz2cLoFHJqGw=;
 b=aDK9pIC0pxsTyFEXO+0d0HwcOvu9Jj1jb+ejZgmP2Nbtyu6pWS4h53gIUyFTRnDCaWcOn0
 TbMCnt/AeH6B1DiGZFjm8d1F1X9e5Cp8YYwVdRYbqlq6VIKSf2sdT8xj+nmy19XeX3rx9r
 MxOF28syY6iJOEbemURPYHeSU7Q1XQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-XZlSAJS_PzijtSdIDqM5Eg-1; Thu, 11 Feb 2021 07:31:42 -0500
X-MC-Unique: XZlSAJS_PzijtSdIDqM5Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 354208030C1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:31:41 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7F1F5D74A;
 Thu, 11 Feb 2021 12:31:30 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:31:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 09/24] DAX: virtiofsd Add cache accessor functions
Message-ID: <20210211123129.GJ247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-10-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-10-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KjX7LgAomYr70Ka9"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KjX7LgAomYr70Ka9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:09PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Add low level functions that the clients can use to map/unmap cache
> areas.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.h | 21 +++++++++++++++++++++
>  tools/virtiofsd/fuse_virtio.c   | 18 ++++++++++++++++++
>  2 files changed, 39 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KjX7LgAomYr70Ka9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlI6EACgkQnKSrs4Gr
c8gEEAf/QJ6MsNwhLl8/dAj+EPw94oqY2LEmYM1rfozOHGV9EP0Qr74J3FcFOO1+
nubRH65g+mRTSJWBkaOyOsOjXJjoac2I9mPnopcu2R+VKgaPyWaCrlv2mgI8DWH5
4meEcVYGxSqiplD3gUULSJmSy3bH+sTLh7OTP1VRfkV0eGEKLwi8Zrn/U/Y/Q4sL
/FjiS6HRB3BXgCT3IW+Okvw2pYih2ieIkWlUyYwK9f9nRzFBU3EKRnRg2dMcP3Ja
0NM+h9iERReUJoAHRH5ujurxfkjsy2z3udP/dHrU7MiIuoUn0vqaNQlUu6qqJ5v2
9tATKto3vjRTBzBaWxXQpG2WZunTCA==
=zyGP
-----END PGP SIGNATURE-----

--KjX7LgAomYr70Ka9--


