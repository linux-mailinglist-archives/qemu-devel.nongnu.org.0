Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB2341D6C9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:50:40 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsi6-0005IP-NF
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mVsgZ-0003um-1o
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mVsgK-0004l6-2O
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632995327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=24bPIdGE2vsPrMwfr/b0sequvnKjNDwAT8UVJ/xFyg4=;
 b=fczzeOk2HDFwX8pKtTuKJ7IGYiGV1HXM99YHoPBAExWYmZeeYAGVf/H/V7czASpUZ1VnUj
 tJ9Ab88gZfySggfE/JJwJ8TrFaj6YK+IIsYZ18tBV+K/1Fa7JceseFe1lLwt/APIZtitB8
 nno1Vn+uNiiEquEYIK3U3vYWJYZbgt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-Id_fvLvKOMiPYlR1LAwX3Q-1; Thu, 30 Sep 2021 05:48:45 -0400
X-MC-Unique: Id_fvLvKOMiPYlR1LAwX3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7275D1023F4E;
 Thu, 30 Sep 2021 09:48:44 +0000 (UTC)
Received: from localhost (unknown [10.39.195.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCAAD60BD8;
 Thu, 30 Sep 2021 09:48:10 +0000 (UTC)
Date: Thu, 30 Sep 2021 10:48:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Message-ID: <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
 <20210930052900.GA15735@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20210930052900.GA15735@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="30MITR5Mjtg+I0ax"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--30MITR5Mjtg+I0ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 05:29:06AM +0000, Raphael Norwitz wrote:
> On Tue, Sep 28, 2021 at 10:55:00AM +0200, Stefan Hajnoczi wrote:
> > On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> > > In the vhost-user-blk-test, as of now there is nothing stoping
> > > vhost-user-blk in QEMU writing to the socket right after forking off =
the
> > > storage daemon before it has a chance to come up properly, leaving th=
e
> > > test hanging forever. This intermittently hanging test has caused QEM=
U
> > > automation failures reported multiple times on the mailing list [1].
> > >=20
> > > This change makes the storage-daemon notify the vhost-user-blk-test
> > > that it is fully initialized and ready to handle client connections b=
y
> > > creating a pidfile on initialiation. This ensures that the storage-da=
emon
> > > backend won't miss vhost-user messages and thereby resolves the hang.
> > >=20
> > > [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dn=
v532bEdyfynaBeMeohqBp3A@mail.gmail.com/
> >=20
>=20
> Hey Stefan,
>=20
> > Hi Raphael,
> > I would like to understand the issue that is being worked around in the
> > patch.
> >=20
> > QEMU should be okay with listen fd passing. The qemu-storage-daemon
> > documentation even contains example code for this
> > (docs/tools/qemu-storage-daemon.rst) and that may need to be updated if
> > listen fd passing is fundamentally broken.
> >=20
>=20
> The issue is that the "client" (in this case vhost-user-blk in QEMU) can
> proceed to use the socket before the storage-daemon has a chance to
> properly start up and monitor it. This is nothing unique to the
> storage-daemon - I've seen races like this happen happend with different
> vhost-user backends before.
>=20
> Yes - I do think the docs can be improved to explicitly state that the
> storage-daemon must be allowed to properly initialize before any data is
> sent over the socket. Maybe we should even perscribe the use of the pidfi=
le
> option?
>=20
> > Can you share more details about the problem?
> >=20
>=20
> Did you see my analysis [1]?
>=20
> [1] https://lore.kernel.org/qemu-devel/20210827165253.GA14291@raphael-deb=
ian-dev/
>=20
> Basically QEMU sends VHOST_USER_GET_PROTOCOL_FEATURES across the vhost
> socket and the storage daemon never receives it. Looking at the
> QEMU state we see it is stuck waiting for a vhost-user response. Meanwhil=
e
> the storage-daemon never receives any message to begin with. AFAICT
> there is nothing stopping QEMU from running first and sending a message
> before vhost-user-blk comes up, and from testing we can see that waiting
> for the storage-daemon to come up resolves the problem completely.

The root cause has not been determined yet. QEMU should accept the
incoming connection and then read the previously-sent
VHOST_USER_GET_PROTOCOL_FEATURES message. There is no reason at the
Sockets API level why the message should get lost, so there is probably
a QEMU bug here.

> > Does "writing to the socket" mean writing vhost-user protocol messages
> > or does it mean connect(2)?
> >=20
>=20
> Yes - it means writing vhost-user messages. We see a message sent from
> QEMU to the backend.
>=20
> Note that in qtest_socket_server() (called from create_listen_socket())
> we have already called listen() on the socket, so I would expect QEMU
> calling connect(2) to succeed and proceed to successfully send messages
> whether or not there is another listener. I even tried commenting out the
> execlp for the storage-daemon and I saw the same behavior from QEMU - it
> sends the message and hangs indefinitely.

QEMU is correct in waiting for a vhost-user reply. The question is why
qemu-storage-daemon's vhost-user-block export isn't processing the
request and replying to it?

> > Could the problem be that vhost-user-blk-test.c creates the listen fds
> > and does not close them? This means the host network stack doesn't
> > consider the socket closed after QEMU terminates and therefore the test
> > process hangs after QEMU is gone? In that case vhost-user-blk-test need=
s
> > to close the fds after spawning qemu-storage-daemon.
> >=20
>=20
> When the test hangs both QEMU and storage-daemon are still up and
> connected to the socket and waiting for messages from each other. I don't
> see how we would close the FD in this state or how it would help.

Yes, I see. In that case the theory about fds doesn't apply.

> We may want to think about implementing some kind of timeoout for initial
> vhost-user messages so that we fail instead of hang in cases like these,
> as I proposed in [1]. What do you think?

Let's hold off on workarounds until the root cause has been found.

Do you have time to debug why vu_accept() and vu_message_read() don't
see the pending VHOST_USER_GET_PROTOCOL_FEATURES message?

Thanks,
Stefan

--30MITR5Mjtg+I0ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFVh9YACgkQnKSrs4Gr
c8i0kAf+KmsZgTLv7sJe/R54KFuIPRgDOTYc/UqXpvnCoCG0MA7RM5VeV8bBBraL
GeUhjO2ppYhSZhE47xU3tF026pq17keKAZOXQlKGFn63/gyYLRFlpequ3PcDMLoI
8i2QHwex/OxhKVw1wm5lGUDpe45H1QJ0IC7AwGorfcvoHen5QVcEAE2hR62DqZOU
2xIoJyfkkmoZO4vttgrYe3q1UHh9XQAnsl21BDu4q0IabIhaPfzTyvOWVjBd4NSE
c4kgXV8l8gcxKIUVCm9E0XpQsX7ldXLd59sKzxTI7T5csLQ+/UKOOXkYe2VBMKEf
yPCRZj/ixiOZeRfG80FfVIoO9aHFFQ==
=5sKB
-----END PGP SIGNATURE-----

--30MITR5Mjtg+I0ax--


