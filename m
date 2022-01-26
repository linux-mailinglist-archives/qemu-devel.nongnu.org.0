Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368349CB28
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:44:42 +0100 (CET)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCibI-0004ZV-Rf
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiRy-00070r-KK
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiRv-0006d2-J7
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fbpDMz9HPCxSra7wdg+RVkKpi1ad0S13a+Ggt21Q640=;
 b=K/XsYURDVPLgh1G1fPl2RWJXw6uuQShEk+dNQNLnYjqCIADkNqHI1cPxOC/AKbNeyXi8dE
 qTl53I4D7wIedUXhAtyTi4NWaexe8w08k3p+J+IQ6pcswGRVjSbwYHLZNEGMGst6MSv9iE
 KB9FLAIx11+Xp3F6g0+OLBHoc+iPW2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-DqbkaH5wMBWC8aYJGuP4Nw-1; Wed, 26 Jan 2022 08:34:48 -0500
X-MC-Unique: DqbkaH5wMBWC8aYJGuP4Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5815100C660;
 Wed, 26 Jan 2022 13:34:47 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD4D87B9F6;
 Wed, 26 Jan 2022 13:34:20 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:34:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
Message-ID: <YfFN2pXbAaeNOy96@stefanha-x1.localdomain>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H+FbTyA+Kys6kDUD"
Content-Disposition: inline
In-Reply-To: <20220125215655.3111881-7-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H+FbTyA+Kys6kDUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Come to think of it, this is more of a QAPI code generator series so
Markus is probably the one merging, not me. Sorry for the confusion :).

Markus: Please see the small fixups I've suggested. They could be
applied when merging this series.

Stefan

--H+FbTyA+Kys6kDUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxTdoACgkQnKSrs4Gr
c8jqyggAwDxXDd1i/QBkamy1UFX1wURp0SfSxLAU5dzWoLVDM8vzz7V1TAjjn2kW
B+7u/IaW2UvKpC7b2peqv+Ca/rpjwy/Sfjn39iFHl/gxSO4gwrCZU1zijrNDSwym
MsMBrUQGcWov2j/5JLjIdHjtpVoCD06mguC/3UWralSmjcPsAz+VKP/S3+esK1D4
ufFGloomoyEoJG43vnx0SiwJ8sN9XXlUIw6eWlPyCYjb+kwRa3DO5zH7n//SWO9u
YmHi03uB3QTSClerzSgYvAnslXn43fTZ6E5mqNMMwSioVmZssq79QNlROppGrNmO
BXz8jrucpa5+8+VgVps7FVBpFUYidg==
=7dTC
-----END PGP SIGNATURE-----

--H+FbTyA+Kys6kDUD--


