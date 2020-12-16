Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D72DC18D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:48:59 +0100 (CET)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXAo-0005V1-Jj
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kpX5j-0000Ti-0p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:43 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kpX5e-0005GN-6C
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:42 -0500
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Cwx8W2lWcz67QjS;
 Wed, 16 Dec 2020 21:40:27 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 16 Dec 2020 14:43:19 +0100
Received: from localhost (10.47.78.133) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 16 Dec
 2020 13:43:19 +0000
Date: Wed, 16 Dec 2020 13:42:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: CXL support in QEMU
Message-ID: <20201216134251.000052d0@Huawei.com>
In-Reply-To: <07f753bd-45d8-d65d-6195-25f9dfb74795@redhat.com>
References: <CALOWxgPkoiR9jHSP-S+hYkWZb89xi8kLVY4vsHqTMzpg6Sv=jQ@mail.gmail.com>
 <07f753bd-45d8-d65d-6195-25f9dfb74795@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.78.133]
X-ClientProxiedBy: lhreml742-chm.china.huawei.com (10.201.108.192) To
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
Cc: Prashant V Agarwal <agpr123@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 10:53:34 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 16/12/2020 06.05, Prashant V Agarwal wrote:
> > Hi,
> > Is there a way to know the support plans for CXL protocol in QEMU?
> > I see that there is side branch development going on:
> > 
> > https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2
> > <https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2>
> > 
> > But when does it get merged and gets released in QEMU formally?
> > Is there a way to know a rough timeline?  
> 
> You should rather the authors of that repository whether and when they plan
> to contribute their changes to the QEMU project. It's certainly not going to
> happen automatically that these patches get merged into the main repository.
> 
>  Thomas
> 
Worth noting that they have posted an RFC, so I would suggest replying to
that thread to make sure you get all the right people.

https://lore.kernel.org/qemu-devel/20201111054724.794888-1-ben.widawsky@intel.com/#r

+CC Ben


