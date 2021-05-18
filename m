Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B363873BE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:06:16 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuk2-0004rB-P7
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1liuh5-0002ae-2M
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:03:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1liuh2-0006j8-MK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621324987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRMC43TaPGQjtUsEQ/vDyuSA8L/WDPJTXJEKgI25olc=;
 b=R9ykpqobaVVlM/1kJebQ5zdkjSM4bcB7AqR5F0to6ggrpnRiLVFlik0Rkny+4DxTl9LFDu
 CHfj3e5oGJ8djyL6U5cFEctJYEmFZxxJ9u6+hGg/k64tatWSHC85gnIvNCT4FT5NQkqhq8
 oYKOwld+878Cwsm/ZhFxi3DfCTLfu50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-HU5PzLtFOM2X0w7lybkX1A-1; Tue, 18 May 2021 04:03:05 -0400
X-MC-Unique: HU5PzLtFOM2X0w7lybkX1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 715C2DF8A3;
 Tue, 18 May 2021 08:03:04 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BB99687CA;
 Tue, 18 May 2021 08:02:54 +0000 (UTC)
Date: Tue, 18 May 2021 10:02:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YKN0rU9GRLtRx4oB@merkur.fritz.box>
References: <YIrV9MqlqwUhJR+B@merkur.fritz.box>
 <YIwnI0ML0BEkQ1iE@stefanha-x1.localdomain>
 <YJFPt5BmHXmM5+WE@merkur.fritz.box>
 <YJLFjY9BuOd9/KJx@stefanha-x1.localdomain>
 <YJLL7B249hN6wJTd@merkur.fritz.box>
 <YJOs8JTGyfAb4wXO@stefanha-x1.localdomain>
 <YJPF9KhUWm3tGX9b@merkur.fritz.box>
 <YJz1qqXI8z1PQYkM@stefanha-x1.localdomain>
 <YJ6dYTNLivMuj7VM@merkur.fritz.box>
 <YKJ5B9F+uvjzM2Uh@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YKJ5B9F+uvjzM2Uh@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ykUrf5B3eW+6/fK9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: pkrempa@redhat.com, Alberto Garcia <berto@igalia.com>, slp@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, rjones@redhat.com,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ykUrf5B3eW+6/fK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 17.05.2021 um 16:09 hat Stefan Hajnoczi geschrieben:
> On Fri, May 14, 2021 at 05:55:13PM +0200, Kevin Wolf wrote:
> > Am 13.05.2021 um 11:47 hat Stefan Hajnoczi geschrieben:
> > > On Thu, May 06, 2021 at 12:33:24PM +0200, Kevin Wolf wrote:
> > > > Am 06.05.2021 um 10:46 hat Stefan Hajnoczi geschrieben:
> > > > > What do you think about this:
> > > > >=20
> > > > > The blkio instance states are:
> > > > >=20
> > > > >   created -> attached -> started -> destroyed
> > > > >=20
> > > > > It is not possible to go backwards anymore, which simplifies driv=
er
> > > > > implementations and it probably won't be needed by applications.
> > > > >=20
> > > > > The "initialized" state is renamed to "attached" to make it clear=
er that
> > > > > this means the block device has been connected/opened. Also
> > > > > "initialized" can be confused with "created".
> > > > >=20
> > > > > The corresponding APIs are:
> > > > >=20
> > > > > int blkio_create(const char *driver, struct blkio **bp, char **er=
rmsg);
> > > > > int blkio_attach(struct blkio *bp, char **errmsg);
> > > > > int blkio_start(struct blkio *bp, char **errmsg);
> > > > > void blkio_destroy(struct blkio **bp);
> > > > >=20
> > > > > There is no way to query the state here, but that probably isn't
> > > > > necessary since an application setting up the blkio instance must
> > > > > already be aware of the state in order to configure it in the fir=
st
> > > > > place.
> > > > >=20
> > > > > One advantage of this approach is that it can support network dri=
vers
> > > > > where the attach and start operations can take a long time while =
regular
> > > > > property accesses do not block.
> > > >=20
> > > > I like this.
> > > >=20
> > > > For properties, I think, each property will have a first state in w=
hich
> > > > it becomes available and then it will be available in all later sta=
tes,
> > > > too.
> > > >=20
> > > > Currently, apart from properties that are always read-only, we only=
 have
> > > > properties that are rw only in their first state and become read-on=
ly in
> > > > later states. It might be reasonable to assume that properties will
> > > > exist that can be rw in all later states, too.
> > > >=20
> > > > In their first state, most properties only store the value into the
> > > > config and it's the next state transition that actually makes use o=
f
> > > > them. Similarly, reading usually only reads the value from the conf=
ig.
> > > > So these parts can be automatically covered. Usually you would then=
 only
> > > > need a custom implementation for property updates after the fact. I
> > > > think this could simplify the driver implementations a lot. I'll pl=
ay
> > > > with this a bit more.
> > >=20
> > > Hi Kevin,
> > > I posted a patch that introduces blkio_connect() and blkio_start():
> > > https://gitlab.com/libblkio/libblkio/-/merge_requests/4
> >=20
> > Assuming that you want review to happen on Gitlab, I added a few
> > comments there.
> >=20
> > I'm not sure if you saw it, but on Wednesday, I also created a merge
> > request for some first changes to reduce the properties boilerplate in
> > the iouring module that would otherwise be duplicated for every new
> > driver. Not sure if everything is a good idea, but the first patch is
> > almost certainly one.
> >=20
> > (However, I just realised that the test failure is not the same as on
> > main, so I degraded it to a draft now. It also conflicts with your merg=
e
> > request. Next thing to learn for me is how to respin a merge request on
> > Gitlab... You may want to have a look anyway.)
>=20
> Awesome, I will take a look, thanks. I need to tweak my GitLab
> notification options :-).
>=20
> You can force push to your topic branch to respin the merge request.

Ah, that sounds easy enough. On the other hand, it means I can't work in
the branch any more without automatically updating the merge request, so
a branch used for a merge request is burned in a way. I should have
created a separate branch for this.

Looks like I need to familiarise myself more with the Gitlab process
before I can expect it to work well for me. :-)

Kevin

--ykUrf5B3eW+6/fK9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCjdK0ACgkQfwmycsiP
L9YoQQ/6AxIzjdTfJ8wfkahV7xye2fEyGaDFP9Jcr+8L5ZR0LvWAQikIPPW4i7aw
CKWon4kdGk0SRE1qmFqRuqh8Pkci78zKoQIXRKtDTryjXlT7PZqWe73clK3ZXjYR
yRWvLi2lGDPTVENi6HUahNTa2pqxv8dt1XVgpSw/7mFYxMGEZPdMlsmo64wuJmKX
YahWG0uwcwpkjDGfr0SoHxxiT3Q5aiYATotuw1jaQpPRYdafZMpCPd7vz1EOjpbW
AQABRL3L45Z3ZI2ly31trLqMEwYcX7+Jx+dTHlsPqml5D3wrSbsI87TtMZKg7OpS
Q/hPQM2dIryxhhnYvnO0ry2+AGp5oQNWnBPGec6zOLgMdn/18n33MlLahpfIdtG0
n7/ouLoSv5+L4oYKW8mb1u/QD2MD+PfkH0nY9XJz4I6OUQEUJV9pUT0X6t9EomlP
tfVJ+D9uCMY4sfIAP5iAnHWuvHn4hIIHd3xgyatEDRGwRXMPciYY3ZIgC5LtcDum
BMYZq5K04+NUIS1tDbJCihk5eijEEB9OHENFCfTuu510c6ptfg39FnRfXXoZ6QR2
Fv5vSd9Mlj5zWhkBxrYHT5axGMiGWgR4cWCNocbK/IvHwOyhBgDWESjrwY9OS2Z3
OI2a7N0ZBgsXwdPTQEVVvIGqJoyL4e+LL2zxkbV7B6UC1DU/teo=
=D72F
-----END PGP SIGNATURE-----

--ykUrf5B3eW+6/fK9--


