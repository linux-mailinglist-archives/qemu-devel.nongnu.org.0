Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DCB680E93
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:12:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTxG-0007b8-Hc; Mon, 30 Jan 2023 08:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMTxE-0007az-1k
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:12:12 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMTxB-00043q-CD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:12:11 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P57pk5gz7z6880d;
 Mon, 30 Jan 2023 21:10:54 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 13:11:51 +0000
Date: Mon, 30 Jan 2023 13:11:50 +0000
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <hchkuo@avery-design.com.tw>,
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [RFC v4 2/3] tests/qtest/cxl-test: whitespace, line ending cleanup
Message-ID: <20230130131150.000023a1@huawei.com>
In-Reply-To: <20230105143807.0000315a@huawei.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-3-gregory.price@memverge.com>
 <20230105143807.0000315a@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 5 Jan 2023 14:38:07 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 28 Nov 2022 10:01:56 -0500
> Gregory Price <gourry.memverge@gmail.com> wrote:
> 
> > Defines are starting to exceed line length limits, align them for
> > cleanliness before making modifications.
> > 
> > Signed-off-by: Gregory Price <gregory.price@memverge.com>  
> 
> Hi Gregory,
> 
> I was just reordering my tree and noticed that you've only
> gone with 2 space indent.  Given 4 spaces is the convention in QEMU
> for other uses, I've switched my local copy of this over to 4 spaces.
> 
> Note there was also a single inconsistent 1 space indent - see below.
> 
> Jonathan
> 
> > 
> > ---
> >  tests/qtest/cxl-test.c | 99 +++++++++++++++++++++++-------------------
> >  1 file changed, 54 insertions(+), 45 deletions(-)
> > 
> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> > index c54f18e76b..e59ba22387 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -8,55 +8,64 @@
> >  #include "qemu/osdep.h"
> >  #include "libqtest-single.h"
> >  
> > -#define QEMU_PXB_CMD "-machine q35,cxl=on " \
> > -                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
> > -                     "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=4G "
> > -
> > -#define QEMU_2PXB_CMD "-machine q35,cxl=on "                            \
> > -                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
> > -                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> > -                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> > -
> > -#define QEMU_VIRT_2PXB_CMD "-machine virt,cxl=on "                      \
> > -                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
> > -                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "  \
> > -                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> > -
> > -#define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
> > +#define QEMU_PXB_CMD \
> > +  "-machine q35,cxl=on " \
> > +  "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
> > +  "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=4G "
> > +
> > +#define QEMU_2PXB_CMD \
> > +  "-machine q35,cxl=on " \
> > +  "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
> > +  "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> > + "- M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "  
> This one only has one space.
It also has a space after the - that I somehow missed. Fixed up in the version I'm
carrying. Will push out a new tree once I've caught up with some other pending items.

