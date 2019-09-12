Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F930B0DC0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 13:28:09 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8NGi-00009K-IL
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 07:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1i8NFt-0008C6-9a
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:27:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1i8NFs-0004Q6-9E
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:27:17 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:40175)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1i8NFs-0004Ol-0I
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568287635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IsK2YwJPy4QTQ6atrOPJy0yGrY6gZzq2Q6xM9wwsL9c=;
 b=ZW5o9HbVTCEAp/EpHlaKCQMR0jIGKwJrILZjaTmdUCfVgE4APhoDLXsq
 EpInPHGj2NUdsM9vSiNXM0LEwFQvNsnuh2N+Nz6OjHybAtCDWSqasvEfR
 UyjRzuHbHvd/xBfknrddaZzhteI2M7a3PWMDYNAJjFJOswNRHQFDqpW4T s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cYZJ1UvFYiTnwpf4OZhK0oDClZ3oqj/MsuPT7ZY3VsTVLcsjvkdVMoU3YnFTis5I6ASN1QKZCn
 Wx/jxl3+IlT+QYBvw2+QoOT+UyKaWZBGaF1Y9X3uo9sbEnmst/B6GA4B6rRRLSb4oK2c+64GNm
 n1wFdxX0eyBwM3oadzvdSQEJqySx7P52vd0Ffwj/M8cMgPlOUqmKnD7GkchOb/ynXruyOvzPlg
 8bliLMogLLk64FzMTxcOUFnj7zwLUQZhNwYJuEUIkgXzppDXr6ZqYanKAEdqJIiFOV3iRGAe15
 s+Q=
X-SBRS: 2.7
X-MesageID: 5767853
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5767853"
Date: Thu, 12 Sep 2019 12:27:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190912112711.GC1308@perard.uk.xensource.com>
References: <20190911143618.23477-1-paul.durrant@citrix.com>
 <20190911143618.23477-3-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190911143618.23477-3-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.144
Subject: Re: [Qemu-devel] [PATCH 2/3] xen: introduce separate XenWatchList
 for XenDevice objects
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

On Wed, Sep 11, 2019 at 03:36:17PM +0100, Paul Durrant wrote:
> This patch uses the XenWatchList abstraction to add a separate watch list
> for each device. This is more scalable than walking a single notifier
> list for all watches and is also necessary to implement a bug-fix in a
> subsequent patch.
> 
> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

