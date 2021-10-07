Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61B42560E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:06:08 +0200 (CEST)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUyF-0005O2-MY
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUnW-00054v-34
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUnU-0001eH-4u
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJCsurpc2OcV8mnlWm3ipZT88IS5Ih3/MTYs7yzMw7I=;
 b=Y36gJs4gxyxL3GDXjw6/mwodhxipt7YRJFFcpzJxy2NKpUDuC6gAUjlSjfl9Sz0/rlFbJ/
 m4wvPq4GJlw5yhcM5JWu476IEJU+WbO9Th9LB5e4RVBMzeiuFbz1gC6QBJ2G+oJbPN1WKk
 Fu/mzwysyOV609Cb/jcZnmcxvIQYtUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-2VybYzbGMk-z5F6nwZ11Dg-1; Thu, 07 Oct 2021 10:54:58 -0400
X-MC-Unique: 2VybYzbGMk-z5F6nwZ11Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C64E1922025;
 Thu,  7 Oct 2021 14:54:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4D135F4E3;
 Thu,  7 Oct 2021 14:54:56 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:54:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 25/25] job.h: assertions in the callers of
 JobDriver funcion pointers
Message-ID: <YV8KPwJR+7aC7EMI@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-26-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-26-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d0NDnc+REAMa8ElT"
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

--d0NDnc+REAMa8ElT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:32:15AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  job.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--d0NDnc+REAMa8ElT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCj8ACgkQnKSrs4Gr
c8gINggAj7abWHzUJqt5TxIEMaVQjqnswXZ+EsrHKnDSOFy0afC63eDZ0MJz2ZEB
hMiOmyR7CFeY64N5czgloDozNWL+/XwXYc/xTxm5PEf0+8SDP6op01r2dEzh6970
nANk3fgIQg+6Y8ERjAqsNXoW0b2RzNUsuis6q+KMYCW9IYiD1Na/j2zaaBHf+jQx
KhcmYNYotOSSgJ7NqXfFgf1iFN1Tz29jxTtr6Vdknd88HB0JaGR4g8npq97sYnN7
3l3/aguNkSuGka5fvDik4kHNXcK2rsoKWxTYN80tZOQ44FJ4rxlkOsiVIJw1hvwM
8A1b74vrC13Kr1oCWyFTPSfsDKzP4Q==
=Y7CO
-----END PGP SIGNATURE-----

--d0NDnc+REAMa8ElT--


