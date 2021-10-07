Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FC4255D5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:53:43 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUmE-0000LK-8E
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUkL-0006Dg-HS
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUkJ-0007ZV-RN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmxldmqd2y2vMH+FcCx3MXrPPqH5QGqZL7mK6K3nyVg=;
 b=A+/ML1Zuu4wcI0+siiyXMSMMR8JVspzV95kIT3/Qk7nsIYOqNJVhlhdW68jVXgtntszcZK
 khQUp5emG0PKC8Zj+nLP1yJZvP907t+78DJhGkeb9yjjvvAMvouQT+LE5aaQPVwTR4vgjE
 uB8RxjWlYiUUnccVOJFlMoO/acvjeUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-PA-v_8GbNw2n2qLSHr1fbw-1; Thu, 07 Oct 2021 10:51:40 -0400
X-MC-Unique: PA-v_8GbNw2n2qLSHr1fbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFFF7145B77;
 Thu,  7 Oct 2021 14:51:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8376A6091B;
 Thu,  7 Oct 2021 14:51:38 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:51:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 22/25] block_int-common.h: assertions in the
 callers of BdrvChildClass function pointers
Message-ID: <YV8JeWwpgQdkt6nf@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-23-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-23-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LgbI1MgUOqFFNDfx"
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

--LgbI1MgUOqFFNDfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:32:12AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LgbI1MgUOqFFNDfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCXkACgkQnKSrs4Gr
c8ii9wgApxdFiybG/izOKUP6mtMb1BJuP9VOF5qmVEvyU7fND+/OjGkesNETWD4O
JSQR4Cq03YeWPbQ6NvjYWERSm+GI1TTGQoPJIiI1wJnBMsai6HsucGvtSFC0M66u
SjN5HTiOv3hzn/eqU/zeymV2ulwgd/BBRrQCIsxQYfNEvv5COGuLL0UA3Zn3+D8w
EaB5gpikx5RV3f5HCkMey2R2LNbN8FEtWshGD5JWC7irOuz9YYCRm3v66P0+4TLo
1hie5X68OnKNZU34k8pTO2OUSvqlSAbf9hqrsnpMiiSUtyKJkfiYQqNyOTw0FygY
dTOpg9mmwB63BdQJhE4B7qgY/JVWdw==
=VR+m
-----END PGP SIGNATURE-----

--LgbI1MgUOqFFNDfx--


