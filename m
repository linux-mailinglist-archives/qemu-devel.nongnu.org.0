Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A0210FB2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 17:50:11 +0200 (CEST)
Received: from localhost ([::1]:46648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqezy-0006qv-Uf
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 11:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jqeyg-0005Bp-KN
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 11:48:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54611
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jqeyf-000152-3A
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 11:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593618527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VmpYgmDpMI8Nyf433fBAgfotNyjAMlh1tbipCQhOal4=;
 b=E7yavFdOiSO1wRvvD+xJHkD/hUS1I3jwxtkLJeurXBeFjShY2vQSn8QcDvv0kT1eNfzb7j
 cRAn9HaX4x80vCnJWAT0EG7DCzYEwbhsmv6lnFN0WSTFASQXDLCeg52m12jkatAAAnagv2
 vJT1yYXEsMPCFvJD+Nrw3yJrJPO/a58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-l5LuqbabMJuDz5KSJbMCHw-1; Wed, 01 Jul 2020 11:48:43 -0400
X-MC-Unique: l5LuqbabMJuDz5KSJbMCHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB5E64A75;
 Wed,  1 Jul 2020 15:48:40 +0000 (UTC)
Received: from localhost (ovpn-113-121.ams2.redhat.com [10.36.113.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3F8079500;
 Wed,  1 Jul 2020 15:48:39 +0000 (UTC)
Date: Wed, 1 Jul 2020 16:48:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 01/12] block/nvme: Replace magic value by SCALE_MS
 definition
Message-ID: <20200701154838.GN126613@stefanha-x1.localdomain>
References: <20200630191318.30021-1-philmd@redhat.com>
 <20200630191318.30021-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200630191318.30021-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NJSRbAqOy4NeGDns"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:29:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NJSRbAqOy4NeGDns
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 09:13:07PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use self-explicit SCALE_MS definition instead of magic value.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--NJSRbAqOy4NeGDns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl78sFYACgkQnKSrs4Gr
c8jbqwf/UYQiY//6tTkg6F5k0q0q5bOYQLw5k/ZLfiS7l480etova3ZnluWXSDQ1
urjrVQcEqR3o8tKpkG9oLG5VTSVrVOANrWyKbJtpMKG4pLzkqhjdOi3vV2b3FTKt
UOejAUKTMR9DOgZV4RDa8ALaawljPMiwCAIJaS6jTFhbDmL4ozohedBWZNRNlfM7
wBCqdr75OGlmrA3fZfdwnGCkHrPFJvu8uljhK7zpDwwxxCHJed3TzOBP8s3562LT
XNnrp7ICdjPxMqMQHNprlIinmUEEcIQptnH2A0apHYR84vvY1LTlkd57tqzd9LcZ
ZAC+OMAMTt8dYyQjmUInSzU+4MKdtg==
=vTBH
-----END PGP SIGNATURE-----

--NJSRbAqOy4NeGDns--


