Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC99E52D18A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:33:50 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrePT-0008VM-D7
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nreJL-0007AV-QC
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nreJK-0002Ov-2Q
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652959635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ENs2VVW+IDPEnIR2KsZOf16JkbGQ0rXSJlP5wB1PXCY=;
 b=FJ8WI9qch6sCurJPe3lbEwYMADDVYauU1fHKQa4U1o+GB9Xpbi3N0r2Nqtld2hN5mTEEaj
 mBuh+NP67NmfAtzTlQ4etHoGF26/oRjg21UZhRat5sKclNzz829o1iWjCI/P2UCuPbdoZQ
 NAYDjjv+Rnm8qlhpsajnFEfqkm/76QU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-G8Ng-RBjOyCdBOPOTbJGaw-1; Thu, 19 May 2022 07:27:12 -0400
X-MC-Unique: G8Ng-RBjOyCdBOPOTbJGaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8E6029AA2EA;
 Thu, 19 May 2022 11:27:11 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CF837774;
 Thu, 19 May 2022 11:27:10 +0000 (UTC)
Date: Thu, 19 May 2022 12:27:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoYpjVdPcIDyd7i+@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MfFJnJ8szqeShiEA"
Content-Disposition: inline
In-Reply-To: <YoUbWYfl0Bft3LiU@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MfFJnJ8szqeShiEA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2022 at 06:14:17PM +0200, Kevin Wolf wrote:
> If we want to use drain for locking, we need to make sure that drain
> actually does the job correctly. I see two major problems with it:
>=20
> The first one is that drain only covers I/O paths, but we need to
> protect against _anything_ touching block nodes. This might mean a
> massive audit and making sure that everything in QEMU that could
> possibly touch a block node is integrated with drain.

> I think Emanuele has argued before that because writes to the graph only
> happen in the main thread and we believe that currently only I/O
> requests are processed in iothreads, this is safe and we don't actually
> need to audit everything.

I'm interested in the non-I/O code path cases you're thinking about:

Block jobs receive callbacks during drain. They are safe.

Exports:
- The nbd export has code to deal with drain and looks safe.
- vhost-user-blk uses aio_set_fd_handler(is_external=3Dtrue) for virtqueue
  kick fds but not for the vhost-user UNIX domain socket (not sure if
  that's a problem).
- FUSE uses aio_set_fd_handler(is_external=3Dtrue) and looks safe.

The monitor runs with the BQL in the main loop and doesn't use
coroutines. It should be safe.

Anything else?

Stefan

--MfFJnJ8szqeShiEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKGKY0ACgkQnKSrs4Gr
c8j1dgf8C/WKTv2niRlrDHz56RIpXvdIECRMi2gKLJA0eIflHsfh8XWeConGQ+NF
879+7iATYJvtN9HG51U8AsK2qsAroOnLt9ItySOAyOSuoyV3RUExEXA1X/aV0D5O
YkHG1AppEvR/pzQY3H7dOnrsUv7mAmRNL2/Op4/IZIY4p8mswDWikUFv3T9/EkMx
gtvrTjU6qa1REGlrL+uZu2j+9dwyPlG2ctCzVK8mS1V6u7fB6cLTqIKl8jdwzExL
chSRyCR9jUW4gJRTdvPB0DUYI5ygM6K1yEZ0IzYGI2JeItV/yr5vo0+drvLshVXr
V1QBDApZuDU8Q4a278B3lkhCbm1IeQ==
=jWlY
-----END PGP SIGNATURE-----

--MfFJnJ8szqeShiEA--


