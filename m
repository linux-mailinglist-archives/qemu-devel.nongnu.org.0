Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71764DFD3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 18:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sBt-0007AU-T8; Thu, 15 Dec 2022 12:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p5sBp-0007A6-St
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:38:37 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p5sBn-000852-88
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:38:37 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NXzvM1cZlz6897l;
 Fri, 16 Dec 2022 01:37:19 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 17:38:30 +0000
Date: Thu, 15 Dec 2022 17:38:29 +0000
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <ben.widawsky@intel.com>, <philmd@linaro.org>
Subject: Re: [PATCH 1/5] include/hw/pci: Clean up superfluous inclusion of
 pci*/*.h cxl/*.h
Message-ID: <20221215173829.000063e1@Huawei.com>
In-Reply-To: <874jtxcf4j.fsf@pond.sub.org>
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-2-armbru@redhat.com>
 <20221212104158.000072b6@Huawei.com> <874jtxcf4j.fsf@pond.sub.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 15 Dec 2022 08:14:52 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:
> 
> > On Fri,  9 Dec 2022 14:47:58 +0100
> > Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Hi Markus,
> >
> > One comment on the CXL ones.  Others CXL related changes
> > all looks fine to me.
> >
> > Thanks for cleaning these up.
> >
> > Jonathan
> >
> >  
> >> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> >> index 38e0e271d5..5129557bee 100644
> >> --- a/include/hw/cxl/cxl.h
> >> +++ b/include/hw/cxl/cxl.h
> >> @@ -13,7 +13,6 @@
> >>  
> >>  #include "qapi/qapi-types-machine.h"
> >>  #include "qapi/qapi-visit-machine.h"
> >> -#include "hw/pci/pci_bridge.h"  
> >
> > If we drop this, we probably want a forwards def of
> > struct PXBDev  
> 
> Why?  Because it's used in the header?
> 
> > I should probably be using the typedef in here as well rather
> > than struct PXBDev * in CXLFixed Window so we'd need
> > to deal with making that visible too.  
> 
> We have two typedef struct PXBDev PXBDev, one n pci_bridge.h, and one in
> pci_expander_bridge.c.  Both include cxl.h.  Move it to cxl.h?

Sure.

> 
> >>  #include "hw/pci/pci_host.h"
> >>  #include "cxl_pci.h"
> >>  #include "cxl_component.h"  
> >  
> >>  #define CXL_VENDOR_ID 0x1e98  
> 


