Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61A56808E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:55:59 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zt7-0000kS-QI
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8zpA-0007HC-By
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8zp6-0000Q2-Uq
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657093907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=94stvIwO+MYjvQTo4x9lvsmOFPV+/t99NLrADFi/T5M=;
 b=fM//aA608R8XMAm+6F+I1t5NnlEQdPfu4Hxca3E8+VzqfjpHLQ/ssijo64sL6xZ9pIQfr9
 7/Nvx8p4NSPuG2jSnYc/HvnagRFHSXq9zp/F2CI31t2ZUyQYgTCLyoyv7z3xEswVQqKejX
 2Qu3+cEAGFcjZqZ9NRKFjQsYwyamqX4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-L0i-dOytNyayPpTMVy5gng-1; Wed, 06 Jul 2022 03:51:38 -0400
X-MC-Unique: L0i-dOytNyayPpTMVy5gng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C1F8339C2;
 Wed,  6 Jul 2022 07:51:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80A2F4010D2A;
 Wed,  6 Jul 2022 07:51:37 +0000 (UTC)
Date: Wed, 6 Jul 2022 08:51:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Filipe Manana <fdmanana@kernel.org>, io-uring@vger.kernel.org
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <YsU/CGkl9ZXUI+Tj@stefanha-x1.localdomain>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
 <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
 <YsTAxtvpvIIi8q7M@atmark-techno.com>
 <CAJSP0QUg5g6SDCy52carWRbVUFBhrAoiezinPdfhEOAKNwrN3g@mail.gmail.com>
 <YsU5Q6p17yGsxxk+@atmark-techno.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lVNuZ7hVSoe7+tTM"
Content-Disposition: inline
In-Reply-To: <YsU5Q6p17yGsxxk+@atmark-techno.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lVNuZ7hVSoe7+tTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 04:26:59PM +0900, Dominique Martinet wrote:
> Stefan Hajnoczi wrote on Wed, Jul 06, 2022 at 08:17:42AM +0100:
> > Great! I've already queued your fix.
>=20
> Thanks!
>=20
> > Do you want to send a follow-up that updates the comment?
>=20
> I don't think I'd add much value at this point, leaving it to you unless
> you really would prefer me to send it.

That's fine. I'll send a patch. Thanks!

Stefan

--lVNuZ7hVSoe7+tTM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLFPwgACgkQnKSrs4Gr
c8ikiAgAk9fBuxL7+mmmWCbMmxxG81taEowzxPn7NMVhigpgpnuuJzw9TF0bpcAy
pdOviF+4pVYlkpM3hQPhBJvzMs89mKekWx+81rE1cnZOR2hf4QO4Lx1ADO7MCv8S
oSxPDHWEKXCI8lLxE8tPZKHCaveWshvSvDbrIDzDvyuyj/ThXEnHuBbO6JaRwXfg
hZMgpjmqNFBRVUjHvH65E4wegvWEhWqCjDND/LBsfkHjfwpX8DT4elM2CWEBJ5aq
fa/IDQf6PTJABLgqSXZPd5sJz2rpNWjrHe++YzHbmRuZtGziM1BleETCmdTtQr56
QO1rgZZE+5hC9hdJteIo36pr2xXaKA==
=FbMk
-----END PGP SIGNATURE-----

--lVNuZ7hVSoe7+tTM--


