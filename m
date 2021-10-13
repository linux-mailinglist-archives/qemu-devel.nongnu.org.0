Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720D42BBCE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:39:58 +0200 (CEST)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maajt-000809-I2
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maaRD-0004xY-QG
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maaRA-0004iI-CV
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634116835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pU/+DDGBd7swkJMoH4cPkxsByvi2KGcA33Yb0/XtegU=;
 b=RytH/1u3CQKSqZp840cNoyF2+ux3BpyOP/L1RQotoXR/IxvRs0z7IWQMk8jTwKJMHjYarX
 p+u0iYjRjvNQisYbcsDSQZXkEzRIc2LC9NXkvw++zcfbAWBCIrhYKAHtHTLwf9MaehVAyC
 tIscED5PNS6KB+riH36b0KY2S10p1QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-JZlQss8JOAm57-mWkerJ2A-1; Wed, 13 Oct 2021 05:20:31 -0400
X-MC-Unique: JZlQss8JOAm57-mWkerJ2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4B3480198A;
 Wed, 13 Oct 2021 09:20:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A866F60CA1;
 Wed, 13 Oct 2021 09:20:12 +0000 (UTC)
Date: Wed, 13 Oct 2021 10:20:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Message-ID: <YWaky/KVbS/KZjlV@stefanha-x1.localdomain>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
 <20210930052900.GA15735@raphael-debian-dev>
 <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
 <20211005102944-mutt-send-email-mst@kernel.org>
 <20211013062526.GA30621@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20211013062526.GA30621@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kUxU+W6Dgdl56ilv"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kUxU+W6Dgdl56ilv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 06:25:33AM +0000, Raphael Norwitz wrote:
> On Tue, Oct 05, 2021 at 10:31:06AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Sep 30, 2021 at 10:48:09AM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Sep 30, 2021 at 05:29:06AM +0000, Raphael Norwitz wrote:
> > > > On Tue, Sep 28, 2021 at 10:55:00AM +0200, Stefan Hajnoczi wrote:
> > > > > On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> > > > > > In the vhost-user-blk-test, as of now there is nothing stoping
> > > > > > vhost-user-blk in QEMU writing to the socket right after forkin=
g off the
> > > > > > storage daemon before it has a chance to come up properly, leav=
ing the
> > > > > > test hanging forever. This intermittently hanging test has caus=
ed QEMU
> > > > > > automation failures reported multiple times on the mailing list=
 [1].
> > > > > >=20
> > > > > > This change makes the storage-daemon notify the vhost-user-blk-=
test
> > > > > > that it is fully initialized and ready to handle client connect=
ions by
> > > > > > creating a pidfile on initialiation. This ensures that the stor=
age-daemon
> > > > > > backend won't miss vhost-user messages and thereby resolves the=
 hang.
> > > > > >=20
> > > > > > [1] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore=
.kernel.org_qemu-2Ddevel_CAFEAcA8kYpz9LiPNxnWJAPSjc-3Dnv532bEdyfynaBeMeohqB=
p3A-40mail.gmail.com_&d=3DDwIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3DIn4gmR1pGzK=
B8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=3DfB3Xs9HB_Joc1WbeoKGaipFGQA7TPiMQPKa9OS=
04FM8&s=3DbuSM5F3BMoUQEmVsEOXaCdERM0onDwoqit7nbLblkVs&e=3D=20
> > > > >=20
> > > >=20
> > > > Hey Stefan,
> > > >=20
> > > > > Hi Raphael,
> > > > > I would like to understand the issue that is being worked around =
in the
> > > > > patch.
> > > > >=20
> > > > > QEMU should be okay with listen fd passing. The qemu-storage-daem=
on
> > > > > documentation even contains example code for this
> > > > > (docs/tools/qemu-storage-daemon.rst) and that may need to be upda=
ted if
> > > > > listen fd passing is fundamentally broken.
> > > > >=20
> > > >=20
> > > > The issue is that the "client" (in this case vhost-user-blk in QEMU=
) can
> > > > proceed to use the socket before the storage-daemon has a chance to
> > > > properly start up and monitor it. This is nothing unique to the
> > > > storage-daemon - I've seen races like this happen happend with diff=
erent
> > > > vhost-user backends before.
> > > >=20
> > > > Yes - I do think the docs can be improved to explicitly state that =
the
> > > > storage-daemon must be allowed to properly initialize before any da=
ta is
> > > > sent over the socket. Maybe we should even perscribe the use of the=
 pidfile
> > > > option?
> > > >=20
> > > > > Can you share more details about the problem?
> > > > >=20
> > > >=20
> > > > Did you see my analysis [1]?
> > > >=20
> > > > [1] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.ker=
nel.org_qemu-2Ddevel_20210827165253.GA14291-40raphael-2Ddebian-2Ddev_&d=3DD=
wIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3DIn4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_F=
ZNJZk&m=3DfB3Xs9HB_Joc1WbeoKGaipFGQA7TPiMQPKa9OS04FM8&s=3Do_S2kKO4RQnWw2Qnz=
Vi7dgOwgiPbusI9Zche7mWV22I&e=3D=20
> > > >=20
> > > > Basically QEMU sends VHOST_USER_GET_PROTOCOL_FEATURES across the vh=
ost
> > > > socket and the storage daemon never receives it. Looking at the
> > > > QEMU state we see it is stuck waiting for a vhost-user response. Me=
anwhile
> > > > the storage-daemon never receives any message to begin with. AFAICT
> > > > there is nothing stopping QEMU from running first and sending a mes=
sage
> > > > before vhost-user-blk comes up, and from testing we can see that wa=
iting
> > > > for the storage-daemon to come up resolves the problem completely.
> > >=20
> > > The root cause has not been determined yet. QEMU should accept the
> > > incoming connection and then read the previously-sent
> > > VHOST_USER_GET_PROTOCOL_FEATURES message. There is no reason at the
> > > Sockets API level why the message should get lost, so there is probab=
ly
> > > a QEMU bug here.
> >=20
> > Right. However the test does randomly hang for people and it's
> > not really of interest to anyone. I think we should apply the
> > work-around but yes we should keep working on the root cause, too.
> >
>=20
> From my end I have spent some more time looking at it but have not made
> much progress. I was hopeful that David HiIdenbrand=E2=80=99s libvhost-us=
er bug
> fixes may have resolved it, but I tested and even with his patches I
> still see the hang.
>=20
> I am determined to get to the bottom of it, but I=E2=80=99m not sure how =
long it
> will take. If this is impacting people than I agree with merging the
> patch as a workaround.
>=20
> From my end, I will send a v6 updating the commit message and add
> comments to make it clear that the patch is a workaround and the root
> cause has not been determined yet. Sound good?

Michael is eager to merge a fix so the tests stop hanging, so that
sounds good.

If I have time I'll take a look too and share anything I find.

Stefan

--kUxU+W6Dgdl56ilv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFmpMsACgkQnKSrs4Gr
c8iBsQf/dG/G2dwfEVTi3NQPT3dlL1A7JA1Gf6MMNpz0RQGhUQeo660K03wFvyde
yoAqt8gEWrNBLJdyE56/p1uI8vyZFutSm37gWfu4icsEyDrMUCNFfT3FurNJ09iE
p12Rbt+vp8Y1RFk5Evyv0HZzrRo4b4ZxBIarwDemTa1HXyIbWxHQZ9Z5UNZSqxZz
F5xeYKGcQkZXqnHCegfmB21D4pdFlfiN2utJAm3vTXOl7ZAGmHzkmVyZu6zYfX1C
kqkNZUVaFA9L3mzgzhxrvVliXT1F+gtJ9mEaKUb3WPaz4PBxSzs/6E+uhrNmCZO9
+a7KoWi7dM/nSJGbcN53A8evZXhaZg==
=i1uf
-----END PGP SIGNATURE-----

--kUxU+W6Dgdl56ilv--


