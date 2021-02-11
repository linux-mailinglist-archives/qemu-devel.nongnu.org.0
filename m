Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A6318B29
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:53:04 +0100 (CET)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABSx-0001lI-B3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABEM-0006l2-7x
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABEK-0007zB-5e
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJcGlYr45g0yL3K9s1UAvS8aBCpdThmNBYRLxWPZI/w=;
 b=dRwQ2aKgx7FxKKUWi7eZf1rBRSiac0wSh1Jlr1bJHkiY8hxFBnObTCO9Ah4TDSlMyxV76U
 OcGFCBhDhUfPPKgfXL+BYfI9eWyOgpKcCTUF5w+jrsW5KaI9610ODrs8lsp4YM/ds4U2ky
 DdV45OLJMfXKvSqcx08AC/LVeWw/eFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-cyfkGaDpPxSWT-uCTUyjKQ-1; Thu, 11 Feb 2021 07:37:52 -0500
X-MC-Unique: cyfkGaDpPxSWT-uCTUyjKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAFAF803F47
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:37:51 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EAEC5D9E8;
 Thu, 11 Feb 2021 12:37:51 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:37:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 11/24] DAX: virtiofsd: Add setup/remove mapping handlers
 to passthrough_ll
Message-ID: <20210211123746.GL247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-12-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-12-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GeDkoc8jIzHasOdk"
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

--GeDkoc8jIzHasOdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:11PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GeDkoc8jIzHasOdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlJRoACgkQnKSrs4Gr
c8iYjgf8DcjF+5IEVJM4SMvvkXO+rDosSJQi4irIO6O/QDpB68DnbpSYjRD8BAU/
fpPdYeHmjz0LeswUxws/LBR46PYnKfA2LVqYtMBtyS3cbL44DMhy8yb31wbGWJ9J
GpVy3D1sJp08+4xrcqUMGixXAQuMZCHpCAmfxmWKxi9Xz8tlgR7kvgrBhmPvYadY
UAODXPa/CBNamaXgJnrETuwHXI0n7Rl/W7j97awGeUE/dK/Mwg6QOlL+sTp/ErGV
Gd3J56vydd3ciWDwoIW/iY14YhTTW8+G9k/9yMhRmG8z2SVm+sGk3tjHW91EtXTo
Kxh7jXVX4aQ1N3V27T1WSlJ1ojAmgg==
=7IZg
-----END PGP SIGNATURE-----

--GeDkoc8jIzHasOdk--


