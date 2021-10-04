Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF3420E21
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:20:13 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNt6-0001jh-Bn
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNr3-0000EQ-BY
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNr1-0001Zv-T5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633353483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vrs76vz3PPDG7TP+0ms3W80RfE5IroP+0QQ3CZfPKuE=;
 b=b9ngwK7ZUm3+DOqv0tuXaQsOp/N7kPW0MpdvwSgSKG/uHkIk4S1tfQTa4uO2iHFFjxftkF
 8qufenT0l5QcG/ivOD/3jVZJFb0wQgGUFAdasBvBk0WFQWGSww2m7uGBKi+malMm98sGF4
 WaAFQOer6cT+xw4mJ+lkzQ+nx553Lts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Qu8iiaugMDqlKbvNIpr25A-1; Mon, 04 Oct 2021 09:18:02 -0400
X-MC-Unique: Qu8iiaugMDqlKbvNIpr25A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9E76DF8A7;
 Mon,  4 Oct 2021 13:18:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FBF960871;
 Mon,  4 Oct 2021 13:18:00 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:17:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 03/13] virtiofsd: Remove unused virtio_fs_config definition
Message-ID: <YVr/ByKopdRQwsy3@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-4-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cd8PZTVNGSp+cJAL"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cd8PZTVNGSp+cJAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:27AM -0400, Vivek Goyal wrote:
> "struct virtio_fs_config" definition seems to be unused in fuse_virtio.c.
> Remove it.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 6 ------
>  1 file changed, 6 deletions(-)

In fact, this struct is defined in
include/standard-headers/linux/virtio_fs.h!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cd8PZTVNGSp+cJAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFa/wcACgkQnKSrs4Gr
c8jSRgf8D+ASkKju5k9TA7ysqEU9d7oUWZukON6366Nx212dd4d0IMHKvfPtpTDp
18od7zCIt+sqY+TRNp/sH7eiwNpu5mvyutB+5CiY+0pSdy/kRTTAb6yoQM+8TEDe
8wNOP121pSLYJxS9XCF0PrdxUcpzQLLpDtNzFf+VoMMaZSxJFgzJIpauQexMF85L
OHHUz58jQF37nn4TgMjouaFallWfA3DLiIQFRP2x5RV2VYbr743qCHD89jp1pv82
xFwib4GHE1yocO/zD5RokbR48xOI6RSl87A615WSP0kiho0SyXdEnCbDmpTl5qHK
5FFtIvTrH448OBt8+DY1LUgvih2wGg==
=E/mV
-----END PGP SIGNATURE-----

--cd8PZTVNGSp+cJAL--


