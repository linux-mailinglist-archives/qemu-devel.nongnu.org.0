Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536242557C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:32:11 +0200 (CEST)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYURN-0001A8-Vx
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUOr-0007mW-Pb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUOq-0001gf-Et
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5siIg4KVXi3KkOMs8AbtL27gkJjhu8tH4lAsXEMej1s=;
 b=MJPZGrreQyaitjY4t/b+w+gmeUaVnsvvnTFcZEzeFGQXBrcw064WHlGcC1FBmCXi5WWMTf
 S/ph4vTMXQPBMGJRkrZnLMfIqCQR597aNJOX5y+NHiVEzwLSVx+KctAVEiUbUoO8O2Waeh
 Lln9XpjPf7RfZ2M5xuTNYEjILDD0fek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-evKZECB-MdK98gLZUCArng-1; Thu, 07 Oct 2021 10:29:28 -0400
X-MC-Unique: evKZECB-MdK98gLZUCArng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1F6100C612;
 Thu,  7 Oct 2021 14:29:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5CF26379;
 Thu,  7 Oct 2021 14:29:26 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:29:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 14/25] assertions for blockdev.h global state API
Message-ID: <YV8ERfMECcWLJ9m+@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-15-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-15-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U/NqqLbZCeczHiOV"
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

--U/NqqLbZCeczHiOV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:32:04AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/block-backend.c |  2 ++
>  blockdev.c            | 12 ++++++++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--U/NqqLbZCeczHiOV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfBEUACgkQnKSrs4Gr
c8gAjgf/eYNOT+TqQVd/SIIxmebRCVD+rI+CoTd7EQHz77HLB/ikUwlqQHCe709e
q9RJH8qQGsO/bqrA7bi5GXpM09AbgK2ca93GfulEv1/qWJCcEfTuR6AExwXltg+T
rFJHNhMdmIlpMZnq352+BPFkf4TY76+OVNjmmUXdI4lJqOGmcsf0BjyjiWY+jnx2
Vx7+TXUaGD4QOFKXsXzlbFT8AuKqNA4kIzi0QEeZ469T4njOrjQhffN10aibMV2F
rZykPNBWz1tGUGCD70lFFXV/e7siulIqGI4WTdU9YXraWM3LqAf0JUjgW9LwoQrP
/QMXAD3wVd7zCrRQdls6Z/8LrnmZBg==
=v5Wq
-----END PGP SIGNATURE-----

--U/NqqLbZCeczHiOV--


