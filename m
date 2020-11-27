Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFFE2C67CD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:25:04 +0100 (CET)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiegJ-0004jn-EX
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kiefZ-0004KN-4U
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:24:17 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:36119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kiefX-0003fa-2G
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1606487055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D5L4R48jTaqMmWokScSU3RSjvbXkKn0bwvjerOZsofs=;
 b=MpIn6mHoMt9usjEE/5CN9cOY2wg4MwdQu4UuHZiJV6DbFbk9NVoaGo0H
 lnJUgPgejRKdbeiEQ/x6E2YVr08sd5gNXzCnwUzS5dNjb5KnP0YXokAcL
 6pG5dZsCEw4QjxPVvD5bdVRgPeQVqJK1kJrzqTfxXK5lPS2xh4YSBi82p o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: W0cOlhBUV4DnLGq2gDEc1NCNhR932tcp5/Y+YsLB7PwiA8cKThwaunpOtSNhWvvlp5Wr6rLx0F
 W2A18XP4E+SFvNMbcDIqoFsA4rf8dtsH4TL9yXaFrrFH1MY6T9k+w5DO6EuuuB1iXU8eslcR2N
 m6wk86nEHJPn2dYAz4ylRzw9v5yDJMwX4oH24xGdKijsByCPUrzurAL43d/D35A8rF4J5j6yP4
 Mybi2pSan9LhqBlpgr3JpuYkUOSf1dfwmue4oPmVjLLwGtjQzf47vwySVbSX/o3SMYpwKnpnbc
 r18=
X-SBRS: None
X-MesageID: 32019534
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; d="scan'208";a="32019534"
Date: Fri, 27 Nov 2020 14:24:07 +0000
To: Eduardo Habkost <ehabkost@redhat.com>
CC: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Igor Mammedov
 <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Wainer
 dos Santos Moschetta" <wainersm@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Richard Henderson <rth@twiddle.net>, "Fam
 Zheng" <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS 7)
Message-ID: <20201127142407.GC2098@perard.uk.xensource.com>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
 <20201126173824.GB2098@perard.uk.xensource.com>
 <20201126174559.GP2271382@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201126174559.GP2271382@habkost.net>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Anthony PERARD <anthony.perard@citrix.com>
From: Anthony PERARD via <qemu-devel@nongnu.org>

On Thu, Nov 26, 2020 at 12:45:59PM -0500, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 05:38:24PM +0000, Anthony PERARD wrote:
> > Is `make check` going to do something useful with the Xen support? Or is
> > it going to need more work in order to test the Xen support of QEMU?
> > (Like starting an actual Xen guest.)
> 
> I don't think it will test Xen support, but we still want to at
> least check if --enable-xen doesn't break anything else.

That sound good.

> Is there any public CI system anywhere where Xen support is
> tested today?

Yes, we have osstest which regularly test Xen with QEMU from upstream.
Result are sent to xen-devel. But that might not be very useful for
qemu-devel.

We also have a GitLab CI which does some Xen tests, but I don't think
QEMU is tested there.
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=automation/gitlab-ci/test.yaml;hb=HEAD
https://gitlab.com/xen-project/xen/

Cheers,

-- 
Anthony PERARD

