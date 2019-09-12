Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC22B0CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:19:39 +0200 (CEST)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MCP-0004gO-VS
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1i8M9q-0003GS-BE
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1i8M9p-0006bz-9f
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:16:58 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:42166)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1i8M9p-0006bS-1Q
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568283417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cKRMiJrHSJAGkJtVzL6/jZR4eJhgQ9UXWDqK+AmziUQ=;
 b=QhdTCVCqYs/LngKLnfMtXlkCPePeO//tnS8ufeJTnmDLRXWT5wEJb1gH
 9EofkEdxhEK+h7BJxRO1yiinXU9G9rYL0Lr4QJXcXP1Vs8ccttzyq8ure
 OSuxtAZHirXrkl2maqga4PO0/RBkAmGrJIucEs6GWJYJrkI6DapS+cJbR Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RROzK3s5hvkoj5LzzXiM0usSw55gMe5qwpV6EYcdVtxU0ZgMTokic+8HHFQCZkivn/vPSUYe2a
 8t662YfrFiszB9DSh5fGnsM85SrapGm33vysZLSJa2iEXqSEbwGZSyqsnMJPzjjTqRDcuCS4og
 G7f0Jqq8GjT43IbHL3zMSp7CaqzXIUIX7o1cpqGLEMR9+DC2zqel+ZPI4OlsMg5s8i3Dkn/pqg
 8OSHv7czZOCqwCOyZcWAT5jWXoi2TbMSdtQVqsWVJKtBCT2AxfHrZCWXemW90+uBTs+jzlyq3W
 P7I=
X-SBRS: 2.7
X-MesageID: 5476475
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5476475"
Date: Thu, 12 Sep 2019 11:16:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190912101640.GB1308@perard.uk.xensource.com>
References: <20190911143618.23477-1-paul.durrant@citrix.com>
 <20190911143618.23477-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190911143618.23477-2-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.155
Subject: Re: [Qemu-devel] [PATCH 1/3] xen / notify: introduce a new
 XenWatchList abstraction
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
Cc: xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 11, 2019 at 03:36:16PM +0100, Paul Durrant wrote:
> Xenstore watch call-backs are already abstracted away from XenBus using
> the XenWatch data structure but the associated NotifierList manipulation
> and file handle registation is still open coded in various xen_bus_...()
                  ^ registration
> functions.
> This patch creates a new XenWatchList data structure to allow these
> interactions to be abstracted away from XenBus as well. This is in
> preparation for a subsequent patch which will introduce separate watch lists
> for XenBus and XenDevice objects.
> 
> NOTE: This patch also introduces a new NotifierListEmpty() helper function
                                         ^ notifier_list_empty() ?

>       for the purposes of adding an assertion that a XenWatchList is not
>       freed whilst its associated NotifierList is still occupied.
> 
> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

