Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0764420DBE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:16:35 +0200 (CEST)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNpa-0006QS-SW
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNmj-0004Qj-5f
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNmh-0006oN-6q
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633353214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OY+39AMDMQtSg/RWAolGbYWXmygC9MiUJmRIvEb/UgY=;
 b=X62BUwpf4vT8RmkLJ73zH7RHSDqOeGoCt7Lq1ORhPjKvcj5OXnZv2eQYWrDNGeq+fe62QN
 oi9ZKDbbN8CKPqyvi+u5rxUgjQonaFesamrRAW34Cj9g1idRqRIfWU+6qk/70MB5FaVEmZ
 yw5RtoVVe23N5H96dRTaBLxPv1goKtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-8jwzUVeKMJK6zb5N6zJLqw-1; Mon, 04 Oct 2021 09:13:11 -0400
X-MC-Unique: 8jwzUVeKMJK6zb5N6zJLqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5F4683DB2B;
 Mon,  4 Oct 2021 13:13:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 746891002EF0;
 Mon,  4 Oct 2021 13:12:36 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:12:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 01/13] virtio_fs.h: Add notification queue feature bit
Message-ID: <YVr9w/SMk/3NkL37@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-2-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i39+SZB/NEB6R7cv"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

--i39+SZB/NEB6R7cv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:25AM -0400, Vivek Goyal wrote:
> This change will ultimately come from kernel as kernel header file update
> when kernel patches get merged.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  include/standard-headers/linux/virtio_fs.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--i39+SZB/NEB6R7cv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFa/cMACgkQnKSrs4Gr
c8iAuAgAmPJbyzMVScaLiqEjnsghYisVvGZgjCre2Pz9tWkA16nsyKLss0N1D8tz
/0U1tYeE7NKZskPsv+p5z+fiILGQpf/txSg4LkXBKC8rj3E7kbZg7a2D/g/jzU2d
JcSGL10Yg40u3ExfE2dAAB9Jr5INKnOamoZdOXIk2dx4x4WVGUaE9NitiDV4m2aL
bXIPp55M1x2tijHkp4Yd4m67u12YnQhvSbG4okaK1RKzaePSrPZzZb2uKOYHhZEn
NUwKyFGqFWRwWRerPo+Jy3hWcjWeC6oFa+gDUxygzTCZ7duQ4xav362dQEMcbzDm
qfm5sccis5xdt3NFFXbCrd+YBjCsEg==
=tGVQ
-----END PGP SIGNATURE-----

--i39+SZB/NEB6R7cv--


