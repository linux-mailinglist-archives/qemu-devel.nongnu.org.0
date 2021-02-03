Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3C30E20E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:11:13 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7McR-00079J-54
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l7LwD-0004AW-6r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:27:34 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l7Lw9-0004vO-M0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:27:33 -0500
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DW7nk0qcsz67kcp;
 Thu,  4 Feb 2021 01:23:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 3 Feb 2021 18:27:24 +0100
Received: from localhost (10.47.71.126) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 17:27:23 +0000
Date: Wed, 3 Feb 2021 17:26:37 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH 3/3] hw/cxl/cxl-device-utils: Allow incorrect read
 lengths
Message-ID: <20210203172637.00006141@Huawei.com>
In-Reply-To: <20210203161032.ifusdstess7i3ni3@mail.bwidawsk.net>
References: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
 <20210201152655.31027-4-Jonathan.Cameron@huawei.com>
 <20210203161032.ifusdstess7i3ni3@mail.bwidawsk.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.71.126]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas
 Huth <thuth@redhat.com>, linuxarm@openeuler.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 08:10:32 -0800
Ben Widawsky <ben@bwidawsk.net> wrote:

> On 21-02-01 23:26:55, Jonathan Cameron wrote:
> > This is currently needed to avoid an issue in the Linux RFC
> > in which a read is issued that is not a multiple of DW.
> > On arm64 that results in byte reads being issued and a bus
> > error returned.
> > 
> > It is not yet obvious at what level this should be fixed,
> > so paper over it to get things working.
> > 
> > Not-signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-device-utils.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > index d0d0a47122..52dd03384a 100644
> > --- a/hw/cxl/cxl-device-utils.c
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -181,11 +181,11 @@ static const MemoryRegionOps mailbox_ops = {
> >      .write = mailbox_reg_write,
> >      .endianness = DEVICE_LITTLE_ENDIAN,
> >      .valid = {
> > -        .min_access_size = 4,
> > +        .min_access_size = 1,
> >          .max_access_size = 8,
> >      },
> >      .impl = {
> > -        .min_access_size = 4,
> > +        .min_access_size = 1,
> >          .max_access_size = 8,
> >      },
> >  };  
> 
> I think this is now addressed in my v3. I'm happy to carry these patches around
> in my branch if it helps.

That would be great if you don't mind.

Thanks!

> 
> They all lgtm



