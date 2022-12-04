Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB064209F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 00:51:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1ykA-0001qc-Qe; Sun, 04 Dec 2022 18:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1yk8-0001qA-C9
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:49:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1yk6-0001Xx-8I
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670197792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tU4txoRZe9FkyEdhASz9CC0YKNuljP2kBzb7RhAuhFE=;
 b=W+DGYLJ0dYipAjYdaQznvKUXLNsXKSAoYkFLttHA44423cIZD61G7ZfaWBtA0c+oAVXkGP
 /Hs7tlLLNBd+exxdBOWuOJao6oL9SyKLZZmodcUaFc52z+2PqEyjBm3m4W51BPxF4X3WE6
 BiTkNRGD8OVlfd85u+BhlysDVRa7nQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-3LZdMokTNnmN29_YBJjFhA-1; Sun, 04 Dec 2022 18:49:50 -0500
X-MC-Unique: 3LZdMokTNnmN29_YBJjFhA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 420FE85A59D;
 Sun,  4 Dec 2022 23:49:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0D06492B07;
 Sun,  4 Dec 2022 23:49:49 +0000 (UTC)
Date: Sun, 4 Dec 2022 18:46:09 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/5] virtio: regression fix
Message-ID: <Y40xQXrTAToXwC46@fedora>
References: <20221201073725.44585-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k24z86TucEafGuP9"
Content-Disposition: inline
In-Reply-To: <20221201073725.44585-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--k24z86TucEafGuP9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--k24z86TucEafGuP9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmONMUEACgkQnKSrs4Gr
c8g3GAgAnqLW1VxFbnWZa2GL7I++Pj5YJKUdFBbhSUCG68pv+0ovGUPACUArCTDE
zj7XM6qYVvLNrznhGV9Z6g5u7xbgI0gRpeQoooS3SjMbP81YftAWItjEB3jiNgeQ
r70HRjm+7IoFR/LEZFkLu31PucRzFiPUDDvpY98SwX3gQhs0M9GVw7Ttqgq6rl19
ycS6Ee6uxtiVHbnH99JplsLzH+rBtPYzfrc5Z0sdp/RSC3Lo3eOaCmw4IdBvFN/D
TCDl1g8+F//RGn3DqHk/tmSiKfDu4zzHteCVN0qfdC0pezjcu+cLbAQUSQyLrHbH
M8CaHgI5jXXHuZt4+B02SHCbpnIPVg==
=5uNa
-----END PGP SIGNATURE-----

--k24z86TucEafGuP9--


