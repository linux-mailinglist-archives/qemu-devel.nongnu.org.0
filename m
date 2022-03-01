Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2E4C8CD5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 14:42:25 +0100 (CET)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP2lh-0007Rp-Hz
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 08:42:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nP2jI-0006Rp-0Y
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 08:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nP2jE-0005TV-5M
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 08:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646141987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yeNLUExwSgXAW9c2xYD5d+W9MmZnnFg6vd1h+XE53dY=;
 b=i8xwKaO9DJGVQdqnkH2tm5btVelrrmvUrmNLbPPQcgXzQe2E536Y/q8BvAdAwAfvrg0rYC
 T/odKvWQ+uYF0I/6KTMSdJuHykjstVBC3qWbnnM+OPs8s405Vx+V+RmxymutFL7PJTORDQ
 frcjSZmuSVph38Yg7qMoE04KB3XsK0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-p0jbyUzEMt2pHbYlqWzNvA-1; Tue, 01 Mar 2022 08:39:44 -0500
X-MC-Unique: p0jbyUzEMt2pHbYlqWzNvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 460971854E27;
 Tue,  1 Mar 2022 13:39:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCDC91057F7A;
 Tue,  1 Mar 2022 13:39:42 +0000 (UTC)
Date: Tue, 1 Mar 2022 13:39:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
Message-ID: <Yh4iHeb6FsnxLUNn@stefanha-x1.localdomain>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <8735k1q452.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QoBJddibHp2EAAkZ"
Content-Disposition: inline
In-Reply-To: <8735k1q452.fsf@oldenburg.str.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QoBJddibHp2EAAkZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 12:54:49PM +0100, Florian Weimer wrote:
> > I took a quick look at C++20 coroutines since they are available in
> > compilers but the primitives look hard to use even from C++, let alone
> > from C.
>=20
> Could you go into details what makes them hard to use?  Is it because
> coroutines are infectious across the call stack?

Here is the simplest tutorial on C++20 coroutines I found:
https://itnext.io/c-20-coroutines-complete-guide-7c3fc08db89d

The amount of boilerplate for trivial coroutine functions is ridiculous.

Stefan

--QoBJddibHp2EAAkZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIeIh0ACgkQnKSrs4Gr
c8jZOwf8CDLmz0TbOM3dqkbViwSq2Tjnal2u+hnYdh7sAaihcTXoQzk9kZ/XnxLV
nTHkeFpC+XPYQW0zqMLenqzHTn7t0AjfhlCAq8dVvKEYb+vikpKST0omLEk2bsyy
3UO5pYD88eo16Qt2Gr0tr2sdtwi0VNnt4GsilKY0zrp4j879XRRssbuPO9nbTkl1
FBV2iYBBOvD03zDk0AJ65JL3FVfgDM/ZnogIOvE9cXzRQCOa8LAFa+R1/YMDNdjn
iEdNwQVkM0QdxhYS4gpHpw0LZ7umNGhQoJbgDils/O/Z+5Hc0Kq4s4uV3gm+siii
Ow4rM0haarvNqrdt+jsjNP7m+QLXEQ==
=0jPy
-----END PGP SIGNATURE-----

--QoBJddibHp2EAAkZ--


