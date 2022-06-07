Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE054041C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:52:04 +0200 (CEST)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nycR1-0004wB-3f
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nycPn-0003vx-42
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:50:47 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nycPk-0003nE-Ic
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:50:46 -0400
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LHbpB2ZlJz67Cvm;
 Wed,  8 Jun 2022 00:45:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 18:50:37 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 7 Jun
 2022 17:50:36 +0100
Date: Tue, 7 Jun 2022 17:50:35 +0100
To: Ben Widawsky <ben@bwidawsk.net>
CC: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] MAINTAINERS: change Ben Widawsky's email address
Message-ID: <20220607175035.00006c64@Huawei.com>
In-Reply-To: <20220607162628.372400-1-ben@bwidawsk.net>
References: <20220607162628.372400-1-ben@bwidawsk.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 7 Jun 2022 09:26:28 -0700
Ben Widawsky <ben@bwidawsk.net> wrote:

> ben@widawsky@intel.com will stop working on 2022-06-20, change it to my
> personal email address.
> 
> Update .mailmap to handle previously authored commits.
> 
> Signed-off-by: Ben Widawsky <ben@bwidawsk.net>

With below question addressed,
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Probably cc Michael Tsirkin as well given he picked up the
patch that introduced this maintainers entry recently.

Thanks,

Jonathan


> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 8c326709cfab..0dec7b156999 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -54,6 +54,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
>  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
>  Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
> +Ben Widawsky <ben.widawsky@intel.com> <ben@bwidawsk.net>

Is this backwards as you will (I think) want scripts to output ben@bwidawsk.net 
as your canonical email address going forwards?

>  Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
>  Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>  Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5580a36b68e1..89da5755116b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2574,7 +2574,7 @@ F: qapi/transaction.json
>  T: git https://repo.or.cz/qemu/armbru.git block-next
>  
>  Compute Express Link
> -M: Ben Widawsky <ben.widawsky@intel.com>
> +M: Ben Widawsky <ben@bwidawsk.net>
>  M: Jonathan Cameron <jonathan.cameron@huawei.com>
>  S: Supported
>  F: hw/cxl/
> 
> base-commit: 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5


