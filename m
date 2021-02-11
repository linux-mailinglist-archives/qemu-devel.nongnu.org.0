Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0231882B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:32:44 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9H9-00058K-Gn
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA91J-00057I-27
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA91G-0007RX-Of
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613038576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvSHXvlKpS60kvjwMlwbbOM79Y79PBAZZzkWn+NIK6Y=;
 b=NQog+T6rksQDDpvdh2U9wJGDOUouT/qirp8eziAEr/QnoO/WBk6V1hpeSJEKkvTZD9blQ0
 N2SgwaUAc5W+Ly+pwP+MrdWLVxQRUU3qc4G+6vseRfxlsc/BndK3xAFLELF8jCsd66gYRG
 /2y/An1zQlq5NPYrm4t4dZVWDE42Sg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-h22wbKdEMO6zPPzojYtNCQ-1; Thu, 11 Feb 2021 05:16:14 -0500
X-MC-Unique: h22wbKdEMO6zPPzojYtNCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5C1835E21
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:16:13 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3BC31001E73;
 Thu, 11 Feb 2021 10:16:03 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:16:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 04/24] DAX subprojects/libvhost-user: Add virtio-fs slave
 types
Message-ID: <20210211101602.GE247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-5-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-5-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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

--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:04PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Add virtio-fs definitions to libvhost-user
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 41 +++++++++++++++++++++++
>  subprojects/libvhost-user/libvhost-user.h | 31 +++++++++++++++++
>  2 files changed, 72 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlA+IACgkQnKSrs4Gr
c8jstAf+KWOq6MD61JmIBp6Qmf0HYNQ1twNSlCkHBqUSjFMcVYno/MngO+2zIbf3
vFhWz+Nc1srA+UoKBdrGe2/o4R4vI6K3L2rAuFvpPtUFpojAMq+t4nr7ukt+3xnB
DVtDgecmFrxPYDjbVbmpunvdlQRo3d9v3CsjhZvS8anNKwUwL+yVKd0Hk86U9+yN
+5cikn+SHfiDTd5jk9Sf5fdqO2zh4EkqLtjNvRuVfjxbPYsaphUmlF36HMLmMWg3
csX4ZfmtKfLu6RIutPAoxv/dHL7FjwFfQiA7zRxdFWSXOPBmHaXz3FBoo7DxGnfO
1N20kIw1stZYUQIH0p7JZzalwe+pKg==
=IV5g
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--


