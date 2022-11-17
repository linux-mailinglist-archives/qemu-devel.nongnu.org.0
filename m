Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0AC62DD57
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:56:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfM3-000389-5F; Thu, 17 Nov 2022 08:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ovfLU-00036L-AL
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:54:26 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ovfLR-00046A-OM
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:54:24 -0500
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NChCf00Kyz689QS;
 Thu, 17 Nov 2022 21:51:25 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:53:52 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 17 Nov
 2022 13:53:52 +0000
Date: Thu, 17 Nov 2022 13:53:51 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Gregory Price <gourry.memverge@gmail.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <imammedo@redhat.com>, <ani@anisinha.ca>, <alison.schofield@intel.com>,
 <dave@stgolabs.net>, <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <hchkuo@avery-design.com.tw>, <cbrowy@avery-design.com>,
 <ira.weiny@intel.com>
Subject: Re: [PATCH 3/4] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20221117135351.00003609@Huawei.com>
In-Reply-To: <Y3LIq0CvRMI5i4U3@memverge.com>
References: <20221026004737.3646-1-gregory.price@memverge.com>
 <20221026004737.3646-4-gregory.price@memverge.com>
 <20221114175341.000036c4@Huawei.com>
 <Y3LIq0CvRMI5i4U3@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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

On Mon, 14 Nov 2022 18:00:59 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Mon, Nov 14, 2022 at 05:53:41PM +0000, Jonathan Cameron wrote:
> > Hi Gregory,
> > 
> > I've not been rushing on this purely because we are after the feature
> > freeze for this QEMU cycle so no great rush to line up new features
> > (and there was some fun with the pull request the previous set of QEMU
> > CXL features were in - unrelated to those patches).
> > 
> > A few comments inline.
> > 
> > Once I've chased down a segfault on power down of my qemu setup (that
> > seems to have nothing to do with the CXL support. *sigh*) I'll push out
> > an updated tree with this on it for testing purposes.
> > 
> > Thanks,
> > 
> > Jonathan
> >   
> 
> All good, I've been wrapped up in other work.  Just ping me when you are
> pushing a new branch and i'll gladly rebased and address the notes.

https://gitlab.com/jic23/qemu/-/tree/cxl-2022-11-17

Has two patches from this series on top currently.  I'll switch those out
for your next version when available.

There is a segmentation fault on powering down the qemu VMs at the moment,
but it's not connected to the cxl code, but rather just memory backends
(happens with upstream, including when cxl is turned off and the memory
backends aren't being used).

I'm not currently carrying Ira's error injection series yet but otherwise this
has pretty much everything that is in flight.

Jonathan

> 
> Regards
> Gregory


