Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB338E7B7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:34:02 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAiX-00011e-Kx
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAh9-0000HR-Je
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAh4-0000dK-OS
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621863149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l9psaXvTKY4OvqDlee98+bbMnpEfcyIqLuAW7Dy7O0s=;
 b=EgG+3fl1VGg2Lvypi/Cw+Tu7rA6EGGTmCf5O89lyW07GUkVqyo4OOi4ZDYUOtpfBJlKgWq
 7DenvqhCcwrTZZsNknmwQBFPN/y3mdW17F2VC1jt264d3FI1JyyycdcDVeXeyLHgBXbLXF
 OJSfk18QGuQN8L/woL8Y9iKX4uC5qa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-4fcc0e4RMauGz2aleQOjHg-1; Mon, 24 May 2021 09:32:26 -0400
X-MC-Unique: 4fcc0e4RMauGz2aleQOjHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26A331009795;
 Mon, 24 May 2021 13:32:13 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C36082C6E2;
 Mon, 24 May 2021 13:32:12 +0000 (UTC)
Date: Mon, 24 May 2021 14:32:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Subject: Re: Fwd: GSoC Intro - TUI interface for QMP
Message-ID: <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YbbvDDNRrpIsEKDR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, armbru@redhat.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YbbvDDNRrpIsEKDR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:
> By end of this summer, I would like to get a basic TUI with some desirabl=
e
> features working. Some of the features I would like to get working are
> 1) Syntax checking
> 2) Syntax highlighting
> 3) Code completion
> 4) Logging
>=20
> I would like to hear some of the features you would like to have and also
> your
> advice's on implementation.

Welcome Niteesh!

It would be great to have an QMP API documentation viewer built into the
TUI. When you enter a command like 'migrate' it would automatically
display the associated QMP command documentation from qapi/*.json.

Stefan

--YbbvDDNRrpIsEKDR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCrqtsACgkQnKSrs4Gr
c8grkwf/UXY8qKRa3P9SDj44XEAT6tLDa89iohRs4juSO/N7t52rVXxh3KBBysOH
nxecBnQmDEz6kGh9IfgqeBz44RjA7Q5i5+ROWxzduS/ByKmaHIIK2+0igS17MvCr
2ulgMMeVqWjYqtPnjnK0XCiqpDjJh3E3z3dNE4njSjvInhTLgPkqoenCy6aLJ6E9
uvEWOVnLnzwi+gOpd0iap1M3b79xZj7dsYQxHwLezhV974bZudZsk1uXWpgJ7el9
6Eh/agsua4vS8i0+3niNcouXkMjVzBxeuhSX7Gf21BGygTjoVAchIhNgtTTbvtFd
eKKLcj6I5lMmMa7aR3aegYQwPim0xQ==
=J8BM
-----END PGP SIGNATURE-----

--YbbvDDNRrpIsEKDR--


