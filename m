Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1030C61872A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqehk-0000s8-7f; Thu, 03 Nov 2022 14:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oqehh-0000q0-FQ
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:12:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oqehe-0001yk-5u
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:12:36 -0400
Received: from frapeml100006.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N3Bd06Z3Qz6887q;
 Fri,  4 Nov 2022 02:10:28 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 19:12:16 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 18:12:16 +0000
Date: Thu, 3 Nov 2022 18:12:15 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Gregory Price
 <gourry.memverge@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "alison.schofield@intel.com" <alison.schofield@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>, "a.manzanares@samsung.com"
 <a.manzanares@samsung.com>, "bwidawsk@kernel.org" <bwidawsk@kernel.org>
Subject: Re: [PATCH 1/2] hw/cxl: set cxl-type3 device type to
 PCI_CLASS_MEMORY_CXL
Message-ID: <20221103181215.00004d71@Huawei.com>
In-Reply-To: <Y1mhqcCirwpQU5lH@memverge.com>
References: <20221006233702.18532-1-gregory.price@memverge.com>
 <20221026160545-mutt-send-email-mst@kernel.org>
 <BN6PR17MB312197C4CA958ED267BB576683309@BN6PR17MB3121.namprd17.prod.outlook.com>
 <20221026161044-mutt-send-email-mst@kernel.org>
 <Y1mhqcCirwpQU5lH@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 17:07:53 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> On Wed, Oct 26, 2022 at 04:11:29PM -0400, Michael S. Tsirkin wrote:
> > He does but in the end he sends patches not pull requests.
> > I don't care really as long as someone will send it up.
> >   
> 
> Jonathan will submit this, it's not a critical issue so it can wait for
> the larger feature set.

Sure, I'll roll it with a few other similarly minor fixes in a few days as
a patch set.

Jonathan

