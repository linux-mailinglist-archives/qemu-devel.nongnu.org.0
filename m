Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF554B4D93
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:16:14 +0100 (CET)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZL3-0001NK-OF
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:16:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJZIX-0007dG-9E
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJZIT-0006Kt-Us
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644837213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bM71P164Gri/XvmsVp0SEwX0x6zfUJM6DpirOO2YbPY=;
 b=YuQOG2p4j4leSXuEO4+IUSXv3oscR8L6vFBzL55W/g2fHKwkdRb0ZlW9zW0fyxvSHPUira
 K1nZL4g6wB5TUdnpSUHCOVqh856LGfY8RkJgk9QRgVNo/RLy2ScCXWnvDGZJuuAov3EY1X
 tmedlKq6EcH559FXJk0dhPGa2LWrZSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-4oc3n9iYMEi6VVhCL6w3zg-1; Mon, 14 Feb 2022 06:13:31 -0500
X-MC-Unique: 4oc3n9iYMEi6VVhCL6w3zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C341006AA0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 11:13:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303435E4BB;
 Mon, 14 Feb 2022 11:12:59 +0000 (UTC)
Date: Mon, 14 Feb 2022 11:12:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Deprecate C virtiofsd
Message-ID: <Ygo5Ouzpvg0Jdvvo@stefanha-x1.localdomain>
References: <20220210174714.19843-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hzr9mwc4r5yZwhgQ"
Content-Disposition: inline
In-Reply-To: <20220210174714.19843-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: virtio-fs@redhat.com, berrange@redhat.com, slp@redhat.com,
 qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hzr9mwc4r5yZwhgQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 05:47:14PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> There's a nice new Rust implementation out there; recommend people
> do new work on that.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/about/deprecated.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--hzr9mwc4r5yZwhgQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKOToACgkQnKSrs4Gr
c8hX5Af/RDI3Rqj6L5eyb+Ks56++lhhcC1yy85mDGrcy6ETmoDhFD74j3ElfYEY5
jc48AY9P9qX+N56RAaAuK9nOreJZBJxYuSsfffs/1IhVPRvY030Fq1i3yG0ZOMMo
5WXVmui8NwZROQ3beLzQYjkxklrGQVnkSGeycjNad8WZVtuzkq8taNBuIDj8r/Wn
UowjkBOEchcMqg8qtoL3Il5cwgl4d9G73Ly2U/uMOdjxAAuagBexa3/tKx8Kftbt
2WFfWuYBh0imPhOfk6gcZmhSBgRfvzogabZ7A0vGdTyM95AoXWNPY8/1mdQvTJbB
9IEbvPQ7J48BTpCRJcr1OvdDSa7Xpg==
=xAso
-----END PGP SIGNATURE-----

--hzr9mwc4r5yZwhgQ--


