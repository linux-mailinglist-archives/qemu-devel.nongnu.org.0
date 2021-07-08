Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB13BF8A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:03:46 +0200 (CEST)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ron-0005BO-FA
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Rnr-0004Ml-Ii
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Rno-0001pc-SN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625742162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkLRsmk29eE0fYxY/1NghzFvvFJ3sBjtuDWMcuSJ0kA=;
 b=ZEedp7kGscLJRlqqfEHxHEOESFJprQ4D2tEdoWwVzYTiM/JXUku9KASyH1ecah3Kut//iR
 Fx+YvP/ZJbNVZJ7oKcWs1CaZTKMzuXOgyhyRFORqap50igM4eeuXprHcVMSsR1HMTEYdg1
 zkVjqXqKQ5TTEB6eg0nYb0+L1DhYRSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-zbnkF79fPuGYhYpplBUeGQ-1; Thu, 08 Jul 2021 07:02:38 -0400
X-MC-Unique: zbnkF79fPuGYhYpplBUeGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C38C8042F3;
 Thu,  8 Jul 2021 11:02:37 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7B8B6267C;
 Thu,  8 Jul 2021 11:02:36 +0000 (UTC)
Date: Thu, 8 Jul 2021 12:02:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 4/6] job.h: categorize job fields
Message-ID: <YObbS4aY/9bFBaFX@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707165813.55361-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WqT1mT8k1jtuVWYI"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--WqT1mT8k1jtuVWYI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 06:58:11PM +0200, Emanuele Giuseppe Esposito wrote:
> -    /** AioContext to run the job coroutine in */
> +    /**
> +     * AioContext to run the job coroutine in.
> +     * Atomic.
> +     */
>      AioContext *aio_context;

This isn't accessed using atomic operations, so I'm not sure why it's
documented as atomic?

--WqT1mT8k1jtuVWYI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm20sACgkQnKSrs4Gr
c8i3hgf9Gb+WQ3z0bcE91irpq0YnzJZX7up47jUkW9BT5ucRCdGyRpFe/tlb9Fdq
hOkkLZOadGnRjcKL1sJcwsPU3tDg5vFaJDHa0Ys2R4fBSl/j6Uz9tYgLAY9B/0z5
SQca5mNWHYAL1Nad259DL6c6oWRwYZw2kdF0oK+kZLuJcFT1HI+MBWFvVzAxIge+
wIn9aI10UGdh1HpB+RKfnuacDtwDK9KB8vLpMum65Skz2UwgslR5JStNMK728ENi
c9/YYAmZCio2fsUaKrmVLmZb0Kxyfd2INm0ejgtgLXUO95VDdK6Zb4M7R9+rplbg
HCo0n11Ltr41lSllKLI1RT1D88xrqg==
=ckC3
-----END PGP SIGNATURE-----

--WqT1mT8k1jtuVWYI--


