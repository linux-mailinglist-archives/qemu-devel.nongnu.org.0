Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07E6269DA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 15:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otrIP-0002Zq-Lm; Sat, 12 Nov 2022 09:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otrIJ-0002Vl-2P
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otrIH-0001Nq-HS
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668262536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOG5CitV3zjGuC6FdpkdEJKgQA4zvuILZgbQh51ODNA=;
 b=ZiIoSKcTHfw2hSF0adWJHjqzkLYkpljnp3wJaDQc97hUqSJX8Xh77GGBxNois27netuXzu
 f8rKOKjKEvO82kshQKH/wH4sGLFXJXx4Xyir26SV1ORsc8jPMf5pxUNccQLVe9pfzhU+44
 YKt2im4Vc48P9rewKCaqoikIOHrNZx8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631--xQR0yo9Mzi1qHmBJRcfIw-1; Sat, 12 Nov 2022 09:15:35 -0500
X-MC-Unique: -xQR0yo9Mzi1qHmBJRcfIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D74F52932480;
 Sat, 12 Nov 2022 14:15:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 613FE14152E8;
 Sat, 12 Nov 2022 14:15:34 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:32:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] pc,virtio: regression fixes
Message-ID: <Y28FzYVpzAVsQVYB@fedora>
References: <20221110210428.137015-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sj/knSNo8cP96fHf"
Content-Disposition: inline
In-Reply-To: <20221110210428.137015-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--sj/knSNo8cP96fHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--sj/knSNo8cP96fHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNvBc0ACgkQnKSrs4Gr
c8gIVAf/Z1ve+z24Sa1ufOyLDI8HCD8vPn2HO2AbIJhDjC0mLBBsj7eIMeBZagpl
UM/czrIWqc8sxvLwGjj4k18ZaHkOx/oNwkBisEWdAfhQHIaeFPoZZ6FMvK75O0g0
ugqC/4jXDmDuueE5+/QfLJRY8YOnpnl40yqJdql4b4tgZxeIlNvJ4QbYKtnkNiZN
LyHRd2uPx67OT9PisPp0m9X3Jj4+eob1fOrRSBXxtqkvXcS/BF1ck2K5Mt8oWyFp
Kt7tTlqeTig5RoedCzLVDJ5klgfSfugJa/fQ7schBi5EQjUE7936XxZthSih5Gsb
+SJ+aeYBzKikrscyAl+ffzBCUltU1w==
=5DIL
-----END PGP SIGNATURE-----

--sj/knSNo8cP96fHf--


