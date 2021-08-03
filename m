Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953463DE869
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:27:12 +0200 (CEST)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAplX-0002tq-Ls
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mApkP-00028w-Vt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:26:02 -0400
Received: from mout.web.de ([212.227.17.11]:32855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mApkO-00049V-6O
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1627979155;
 bh=ZSYXrbSEQfhPgV32NqPo0ZZTqi8HoC5qbY5V2CYM5do=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=WF1RS1tNlv75MOcf458v7qXQpH7gEy4BZ8bvhttpUmP8y70vP7Lx/6FVI/dC09t0N
 4xzPVImih7wAuYqYT9xLrnS/lI3s0e4reFzi/rqWMSIvS/WvzcOxlUTaDGMPmAH4eQ
 rjKPL5ACAeGCqNzdKIWWmmnYP3wlHO0OvQ0uMW0c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.244]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M608n-1mDpkW07Kd-007Vw8; Tue, 03
 Aug 2021 10:25:55 +0200
Date: Tue, 3 Aug 2021 08:25:46 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH 1/1] migration: Terminate multifd threads on yank
Message-ID: <20210803082546.01f2fde8@gecko.fritz.box>
In-Reply-To: <CAJ6HWG5f8NOmvD_VsQNuw-viw_XERCnxX_bL50_1+SWY0zy5pg@mail.gmail.com>
References: <20210730074043.54260-1-leobras@redhat.com>
 <20210803061721.0fdc1614@gecko.fritz.box>
 <CAJ6HWG5f8NOmvD_VsQNuw-viw_XERCnxX_bL50_1+SWY0zy5pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=gbpt6mh8IOzTbC3Hb=vG7j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:kiJWm+8lyBmN6pUK3tFRqpNdQGF1eCHhayGVj7Bw2JZm9jwduu/
 V4RLxRxJGdpFxTM3esh6rXKwOZZeHQ6VhivZ6/5EQ4iiR8MX+8E3D4AaHy7893i7EpUFvSp
 hDHYd9R+POcsAbuZP7xiCoWZpOhBI/65l1Fjcmyyvoblvpo9GWXaPmUABxFK2pgKEjTptVX
 yHGhpfjCfL5dqnwXcXRzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6w95sPZaTbg=:aSvGA1o3rkzWUa+iQdbzPO
 QZVnuWo4QUs2KUnDIshOgvs1bC3dTm+O1JtDZ3v7YMsSIebX1qLjPu/y+zpitnrhUfCa+vPSk
 fGQc+PLSAKwKrVgNogvTZ83VWPKaTCGFp2GgduioZ1yTzZWkmdKZaTUBrHKHUOEKB/jKYFari
 XRwsgoa+8NuQQaeFYBW3S9uqJmp/wxTY0+X1GEMoj3Nb6pBItOYOqbgvnbKq17Ua0jL7YETp7
 C/DqyDBblD9vE65smu8DaRi/jMWGvQ7sOm1TOz6hbzXEAAst8+K7zyJgGVL63EUlwLA3GQ0ef
 LviaVTi0YIyQWIO9spfzrR5euXK3uQg+ljHoh3hrq82tjzf8vuyg16mWMMfcgppPp7mdIGmA9
 T58zuN3AhA7Htf6N0WmAWnvZSvxfVJcmVQh0WCv5WUFRGivZfREbL2RIN2iq9owdME0FRvt4u
 6e8nr36B9xD9qIqPEPVxKL7lB7xB0vofYgigBZFpR3RYYjteDT4wgZidv/kGeELT4RkVzyPyp
 bnhtFHDOuHDH2jr2wRUsaXN6/FH8gTm4/GrZY1S+fadjYOaJPefrHhcMk6BO88hYKoKKlxzBL
 7THFKrwFZv9LjCAGNKvs9+oP3aNd8WdT+6gFhkhcRmgQoOosTjIkSGnV/fljREihBAl6RpEVc
 G2B0tG75uW6LPjr9Nj2dgjfj9SP72pKIuPOQA5oN0/lOtzAn3WClbVBM8GDj8EEZ7htNci6aR
 5J+1lkUfUMvOmqaKixbTd9tC+1gH8yKi8GlVXpv/kgdMESR3J72I5Q2gP+arQsaCZszoH4Lir
 FPiAloddQSlTmjzxVUjb1pVvH7eBpXGWb4bSb1BHYyE77tAP6nydd8gILYaOrGsuw6Rlgglo3
 Dp7jDBwFHXU6NqXtUqapBsuexRBz4Rjvq/twC2HQAcedLzyf6FOW5HJ9gJUv8TKY9n8gLXOym
 gA6pXgxTDTpBwh4ZcUGjknBEl3ENiTtqKk1G5qbc0J8ogO/vXy1LzglMtpbderukYPVCQ82Ey
 AaJO4BXHwgc5IB4LHkREgbFozBzB/oUi1y1Na9Y6y3Bvim8jRfaEU3wDTOlaOz+LgBnUzNNSI
 NZJIRalpn+rG4a2FKLJl2tjS/o9IiqFTl0o
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/=gbpt6mh8IOzTbC3Hb=vG7j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Aug 2021 04:18:42 -0300
Leonardo Bras Soares Passos <leobras@redhat.com> wrote:

> Hello Lukas,
>=20
> On Tue, Aug 3, 2021 at 3:42 AM Lukas Straub <lukasstraub2@web.de> wrote:
> > Hi,
> > There is an easier explanation: I forgot the send side of multifd
> > altogether (I thought it was covered by migration_channel_connect()).
> > So yank won't actually shutdown() the multifd sockets on the send side.=
 =20
>=20
> If I could get that correctly, it seems to abort migration (and
> therefore close all fds) if the ft that ends up qio_channel_shutdown()
> get to sendmsg(), which can take a while.

How long is "can take a while"? Until some TCP connection times out?
That would mean that it is hanging somewhere else.

I mean in precopy migration the multifd send threads should be fully
utilized and always sending something until the migration finishes. In
that case it is likely that all the treads become stuck in
qio_channel_write_all() if the connection breaks silently (i.e.
discards packets or the destination is powered off, No connection
reset) since there are no TCP ACK's ariving from the destination side
-> kernel tcp buffer becomes full -> qio_channel_write_all() blocks.
Thus, shutdown() on the sockets should be enough to get the treads
unstuck and notice that the connection broke.

If something else hangs, the question is where...

> But it really does not close thew fds before that.

Note: shutdown() is not close().

> >
> > In the bugreport you wrote =20
> > > (As a test, I called qio_channel_shutdown() in every multifd iochanne=
l and yank worked just fine, but I could not retry migration, because it wa=
s still 'ongoing') =20
> > That sounds like a bug in the error handling for multifd. But quickly
> > looking at the code, it should properly fail the migration. =20
>=20
> In the end, just asking each thread to just exit ended up getting me a
> smoother migration abort.
> >
> > BTW: You can shutdown outgoing sockets from outside of qemu with the
> > 'ss' utility, like this: 'sudo ss -K dst <destination ip> dport =3D <de=
stination port>' =20
>=20
> Very nice tool, thanks for sharing!
>=20
> >
> > Regards,
> > Lukas Straub =20
>=20
> Best regards,
> Leonardo Bras
>=20



--=20


--Sig_/=gbpt6mh8IOzTbC3Hb=vG7j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEI/YoACgkQNasLKJxd
sljXrg/9F0BwYmEFagjJcpC8JzQDeyIQe4GPa7+iVmRQZUjhNmR0RFqcbcxYY/kr
cF2DICJM92jJlIxtqiE2qE8vJ5QrHgBZ+l06mQZVi2WClQlVkmttC46cYlZ/zIi9
PyZdzziClyF7S25ELZEh0sXvsV2utXcfjaKz1c+VuGoOdM/ozWJd8KrsfY/dUxnF
dH/n5s9gaGQnMt20/QTIsXX2gFOofWgD9ob4c89UQOjEG5fd0eEvZWo5+S8bdrJQ
XzeP3T6NOxAaLtJWPmY4W1k1YmSGqhWx/J5G0WeQQP29yNrEgE5J+UTr+RhLjaoi
aptUw/928FcFzX30IV8ybZqyGgrBsJmhyco3M8fAJhPQMMycmCfinrIEagfYD3LS
eZiZkQcdCYnEUuUR1KpYdU/pMFo7GivaXJVsqMARkpEZPEM5UH7Al8Re4YzGcyqM
icufegp33yZ6RkzcWKp1+2q1Yy2miy7KQlIxmQqZg05vMn7oU8uK9oz54slzAmlC
TAvXjidvXnMJuPdRHI1/LHsX1NwLix0X+O8TE6eTR7QKqk/t0sVcx8YyZrOpatZj
Exa/TnE9E/CMffalvG1dqYVMcQh/y4Fubn9l2c5LrTPEOZLoqXTea81sKbykOznd
2X2D1H8JkX0S43v6sJRBtSd/MhdO/4gcfg+p3s5XubY8ZHle7Wo=
=uw6T
-----END PGP SIGNATURE-----

--Sig_/=gbpt6mh8IOzTbC3Hb=vG7j--

