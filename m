Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DDD6A1E3B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZj7-0000Pa-RQ; Fri, 24 Feb 2023 10:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pVZj1-0000Oc-Et
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:11:08 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pVZiw-0007yD-Mf
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:11:05 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PNYB24Wzlz67Hqp;
 Fri, 24 Feb 2023 23:06:02 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Feb
 2023 15:10:55 +0000
Date: Fri, 24 Feb 2023 15:10:55 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Gregory Price <gourry.memverge@gmail.com>, Philippe =?ISO-8859-1?Q?Mathie?=
 =?ISO-8859-1?Q?u-Daud=E9?= <philmd@linaro.org>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, Markus Armbruster <armbru@redhat.com>, "Dave
 Jiang" <dave.jiang@intel.com>, <alison.schofield@intel.com>
Subject: Re: [PATCH 1/6] hw/cxl: Move enum ret_code definition to cxl_device.h
Message-ID: <20230224151055.000071f3@Huawei.com>
In-Reply-To: <63f5742b15896_1dd2fc294da@iweiny-mobl.notmuch>
References: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
 <20230217181812.26995-2-Jonathan.Cameron@huawei.com>
 <63f5742b15896_1dd2fc294da@iweiny-mobl.notmuch>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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

On Tue, 21 Feb 2023 17:47:23 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> Jonathan Cameron wrote:
> > Needs tidy up and rename to something more generic now it is
> > in a header.  
> 
> I'm not opposed to this change and patch 2 but I don't see where
> CXLRetCode is being used outside of cxl-mailbox-utils.c in this series.
> 
> Despite that reservation I think this is a good clarification.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Ah.  This is a mess due to patch reordering as this was originally
meant as a precursor for your event injection series then I had to drag
it forwards to here to avoid introducing more use of the old naming.

Let me see if I can swap it round and just do the rename in this series
and push the move back to the start of that series - which I'll post
soon.

As it's the same code changes in a different order I'll pick up your RB.
Give me a shout if you'd rather I didn't!

Thanks,

Jonathan



> 
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-mailbox-utils.c  | 28 ----------------------------
> >  include/hw/cxl/cxl_device.h | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 28 insertions(+), 28 deletions(-)
> >   


