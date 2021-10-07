Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E14255C5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:49:30 +0200 (CEST)
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUi8-0002PD-Vd
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUgL-0001SY-0f
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUgG-0003zr-T3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D7P1lekSB6I0fELKI0yzYaRonhRY/td9dvyFK2YJy5I=;
 b=iMuPENI4dIUzIDwUB8x0uf5hrIGF+eoepgwMlWA0/+GFbpWIamWteOtRIOwuvA+FnG3OWR
 JjFXco+RfmNAi1DvmjYgJuxk+P5dgHRjBKz5x1ogRlYTTZE2+LyBvY5O6r2/7kMSOwDs9e
 4VpRKoDT+M2v1NBqaTIhcS3eYbF7rLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-BRl1enIMPACf2EzeCACI2Q-1; Thu, 07 Oct 2021 10:47:24 -0400
X-MC-Unique: BRl1enIMPACf2EzeCACI2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61D66101F00E;
 Thu,  7 Oct 2021 14:47:22 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD0560C13;
 Thu,  7 Oct 2021 14:47:21 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:47:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 17/25] include/block/transactions: global state
 API + assertions
Message-ID: <YV8IeFCtejooaE9l@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-18-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-18-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cWfCYMAkUOz9woyz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--cWfCYMAkUOz9woyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:07AM -0400, Emanuele Giuseppe Esposito wrote:
> transactions run always under the BQL lock, so they are all
> in the global state API.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/transactions.h | 24 ++++++++++++++++++++++++
>  util/transactions.c         |  4 ++++
>  2 files changed, 28 insertions(+)

Hmm...not sure about this. Maybe Vladimir can share his thoughts.

This seems like a library that can be used in various situations. It has
no connection to the BQL. There's no need to declare it GS or I/O
because it's just a utility just like QEMUIOVector, etc.

--cWfCYMAkUOz9woyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCHgACgkQnKSrs4Gr
c8j7Awf+NhnAtE2gjfQML+8csyE/Bc9qD1YQqt5l7ZJxwWhXt32PEKHHrNDDIutG
SEREGYp/FA0/yvvnPGonixrQ55EHm1SCQZ65h6uoTrKXj0wGWkzo2xbVM271LYtC
gdxQf2qH/sMOub+UNV5G4wEjo3JtPTjeFsdATqhOKaulrAqIgvicGx2Rt0orlXWf
UIc9ftorR9Nrt48L0ON61ifzBdFXSQ1ai/Xu6MK2ll/XM5YvnbbQgH0xGc2JpyYU
OZuSn8zTBZTMK0WemR7AB/xrdEs7IpwHduqH1nEkcNhqvoVId2BODP0M8bBuwlfq
NNL+zRSsI/KGLGK0rzyb+0y+jG8iEA==
=ZIAw
-----END PGP SIGNATURE-----

--cWfCYMAkUOz9woyz--


