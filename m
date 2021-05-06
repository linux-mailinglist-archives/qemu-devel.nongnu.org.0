Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B623757BD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:41:03 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leg7Y-00073f-QO
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leg43-0005jg-Rs
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leg3v-00082c-Ka
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irWiir4FAawEfidXO5ZQXDcI/rrZ7UjVwE7LMU/NH9Q=;
 b=h4M6AS+IfAi1D9SuXzBWj1VyOhnPcAFov8ZSL9dunH/S1dit/a5ZYGY15NmlMODoMxohZo
 SOBdP6QohiQ1AC8sScE05mlkC5Y1br85GEbInohT+dysd9N+OBp0w23vQ1FIvvC4lr851/
 L84MK61kUlgPEO8eggltLapRNsm9Ri0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-Jhu3giazO06YgzdEmL1f2g-1; Thu, 06 May 2021 11:37:10 -0400
X-MC-Unique: Jhu3giazO06YgzdEmL1f2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 351D9107ACE4;
 Thu,  6 May 2021 15:37:09 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739655D6AC;
 Thu,  6 May 2021 15:37:05 +0000 (UTC)
Date: Thu, 6 May 2021 16:37:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-27-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-27-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PfGM/wauBig6Rvke"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PfGM/wauBig6Rvke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:01:00PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: Vivek Goyal <vgoyal@redhat.com>
>=20
> If qemu guest asked to drop CAP_FSETID upon write, send that info
> to qemu in SLAVE_FS_IO message so that qemu can drop capability
> before WRITE. This is to make sure that any setuid bit is killed
> on fd (if there is one set).
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

I'm not sure if the QEMU FSETID patches make sense. QEMU shouldn't be
running with FSETID because QEMU is untrusted. FSETGID would allow QEMU
to create setgid files, thereby potentially allowing an attacker to gain
any GID.

I think it's better not to implement QEMU FSETID functionality at all
and to handle it another way. In the worst case I/O requests should just
fail, it seems like a rare case anyway: I/O to a setuid/setgid file with
a memory buffer that is not mapped in virtiofsd.

Stefan

--PfGM/wauBig6Rvke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUDSAACgkQnKSrs4Gr
c8gGrwgAkGekQKPO5m+cQG8Paqgzwv+Afen12zwjhvXkwGGUgAIwGdQ2hZJCpmZv
TFKZchZoQ/Ilx2tlFxdOFzOjMGpmZeX+nX5uisyXtn9SO09LGL80aFxnYYSpaFBB
LoOy273AdpC8dTFfqij1FNdg04Kc1I4rKUnbHo/5y0G9tZe3wY/uFHUIqMUUV0y+
r+CqCQzcpOzexzmFO5Qfz71p6mAL4QYzmUE6lMO/JnDD9+mGCTwIz3gFyxvGNiAI
QWU6ui4EC0wVWZYUfVfhVtqJ9rqg04r0wM2l3ytR4JhVZZzsH5dwwNFOBt3H9OHS
pz8CYwdblENhAxpXWm/ryUgFXdS1Lw==
=kOui
-----END PGP SIGNATURE-----

--PfGM/wauBig6Rvke--


