Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FBD5A6EF8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 23:14:48 +0200 (CEST)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT8ZJ-0003sC-Qq
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 17:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oT8X0-0000oa-IA
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 17:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oT8Wv-0004PC-MQ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 17:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661893931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=cJ/eodH+ArTrBLbKG3I7gxWOLXsmuz8BeV58kJ58NlU=;
 b=NhyI/Olgj/4k3vDmBWZ+M4Wz74PzOlv9r4DMK7gs5NAAi3Aw+hflHLa7mVnZ+nHlvp5FCY
 aMMLYrNzlVmCLNoorNBS++Vx4iMHSeKZuRMGDy9oPDAOrdkg1WWhZZmr0JoqEpSLxkwQy9
 vC8ZZivY++5Q5epxFqDdhERU5RXaUkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-zIKi3GG6P4eJKn8OnUMcMQ-1; Tue, 30 Aug 2022 17:12:08 -0400
X-MC-Unique: zIKi3GG6P4eJKn8OnUMcMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B641F1818805;
 Tue, 30 Aug 2022 21:12:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22E1EC15BB3;
 Tue, 30 Aug 2022 21:12:06 +0000 (UTC)
Date: Tue, 30 Aug 2022 17:12:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: QEMU 7.2 release schedule
Message-ID: <Yw59JU3ja/EU3HL6@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gTh6T7t0D73h/DOt"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gTh6T7t0D73h/DOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
Richard Henderson has tagged QEMU 7.1 and handed over to me for the 7.2
release cycle. Thanks to Richard and Michael Roth their work on 7.1!

Please check the proposed release schedule and let me know if they fall
on inconvenient dates:
- 2022-08-30: Beginning of development phase
- 2022-11-1: Soft feature freeze. Only bug fixes after this point. All feature changes must be already in a sub maintainer tree and all pull requests from submaintainers must have been sent to the list by this date.
- 2022-11-8: Hard feature freeze. Tag rc0
- 2022-11-15: Tag rc1
- 2022-11-22: Tag rc2
- 2022-11-29: Tag rc3
- 2022-12-06: Release; or tag rc4 if needed
- 2022-12-13: Release if we needed an rc4

The release planning page is now available on the wiki:
https://wiki.qemu.org/Planning/7.2

The changelog has been created so you can add items when code is merged:
https://wiki.qemu.org/ChangeLog/7.2

Stefan

--gTh6T7t0D73h/DOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMOfSUACgkQnKSrs4Gr
c8i07Qf/S1VLIfALLcuXVU1wysDSL6Xm55DWUu2RHd8+Fu/mdwzN7ZetTqAOcz6f
J7LSBtzV2l+5I4o827AFz4S0L4EAfJTtaiswN66p3J0oXd4hkXE1YR8z93HKTT66
OXybbJwIrFzwfus+vk+iUEiH+ArvPttUoplf0MV100wU0p7V3xdOyBRLDNgvvGBA
1nKO2UDDRYHJPehUdSKZ2dKp2f1m9flN6rDTo+XIeCrw7/X6Qh430PnHmOSc/3FF
e9LyPC8UQuLfCl+cIN1qMmZAVqkJkDa26y6Sj6cFx2L+VePiYe4XNd5ZkM3XU4ll
g0tvtG6GwMKEmTHB/mlGsVB2GYypiw==
=USRJ
-----END PGP SIGNATURE-----

--gTh6T7t0D73h/DOt--


