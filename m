Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71846FC919
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:34:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOPg-0007Uf-HV; Tue, 09 May 2023 10:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOPZ-0007Tb-34
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOPX-00075v-6S
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683642830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Smz+3aqz8/6edHmqvTH+7+adlR4FNekAfxJ4AtKUj8w=;
 b=WBdFVDYxIBfWJSC2jWpykwj/rmlhCgPZ6E2GIwq5qxBM6GhrW85GCnE6NIHbMKa/eEzgzv
 H4p5MO5cY+b/fyoNCD4zt41rtCuQ5wWD+Me9WumU4NXmCRc2mwNlHi1qAcg5YSWW2Mq7B2
 gkCWcCic7aSbpTFA8/GXDC3NJfDrxWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-X-QX-0UkNkW3sJrI8fwH3w-1; Tue, 09 May 2023 10:33:40 -0400
X-MC-Unique: X-QX-0UkNkW3sJrI8fwH3w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63EED10AF919;
 Tue,  9 May 2023 14:33:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF760492B08;
 Tue,  9 May 2023 14:33:06 +0000 (UTC)
Date: Tue, 9 May 2023 10:33:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
Message-ID: <20230509143305.GD1008478@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230504174816.GA581920@fedora>
 <CAFn=p-ZhsUgMrK+w+ibP68q-v093SDEfhqxHsfTtFfS3qxD9ow@mail.gmail.com>
 <20230508150740.GC581920@fedora>
 <49EAD96A-8AE2-4F2A-9931-DC026A3F974F@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WKZH2uuDzHK7TEiY"
Content-Disposition: inline
In-Reply-To: <49EAD96A-8AE2-4F2A-9931-DC026A3F974F@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--WKZH2uuDzHK7TEiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 06:50:58PM +0200, Mads Ynddal wrote:
>=20
> >=20
> > I was curious how Mads is using simpletrace for an internal (to
> > Samsung?) project.
> >=20
>=20
> I was just tracing the NVMe emulation to get some metrics. The code is all
> upstream or a part of this patchset. The rest is tracing configs.

I see, not a different codebase from QEMU. In that case what I said
about extracting tracetool and simpletrace from qemu.git won't be
useful.

Stefan

--WKZH2uuDzHK7TEiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaWaEACgkQnKSrs4Gr
c8igwQf/VwU9gRRjxwyqLPThkUzjMRPmA79jReG6GwikZ7qvF8Fdnw8wi/RycBON
qWxw5zm/hx+glHnsDIb37zeZ7zYxWFq/i6kV4g4bjlIozPwQtZInAG+g/ZtaJ8Aw
FltQClHhvCXts179/bnbUhxpHGGWQEtzf3+5ogYJkotNs15ap68ccZpBtWhylRNg
upjdQk9FkNJZAEZtSjX8f/rGW8OsRrtYwpQ7IWSqKajxumUZeqsWEd//REe7svFM
3tyLVWQD1MVHedeUFMEOXSiChZmL9x80v9Y4hfMLaAPzarK3342G4KzU1ST4liNE
PaODgpQTMmUmF+iXg2ZFnvDLIdcBkA==
=V0Qa
-----END PGP SIGNATURE-----

--WKZH2uuDzHK7TEiY--


