Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9649B84
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 09:52:06 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd8uS-0008CC-OO
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 03:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Paul.Durrant@citrix.com>) id 1hd8ss-0007LQ-Eh
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 03:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1hd8sp-0000Qo-H4
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 03:50:26 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:63919)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1hd8sp-0000PF-8J
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 03:50:23 -0400
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CLOLYOUHQvXdoFD7lyTE5v1cDBjE65rBGAV2R9V1rJiVfyGY3/O4dzzrYzr8GAOf1Qcp9nnobq
 hyGwySUsf4b8htXabasNAMG3sCdCmdWGB6jTkyYImCEYNG1DuLwwkOup5JZJivdTwQ2ApJVV8K
 5zKqxmufGeUFTbZGS6gbGJLmIVPezihhuejUVEKM0KhEgj3EkaY4b66l+yBe7AUgExC/o7SLEQ
 rKzItvu+MFq+kqyTfLo2z1T2/zYVK814fJLvunWrkT4G4ZwU44TqSelZ6BvgxC3FgOTKQEA+Rl
 Mrk=
X-SBRS: 2.7
X-MesageID: 1880628
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,388,1557201600"; 
   d="scan'208";a="1880628"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 4/4] xen: Avoid VLA
Thread-Index: AQHVJSMYaL9Ko3kp1kKDxJjcc8OjZKagC0EQ///vbYCAAQ/hAA==
Date: Tue, 18 Jun 2019 07:50:18 +0000
Message-ID: <424f82301a824e1fb0a140972268fa8f@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-5-anthony.perard@citrix.com>
 <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
 <20190617173649.GB13449@perard.uk.xensource.com>
In-Reply-To: <20190617173649.GB13449@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.144
Subject: Re: [Qemu-devel] [PATCH 4/4] xen: Avoid VLA
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Anthony PERARD [mailto:anthony.perard@citrix.com]
> Sent: 17 June 2019 18:37
> To: Paul Durrant <Paul.Durrant@citrix.com>
> Cc: qemu-devel@nongnu.org; xen-devel@lists.xenproject.org; Stefano Stabel=
lini <sstabellini@kernel.org>
> Subject: Re: [PATCH 4/4] xen: Avoid VLA
>=20
> On Mon, Jun 17, 2019 at 05:39:09PM +0100, Paul Durrant wrote:
> > > @@ -632,6 +633,8 @@ static void xen_sync_dirty_bitmap(XenIOState *sta=
te,
> > >          return;
> > >      }
> > >
> > > +    bitmap =3D g_new0(unsigned long, bitmap_size);
> > > +
> >
> > How hot is this function? It looks (unsurprisingly) like the section
> > size determines the map size so I wonder whether it can instead be
> > allocated once when the section is added?
>=20
> I think we can store the bitmap buffer into the `state' where
> `log_for_dirtybit' is already present, and free the bitmap when
> `log_for_dirtybit' is cleared.

That sounds better :-)

Cheers,

  Paul

>=20
> Thanks,
>=20
> --
> Anthony PERARD

