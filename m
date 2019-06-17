Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723DC48AB8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 19:44:04 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcvfm-0001bC-5G
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 13:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46863)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anthony.perard@citrix.com>) id 1hcvYu-0005n9-V6
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1hcvYt-0003Xu-RS
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:36:56 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:28004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1hcvYt-0003TG-Jk
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:36:55 -0400
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
IronPort-SDR: 5tL94c6aGd8x50dWBXxprOukuWnfbE0PesQHSgxxAAxJkmThEPK/uDHtYGLbBi8I4CeZzFcIEz
 tZAUWzQR9VKbAdJgrkGO/+Hs0d+ao04Xu6WdIM96UvJrz3Kw6HYkZdRNoYArAC2OYE8gMm5W0d
 i/+noR/GoG+Vi+ltqv4FIeyiIlsERYlpnn90zwzkZx73Izg7S9OqYakkXvwzdRBk0SNb3Xgc1z
 QVeCIe+NDUMIRXFMNiRirFydIOnGM2BEtMWcGTabwFqIIcdxt5ATO0uqeqPeQty/7dOo9V+LLT
 aTY=
X-SBRS: 2.7
X-MesageID: 1829370
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,386,1557201600"; 
   d="scan'208";a="1829370"
Date: Mon, 17 Jun 2019 18:36:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190617173649.GB13449@perard.uk.xensource.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-5-anthony.perard@citrix.com>
 <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.175
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

On Mon, Jun 17, 2019 at 05:39:09PM +0100, Paul Durrant wrote:
> > @@ -632,6 +633,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
> >          return;
> >      }
> > 
> > +    bitmap = g_new0(unsigned long, bitmap_size);
> > +
> 
> How hot is this function? It looks (unsurprisingly) like the section
> size determines the map size so I wonder whether it can instead be
> allocated once when the section is added?

I think we can store the bitmap buffer into the `state' where
`log_for_dirtybit' is already present, and free the bitmap when
`log_for_dirtybit' is cleared.

Thanks,

-- 
Anthony PERARD

