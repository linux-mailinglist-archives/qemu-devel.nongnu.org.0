Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14603669C04
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLJ5-0003KQ-AP; Fri, 13 Jan 2023 09:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pGLJ0-0003HF-3G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:45:19 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pGLIy-0001pf-DX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:45:17 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NtkjD3tYYz6J9bw;
 Fri, 13 Jan 2023 22:45:04 +0800 (CST)
Received: from localhost (10.81.201.219) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 14:45:13 +0000
Date: Fri, 13 Jan 2023 14:45:11 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/8] hw/cxl: CXL emulation cleanups and minor fixes for
 upstream
Message-ID: <20230113144511.00001207@Huawei.com>
In-Reply-To: <20230113144026.000001fb@Huawei.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <Y8AppXP+eP9cEz+i@memverge.com>
 <20230112172130.0000391b@Huawei.com>
 <Y8CNw/fZT5fZJZcK@memverge.com>
 <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com>
 <20230113144026.000001fb@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.201.219]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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

On Fri, 13 Jan 2023 14:40:26 +0000
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 13 Jan 2023 09:19:59 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
> 
> > On Fri, Jan 13, 2023 at 09:12:13AM +0000, Jonathan Cameron wrote:  
> > > 
> > > Just to check, are these different from the on stack problem you reported
> > > previously?  Doesn't look like the fix for that has made it upstream yet.
> > > 
> > > What kernel are you running?
> > > 
> > >     
> > 
> > The prior issue I saw was related to the CXL Fixed Memory Window having
> > an e820 region registered during machine initialization.  That fix is
> > upstream.
> > 
> > On 2023-1-11 branch it is commit 2486dd045794d65598fbca9fd1224c27b9732dce
> > 
> > This one appears when registering any kind of type-3 device, during
> > boot.  
> 
> I meant this one
> 
> https://lore.kernel.org/all/20221118000524.1477383-1-ira.weiny@intel.com/
> 
> Sorry, should have dug out a link in earlier reply and save a round trip.

Ah I'd forgotten we were going round the houses somewhat on the right fix...
https://lore.kernel.org/all/20221128040338.1936529-3-ira.weiny@intel.com/
was another proposal and Lukas had yet another.
https://lore.kernel.org/all/cover.1669608950.git.lukas@wunner.de/

> 
> Jonathan


