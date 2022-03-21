Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35F4E2B29
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:46:48 +0100 (CET)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJJ1-0001SX-Br
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:46:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWJGv-0000QH-Qu
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWJGs-00014X-Hp
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647873873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mvQqKmMVRF7qm2sznMSIvBKXMEZH0xF7i0oscnpyWQc=;
 b=el4hPr7TK9fJkOn2HgLL3oPxkya0Xts3PNPxx9j9vV3MgsP0HhqvIa6GHLHcHhbNJLjFSR
 sZYjDHyPrJl4W9iLyYH4rCF2gVudgOZAjr0k6DXg6iRkpcKZ0m10JQbc5S7h7NwBTP/izG
 UmjyReZ7KFKODI+e+guVF/Y/iSKfKK8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-mTo5LaFNObm2etWfPoSgKQ-1; Mon, 21 Mar 2022 10:44:29 -0400
X-MC-Unique: mTo5LaFNObm2etWfPoSgKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D0D4803D46;
 Mon, 21 Mar 2022 14:44:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23903140EBD5;
 Mon, 21 Mar 2022 14:44:29 +0000 (UTC)
Date: Mon, 21 Mar 2022 14:44:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL for-7.0 0/2] Block patches
Message-ID: <YjiPTBfFH6/K4TEy@stefanha-x1.localdomain>
References: <20220317165743.238662-1-stefanha@redhat.com>
 <CAFEAcA97E1F0MgYPgZgUUegzDMpL9wNa9fzkGKE8_A-fUmbzyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ss82Gc7AfX62eCNc"
Content-Disposition: inline
In-Reply-To: <CAFEAcA97E1F0MgYPgZgUUegzDMpL9wNa9fzkGKE8_A-fUmbzyA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ss82Gc7AfX62eCNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 06:36:36PM +0000, Peter Maydell wrote:
> On Thu, 17 Mar 2022 at 16:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c579=
25d3:
> >
> >   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qem=
u into staging (2022-03-16 10:43:58 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to fc8796465c6cd4091efe6a2f8b353f07324f49c7:
> >
> >   aio-posix: fix spurious ->poll_ready() callbacks in main loop (2022-0=
3-17 11:23:18 +0000)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > Bug fixes for 7.0.
>=20
> msys2-32bit CI job fails on test-aio:
>=20
> | 14/85 ERROR:../tests/unit/test-aio.c:501:test_timer_schedule:
> assertion failed: (aio_poll(ctx, true)) ERROR
> 14/85 qemu:unit / test-aio ERROR 2.40s (exit status 2147483651 or
> signal 2147483523 SIGinvalid)
>=20
> https://gitlab.com/qemu-project/qemu/-/jobs/2217696361

Looks like a random failure. The commits touch Linux/POSIX code so I
don't know how this pull request could affect Windows.

I reran and the test passed:
https://gitlab.com/qemu-project/qemu/-/jobs/2229158826

Stefan

--ss82Gc7AfX62eCNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI4j0wACgkQnKSrs4Gr
c8h06gf/UqOttf5pdnXawZloDCVPNzRhnKg8/vy7dG1cj2s0Gk1g5S5S5fa59mi5
rE1iRtcnBP+6lgb3JdVSW2zJwlxoW+1iUwtj5txLTHofCDuL/HHmRUwZdBK9mAh7
u3s9kBDy/zMD6w0OY4qzyhK6jSS3pRAqm2mcWTfePCgs3/Ib+OD7PGhDkjY/Vi0R
OjwUDOn87TN4AaEAMuFE+jvVLahOaBw0XQKEwDdV/uRlI+b2JbI6ZF8MSKwCFh6q
dW3izxgAb3a0VWyWSepaKEDR0u8IzBtS637Hopwry8+DW7aVje7jI6O9bMnYgMlM
KEn812VbLDxnTwxbLiwwjtI1le4T2Q==
=2q2i
-----END PGP SIGNATURE-----

--ss82Gc7AfX62eCNc--


