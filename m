Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63FC6D05A7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:01:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrtr-0005YN-L6; Thu, 30 Mar 2023 09:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrtL-0005WC-LF
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:00:36 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrtJ-0007KK-MF
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680181233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8DRJWvLzrc0qU2F2dmm/GwAwKgJ2cyVW9LJwugMHSuM=;
 b=OfBtWmHfm04ItHuOvbNDlp7oOAoIcoWjZX308KdcD5p5UOAj6doGD4vL
 2+8Nkq0upMnhRUn08+K5nf79UidfiUprkum8eHWgqwPOqyse8Iy36pkHt
 pGRDKQdM1GaJsTk1tf1F1xfykoIA+uSz7McDb5L5QNojfAoAsRnPm1Uhv E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103703221
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:5/dgu6g3MkyItm68BKVfqQRgX161fhcKZh0ujC45NGQN5FlHY01je
 htvWTvVP/zYM2XxfdB/bNux/R4CvJbXxoMwSAQ9rS48FSkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wSGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQbGBcxTTumm9nvnomECeBqoeQuFNPSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 jmZpz+jWEhy2Nq3+GC41yyOm9LzpDrlQ9hNJr6m7Ox3nwjGroAUIEJPDgbqyRWjsWa7QM53M
 UEY+iMy66M18SSDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL8+w+EAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTSUeRgsY6NrxiIg0ilTESdMLOKetg8f8Az3Y3
 zGApy94jLIW5eYR1q679ErLxTKhoJTEVBUy4C3TX2Ss9AQ/Y5SqD6Sw6Vnf6PpoKIefR0OG+
 n8elKC26ekUBpyJ0iWVTugJFri04t6KNTTdhRhkGJxJ3yyn/HixfIZRyCtzKEdgLoAPfjqBS
 FTTtAVN6Y57M36jbKsxaIW0Y+wzwK39UNjoSP3QRtxJZJd3aUmA5i4GTUeNxW3pkUUquagiI
 5qfKpzqC3sGYYxqwCe/Xesa+b8izCM53n+VQ53npzyrzr+BTHeQQKUCNh2FaaYk78usoB3S7
 s1ENs2i0RhWW/H5eW/Q64F7ELwRBSFlX9as8ZURL7PdZFM8QwnNFsM935siS6tZvI9wityRo
 EqCGUZe73ryvWf+fFDihm9YVF//YXpuhStlYn19bQb0hyhLjZWHt/lGKcZuFVUz3Kk6lKMvE
 aFYEymVKq4XIgkr7QjxenUUQGZKUB2wzTyDMCO+CNTUV84xHleZkjMIk+aGycXvMsZUnZFky
 1FY/lmHKafvviw7ZCosVNqhzkmqoV8Wk/9oUk3DL7F7IRu8qNEzd3Ku0K9pfangzCkvIBPAj
 2565j9GzdQhXqdvqIWZ7Ux6h9zB/xRC8rpyQDCAsOfe2djy9Wu/245QONu1kcTmfDqsos2KP
 LwFp8wQxdVbxD6mRaIgSec0pU//jvOzz4JnIvNMRi+VNwz2Ues/fBFrH6Bn78Vw+1OQgiPuM
 mrnxzWQEezh1B/NeLLJGDcYUw==
IronPort-HdrOrdr: A9a23:EiuXFq/ZlB0CewvI0xluk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; d="scan'208";a="103703221"
Date: Thu, 30 Mar 2023 14:00:25 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
 <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Richard
 Henderson" <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
 <brchuckz@aol.com>
Subject: Re: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
Message-ID: <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-3-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=446aa7e4f=anthony.perard@citrix.com;
 helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
> This is a preparational patch for the next one to make the following
> more obvious:
> 
> First, pci_bus_irqs() is now called twice in case of Xen where the
> second call overrides the pci_set_irq_fn with the Xen variant.

pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
piix3_xen_realize() will leak `pci_bus->irq_count`. Could you look if
pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
call, or maybe some other way to avoid the leak?

> Second, pci_bus_set_route_irq_fn() is now also called in Xen mode.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Beside the leak which I think can happen only once, patch is fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

