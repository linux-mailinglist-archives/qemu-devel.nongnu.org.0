Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B83931E2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:09:54 +0200 (CEST)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHds-0003vs-7J
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lmHa9-0008HO-1b
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:05:57 -0400
Received: from mout.web.de ([212.227.15.14]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lmHa6-0004ke-4U
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1622127947;
 bh=KInVRULl6N7XDj5cBtSj4jTQ59De9Ak7fXjiw16YRdg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=o1Xp1ZlTXtpWQb6DxZalLHLYtqvLIfEzk4eyEchUg6/mZPCBV9gx6yN4loWtuw/dT
 8OLU0U7a2ed9TBe+gh70DvL1TRdb4At/PROeVAQzcybFztFWQaVgUK9iXgJEY4RkHT
 YPcRNeVLAROTx3eTwXRVUDtLvco07TJRgLG1uojE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.59]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LsNpI-1lJaeh2GiG-011wLD; Thu, 27
 May 2021 17:05:47 +0200
Date: Thu, 27 May 2021 17:05:08 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <20210527170508.4d253e74@gecko.fritz.box>
In-Reply-To: <YK+SloySEG+O5wZV@redhat.com>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <YK6yQ9EVNlVPDMaS@t490s> <20210526232103.39e2a7d0@gecko.fritz.box>
 <YK7EotQbx/F9avls@t490s> <YK9cfiUx+vk/yxtf@redhat.com>
 <YK+PWHzpmnQqgYAw@t490s> <YK+SloySEG+O5wZV@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kkUIzuNfM6IIv7SRwH3J7Yx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:CDdMn1+LSZsVfvyPZFGbOdwaa+sqqxud8yks1VxcHsZFXwadDS/
 Av67JYKMSQ0OfzT8PfTLWO1TB8uzptZCmOri17HGPaH8sIbO8qiHg/FTnznZ9ZNNNCDPb7z
 cRBXVraTVIXnIa4EzuahzHyjSub7Re4RvUnJOuuNumpB5zOQWvPVZh7bIBoCIQDGNJk92Lz
 Xds/Zlg2ru2VWgZy14nrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ob2xcaHR6b8=:yoZsvDm8CMH4Eq5VcNDGBy
 4g4U/8ZyxPXTkhU5mIvzW5IGPnrbvovpbC6KI6X+F0A7IuUykCy/u3Nd1xUTl940PEXYMRJm1
 VKV/h7rPCZ+32n1RPBTHOk5pxStmchs9LeCN/bUp0CQ4c9Y47zIjh6zpz8qaTzij2csmYLsXr
 fe215T+THP3A7Isu3zbtIH5q1TXGyTbDh4r41EFlGgj5QlbamVjwhpzcZ2hHkT2lm2A8brQy1
 Mg0TenfylWss7Eckv0ZTYO7ASYtp1XnWVHWxNW7IHNCDQ12N8NeyqCUwHOd6d8mvo2V3AqgSU
 Atq/SdhLqpZlzEaTJcnDfISjk+KA5Fc/NPsfhQs0xK0ftss4GOvdPUw8Vfci6Njv0Ci14mtap
 pPV52ZoV4NEQr8qcOb3soAYOA3Wyl9DcyaUixcH97DYdI5ytBmZKIi/IIttFoxE/iAN0fHdtG
 ipA1n+tUiO5bZ7EfPQSyW/QEy0FEEzWbnOZCSdHK0TjnQFtb+Zu7Txm0PE0bljbhcGerYPJJK
 gKfHGmc9kQC0tv4ZriQqDrORyMNvTPJvS9s3zQ2r3xPyTH+67CXniS2mq/3IeYBAUHVqF6X9Y
 KP0svGOBsmsk7DEXT1nrbyNL+nr9jQ9zUvdJmo+bEjRo3Kl4yoE1Q3kkuCoWBjsKKM6BZIqEX
 PDijK8IjTlWqBTIy03M+KdRuz+aPrCvlXGGqc6JtQLQKqAGjiuvZZX3yBtQoDLyhIxIrrNwSX
 IIUQQ/O3KWlaoRRpBdhLv/htYFQllc6fWliPWxLrZVT2pOwcEP/p2sPBUj7yQIIGL3pChcPCw
 ZSpyFl8BUOG1U7YwHxVjnT9U1m6K6QFjixNkwWeU/ooZNKvgiKHvtCB2F04QgWMDamEUwZSaF
 S57J9B1XYkxpSYNpHUdTAnjxw04quxkpJvpmkEcymQ9UI3FBMzl7zaZLU2j56ZHon+P8irbNM
 Mn8MZySpVtNcRTrHd2oIEX/Bfl2eLUV4UwtJONvTcD62eBxqK/Wz6x14kmwk4hvX+tDBOPpCL
 n+LR7cbuTw6AFMgqNeJqJ0t7n7rPSoqgq0sCir+xKTsitM3bwUR+h0tBULYP6PzcQMu5jxqXh
 s0n4mEm4EtW1ZO3g4ZSWzgSrWi27n6u8L/P+oZQTEjPUXaCgWqoH3G+DPLbVP4DlwcNDlRDES
 qFRt93BACD4OjMPHxqD5/iSuZTR5txXD6rVX0zez0fac65EIo2pWjOccDiu0Y+JCAbieo=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/kkUIzuNfM6IIv7SRwH3J7Yx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 May 2021 13:37:42 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, May 27, 2021 at 08:23:52AM -0400, Peter Xu wrote:
> > On Thu, May 27, 2021 at 09:46:54AM +0100, Daniel P. Berrang=C3=A9 wrote=
: =20
> > > On Wed, May 26, 2021 at 05:58:58PM -0400, Peter Xu wrote: =20
> > > > On Wed, May 26, 2021 at 11:21:03PM +0200, Lukas Straub wrote: =20
> > > > > On Wed, 26 May 2021 16:40:35 -0400
> > > > > Peter Xu <peterx@redhat.com> wrote:
> > > > >  =20
> > > > > > On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote: =
=20
> > > > > > > After yank feature was introduced, whenever migration is star=
ted using TLS,
> > > > > > > the following error happens in both source and destination ho=
sts:
> > > > > > >=20
> > > > > > > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > > > > > > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> > > > > > >=20
> > > > > > > This happens because of a missing yank_unregister_function() =
when using
> > > > > > > qio-channel-tls.
> > > > > > >=20
> > > > > > > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to=
 perform
> > > > > > > yank_unregister_function() in channel_close() and multifd_loa=
d_cleanup().
> > > > > > >=20
> > > > > > > Fixes: 50186051f ("Introduce yank feature")
> > > > > > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1964326
> > > > > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>   =20
> > > > > >=20
> > > > > > Leo,
> > > > > >=20
> > > > > > Thanks for looking into it!
> > > > > >=20
> > > > > > So before looking int the fix... I do have a doubt on why we on=
ly enable yank
> > > > > > on socket typed, as I think tls should also work with qio_chann=
el_shutdown().
> > > > > >=20
> > > > > > IIUC the confused thing here is we register only for qio-socket=
, however tls
> > > > > > will actually call migration_channel_connect() twice, first wit=
h a qio-socket,
> > > > > > then with the real tls-socket.  For tls I feel like we have reg=
istered with the
> > > > > > wrong channel - instead of the wrapper socket ioc, we should re=
gister to the
> > > > > > final tls ioc?
> > > > > >=20
> > > > > > Lukas, is there a reason?
> > > > > >  =20
> > > > >=20
> > > > > Hi,
> > > > > There is no specific reason. Both ways work equally well in preve=
nting
> > > > > qemu from hanging. shutdown() for tls-channel just makes it abort=
 a
> > > > > little sooner (by not attempting to encrypt and send data anymore=
).
> > > > >=20
> > > > > I don't lean either way. I guess registering it on the tls-channel
> > > > > makes is a bit more explicit and clearer. =20
> > > >=20
> > > > Agreed, because IMHO logically the migration code should not be awa=
re of
> > > > internals of IOChannels, e.g., we shouldn't need to know ioc->maste=
r is the
> > > > socket ioc of tls ioc to unregister. =20
> > >=20
> > > I think it is atually better to ignore the TLS channel and *always* y=
ank
> > > on the undering socket IO channel. The yank functionality is intended=
 to
> > > be used in a scenario where we know the channels are broken.  If yank
> > > calls the high level IO channel it is potentially going to try to do a
> > > cleanup shutdown that we know will fail because of the broken network=
. =20
> >=20
> > Could you elaborate what's the "cleanup shutdown"?
> >=20
> > The yank calls migration_yank_iochannel:
> >=20
> > void migration_yank_iochannel(void *opaque)
> > {
> >     QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> >=20
> >     qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> > }
> >=20
> > Where qio_channel_shutdown for tls is nothing but delivers that to the =
master
> > channel:
> >=20
> > static int qio_channel_tls_shutdown(QIOChannel *ioc,
> >                                     QIOChannelShutdown how,
> >                                     Error **errp)
> > {
> >     QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);
> >=20
> >     qatomic_or(&tioc->shutdown, how);
> >=20
> >     return qio_channel_shutdown(tioc->master, how, errp);
> > }
> >=20
> > So I thought it was a nice wrapper just for things like this, and I did=
n't see
> > anything it does more than the io_shutdown for the socket channel.  Did=
 I miss
> > something? =20
>=20
> Today thats the case, but don't assume it will be the case forever.
> There is a mechanism in TLS for doing clean shutdown which we've
> debated including.

Actually, the requirements of io_shutdown where tightened with the
introduction of the yank feature (commit 8659f317d) and it now reads:

/**
 * qio_channel_shutdown:
 * ...
 * This function is thread-safe, terminates quickly and does not block.
 * ...
 */

And it should probably be further tightened with something like :
"With SHUTDOWN_BOTH all in-flight read()/write() operations on the io
object will be canceled immediately"

Since from a quick look, at least nbd (nbd_teardown_connection()),
migrate (migrate_fd_cancel()) and yank of course expect that.

> In general apps *can* just call the shutdown method on the QIOChannelTLS
> object no matter what.  Yank is just a little bit special because of its
> need to be guaranteed to work even when the network is dead. So yank
> should always directly call the low level QIOChannelSocket, so thre is
> a strong guarantee it can't block on something.
>=20
>=20
> Regards,
> Daniel



--=20


--Sig_/kkUIzuNfM6IIv7SRwH3J7Yx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCvtSQACgkQNasLKJxd
slhN4Q/+OYi7uW1GWvhPTm8M3Vs9K0l1CmKVfpLJOCHYO6E72OsUmGmfPSvj0hs/
+8Vf2iPsVAoZenXzk2axguYpM6GGPZe3T40UYGVI6TZDMaQN9UrtgJtvAeuKrdzD
bm4tk3w4sho4mkIJhT4/XsaZ2XVz8PZ1kP9Uamkhh2RNXzNSLyb1mCs0nl1vlTRJ
jLo9j3cL0xU80IN+Rs40ENkImEEloOr+JLkPmO1uZGTDJrKFEV2cXRHW69PXWJ63
yb/nNPNfkNi36UpHE3Z0nlo+jPw/J2RUBHcfOed3juRDlUARNq/DLzFp2J30MecF
LU2ULCGjRKyTz6fjp1HXaVyLO20trID4ZuecNjfVrXURPrmIctIz9z+qtuyxdZFo
j8Xit3ZSpbynCgtJjGZh3OgdE+6xGc3tQEb2q/Wu9tmmpqRtdKFwybLspVzSfpIx
OMDl/rrnFfSC0VmIWV5TdDkBHVOFWsergxWH3bjYYkuu3GY47DWMVlAJg0Ir8HYT
p9Lhs0fpYeRpzJrRBJ+p+ZSpz9uXyWlfxo2CWcIf0o3kmvaJVgdFyGQ51zudCYtz
NhX1rUaZeHEjWh5dTWYryBZ+02IPC292Rh7nKLi5LcgLc9uFn1aPgIwZ4RbuBnJ9
K2AB3x6XL/lPOKKaan3tk22Hx1RjHCq3y7a1UV72tnwLPaRvqjY=
=Duxg
-----END PGP SIGNATURE-----

--Sig_/kkUIzuNfM6IIv7SRwH3J7Yx--

