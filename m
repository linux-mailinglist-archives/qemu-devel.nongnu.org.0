Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB3600CC1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:44:02 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNbF-0001ku-Ql
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1okNXs-0005k6-JK
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:40:35 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1okNXp-0005mr-6d
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:40:30 -0400
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MrYMs1y9Sz67bJY;
 Mon, 17 Oct 2022 18:37:13 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Mon, 17 Oct 2022 12:40:18 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 11:40:18 +0100
Date: Mon, 17 Oct 2022 11:40:17 +0100
To: "Zhang, Chen" <chen.zhang@intel.com>
CC: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] tests/qtest/cxl-test: Remove temporary directories
 after testing
Message-ID: <20221017114017.000040d4@huawei.com>
In-Reply-To: <MWHPR11MB0031B2975B8CE5E6752904059B299@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20221012091435.893570-1-thuth@redhat.com>
 <MWHPR11MB0031B2975B8CE5E6752904059B299@MWHPR11MB0031.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 17 Oct 2022 09:28:49 +0000
"Zhang, Chen" <chen.zhang@intel.com> wrote:

> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-bounces+chen.zhang=intel.com@nongnu.org>
> > On Behalf Of Thomas Huth
> > Sent: Wednesday, October 12, 2022 5:15 PM
> > To: qemu-devel@nongnu.org; Jonathan Cameron
> > <Jonathan.Cameron@huawei.com>
> > Cc: Laurent Vivier <lvivier@redhat.com>; Michael S . Tsirkin <mst@redhat.com>
> > Subject: [PATCH] tests/qtest/cxl-test: Remove temporary directories after
> > testing
> > 
> > The cxl-test leaves some temporary directories behind. Let's clean them up
> > now!
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>  
> 
> LGTM.
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>
> 
> Thanks
> Chen

Oops.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> > ---
> >  tests/qtest/cxl-test.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c index
> > cbe0fb549b..61f25a72b6 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -101,6 +101,7 @@ static void cxl_t3d(void)
> > 
> >      qtest_start(cmdline->str);
> >      qtest_end();
> > +    rmdir(tmpfs);
> >  }
> > 
> >  static void cxl_1pxb_2rp_2t3d(void)
> > @@ -115,6 +116,7 @@ static void cxl_1pxb_2rp_2t3d(void)
> > 
> >      qtest_start(cmdline->str);
> >      qtest_end();
> > +    rmdir(tmpfs);
> >  }
> > 
> >  static void cxl_2pxb_4rp_4t3d(void)
> > @@ -130,6 +132,7 @@ static void cxl_2pxb_4rp_4t3d(void)
> > 
> >      qtest_start(cmdline->str);
> >      qtest_end();
> > +    rmdir(tmpfs);
> >  }
> >  #endif /* CONFIG_POSIX */
> > 
> > --
> > 2.31.1
> >   
> 


