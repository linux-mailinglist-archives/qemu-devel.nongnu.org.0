Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D92F8042
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:08:14 +0100 (CET)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Re1-00042j-IZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l0Rcq-00036L-6Z
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:07:00 -0500
Received: from mout.web.de ([217.72.192.78]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l0Rch-00015H-6k
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610726799;
 bh=CYj758eKoHfWSF6lAzKQCSUwedE4YIrmELfuiNRq/lE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ToghO+PevKaidtVox53ul4wgronK5I6urQ0iLNCC4ttypk9dqr2ZMlRSavier0xiN
 zcSwwYCwNWEZKBYE5nZq50+sa6bNeFfUGVNBcnzut+XH+m0sEinTwqVXQLbxb9XJcf
 uUhGJdKz3sWyr/AZKAFI4t3M/GmF7kqnuhzqDFRQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.204]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrs70-1m3mBl0MIw-013hho; Fri, 15
 Jan 2021 17:06:39 +0100
Date: Fri, 15 Jan 2021 17:06:29 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Message-ID: <20210115170629.39cc364f@gecko.fritz.box>
In-Reply-To: <63df670857ed4a278fab273557ee97d6@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-4-chen.zhang@intel.com>
 <20210114144521.76a6a135@gecko.fritz.box>
 <63df670857ed4a278fab273557ee97d6@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1SVqz0V1I63GAykJM2ohfsa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:I83oqNmZyPrDgJ6zICdZ2y/5ybdsn5sTHcABQU5B0LfS1HZhsk2
 VLiwBTwOeaYMl88Bz+eThQywR1FSPeGrGoh/rwcJmHI85WVhmWoDyFHu1YpqLHTUnDUWEgL
 6SMviv+1KJxroZt1NVaWVvAZ/M/aD7Y2OR/qjzRq0oofl7C1Un9u6OnuV99rMceo3Qo9lxb
 HoPWdgNsECpw/5RTR4Syw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u9qgwIlE4k0=:mzRh4M5bOqyz/EK4yi9lGu
 ECGh8YXh0ROzbxPAGR59BhxVdT4NiGL65L28/Oi1oq36vN5debBcyIFwh2DFsygxagfjpZk0U
 xwsm36tXqPXXbdtueLhSMmJe+I3vbMNeY0iPlQHAv4wS51oDHVpb59J8kOLZvyKrmdzXbhIUA
 0ocGDjkEiJX2XAJL1mzQuoIX0Sc7VGZ7bsGP3gBcPOGDaBlZQgiRxY4zdGT3qcb4EPX7LC5ph
 Yi6U8PF54fcxQeMdMdqCmnbc88XA/sesAhBUDDHoTv0/Lg36btAAv3Ole7kPe2NKmFDZ7duvy
 iHTq4RWb8Uk7FIbE11DV/4lBZf1sWYfdSHfMNbZWQjRD7v/9vXHjJ2+TmYr8oig7SV8zU5YmT
 RLhA+U4uFpDwGaBskuLQLlY9yQiHxoRC4Ag9WbNnk7K2fERw0ChkSdeWXe7iKY2mLRrMdKEqe
 DPKvkAzkSfkNERMK5US61Drh4QG6PBKqX/8lrMiNaq7U9VXqQOdK7vvhnKwAzTTn8Ybo6koF+
 Oz/hT2k2AG+9S79AXiiTfAN6QpURaNveV3pYP9vYyTanjGKKHtuTOqdcEUmGr7yBZEUsF0oZI
 tAVXfW0gYg2LXJt7ihuDykE/MJrkwtnLhDeP8vUWMeMP3nwnk3txK07q3j7MgIb8InpR0Mv49
 1n64pnai73uEVzPVDDN2Igz/UB7YqCVIM7hWV35l0xwAYK9jWsfwxnaOhKxn6O/cRGEIk6DXT
 9wX83exlF64XH380o0ltaLgWEyw3MLB3THzT6yRH4dAYtzYWCJPcNWqaA7cz1hj+Qj0F1BBfP
 VnEm5M2RoUmzvf+b8UwZB+hbNmLSGOtnWWteAWvn5dnuTOaoARnF8kHSuWVuegxvs92CgDsCC
 uFRhT/zs1+I2k6Uw2j+A==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/1SVqz0V1I63GAykJM2ohfsa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Jan 2021 09:07:47 +0000
"Zhang, Chen" <chen.zhang@intel.com> wrote:

> > -----Original Message-----
> > From: Lukas Straub <lukasstraub2@web.de>
> > Sent: Thursday, January 14, 2021 9:45 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu- =20
> > devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan =20
> > Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> > Zhang Chen <zhangckid@gmail.com>
> > Subject: Re: [PATCH 3/3] net/colo-compare: Add handler for passthrough
> > connection
> >=20
> > On Thu, 24 Dec 2020 09:09:18 +0800
> > Zhang Chen <chen.zhang@intel.com > wrote:
> >  =20
> > > From: Zhang Chen <chen.zhang@intel.com>
> > >
> > > Currently, we just use guest's TCP/UDP source port as the key to
> > > bypass certain network traffic.
> > >
> > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > ---
> > >  net/colo-compare.c | 49
> > > ++++++++++++++++++++++++++++++++++++++++++++++
> > >  net/colo-compare.h |  2 ++
> > >  net/net.c          | 27 +++++++++++++++++++++++++
> > >  3 files changed, 78 insertions(+)
> > >
> > > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > > 337025b44f..11a32caa9b 100644
> > > --- a/net/colo-compare.c
> > > +++ b/net/colo-compare.c
> > > @@ -46,6 +46,9 @@ static QTAILQ_HEAD(, CompareState) net_compares =3D
> > > static NotifierList colo_compare_notifiers =3D
> > >      NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
> > >
> > > +static QLIST_HEAD(, PassthroughEntry) passthroughlist =3D
> > > +    QLIST_HEAD_INITIALIZER(passthroughlist);
> > > + =20
> >=20
> > Hi,
> > I think this should be per colo-compare instance e.g. inside 'struct
> > CompareState'. =20
>=20
> It looks QMP and HMP also need to add colo-compare object ID to control i=
t.
> Do we need make this command more general?

Yes, it gives more flexibility. For example if the VM a "public" and a sepa=
rate "management" network interface, passthrough can then be enabled just o=
n the "management" interface.

Regards,
Lukas Straub

> Thanks
> Chen
>=20
> >  =20
> > >  [...]

--Sig_/1SVqz0V1I63GAykJM2ohfsa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmABvYUACgkQNasLKJxd
slgk0w//fKkiAZ6UpFdg4WQjssxAaN7xJ4vb2SJLJLwDKhft95tWl87nl8d3O2ky
RLPd5IkgiYU0cLZfwh3fBQo71E3pOjhQI1nIzc16GMdbckerIQR97W4B5BeystDY
r5qCgHWnsJs5ya5w0PFqxe6GAMa1kVYys4fnsA3GMczrnyr1d2S+L36nOn1nnVH0
NL+FIesssS5VZcu+97IUxs6+CVPdIj7moT2pl4iwA+2If6BScxoejQwqADYnKLMQ
Txao9YVMATq72q8N8si1zfzYwAvAWq3cOd5rM09q6JE4bq0vYed90la6IiR+OHil
bEIN3IVWonkx9ZymBeaV4I7xc56Idu/DKtXHX0y66K8pkEMgUos6qRWuM+D+1Mw6
MEwdh5sLef1sMhuFIxfIe3E+LSon3/h/vKp56T3veiQ38yGAq35p/3sS5uk+Tp7j
VZWNpizQs2aspMEwazS6L+kPJHdm+hTFhDqMlvhsXwuQpN++xwqS3N3k/oKggJNA
txkXvPBAiVwpC1odtGR34eaVO9mR6NcaRuoyeKwUHs0hZsaMQ3y/pgo7Z8FMWTjs
pCf+Pey04yQBmAblEHI4ZY72Jfw3yo77AfmzlFGyvuaiR0LlMiJA2Wr+WtObV0SQ
ukmlM0Dh2EMpdJk2R1CX46cVE8w8syeUbB6pCXkMUMGHEHMY8AU=
=3z2b
-----END PGP SIGNATURE-----

--Sig_/1SVqz0V1I63GAykJM2ohfsa--

