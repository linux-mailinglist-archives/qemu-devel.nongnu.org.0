Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0143659C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:14:39 +0200 (CEST)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZmA-0007FY-K5
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZjY-0004EF-W4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZjX-0005P7-JE
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634829115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0K1A4T1yY52cqNnPLMbNJZ6WwAU/1WCEdZsCQ3Bog4s=;
 b=Wb6e3P8naYVLZXlL4zgbqmgxBTbdieWalObb8H9AthBBCHch68hVdIvbzlLq0fqjqUaomg
 vNV833sZTjJHUSYsDUrVtM09R3NXvcZ3EGx7GL+VbASeSm5Z92Qucqgr8Ci/roKI6v+S1x
 N41bUArrJLHXdX0tfq+sQUCLpPV8lko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-LAan63qNMnqqoeaDBXLskg-1; Thu, 21 Oct 2021 11:11:53 -0400
X-MC-Unique: LAan63qNMnqqoeaDBXLskg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8591926DA2;
 Thu, 21 Oct 2021 15:11:52 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94D205B826;
 Thu, 21 Oct 2021 15:11:51 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:11:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 24/25] job.h: split function pointers in JobDriver
Message-ID: <YXGDNsiTcNWrZB41@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-25-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-25-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2bA7Cn9qx6nC9T4q"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--2bA7Cn9qx6nC9T4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:49:05AM -0400, Emanuele Giuseppe Esposito wrote:
> The job API will be handled separately in another serie.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--2bA7Cn9qx6nC9T4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxgzYACgkQnKSrs4Gr
c8hKTQgAxwu/tOz7wxbM5T6fQMYc1bES8Mu4CNGbr9qmjm2K3vjw2nB3nSZyM4w6
r9x9G8DbbVgLM2mJ/xtB6cIVrgB4hrAYzt/F2Y7DUYLyjCkKZg/Q0oDus57Y3FgH
265xlLRg6pOgsgS1HvRRDvynCMT+hivOt7DtRqpOYxOzY14qCbau9Cr64mQX4J3z
19yl5MmyznTHkVdoXU+XaLZPcV2i6kXH3nzkTqc6HG9Hd4o64PJ2VnUKAj4I3KLj
Xy3De23sXfm58PtiHOeKU7fGvUgF3Z7Gj0vW25OV85KuWoxUIGMJzgt8OSUIskR4
kJ+wegz0Wl7svFMfVGP9Jgog7r0leQ==
=74G2
-----END PGP SIGNATURE-----

--2bA7Cn9qx6nC9T4q--


