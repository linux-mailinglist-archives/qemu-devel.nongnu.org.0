Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686502761A3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 22:06:22 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLB1x-0006PH-Cm
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 16:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLB03-0005uR-5k
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 16:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLB01-0003nW-Ja
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 16:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600891460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HagUY02YwUYtC+M+8yHFtrondOg11UbYsZiKYqFz4wc=;
 b=N1L7yBrhKLOT7hG5uY/+SGDBZ2vxHQeGP1OoAPBkY8OIpSrkyMUCpdiRXoFQXOkvz5ypW0
 8Gao6P5j/mMZIUycDFVUkw08TSpJJSWwxTiPaxhuE90AUR6NYkTGnSJNBPfCZwFYIy9g61
 aHdEODwTa8v056OV7BHQezvU4ArZNgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-v4sx3MR8ObyBuWjphSGJbQ-1; Wed, 23 Sep 2020 16:04:17 -0400
X-MC-Unique: v4sx3MR8ObyBuWjphSGJbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D8AC801E53;
 Wed, 23 Sep 2020 20:04:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9BD5C1DC;
 Wed, 23 Sep 2020 20:04:15 +0000 (UTC)
Date: Wed, 23 Sep 2020 16:04:13 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 15/38] qapi/common.py: move build_params into gen.py
Message-ID: <20200923200413.GO191229@localhost.localdomain>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-16-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-16-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FilwpOHBrTVNlmJ3"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FilwpOHBrTVNlmJ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 05:00:38PM -0400, John Snow wrote:
> Including it in common.py creates a circular import dependency; schema
> relies on common, but common.build_params requires a type annotation
> from schema. To type this properly, it needs to be moved outside the
> cycle.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--FilwpOHBrTVNlmJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9rqjsACgkQZX6NM6Xy
CfOdwhAAz+xRxDDjSN9xc411OTWbXCw1G6fvlqKEjRfkCX5H8BXSlWApntjydKfK
gl8095pg3Nr35P+riLzt22+k591VNYFK002fRGWYQamAXtzyLBXZtaRgJWykzk0X
ZNr2W6g6KkmfW40hqXc2tFgKGiwHLUQ4iwpbIFdcdFv62h7IAfFSl7LFlmF8z55X
F9j4YBKKpO3eEUn+xlaTYYUeDFxCiP0oGzRK14ger/rZimGewgxpi8CUZleK2G+q
ilcpiB36btSeZi0zqvYVTmtw8NW4UQLUrMpyOYf3EQd8Tns379bh1bN5O+SrfdjF
T/OOdo6xjqHc/SGE4EWcXXhJ6XuIXahmiqKjSbsXc5MChHl6KSb8yZ47ewXhEaJa
tXj1Ba6SvmYeXkGGq0UsZOdUXkWRlUnUVvecTxzggnQuAL/VC/AIASLFRtxrfMbh
kQdxLjsRq8cauKqbOqLXfcOC2IGDAbRpgq4y4fSy4TVh26rYFVoO15PULcIUlBir
my9w/uERmtFOnZLVVaGoCzj4c3PNb7tQ7MHYCDw9v+vPX/tIqXk+Y2Hr2jh9YDrQ
uyPi20mNGVMHfpfjNUZ0X7dbhnpl71w5m7Luqv7n7EUGfdenmPOR/UHJMFODIF6h
WmPGtGAzJLfLwWTELFXB2+Nxh1FZUyRqja2dGdbmM87jdy4cP7Q=
=kPap
-----END PGP SIGNATURE-----

--FilwpOHBrTVNlmJ3--


