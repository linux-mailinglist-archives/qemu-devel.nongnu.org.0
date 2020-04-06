Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F082F19FC09
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 19:51:49 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLVuW-0006h4-Um
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 13:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1jLVmc-0008Ew-CD
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1jLVmZ-00079M-Tv
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:43:37 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:52902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1jLVmZ-00078q-Jm
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586195015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bphNPG/A+OeRKQoZBapDV/s73PtCWQsb127JQKMzOao=;
 b=FeBhR/nYLKBbpRRDwTkKNSmsJ66yRATJvPIzoydcUPRKh3sxXUu8SvH5
 vwefUfz+UuccOnF+Pi3bRpP7OQ9VvFO6a3TCFZf03zdn6Ed/8D6g8r0J3
 9HmrBk6DIGQiVDiIPzxJWQX9n3iIlOsIdQU/MK3lpLZmciuUHORNTsftq c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hlwK8qzoKR3mA9SudDYB7JPSpQopwHfmD0RVWef2oBdIhmk3ijC0+3/s95S//l+6oEL8dsmgt8
 Uawkk1KEd8fi+ZuOC2BZ4QpNt5FC6GCEnEYZVho/chg/F8dlrZg6czj8gXIe8lUROYGsHwZkaq
 j+SraWWkJVFvNOLDyIeXhcspFxknIP0pUJllzFYn+l6GGDxL4WPszJx8A11HSq8WY4tHdX3CRE
 deaNLxX6QujMrG3H3CELbEh71lmlOeoZdd433K4tta+A+L6EstblMI3iZN47kIqjhMffSiFRmf
 4N0=
X-SBRS: 2.7
X-MesageID: 15918507
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15918507"
Date: Mon, 6 Apr 2020 18:43:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] hw/usb/xen-usb.c: Pass struct usbback_req* to
 usbback_packet_complete()
Message-ID: <20200406174323.GV4088@perard.uk.xensource.com>
References: <20200323164318.26567-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323164318.26567-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.155.144
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
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 23, 2020 at 04:43:18PM +0000, Peter Maydell wrote:
> The function usbback_packet_complete() currently takes a USBPacket*,
> which must be a pointer to the packet field within a struct
> usbback_req; the function uses container_of() to get the struct
> usbback_req* given the USBPacket*.
> 
> This is unnecessarily confusing (and in particular it confuses the
> Coverity Scan analysis, resulting in the false positive CID 1421919
> where it thinks that we write off the end of the structure). Since
> both callsites already have the pointer to the struct usbback_req,
> just pass that in directly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is an RFC because:
>  * I'm not very familiar with the Xen bits of QEMU
>  * the main rationale here is to change something that's
>    confusing Coverity -- the code as it stands isn't wrong
>  * the only testing I've done is "make check"
> Still, the change seems like a good thing to me as a human reader...
> 
> PS: QEMU's MAINTAINERS file stanza for Xen doesn't pick up
> that this file is Xen related, so it could use an extra F: line.

Looks good,
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

