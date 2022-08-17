Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18014596DE1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 14:00:26 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOHii-0005nr-Ib
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 08:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOHUZ-0002V1-3y
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:45:50 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOHUW-000158-Lx
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:45:46 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M75gJ0KVDz67NZt;
 Wed, 17 Aug 2022 19:40:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 13:45:37 +0200
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 17 Aug
 2022 12:45:37 +0100
Date: Wed, 17 Aug 2022 12:45:36 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, "Shameerali Kolothum
 Thodi" <shameerali.kolothum.thodi@huawei.com>, Ben Widawsky
 <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] hw/cxl: Two CXL emulation fixes.
Message-ID: <20220817124536.000004a4@huawei.com>
In-Reply-To: <20220808122051.14822-1-Jonathan.Cameron@huawei.com>
References: <20220808122051.14822-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 8 Aug 2022 13:20:49 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> Peter Maydell reported both these issues, having looked into Coverity
> identified issues. The memory leak was straight forward, but testing the
> second patch identified a bug in the Linux kernel.
> 
> This bug has been fixed in the series
> https://lore.kernel.org/linux-cxl/165973125417.1526540.14425647258796609596.stgit@dwillia2-xfh.jf.intel.com/T/#t
> and is now available in the cxl.git pending branch.
> 
> Another clear example of why QEMU emulation is useful for kernel development.

Hi,

Any feedback on these two fixes?

Along with a two more fixes to follow in a few mins these are needed for the region code
in Linux 6.0-rc1 to work (there is a kernel fix as well that came from testing against
QEMU).

For full support we need one more feature (serial number provisioning) but without that
we get regions working as long as you create them fresh on each boot.

Thanks,

Jonathan

> 
> Jonathan Cameron (2):
>   hw/cxl: Fix memory leak in error paths
>   hw/cxl: Fix wrong query of target ports
> 
>  hw/cxl/cxl-host.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 


