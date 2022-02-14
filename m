Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096A4B5870
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:25:50 +0100 (CET)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJf6j-0006VI-3W
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:25:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJf4F-0004T9-LC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJf4E-0008JM-5b
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644859381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5QAoT68b4jGMWt1KV13jJecCaCaCHRhvA+j6AHypcw=;
 b=aG3mQc1bOYrmfac5M3FZE3L4ZQtW8JBFvc7+AdJ0DrPdz8DUbhNlyxGSO3M5rGBqEVsJyh
 Krua/GW9mOQilbFGZzDB795GGYpW62iYGZUXle3dH8MLciK+83updl1YQMq6GLhwA2dPGe
 34+np1ALR5Xu3bXn5JNOThzfa2MfrCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-gUJgf7MPOu64SFqCcVgzWQ-1; Mon, 14 Feb 2022 12:22:55 -0500
X-MC-Unique: gUJgf7MPOu64SFqCcVgzWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3432E1091DA2;
 Mon, 14 Feb 2022 17:22:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78F647D72B;
 Mon, 14 Feb 2022 17:22:26 +0000 (UTC)
Date: Mon, 14 Feb 2022 17:11:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: Re: [PATCH v3 1/1] util: adjust coroutine pool size to virtio block
 queue
Message-ID: <YgqNXqTwH2/qBfqs@stefanha-x1.localdomain>
References: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
 <20220128083616.6083-2-hnarukaw@yahoo-corp.jp>
 <TYCPR01MB8357459CED4A917E0F6CA53F80339@TYCPR01MB8357.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9/vQSAE9Dyg7xUMw"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB8357459CED4A917E0F6CA53F80339@TYCPR01MB8357.jpnprd01.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, Akira Oiwa <aoiwa@yahoo-corp.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9/vQSAE9Dyg7xUMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 11:54:34AM +0000, Hiroki Narukawa wrote:
> > Coroutine pool size was 64 from long ago, and the basis was organized i=
n the
> > commit message in c740ad92.
>=20
> Sorry, I noticed that commit ID mentioning here was incorrect.
> The correct one is 4d68e86b.
>=20
> https://gitlab.com/qemu-project/qemu/-/commit/4d68e86bb10159099da0798f74e=
7512955f15eec
>=20
> I have resent this patch as v4 with exactly the same code as v3, just cha=
nging this commit message.

Thanks!

Stefan

--9/vQSAE9Dyg7xUMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKjV4ACgkQnKSrs4Gr
c8gDwwf/czMEFBngJ39WDxtjRhGvqvs+hekifKvhFGkN52NeFBf0klCq3c27LXuR
U8weMicmBpHIEoDjYlpcXK8uaHdlmT2sCSglWFj2FCm/r4cnWVJJ3Aa3ljZoNc/T
8pVru4pp5IbbCGXTqLnWrkITxgxRZ7W7udESR+DnA8eQo7gG1+EMoaKbJ1ogMs+r
eXVBUy2o0Ou/8kJ7D3A2vyplxKRS6+mRiyAx5cYZoZnASCW0POGI9p3RAKypKFem
pXPf7dr4iTtxsDME7E7A5ue+fGvZ7K+LqmjKxQhiQr+5euAaxRwijiaTrFK2y0WW
27F+6f574rYmzTLEczhS2f1gGrYYGQ==
=GGmL
-----END PGP SIGNATURE-----

--9/vQSAE9Dyg7xUMw--


