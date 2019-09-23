Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E714BB77D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 17:06:47 +0200 (CEST)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPvK-0002ho-2D
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 11:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1iCPsj-0000nT-Dh
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 11:04:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1iCPsi-0006t5-5v
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 11:04:05 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:1994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1iCPsh-0006sF-JI
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 11:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569251044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1Y4/NeUeZiErZGzqGIl4KpmJrqnjb26duKO/7w9nXdI=;
 b=RMzap5spwByz6XZnkUkctElb5O5ZYeMMh7bXOa/oGW3VAC3mWvbmgyte
 9NXCoNRQg0P83IHjqFxHkfke05Zu8vRWFxDn9CklO95y6PI8TP+8uQZBn
 x/i126buBRLVKaEN9DkZUQJ15zT/ayAiWAMGaqNbNivlGCuSCVEYWPM8o s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Af8RCcOLXn+JKGfge5/ttaGXwR/JdsgHkehCcsZBOLpIG5YBxbEtmXvFYS0WBAJF8bGi50GgAL
 hslrKvAgB+Yd9wcO2m6DOt/hIsbOLvxYH6Y8WVI4HARiA5mV9yGJs/usLf1tjGWU4S9ZlA3kUv
 vDRlwV7+2zUQxxmZrpbK30hZqcDivSFceEmGK9OzSlmnpYlklyER8q/hLQvysvJziWY5rItvOr
 Zg1DwfQ/F+UHpj18dAN1sTcbjIqbED5bbXB4ieZleigA0AuDxKYIyV/OnDAWxooF1O3p6x6PDI
 +9c=
X-SBRS: 2.7
X-MesageID: 5933806
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="5933806"
Date: Mon, 23 Sep 2019 16:03:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [PATCH] xen-bus: only set the xen device frontend state if it is
 missing
Message-ID: <20190923150356.GB1163@perard.uk.xensource.com>
References: <20190918115745.39006-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190918115745.39006-1-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.153
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Mark Syms <mark.syms@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 18, 2019 at 12:57:44PM +0100, Paul Durrant wrote:
> From: Mark Syms <mark.syms@citrix.com>
> 
> Some toolstack implementations will set the frontend xenstore
> keys to Initialising which will then trigger the in guest PV
> drivers to begin initialising and some implementations will
> then set their state to Closing. If this has occurred then
> device realize must not overwrite the frontend keys as then
> the handshake will stall.
> 
> Signed-off-by: Mark Syms <mark.syms@citrix.com>
> 
> Also avoid creating the frontend area if it already exists.
> 
> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

