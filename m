Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE34255EC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:59:57 +0200 (CEST)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUsE-0007x3-S6
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUk2-00062H-T0
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUk1-0007KC-Aj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SobRdiIHPK7A7ox8nc9dNGxWissDf8ab94VNyC2Ybdw=;
 b=UVLoczVPEYfRv0zjaGiit80DiJiYx3ZnwmXdj87t5FNRdDqoMDEn61oYukFUPKlwVcAWx3
 iyiJxUIhAnsDbQX/osLhNlHOrcYZcfyPQ0aOEDxUiTRe/VN3Lx4898xKQLf5VsKfs+bkIi
 zVx1FZyFIzV8XcyNUXB3WOS6M70+5Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-UcegiE_2PNSrgy-cNRiI5A-1; Thu, 07 Oct 2021 10:51:21 -0400
X-MC-Unique: UcegiE_2PNSrgy-cNRiI5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB4B802B9F;
 Thu,  7 Oct 2021 14:51:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00A535D6D5;
 Thu,  7 Oct 2021 14:51:19 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:51:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 21/25] block_int-common.h: split function pointers
 in BdrvChildClass
Message-ID: <YV8JZseFAawFHFV0@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-22-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-22-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xypLiApmrOJ/AVvV"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--xypLiApmrOJ/AVvV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:32:11AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block_int-common.h | 65 ++++++++++++++++++++++----------
>  1 file changed, 46 insertions(+), 19 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xypLiApmrOJ/AVvV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCWYACgkQnKSrs4Gr
c8jxKQf/dmDAQrv1fD4UMxTYsD6m0TXr278oi9fGA6KdH0ug0S43QEqR0jhFdbP9
xZLPfSIhPA8QCqLBvlnydZk84UEfnndso7rMkuReZTvgShcWqSGz4cnOjCLVUwOd
4vdpCLQfprMKQqskO1Yxg57aiaGZmOphfDkMRU0VAjXUgcHrbCLBKewmV53cBKBb
E/IgNw8OCKf0innTleocSzIKqexW6QXZB6EkzR4TQxHJbBBlcVFR06XR1tXg4C4f
xRk3TDjGmqp0486JsfMs+1gHuWerAilDknxch2i1L1ToJwmDJrOotlJZWlhcVD0n
+SB1I8qM+Tb3+udhAfCogGCZl9Mj8w==
=bjpk
-----END PGP SIGNATURE-----

--xypLiApmrOJ/AVvV--


