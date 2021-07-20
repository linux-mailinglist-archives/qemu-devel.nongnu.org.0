Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE13CFC2E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:27:02 +0200 (CEST)
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qi5-0002Vi-Dg
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5qgn-0000PE-BB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5qgl-0003r2-WE
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626791139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xMbwJTKCkIB6IAHmyTczwRRl0oVGbPxKkLbzMucrco=;
 b=ObRfW36GVjpcImt445V1yZpdf7UTu+ccPj0I9Aw63HnMT/R/XnYMp+5XIA0tzmwG3L3MMB
 yNiLKocKvjBXgfSC2pepv5nY/WtJUoC4q1mbNQxI3BzdszDOMZFfOMHaFnjcGlrZSs9oud
 OwaGIC60bbSt4g+IA2aP6e9sbNSgIHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-OQh5KiH0OFeafDFnvfBAKg-1; Tue, 20 Jul 2021 10:25:35 -0400
X-MC-Unique: OQh5KiH0OFeafDFnvfBAKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70511100C612;
 Tue, 20 Jul 2021 14:25:34 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09CE060583;
 Tue, 20 Jul 2021 14:25:32 +0000 (UTC)
Date: Tue, 20 Jul 2021 16:25:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v6 0/4] replication: Bugfix and properly attach children
Message-ID: <YPbc23vJhDDeT+4a@redhat.com>
References: <cover.1626619393.git.lukasstraub2@web.de>
MIME-Version: 1.0
In-Reply-To: <cover.1626619393.git.lukasstraub2@web.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l710xXqrIsQ1UPYy"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--l710xXqrIsQ1UPYy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 18.07.2021 um 16:48 hat Lukas Straub geschrieben:
> Hello Everyone,
> A while ago Kevin noticed that the replication driver doesn't properly at=
tach
> the children it wants to use. Instead, it directly copies the BdrvChilds =
from
> it's backing file, which is wrong. Ths Patchset fixes the problem, fixes =
a
> potential crash in replication_co_writev due to missing permissions and r=
emoves
> a workaround that was put in place back then.
>=20
> Tested with full COLO-migration setup in my COLO testsuite.

Thanks for taking care of this, Lukas!

I've applied the series to the block branch.

Kevin

--l710xXqrIsQ1UPYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmD23NsACgkQfwmycsiP
L9bDMg//Qph8g+1iCPfPk8cmA9iDBpo2Dq/dNKQCqpzuu/FIU5lhDV3gUYnHX0ae
WO4gnruMasrJYAtAzo8X1XehSxZ1tw3Z0EYN4b66nVEfjx3d5VpKkJzQGt4ENNEX
tfep4DAOx5SPWVC53B+ne3gheWNCQBi3d6WzijeofqSJqPJlGpN+haPU6g1JiJwT
MAkx9GDeOXHF0YXQN2F5/mY3Wh/qGcl7/vapfZCIn6+9WaFqWtIkG6/0SADY8dYB
9NTKhLH7GEX0XPNFVm+dEU+2q+NLJIu0lW0Yi9ZH3kjCStC22RHN0NtDW5hhwpn+
unWwQValfiaulwrfd2H3nrfm231uDZkJDoBweyoDMwjYnz4Lq/Wf+30SYO5xW6rT
uz/43xnRuguirS5Ix8nuHgWrMoozjFjIzOJtIqKWmE4ECbJNsBwhl8IW/A24DUg6
34qcA+ttbWsexv3/5w5aiMHmMAk43P1l3CT4YuJvg/7zvSUVcrBp/T31g+TFclGw
P8xA1t/QYR6ADYPifXG3rFpYm1SEIliPU0f0/vPPCHOkZ1y+A5Mdudp+drov3Zkr
CsHiz1MokxPv02KLXmTPAupMMpmM85iEMqRQGsMsFBMNq/PDGFjslwIRbDlsb+48
1gjnueyZiOQS0E1xM8LqU2hlx05kfcdEaGY97hBvBcY+6fL8EQQ=
=JqAu
-----END PGP SIGNATURE-----

--l710xXqrIsQ1UPYy--


