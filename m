Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0326BB7CD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:30:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcT4a-0002dR-Q3; Wed, 15 Mar 2023 11:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcT4Y-0002bk-Ou
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcT4W-0002B2-R1
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678894188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4oYPhgeOdjdGDd8Z/zXIrbSonwA3TZyROrZITN+qxCo=;
 b=T20zpXd3xYpoTiPUWLGRboFA8P1BJFo9gUSuVafgXPvdZq+OajAqDO3OrNDsKWv6OxrVfi
 K+yE0tIOoGPrtGmPyLmIixMIIZ2dTMgTAqy+R2gyZynafI9ZRsQZMjwHu06eCXZOyjWWiB
 GjjzOdvDblg0Lmz/s4M3NnPi3s9/iIY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-BEFKImzeMSesduDgBa76yA-1; Wed, 15 Mar 2023 11:29:44 -0400
X-MC-Unique: BEFKImzeMSesduDgBa76yA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25130299E743;
 Wed, 15 Mar 2023 15:29:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 810BB492B00;
 Wed, 15 Mar 2023 15:29:43 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:29:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [RFC 0/2] Split padded I/O vectors exceeding IOV_MAX
Message-ID: <20230315152941.GD16636@fedora>
References: <20230315121330.29679-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XofcccYnqrGIwiNM"
Content-Disposition: inline
In-Reply-To: <20230315121330.29679-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--XofcccYnqrGIwiNM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 01:13:28PM +0100, Hanna Czenczek wrote:
> Hi,
>=20
> We accept I/O vectors with up to 1024 (IOV_MAX) elements from guests.
> When a guest request does not conform to the underlying storage's
> alignment requirements, we pad it with head and/or tail buffers as
> necessary, which are simply appended to the I/O vector.
>=20
> As of 4c002cef, we (sensibly) check that such-padded vectors do not then
> exceed IOV_MAX.  However, there seems to be no sensible error handling;
> instead, the guest simply receives an I/O error.
>=20
> That???s a problem, because it submitted a perfectly sensible I/O request

Looks like there is an encoding issue. I get 3 question marks instead of
an apostrophe. lore.kernel.org also renders mojibake:
https://lore.kernel.org/qemu-devel/20230315121330.29679-1-hreitz@redhat.com/

Stefan

--XofcccYnqrGIwiNM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR5GUACgkQnKSrs4Gr
c8i4YQgAvE3nW733VLdN/NSOPCkaPI50vaHznPG/h/VyR+NQwbkFPfml5mZXoKvV
igQz3cCwS7dllOKDxBBEJQywi/IOnkcgz+5Ln5db2HB4RXQTXusnESIY6DEB3i9j
CXueOkZ2VYon+2A2bWU4bP25Hp6tPYvSHhSoV9tv3eNri/hyij27UwBheBx90le8
dcqNjEKrMXG6lWoHFLiDcwkQJ8Zt9YFa2QMAkocvz0WlReehyWo7jztskHUU4x3e
HJzZfPRPuewLdx3eSLfzLSlIOAiPW6EF8cAsYlZdHQd2Z4Ph6WvjjCrLmesVTucl
IS94EgfnTvr1KBb9jsEdgy6ru6NkFA==
=TIYo
-----END PGP SIGNATURE-----

--XofcccYnqrGIwiNM--


