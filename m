Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383C4255CC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:51:17 +0200 (CEST)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUjs-0004FJ-6b
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUh9-0002Hu-6U
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUh7-0004lA-HE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o0rTloL4c432A+ip3pdthHyWdF/eX4phbL5zfByK5Pw=;
 b=BOE+reVVZqF8BkhknxRi6WVv5NUliI3eFCkdFYuLe6SlK2hcqUqys+H1Dn6Deu4e9A/Sgo
 hEjOhHNleZa+/SY9eznxCPpxwyfwnybSI613YKWKTFtVCnLQeBwjcB/zfjlnGE5zrybw3S
 upvQTsB3zStJlku3B9fdQkPoyh2Er24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-Q4vD8me3OWSQauE0XklxKw-1; Thu, 07 Oct 2021 10:48:06 -0400
X-MC-Unique: Q4vD8me3OWSQauE0XklxKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB861808309;
 Thu,  7 Oct 2021 14:48:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EEE910016FE;
 Thu,  7 Oct 2021 14:47:54 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:47:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 18/25] block/coroutines: I/O API
Message-ID: <YV8ImR4eGJ8NakKC@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-19-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-19-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3Pst3C3I/LrkxnAb"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3Pst3C3I/LrkxnAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:08AM -0400, Emanuele Giuseppe Esposito wrote:
> block coroutines functions run in different aiocontext, and are
> not protected by the BQL. Therefore are I/O.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/coroutines.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3Pst3C3I/LrkxnAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCJkACgkQnKSrs4Gr
c8hycQf8C6a5XmRPVGN942FXk7X9Z7ERPb1AqWlskI9PyWY2MX5E7mBhTjTQs1f5
7nLUkpy2EHhqKG2PF006dzKGzJIEymQd2ANNaR37SmGOwGJPgJ4hdpucvqsbewqR
LiVrVRgNj8wbR9P9BeEGLXBNl4Dloh4mnOzF3pG8+eaBuswki4seEuDrMVHlS3BZ
2CXzHd//czTpIu3DPNiqFm4Gx3lS74lUsTWv2qCc10pKUaan1RsGaTvXN7L7Gh7B
fEk/knUMoTjKnsShYKB8tc9R49CMm0tI5vw5sC8nm7F0crEcA30awAxqjs+7W1Er
5PAU4BDOB87765z4ZTLg5NurMk3i1A==
=1/Ch
-----END PGP SIGNATURE-----

--3Pst3C3I/LrkxnAb--


