Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B797C5F38B4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:18:28 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTlb-0006bh-Rv
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofT2q-0007zx-Tl
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 17:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofT2m-0006CQ-QC
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 17:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664832727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eEhwG6pdttNjYEDpsUZ9s9jmJZ2az1DaKOOQkXq2x8c=;
 b=Gop6rqi1rMfLv0ZEjFuIz07uDJLncgW1873M+1b1OL9IAaYV7EZQf3FGWmAQ7XQXXqD0o5
 aPE9nSb5iHhBsUbrglWnXxZmoVNAjnpTQMc4JF4rP89O5FUBFB2pfGBSoWHprPXkHUZGGY
 Tu2itpMGwKz6BeTEBGhtW41Ikh25+/s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-2BrBli6oMcqgqfF8j0PDyA-1; Mon, 03 Oct 2022 17:32:04 -0400
X-MC-Unique: 2BrBli6oMcqgqfF8j0PDyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC3A2101AA5B;
 Mon,  3 Oct 2022 21:32:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11A882027062;
 Mon,  3 Oct 2022 21:32:01 +0000 (UTC)
Date: Mon, 3 Oct 2022 15:12:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC 3/7] migration: Block migration comment or code is wrong
Message-ID: <Yzs0Go6OtoSHgLNN@fedora>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sXkk6s5pYndU1sbw"
Content-Disposition: inline
In-Reply-To: <20221003031600.20084-4-quintela@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sXkk6s5pYndU1sbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2022 at 05:15:56AM +0200, Juan Quintela wrote:
> And it appears that what is wrong is the code. During bulk stage we
> need to make sure that some block is dirty, but no games with
> max_size at all.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sXkk6s5pYndU1sbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM7NBoACgkQnKSrs4Gr
c8hyawf/cYqNven2+un9Phz/kXSPlth5Fi0OJBWFS0eU0cf/V+ko1uU37+rKP+Ct
VI4E9qqMhP4My6wLJel74L2sS2j7gyeY6Dluozdfgd5ShBGzsWodIo2iShgf4urn
Kz14u1gASJDQKyilblGmuNPwDPz9FjS5Q3y+eCCmxMEzs6gO5sPBh61xyvOY/2tD
NzZ6p7sEsggpCDB+4iGHzeYs0wbT6XDL3NfIAAp1HGgyLMkrurjTDXdnprOdaX8n
Zb7BZXuitBpfhIXZm30mj5NWK22zU0N2Ys8w+Pscf+eBEc3uuEVH89yRIhvWuxs8
QjBHGthkdaLXw9CSE/O2iY1MBQl5qA==
=Yedq
-----END PGP SIGNATURE-----

--sXkk6s5pYndU1sbw--


