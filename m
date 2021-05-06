Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF7375755
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:34:33 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leg1I-0001hx-KI
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefwq-00006L-LP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefwo-0004cD-PE
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620314993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7d+H6o4edwNPnS8UqxM/gjYPL3c6Z4XisKly7bwbvhs=;
 b=EJn7PND2HG40dWijuhBNAuiZoSEwmVRlX5WPSh3EtMTa98AFs/3p8IycXYzZKOOHEqC5Ut
 veLXjimZEEnyKSlkLWUUcrWrYO4rUNRBs3ae9Jt3DOKhdkwCosjUMJYvQgS3nQ7NNSNCRz
 IGk8YWzFraBGm6B9wLJefzISl2+xWw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-dE_PP_oeOKqzk1Z45b4lCg-1; Thu, 06 May 2021 11:29:51 -0400
X-MC-Unique: dE_PP_oeOKqzk1Z45b4lCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 146CD1139C89;
 Thu,  6 May 2021 15:28:05 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FDA65D9DE;
 Thu,  6 May 2021 15:28:04 +0000 (UTC)
Date: Thu, 6 May 2021 16:28:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 22/26] DAX/unmap virtiofsd: route unmappable write to
 slave command
Message-ID: <YJQLA1S2DcJzrKds@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-23-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-23-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sB5T+Uov0QsJqPIM"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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

--sB5T+Uov0QsJqPIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:56PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> When a fuse_buf_copy is performed on an element with FUSE_BUF_PHYS_ADDR
> route it to a fuse_virtio_write request that does a slave command to
> perform the write.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/buffer.c         | 14 +++++++++++---
>  tools/virtiofsd/fuse_common.h    |  6 +++++-
>  tools/virtiofsd/fuse_lowlevel.h  |  3 ---
>  tools/virtiofsd/passthrough_ll.c |  2 +-
>  4 files changed, 17 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sB5T+Uov0QsJqPIM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUCwMACgkQnKSrs4Gr
c8ihLQf/cxQloZQ/KGMBKJR4MJDSL8dxCCJ8fYx+caqn08M6MFdQFKc/Dsw3nkY1
err4xoubUXzLeOejUW/8ZXhoXASmtV19X1myceXsvMq+/SAxNSpwwCvJJtxTOAiI
DluEY1mXmr86ySiv9Cb/FK/57hqmtDzFkoWqzLaf7v//oSeGlGZNgWk/2YK8eP2y
+EZN8nywzuN8Jg3WDW3HrFfkk82TNhteToQg/WGDwC49meJkhD7qv3X+tM3UYi93
mAn/APoFWs4W3NZzq+HcOXlY99zM/gN03E7ZqyurexsbDobfsBWEJyEb1xZZWa1R
v/81mS4+ebySdNeA5MXBh1FYyaDEYg==
=nEyR
-----END PGP SIGNATURE-----

--sB5T+Uov0QsJqPIM--


