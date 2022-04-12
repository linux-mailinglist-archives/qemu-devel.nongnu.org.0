Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961394FD2E6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 10:22:24 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neBn4-00089L-AS
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 04:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1neBgF-00076y-1v
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 04:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1neBgC-0008Ad-9O
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 04:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649751315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r4PXDb3dQkdfdmCtEuiANacIjmRWsWRa70/iY9WP/mQ=;
 b=ZIfAXTX3Ja0JPRsXCwJKt2qoG3EDv29WNVeXkpdcYFQ9nxC76ewRHehZkQZ037NULbk3wG
 DsjR6h1rpjK4nX+dN84RMAPd1pdUgcnosJi6D3dhH+y6jBtIGsz7kWS4qzU4Gg9LQFy1+l
 DTmC6YqiyCNpQO2+wQ2GMP3of8ai2bQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-LDKUriWUOx2aiQ7As9Ubrg-1; Tue, 12 Apr 2022 04:15:09 -0400
X-MC-Unique: LDKUriWUOx2aiQ7As9Ubrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CFD63C13920;
 Tue, 12 Apr 2022 08:15:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1FEB40EC00C;
 Tue, 12 Apr 2022 08:15:08 +0000 (UTC)
Date: Tue, 12 Apr 2022 09:15:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] contrib/vhost-user-blk: add missing GOptionEntry NULL
 terminator
Message-ID: <YlU1CwNTzildW6e5@stefanha-x1.localdomain>
References: <20220411150057.3009667-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kIAfTRybNf0JvjlF"
Content-Disposition: inline
In-Reply-To: <20220411150057.3009667-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kIAfTRybNf0JvjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 04:00:57PM +0100, Stefan Hajnoczi wrote:
> The GLib documentation says "a NULL-terminated array of GOptionEntrys"
> so we'd better make sure there is a terminator that lets
> g_option_context_add_main_entries() know when the end of the array has
> been reached.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/vhost-user-blk/vhost-user-blk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--kIAfTRybNf0JvjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJVNQsACgkQnKSrs4Gr
c8hA0wgAunnDxi1BqzkTL9o/9brcFQZuN2rdJrrPqu1mL5LwDMBUqX4ktkjlhU+g
hseLqxrYjTqayjD/ujzeZm30I+hG3MvsZwy8I0bmOm8G1+8pfu7pS3KUYXLJGhQS
TNc9ucgmrJ+FXhWDTWyvPFfA4GrtXh5SCtWT2sXiH+vWcP2z2yhfXMIS9c9eq8UL
kvZOlPjcmr482iPwevZw9ZlEi/XbcmHsV46vtXMC8LXybWYVYT3CkJxB1Ys3acuz
BfCoG94kZ66BVirB90rKcWCsvePUVc0pkzPRI6TRCiHvLm2t/NPNwC0+oegnjvpg
uMRL5SFwOskp80VWb118EEiYUJgUyQ==
=+nS+
-----END PGP SIGNATURE-----

--kIAfTRybNf0JvjlF--


