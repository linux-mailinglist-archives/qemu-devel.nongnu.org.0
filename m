Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953CA2A82A4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 16:51:32 +0100 (CET)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kahXv-0007Wi-JX
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 10:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kahWD-0006WN-Vl; Thu, 05 Nov 2020 10:49:46 -0500
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:14287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kahW9-0007Zj-5h; Thu, 05 Nov 2020 10:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1604591381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HSO5V/NnPVdK2gbwb/SgQFXpIENruT650/i5YptNuHI=;
 b=P8tzvPh99rVSx/kQx1ZrnDKWVLrjAW4NzucSCYKtVmGE2L0iRuDtwyny
 IhlVmuG+1BcgywbZtBDcQUP6ic2uStdJYZWYjK0qhSVF+yrsyalu5V5Tu
 Lax9xr1cc6gnDHnSMMEmiIdcOfFKAEnm8CE8LHj+YiqRzAB/MLNr1Efl7 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FRgFSROrUrMjH/hztCUYAkc/jqOVljfGZIB4e7Wk3A7tN9Z3dEjgvM1kRupO56CjASnJUoSlLQ
 OfaAhRxqTqWJE4brvquIjBvsc60gURjFQXvReuQ9J3J4MhQETglWPzZzdElp5iQowhtOvjQQ20
 wDvw1tRQzwpkxeaYgXqW6mWSZToogQlhzpyiLgAlwSDAa47Md1BXbOSks6REdSkGxQ/cMewJmM
 fx6F5oQ/GBhbMdy1pgLSFiApddEoK5m8VE0mMQbp3cdq1qbww8iOF+Erk3Ox5EOTXodiIDOZpK
 aRI=
X-SBRS: None
X-MesageID: 30795796
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,453,1596513600"; d="scan'208";a="30795796"
Date: Thu, 5 Nov 2020 15:49:10 +0000
To: Xinhao Zhang <zhangxinhao1@huawei.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <sstabellini@kernel.org>, <paul@xen.org>, <dengkai1@huawei.com>,
 <alex.chen@huawei.com>, <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] hw/xen: Don't use '#' flag of printf format
Message-ID: <20201105154910.GK2214@perard.uk.xensource.com>
References: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 10:49:36
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 04, 2020 at 09:37:09PM +0800, Xinhao Zhang wrote:
> Fix code style. Don't use '#' flag of printf format ('%#') in
> format strings, use '0x' prefix instead
> 
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

