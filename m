Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833B533F99
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:55:50 +0200 (CEST)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsQP-00040V-80
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntsGg-00039a-8N
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntsDm-0006Ec-4f
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653489765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IMG9Hysd205JYbQA21wNyW4dmR+6wu78VjIOjB88J3A=;
 b=dcK+So+mJ4p72QRrVCuVSe6whXZYTjbCyhtiQywM2qrep7ue9sofSftnc+Ao2pHlbtEA+K
 mNcX9ReGDfy2DF4PSVg5SM3NYsQB88LfhPwkiYEQeI35T8JKskmBiEuw4kBqH3Ou989/MX
 WyodCoegemQT5ut+bWhnoNLVhGRgknw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-jGRdht4TMWOtePNlsKB6tQ-1; Wed, 25 May 2022 10:42:44 -0400
X-MC-Unique: jGRdht4TMWOtePNlsKB6tQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A23F11C0F686;
 Wed, 25 May 2022 14:42:43 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0682B2166B26;
 Wed, 25 May 2022 14:42:42 +0000 (UTC)
Date: Wed, 25 May 2022 15:42:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] aio_wait_kick: add missing memory barrier
Message-ID: <Yo5AYfMSnCM+JYR3@stefanha-x1.localdomain>
References: <20220524173054.12651-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zuFvu3nykTMt5aXB"
Content-Disposition: inline
In-Reply-To: <20220524173054.12651-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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


--zuFvu3nykTMt5aXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 01:30:54PM -0400, Emanuele Giuseppe Esposito wrote:
> It seems that aio_wait_kick always required a memory barrier
> or atomic operation in the caller, but nobody actually
> took care of doing it.
>=20
> Let's put the barrier in the function instead, and pair it
> with another one in AIO_WAIT_WHILE. Read aio_wait_kick()
> comment for further explanation.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/aio-wait.h |  2 ++
>  util/aio-wait.c          | 16 +++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zuFvu3nykTMt5aXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOQGEACgkQnKSrs4Gr
c8g4/Qf/ZiEcjCuwWBJ3YYCXOw1K43PgmUlgfmZVUJ/jIHj/1mxeqenZ2Imwlimr
REv+oAY8iLZgdDbEyAkak5udvukiAFXMsb+Dc8cTKRKRaMpOV65tlN07SibR++0Z
VOm+Vcp+lBGyRymsQxxHnR1idy4devQxU0TC2wDtL/LA2p05Rlh4NTKDJrDyxP5e
skCD/a5tkmSR+SqE1szIepIwCXBeWvzQCxTxXKJDsnx3pwcexB+CwGSO0p6bQWdp
5RlA8BRW3JSosZSZUBJN7q1E/Rs/TFQ6zvoLLEhF1ppQM1q+OZEZPstpJ4SPTiFO
jnfukt5GDlmoB0uO17OWu591qPbkjQ==
=3W5H
-----END PGP SIGNATURE-----

--zuFvu3nykTMt5aXB--


