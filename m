Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2449EEA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 13:07:09 +0200 (CEST)
Received: from localhost ([::1]:55590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdBxE-0003d3-Pu
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 07:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anthony.perard@citrix.com>) id 1hdBvx-000342-0X
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1hdBvu-0005T6-0V
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:05:48 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:20974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1hdBvt-0005Pe-BG
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:05:45 -0400
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yOf2JCTLJ89OKHJ43HTpsi8I9Po4T9qYhdCQoF2YrJdA9v6wcM/LZEe/DfG6tGBzyg6T2iyARg
 YunR3U258yyKwJO92ah2GpPIhWFc7zw6jiMl4hfHrv5333r88P63SY3T/VxtYQBQwWiMWTyxuk
 oPRltrRnRoML+xTJWh0C5YvokJ5xoqdd099ga9191uWYYYYuH5woFDve4Sp490gUWTMBTcadIz
 ZbkqYckg5sNAuP2pnb+aLyI3GdbfmDu+xHYVKTFpYgv8hKn06Mq2MdFaFd/hOYTJXwOXn3ednG
 KV4=
X-SBRS: 2.7
X-MesageID: 1864440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1864440"
Date: Tue, 18 Jun 2019 12:05:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190618110540.GC13449@perard.uk.xensource.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
 <20190617164544.GA13449@perard.uk.xensource.com>
 <20190617171913.GA15926@perard.uk.xensource.com>
 <17fc272d31cc4e95baa3ec68a90557d1@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <17fc272d31cc4e95baa3ec68a90557d1@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.175
Subject: Re: [Qemu-devel] [Xen-devel] [PATCH 3/4] xen: Import Xen public
 headers used by xen-hvm.c
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 18, 2019 at 08:55:53AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Anthony PERARD [mailto:anthony.perard@citrix.com]
> > 
> > On Mon, Jun 17, 2019 at 05:45:44PM +0100, Anthony PERARD wrote:
> > > On Mon, Jun 17, 2019 at 05:15:51PM +0100, Paul Durrant wrote:
> > > > AFAICT the only place (apart from legacy code in xen_common.h) that
> > > > params.h is necessary is in xen_suspend_notifier(). I wonder whether
> > > > that would be better moved into xen_common.h too (since it's just a
> > > > wrapper round xc_set_hvm_param() and then the inclusion of params.h
> > > > can be moved there as well.
> > >
> > > :(, I didn't realised that xen_common.h needed params.h too. That patch
> > > series might not build on older version of Xen. I'll move the inclusion
> > > of params.h to xen_common.h, and fix params.h to have all the needed
> > > #defines.
> > 
> > Actually, it works fine without including hvm/params.h in xen_common.h
> > because xen_common.h includes xenctrl.h which includes hvm/params.h.
> > 
> > So I think instead I'll remove all includes of params.h, because
> > HVM_PARAM_* are parameters for xc_hvm_param_{get,set}, which is in a
> > library and not an interface with a guest. Including xenctrl.h should be
> > enough.
> 
> The guest/tools separation is messy. ioreq.h is also an interface with
> Xen and not with a guest, so really I think it should be treated the
> same way as params.h.

Yes, I'll drop this patch, and replace it with a patch that just removes
includes of params.h.

> e820.h is referring to guest memory layout,
> which IMO shouldn't really be hardcoded at all.

I'll leave e820.h include alone.

-- 
Anthony PERARD

