Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0615135A8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:49:21 +0200 (CEST)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4WG-0006DI-6A
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk4U5-0003WV-No
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk4U4-000437-7j
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651153623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtlA1tCgRJ0/DS/mtu2OhqhvfIW453HkuorncwPtHEk=;
 b=JkqV32ST9RbS5IJaqSI0gop7BQw8pEH/qlxr4lOw/Xa1TdgvRVUxx9UxFb0bzFL6ONoEQj
 KzaWC19MJA2z3FHe8ax3tRIgqKM6iy+SMR+OjfFZx6vvmVhMeovL3h6bHRUWgQZqBuKZ5H
 c6esjlQQAikRmOoS9e0t5gr+iPrMn4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-Zt8Bj26dPZ2PFchUp9zzwg-1; Thu, 28 Apr 2022 09:46:58 -0400
X-MC-Unique: Zt8Bj26dPZ2PFchUp9zzwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 846E5802803;
 Thu, 28 Apr 2022 13:46:57 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6AF2024CCA;
 Thu, 28 Apr 2022 13:46:47 +0000 (UTC)
Date: Thu, 28 Apr 2022 14:46:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] async: register/unregister aiocontext in
 graph lock list
Message-ID: <YmqaxkbQqOVOHhlP@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ugcprg9Vf7vW+BzK"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ugcprg9Vf7vW+BzK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:10AM -0400, Emanuele Giuseppe Esposito wrote:
> diff --git a/util/meson.build b/util/meson.build
> index 3736988b9f..c85d8695de 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -64,6 +64,7 @@ endif
> =20
>  if have_block
>    util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
> +  util_ss.add(files('../block/graph-lock.c'))

Why is it in block/ if it needs to be built into libqemuutil?

--Ugcprg9Vf7vW+BzK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqmsYACgkQnKSrs4Gr
c8hJIQgAuFsIfngkZJTPr3NTSeGWS+zcJWtEyZ750t2vBWohV6JqizykKqO91S4A
qxkspN3snzBf903W/QoUjJMx2U8Q0xwXxjHrt6N5fLMNLmOTjk4HZIucnmr4MA0B
zJGUE52zO7s8amih0I0B/V/J/IkZJsOJqb2UStrZzmHV+2k+9xLHqoTFxU0zLd7Q
DTNRoJn+LWkVb8XdON0vuEGDi5Vm9//HuETtG5sZveAX5AIUffZL5vZmk8XmnqNy
pCHh7TnF/qPpeeUtUiAxsyFZ3L7W11QmyQxIB812cYo5t4E3oG21AmD4Xvab8aMs
DNSeekoQ1F+WZMoTD06+0y9RPUVO7A==
=/Md5
-----END PGP SIGNATURE-----

--Ugcprg9Vf7vW+BzK--


