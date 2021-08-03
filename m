Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACF3DE6D8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 08:43:18 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAo8y-0001oK-US
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 02:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mAo7n-0000WA-N2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 02:42:03 -0400
Received: from mout.web.de ([212.227.15.3]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mAo7l-0000J6-Ph
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 02:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1627972916;
 bh=dvvor0EANe/1OD+1yQFO7fbK1ciJAEplbV7/forFYk4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EBdCCjS59uR00R3PBKbBdPTdHoyHuOxIY0hrvIwqkQmDQnAgCb4JWtpQOcgyjXYo2
 QsrQlCYn5exQ6Om6ziOMwrYVy9BN5pVbQNOdMnsoy2Ft2kfrobMnaY6qSehulIwR77
 kDKkPRz7mzlzysZuFR9GqMUsWSQ0b0S5/gTFPuYI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.244]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M9dCJ-1mJIpo3UaN-00D1cq; Tue, 03
 Aug 2021 08:41:55 +0200
Date: Tue, 3 Aug 2021 06:41:27 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH 1/1] migration: Terminate multifd threads on yank
Message-ID: <20210803061721.0fdc1614@gecko.fritz.box>
In-Reply-To: <20210730074043.54260-1-leobras@redhat.com>
References: <20210730074043.54260-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QjL1NU+IX2J1ODi3jinUQ_k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:p5tWbXzBtmINMuZXaJyU46gY/jUr7pxns1oFOs7JqDjXnSAXtIz
 SQVV+Fa0PLa1SEDv/IxwDvDfYdUfN/i7uXhT7GGPP+LF3JBzdn1coUGJeu5IvXHAVgcirE2
 qPt8gEoedDfl112or9tcPFlswOS0P/C2a5/Ga3T5YpKwgNBckROwfkvkohBBtmbrEYPRLDG
 7sSXV3PW+zIiZF9DphTgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CJUmdV5hmFA=:2Pr3soi9YUwnLMOyQN4bXW
 SF2Qf0AJias+sWdR6MlEzZHdVpSFJ8FxbctRjO/SaLPQy80NW+EGfJPWyd2SHuLIvK/gnOS8k
 +mG2U/PEGfocNWLgfp4mUUEbA4aTQSFsdOa7UfaCPYb266+3ippGYogqFb9PZkJPa1ENyb/eD
 vbhSr4ZSg31Wz52uzxtrKTmd64Tkro9nirpkOfE7dmti/+4pc6MBYamn5nk+ohaOI8IGACiMC
 leJWnjS+QGS7vTtym+6lJKMNlCDm0JoOR0R7f/uC4NV9pkvC6FbgNoNOz+t879jExq3gHqTDj
 5ycFOusgLD6Sq7n46y0s8VZxJ80LKMfQxeQcjCex1hUPcVumRSDhTMUIMvJJ+ZkX7dc5hzqEt
 F4YrW5bXiVSsgzDReh217lfsKD//324+9dSsc/VRp+KCi7iLl+dH9J5+WQg2WXuFpEfYWQvws
 bkz75JtpAmjwCreh6Usz7xG4fKa0Pobvd0Ig0fcUtKTTxOLXTChrEz3wULCO1nVZJo0L81Kk3
 UOf2qIXA808ERtOtQDSZtJgIo0smtJVSYt6Ipoljmhe5rLbhJIHmYflxtEM2MDh2/u0HmHSNT
 3SEWZag4Q+7jngNpnK+uJ4CNKMMHmxP3BEU2DmzSbmtlqbY9pBcc9XHw5NsrEExWlOyKPKF9D
 Y04DoGh4ICtmw3bEg2F0PfFmmBDYe7cYmvsM3zSqYvFmVd/tcp9x6oLVWN8Z6M1Wk+ZavVOv2
 v8CAaPJJmlR5MQz4FvRt8NsY74o5SARjWmAOU++X/II5J6hxGDQEjGlE9ddZDfAn1KqLyQ8Xl
 x6u/yH41hyQUGIJXy3SmCqordqHIUlz0jD6RMLdRHQBfLRDTQr/QduT8yuwAlydxDAUWCAMIH
 61AE/WwJo5GY7ez3oJC/wsq+NQkhI8JRU33vdvxij3k2+NqDr3qB16YdApDAcGgNjImg68ZNy
 4vrz+YOVol8lDPRx73XbLAud/bPgVHDs/5nXdiQN+w2fvBi9RGu203qLWjkagfsL83VvOtR02
 4nG1MegeoUAWxxELXh51GceDClVWECxphEhfsd2FcZQz6daLQ5+mL2EY9iKUBfa3mrqhAK8Dd
 TG8Myl6L6Hofu3dv0BktQDU5VZv34Ux2z0f
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/QjL1NU+IX2J1ODi3jinUQ_k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Jul 2021 04:40:45 -0300
Leonardo Bras <leobras@redhat.com> wrote:

> From source host viewpoint, losing a connection during migration will
> cause the sockets to get stuck in sendmsg() syscall, waiting for
> the receiving side to reply.
>=20
> In migration, yank works by shutting-down the migration QIOChannel fd.
> This causes a failure in the next sendmsg() for that fd, and the whole
> migration gets cancelled.
>=20
> In multifd, due to having multiple sockets in multiple threads,
> on a connection loss there will be extra sockets stuck in sendmsg(),
> and because they will be holding their own mutex, there is good chance
> the main migration thread can get stuck in multifd_send_pages()
> waiting for one of those mutexes.
>=20
> While it's waiting, the main migration thread can't run sendmsg() on
> it's fd, and therefore can't cause the migration to be cancelled, thus
> causing yank not to work.
>=20
> Fixes this by shutting down all migration fds (including multifd ones),
> so no thread get's stuck in sendmsg() while holding a lock, and thus
> allowing the main migration thread to properly cancel migration when
> yank is used.
>=20
> There is no need to do the same procedure to yank to work in the
> receiving host since ops->recv_pages() is kept outside the mutex protected
> code in multifd_recv_thread().
>=20
> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=3D1970337
> Reported-by: Li Xiaohui <xiaohli@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---

Hi,
There is an easier explanation: I forgot the send side of multifd
altogether (I thought it was covered by migration_channel_connect()).
So yank won't actually shutdown() the multifd sockets on the send side.

In the bugreport you wrote
> (As a test, I called qio_channel_shutdown() in every multifd iochannel an=
d yank worked just fine, but I could not retry migration, because it was st=
ill 'ongoing')
That sounds like a bug in the error handling for multifd. But quickly
looking at the code, it should properly fail the migration.

BTW: You can shutdown outgoing sockets from outside of qemu with the
'ss' utility, like this: 'sudo ss -K dst <destination ip> dport =3D <destin=
ation port>'

Regards,
Lukas Straub

--Sig_/QjL1NU+IX2J1ODi3jinUQ_k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEI5RcACgkQNasLKJxd
slgwsA//f7Jq6jf7vhf6KwlAvgKoa1xM1IlFbJdpcSPNjNRnNfNvJa2Ra0i340DL
fYm9q3P5EjAS6tWuYp/rQeEXCKXpwXvZHtpICEZl7xPBNRSoBFDLkgRfrYb2ninU
2/+BuCovB+bC8LfJAY46cU9cCmlD3r0+9Rxa+yXo0AcZO5Pm40Ih0jqKJ/yI9WYk
1Z2PMUxKLDUNxCfDSRyN/tgxpol1bx1r2RrpbwH/Km48rTQEY1oSiFs7r6FF3Cpx
f/znhl/Mf4YIDtg4kFBGsBK0xqF1q+/1l7zrnwQpw84TfwbPGXvmblMrbNU4OlHE
4OUEP1687nYtsuzDd99uYcFvMpIIqKJCb01neZDDV6Zrof8A11u+x6+ONf+gSMhQ
6YOw3fKp3IonlZIwssIVj+0DWvaXA+QZZbFgj8k1Gs+aXvv+iKC1yBLe0r0CZlqo
krFCY4uDzlIOXdXQ+nD0X93aa47qOnSaUfwnMLkWVGVWQGdaDOyypdRVrtkmYvtq
K2nSxKtic+xFQuWbVDVLHRjFGym2LawREmrHoel/EfXyBwe4+NR5bv++Do6419Ow
tT58EcqLDt2gBydZSb5owy37RGVM1NgUx9kGsPJTcITkDXXxOBN/bBKiJ2e6SrfY
DH4Fsl9N8zWJAl9UxzPSJghsK/pYJeKcfr4UXT5wJGrgRneo2AQ=
=y79m
-----END PGP SIGNATURE-----

--Sig_/QjL1NU+IX2J1ODi3jinUQ_k--

