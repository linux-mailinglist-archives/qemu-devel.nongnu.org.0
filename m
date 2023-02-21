Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B43069E088
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:38:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURuJ-000859-5f; Tue, 21 Feb 2023 07:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pURuE-0007yd-R6; Tue, 21 Feb 2023 07:38:03 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pURuC-0005LZ-Cy; Tue, 21 Feb 2023 07:38:02 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PLdws01QXz67bmq;
 Tue, 21 Feb 2023 20:33:00 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 21 Feb
 2023 12:37:44 +0000
Date: Tue, 21 Feb 2023 12:37:43 +0000
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <bwidawsk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky
Message-ID: <20230221123743.000048f3@Huawei.com>
In-Reply-To: <20230220212437.1462314-1-armbru@redhat.com>
References: <20230220212437.1462314-1-armbru@redhat.com>
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

On Mon, 20 Feb 2023 22:24:37 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Ben is no longer with intel.  He told me he expected to get back to
> CXL, but it's not happening as quickly as he'd like, and that it's
> best to remove him as maintainer.  So let's do that.
> 
> Thank you for serving as maintainer, Ben!
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks for your hard work on getting the whole CXL Qemu emulation
project off the ground and best wishes for what you have moved on
to.  Hope you make it back one day!

Thanks,

Jonathan

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd54c1f140..c3e83a1a47 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2630,7 +2630,6 @@ T: git https://gitlab.com/jsnow/qemu.git jobs
>  T: git https://gitlab.com/vsementsov/qemu.git block
>  
>  Compute Express Link
> -M: Ben Widawsky <ben.widawsky@intel.com>
>  M: Jonathan Cameron <jonathan.cameron@huawei.com>
>  S: Supported
>  F: hw/cxl/


