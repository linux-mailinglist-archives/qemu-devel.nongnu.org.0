Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D5489D72
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:24:55 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xTa-0007u5-As
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xRf-0005qt-4n
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:22:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xRd-0008JZ-Mj
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641831773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdeqZS2bLT2QEn/4w651/SLfCo0wZp9rsLRsaFlbl5s=;
 b=WMYWPQdogzVzjagF1Xak8vOlcJZb9yGW0qgElXxDv5PkqRwveBJ2pitbeon9EqvCjcHmgZ
 jXqd+leQKwCNUqslmFQ1fYkNm2+uaAMMzvokGMXHKGp0/EovLASsK28+HSY2KMVXZbdcrq
 c3vgrCB2kTeD5GNuavKgTv1bZEwf07M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-tXVgL5P9MEepVpN6glqlDA-1; Mon, 10 Jan 2022 11:22:49 -0500
X-MC-Unique: tXVgL5P9MEepVpN6glqlDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3161B2C980;
 Mon, 10 Jan 2022 16:22:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C409A1884;
 Mon, 10 Jan 2022 16:22:47 +0000 (UTC)
Date: Mon, 10 Jan 2022 16:22:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 3/4] scripts/qapi-gen.py: add --add-trace-points option
Message-ID: <YdxdVsQ7eRqOf2It@stefanha-x1.localdomain>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211223110756.699148-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t+jvDCalqfFZIxPK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, michael.roth@amd.com,
 philmd@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--t+jvDCalqfFZIxPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 23, 2021 at 12:07:55PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> @@ -74,6 +75,8 @@ def main() -> int:
>      parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>                          dest='unmask',
>                          help="expose non-ABI names in introspection")
> +    parser.add_argument('--add-trace-points', action='store_true',
> +                        help="add trace points to qmp marshals")

Please call it --add-trace-events for consistency with QEMU tracing
terminology.

Thanks,
Stefan

--t+jvDCalqfFZIxPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcXVYACgkQnKSrs4Gr
c8gvUgf5AWp+ZneTREQE0/2oveKMRJp4LY4zMdSv79Yw23IxV4UC/EcOEeXRXWLF
UAbJF2S4Ab6GVFg3XDjAlOmd9baRMVQV+1vsium8AQSRtyVKK/WGWJ0TDS25JIR0
s3hvoya1LHMY3rZkRRnwTcSu0PFAF2N61XnO8a2ZwwKbjnZp/m9Z76afMdUJlwHd
MKxNotJkFaJIyviyGEmw5/X0rFBvi7Ca40S9txOVm4RIKekbLGRr5e5i8HqBpK3N
d/NuifbrmNHBVtjSvN50IPGHi8YFGQuSBi1Wips4wnyEeacg0GA4S1roD4jzq6Lu
s7b4IiQjM9/NRBWTVMnYnC2onxOI/Q==
=SV3z
-----END PGP SIGNATURE-----

--t+jvDCalqfFZIxPK--


