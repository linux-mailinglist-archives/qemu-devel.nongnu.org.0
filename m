Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5548A06
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 19:24:58 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcvNG-0003kh-SK
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 13:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Paul.Durrant@citrix.com>) id 1hcutw-0000PN-6v
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1hcutv-0002tu-26
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:54:36 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:47349)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1hcutt-0002mw-EG
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:54:34 -0400
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bZZzZ30BVWkwcFZ5YV36H6mQRPHY9MdduC4Rm2O5KpiWcMZQnFbBF4WtDPRgmLZT/uIeRRDNsU
 Ot+Xg+ovhPO3xuk8hjw73kUJjWlfBgkQJo9s1v43DGGryy5U1cpfiMdZnctekVUJ+CqaA82Nl1
 WNAHwwuVUWnBNewMLC015fHra6cHpUxOfsTINKzK3RoS+GiOVNgCJ7M4u2QoU/f5YrsUfjk02y
 MvnM7oggzVDpNFXpGCMQbLyNrT2CxU8N21BIiYsl1/ejzphme5dkFuJ5YVSdxby3qVAyB7XL+o
 K70=
X-SBRS: 2.7
X-MesageID: 1843317
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1843317"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 3/4] xen: Import Xen public headers used by xen-hvm.c
Thread-Index: AQHVJSMVksnbyKoRC0SnNZiHFchLQ6agBEVg///oIwCAACLv8A==
Date: Mon, 17 Jun 2019 16:54:27 +0000
Message-ID: <8d3b855aab3d46f0ae02763f3fcc4f9c@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
 <20190617164544.GA13449@perard.uk.xensource.com>
In-Reply-To: <20190617164544.GA13449@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.155
Subject: Re: [Qemu-devel] [PATCH 3/4] xen: Import Xen public headers used by
 xen-hvm.c
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
> Sent: 17 June 2019 17:46
> To: Paul Durrant <Paul.Durrant@citrix.com>
> Cc: qemu-devel@nongnu.org; xen-devel@lists.xenproject.org; Stefano Stabel=
lini <sstabellini@kernel.org>
> Subject: Re: [PATCH 3/4] xen: Import Xen public headers used by xen-hvm.c
>=20
> On Mon, Jun 17, 2019 at 05:15:51PM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Anthony PERARD [mailto:anthony.perard@citrix.com]
> > > Sent: 17 June 2019 16:41
> > > To: qemu-devel@nongnu.org
> > > Cc: xen-devel@lists.xenproject.org; Anthony Perard <anthony.perard@ci=
trix.com>; Stefano Stabellini
> > > <sstabellini@kernel.org>; Paul Durrant <Paul.Durrant@citrix.com>
> > > Subject: [PATCH 3/4] xen: Import Xen public headers used by xen-hvm.c
> > >
> > > Following "xen: Fix build with public headers", import other Xen
> > > public headers that are describing interfaces.
> > >
> > > The headers are cleaned up a bit while importing them. The header
> > > guard symbols are changed to match QEMU's coding style, some other
> > > part of the files that QEMU doesn't use are removed.
> > >
> > > xen-mapcache.c doesn't needs params.h, so remove the include.
> > >
> > > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > > ---
> > >  hw/i386/xen/xen-hvm.c                 |   6 +-
> > >  hw/i386/xen/xen-mapcache.c            |   2 -
> > >  include/hw/xen/interface/hvm/e820.h   |  28 +++++++
> > >  include/hw/xen/interface/hvm/ioreq.h  | 101 ++++++++++++++++++++++++=
++
> > >  include/hw/xen/interface/hvm/params.h |  33 +++++++++
> > >  5 files changed, 165 insertions(+), 5 deletions(-)
> > >  create mode 100644 include/hw/xen/interface/hvm/e820.h
> > >  create mode 100644 include/hw/xen/interface/hvm/ioreq.h
> > >  create mode 100644 include/hw/xen/interface/hvm/params.h
> > >
> > > diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> > > index 2939122e7c..725f9c2278 100644
> > > --- a/hw/i386/xen/xen-hvm.c
> > > +++ b/hw/i386/xen/xen-hvm.c
> > > @@ -26,9 +26,9 @@
> > >  #include "trace.h"
> > >  #include "exec/address-spaces.h"
> > >
> > > -#include <xen/hvm/ioreq.h>
> > > -#include <xen/hvm/params.h>
> > > -#include <xen/hvm/e820.h>
> > > +#include "hw/xen/interface/hvm/ioreq.h"
> > > +#include "hw/xen/interface/hvm/params.h"
> >
> > AFAICT the only place (apart from legacy code in xen_common.h) that
> > params.h is necessary is in xen_suspend_notifier(). I wonder whether
> > that would be better moved into xen_common.h too (since it's just a
> > wrapper round xc_set_hvm_param() and then the inclusion of params.h
> > can be moved there as well.
>=20
> :(, I didn't realised that xen_common.h needed params.h too. That patch
> series might not build on older version of Xen. I'll move the inclusion
> of params.h to xen_common.h, and fix params.h to have all the needed
> #defines.
>=20
> About xen_suspend_notifier(), it's actually more than a wrapper, it's
> also a function. A pointer to the function is given to a notifier.
> So I don't think using "inline" will work, and I don't think it makes
> sense to have a function without "inline" in xen_common.h. So I think
> xen_{suspend,wakeup}_notifier are fine where there are, do you agree?

Oh, I hadn't realized they were callbacks. In that case, leave the function=
s where they are. We really ought to have a stable API rather than a params=
 interface... Not something you can address here though.

  Cheers,

    Paul

>=20
> Thanks,
>=20
> --
> Anthony PERARD

