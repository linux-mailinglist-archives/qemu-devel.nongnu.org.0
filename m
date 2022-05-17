Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55F52A680
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:26:27 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqz5e-0001Dj-DK
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqyzd-0001oK-UR
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqyzc-0008UU-BN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652800811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4faLPTe0FbYCrQ2LGEGOPPr/X7CA8tmjMoLl7F6IQ5E=;
 b=dIjF3hCv8H/lMu/qA30qkztFgGRM6JuV7Om7npz5U1CMI7stpqqNtt+0NekYr4Li7jK3R2
 OxUL+p69djgAwpmQj4Gnz7/9aBZSWrDcD9zvE8pPLjHf1D4mAL9aZV6Nep3FNJrenYAiBm
 ZG+rPwbCDfR4ihxmTQ5Mlnats7kSABU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-86cFLM17Po-ezGMSgK069Q-1; Tue, 17 May 2022 11:20:07 -0400
X-MC-Unique: 86cFLM17Po-ezGMSgK069Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FDF78032E5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 15:20:07 +0000 (UTC)
Received: from localhost (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C10F40CF8F0;
 Tue, 17 May 2022 15:20:07 +0000 (UTC)
Date: Tue, 17 May 2022 16:20:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, nsaenzju@redhat.com
Subject: Re: [PATCH v3 1/3] thread-pool: optimize scheduling of completion
 bottom half
Message-ID: <YoO9Jjyo+q5UND5X@stefanha-x1.localdomain>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WTTbQKmH4UDCBq2X"
Content-Disposition: inline
In-Reply-To: <20220514065012.1149539-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WTTbQKmH4UDCBq2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 08:50:10AM +0200, Paolo Bonzini wrote:
> The completion bottom half was scheduled within the pool->lock
> critical section.  That actually results in worse performance,
> because the worker thread can run its own small critical section
> and go to sleep before the bottom half starts running.
>=20
> Note that this simple change does not produce an improvement without
> changing the thread pool QemuSemaphore to a condition variable.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/thread-pool.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--WTTbQKmH4UDCBq2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDvSUACgkQnKSrs4Gr
c8jLYQf5AbfcsVX95Q196DMo1Aa9pa5KWn2KprqGJDeQBFQSYRhia2ltAmuHcMgm
phdxeu1asc578Hit4/WJFSxfJJ4Quke1DVrAS1kgExfvgksnjan4oNFMoxqz/yzc
oI/HCEyQ/1wN1m0dx+eMuFPqPtaR+hRXxjekBeeZfMW01mbL/0PcCMvLqpriKT/n
qKmI0jY1EqlX0JVJ+8ehPRhbz8PoNKQ7v/Z/4+JAYWlU3Xs+6qv/4YJW7D7fBVV7
U2+UMGq9ypJvaD7bVFFdKF6zxePQSpbkB/F1KiHDnuMTejHC8DBtpNpIX3tIiHU3
LGZ6iPxlMhCnOd313eEAP2iMnv1N2g==
=lc2C
-----END PGP SIGNATURE-----

--WTTbQKmH4UDCBq2X--


