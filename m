Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471252C44B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:13:15 +0100 (CET)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khxPu-0000np-CJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1khxOv-0000NJ-CH
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:12:13 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1khxOs-00029h-Py
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:12:12 -0500
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ch5T86jDvz67J0y;
 Thu, 26 Nov 2020 00:10:20 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 25 Nov 2020 17:12:06 +0100
Received: from localhost (10.52.126.32) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Wed, 25 Nov
 2020 16:12:04 +0000
Date: Wed, 25 Nov 2020 16:11:48 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
Message-ID: <20201125161148.00005f6e@Huawei.com>
In-Reply-To: <7c635948-b78c-c28f-f170-dc9291af4fac@redhat.com>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
 <20201124181150.0000025f@Huawei.com>
 <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
 <20201125145659.00004b3e@Huawei.com>
 <b83a1914-16ae-4f1a-318f-59920ecf17e2@redhat.com>
 <7c635948-b78c-c28f-f170-dc9291af4fac@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.126.32]
X-ClientProxiedBy: lhreml705-chm.china.huawei.com (10.201.108.54) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, linuxarm@huawei.com, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 16:54:53 +0100
David Hildenbrand <david@redhat.com> wrote:

> >>>>
> >>>> 64k guest on 4k host with 512MiB block size seems fine.
> >>>>
> >>>> If there are any places anyone thinks need particular poking I'd appreciate a hint :)    
> >>>
> >>> If things seem to work for now, that's great :) Thanks!
> >>>  
> >> Cool.  I'll run a few more comprehensive tests then send out the
> >> trivial patch to enable the kernel option + v2 of the qemu support.  
> > 
> > Perfect, thanks!  
> 
> Oh, btw, I have no idea what the state of vfio-pci + QEMU on arm64 is.
> In case it's supposed to work, you could give
> 
> https://lkml.kernel.org/r/20201119153918.120976-1-david@redhat.com
> 
> to see what we're missing.

vfio-pci works in general (and we use it a lot), so sure I'll give
this a test run.

> 
> I added a short virtio-pci guide to
> 
> https://virtio-mem.gitlab.io/user-guide/user-guide-qemu.html
> 

Thanks,

Jonathan

