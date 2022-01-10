Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE88489776
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:30:46 +0100 (CET)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ssv-0006xT-R8
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:30:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6soX-0004fp-IF
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6soU-0005wr-5E
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641813969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNUpVdpad+ZxqeKs/Qv3QKGBbyf+n59ItzIQ+atM50s=;
 b=h3sileH+cdneHnam7uKRVjOPsMZHTAMFDU1mrUz8RCX439AZCo8uJHty4kURJMEW/YeyRN
 j/z1DBaJQh4+hqSfVTC7cEFkaKZWhZGZFPwijjH0fPHZPGSUBIamYwwKp6tR3Au/ROQtqF
 QpEGzG1OLowt7WeDM38O3o06rtLixQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-DVvTargcPby5Sg5BaS_Yxg-1; Mon, 10 Jan 2022 06:26:06 -0500
X-MC-Unique: DVvTargcPby5Sg5BaS_Yxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E69A51015DA3;
 Mon, 10 Jan 2022 11:26:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8678A7D4AF;
 Mon, 10 Jan 2022 11:26:04 +0000 (UTC)
Date: Mon, 10 Jan 2022 11:25:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 0/5] Clean up error handling in libvhost-user memory
 mapping
Message-ID: <YdwXt6GylNLPSN6Z@stefanha-x1.localdomain>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YTveQH7fhiARPAY7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YTveQH7fhiARPAY7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 06:47:24AM +0000, Raphael Norwitz wrote:
> Hey Stefan, Marc-Andre, MST, David -
>=20
> As promised here is a series cleaning up error handling in the
> libvhost-user memory mapping path. Most of these cleanups are
> straightforward and have been discussed on the mailing list in threads
> [1] and [2].
>=20
> [1] https://lore.kernel.org/qemu-devel/20211018143319.GA11006@raphael-deb=
ian-dev/
> [2] https://lore.kernel.org/qemu-devel/9391f500-70be-26cf-bcfc-591d3ee84d=
4e@redhat.com/
>=20
> Changes since V1:
>  * Checks for a single fd vu_add_mem_reg and vu_rem_mem_reg return false
>    instead of true.
>  * Check for over-running max ram slots in vu_add_mem_reg returns false
>    instead of true.
>  * vu_rem_mem_reg unmaps all matching regions.
>  * Decriment iterator variable when looping through regions in
>    vu_rem_mem_reg to ensure matching regions aren=E2=80=99t missed.
>=20
> Thanks,
> Raphael
>=20
> David Hildenbrand (1):
>   libvhost-user: Simplify VHOST_USER_REM_MEM_REG
>=20
> Raphael Norwitz (4):
>   libvhost-user: Add vu_rem_mem_reg input validation
>   libvhost-user: Add vu_add_mem_reg input validation
>   libvhost-user: prevent over-running max RAM slots
>   libvhost-user: handle removal of identical regions
>=20
>  subprojects/libvhost-user/libvhost-user.c | 51 +++++++++++++++--------
>  1 file changed, 34 insertions(+), 17 deletions(-)
>=20
> --=20
> 2.20.1

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--YTveQH7fhiARPAY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcF7cACgkQnKSrs4Gr
c8j02Af/czqNYAXpN+jiXqTLdYFPOYatm+3/bXLc97e2OIavTFSyg5KmPRqMkF65
l1+6dQUtf1fq8Pypk4zTqK8OEz9BTJZl/QsViw/2oGWqUfwrNcYWw+PDrcfud0Jx
vQ+yIhnXubyUOuUNAYx+4EexlKpQpqmGg4jcLPNEL8LOkIHNF4UvtiEuDQ5mz4cP
wsZN0vnGSW1q4I9Zc7H0YkwsxqrVgs3KP3Xrnq9XGn2FOC4P+7xlmlKkMCk1J2MF
me/UKNcLjt4cAHIxZkZD6CQNq36dSKpeyzutVtRr1PSQNT6M7swUcXJ5YdyUxTgX
U9oHUw97zmdJM3GK2dd9NAZjyp76QQ==
=x2b/
-----END PGP SIGNATURE-----

--YTveQH7fhiARPAY7--


