Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37177AB4CC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 11:21:45 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6AR6-0002MO-BQ
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 05:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i6AQ7-0001Qi-NO
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 05:20:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i6AQ6-0006bw-9M
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 05:20:43 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:65450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1i6AQ5-0006Zo-Tx
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 05:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567761642;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=db169m4HoYL/ksYQKKrL+GvEwhjapCxmoxcZbgXmumI=;
 b=QQiJxe8I4Rc//UekmAb8rykRcAwOM2t+HkReNZMvhvXKisqQ5JX/I12A
 EtjHaOu/MKZP0RJ6159qeqTJKb9mMJRU6jNZEAFe90FjT/rxIsvmuY6uY
 GrPyblQ9f+o67hZBlTJjUrHzmV/nFo7m8L7fxjEqiEgmFW5zMmmMnPipr U=;
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
IronPort-SDR: 8GN3mEt61KOZhuuC5/u/DMneHD7TCZGfjGTypAlmsxVPoYfnVBmZPcoQ/5jq9ElQtXv8c+GuEA
 nsjltSIskqRcBGK48KGhoRtyRyniSu/JfIlAuOCrg6cK8nZmVGaG5/BXusUVbUydQnyMfbzZQ+
 1Fjd0mjMhMDp1OC1L4iyWmQfZgZr7eE0GFIqTXGNh1iJplC0pD4yr0ugseWioz77OYUMis1P1f
 oQZm2u7BEvfjGS0ozZCPgNB6WF3aCViYr8Q00Mv1p3u+Me4DWG3nUU1uBmstDVQLLAS2N/djej
 0nE=
X-SBRS: 2.7
X-MesageID: 5229452
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5229452"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Chao Gao' <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [RFC Patch] xen/pt: Emulate FLR capability
Thread-Index: AQHVXkfuFLvvoAaowUSFuPbgsUcGX6cRyN6AgAx8SoCAACDqkA==
Date: Fri, 6 Sep 2019 09:20:33 +0000
Message-ID: <1307d03945d948fd89a6956d77c5ce28@AMSPEX02CL03.citrite.net>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
 <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
 <20190906090107.GA25703@gao-cwp>
In-Reply-To: <20190906090107.GA25703@gao-cwp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.155
Subject: Re: [Qemu-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jan
 Beulich <jbeulich@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Chao Gao <chao.gao@intel.com>
> Sent: 06 September 2019 10:01
> To: Roger Pau Monne <roger.pau@citrix.com>
> Cc: xen-devel@lists.xenproject.org; qemu-devel@nongnu.org; Stefano Stabel=
lini
> <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Pau=
l Durrant
> <Paul.Durrant@citrix.com>; Jan Beulich <jbeulich@suse.com>
> Subject: Re: [RFC Patch] xen/pt: Emulate FLR capability
>=20
> On Thu, Aug 29, 2019 at 12:21:11PM +0200, Roger Pau Monn=E9 wrote:
> >On Thu, Aug 29, 2019 at 05:02:27PM +0800, Chao Gao wrote:
> >> Currently, for a HVM on Xen, no reset method is virtualized. So in a V=
M's
> >> perspective, assigned devices cannot be reset. But some devices rely o=
n PCI
> >> reset to recover from hardware hangs. When being assigned to a VM, tho=
se
> >> devices cannot be reset and won't work any longer if a hardware hang o=
ccurs.
> >> We have to reboot VM to trigger PCI reset on host to recover the devic=
e.
> >>
> >> This patch exposes FLR capability to VMs if the assigned device can be=
 reset on
> >> host. When VM initiates an FLR to a device, qemu cleans up the device =
state,
> >> (including disabling of intx and/or MSI and unmapping BARs from guest,=
 deleting
> >> emulated registers), then initiate PCI reset through 'reset' knob unde=
r the
> >> device's sysfs, finally initialize the device again.
> >
> >I think you likely need to deassign the device from the VM, perform
> >the reset, and then assign the device again, so that there's no Xen
> >internal state carried over prior to the reset?
>=20
> Yes. It is the safest way. But here I want to present the feature as FLR
> (such that the device driver in guest can issue PCI reset whenever
> needed and no change is needed to device driver).  Current device
> deassignment notifies guest that the device is going to be removed
> It is not the standard PCI reset. Is it possible to make guest unaware
> of the device deassignment to emulate a standard PCI reset?

It should be, I would have thought. QEMU emulates all config space so any c=
onfig access by the guest would be unaffected by de-assignment. The BARs an=
d interrupts would be unmapped... but that's what you'd want anyway.

> In my mind,
> we can expose do_pci_remove/add to qemu or rewrite them in qemu (but
> don't remove the device from guest's PCI hierarchy). Do you think it is
> the right direction?

Long term I think we want to get pass-through emulation out of QEMU and int=
o Xen.

  Paul

>=20
> Thanks
> Chao

