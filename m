Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F8022F391
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 17:14:11 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k04pO-00059C-J5
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 11:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1k04lb-00008K-Mw
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:10:15 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:31048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1k04lZ-0007qP-Jq
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595862614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sR3ryQAOS+S0NbJCgIZh4VUQhAcGy5QKSINzpYnT7JY=;
 b=NPEnU/HzUYOlzR59+VkAMnH6eXWMgvv4Ai5ZoqwVdqqda/fj/DN12+F/
 SQ3xhF62rnNmS5QpihHLuPlb9MgvenlczvlYPMHkNp/NVPJXZTnOe8It/
 4dRPzdDNaxwnF8OSBCoZyNCIr/yUXmhsCNtjjYiyvpw0W2cUYRvK74mE/ A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BCFjiLy7M4wxt53iAYViok7J96cEiv+aUdSbdAfgkey+nIzi42/0mcMiqzTKEQ26uxygMB/L+q
 8x1E1RbjQ9rFOauaciKDRJXE1LEpafgOJWtCQbnrzv6sFz/3deNaZtDPzFS15Acf028XHNbNZY
 XsxRWk839CeqVu0om4z2X8+Xo7Ur8SsATBfe1Az0V9yC0ul9rH43pQbePugKD3mBb+inVbY2RL
 5l7CmbC8aiJ6RO35DY5ZUc/0uixadd5XEA8ZC/NH7mls8g7rfGSmStUjt2rs2Pv71s5wsp9nHO
 Q2c=
X-SBRS: 2.7
X-MesageID: 23262142
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23262142"
Date: Mon, 27 Jul 2020 16:09:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] xen: xenguest is not used so is not needed
Message-ID: <20200727150949.GC2866@perard.uk.xensource.com>
References: <20200727140048.19779-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200727140048.19779-1-mjt@msgid.tls.msk.ru>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 11:10:09
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 27, 2020 at 05:00:48PM +0300, Michael Tokarev wrote:
> There's no references in only file which includes xenguest.h
> to any xen definitions. And there's no references to -lxenguest
> in qemu, either. Drop it.

I'm not sure what you mean by "no references to -lxenguest", do you mean
in the binary?

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Otherwise, thanks for the cleanup!

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

