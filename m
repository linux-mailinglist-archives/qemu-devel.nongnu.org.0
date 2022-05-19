Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDF52D637
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:36:32 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhGR-0004Ov-UA
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13100c9ce=anthony.perard@citrix.com>)
 id 1nrhDB-0001xL-Q9; Thu, 19 May 2022 10:33:09 -0400
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:25119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13100c9ce=anthony.perard@citrix.com>)
 id 1nrhD9-0006mx-Ux; Thu, 19 May 2022 10:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1652970787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QT0pu8MxxL6RqJbybWAqXmT9dVU0yAKlVYyXlrkqQg8=;
 b=M9YT39eHY0e7B2YvFofEInPwFiChe6s0vW+Jt3IV+A6WcOjIciZtFCNk
 RelNSiDS1mGrhAoTe60CeHmJphKoGABqCr61fEn4VG4TsgRe3lb7hOe2H
 CkiaLfUnq/OZFLuFJwHP5PT66Xsr6c8aD9nCHeJJWU9APd3jpzMz+PTOA c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72098467
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o0mbnaMWTDbw0xHvrR1Gl8FynXyQoLVcMsEvi/4bfWQNrUohhDQPm
 DNLXmHVM6mPNjbwKtB2Pong8xsOvcXWnYVlTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk298w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 fxc5d+2ERkSDKDHkfs0ckRGLQZ+MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRR66PN
 5ZHNlKDajz6Oh9xanIqJq4shf+srH3gMBFDj0ia8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTQIsPEJWo+/gsh0ecrkQKBRgLEFG/pvK6oki5Xd1ZN
 goT4CVGhaop8ku0ZsPwUx2xvDiPuRt0c8NdFvB/5AyTx6785QGfCW4ZCDlbZ7QOr887QyAnx
 3eGmtroAXpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiJg+iw+KUsxiDq+8ivXzHjf/x
 S3MqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEq4xxIpJ4j9ebea5FPS8t9hcZinaVmO6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4gjmFfKsEy/hX1
 XKnnSGEVC9yNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXTNLBgtv/Z+VuOq
 76z0vdmLD0GAIXDjtT/q9ZPfTjm01BlbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6/DP5X8CNgVQRxbAnA5pTWSdv2hEvpX8BsJudPGS0K5aMcc
 sTpjO3ZUqsQEWydo291gFuUhNUKSSlHTDmmZ0KNCAXTtbY6L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:NdLe2q+ifBk5HTPD6RFuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; d="scan'208";a="72098467"
Date: Thu, 19 May 2022 15:33:01 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>,
 John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] hw/ide/piix: Add some documentation to
 pci_piix3_xen_ide_unplug()
Message-ID: <YoZVHYJfBxiemFrr@perard.uk.xensource.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513180957.90514-3-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=13100c9ce=anthony.perard@citrix.com;
 helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Fri, May 13, 2022 at 08:09:56PM +0200, Bernhard Beschow wrote:
> The comment is based on commit message
> ae4d2eb273b167dad748ea4249720319240b1ac2 'xen-platform: add missing disk
> unplug option'. Since it seems to describe design decisions and
> limitations that still apply it seems worth having.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 2345fe9e1d..bc1b37512a 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -173,6 +173,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>      }
>  }
>  
> +/*
> + * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
> + * request unplug of 'aux' disks (which is stated to mean all IDE disks,
> + * except the primary master).
> + *
> + * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
> + *       is simultaneously requested is not clear. The implementation assumes
> + *       that an 'all' request overrides an 'aux' request.
> + *
> + * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
> + */
>  int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>  {
>      PCIIDEState *pci_ide;

That comments seems to focus on 'aux', but it also gives some pointer on
what calls the function. So it looks fine.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,


-- 
Anthony PERARD

