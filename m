Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA3A15D3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:23:01 +0200 (CEST)
Received: from localhost ([::1]:47730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3HZz-0003gz-Oi
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <roger.pau@citrix.com>) id 1i3HYS-0002bz-Ez
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:21:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <roger.pau@citrix.com>) id 1i3HYR-0001M8-CT
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:21:24 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:58009)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <roger.pau@citrix.com>)
 id 1i3HYR-0001HX-01
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567074083;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2x0TrNo1MrClAZi9Vy9lsOF3ifDgTFCPZA+AI6zP9E8=;
 b=QndaNmU3GKuUxzwQdVeQ0gQiTppYGCu10jHk6fkQLqZwg/GR4jrHNtXi
 N3oTw5BU8D2BWDDh5xzyaLsHtSZrpz6vayo0zJP7ORPwlOwT1FsQwL8Y5
 JWIStmk48J1f2dr/gADrT5sfjUcMgNequ4HQBkQolE92Etn78rpAd3rkF 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OMlBB/0ZPBZ8es9T0O74s06LuYSCJ9wVR/XObwthcFtuz0OksDzGm9jxmMxJjlMW+oSdXcdKeL
 J+nZkMvQq9MATosF/BXcrnMNsnkVkfUheQiypk4qUnDolg2nhPTgfj3ap2hWRSEP+XkdDrCW77
 W4hbM/bn/HPIPHrpg7h/1Oq2tmOsuYk4LpEw2lJNG2X1ZnIIrOZ6TAli+bTWkModBpV7TKwRvh
 3rU7kF4TA0/u9RvxfI3PJCV2F6VmaF4HelVDLQF8hQJMewAZsvoXQMfBBDLBpPQWNqBbtkY5A8
 Ad4=
X-SBRS: 2.7
X-MesageID: 4885444
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4885444"
Date: Thu, 29 Aug 2019 12:21:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.155
Subject: Re: [Qemu-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 29, 2019 at 05:02:27PM +0800, Chao Gao wrote:
> Currently, for a HVM on Xen, no reset method is virtualized. So in a VM's
> perspective, assigned devices cannot be reset. But some devices rely on PCI
> reset to recover from hardware hangs. When being assigned to a VM, those
> devices cannot be reset and won't work any longer if a hardware hang occurs.
> We have to reboot VM to trigger PCI reset on host to recover the device.
>
> This patch exposes FLR capability to VMs if the assigned device can be reset on
> host. When VM initiates an FLR to a device, qemu cleans up the device state,
> (including disabling of intx and/or MSI and unmapping BARs from guest, deleting
> emulated registers), then initiate PCI reset through 'reset' knob under the
> device's sysfs, finally initialize the device again.

I think you likely need to deassign the device from the VM, perform
the reset, and then assign the device again, so that there's no Xen
internal state carried over prior to the reset?

Thanks, Roger.

